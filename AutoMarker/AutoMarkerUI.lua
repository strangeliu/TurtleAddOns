-- 本地化支持
local L = AutoMarkerLocale or {}
local function L_Text(text)
    return L[text] or text
end

-- 全局变量
local SELECTED_PACK = nil

-- 预声明函数
AutoMarkerUI_Toggle = nil
AutoMarkerUI_Show = nil
AutoMarkerUI_Hide = nil

-- 定义全局UI切换函数
AutoMarkerUI_Toggle = function()
    if AutoMarkerUIFrame and AutoMarkerUIFrame:IsVisible() then
        AutoMarkerUI_Hide()
    else
        AutoMarkerUI_Show()
    end
end
-- 显示UI
AutoMarkerUI_Show = function()
    if AutoMarkerUIFrame then
        AutoMarkerUIFrame:Show()
        -- 更新当前Pack名称
        local packName = AutoMarker_GetCurrentPackName()
        if _G["AutoMarkerUIFramePackNameEditBox"] then
            _G["AutoMarkerUIFramePackNameEditBox"]:SetText(packName or "")
        end
        -- 更新标记不同名复选框的状态
        if _G["AutoMarkerUIFrameMarkDifferentCheckBox"] and AutoMarkerDB and AutoMarkerDB.settings then
            local checked = AutoMarkerDB.settings.markDifferentMobs
            if checked == nil then checked = true end -- 默认值
            _G["AutoMarkerUIFrameMarkDifferentCheckBox"]:SetChecked(checked)
        end
    end
end

-- 隐藏UI
AutoMarkerUI_Hide = function()
    if AutoMarkerUIFrame then
        AutoMarkerUIFrame:Hide()
    end
end

-- 创建小地图按钮（原生方法）
local function CreateMinimapButton()
    if _G.AutoMarkerMinimapButton then
        return _G.AutoMarkerMinimapButton
    end

    -- 创建按钮框架
    local button = CreateFrame("Button", "AutoMarkerMinimapButton", Minimap)
    button:SetFrameStrata("HIGH")
    button:SetFrameLevel(8)
    button:SetWidth(32)
    button:SetHeight(32)
    
    -- 设置按钮外观
    local background = button:CreateTexture(nil, "BACKGROUND")
    background:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
    background:SetWidth(20)
    background:SetHeight(20)
    background:SetPoint("TOPLEFT", button, "TOPLEFT", 7, -5)

    local icon = button:CreateTexture(nil, "ARTWORK")
    icon:SetTexture("Interface\\Icons\\Ability_Hunter_SniperShot")
    icon:SetWidth(21)
    icon:SetHeight(21)
    icon:SetPoint("TOPLEFT", button, "TOPLEFT", 5, -4)
    button.icon = icon

    local border = button:CreateTexture(nil, "OVERLAY")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetWidth(53)
    border:SetHeight(53)
    border:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
    button.border = border

    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    button:GetHighlightTexture():SetBlendMode("ADD")
    
    -- 设置初始位置
    local radius = 80
    button:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - radius, (radius - 52))
    
    -- 设置拖动功能
    button:EnableMouse(true)
    button:SetMovable(true)
    button:RegisterForDrag("LeftButton")
    local function UpdatePosition()
        local xpos, ypos = GetCursorPosition()
        local scale = Minimap:GetEffectiveScale()
        xpos = xpos / scale
        ypos = ypos / scale
        
        local cx, cy = Minimap:GetCenter()
        if not cx then return end
        
        xpos = xpos - cx
        ypos = ypos - cy
        
        local angle = math.atan2(ypos, xpos)
        local x = math.cos(angle) * radius
        local y = math.sin(angle) * radius
        button:SetPoint("CENTER", Minimap, "CENTER", x, y)
        
        -- 保存位置
        if not AutoMarkerDB then AutoMarkerDB = {} end
        AutoMarkerDB.minimapAngle = angle
    end
    
    button:SetScript("OnDragStart", function()
        this:LockHighlight()
        this:StartMoving()
        this:SetScript("OnUpdate", UpdatePosition)
    end)
    
    button:SetScript("OnDragStop", function()
        this:UnlockHighlight()
        this:StopMovingOrSizing()
        this:SetScript("OnUpdate", nil)
    end)
    
    -- 设置点击事件
    button:SetScript("OnClick", function()
        if AutoMarkerUIFrame then
            if AutoMarkerUIFrame:IsShown() then
                AutoMarkerUIFrame:Hide()
            else
                AutoMarkerUIFrame:Show()
            end
        end
    end)
    
    -- 设置提示
    button:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_LEFT")
        GameTooltip:AddLine("AutoMarker")
        GameTooltip:AddLine("左键点击: 打开/关闭界面", 1, 1, 1)
        GameTooltip:AddLine("拖动: 调整位置", 1, 1, 1)
        GameTooltip:Show()
    end)
    
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    -- 恢复保存的位置
    if AutoMarkerDB and AutoMarkerDB.minimapAngle then
        local angle = AutoMarkerDB.minimapAngle
        local x = math.cos(angle) * radius
        local y = math.sin(angle) * radius
        button:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end
    
    return button
end

-- 初始化函数
local function InitializeUI()
    -- 创建事件处理框架
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("ADDON_LOADED")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    
    frame:SetScript("OnEvent", function()
        if event == "ADDON_LOADED" and arg1 == "AutoMarker" then
            -- 确保数据库初始化
            if not AutoMarkerDB then
                AutoMarkerDB = {}
            end
            if not AutoMarkerDB.settings then
                AutoMarkerDB.settings = {}
            end
            -- 初始化 markDifferentMobs 设置（如果不存在）
            if AutoMarkerDB.settings.markDifferentMobs == nil then
                AutoMarkerDB.settings.markDifferentMobs = true -- 默认为true
            end
            -- 初始化距离设置（如果不存在）
            if AutoMarkerDB.settings.distance == nil then
                AutoMarkerDB.settings.distance = 20 -- 默认距离20码
            end
            
            -- 初始化完成后取消注册事件
            this:UnregisterEvent("ADDON_LOADED")
        elseif event == "PLAYER_ENTERING_WORLD" then
            -- 创建小地图按钮
            CreateMinimapButton()
            
            -- 只需处理一次
            this:UnregisterEvent("PLAYER_ENTERING_WORLD")
        end
    end)
end

-- 立即执行初始化
InitializeUI()
