
BrainwasherPro = {}

local L = {
    ["TITLE"] = "地精洗脑装置",
    ["AVAILABLE_SLOT"] = "可用天赋位",
    ["EDIT"] = "编辑",
    ["SAVE"] = "保存",
    ["RESET_TALENTS"] = "重置天赋",
    ["EDIT_SPEC"] = "编辑天赋配置",
    ["SPEC_NAME"] = "配置名称:",
    ["SPEC_ICON"] = "配置图标:",
    ["CANCEL"] = "取消",
    ["CONFIRM"] = "确认",
    ["SAVE_SPEC_CONFIRM"] = "将当前天赋保存到此位置?",
    ["LOAD_SPEC_CONFIRM"] = "是否更换此天赋? ",
    ["RESET_TALENTS_CONFIRM"] = "是否重置天赋? 这将花费5金。", 
    ["YES"] = "是",
    ["NO"] = "否",
    ["SHOW_ORIGINAL"] = "显示原版界面",
    ["SHOW_TALENT_POINTS"] = "显示天赋点",  
    ["HIDE_TALENT_POINTS"] = "隐藏天赋点",
    ["BUY_SLOT_CONFIRM"] = "是否购买第%d个天赋槽位? 这将花费%d金。",
    ["SWITCH_STYLE"] = "切换风格",
    ["SWITCH_STYLE_CONFIRM"] = "是否确认切换界面风格? 这将重新加载界面。",
    ["STYLE_CLASSIC"] = "经典风格",
    ["STYLE_DARK"] = "暗黑风格"
}

local mainFrame, editFrame, iconFrame
local specButtons, gossipSlots, iconButtons, macroIcons = {}, {}, {}, {}
local currentEditSlot = 1
BrainwasherPro.currentSlotAction, BrainwasherPro.showTalentPoints, BrainwasherPro.currentStyle = nil, true, "dark"

-- 新增：动作条切换相关变量
local ABP_ACTIONBAR_CHECK_INTERVAL = 0.5 -- 检查间隔（秒）
local lastActionBarCheckTime = 0
local lastLoadedSpecName = nil
local lastLoadedItemSetName = nil -- 新增：记录上次加载的套装名称

-- 新增：获取Outfitter套装列表
local function GetOutfitterSetNames()
    local setNames = {}
    if gOutfitter_Settings and gOutfitter_Settings.Outfits then
        for category, outfits in pairs(gOutfitter_Settings.Outfits) do
            if type(outfits) == "table" then
                for _, outfit in ipairs(outfits) do
                    if outfit.Name then
                        table.insert(setNames, outfit.Name)
                    end
                end
            end
        end
    end
    return setNames
end

-- 新增：切换Outfitter套装
local function SwitchOutfitterSet(setName)
    if not gOutfitter_Settings or not gOutfitter_Settings.Outfits then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Outfitter插件未加载或未找到套装数据|r")
        return false
    end
    
    -- 在所有分类中查找匹配的套装
    local targetOutfit = nil
    for category, outfits in pairs(gOutfitter_Settings.Outfits) do
        if type(outfits) == "table" then
            for _, outfit in ipairs(outfits) do
                if outfit.Name == setName then
                    targetOutfit = outfit
                    break
                end
            end
        end
        if targetOutfit then break end
    end
    
    if not targetOutfit then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000未找到Outfitter套装: " .. (setName or "nil") .. "|r")
        return false
    end
    
    -- 穿戴套装
    Outfitter_WearOutfit(targetOutfit)
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00已切换Outfitter套装: " .. setName .. "|r")
    return true
end



local function ColorTalentSummary(t1, t2, t3)
    local largest, smallest = math.max(t1, t2, t3), math.min(t1, t2, t3)
    local function getColor(value)
        if value == largest then return "|cff00ff00"
        elseif value == smallest then return "|cff0077ff"
        else return "|cffffff00" end
    end
    return getColor(t1)..t1.."|r/"..getColor(t2)..t2.."|r/"..getColor(t3)..t3.."|r"
end

local function GetTalentCounts()
    local _, _, t1 = GetTalentTabInfo(1)
    local _, _, t2 = GetTalentTabInfo(2)
    local _, _, t3 = GetTalentTabInfo(3)
    return t1 or 0, t2 or 0, t3 or 0
end

local function FetchCurrentTalents()
    local talents = {}
    for tab = 1, 3 do
        local _, _, tcount = GetTalentTabInfo(tab)  
        talents[tab] = {}
        for talent = 1, 100 do
            local name, icon, row, col, count, max = GetTalentInfo(tab, talent)
            if not name then break end
            talents[tab][talent] = {name = name, icon = icon, row = row, col = col, count = count, max = max}
        end
    end
    return talents
end

-- 修改后的检查并切换动作条配置函数
local loadAttempts = 0
local maxAttempts = 3
local currentLoadingSpec = nil
local loadCheckTime = 0

local function CheckAndSwitchActionBar()

    if not ABP_Layout or not BrainwasherProDB then
        return
    end
    
    local currentTime = GetTime()
    

    if currentLoadingSpec then
        if currentTime - loadCheckTime >= 0.2 then -- 0.2秒间隔
            loadAttempts = loadAttempts + 1
            ABP_LoadProfile(currentLoadingSpec)
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00已自动切换动作条配置: " .. currentLoadingSpec .. " (" .. loadAttempts .. "/" .. maxAttempts .. ")|r")
            loadCheckTime = currentTime
            
            if loadAttempts >= maxAttempts then

                lastLoadedSpecName = currentLoadingSpec
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00动作条配置 '" .. currentLoadingSpec .. "' 已完全加载成功|r")
                currentLoadingSpec = nil
                loadAttempts = 0
            end
        end
        return
    end
    

    if currentTime - lastActionBarCheckTime < ABP_ACTIONBAR_CHECK_INTERVAL then
        return
    end
    lastActionBarCheckTime = currentTime
    

    local currentSpecName = nil
    for slotIndex, spec in pairs(BrainwasherProDB.specs) do
        if spec and spec.name and gossipSlots.load and gossipSlots.load[slotIndex] then

            local t1, t2, t3 = GetTalentCounts()
            if spec.t1 == t1 and spec.t2 == t2 and spec.t3 == t3 then
                currentSpecName = spec.name
                break
            end
        end
    end
    
   
    if currentSpecName and currentSpecName ~= lastLoadedSpecName then

        local ABP_PlayerName = UnitName("player") .. " of " .. GetCVar("realmName")
        if ABP_Layout[ABP_PlayerName] and ABP_Layout[ABP_PlayerName][currentSpecName] then

            currentLoadingSpec = currentSpecName
            loadAttempts = 0
            loadCheckTime = currentTime
            

            loadAttempts = 1
             ABP_LoadProfile(currentLoadingSpec)
-- ==== ABP 完成后，立即清理 Flyout 图标缓存 ====
	        if Flyout_UpdateBars and Flyout_GetActionButton then
			for i = 1, 120 do
				local b = Flyout_GetActionButton(i)
				if b then
                			b.flyoutActions = nil
                			b.flyoutAction = nil
                			b.flyoutActionType = nil
            			end
        		end
        		Flyout_UpdateBars()
    		end
-- ==== 结束 ====
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00已自动切换动作条配置: " .. currentLoadingSpec .. " (" .. loadAttempts .. "/" .. maxAttempts .. ")|r")
        else
            lastLoadedSpecName = currentSpecName
        end
    end
end


-- 新增：检查并切换Outfitter套装
local function CheckAndSwitchItemSet()
    if not gOutfitter_Settings then
        return
    end
    
    -- 查找当前天赋对应的配置名称
    local currentSpecName = nil
    for slotIndex, spec in pairs(BrainwasherProDB.specs) do
        if spec and spec.name and gossipSlots.load and gossipSlots.load[slotIndex] then
            local t1, t2, t3 = GetTalentCounts()
            if spec.t1 == t1 and spec.t2 == t2 and spec.t3 == t3 then
                currentSpecName = spec.name
                break
            end
        end
    end
    
    -- 如果找到配置名称且与上次不同，则切换套装
    if currentSpecName and currentSpecName ~= lastLoadedItemSetName then
        if SwitchOutfitterSet(currentSpecName) then
            lastLoadedItemSetName = currentSpecName
        else
            -- 如果切换失败，也记录当前套装名称，避免重复尝试
            lastLoadedItemSetName = currentSpecName
        end
    end
end

local function OnTalentLoadComplete()
    lastActionBarCheckTime = GetTime() - ABP_ACTIONBAR_CHECK_INTERVAL + 0.1 
    lastLoadedSpecName = nil 
    lastLoadedItemSetName = nil -- 重置套装记录，允许重新检测
end


function BrainwasherPro:PopulateMacroIcons()
    local numIcons = GetNumMacroIcons()
    for i = 1, numIcons do table.insert(macroIcons, GetMacroIconInfo(i)) end
end

function BrainwasherPro:CreateMainFrame()
    if mainFrame then return end
    
    mainFrame = CreateFrame("Frame", "BrainwasherProFrame", UIParent)
    mainFrame:SetWidth(384)
    mainFrame:SetHeight(512)
    mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    
    local bgTexture = mainFrame:CreateTexture(nil, "BACKGROUND")
    if BrainwasherPro.currentStyle == "classic" then
        bgTexture:SetTexture("Interface\\Stationery\\StationeryTest1")
    else
        bgTexture:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
        bgTexture:SetVertexColor(0.1, 0.1, 0.1, 0.9)
    end
    
    bgTexture:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 12, -12)
    bgTexture:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -12, 12)
    
    mainFrame:SetBackdrop({
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    mainFrame:SetBackdropBorderColor(0.8, 0.8, 0.8, 1)
    mainFrame:SetMovable(true)
    mainFrame:EnableMouse(true)
    mainFrame:RegisterForDrag("LeftButton")
    mainFrame:SetScript("OnDragStart", function() this:StartMoving() end)
    mainFrame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
    mainFrame:Hide()
    table.insert(UISpecialFrames, "BrainwasherProFrame")
    
    local topLeft = mainFrame:CreateTexture(nil, "ARTWORK")
    topLeft:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    topLeft:SetPoint("TOP", mainFrame, "TOP", 0, 12)
    topLeft:SetWidth(256)
    topLeft:SetHeight(64)
    
    local title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", mainFrame, "TOP", 0, -5)
    title:SetText(L["TITLE"])
    title:SetTextColor(1, 0.82, 0)
    
    local styleButton = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
    styleButton:SetWidth(100)
    styleButton:SetHeight(22)
    styleButton:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, -10)
    styleButton:SetText(BrainwasherPro.currentStyle == "classic" and L["STYLE_DARK"] or L["STYLE_CLASSIC"])
    styleButton:SetScript("OnClick", function() StaticPopup_Show("BRAINWASHERPRO_SWITCH_STYLE") end)
    
    local closeButton = CreateFrame("Button", nil, mainFrame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", mainFrame, "TOPRIGHT", -5, -5)
    closeButton:SetScript("OnClick", function() 
        mainFrame:Hide()
        if editFrame and editFrame:IsVisible() then editFrame:Hide() end
        CloseGossip()
    end)
    
    for i = 1, 4 do self:CreateSpecSlot(i) end
    
    local bottomPanel = CreateFrame("Frame", nil, mainFrame)
    if BrainwasherPro.currentStyle == "classic" then
        bottomPanel:SetWidth(320)
        bottomPanel:SetHeight(40)
        bottomPanel:SetPoint("BOTTOM", mainFrame, "BOTTOM", 0, 15)
        bottomPanel:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 16,
            insets = {left = 4, right = 4, top = 4, bottom = 4}
        })
        bottomPanel:SetBackdropColor(0.1, 0.1, 0.1, 0.7)
        bottomPanel:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)

        local resetButton = CreateFrame("Button", nil, bottomPanel, "UIPanelButtonTemplate")
        resetButton:SetWidth(100)
        resetButton:SetHeight(22)
        resetButton:SetPoint("LEFT", bottomPanel, "LEFT", 10, 0)
        resetButton:SetText(L["RESET_TALENTS"])
        self.mainResetButton = resetButton
        resetButton:SetScript("OnClick", function()
            local price = gossipSlots.resetPrice or 0
            StaticPopupDialogs["BRAINWASHERPRO_RESET_TALENTS"].text = price > 0 and "重置所有天赋? 这将花费 " .. price .. " 金并导致一个debuff。" or L["RESET_TALENTS_CONFIRM"]
            StaticPopup_Show("BRAINWASHERPRO_RESET_TALENTS")
        end)

        local toggleTalentPointsButton = CreateFrame("Button", nil, bottomPanel, "UIPanelButtonTemplate")
        toggleTalentPointsButton:SetWidth(100)
        toggleTalentPointsButton:SetHeight(22)
        toggleTalentPointsButton:SetPoint("CENTER", bottomPanel, "CENTER", 0, 0)
        toggleTalentPointsButton:SetText(L["HIDE_TALENT_POINTS"])
        self.toggleTalentPointsButton = toggleTalentPointsButton
        toggleTalentPointsButton:SetScript("OnClick", function()
            BrainwasherPro.showTalentPoints = not BrainwasherPro.showTalentPoints
            toggleTalentPointsButton:SetText(BrainwasherPro.showTalentPoints and L["HIDE_TALENT_POINTS"] or L["SHOW_TALENT_POINTS"])
            BrainwasherPro:UpdateAllDisplays()
        end)

        local showOriginalButton = CreateFrame("Button", nil, bottomPanel, "UIPanelButtonTemplate")
        showOriginalButton:SetWidth(100)
        showOriginalButton:SetHeight(22)
        showOriginalButton:SetPoint("RIGHT", bottomPanel, "RIGHT", -10, 0)
        showOriginalButton:SetText(L["SHOW_ORIGINAL"])
        showOriginalButton:SetScript("OnClick", function() 
            mainFrame:Hide()
            GossipFrame:SetAlpha(1)
        end)
    else
        bottomPanel:SetWidth(270) 
        bottomPanel:SetHeight(30) 
        bottomPanel:SetPoint("BOTTOM", mainFrame, "BOTTOM", 0, 12)

        local resetButton = CreateFrame("Button", nil, bottomPanel)
        resetButton:SetWidth(90)  
        resetButton:SetHeight(27) 
        resetButton:SetPoint("LEFT", bottomPanel, "LEFT", 0, 0)
        resetButton:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 12, edgeSize = 6, 
            insets = {left = 1.5, right = 1.5, top = 1.5, bottom = 1.5} 
        })
        resetButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8)
        resetButton:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        local resetText = resetButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        resetText:SetPoint("CENTER", resetButton, "CENTER", 0, 0)
        resetText:SetText(L["RESET_TALENTS"])
        resetText:SetTextColor(1, 1, 1, 1)
        self.mainResetButton, self.mainResetText = resetButton, resetText
        resetButton:SetScript("OnEnter", function() resetButton:SetBackdropColor(0.8, 0.3, 0.3, 1) end)
        resetButton:SetScript("OnLeave", function() resetButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8) end)
        resetButton:SetScript("OnClick", function()
            local price = gossipSlots.resetPrice or 0
            StaticPopupDialogs["BRAINWASHERPRO_RESET_TALENTS"].text = price > 0 and "重置所有天赋? 这将花费 " .. price .. " 金并导致一个debuff。" or L["RESET_TALENTS_CONFIRM"]
            StaticPopup_Show("BRAINWASHERPRO_RESET_TALENTS")
        end)

        local toggleTalentPointsButton = CreateFrame("Button", nil, bottomPanel)
        toggleTalentPointsButton:SetWidth(90) 
        toggleTalentPointsButton:SetHeight(27) 
        toggleTalentPointsButton:SetPoint("CENTER", bottomPanel, "CENTER", 0, 0)
        toggleTalentPointsButton:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 12, edgeSize = 6, 
            insets = {left = 1.5, right = 1.5, top = 1.5, bottom = 1.5} 
        })
        toggleTalentPointsButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8)
        toggleTalentPointsButton:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        local toggleText = toggleTalentPointsButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        toggleText:SetPoint("CENTER", toggleTalentPointsButton, "CENTER", 0, 0)
        toggleText:SetText(L["HIDE_TALENT_POINTS"])
        toggleText:SetTextColor(1, 1, 1, 1)
        toggleTalentPointsButton.toggleText = toggleText
        self.toggleTalentPointsButton = toggleTalentPointsButton
        toggleTalentPointsButton:SetScript("OnEnter", function() toggleTalentPointsButton:SetBackdropColor(0.8, 0.3, 0.3, 1) end)
        toggleTalentPointsButton:SetScript("OnLeave", function() toggleTalentPointsButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8) end)
        toggleTalentPointsButton:SetScript("OnClick", function()
            BrainwasherPro.showTalentPoints = not BrainwasherPro.showTalentPoints
            toggleText:SetText(BrainwasherPro.showTalentPoints and L["HIDE_TALENT_POINTS"] or L["SHOW_TALENT_POINTS"])
            BrainwasherPro:UpdateAllDisplays()
        end)

        local showOriginalButton = CreateFrame("Button", nil, bottomPanel)
        showOriginalButton:SetWidth(90)  
        showOriginalButton:SetHeight(27) 
        showOriginalButton:SetPoint("RIGHT", bottomPanel, "RIGHT", 0, 0)
        showOriginalButton:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 12, edgeSize = 6, 
            insets = {left = 1.5, right = 1.5, top = 1.5, bottom = 1.5} 
        })
        showOriginalButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8)
        showOriginalButton:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        local originalText = showOriginalButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        originalText:SetPoint("CENTER", showOriginalButton, "CENTER", 0, 0)
        originalText:SetText(L["SHOW_ORIGINAL"])
        originalText:SetTextColor(1, 1, 1, 1)
        showOriginalButton:SetScript("OnEnter", function() showOriginalButton:SetBackdropColor(0.8, 0.3, 0.3, 1) end)
        showOriginalButton:SetScript("OnLeave", function() showOriginalButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8) end)
        showOriginalButton:SetScript("OnClick", function() 
            mainFrame:Hide()
            GossipFrame:SetAlpha(1)
        end)
    end
end

function BrainwasherPro:CreateSpecSlot(slotIndex)
    local yOffset = -60 - ((slotIndex - 1) * 90)
    local slotFrame = CreateFrame("Frame", "BrainwasherProSlot"..slotIndex, mainFrame)
    slotFrame:SetWidth(340)
    slotFrame:SetHeight(80)
    slotFrame:SetPoint("TOP", mainFrame, "TOP", 0, yOffset)
    slotFrame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = {left = 4, right = 4, top = 4, bottom = 4}
    })
    slotFrame:SetBackdropColor(0.2, 0.2, 0.2, 0.8)
    slotFrame:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
    slotFrame:EnableMouse(true)
    slotFrame:SetScript("OnEnter", function() slotFrame:SetBackdropBorderColor(1, 1, 0.5, 1) end)
    slotFrame:SetScript("OnLeave", function() slotFrame:SetBackdropBorderColor(0.6, 0.6, 0.6, 1) end)
    
    local iconButton = CreateFrame("Button", "BrainwasherProIcon"..slotIndex, slotFrame)
    iconButton:SetWidth(40)
    iconButton:SetHeight(40)
    iconButton:SetPoint("LEFT", slotFrame, "LEFT", 10, 0)
    iconButton:SetNormalTexture("Interface\\Buttons\\UI-EmptySlot")
    iconButton:SetPushedTexture("Interface\\Buttons\\UI-EmptySlot")
    iconButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    iconButton:RegisterForClicks("LeftButtonUp")
    local iconTexture = iconButton:CreateTexture(nil, "OVERLAY")  
    iconTexture:SetWidth(36)
    iconTexture:SetHeight(36)
    iconTexture:SetPoint("CENTER", iconButton, "CENTER", 0, 0)
    iconTexture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    iconButton.iconTexture = iconTexture

    local nameText = slotFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("LEFT", iconButton, "RIGHT", 10, 10)
    nameText:SetWidth(180)
    nameText:SetJustifyH("LEFT")
    nameText:SetText(L["AVAILABLE_SLOT"])
    nameText:SetTextColor(0.9, 0.9, 0.9, 1)
    
    local summaryText = slotFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    summaryText:SetPoint("LEFT", iconButton, "RIGHT", 10, -10)
    summaryText:SetWidth(180)
    summaryText:SetJustifyH("LEFT")
    summaryText:SetText("")
    
    local buttonPanel = CreateFrame("Frame", nil, slotFrame)
    buttonPanel:SetWidth(80)
    buttonPanel:SetHeight(60)  
    buttonPanel:SetPoint("RIGHT", slotFrame, "RIGHT", -10, 0)
    
    local editButton, saveButton
    if BrainwasherPro.currentStyle == "classic" then
        editButton = CreateFrame("Button", nil, buttonPanel, "UIPanelButtonTemplate")
        editButton:SetWidth(70)
        editButton:SetHeight(22)
        editButton:SetPoint("TOP", buttonPanel, "TOP", 0, 5)
        editButton:SetText(L["EDIT"])
        saveButton = CreateFrame("Button", nil, buttonPanel, "UIPanelButtonTemplate")
        saveButton:SetWidth(70)
        saveButton:SetHeight(22)
        saveButton:SetPoint("BOTTOM", buttonPanel, "BOTTOM", 0, -5)
        saveButton:SetText(L["SAVE"])
    else
        editButton = CreateFrame("Button", nil, buttonPanel)
        editButton:SetWidth(70)
        editButton:SetHeight(22)
        editButton:SetPoint("TOP", buttonPanel, "TOP", 0, 5)
        editButton:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 12, edgeSize = 6, 
            insets = {left = 1.5, right = 1.5, top = 1.5, bottom = 1.5} 
        })
        editButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8)
        editButton:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        local editText = editButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        editText:SetPoint("CENTER", editButton, "CENTER", 0, 0)
        editText:SetText(L["EDIT"])
        editText:SetTextColor(1, 1, 1, 1)
        saveButton = CreateFrame("Button", nil, buttonPanel)
        saveButton:SetWidth(70)
        saveButton:SetHeight(22)
        saveButton:SetPoint("BOTTOM", buttonPanel, "BOTTOM", 0, -5)
        saveButton:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 12, edgeSize = 6, 
            insets = {left = 1.5, right = 1.5, top = 1.5, bottom = 1.5} 
        })
        saveButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8)
        saveButton:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        local saveText = saveButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        saveText:SetPoint("CENTER", saveButton, "CENTER", 0, 0)
        saveText:SetText(L["SAVE"])
        saveText:SetTextColor(1, 1, 1, 1)
        editButton:SetScript("OnEnter", function() editButton:SetBackdropColor(0.8, 0.3, 0.3, 1) end)
        editButton:SetScript("OnLeave", function() editButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8) end)
        saveButton:SetScript("OnEnter", function() saveButton:SetBackdropColor(0.8, 0.3, 0.3, 1) end)
        saveButton:SetScript("OnLeave", function() saveButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8) end)
    end
    
    specButtons[slotIndex] = {
        frame = slotFrame,
        icon = iconButton,
        name = nameText,
        summary = summaryText,
        edit = editButton,
        save = saveButton,
        slotIndex = slotIndex
    }
    
    iconButton:SetScript("OnClick", function(self, button) BrainwasherPro:OnSpecClicked(slotIndex) end)
    editButton:SetScript("OnClick", function() BrainwasherPro:OnEditClicked(slotIndex) end)
    saveButton:SetScript("OnClick", function() BrainwasherPro:OnSaveClicked(slotIndex) end)
end

function BrainwasherPro:CreateEditFrame()
    if editFrame then return end
    
    editFrame = CreateFrame("Frame", "BrainwasherProEditFrame", UIParent)
    editFrame:SetWidth(350)
    editFrame:SetHeight(450)
    editFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    
    local bgTexture = editFrame:CreateTexture(nil, "BACKGROUND")
    if BrainwasherPro.currentStyle == "classic" then
        bgTexture:SetTexture("Interface\\Stationery\\StationeryTest1")
    else
        bgTexture:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
        bgTexture:SetVertexColor(0.1, 0.1, 0.1, 0.9)
    end
    
    bgTexture:SetPoint("TOPLEFT", editFrame, "TOPLEFT", 12, -12)
    bgTexture:SetPoint("BOTTOMRIGHT", editFrame, "BOTTOMRIGHT", -12, 12)
    
    if BrainwasherPro.currentStyle == "classic" then
        editFrame:SetBackdrop({
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 }
        })
        editFrame:SetBackdropBorderColor(0.8, 0.8, 0.8, 1)
    else
        editFrame:SetBackdrop({
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        editFrame:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
        editFrame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    end
    
    editFrame:SetFrameStrata("DIALOG")
    editFrame:SetMovable(true)
    editFrame:EnableMouse(true)
    editFrame:RegisterForDrag("LeftButton")
    editFrame:SetScript("OnDragStart", function() this:StartMoving() end)
    editFrame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
    editFrame:Hide()
    
    local topLeft = editFrame:CreateTexture(nil, "ARTWORK")
    topLeft:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    topLeft:SetPoint("TOP", editFrame, "TOP", 0, 12)
    topLeft:SetWidth(256)
    topLeft:SetHeight(64)
    
    local title = editFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", editFrame, "TOP", 0, -5)
    title:SetText(L["EDIT_SPEC"])
    title:SetTextColor(1, 0.82, 0)
    
    local closeButton = CreateFrame("Button", nil, editFrame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", editFrame, "TOPRIGHT", -5, -5)
    closeButton:SetScript("OnClick", function() editFrame:Hide() end)
    
    local iconLabel = editFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    iconLabel:SetPoint("TOPLEFT", editFrame, "TOPLEFT", 30, -60)
    iconLabel:SetText(L["SPEC_ICON"])
    iconLabel:SetTextColor(1, 1, 1, 1)
    
    local iconButton = CreateFrame("Button", nil, editFrame)
    iconButton:SetWidth(50)
    iconButton:SetHeight(50)
    iconButton:SetPoint("TOPLEFT", iconLabel, "BOTTOMLEFT", 0, -10)
    iconButton:SetNormalTexture("Interface\\Buttons\\UI-EmptySlot")
    iconButton:SetPushedTexture("Interface\\Buttons\\UI-EmptySlot")
    iconButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    local iconTexture = iconButton:CreateTexture(nil, "OVERLAY")  
    iconTexture:SetWidth(40)
    iconTexture:SetHeight(40)
    iconTexture:SetPoint("CENTER", iconButton, "CENTER", 0, 0)
    iconTexture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    iconButton.iconTexture = iconTexture
    editFrame.iconButton = iconButton
    
    local nameLabel = editFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameLabel:SetPoint("LEFT", iconLabel, "RIGHT", 30, 0)
    nameLabel:SetText(L["SPEC_NAME"])
    nameLabel:SetTextColor(1, 1, 1, 1)
    
    local nameEdit = CreateFrame("EditBox", nil, editFrame, "InputBoxTemplate")
    nameEdit:SetWidth(120)  
    nameEdit:SetHeight(20)
    nameEdit:SetPoint("LEFT", nameLabel, "RIGHT", 10, 0)
    nameEdit:SetFont("Fonts\\FRIZQT__.TTF", 11)
    nameEdit:SetTextColor(1, 1, 1, 1)
    nameEdit:SetAutoFocus(false)
    nameEdit:SetMaxLetters(20)
    editFrame.nameEdit = nameEdit
    
    local iconScrollBackground = CreateFrame("Frame", nil, editFrame)
    iconScrollBackground:SetPoint("TOPLEFT", iconButton, "BOTTOMLEFT", -10, -15)  
    iconScrollBackground:SetPoint("BOTTOMRIGHT", editFrame, "BOTTOMRIGHT", -20, 70)
    
    if BrainwasherPro.currentStyle == "classic" then
        iconScrollBackground:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
        iconScrollBackground:SetBackdropColor(0.2, 0.2, 0.2, 0.8)
    else
        iconScrollBackground:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        iconScrollBackground:SetBackdropColor(0.15, 0.15, 0.15, 0.9)
        iconScrollBackground:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    end
    
    local scrollFrame = CreateFrame("ScrollFrame", "BrainwasherProIconScrollFrame", iconScrollBackground, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", iconScrollBackground, "TOPLEFT", 8, -8)  
    scrollFrame:SetPoint("BOTTOMRIGHT", iconScrollBackground, "BOTTOMRIGHT", -28, 8)  
    
    local content = CreateFrame("Frame", "BrainwasherProIconContent", scrollFrame)
    content:SetWidth(250)  
    scrollFrame:SetScrollChild(content)
    editFrame.iconScrollFrame, editFrame.iconContent, editFrame.iconScrollBackground = scrollFrame, content, iconScrollBackground
    
    local iconsPerRow, iconSize, iconSpacing = 8, 30, 33
    local totalRows = math.ceil(table.getn(macroIcons) / iconsPerRow)
    content:SetHeight(totalRows * iconSpacing + 15)
    
    for i = 1, table.getn(macroIcons) do
        local row = math.ceil(i / iconsPerRow) - 1
        local col = i - 1 - (row * iconsPerRow)
        local iconBtn = CreateFrame("Button", nil, content)
        iconBtn:SetWidth(iconSize)
        iconBtn:SetHeight(iconSize)
        iconBtn:SetPoint("TOPLEFT", content, "TOPLEFT", 10 + (col * iconSpacing), -10 - (row * iconSpacing))  
        iconBtn:SetNormalTexture("Interface\\Buttons\\UI-EmptySlot")
        iconBtn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
        local btnTexture = iconBtn:CreateTexture(nil, "OVERLAY")  
        btnTexture:SetWidth(iconSize - 4)
        btnTexture:SetHeight(iconSize - 4)
        btnTexture:SetPoint("CENTER", iconBtn, "CENTER", 0, 0)
        btnTexture:SetTexture(macroIcons[i])
        iconBtn.iconTexture = btnTexture
        iconBtn:SetScript("OnClick", (function(iconIndex)
            return function()
                if iconIndex <= table.getn(macroIcons) and editFrame and editFrame.iconButton and editFrame.iconButton.iconTexture then
                    editFrame.iconButton.iconTexture:SetTexture(macroIcons[iconIndex])
                end
            end
        end)(i))
        iconButtons[i] = iconBtn
    end
    
    local buttonPanel = CreateFrame("Frame", nil, editFrame)
    buttonPanel:SetWidth(300)
    buttonPanel:SetHeight(40)
    buttonPanel:SetPoint("BOTTOM", editFrame, "BOTTOM", 0, 20)
    
    local confirmButton, cancelButton
    if BrainwasherPro.currentStyle == "classic" then
        confirmButton = CreateFrame("Button", nil, buttonPanel, "UIPanelButtonTemplate")
        confirmButton:SetWidth(100)
        confirmButton:SetHeight(22)
        confirmButton:SetPoint("LEFT", buttonPanel, "LEFT", 30, 0)
        confirmButton:SetText(L["CONFIRM"])
        cancelButton = CreateFrame("Button", nil, buttonPanel, "UIPanelButtonTemplate")
        cancelButton:SetWidth(100)
        cancelButton:SetHeight(22)
        cancelButton:SetPoint("RIGHT", buttonPanel, "RIGHT", -30, 0)
        cancelButton:SetText(L["CANCEL"])
    else
        confirmButton = CreateFrame("Button", nil, buttonPanel)
        confirmButton:SetWidth(100)
        confirmButton:SetHeight(22)
        confirmButton:SetPoint("LEFT", buttonPanel, "LEFT", 30, 0)
        confirmButton:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 12, edgeSize = 6,
            insets = {left = 1.5, right = 1.5, top = 1.5, bottom = 1.5}
        })
        confirmButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8)
        confirmButton:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        local confirmText = confirmButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        confirmText:SetPoint("CENTER", confirmButton, "CENTER", 0, 0)
        confirmText:SetText(L["CONFIRM"])
        confirmText:SetTextColor(1, 1, 1, 1)
        confirmButton:SetScript("OnEnter", function() confirmButton:SetBackdropColor(0.8, 0.3, 0.3, 1) end)
        confirmButton:SetScript("OnLeave", function() confirmButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8) end)
        cancelButton = CreateFrame("Button", nil, buttonPanel)
        cancelButton:SetWidth(100)
        cancelButton:SetHeight(22)
        cancelButton:SetPoint("RIGHT", buttonPanel, "RIGHT", -30, 0)
        cancelButton:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 12, edgeSize = 6,
            insets = {left = 1.5, right = 1.5, top = 1.5, bottom = 1.5}
        })
        cancelButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8)
        cancelButton:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        local cancelText = cancelButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        cancelText:SetPoint("CENTER", cancelButton, "CENTER", 0, 0)
        cancelText:SetText(L["CANCEL"])
        cancelText:SetTextColor(1, 1, 1, 1)
        cancelButton:SetScript("OnEnter", function() cancelButton:SetBackdropColor(0.8, 0.3, 0.3, 1) end)
        cancelButton:SetScript("OnLeave", function() cancelButton:SetBackdropColor(0.6, 0.2, 0.2, 0.8) end)
    end
    
    confirmButton:SetScript("OnClick", function() BrainwasherPro:ConfirmEdit() end)
    cancelButton:SetScript("OnClick", function() editFrame:Hide() end)
end

function BrainwasherPro:OnSpecClicked(slotIndex)
    local hasBuyOption, hasLoadOption, hasSaveOption = gossipSlots.buy and gossipSlots.buy[slotIndex], gossipSlots.load and gossipSlots.load[slotIndex], gossipSlots.save and gossipSlots.save[slotIndex]
    if hasBuyOption then
        BrainwasherPro.currentSlotAction = slotIndex
        local price = gossipSlots.buy[slotIndex].price
        StaticPopupDialogs["BRAINWASHERPRO_BUY_SLOT"].text = string.format(L["BUY_SLOT_CONFIRM"], slotIndex, price)
        StaticPopup_Show("BRAINWASHERPRO_BUY_SLOT")
    elseif hasLoadOption then
        BrainwasherPro.currentSlotAction = slotIndex
        StaticPopup_Show("BRAINWASHERPRO_LOAD_SPEC")
    elseif hasSaveOption then
        BrainwasherPro:OnSaveClicked(slotIndex)
    end
end

function BrainwasherPro:OnEditClicked(slotIndex)
    local spec = BrainwasherProDB.specs[slotIndex]
    if not spec then return end
    currentEditSlot = slotIndex
    if not editFrame then self:CreateEditFrame() end
    editFrame.nameEdit:SetText(spec.name or "配置 " .. slotIndex)
    editFrame.iconButton.iconTexture:SetTexture(spec.icon or "Interface\\Icons\\INV_Misc_QuestionMark")
    if mainFrame and mainFrame:IsVisible() then
        local mainX, mainY, mainWidth, mainHeight = mainFrame:GetCenter(), mainFrame:GetWidth(), mainFrame:GetHeight()
        local editWidth, screenWidth = editFrame:GetWidth(), UIParent:GetWidth()
        local rightSpace = screenWidth - (mainX + mainWidth/2)
        editFrame:ClearAllPoints()
        if rightSpace < editWidth + 20 then editFrame:SetPoint("RIGHT", mainFrame, "LEFT", -20, 0)
        else editFrame:SetPoint("LEFT", mainFrame, "RIGHT", 20, 0) end
    else editFrame:ClearAllPoints(); editFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0) end
    editFrame:Show()
end

function BrainwasherPro:OnSaveClicked(slotIndex)
    if gossipSlots.save and gossipSlots.save[slotIndex] then
        BrainwasherPro.currentSlotAction = slotIndex
        StaticPopup_Show("BRAINWASHERPRO_SAVE_SPEC")
    end
end

function BrainwasherPro:ConfirmEdit()
    local slotIndex, spec = currentEditSlot, BrainwasherProDB.specs[currentEditSlot]
    if spec then spec.name, spec.icon = editFrame.nameEdit:GetText(), editFrame.iconButton.iconTexture:GetTexture(); self:UpdateSpecDisplay(slotIndex) end
    editFrame:Hide()
end

function BrainwasherPro:UpdateSpecDisplay(slotIndex)
    local button, spec = specButtons[slotIndex], BrainwasherProDB.specs[slotIndex]
    local hasLoadOption, hasSaveOption, hasBuyOption = gossipSlots.load and gossipSlots.load[slotIndex], gossipSlots.save and gossipSlots.save[slotIndex], gossipSlots.buy and gossipSlots.buy[slotIndex]
    
    if hasBuyOption then
        button.icon.iconTexture:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")
        local price = gossipSlots.buy[slotIndex].price
        button.name:SetText("购买槽位 " .. slotIndex .. " (" .. price .. "金)")
        button.name:SetTextColor(1, 0.8, 0, 1)
        button.summary:SetText("点击图标购买新的天赋栏")
        button.edit:Hide(); button.save:Hide()
    elseif hasLoadOption and spec then
        button.icon.iconTexture:SetTexture(spec.icon or "Interface\\Icons\\Spell_ChargePositive")
        local nameText = spec.name or "已保存配置 " .. slotIndex
        if BrainwasherPro.showTalentPoints and spec.t1 and spec.t2 and spec.t3 then 
            nameText = nameText .. " (" .. ColorTalentSummary(spec.t1, spec.t2, spec.t3) .. ")"
        end
        button.name:SetText(nameText); button.name:SetTextColor(0.5, 1, 0.5, 1)
        button.summary:SetText("点击图标加载天赋")
        button.edit:Show(); button.save:Show()
    elseif hasSaveOption then
        button.icon.iconTexture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        button.name:SetText(L["AVAILABLE_SLOT"]); button.name:SetTextColor(0.7, 0.7, 0.7, 1)
        button.summary:SetText(" "); button.edit:Hide(); button.save:Show()
    else
        button.icon.iconTexture:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        button.name:SetText("请购买上一个天赋栏"); button.name:SetTextColor(1, 0, 0, 1)
        button.summary:SetText(""); button.edit:Hide(); button.save:Hide()
    end
end

function BrainwasherPro:UpdateAllDisplays() for i = 1, 4 do self:UpdateSpecDisplay(i) end end

function BrainwasherPro:SaveCurrentSpec(slotIndex)
    if not slotIndex then return end
    local t1, t2, t3 = GetTalentCounts()
    local talents = FetchCurrentTalents()
    
    local spec = BrainwasherProDB.specs[slotIndex] or {}
    
    spec.t1 = t1
    spec.t2 = t2
    spec.t3 = t3
    spec.talents = talents

    if not spec.name then
        spec.name = "配置 " .. slotIndex
    end
    if not spec.icon then
        spec.icon = "Interface\\Icons\\INV_Misc_QuestionMark"
    end
    
    BrainwasherProDB.specs[slotIndex] = spec
    
    if gossipSlots.save and gossipSlots.save[slotIndex] then
        gossipSlots.save[slotIndex]:Click()
    end
end

function BrainwasherPro:ResetTalents()
    if gossipSlots.reset then
        gossipSlots.reset:Click()
    end
end

function BrainwasherPro:BuySlot(slotIndex)
    if slotIndex and gossipSlots.buy and gossipSlots.buy[slotIndex] then
        -- 模拟点击购买按钮
        local buyInfo = gossipSlots.buy[slotIndex]
        if buyInfo.button and buyInfo.button:IsVisible() then
            buyInfo.button:Click()
            
            -- 更新UI显示
            self:ParseGossipOptions()  -- 重新解析gossip选项
            self:UpdateAllDisplays()   -- 更新所有显示
        end
    end
end

function BrainwasherPro:ParseGossipOptions()
    gossipSlots = {save = {}, load = {}, buy = {}, reset = nil, resetPrice = 0}
    for i = 1, NUMGOSSIPBUTTONS do
        local titleButton = getglobal("GossipTitleButton" .. i)
        if titleButton and titleButton:IsVisible() then
            local text = titleButton:GetText()
            local _, _, saveSpec = string.find(text, "保存第(%d+)天赋")
            local _, _, loadSpec = string.find(text, "启用第(%d+)天赋")
            local _, _, buyPrice, buySpec = string.find(text, "用(%d+)金币购买第(%d+)个天赋标签")
            local resetMatch, _, resetPrice = string.find(text, "重置我的天赋"), string.find(text, "重置我的天赋.*(%d+)金币")
            if saveSpec then gossipSlots.save[tonumber(saveSpec)] = titleButton
            elseif loadSpec then 
                local slotNum = tonumber(loadSpec)
                gossipSlots.load[slotNum] = titleButton
                if not BrainwasherProDB.specs[slotNum] then BrainwasherProDB.specs[slotNum] = {name = "配置 " .. slotNum, icon = "Interface\\Icons\\INV_Misc_QuestionMark", t1 = 0, t2 = 0, t3 = 0, talents = {}} end
            elseif buySpec and buyPrice then gossipSlots.buy[tonumber(buySpec)] = {button = titleButton, price = tonumber(buyPrice) or 0}
            elseif resetMatch then gossipSlots.reset = titleButton; if resetPrice then gossipSlots.resetPrice = tonumber(resetPrice) or 0 end end
        end
    end
end

function BrainwasherPro:OnGossipShow()
    if GossipFrameNpcNameText:GetText() ~= "地精洗脑装置" then return end
    self:ParseGossipOptions()
    GossipFrame:SetAlpha(0)
    if not mainFrame then self:CreateMainFrame() end
    if self.mainResetButton and self.mainResetText then
        if gossipSlots.reset then
            self.mainResetButton:Show()
            if gossipSlots.resetPrice and gossipSlots.resetPrice > 0 then self.mainResetText:SetText(L["RESET_TALENTS"] .. " (" .. gossipSlots.resetPrice .. "金)")
            else self.mainResetText:SetText(L["RESET_TALENTS"]) end
        else self.mainResetButton:Hide() end
    end
    if self.toggleTalentPointsButton and self.toggleTalentPointsButton.toggleText then
        self.toggleTalentPointsButton.toggleText:SetText(BrainwasherPro.showTalentPoints and L["HIDE_TALENT_POINTS"] or L["SHOW_TALENT_POINTS"])
    end
    mainFrame:Show(); self:UpdateAllDisplays()
end

function BrainwasherPro:OnGossipClosed() 
    if mainFrame then mainFrame:Hide() end; 
    if editFrame and editFrame:IsVisible() then editFrame:Hide() end 
    GossipFrame:SetAlpha(1)
end

StaticPopupDialogs["BRAINWASHERPRO_LOAD_SPEC"] = {
    text = L["LOAD_SPEC_CONFIRM"], button1 = L["YES"], button2 = L["NO"],
    OnShow = function()
        local slotIndex, specName = BrainwasherPro.currentSlotAction, "配置 " .. BrainwasherPro.currentSlotAction
        if slotIndex and BrainwasherProDB.specs[slotIndex] and BrainwasherProDB.specs[slotIndex].name then specName = BrainwasherProDB.specs[slotIndex].name end
        local textField = getglobal(this:GetName().."Text")
        if textField then 
            -- 检查是否有对应的动作条配置和Outfitter套装
            local actionBarInfo = ""
            local itemSetInfo = ""
            local playerName = UnitName("player") .. " of " .. GetCVar("realmName")
            
            if ABP_Layout and ABP_Layout[playerName] and ABP_Layout[playerName][specName] then
                actionBarInfo = "\n\n|cff00ff00同时将切换动作条配置: " .. specName .. "|r"
            else
                actionBarInfo = "\n\n|cffff0000(未找到同名的动作条配置)|r"
            end
            
            local hasOutfitterSet = false
            local setNames = GetOutfitterSetNames()
            for _, setName in ipairs(setNames) do
                if setName == specName then
                    hasOutfitterSet = true
                    break
                end
            end
            
            if hasOutfitterSet then
                itemSetInfo = "\n\n|cff00ff00同时将切换Outfitter套装: " .. specName .. "|r"
            else
                itemSetInfo = "\n\n|cffff0000(未找到同名的Outfitter套装)|r"
            end
            
            textField:SetText("是否切换'" .. specName .. "'天赋?" .. actionBarInfo .. itemSetInfo) 
        end
    end,
    OnAccept = function() 
        if BrainwasherPro.currentSlotAction and gossipSlots.load and gossipSlots.load[BrainwasherPro.currentSlotAction] then 
            gossipSlots.load[BrainwasherPro.currentSlotAction]:Click() 
  
            OnTalentLoadComplete()
        end 
    end,
    timeout = 0, whileDead = 1, hideOnEscape = 1
}

StaticPopupDialogs["BRAINWASHERPRO_SAVE_SPEC"] = {
    text = L["SAVE_SPEC_CONFIRM"], button1 = L["YES"], button2 = L["NO"],
    OnAccept = function() BrainwasherPro:SaveCurrentSpec(BrainwasherPro.currentSlotAction) end,
    timeout = 0, whileDead = 1, hideOnEscape = 1
}

StaticPopupDialogs["BRAINWASHERPRO_RESET_TALENTS"] = {
    text = L["RESET_TALENTS_CONFIRM"], button1 = L["YES"], button2 = L["NO"],
    OnAccept = function() BrainwasherPro:ResetTalents() end,
    timeout = 0, whileDead = 1, hideOnEscape = 1
}

StaticPopupDialogs["BRAINWASHERPRO_BUY_SLOT"] = {
    text = "", button1 = L["YES"], button2 = L["NO"],
    OnAccept = function() BrainwasherPro:BuySlot(BrainwasherPro.currentSlotAction) end,
    timeout = 0, whileDead = 1, hideOnEscape = 1
}

StaticPopupDialogs["BRAINWASHERPRO_SWITCH_STYLE"] = {
    text = L["SWITCH_STYLE_CONFIRM"], button1 = L["YES"], button2 = L["NO"],
    OnAccept = function()
        BrainwasherPro.currentStyle = BrainwasherPro.currentStyle == "classic" and "dark" or "classic"
        BrainwasherProDB.style = BrainwasherPro.currentStyle
        ReloadUI()
    end,
    timeout = 0, whileDead = 1, hideOnEscape = 1
}

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("GOSSIP_SHOW")
eventFrame:RegisterEvent("GOSSIP_CLOSED")
-- eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")  -- 取消注册这个事件，如果我们不需要它的话
eventFrame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" and arg1 == "BrainwasherPro" then
        if not BrainwasherProDB then BrainwasherProDB = {specs = {}, style = "dark"} end
        if not BrainwasherProDB.specs then BrainwasherProDB.specs = {} end
        if not BrainwasherProDB.style then BrainwasherProDB.style = "dark" end
        BrainwasherPro.currentStyle = BrainwasherProDB.style
        BrainwasherPro:PopulateMacroIcons()
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00地精洗脑装置已加载! 与洗脑装置交互以使用.|r")
        

        eventFrame:SetScript("OnUpdate", function()
            CheckAndSwitchActionBar()
            CheckAndSwitchItemSet() -- 新增：检查并切换Outfitter套装
        end)
        
    elseif event == "GOSSIP_SHOW" then BrainwasherPro:OnGossipShow()
    elseif event == "GOSSIP_CLOSED" then BrainwasherPro:OnGossipClosed() 
    -- 注释掉PLAYER_ENTERING_WORLD事件的处理
    -- elseif event == "PLAYER_ENTERING_WORLD" then
    --     lastActionBarCheckTime = 0
    --     lastLoadedSpecName = nil
    --     lastLoadedItemSetName = nil -- 新增：重置套装记录
    end
end)