local function SimpleWhisper_SendWhisper(msg, editBox)
    local name, message = msg:match("^(%S+)%s+(.+)$")
    if name and message then
        SendChatMessage(message, "WHISPER", nil, name)
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[密语] 已发送给 " .. name .. ":|r " .. message)
        -- 不再在这里记录消息，统一在事件处理里记录，避免重复
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000用法: /w 玩家名 内容|r")
    end
end

SLASH_SIMPLEWHISPER1 = "/w"
SLASH_SIMPLEWHISPER2 = "/whisper"
SlashCmdList["SIMPLEWHISPER"] = SimpleWhisper_SendWhisper

-- 分类存储：SimpleWhisper_Box[sender] = { {msg=..., time=...}, ... }
SimpleWhisper_Box = SimpleWhisper_Box or {}
SimpleWhisper_Unread = SimpleWhisper_Unread or {} -- 未读消息计数
local SIMPLEWHISPER_MAX_LINES = 999 -- 最大保留行数

-- 创建密语盒子按钮
local boxButton = CreateFrame("Button", "SimpleWhisperBoxButton", UIParent)
boxButton:SetWidth(32)
boxButton:SetHeight(32)
boxButton:SetText("") -- 不显示文字
boxButton:SetPoint("BOTTOMRIGHT", ChatFrame1, "TOPRIGHT", 33, 0)


-- 鼠标悬停高亮贴图
if not boxButton.highlight then
    boxButton.highlight = boxButton:CreateTexture(nil, "HIGHLIGHT")
    boxButton.highlight:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight.blp")
    boxButton.highlight:SetAllPoints(boxButton)
    boxButton.highlight:Hide()
end

boxButton:SetScript("OnEnter", function()
    if boxButton.bg then
        boxButton.bg:SetTexture(0.4, 0.25, 0.08, 1)
    end
    if boxButton.highlight then
        boxButton.highlight:Show()
    end
end)
boxButton:SetScript("OnLeave", function()
    if boxButton.bg then
        boxButton.bg:SetTexture(0.2, 0.13, 0.05, 0.85)
    end
    if boxButton.highlight then
        boxButton.highlight:Hide()
    end
end)

-- 聊天图标
if not boxButton.icon then
    boxButton.icon = boxButton:CreateTexture(nil, "OVERLAY", nil, 7)
    boxButton.icon:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Up")
    boxButton.icon:SetAllPoints(boxButton)
end

boxButton:Show()

-- 添加未读消息计数泡泡
if not boxButton.bubbleBg then
    boxButton.bubbleBg = boxButton:CreateTexture(nil, "OVERLAY")
    boxButton.bubbleBg:SetTexture("Interface\\AddOns\\SimpleWhisper\\sucai\\Aura72.tga")
    boxButton.bubbleBg:SetWidth(23)
    boxButton.bubbleBg:SetHeight(23)
    boxButton.bubbleBg:SetVertexColor(1, 0, 0, 1) -- 红色
    boxButton.bubbleBg:SetPoint("BOTTOMRIGHT", boxButton, "TOPRIGHT", 9, -10)
    boxButton.bubbleBg:Hide()
end

boxButton.bubble = boxButton:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
boxButton.bubble:SetPoint("BOTTOMRIGHT", boxButton, "TOPRIGHT", 2, -5)
boxButton.bubble:SetText("")
boxButton.bubble:Hide()

-- 更新未读消息计数显示
local function UpdateUnreadBubble()
    local totalUnread = 0
    for _, count in pairs(SimpleWhisper_Unread) do
        totalUnread = totalUnread + count
    end

    if totalUnread > 0 then
        if boxButton.bubbleBg then
            boxButton.bubbleBg:Show()
        end
        boxButton.bubble:SetText(totalUnread)
        boxButton.bubble:Show()
    else
        if boxButton.bubbleBg then
            boxButton.bubbleBg:Hide()
        end
        boxButton.bubble:Hide()
    end
end

-- 创建密语盒子窗口
local boxFrame = CreateFrame("Frame", "SimpleWhisperBoxFrame", UIParent)
boxFrame:SetBackdrop{
    bgFile = "Interface/Tooltips/UI-Tooltip-Background", -- 黑色半透明背景
    edgeFile = "Interface\\Buttons\\WHITE8x8", -- 纯白线条
    tile = false, edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 }
}
boxFrame:SetBackdropColor(0, 0, 0, 0.8) -- 黑色半透明
boxFrame:SetBackdropBorderColor(0, 0, 0, 1) -- 黑色线条
boxFrame:SetWidth(145)
boxFrame:SetHeight(280)
boxFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
boxFrame:Hide()

-- 可拖动
boxFrame:SetMovable(true)
boxFrame:EnableMouse(true)
boxFrame:RegisterForDrag("LeftButton")
boxFrame:SetScript("OnDragStart", function()
    boxFrame:StartMoving()
end)
boxFrame:SetScript("OnDragStop", function()
    boxFrame:StopMovingOrSizing()
end)

-- 关闭按钮
if not boxFrame.closeBtn then
    boxFrame.closeBtn = CreateFrame("Button", nil, boxFrame)
    boxFrame.closeBtn:SetWidth(24)
    boxFrame.closeBtn:SetHeight(24)
    boxFrame.closeBtn:SetPoint("TOPRIGHT", boxFrame, "TOPRIGHT", -4, -4)
    boxFrame.closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    boxFrame.closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    boxFrame.closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    boxFrame.closeBtn:SetScript("OnClick", function() boxFrame:Hide() end)
end

boxFrame.title = boxFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
boxFrame.title:SetPoint("TOP", 0, -10)
boxFrame.title:SetText("收到的密语")



-- 创建联系人列表框
local contactFrame = CreateFrame("Frame", "SimpleWhisperContactFrame", boxFrame)
contactFrame:SetWidth(120)
contactFrame:SetHeight(200)
--("TOPLEFT", boxFrame, "TOPLEFT", 0, -40)
contactFrame:SetBackdrop{
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
}
contactFrame:SetBackdropColor(0.1,0.1,0.1,0)
--边框透明度设置
contactFrame:SetBackdropBorderColor(0.5, 0.5, 0.5, 0)

-- 创建滚动区域
local contactScroll = CreateFrame("ScrollFrame", "SimpleWhisperContactScroll", boxFrame, "UIPanelScrollFrameTemplate")
contactScroll:SetWidth(120)
contactScroll:SetHeight(200)
contactScroll:SetPoint("TOPLEFT", boxFrame, "TOPLEFT", 0, -40)

-- 让联系人列表成为滚动区域的内容
contactFrame:SetParent(contactScroll)
contactScroll:SetScrollChild(contactFrame)
contactFrame:SetPoint("TOPLEFT", contactScroll, "TOPLEFT", 10, 0)


-- 联系人按钮池
local contactButtons = {}
local selectedSender = nil

-- 计算表长度（兼容Lua 5.0）
local function tableLength(t)
    if not t then return 0 end
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

-- 工具函数：标准化名字（去服务器名并转小写）
local function NormalizeName(name)
    if not name then return "" end
    name = string.gsub(name, "%-.*", "") -- 去掉服务器名
    return string.lower(name)
end

-- 历史记录窗口相关变量
local HISTORY_FRAME_WIDTH = 350
local HISTORY_FRAME_HEIGHT = 400
local HIDE_DELAY = 0.5
local hideTimer = 0

-- 创建历史记录窗口
local historyFrame = CreateFrame("Frame", "SimpleWhisperHistoryFrame", UIParent)
historyFrame:SetWidth(HISTORY_FRAME_WIDTH)
historyFrame:SetHeight(HISTORY_FRAME_HEIGHT)
historyFrame:SetFrameStrata("TOOLTIP")
historyFrame:SetBackdrop{
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
}
historyFrame:SetBackdropColor(0, 0, 0, 0.9)
historyFrame:Hide()

-- 历史记录内容显示框 (支持滚动)
local historyMsgFrame = CreateFrame("ScrollingMessageFrame", "SimpleWhisperHistoryMsgFrame", historyFrame)
historyMsgFrame:SetPoint("TOPLEFT", historyFrame, "TOPLEFT", 10, -10)
historyMsgFrame:SetPoint("BOTTOMRIGHT", historyFrame, "BOTTOMRIGHT", -25, 10) -- 右侧留出滚动条空间
historyMsgFrame:SetFontObject(ChatFontNormal) -- 使用聊天字体
historyMsgFrame:SetJustifyH("LEFT")
historyMsgFrame:SetFading(false)
historyMsgFrame:SetMaxLines(SIMPLEWHISPER_MAX_LINES)

-- 鼠标滚轮滚动
historyMsgFrame:EnableMouseWheel(true)
historyMsgFrame:SetScript("OnMouseWheel", function()
    if arg1 > 0 then
        if IsShiftKeyDown() then
            historyMsgFrame:ScrollToTop()
        else
            historyMsgFrame:ScrollUp()
        end
    else
        if IsShiftKeyDown() then
            historyMsgFrame:ScrollToBottom()
        else
            historyMsgFrame:ScrollDown()
        end
    end
end)

-- 简单的ScrollBar (可选，但为了更好体验建议加上，这里先只做鼠标滚轮支持，若需要条可加上)
-- 为了保持简洁，暂时只依赖滚轮，但如果不直观可以后续加

-- 黏性悬停逻辑
historyFrame:EnableMouse(true)
-- historyMsgFrame 也需要响应鼠标以保持窗口打开
-- historyMsgFrame:SetHyperlinksEnabled(true) -- 1.12 API不支持，默认应该是开启的或不需要显式开启
historyMsgFrame:SetScript("OnHyperlinkClick", function()
    ChatFrame_OnHyperlinkShow(arg1, arg2, arg3)
end)

local function CancelHideTimer()
    hideTimer = 0
end

local function StartHideTimer()
    hideTimer = HIDE_DELAY
end

-- 绑定事件
historyFrame:SetScript("OnEnter", CancelHideTimer)
historyFrame:SetScript("OnLeave", StartHideTimer)
-- 注意：ScrollingMessageFrame 的 OnEnter 可能不直接触发，因为它主要处理文字交互
-- 但我们可以在父Frame做监测。为了保险，给MsgFrame也加上
-- ScrollingMessageFrame 在 1.12 可能行为有限，我们主要依赖 historyFrame 的范围

historyFrame:SetScript("OnUpdate", function()
    if hideTimer > 0 then
        hideTimer = hideTimer - arg1
        if hideTimer <= 0 then
            historyFrame:Hide()
            hideTimer = 0
        end
    end
end)

-- 显示联系人聊天记录
local function ShowChatFor(sender, showInBox)
    if not sender then return end
    
    -- 取消隐藏计时器，保持显示
    CancelHideTimer()

    local normSender = NormalizeName(sender)
    selectedSender = normSender
    if SimpleWhisper_Unread and SimpleWhisper_Unread[normSender] then
        SimpleWhisper_Unread[normSender] = 0
        UpdateUnreadBubble()
    end

    local msgs = {}
    local box = SimpleWhisper_Box and SimpleWhisper_Box[normSender]
    if type(box) == "table" then
        for i = 1, tableLength(box) do
            local v = box[i]
            if v and v.msg and v.msg ~= "" then
                table.insert(msgs, {
                    time = v.time,
                    from = v.from,
                    msg = v.msg,
                    who = sender
                })
            end
        end
    end

    local playerName = UnitName("player")
    local normMe = NormalizeName(playerName)
    if normSender ~= normMe and SimpleWhisper_Box and SimpleWhisper_Box[normMe] then
        for i = 1, tableLength(SimpleWhisper_Box[normMe]) do
            local v = SimpleWhisper_Box[normMe][i]
            if v and v.msg and v.msg ~= "" and v.to and NormalizeName(v.to) == normSender then
                table.insert(msgs, {
                    time = v.time,
                    from = "me",
                    msg = v.msg,
                    who = "我"
                })
            end
        end
    end

    -- 按完整时间排序
    table.sort(msgs, function(a, b)
        return (a.time or "") < (b.time or "")
    end)
    
    -- 清空并填充 MsgFrame
    historyMsgFrame:Clear()
    
    local lastDate = ""
    for i = 1, tableLength(msgs) do
        local v = msgs[i]
        local dateStr, timeStr = "", ""
        if v.time then
            dateStr, timeStr = string.match(v.time, "^(%d+%-%d+%-%d+) (%d+:%d+:%d+)$")
        end
        -- 日期变更时插入分隔
        if dateStr and dateStr ~= lastDate then
            historyMsgFrame:AddMessage(string.format("|cffaaaaaa—— %s ——|r", dateStr))
            lastDate = dateStr
        end
        local who, color
        if v.from == "me" then
            who = "|cff00ccff我|r"
            color = "|cff80c0ff"
        else
            who = "|cffffcc00"..sender.."|r"
            color = "|cffffff80"
        end
        historyMsgFrame:AddMessage(string.format("[%s] %s: %s%s|r", timeStr or "", who, color, v.msg))
    end
    
    -- 滚动到底部
    historyMsgFrame:ScrollToBottom()

    -- 定位并显示 (锚定到主窗口右侧)
    historyFrame:ClearAllPoints()
    historyFrame:SetPoint("TOPLEFT", SimpleWhisperBoxFrame, "TOPRIGHT", 5, 0)
    historyFrame:Show()
end

-- 隐藏聊天提示
local function HideChatTooltip()
    -- 不再立即隐藏，而是启动计时器
    StartHideTimer()
end

-- 更新联系人列表
local function UpdateContactList()
    -- 清理旧按钮
    for _, btn in ipairs(contactButtons) do
        btn:Hide()
        -- 移除旧的个别清除按钮
        if btn.clearBtn then
            btn.clearBtn:Hide()
        end
    end

    local idx = 1
    local senders = {}

    -- 确保变量已初始化
    if SimpleWhisper_Box then
        local playerName = UnitName("player")
        local normMe = NormalizeName(playerName)
        for sender, msgs in pairs(SimpleWhisper_Box) do
            if NormalizeName(sender) ~= normMe then
                -- 只有当包含收到的消息（from="other"）时才显示，避免只发未回的人占满列表
                local hasIncoming = false
                if type(msgs) == "table" then
                     -- 简单的遍历检查
                     for i = 1, tableLength(msgs) do
                        if msgs[i] and msgs[i].from == "other" then
                            hasIncoming = true
                            break
                        end
                     end
                end
                
                if hasIncoming then
                    table.insert(senders, sender)
                end
            end
        end
        -- 按最近消息时间排序
        table.sort(senders, function(a, b)
            local function getLastTime(sender)
                local box = SimpleWhisper_Box[sender]
                if type(box) == "table" and tableLength(box) > 0 then
                    local last = box[tableLength(box)]
                    return last and last.time or ""
                end
                return ""
            end
            return getLastTime(b) < getLastTime(a)
        end)
    end
    
    for _, sender in ipairs(senders) do
        local normSender = NormalizeName(sender)
        local btn = contactButtons[idx]
        if not btn then
            btn = CreateFrame("Button", nil, contactFrame)
            btn:SetWidth(95) -- 稍微缩短，拉近X按钮距离
            btn:SetHeight(18)
            btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
            --btn往左边偏移一点我
            btn:SetPoint("LEFT", contactFrame, "LEFT", -5, 0)
            
            if not btn.text then
                btn.text = btn:CreateFontString(nil, "ARTWORK", "GameFontNormal")
                btn.text:SetPoint("LEFT", btn, "LEFT", 5, 0)
                btn.text:SetJustifyH("LEFT")
                btn.text:SetWidth(110)
            end
            
            if not btn.unread then
                btn.unread = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
                btn.unread:SetPoint("RIGHT", btn, "RIGHT", -5, 0)
                btn.unread:SetTextColor(1, 0.2, 0.2)
            end
            
            contactButtons[idx] = btn
        end
        
        btn.text:SetText(sender)
        
        -- 显示未读计数
        local unread = (SimpleWhisper_Unread and SimpleWhisper_Unread[normSender]) or 0
        if unread > 0 then
            btn.unread:SetText("("..unread..")")
            btn.unread:Show()
            btn.text:SetTextColor(1, 1, 0.5)  -- 高亮未读联系人
        else
            btn.unread:Hide()
            btn.text:SetTextColor(1, 0.82, 0)  -- 普通颜色
        end
        btn.unread:ClearAllPoints()
        btn.unread:SetPoint("LEFT", btn, "LEFT", -10, 0)
        btn:SetPoint("TOPLEFT", contactFrame, "TOPLEFT", 5, -5 - (idx-1)*20)
        btn:Show()
        btn.sender = normSender
        btn.lastClickTime = 0

        -- 添加个别清除按钮
        if not btn.clearBtn then
            btn.clearBtn = CreateFrame("Button", nil, btn, "UIPanelButtonTemplate")
            btn.clearBtn:SetWidth(16)
            btn.clearBtn:SetHeight(16)
            --设置按钮文本大小
            btn.clearBtn:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
            btn.clearBtn:SetText("X")
            btn.clearBtn:SetPoint("RIGHT", btn, "RIGHT", 0, 0) -- 紧贴按钮右边缘
            btn.clearBtn:SetScript("OnClick", function()
                -- 用按钮自己的 sender 字段，确保删除的是当前按钮对应的人
                -- arg1=text_arg1 (message), arg2=text_arg2, arg3=data
                StaticPopup_Show("SIMPLEWHISPER_CONFIRM_CLEAR", btn.sender, nil, btn.sender)
            end)
        end
        btn.clearBtn:Show()
        btn:SetScript("OnClick", function()
            local origName = btn.text and btn.text:GetText() or ""
            if arg1 and arg1 == "LeftButton" and origName ~= "" then
                if ChatFrameEditBox then
                    ChatFrameEditBox:SetText("/w " .. origName .. " ")
                    ChatFrameEditBox:Show()
                    ChatFrameEditBox:SetFocus()
                    ChatFrameEditBox:HighlightText()
                elseif DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.editBox then
                    DEFAULT_CHAT_FRAME.editBox:SetText("/w " .. origName .. " ")
                    DEFAULT_CHAT_FRAME.editBox:Show()
                    DEFAULT_CHAT_FRAME.editBox:SetFocus()
                    DEFAULT_CHAT_FRAME.editBox:HighlightText()
                end
            end
            btn.lastClickTime = GetTime()
        end)
        btn:SetScript("OnEnter", function()
            ShowChatFor(normSender, false)
        end)
        btn:SetScript("OnLeave", HideChatTooltip)

        idx = idx + 1
    end
    -- 每个按钮高度约20，最小高度200
    local totalHeight = math.max(200, (idx - 1) * 20)
    contactFrame:SetHeight(totalHeight)
end

-- 打开盒子时刷新联系人列表
boxButton:SetScript("OnClick", function()
    UpdateContactList()
    boxFrame:Show()
end)

-- 辅助函数：修剪历史记录
local function TrimHistory(box)
    if type(box) == "table" then
        -- 使用 table.getn 或 tableLength 均可，这里用 table.getn (Lua 5.0/5.1)
        while table.getn(box) > SIMPLEWHISPER_MAX_LINES do
            table.remove(box, 1)
        end
    end
end

-- 处理密语事件
local function SimpleWhisper_OnEvent()
    if event == "CHAT_MSG_WHISPER" then
        local msg = arg1
        local sender = arg2
        -- 统一标准化
        sender = NormalizeName(sender)
        -- 确保变量已初始化
        SimpleWhisper_Box = SimpleWhisper_Box or {}
        SimpleWhisper_Unread = SimpleWhisper_Unread or {}

        if not SimpleWhisper_Box[sender] then
            SimpleWhisper_Box[sender] = {}
        end
        -- 只记录了别人发给你的消息（from=other），没有记录你发给别人的（from=me）
        table.insert(SimpleWhisper_Box[sender], {
            msg = msg,
            time = date("%Y-%m-%d %H:%M:%S"), -- 年月日时分秒
            from = "other",
            to = UnitName("player")
        })
        TrimHistory(SimpleWhisper_Box[sender])

        -- 新消息播放提示音
        PlaySoundFile("Interface\\AddOns\\SimpleWhisper\\sucai\\Notify.ogg")

        -- 更新未读计数
        SimpleWhisper_Unread[sender] = (SimpleWhisper_Unread[sender] or 0) + 1
        UpdateUnreadBubble()

        if boxFrame:IsShown() then
            UpdateContactList()
        end
    elseif event == "CHAT_MSG_WHISPER_INFORM" then
        local msg = arg1
        local target = arg2
        local normTarget = NormalizeName(target)
        SimpleWhisper_Box = SimpleWhisper_Box or {}
        local playerName = UnitName("player")
        local normMe = NormalizeName(playerName)
        if normTarget ~= normMe then
            -- 改为存储到对方的Box里，这样能和收到的消息合并显示，并方便管理长度
            if not SimpleWhisper_Box[normTarget] then
                SimpleWhisper_Box[normTarget] = {}
            end
            table.insert(SimpleWhisper_Box[normTarget], {
                msg = msg,
                time = date("%Y-%m-%d %H:%M:%S"), -- 年月日时分秒
                from = "me",
                to = target
            })
            TrimHistory(SimpleWhisper_Box[normTarget])
        end
    elseif event == "ADDON_LOADED" and arg1 == "SimpleWhisper" then
        -- 确保变量在加载时初始化
        SimpleWhisper_Box = SimpleWhisper_Box or {}
        SimpleWhisper_Unread = SimpleWhisper_Unread or {}
        UpdateUnreadBubble()
    end
end

-- 注册事件
local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_WHISPER")
f:RegisterEvent("CHAT_MSG_WHISPER_INFORM") -- 新增：注册自己发出的密语事件
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", SimpleWhisper_OnEvent)

-- 创建清除确认对话框
StaticPopupDialogs["SIMPLEWHISPER_CONFIRM_CLEAR"] = {
    text = "确定要清除与 %s 的聊天记录吗？",
    button1 = "确定",
    button2 = "取消",
    OnAccept = function(self, data)
        if not data or data == "" then
            data = selectedSender
        end
        local found = false
        for k in pairs(SimpleWhisper_Box) do
            if NormalizeName(k) == NormalizeName(data or "") then
                SimpleWhisper_Box[k] = nil
                found = true
            end
        end
        for k in pairs(SimpleWhisper_Unread) do
            if NormalizeName(k) == NormalizeName(data or "") then
                SimpleWhisper_Unread[k] = nil
                found = true
            end
        end
        _G["SimpleWhisper_Box"] = SimpleWhisper_Box
        _G["SimpleWhisper_Unread"] = SimpleWhisper_Unread
        UpdateContactList()
        HideChatTooltip()
        if found then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[SimpleWhisper] 已清除与该联系人的聊天记录。|r")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[SimpleWhisper] 未找到该联系人的聊天记录，请确认名字拼写。|r")
        end
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true
}

-- 创建清除全部内容的弹窗
StaticPopupDialogs["SIMPLEWHISPER_CONFIRM_CLEAR_ALL"] = {
    text = "确定要清除所有聊天记录吗？",
    button1 = "确定",
    button2 = "取消",
    OnAccept = function()
        SimpleWhisper_Box = {}
        SimpleWhisper_Unread = {}
        UpdateContactList()
        HideChatTooltip()
        UpdateUnreadBubble()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true
}

-- 在盒子窗口添加“清除所有”按钮
if not boxFrame.clearAllBtn then
    boxFrame.clearAllBtn = CreateFrame("Button", nil, boxFrame, "UIPanelButtonTemplate")
    boxFrame.clearAllBtn:SetWidth(80)
    boxFrame.clearAllBtn:SetHeight(22)
    boxFrame.clearAllBtn:SetText("清除所有")
    boxFrame.clearAllBtn:SetPoint("BOTTOM", boxFrame, "BOTTOM", 0, 10)
    boxFrame.clearAllBtn:SetScript("OnClick", function()
        StaticPopup_Show("SIMPLEWHISPER_CONFIRM_CLEAR_ALL")
    end)
end

-- “全部已读”按钮
if not boxFrame.markReadBtn then
    boxFrame.markReadBtn = CreateFrame("Button", nil, boxFrame)
    boxFrame.markReadBtn:SetWidth(20)
    boxFrame.markReadBtn:SetHeight(20)
    boxFrame.markReadBtn:SetPoint("TOPLEFT", boxFrame, "TOPLEFT", 8, -8)
    
    local tex = boxFrame.markReadBtn:CreateTexture(nil, "ARTWORK")
    tex:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
    tex:SetAllPoints()
    boxFrame.markReadBtn:SetNormalTexture(tex)
    
    boxFrame.markReadBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    
    boxFrame.markReadBtn:SetScript("OnEnter", function() 
        GameTooltip:SetOwner(boxFrame.markReadBtn, "ANCHOR_RIGHT")
        GameTooltip:SetText("全部已读")
        GameTooltip:Show()
    end)
    boxFrame.markReadBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
    
    boxFrame.markReadBtn:SetScript("OnClick", function()
        SimpleWhisper_Unread = {}
        _G["SimpleWhisper_Unread"] = SimpleWhisper_Unread
        UpdateUnreadBubble()
        UpdateContactList()
    end)
end

-- 初始化未读气泡
UpdateUnreadBubble()

-- 你可以用如下常见的按钮模板（第三个参数）：
-- "UIPanelButtonTemplate"         -- 普通面板按钮（当前用的）
-- "GameMenuButtonTemplate"        -- 游戏菜单风格按钮
-- "OptionsButtonTemplate"         -- 选项面板按钮
-- "ChatFrameButtonTemplate"       -- 聊天框按钮
-- "UIPanelCloseButton"            -- 关闭按钮（带X）
-- "UIMenuButtonStretchTemplate"   -- 菜单按钮（拉伸）
-- "UIPanelScrollUpButtonTemplate" -- 向上滚动按钮
-- "UIPanelScrollDownButtonTemplate" -- 向下滚动按钮

-- 例如：
-- local boxButton = CreateFrame("Button", "SimpleWhisperBoxButton", UIParent, "GameMenuButtonTemplate")

-- 恭喜，问题已解决，无需进一步修改！