
OneCore = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceModuleCore-2.0", "AceHook-2.0")
local AceLocale = AceLibrary and AceLibrary("AceLocale-2.1")
local L = AceLocale and AceLocale:GetInstance("OneBag") or setmetatable({}, {__index = function(self, key) return key end})
local LC = AceLocale and AceLocale:GetInstance("OneCore", true) or setmetatable({}, {__index = function(self, key) return key end})
local function HasItemLock()
    return ItemLockDB and true or false
end

-- 全局开关变量 - 初始化为true，后续从数据库加载
local FILTER_MODULES_VISIBLE = true

-- 切换过滤模块显示状态的函数
-- 修改ToggleFilterModulesVisibility函数，使其可以被选项系统调用
function ToggleFilterModulesVisibility(value)
    if value ~= nil then
        FILTER_MODULES_VISIBLE = value
    else
        FILTER_MODULES_VISIBLE = not FILTER_MODULES_VISIBLE
    end
    
    -- 保存到 OneBag 数据库
    if OneBag and OneBag.db then
        OneBag.db.profile.filterModulesVisible = FILTER_MODULES_VISIBLE
    end
    
    -- 更新所有已加载的模块
    if FILTER_MODULES_VISIBLE then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[OneBag] 已显示分类过滤模块|r")
        
        -- 更新OneBag模块
        if OneBag and OneBag.frame and OneBag.frame:IsVisible() then
            if OneBagCategory then
                OneBagCategory:UpdateButtons()
            end
            -- Quality模块不做处理，它会自动显示
        end
        
        -- 更新OneBank模块
        if OneBank and OneBank.frame and OneBank.frame:IsVisible() then
            if OneBankCategory then
                OneBankCategory:UpdateButtons()
            end
            -- Quality模块不做处理，它会自动显示
        end
        
        -- 更新OneView模块
        if OneView and OneView.frame and OneView.frame:IsVisible() then
            if OneViewCategory then
                OneViewCategory:UpdateButtons()
            end
            -- Quality模块不做处理，它会自动显示
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[OneBag] 已隐藏分类过滤模块|r")
        
        -- 隐藏所有Category模块
        if OneBagCategory then
            OneBagCategory:Hide()
        end
        -- 不隐藏Quality模块
        if OneBankCategory then
            OneBankCategory:Hide()
        end
        -- 不隐藏Quality模块
        if OneViewCategory then
            OneViewCategory:Hide()
        end
        -- 不隐藏Quality模块
    end
end

-- 保留斜杠命令，但调用修改后的函数
SlashCmdList["ONEBAG_TOGGLE_FILTERS"] = function() ToggleFilterModulesVisibility() end
SLASH_ONEBAG_TOGGLE_FILTERS1 = "/obtogglefilters"
SLASH_ONEBAG_TOGGLE_FILTERS2 = "/obtf"

function CreateCategoryModule(name)
    local Module = OneCore:NewModule(name, "AceEvent-2.0")
    local L = AceLibrary("AceLocale-2.1"):GetInstance("OneBag")

    local CATEGORY_LIST = {
        { id = "quest", name = "任务", icon = "Interface\\Icons\\INV_Misc_Note_02", priority = 100, color = { 1.0, 0.82, 0.0 } },
        { id = "equipment", name = "装备", icon = "Interface\\Icons\\INV_Chest_Plate01", priority = 90, color = { 0.7, 0.7, 0.9 } },
        { id = "consumable", name = "消耗品", icon = "Interface\\Icons\\INV_Potion_51", priority = 80, color = { 0.4, 0.9, 0.4 } },
        { id = "tradeskill", name = "商业技能", icon = "Interface\\Icons\\Trade_Engineering", priority = 70, color = { 0.9, 0.6, 1.0 } },
        { id = "reagent", name = "材料", icon = "Interface\\Icons\\INV_Fabric_Silk_02", priority = 60, color = { 1.0, 0.9, 0.5 } },
        { id = "container", name = "容器", icon = "Interface\\Icons\\INV_Misc_Bag_08", priority = 50, color = { 0.7, 0.7, 0.7 } },
        { id = "projectile", name = "弹药", icon = "Interface\\Icons\\INV_Ammo_Arrow_01", priority = 40, color = { 0.5, 0.8, 1.0 } },
        { id = "misc", name = "杂项", icon = "Interface\\Icons\\INV_Misc_Bag_10_Green", priority = 10, color = { 0.6, 0.6, 0.6 } },
    }

    local owner
    local buttonFrame
    local buttons
    local activeCategory

    function Module:Embed(parent)
        owner = parent
        self:CreateUI()
        self:RegisterEvents()
    end

    function Module:CreateUI()
        buttonFrame = CreateFrame("Frame", nil, owner.frame)
        buttonFrame:SetWidth(40)
        buttonFrame:SetHeight(300)
        buttonFrame:SetPoint("TOPLEFT", owner.frame, "TOPLEFT", -169, -40)
        buttonFrame:SetFrameStrata("HIGH")
        buttonFrame:Hide()

        buttons = {}
        for i, info in ipairs(CATEGORY_LIST) do
            local btn = CreateFrame("CheckButton", nil, buttonFrame)
            btn:SetWidth(36); btn:SetHeight(36)
            btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")

            if i == 1 then
                btn:SetPoint("TOP", buttonFrame, "TOP", 0, 0)
            else
                btn:SetPoint("TOP", buttons[i - 1], "BOTTOM", 0, -3)
            end

            btn.bg = btn:CreateTexture(nil, "BACKGROUND")
            btn.bg:SetAllPoints()
            btn.bg:SetTexture(0, 0, 0, 0.5)

            btn.normalBorder = btn:CreateTexture(nil, "BORDER")
            btn.normalBorder:SetWidth(40)
            btn.normalBorder:SetHeight(40)
            btn.normalBorder:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.normalBorder:SetTexture("Interface\\Buttons\\UI-Quickslot2")
            btn.normalBorder:SetVertexColor(0.5, 0.5, 0.5, 1)

            btn.icon = btn:CreateTexture(nil, "ARTWORK")
            btn.icon:SetWidth(30)
            btn.icon:SetHeight(30)
            btn.icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.icon:SetTexture(info.icon)
            btn.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)

            btn.highlight = btn:CreateTexture(nil, "HIGHLIGHT")
            btn.highlight:SetWidth(40)
            btn.highlight:SetHeight(40)
            btn.highlight:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.highlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
            btn.highlight:SetBlendMode("ADD")

            btn.border = btn:CreateTexture(nil, "OVERLAY")
            btn.border:SetWidth(64)
            btn.border:SetHeight(64)
            btn.border:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
            btn.border:SetBlendMode("ADD")
            btn.border:SetVertexColor(1, 0.8, 0, 1)
            btn.border:Hide()

            btn.categoryId = info.id
            btn.qualityName = info.name
            btn.qualityColor = info.color
            btn:SetScript("OnClick", function()
                self:OnClick(btn.categoryId)
                for k, v in pairs(buttons) do
                    v.border:Hide()
                end
                if activeCategory == btn.categoryId then
                    btn.border:Show()
                else
                    btn.border:Hide()
                end
            end)
            btn:SetScript("OnEnter", function()
                GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
                GameTooltip:SetText(btn.qualityName, unpack(btn.qualityColor))
                GameTooltip:AddLine(format("物品数量: %d", self:CountCategoryItems(btn.categoryId)), 0.7, 0.7, 0.7)
                GameTooltip:AddLine("点击：筛选该类型", 0, 1, 0)
                GameTooltip:AddLine("再点：取消筛选", 1, 1, 0)
                GameTooltip:Show()
            end)
            btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

            buttons[i] = btn
        end
    end

    function Module:RegisterEvents()
        self:RegisterEvent("BAG_UPDATE", function() self:Refresh() end)
        self:RegisterEvent("BAG_OPEN", function() self:Refresh() end)
        self:RegisterEvent("PLAYER_ENTERING_WORLD", function() self:Refresh() end)
        self:RegisterEvent("BANKFRAME_OPENED", function() self:Refresh() end)
        self:RegisterEvent("MERCHANT_SHOW", function() self:Refresh() end)
        self:RegisterEvent("MAIL_SHOW", function() self:Refresh() end)
        self:RegisterEvent("TRADE_SHOW", function() self:Refresh() end)

        self:RegisterEvent("BANKFRAME_CLOSED", function() self:Hide() end)
        self:RegisterEvent("MERCHANT_CLOSED", function() self:Hide() end)
        self:RegisterEvent("MAIL_CLOSED", function() self:Hide() end)
        self:RegisterEvent("TRADE_CLOSED", function() self:Hide() end)
    end

    function Module:OnClick(categoryId)
        if activeCategory == categoryId then
            activeCategory = nil
        else
            activeCategory = categoryId
        end

        if owner.GetActiveQuality and owner:GetActiveQuality() then
            owner:SetActiveQuality()
        end
        
        self:UpdateButtons()
        if owner.OrganizeFrame then
            owner:OrganizeFrame(true)
        end
        self:ApplyFilter()
    end

    function Module:HasAnyButtonVisible(counts)
        for _, info in ipairs(CATEGORY_LIST) do
            if (counts[info.id] or 0) > 0 then return true end
        end
        return false
    end

    function Module:Refresh()
        if not owner.frame:IsVisible() then
            self:Hide(); return
        end
        self:UpdateButtons()
        self:ApplyFilter()
    end

    function Module:Hide()
        buttonFrame:Hide()
    end

    function Module:UpdateButtons()
        if not owner.frame:IsVisible() then
            self:Hide()
            return
        end

        -- 检查全局开关 - 从 OneBag 数据库获取
        local filterVisible = true
        if OneBag and OneBag.db and OneBag.db.profile then
            filterVisible = OneBag.db.profile.filterModulesVisible
        end
        if not filterVisible then
            buttonFrame:Hide()
            return
        end

        -- 修复：检查背包栏位框架是否可见或即将可见，如果是则隐藏分类标签
        if owner.frame.bagFrame and (owner.frame.bagFrame:IsVisible() or owner.frame.bagFrame.wasShown) then
            buttonFrame:Hide()
            return
        end
        
        buttonFrame:Show()
        
        for i, btn in ipairs(buttons) do
            if activeCategory == btn.categoryId then
                btn.border:Show()
            else
                btn.border:Hide()
            end
        end
        
        local width = math.max(table.getn(buttons) * 38 - 2, 50)
        buttonFrame:SetWidth(width)
        
        if owner.OrganizeFrame then
            owner:OrganizeFrame(true)
        end
        self:ApplyFilter()
    end

    function Module:BuildCountTable()
        local t = {}
        for _, bagID in ipairs(owner.fBags) do
            local bagFrame = owner.frame.bags[bagID]
            if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                for slot = 1, bagFrame.size do
                    local texture = GetContainerItemInfo(bagID, slot)
                    if texture then
                        local cat = self:GetItemCategory(bagID, slot)
                        t[cat] = (t[cat] or 0) + 1
                    end
                end
            end
        end
        return t
    end

    function Module:GetItemCategory(bagID, slotID)
        local link = GetContainerItemLink(bagID, slotID)
        if not link then return "misc" end
        local _, _, id = strfind(link, "item:(%d+)")
        if not id then return "misc" end
        local name, _, quality, _, itemType, subType = GetItemInfo(id)
        if not name then return "misc" end

        if itemType == "Quest" or itemType == "任务" or itemType == "Key" or itemType == "钥匙" then return "quest" end
        if itemType == "Armor" or itemType == "护甲" or itemType == "Weapon" or itemType == "武器" then return "equipment" end
        if itemType == "Consumable" or itemType == "消耗品" or itemType == "Food" or itemType == "食物" or itemType == "Potion" or itemType == "药水" or itemType == "烹饪" then return "consumable" end
        if itemType == "Trade Goods" or itemType == "商业" or itemType == "商品" or itemType == "商业技能" or itemType == "交易商品" or itemType == "Recipe" or itemType == "配方" or itemType == "食谱" then return "tradeskill" end
        if itemType == "Reagent" or itemType == "材料" then return "reagent" end
        if itemType == "Container" or itemType == "容器" or itemType == "Quiver" or itemType == "箭袋" then return "container" end
        if itemType == "Projectile" or itemType == "弹药" then return "projectile" end
        if quality == 0 then return "misc" end
        return "misc"
    end

    function Module:CountCategoryItems(categoryId)
        local counts = self:BuildCountTable()
        return counts[categoryId] or 0
    end

    function Module:ApplyFilter()
        local categoryId = self:GetActiveCategory()
        if not categoryId then
            for _, bagID in ipairs(owner.fBags) do
                local bagFrame = owner.frame.bags[bagID]
                if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                    for slot = 1, bagFrame.size do
                        local btn = bagFrame[slot]
                        if btn then
                            btn:SetAlpha(1)
                        end
                    end
                end
            end
            return
        end

        for _, bagID in ipairs(owner.fBags) do
            local bagFrame = owner.frame.bags[bagID]
            if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                for slot = 1, bagFrame.size do
                    local btn = bagFrame[slot]
                    if btn then
                        local texture = GetContainerItemInfo(bagID, slot)
                        if texture and self:GetItemCategory(bagID, slot) == categoryId then
                            btn:SetAlpha(1)
                        else
                            btn:SetAlpha(0.25)
                        end
                    end
                end
            end
        end
    end

    function Module:GetActiveCategory() return activeCategory end

    function Module:SetActiveCategory() 
        activeCategory = nil 
        self:ApplyFilter()
    end

    return Module
end

function CreateQualityModule(name)
    local Module = OneCore:NewModule(name, "AceEvent-2.0")
    local L = AceLocale and AceLocale:GetInstance("OneBag") or setmetatable({}, {__index = function(self, key) return key end})

    local QUALITY_LIST = {
        { id = 5, name = "传说", color = { r = 1, g = 0.5, b = 0 }, priority = 5 },
        { id = 4, name = "史诗", color = { r = 0.5, g = 0, b = 0.5 }, priority = 4 },
        { id = 3, name = "精良", color = { r = 0, g = 0.5, b = 1 }, priority = 3 },
        { id = 2, name = "优秀", color = { r = 0, g = 1, b = 0 }, priority = 2 },
        { id = 1, name = "普通/粗糙", color = { r = 1, g = 1, b = 1 }, priority = 1 },
    }

    local owner
    local buttonFrame
    local buttons
    local activeQuality

    function Module:Embed(parent)
        owner = parent
        self:CreateUI()
        self:RegisterEvents()
    end

    function Module:CreateUI()
        buttonFrame = CreateFrame("Frame", nil, owner.frame)
        buttonFrame:SetWidth(120)  
        buttonFrame:SetHeight(16)  
        buttonFrame:SetPoint("TOPLEFT", owner.frame, "TOPLEFT", 8, -36)
        buttonFrame:SetFrameStrata("DIALOG")
        buttonFrame:SetFrameLevel(owner.frame:GetFrameLevel()+100)
        buttonFrame:Hide()

        buttons = {}
        for i, info in ipairs(QUALITY_LIST) do
            local btn = CreateFrame("CheckButton", nil, buttonFrame)
            btn:SetWidth(21)  
            btn:SetHeight(21)  
            btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            btn:SetFrameLevel(buttonFrame:GetFrameLevel() + 1)
            if i == 1 then
                btn:SetPoint("LEFT", buttonFrame, "LEFT", 0, 0)
            else
                btn:SetPoint("LEFT", buttons[i - 1], "RIGHT", 1, 0) 
            end

            btn.bg = btn:CreateTexture(nil, "BACKGROUND")
            btn.bg:SetAllPoints()
            btn.bg:SetTexture("Interface\\AddOns\\OneBag\\media\\BagSlot3")
            btn.bg:SetVertexColor(info.color.r, info.color.g, info.color.b, 1)
            btn.bg:SetAlpha(0.6)

            btn.border = btn:CreateTexture(nil, "OVERLAY")
            btn.border:SetAllPoints()
            btn.border:SetTexture("Interface\\AddOns\\OneBag\\media\\Border")
            btn.border:SetBlendMode("ADD")

            btn.highlightBorder = btn:CreateTexture(nil, "OVERLAY")
            btn.highlightBorder:SetAllPoints()
            btn.highlightBorder:SetTexture("Interface\\AddOns\\OneBag\\media\\Border")
            btn.highlightBorder:SetBlendMode("ADD")
            btn.highlightBorder:SetVertexColor(1, 0.8, 0, 1)
            btn.highlightBorder:Hide()

            btn.highlight = btn:CreateTexture(nil, "HIGHLIGHT")
            btn.highlight:SetAllPoints()
            btn.highlight:SetTexture("Interface\\AddOns\\OneBag\\media\\BagSlot3")
            btn.highlight:SetBlendMode("ADD")
            btn.highlight:SetVertexColor(1, 1, 1, 0.5)

            btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            btn.text:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.text:SetText(string.sub(info.name, 1, 1))
            btn.text:SetTextColor(1, 1, 1)
            btn.text:SetShadowOffset(1, -1)
            btn.text:SetShadowColor(0, 0, 0, 0.8)

            btn.qualityId = info.id
            btn.qualityName = info.name
            btn.qualityColor = info.color

            btn:SetScript("OnClick", function(_, btnName)
                if btnName == "RightButton" then
                    self:OnClick(nil)
                else
                    self:OnClick(btn.qualityId)
                end
            end)

            btn:SetScript("OnEnter", function()
                GameTooltip:SetOwner(btn, "ANCHOR_TOP")
                GameTooltip:SetText(btn.qualityName, btn.qualityColor.r, btn.qualityColor.g, btn.qualityColor.b)
                GameTooltip:AddLine(format("装备数量: %d", self:CountCategoryItems(btn.qualityId)), 0.7, 0.7, 0.7)
                GameTooltip:AddLine("点击：筛选该品质", 0, 1, 0)
                GameTooltip:AddLine("再点：取消筛选", 1, 1, 0)
                GameTooltip:Show()
            end)

            btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

            buttons[i] = btn
        end
    end

    function Module:RegisterEvents()
        self:RegisterEvent("BAG_UPDATE", function() self:Refresh() end)
        self:RegisterEvent("BAG_OPEN", function() self:Refresh() end)
        self:RegisterEvent("PLAYER_ENTERING_WORLD", function() self:Refresh() end)
        self:RegisterEvent("BANKFRAME_OPENED", function() self:Refresh() end)
        self:RegisterEvent("MERCHANT_SHOW", function() self:Refresh() end)
        self:RegisterEvent("MAIL_SHOW", function() self:Refresh() end)
        self:RegisterEvent("TRADE_SHOW", function() self:Refresh() end)

        self:RegisterEvent("BANKFRAME_CLOSED", function() self:Hide() end)
        self:RegisterEvent("MERCHANT_CLOSED", function() self:Hide() end)
        self:RegisterEvent("MAIL_CLOSED", function() self:Hide() end)
        self:RegisterEvent("TRADE_CLOSED", function() self:Hide() end)
    end

    function Module:OnClick(qualityId)
        if activeQuality == qualityId then
            activeQuality = nil
        else
            activeQuality = qualityId
        end

        if owner.GetActiveCategory and owner:GetActiveCategory() then
            owner:SetActiveCategory()
        end

        self:UpdateButtons()
        if owner.OrganizeFrame then
            owner:OrganizeFrame(true)
        end
        self:ApplyFilter()
    end

    function Module:Refresh()
        if not owner.frame:IsVisible() then
            self:Hide(); return
        end
        self:UpdateButtons()
        self:ApplyFilter()
    end

    function Module:Hide()
        buttonFrame:Hide()
    end

    -- 在Category模块的UpdateButtons函数中，确保正确读取设置：
function Module:UpdateButtons()
    if not owner.frame:IsVisible() then
        self:Hide()
        return
    end

    -- Quality模块始终显示，不检查全局开关
    -- 只检查背包侧边栏是否显示
    if owner.frame.bagFrame and (owner.frame.bagFrame:IsVisible() or owner.frame.bagFrame.wasShown) then
        buttonFrame:Hide()
        return
    end
    
    buttonFrame:Show()
    
    for i, btn in ipairs(buttons) do
        btn.highlightBorder:Hide()
        btn.bg:SetAlpha(0.6)
        if activeQuality == btn.qualityId then
            btn.highlightBorder:Show()
            btn.bg:SetAlpha(1)
        end
    end
    
    if owner.OrganizeFrame then
        owner:OrganizeFrame(true)
    end
    self:ApplyFilter()
end

    function Module:BuildCountTable()
        local t = {}
        for _, bagID in ipairs(owner.fBags) do
            local bagFrame = owner.frame.bags[bagID]
            if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                for slot = 1, bagFrame.size do
                    local texture, _, _, quality = GetContainerItemInfo(bagID, slot)
                    if texture then
                        local cat = (quality == 0 and 1) or quality
                        t[cat] = (t[cat] or 0) + 1
                    end
                end
            end
        end
        return t
    end

    function Module:CountCategoryItems(qualityId)
        local counts = self:BuildCountTable()
        return counts[qualityId] or 0
    end

    function Module:ApplyFilter()
        local qualityId = self:GetActiveQuality()
        if not qualityId then
            for _, bagID in ipairs(owner.fBags) do
                local bagFrame = owner.frame.bags[bagID]
                if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                    for slot = 1, bagFrame.size do
                        local btn = bagFrame[slot]
                        if btn then
                            btn:SetAlpha(1)
                        end
                    end
                end
            end
            return
        end

        for _, bagID in ipairs(owner.fBags) do
            local bagFrame = owner.frame.bags[bagID]
            if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                for slot = 1, bagFrame.size do
                    local btn = bagFrame[slot]
                    if btn then
                        local texture, _, _, quality = GetContainerItemInfo(bagID, slot)
                        if texture then
                            local match = (qualityId == 1 and (quality == 0 or quality == 1)) or (quality == qualityId)
                            if match then
                                btn:SetAlpha(1)
                            else
                                btn:SetAlpha(0.25)
                            end
                        else
                            btn:SetAlpha(0.25)
                        end
                    end
                end
            end
        end
    end

    function Module:GetActiveQuality() return activeQuality end

    function Module:SetActiveQuality() 
        activeQuality = nil 
        self:ApplyFilter()
    end

    return Module
end

-- 为OneView创建专用的分类模块
function CreateOneViewCategoryModule(name)
    local Module = OneCore:NewModule(name, "AceEvent-2.0")
    local L = AceLibrary and AceLibrary("AceLocale-2.1"):GetInstance("OneBag") or setmetatable({}, {__index = function(self, key) return key end})

    local CATEGORY_LIST = {
        { id = "quest", name = "任务", icon = "Interface\\Icons\\INV_Misc_Note_02", priority = 100, color = { 1.0, 0.82, 0.0 } },
        { id = "equipment", name = "装备", icon = "Interface\\Icons\\INV_Chest_Plate01", priority = 90, color = { 0.7, 0.7, 0.9 } },
        { id = "consumable", name = "消耗品", icon = "Interface\\Icons\\INV_Potion_51", priority = 80, color = { 0.4, 0.9, 0.4 } },
        { id = "tradeskill", name = "商业技能", icon = "Interface\\Icons\\Trade_Engineering", priority = 70, color = { 0.9, 0.6, 1.0 } },
        { id = "reagent", name = "材料", icon = "Interface\\Icons\\INV_Fabric_Silk_02", priority = 60, color = { 1.0, 0.9, 0.5 } },
        { id = "container", name = "容器", icon = "Interface\\Icons\\INV_Misc_Bag_08", priority = 50, color = { 0.7, 0.7, 0.7 } },
        { id = "projectile", name = "弹药", icon = "Interface\\Icons\\INV_Ammo_Arrow_01", priority = 40, color = { 0.5, 0.8, 1.0 } },
        { id = "misc", name = "杂项", icon = "Interface\\Icons\\INV_Misc_Bag_10_Green", priority = 10, color = { 0.6, 0.6, 0.6 } },
    }

    local owner
    local buttonFrame
    local buttons
    local activeCategory

    function Module:Embed(parent)
        owner = parent
        self:CreateUI()
        self:RegisterEvents()
    end

    function Module:CreateUI()
        buttonFrame = CreateFrame("Frame", nil, owner.frame)
        buttonFrame:SetWidth(40)
        buttonFrame:SetHeight(300)
        buttonFrame:SetPoint("TOPLEFT", owner.frame, "TOPLEFT", -38, -40)
        buttonFrame:SetFrameStrata("HIGH")
        buttonFrame:Hide()

        buttons = {}
        for i, info in ipairs(CATEGORY_LIST) do
            local btn = CreateFrame("CheckButton", nil, buttonFrame)
            btn:SetWidth(36); btn:SetHeight(36)
            btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")

            if i == 1 then
                btn:SetPoint("TOP", buttonFrame, "TOP", 0, 0)
            else
                btn:SetPoint("TOP", buttons[i - 1], "BOTTOM", 0, -3)
            end

            btn.bg = btn:CreateTexture(nil, "BACKGROUND")
            btn.bg:SetAllPoints()
            btn.bg:SetTexture(0, 0, 0, 0.5)

            btn.normalBorder = btn:CreateTexture(nil, "BORDER")
            btn.normalBorder:SetWidth(40)
            btn.normalBorder:SetHeight(40)
            btn.normalBorder:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.normalBorder:SetTexture("Interface\\Buttons\\UI-Quickslot2")
            btn.normalBorder:SetVertexColor(0.5, 0.5, 0.5, 1)

            btn.icon = btn:CreateTexture(nil, "ARTWORK")
            btn.icon:SetWidth(30)
            btn.icon:SetHeight(30)
            btn.icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.icon:SetTexture(info.icon)
            btn.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)

            btn.highlight = btn:CreateTexture(nil, "HIGHLIGHT")
            btn.highlight:SetWidth(40)
            btn.highlight:SetHeight(40)
            btn.highlight:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.highlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
            btn.highlight:SetBlendMode("ADD")

            btn.border = btn:CreateTexture(nil, "OVERLAY")
            btn.border:SetWidth(64)
            btn.border:SetHeight(64)
            btn.border:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
            btn.border:SetBlendMode("ADD")
            btn.border:SetVertexColor(1, 0.8, 0, 1)
            btn.border:Hide()

            btn.categoryId = info.id
            btn.qualityName = info.name
            btn.qualityColor = info.color
            btn:SetScript("OnClick", function()
                self:OnClick(btn.categoryId)
                for k, v in pairs(buttons) do
                    v.border:Hide()
                end
                if activeCategory == btn.categoryId then
                    btn.border:Show()
                else
                    btn.border:Hide()
                end
            end)
            btn:SetScript("OnEnter", function()
                GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
                GameTooltip:SetText(btn.qualityName, unpack(btn.qualityColor))
                GameTooltip:AddLine(format("物品数量: %d", self:CountCategoryItems(btn.categoryId)), 0.7, 0.7, 0.7)
                GameTooltip:AddLine("点击：筛选该类型", 0, 1, 0)
                GameTooltip:AddLine("再点：取消筛选", 1, 1, 0)
                GameTooltip:Show()
            end)
            btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

            buttons[i] = btn
        end
    end

    function Module:RegisterEvents()
        self:RegisterEvent("PLAYER_ENTERING_WORLD", function() self:Refresh() end)
    end

    function Module:OnClick(categoryId)
        if activeCategory == categoryId then
            activeCategory = nil
        else
            activeCategory = categoryId
        end

        if owner.GetActiveQuality and owner:GetActiveQuality() then
            owner:SetActiveQuality()
        end
        
        self:UpdateButtons()
        if owner.OrganizeFrame then
            owner:OrganizeFrame(true)
        end
        self:ApplyFilter()
    end

    function Module:Refresh()
        if not owner.frame:IsVisible() then
            self:Hide(); return
        end
        self:UpdateButtons()
        self:ApplyFilter()
    end

    function Module:Hide()
        buttonFrame:Hide()
    end

    -- 在OneViewCategory模块的UpdateButtons函数中做类似修改：
function Module:UpdateButtons()
    if not owner.frame:IsVisible() then
        self:Hide()
        return
    end
    
    -- 检查全局开关 - 从 OneBag 数据库获取
    local filterVisible = true
    if OneBag and OneBag.db and OneBag.db.profile then
        filterVisible = OneBag.db.profile.filterModulesVisible
    end
    if not filterVisible then
        buttonFrame:Hide()
        return
    end
    
    -- 只检查背包侧边栏是否显示
    if owner.frame.bagFrame and (owner.frame.bagFrame:IsVisible() or owner.frame.bagFrame.wasShown) then
        buttonFrame:Hide()
        return
    end
    
    buttonFrame:Show()
    
    for i, btn in ipairs(buttons) do
        if activeCategory == btn.categoryId then
            btn.border:Show()
        else
            btn.border:Hide()
        end
    end
    
    if owner.OrganizeFrame then
        owner:OrganizeFrame(true)
    end
    self:ApplyFilter()
end

    function Module:BuildCountTable()
        local t = {}
        for _, bagID in ipairs(owner.fBags) do
            local bagFrame = owner.frame.bags[bagID]
            if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                for slot = 1, bagFrame.size do
                    local itemId = owner.storage:SlotInfo(owner.faction, owner.charId, bagID, slot)
                    if itemId then
                        local cat = self:GetItemCategory(itemId)
                        t[cat] = (t[cat] or 0) + 1
                    end
                end
            end
        end
        return t
    end

    function Module:GetItemCategory(itemId)
        if not itemId then return "misc" end
        local name, _, quality, _, itemType, subType = GetItemInfo(itemId)
        if not name then return "misc" end

        if itemType == "Quest" or itemType == "任务" or itemType == "Key" or itemType == "钥匙" then return "quest" end
        if itemType == "Armor" or itemType == "护甲" or itemType == "Weapon" or itemType == "武器" then return "equipment" end
        if itemType == "Consumable" or itemType == "消耗品" or itemType == "Food" or itemType == "食物" or itemType == "Potion" or itemType == "药水" or itemType == "烹饪" then return "consumable" end
        if itemType == "Trade Goods" or itemType == "商业" or itemType == "商品" or itemType == "商业技能" or itemType == "交易商品" or itemType == "Recipe" or itemType == "配方" or itemType == "食谱" then return "tradeskill" end
        if itemType == "Reagent" or itemType == "材料" then return "reagent" end
        if itemType == "Container" or itemType == "容器" or itemType == "Quiver" or itemType == "箭袋" then return "container" end
        if itemType == "Projectile" or itemType == "弹药" then return "projectile" end
        if quality == 0 then return "misc" end
        return "misc"
    end

    function Module:CountCategoryItems(categoryId)
        local counts = self:BuildCountTable()
        return counts[categoryId] or 0
    end

    function Module:ApplyFilter()
        local categoryId = self:GetActiveCategory()
        if not categoryId then
            for _, bagID in ipairs(owner.fBags) do
                local bagFrame = owner.frame.bags[bagID]
                if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                    for slot = 1, bagFrame.size do
                        local btn = bagFrame[slot]
                        if btn then
                            btn:SetAlpha(1)
                        end
                    end
                end
            end
            return
        end

        for _, bagID in ipairs(owner.fBags) do
            local bagFrame = owner.frame.bags[bagID]
            if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                for slot = 1, bagFrame.size do
                    local btn = bagFrame[slot]
                    if btn then
                        local itemId = owner.storage:SlotInfo(owner.faction, owner.charId, bagID, slot)
                        if itemId and self:GetItemCategory(itemId) == categoryId then
                            btn:SetAlpha(1)
                        else
                            btn:SetAlpha(0.25)
                        end
                    end
                end
            end
        end
    end

    function Module:GetActiveCategory() return activeCategory end

    function Module:SetActiveCategory() 
        activeCategory = nil 
        self:ApplyFilter()
    end

    return Module
end

-- 为OneView创建专用的品质模块
function CreateOneViewQualityModule(name)
    local Module = OneCore:NewModule(name, "AceEvent-2.0")
    local L = AceLocale and AceLocale:GetInstance("OneBag") or setmetatable({}, {__index = function(self, key) return key end})

    local QUALITY_LIST = {
        { id = 5, name = "传说", color = { r = 1, g = 0.5, b = 0 }, priority = 5 },
        { id = 4, name = "史诗", color = { r = 0.5, g = 0, b = 0.5 }, priority = 4 },
        { id = 3, name = "精良", color = { r = 0, g = 0.5, b = 1 }, priority = 3 },
        { id = 2, name = "优秀", color = { r = 0, g = 1, b = 0 }, priority = 2 },
        { id = 1, name = "普通/粗糙", color = { r = 1, g = 1, b = 1 }, priority = 1 },
    }

    local owner
    local buttonFrame
    local buttons
    local activeQuality

    function Module:Embed(parent)
        owner = parent
        self:CreateUI()
        self:RegisterEvents()
    end

    function Module:CreateUI()
        buttonFrame = CreateFrame("Frame", nil, owner.frame)
        buttonFrame:SetWidth(120)  
        buttonFrame:SetHeight(16)  
        buttonFrame:SetPoint("TOPLEFT", owner.frame, "TOPLEFT", 8, -36)
        buttonFrame:SetFrameStrata("DIALOG")
        buttonFrame:SetFrameLevel(owner.frame:GetFrameLevel()+100)
        buttonFrame:Hide()

        buttons = {}
        for i, info in ipairs(QUALITY_LIST) do
            local btn = CreateFrame("CheckButton", nil, buttonFrame)
            btn:SetWidth(21)  
            btn:SetHeight(21)  
            btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            btn:SetFrameLevel(buttonFrame:GetFrameLevel() + 1)
            if i == 1 then
                btn:SetPoint("LEFT", buttonFrame, "LEFT", 0, 0)
            else
                btn:SetPoint("LEFT", buttons[i - 1], "RIGHT", 1, 0) 
            end

            btn.bg = btn:CreateTexture(nil, "BACKGROUND")
            btn.bg:SetAllPoints()
            btn.bg:SetTexture("Interface\\AddOns\\OneBag\\media\\BagSlot3")
            btn.bg:SetVertexColor(info.color.r, info.color.g, info.color.b, 1)
            btn.bg:SetAlpha(0.6)

            btn.border = btn:CreateTexture(nil, "OVERLAY")
            btn.border:SetAllPoints()
            btn.border:SetTexture("Interface\\AddOns\\OneBag\\media\\Border")
            btn.border:SetBlendMode("ADD")

            btn.highlightBorder = btn:CreateTexture(nil, "OVERLAY")
            btn.highlightBorder:SetAllPoints()
            btn.highlightBorder:SetTexture("Interface\\AddOns\\OneBag\\media\\Border")
            btn.highlightBorder:SetBlendMode("ADD")
            btn.highlightBorder:SetVertexColor(1, 0.8, 0, 1)
            btn.highlightBorder:Hide()

            btn.highlight = btn:CreateTexture(nil, "HIGHLIGHT")
            btn.highlight:SetAllPoints()
            btn.highlight:SetTexture("Interface\\AddOns\\OneBag\\media\\BagSlot3")
            btn.highlight:SetBlendMode("ADD")
            btn.highlight:SetVertexColor(1, 1, 1, 0.5)

            btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            btn.text:SetPoint("CENTER", btn, "CENTER", 0, 0)
            btn.text:SetText(string.sub(info.name, 1, 1))
            btn.text:SetTextColor(1, 1, 1)
            btn.text:SetShadowOffset(1, -1)
            btn.text:SetShadowColor(0, 0, 0, 0.8)

            btn.qualityId = info.id
            btn.qualityName = info.name
            btn.qualityColor = info.color

            btn:SetScript("OnClick", function(_, btnName)
                if btnName == "RightButton" then
                    self:OnClick(nil)
                else
                    self:OnClick(btn.qualityId)
                end
            end)

            btn:SetScript("OnEnter", function()
                GameTooltip:SetOwner(btn, "ANCHOR_TOP")
                GameTooltip:SetText(btn.qualityName, btn.qualityColor.r, btn.qualityColor.g, btn.qualityColor.b)
                GameTooltip:AddLine(format("装备数量: %d", self:CountCategoryItems(btn.qualityId)), 0.7, 0.7, 0.7)
                GameTooltip:AddLine("点击：筛选该品质", 0, 1, 0)
                GameTooltip:AddLine("再点：取消筛选", 1, 1, 0)
                GameTooltip:Show()
            end)

            btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

            buttons[i] = btn
        end
    end

    function Module:RegisterEvents()
        self:RegisterEvent("PLAYER_ENTERING_WORLD", function() self:Refresh() end)
    end

    function Module:OnClick(qualityId)
        if activeQuality == qualityId then
            activeQuality = nil
        else
            activeQuality = qualityId
        end

        if owner.GetActiveCategory and owner:GetActiveCategory() then
            owner:SetActiveCategory()
        end

        self:UpdateButtons()
        if owner.OrganizeFrame then
            owner:OrganizeFrame(true)
        end
        self:ApplyFilter()
    end

    function Module:Refresh()
        if not owner.frame:IsVisible() then
            self:Hide(); return
        end
        self:UpdateButtons()
        self:ApplyFilter()
    end

    function Module:Hide()
        buttonFrame:Hide()
    end

   function Module:UpdateButtons()
    if not owner.frame:IsVisible() then
        self:Hide()
        return
    end
    
    -- Quality模块始终显示，不检查全局开关
    -- 只检查背包侧边栏是否显示
    if owner.frame.bagFrame and (owner.frame.bagFrame:IsVisible() or owner.frame.bagFrame.wasShown) then
        buttonFrame:Hide()
        return
    end
    
    buttonFrame:Show()
    
    for i, btn in ipairs(buttons) do
        btn.highlightBorder:Hide()
        btn.bg:SetAlpha(0.6)
        if activeQuality == btn.qualityId then
            btn.highlightBorder:Show()
            btn.bg:SetAlpha(1)
        end
    end
    
    if owner.OrganizeFrame then
        owner:OrganizeFrame(true)
    end
    self:ApplyFilter()
end

    function Module:BuildCountTable()
        local t = {}
        for _, bagID in ipairs(owner.fBags) do
            local bagFrame = owner.frame.bags[bagID]
            if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                for slot = 1, bagFrame.size do
                    local itemId = owner.storage:SlotInfo(owner.faction, owner.charId, bagID, slot)
                    if itemId then
                        local _, _, quality = GetItemInfo(itemId)
                        local cat = (quality == 0 and 1) or quality
                        t[cat] = (t[cat] or 0) + 1
                    end
                end
            end
        end
        return t
    end

    function Module:CountCategoryItems(qualityId)
        local counts = self:BuildCountTable()
        return counts[qualityId] or 0
    end

    function Module:ApplyFilter()
        local qualityId = self:GetActiveQuality()
        if not qualityId then
            for _, bagID in ipairs(owner.fBags) do
                local bagFrame = owner.frame.bags[bagID]
                if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                    for slot = 1, bagFrame.size do
                        local btn = bagFrame[slot]
                        if btn then
                            btn:SetAlpha(1)
                        end
                    end
                end
            end
            return
        end

        for _, bagID in ipairs(owner.fBags) do
            local bagFrame = owner.frame.bags[bagID]
            if bagFrame and type(bagFrame) == "table" and bagFrame.size and bagFrame.size > 0 then
                for slot = 1, bagFrame.size do
                    local btn = bagFrame[slot]
                    if btn then
                        local itemId = owner.storage:SlotInfo(owner.faction, owner.charId, bagID, slot)
                        if itemId then
                            local _, _, quality = GetItemInfo(itemId)
                            local match = (qualityId == 1 and (quality == 0 or quality == 1)) or (quality == qualityId)
                            if match then
                                btn:SetAlpha(1)
                            else
                                btn:SetAlpha(0.25)
                            end
                        else
                            btn:SetAlpha(0.25)
                        end
                    end
                end
            end
        end
    end

    function Module:GetActiveQuality() return activeQuality end

    function Module:SetActiveQuality() 
        activeQuality = nil 
        self:ApplyFilter()
    end

    return Module
end

function OneCore:OnInitialize()
    self:Hook("BankFrame_OnEvent", function(event) 
        if self:HasModule("OneBank") then
            local module = self:GetModule("OneBank")
            if not module or not module:IsActive() then
                self.hooks.BankFrame_OnEvent.orig(event)
            end
        end
    end)
    
    self:Hook("GetContainerNumSlots", function(id)
        if not id then error("Usage is GetContainerNumSlots(bagID)", 2) end
        if id == -2 then
            return GetKeyRingSize()
        else
            return self.hooks.GetContainerNumSlots.orig(id)
        end
    end)
    
    self.modulePrototype.colWidth = 39
    self.modulePrototype.rowHeight = 39
    self.modulePrototype.topBorder = 24
    self.modulePrototype.bottomBorder = 24
    self.modulePrototype.rightBorder = 5
    self.modulePrototype.leftBorder = 8
    self.modulePrototype.stratas = {"LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG", "TOOLTIP"}
end

function OneCore:GetDefaults()
    if not self.defaults then
        self.defaults = {
            cols = 8,
            scale = 1,
            alpha = 1,
            colors = {
                mouseover = {r = 0, g = .7, b = 1},
                ammo = {r = 1, g = 1, b = 0},
                soul = {r = .5, g = .5, b = 1},
                prof = {r = 1, g = 0, b = 1},
                bground = {r = 0, g = 0, b = 0, a = .45},
                glow = false,
                rarity = true,
            },
            show = {['*'] = true},
            strata = 3,
            locked = false,
            clamped = true,
            bagBreak = false,
            vAlign = L["Top"] or "Top",
        }
    end
    return self.defaults
end

function OneCore:GetFreshOptionsTable(module)
    local self = module
    return {
        type="group", 
        args = {
            frame = {
                name = L["Frame"], type = 'group',
                desc = L["Frame Options"], order = 2,
                args = {
                    cols = { 
                        name = L["Columns"], type = "range", step = 1,
                        desc = L["Sets the number of columns to use"], 
                        get = function() return self.db.profile.cols end, 
                        set = function(num) 
                            self.db.profile.cols = num
                            self:OrganizeFrame(true)
                        end, 
                        min = 5, max = 32,
                    },
                    scale = { 
                        name = L["Scale"], type = "range", 
                        desc = L["Sets the scale of the frame"], 
                        get = function() return self.db.profile.scale end, 
                        set = function(num) 
                            self.db.profile.scale = num
                            self.frame:SetScale(num)
                            if self.frame.bagFrame then
                                self.frame.bagFrame:SetScale(num)
                            end
                        end, 
                        min = .2, max = 2, isPercent = true,
                    },
                    strata = { 
                        name = L["Strata"], type = "range", 
                        desc = L["Sets the strata of the frame"], 
                        get = function() return self.db.profile.strata end, 
                        set = function(num) 
                            self.db.profile.strata = num
                            self.frame:SetFrameStrata(self.stratas[num])
                            if self.frame.bagFrame then
                                self.frame.bagFrame:SetFrameStrata(self.stratas[num])
                            end
                            StackSplitFrame:SetFrameStrata(self.stratas[num+1])
                        end, 
                        min = 1, max = 5, step = 1,
                    },
                    bagbreak = { 
                        name = L["Bag Break"], type = "toggle",
                        desc = L["Sets wether to start a new row at the beginning of a bag."], 
                        get = function() return self.db.profile.bagBreak end, 
                        set = function(value) 
                            self.db.profile.bagBreak = value
                            self:OrganizeFrame(true)
                        end, 
                    },
                    valign = { 
                        name = L["Vertical Alignment"], type = "text",
                        desc = L["Sets wether to have the extra spaces on the top or bottom."], 
                        get = function() return self.db.profile.vAlign end, 
                        set = function(value) 
                            self.db.profile.vAlign = value
                            self:OrganizeFrame(true)
                        end,
                        validate = {L["Top"], L["Bottom"]}
                    },
                    alpha = { 
                        name = L["Alpha"], type = "range", 
                        desc = L["Sets the alpha of the frame"], 
                        get = function() return self.db.profile.alpha end, 
                        set = function(num) 
                            self.db.profile.alpha = num
                            self.frame:SetAlpha(num)
                            if self.frame.bagFrame then
                                self.frame.bagFrame:SetAlpha(num)
                            end
                        end, 
                        min = .05, max = 1, isPercent = true,
                    },
                    locked = {
                        name = L["Locked"], type = 'toggle',
                        desc = L["Toggles the ability to move the frame"],
                        get = function() return self.db.profile.locked end,
                        set = function(v) self.db.profile.locked = v end,
                    },
                    clamped = {
                        name = L["Clamped"], type = 'toggle',
                        desc = L["Toggles the ability to drag the frame off screen."],
                        get = function() return self.db.profile.clamped end,
                        set = function(v) 
                            self.db.profile.clamped = v 
                            if self.frame then
                                self.frame:SetClampedToScreen(v)
                            end
                            if self.frame and self.frame.bagFrame then
                                self.frame.bagFrame:SetClampedToScreen(v)
                            end
                        end,
                    }, 
                }
            },
            show = {
                name = L["Show"], type = 'group', order = 3,
                desc = L["Various Display Options"],
                args = {
                    counts = {
                        name = L["Counts"], type = 'toggle', order = 1,
                        desc = L["Toggles showing the counts for special bags."],
                        get = function() return self.db.profile.show.counts end,
                        set = function(v) 
                            self.db.profile.show.counts = v 
                            if self.DoBankSlotCounts then
                                self:DoBankSlotCounts()
                                self:DoInventorySlotCounts()
                            else
                                self:DoSlotCounts()
                            end
                        end,
                    },
                    direction = {
                        cmdName = L["Direction"], guiName = L["Forward"], type = 'toggle', order = 2,
                        desc = L["Toggles direction the bags are shown"],
                        get = function() return self.db.profile.show.direction end,
                        set = function(v) 
                            self.db.profile.show.direction = v 
                            self:OrganizeFrame(true)
                        end,
                        map = {[false] = L["|cffff0000Reverse|r"], [true] = L["|cff00ff00Forward|r"]}
                    },
                    ammo = {
                        name = L["Ammo Bag"], type = 'toggle', order = 3,
                        desc = L["Turns display of ammo bags on and off."],
                        get = function() return self.db.profile.show.ammo end,
                        set = function(v) 
                            self.db.profile.show.ammo = v 
                            self:OrganizeFrame(true)
                        end,
                    },
                    soul = {
                        name = L["Soul Bag"], type = 'toggle', order = 4,
                        desc = L["Turns display of soul bags on and off."],
                        get = function() return self.db.profile.show.soul end,
                        set = function(v) 
                            self.db.profile.show.soul = v 
                            self:OrganizeFrame(true)
                        end,
                    },
                    prof = {
                        name = L["Profession Bag"], type = 'toggle', order = 4.5,
                        desc = L["Turns display of profession bags on and off."],
                        get = function() return self.db.profile.show.prof end,
                        set = function(v) 
                            self.db.profile.show.prof = v 
                            self:OrganizeFrame(true)
                        end,
                    },
                   filtermodules = {
                        name = L["Category Filters"] , type = 'toggle', order = 100,
                        desc = L["Toggles visibility of category filter modules"] ,
                        get = function() 
                            -- 从OneBag数据库获取设置
                            if OneBag and OneBag.db and OneBag.db.profile then
                                return OneBag.db.profile.filterModulesVisible
                            end
                            return true  -- 默认显示
                        end,
                        set = function(v) 
                            ToggleFilterModulesVisibility(v)
                        end,
                    },
                }
            },
            colors = {
                name = L["Colors"], type = 'group', order = 1,
                desc = L["Different color code settings."],
                args = {
                    mouseover = {
                        name = L["Mouseover Color"], type = "color", order = 1,
                        desc = L["Changes the highlight color for when you mouseover a bag slot."],
                        get = function() local color = self.db.profile.colors.mouseover; return color.r, color.g, color.b end,
                        set = function(r, g, b) self.db.profile.colors.mouseover = {r = r, g = g, b = b} end,
                    },
                    ammo = {
                        name = L["Ammo Bag Color"], type = "color", order = 2,
                        desc = L["Changes the highlight color for Ammo Bags."],
                        get = function() local color = self.db.profile.colors.ammo; return color.r, color.g, color.b end, 
                        set = function(r, g, b) 
                            self.db.profile.colors.ammo = {r = r, g = g, b = b} 
                            for k, bag in self.fBags do
                                if self.frame.bags[bag] then
                                    for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
                                end
                            end
                        end,
                    },
                    soul = {
                        name = L["Soul Bag Color"], type = "color", order = 3,
                        desc = L["Changes the highlight color for Soul Bags."],
                        get = function() local color = self.db.profile.colors.soul; return color.r, color.g, color.b end,
                        set = function(r, g, b) 
                            self.db.profile.colors.soul = {r = r, g = g, b = b} 
                            for k, bag in self.fBags do
                                if self.frame.bags[bag] then
                                    for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
                                end
                            end
                        end,
                    },
                    prof = {
                        name = L["Profession Bag Color"], type = "color", order = 4,
                        desc = L["Changes the highlight color for Profession Bags."],
                        get = function() local color = self.db.profile.colors.prof; return color.r, color.g, color.b end,
                        set = function(r, g, b) 
                            self.db.profile.colors.prof = {r = r, g = g, b = b} 
                            for k, bag in self.fBags do
                                if self.frame.bags[bag] then
                                    for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
                                end
                            end
                        end,
                    },
                    background = {
                        name = L["Background Color"], type = "color", order = 5,
                        desc = L["Changes the background color for the frame."],
                        get = function() local color = self.db.profile.colors.bground; return color.r, color.g, color.b, color.a end,
                        set = function(r, g, b, a) 
                            self.db.profile.colors.bground = {r = r, g = g, b = b, a = a} 
                            self.frame:SetBackdropColor(r, g, b, a)
                            if self.frame.bagFrame then
                                self.frame.bagFrame:SetBackdropColor(r, g, b, a)
                            end
                        end, hasAlpha = true,
                    },
                    glow = {
                        name = L["Highlight Glow"], type = 'toggle', order = 6,
                        desc = L["Turns hightlight glow on and off."],
                        get = function() return self.db.profile.colors.glow end,
                        set = function(v) 
                            self.db.profile.colors.glow = v 
                            for k, bag in self.fBags do
                                if self.frame.bags[bag] then
                                    for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
                                end
                            end
                        end,
                    },
                    rarity = {
                        name = L["Rarity Coloring"], type = 'toggle', order = 7,
                        desc = L["Turns rarity coloring on and off."],
                        get = function() return self.db.profile.colors.rarity end,
                        set = function(v) 
                            self.db.profile.colors.rarity = v 
                            for k, bag in self.fBags do
                                if self.frame.bags[bag] then
                                    for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
                                end
                            end
                        end,
                    },
                    reset = {
                        name = L['Reset'], type = 'group', order = -1,
                        desc = L["Reset the different colors."],
                        args = {
                            mouseover = {
                                name = L["Mouseover Color"], type = "execute",
                                desc = L["Returns your mouseover color to the default."],
                                func = function() self.db.profile.colors.mouseover = {r = 0, g = .7, b = 1} end, order = 1
                            },
                            ammo = {
                                name = L["Ammo Slot Color"], type = "execute",
                                desc = L["Returns your ammo slot color to the default."],
                                func = function() 
                                    self.db.profile.colors.ammo = {r = 1, g = 1, b = 0}
                                    for k, bag in self.fBags do
                                        if self.frame.bags[bag] then
                                            for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
                                        end
                                    end
                                end, order = 2
                            },
                            soul = {
                                name = L["Soul Slot Color"], type = "execute",
                                desc = L["Returns your soul slot color to the default."],
                                func = function() 
                                    self.db.profile.colors.soul = {r = .5, g = .5, b = 1}
                                    for k, bag in self.fBags do
                                        if self.frame.bags[bag] then
                                            for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
                                        end
                                    end
                                end, order = 3
                            },
                            prof = {
                                name = L["Profession Slot Color"], type = "execute",
                                desc = L["Returns your profession slot color to the default."],
                                func = function() 
                                    self.db.profile.colors.prof = {r = 1, g = 0, b = 1}
                                    for k, bag in self.fBags do
                                        if self.frame.bags[bag] then
                                            for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
                                        end
                                    end
                                end, order = 4
                            },
                            background = {
                                name = L["Background"], type = "execute",
                                desc = L["Returns your frame background to the default."],
                                func = function() 
                                    self.db.profile.colors.bground = {r = 0, g = 0, b = 0, a = .45}  
                                    self.frame:SetBackdropColor(0, 0, 0, .45)
                                    if self.frame.bagFrame then self.frame.bagFrame:SetBackdropColor(0, 0, 0, .45) end
                                end, order = 5
                            }
                        }
                    }
                }
            }
        }
    }   
end

function OneCore:LoadOptionalCommands(baseArgs, module)
    local self = module
    if IsAddOnLoaded("MrPlow") then
        baseArgs.args.plow = {
            name = L["Plow!"], type = "execute",
            desc = L["Organizes your bags."],
            func = function() self:MrPlow() end, order = -6,
            notes = L["- Note: This option only appears if you have MrPlow installed"]
        }
    end
end

function OneCore:LoadLocaleCommands(baseArgs, module, bL)
    local self, values = module, {}
    for k, v in pairs(bL:GetLocaleList()) do tinsert(values, v) end
    tinsert(values, "None")
    baseArgs.args.Locale = {
        name = L["Pick Locale"], type = "text",
        desc = L["Sets the locale to use.  Will not take effect until you reload your UI."], 
        get = function() return self.db.profile.locale or "None" end, 
        set = function(value) 
            if value == "None" then value = nil end
            self.db.profile.locale = value
            L:SetLocale(value or true)
            self:TriggerEvent(string.format("%s_Locale_Changed", tostring(self)), value or true)
        end, order = -5, validate = values
    }
end

function OneCore:CopyTable(from, into)
    if type(into) ~= "table" then into = {} end
    for key, val in from do
        if type(val) == "table" then into[key] = self:CopyTable(val) else into[key] = val end
    end
    if getn(from) then table.setn(into, getn(from)) end
    return into
end

local module = OneCore.modulePrototype

function module:BuildFrame()
    if self.isBank then
        if not self.frame.bags[BANK_CONTAINER] then 
            self.frame.bags[BANK_CONTAINER] = CreateFrame("Frame", "BBankFrame", self.frame)
            self.frame.bags[BANK_CONTAINER]:SetID(BANK_CONTAINER)
            self.frame.bags[BANK_CONTAINER].size = 24
            for slot = 1, 24 do
                self.frame.bags[BANK_CONTAINER][slot] = CreateFrame("Button", self.frame.bags[BANK_CONTAINER]:GetName().."Item"..slot, self.frame.bags[BANK_CONTAINER], "OneBankItemButtonTemplate")
                self.frame.bags[BANK_CONTAINER][slot]:SetID(slot)
                local button = self.frame.bags[BANK_CONTAINER][slot]
                local moduleRef = self
                button:SetScript("OnMouseDown", function()
                    if arg1 == "MiddleButton" then
                        local bag = this:GetParent():GetID()
                        local slot = this:GetID()
                        local itemLink = GetContainerItemLink(bag, slot)
                        if itemLink then
                            local itemName = string.match(itemLink, "%[(.-)%]")
                            if itemName then
                                if HasItemLock() then
                                    local playerKey = UnitName("player") .. "-" .. GetRealmName()
                                    if ItemLockDB[playerKey] and ItemLockDB[playerKey].lockedItems and ItemLockDB[playerKey].lockedItems[itemName] then
                                        SlashCmdList.ITEMLOCK("remove " .. itemName)
                                    else
                                        SlashCmdList.ITEMLOCK("add " .. itemName)
                                    end
                                    if moduleRef.frame.bags[bag] then
                                        moduleRef:UpdateLockedItems(bag)
                                    end
                                else
                                    DEFAULT_CHAT_FRAME:AddMessage("[OneBag] 请先加载ItemLock插件以使用此功能")
                                end
                            end
                        end
                    end
                end)
            end
            self.needToOrganize = true
        end
    end
    for k, bag in self.fBags do        
        local size = GetContainerNumSlots(bag)
        for slot = 1, size do
            if not self.frame.bags[bag] then 
                self.frame.bags[bag] = CreateFrame("Frame", tostring(self)..bag, self.frame)
                self.frame.bags[bag]:SetID(bag)
            end
            if not self.frame.bags[bag][slot] then
                self.frame.bags[bag][slot] = CreateFrame("Button", tostring(self)..bag.."Item"..slot, self.frame.bags[bag], "OneBagItemButtonTemplate")
                self.frame.bags[bag][slot]:SetID(slot)
                local button = self.frame.bags[bag][slot]
                local moduleRef = self
                button:SetScript("OnMouseDown", function()
                    if arg1 == "MiddleButton" then
                        local bag = this:GetParent():GetID()
                        local slot = this:GetID()
                        local itemLink = GetContainerItemLink(bag, slot)
                        if itemLink then
                            local itemName = string.match(itemLink, "%[(.-)%]")
                            if itemName then
                                if HasItemLock() then
                                    local playerKey = UnitName("player") .. "-" .. GetRealmName()
                                    if ItemLockDB[playerKey] and ItemLockDB[playerKey].lockedItems and ItemLockDB[playerKey].lockedItems[itemName] then
                                        SlashCmdList.ITEMLOCK("remove " .. itemName)
                                    else
                                        SlashCmdList.ITEMLOCK("add " .. itemName)
                                    end
                                    if moduleRef.frame.bags[bag] then
                                        moduleRef:UpdateLockedItems(bag)
                                    end
                                else
                                    DEFAULT_CHAT_FRAME:AddMessage("[OneBag] 请先加载ItemLock插件以使用此功能")
                                end
                            end
                        end
                    end
                end)
                self.needToOrganize = true
            end
        end
        if self.frame.bags[bag] then
            local curBag = self.frame.bags[bag]
            local isAmmo, isSoul, isProf = self:GetBagTypes(bag)
            if curBag.size ~= size or curBag.isAmmo ~= isAmmo or curBag.isSoul ~= isSoul or curBag.isProf ~= isProf then
                self.needToOrganize = true
            end
            curBag.size, curBag.isAmmo, curBag.isSoul, curBag.isProf = size, isAmmo, isSoul, isProf
        end
    end
end

function module:OrganizeFrame(needs)
    if not self.needToOrganize and not needs then return end
    self.needToOrganize = false
    
    local activeQuality = nil
    if self.GetActiveQuality then
        activeQuality = self:GetActiveQuality()
    end
    
    local activeCategory = nil
    if self.GetActiveCategory then
        activeCategory = self:GetActiveCategory()
    end
    
    local cols, curCol, curRow, justinc = self.db.profile.cols, 1, 1, false
    self.soulSlots, self.ammoSlots, self.profSlots, self.slotCount, self.totalCount = 0, 0, 0, 0, 0
    
    for k, bag in self.fBags do 
        if self.frame.bags[bag] then
            for k2, v2 in ipairs(self.frame.bags[bag]) do v2:Show() end
            self.totalCount = self.totalCount + (self.frame.bags[bag].size or 0)
        end
    end
    
    if self.db.profile.vAlign == L["Bottom"] then
        curCol = math.mod(self.totalCount, cols) > 0 and cols - math.mod(self.totalCount, cols) + 1 or 1
        if self.db.profile.bagBreak then
            for k, bag in self.fBags do 
                if self.frame.bags[bag] and self.frame.bags[bag].size then curCol = curCol - 1 end
            end
            curCol = curCol + 1
        end
    end
    
    for k, bag in (self.db.profile.show.direction and self.fBags or self.rBags) do
        local curBag = self.frame.bags[bag]
        if curBag and curBag.size and curBag.size > 0 then
            if bag > 0 and math.mod(self.frame.bags[bag-1] and self.frame.bags[bag-1].size or 0, cols) ~= 0 and self.db.profile.bagBreak then 
                curCol = curCol + 1
                if curCol > cols then curCol, curRow, justinc = 1, curRow + 1, true end
            end
            if curBag.isAmmo then
                self.ammoSlots = self.ammoSlots + curBag.size
            elseif curBag.isSoul then
                self.soulSlots = self.soulSlots + curBag.size
            elseif curBag.isProf then
                self.profSlots = self.profSlots + curBag.size
            else
                self.slotCount = self.slotCount + curBag.size
            end
            if self:ShouldShow(bag, curBag.isAmmo, curBag.isSoul, curBag.isProf) then
                for slot = 1, curBag.size do
                    justinc = false
                    curBag[slot]:ClearAllPoints()
                    curBag[slot]:SetPoint("TOPLEFT", self.frame:GetName(), "TOPLEFT", self.leftBorder + (self.colWidth * (curCol - 1)) , 0 - self.topBorder - (self.rowHeight * curRow))
                    curBag[slot]:Show()                
                    curCol = curCol + 1
                    if curCol > cols then curCol, curRow, justinc = 1, curRow + 1, true end
                end
            end
        end
    end
    
    if not justinc then curRow = curRow + 1 end
    self.frame:SetHeight(curRow * self.rowHeight + self.bottomBorder + self.topBorder) 
    self.frame:SetWidth(cols * self.colWidth + self.leftBorder + self.rightBorder)
    
    if activeQuality and self.GetActiveQuality then
        self:ApplyFilter()
    end
    
    if activeCategory and self.GetActiveCategory then
        self:ApplyFilter()
    end
end

function module:SetBorderColor(slot)
    local color = {r = 1, g = 1, b = 1}
    local bag = slot:GetParent()
    local special = false
    if bag.isAmmo then 
        color = self.db.profile.colors.ammo
        special = true
    elseif bag.isSoul then
        color = self.db.profile.colors.soul
        special = true
    elseif bag.isProf then
        color = self.db.profile.colors.prof
        special = true
    elseif self.db.profile.colors.rarity then
        local _, _, hex = strfind(GetContainerItemLink(bag:GetID(), slot:GetID()) or "", "(|cff%x%x%x%x%x%x)")
        for k, v in ipairs(ITEM_QUALITY_COLORS) do
            if hex == v.hex then 
                color = v 
                if k > 1 then special = true end
            end
        end
    end
    
    if special and self.db.profile.colors.glow then        
        slot:SetNormalTexture("Interface\\Buttons\\UI-ActionButton-Border")
        slot:GetNormalTexture():SetBlendMode("ADD")
        slot:GetNormalTexture():SetAlpha(.8)
        slot:GetNormalTexture():SetPoint("CENTER", slot:GetName(), "CENTER", 0, 1)
    elseif special then
        slot:SetNormalTexture("Interface\\AddOns\\OneBag\\media\\BagSlot2")
        slot:GetNormalTexture():SetBlendMode("BLEND")
        slot:GetNormalTexture():SetPoint("CENTER", slot:GetName(), "CENTER", 0, 0)
    else
        slot:SetNormalTexture("Interface\\AddOns\\OneBag\\media\\BagSlot")
        slot:GetNormalTexture():SetBlendMode("BLEND")
        slot:GetNormalTexture():SetPoint("CENTER", slot:GetName(), "CENTER", 0, 0)
    end
    slot:GetNormalTexture():SetVertexColor(color.r, color.g, color.b)
end

function module:UpdateLockedItems(bag)
    if not HasItemLock() then return end
    
    if not self.frame.bags[bag] then return end
    
    for slot = 1, self.frame.bags[bag].size do
        local button = self.frame.bags[bag][slot]
        if button then
            local isLocked = self:IsItemLocked(bag, slot)
            
            local lockIcon = button.LockIcon
            if isLocked then
                if not lockIcon then
                    lockIcon = button:CreateTexture(nil, "OVERLAY")
                    lockIcon:SetTexture("Interface\\AddOns\\OneBag\\media\\fashu")
                    lockIcon:SetWidth(16)
                    lockIcon:SetHeight(16)
                    lockIcon:SetPoint("TOPLEFT", button, "TOPLEFT", 2, -2)
                    lockIcon:SetAlpha(0.8)
                    button.LockIcon = lockIcon
                end
                lockIcon:Show()
            elseif lockIcon then
                lockIcon:Hide()
            end
        end
    end
end

-- 添加任务标志函数
function module:UpdateQuestItems(bag)
    if not self.frame.bags[bag] then return end
    
    for slot = 1, self.frame.bags[bag].size do
        local button = self.frame.bags[bag][slot]
        if button then
            local link = GetContainerItemLink(bag, slot)
            if link then
                local _, _, id = strfind(link, "item:(%d+)")
                if id then
                    local name, _, quality, _, itemType = GetItemInfo(id)
                    if name then
                        -- 检查是否是任务物品
                        local isQuestItem = (itemType == "Quest" or itemType == "任务" or itemType == "Key" or itemType == "钥匙")
                        
                        -- 获取或创建任务标志
                        local questIcon = button.QuestIcon
                        if isQuestItem then
                            if not questIcon then
                                questIcon = button:CreateTexture(nil, "OVERLAY")
                                questIcon:SetTexture("Interface\\AddOns\\OneBag\\media\\questicon") -- 假设您有一个任务感叹号图标
                                questIcon:SetWidth(16)
                                questIcon:SetHeight(16)
                                questIcon:SetPoint("TOPLEFT", button, "TOPLEFT", 2, -2)
                                questIcon:SetAlpha(0.9)
                                button.QuestIcon = questIcon
                            end
                            questIcon:Show()
                            
                            -- 如果有锁定图标，调整位置避免重叠
                            local lockIcon = button.LockIcon
                            if lockIcon and lockIcon:IsVisible() then
                                questIcon:SetPoint("TOPLEFT", button, "TOPLEFT", 2, -2)
                                lockIcon:SetPoint("TOPLEFT", button, "TOPLEFT", 18, -2) -- 将锁定图标向右移动
                            end
                        elseif questIcon then
                            questIcon:Hide()
                        end
                    end
                end
            elseif button.QuestIcon then
                button.QuestIcon:Hide()
            end
        end
    end
end

function module:UpdateBag(bag)
    if not self.frame.bags[bag] or not self.frame.bags[bag]:IsVisible() then return end
    self:BuildFrame()
    self:OrganizeFrame()
    if not self.frame.bags[bag].colorLocked then
        for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
    end
    if self.frame.bags[bag].size and self.frame.bags[bag].size > 0 then
        ContainerFrame_Update(self.frame.bags[bag])
    end
    self:DoSlotCounts()

    if HasItemLock() then
        self:UpdateLockedItems(bag)
    end
    
    -- 更新任务物品标志
    self:UpdateQuestItems(bag)

    if self.frame.searchFrame and self.frame.searchFrame.edit:GetText() and self.frame.searchFrame.edit:GetText() ~= "" and self.frame.searchFrame.edit:GetText() ~= L["Search"] then
        self:SearchFilter()
    end
end

function module:IsItemLocked(bag, slot)
    if not HasItemLock() then return false end
    
    local itemLink = GetContainerItemLink(bag, slot)
    if not itemLink then return false end
    
    local itemName = string.match(itemLink, "%[(.-)%]")
    if not itemName then return false end
    
    local playerKey = UnitName("player") .. "-" .. GetRealmName()
    
    if ItemLockDB[playerKey] and ItemLockDB[playerKey].lockedItems then
        return ItemLockDB[playerKey].lockedItems[itemName] or false
    end
    
    return false
end

function module:GetBagTypes(bag)
    if bag <= 0 then return end
    local _, _, id = strfind(GetInventoryItemLink("player", ContainerIDToInventoryID(bag)) or "", "item:(%d+)"); 
    if id then 
        local _, _, _, _, itemType, subType = GetItemInfo(id);
        return (itemType == LC["Quiver"] or false), (subType == LC["Soul Bag"] or false), (( itemType == LC["Container"] and not (subType == LC["Bag"] or subType == LC["Soul Bag"])  ) or false)
    end
end

function module:HighlightBagSlots(bag)
    if not self.frame.bags[bag] then return end
    local color = self.db.profile.colors.mouseover 
    for k, v in ipairs(self.frame.bags[bag]) do 
        if self.db.profile.colors.glow then        
            v:SetNormalTexture("Interface\\Buttons\\UI-ActionButton-Border")
            v:GetNormalTexture():SetBlendMode("ADD")
            v:GetNormalTexture():SetAlpha(.8)
        else
            v:SetNormalTexture("Interface\\AddOns\\OneBag\\media\\BagSlot2")
            v:GetNormalTexture():SetBlendMode("BLEND")
        end
        v:GetNormalTexture():SetVertexColor(color.r, color.g, color.b)
    end
end

function module:UnhighlightBagSlots(bag)
    if not self.frame.bags[bag] then return end
    for k, v in ipairs(self.frame.bags[bag]) do self:SetBorderColor(v) end
end

function module:DoSlotCounts()
    local usedSlots, usedAmmoSlots, usedSoulSlots, usedProfSlots, ammoQuantity = 0, 0, 0, 0, 0 
    for k, bag in self.fBags do
        if self.frame.bags[bag] then
            local tmp, qty = 0, 0
            for slot = 1, GetContainerNumSlots(bag) do
                local texture, itemCount = GetContainerItemInfo(bag, slot);
                if texture then 
                    tmp = tmp + 1 
                    qty = qty + itemCount
                end
            end
            if self.frame.bags[bag].isAmmo then
                usedAmmoSlots = usedAmmoSlots + tmp
                ammoQuantity = ammoQuantity + qty
            elseif self.frame.bags[bag].isSoul then
                usedSoulSlots = usedSoulSlots + tmp
            elseif self.frame.bags[bag].isProf then
                usedProfSlots = usedProfSlots + tmp
            else
                usedSlots = usedSlots + tmp
            end
        end
    end
    local info = 1
    local name = self.frame:GetName() .. "Info"    

getglobal(name .. info):SetText(format(L["%s/%s Slots"], usedSlots, self.slotCount))
    info = info + 1
    for i = 2, 4 do getglobal(name .. i):SetText("") end
    if self.db.profile.show.counts then        
        if self.ammoSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Ammo"], ammoQuantity, self.ammoSlots * 200))
            info = info + 1
        end
        if self.soulSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Soul Shards"], usedSoulSlots, self.soulSlots))
            info = info + 1
        end
        if self.profSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Profession Slots"], usedProfSlots, self.profSlots))
            info = info + 1
        end
    end
end

function module:ShouldShow(bag, isAmmo, isSoul, isProf) 
    local show = true
    show = show and self.db.profile.show[bag] or false
    if isAmmo then
        show = show and self.db.profile.show.ammo or false
    elseif isSoul then
        show = show and self.db.profile.show.soul or false
    elseif isProf then
        show = show and self.db.profile.show.prof or false
    end
    return (show or self.frame.bags[bag].colorLocked )
end

function module:OpenMenu()    
    if self.dewdrop:IsOpen(getglobal(self.frame:GetName() .. "ConfigButton")) then
        self.dewdrop:Close()
    else
        self.dewdrop:Open(getglobal(self.frame:GetName() .. "ConfigButton"), self.frame)
    end
end

function module:MrPlow()
    MrPlow:Works(self.isBank and "bank" or nil)
end

function module:OnBaseShow()
    if not self.frame then return end
    this:SetScale(self.db.profile.scale)
    this:SetAlpha(self.db.profile.alpha)
    this:SetFrameStrata(self.stratas[self.db.profile.strata])
    StackSplitFrame:SetFrameStrata(self.stratas[self.db.profile.strata+1])
    local color = self.db.profile.colors.bground
    this:SetBackdropColor(color.r, color.g, color.b, color.a)
    self.frame:SetClampedToScreen(self.db.profile.clamped or false)
end

function module:OnShow()
    self:OnBaseShow()
    self:OnCustomShow()
    PlaySound("igBackPackOpen")
    if self.frame.bagFrame and self.frame.bagFrame.wasShown then
        self.frame.bagFrame:Show()
        self.frame.bagFrame.wasShown = false
    end
    self:BuildFrame()
    self:OrganizeFrame()
    for k, i in self.fBags do self:UpdateBag(i) end
    if self.frame.bags[-1] and (not self.frame.bags[-1].colorLocked) then
        for k, v in ipairs(self.frame.bags[-1]) do self:SetBorderColor(v) end
    end
    self:DoSlotCounts()

    if self.frame.searchFrame then
        self.frame.searchFrame.edit:SetText(L["Search"])
        self.frame.searchFrame.button:Hide()
    end

    -- 修复：检查背包侧边栏是否可见或即将可见（wasShown），如果是则不显示分类标签页
    local bagFrameVisible = self.frame.bagFrame and (self.frame.bagFrame:IsVisible() or self.frame.bagFrame.wasShown)
    if not bagFrameVisible then
        -- 检查全局开关 - 从 OneBag 数据库获取
        local filterVisible = true
        if OneBag and OneBag.db and OneBag.db.profile then
            filterVisible = OneBag.db.profile.filterModulesVisible
        end
        if filterVisible then
            if OneBagCategory then
                OneBagCategory:UpdateButtons()
            end
            -- Quality模块不做处理
        else
            -- 如果全局开关关闭，隐藏分类标签页
            if OneBagCategory then
                OneBagCategory:Hide()
            end
            -- Quality模块不做处理
        end
    else
        -- 如果背包侧边栏正在显示或即将显示，隐藏分类标签页
        if OneBagCategory then
            OneBagCategory:Hide()
        end
        -- Quality模块不做处理
    end
end

function module:OnCustomShow() end

function module:OnBaseHide()
    if self.dewdrop and self.dewdrop:IsOpen(getglobal(self.frame:GetName() .. "ConfigButton")) then
        self.dewdrop:Close()
    end
end

function module:OnHide()
    self:OnBaseHide()
    self:OnCustomHide()
    PlaySound("igBackPackClose")
    if self.frame.bagFrame and self.frame.bagFrame:IsVisible() then
        self.frame.bagFrame:Hide()
        self.frame.bagFrame.wasShown = true
    end
end

function module:OnCustomHide() end

function module:RegisterDewdrop(baseArgs)
    self.dewdrop = AceLibrary("Dewdrop-2.0")
    self.dewdrop:Register(self.frame, 'children', baseArgs, 'point', function(parent)
        if parent:GetTop() < GetScreenHeight() / 2 then
            return "BOTTOMRIGHT", "TOPRIGHT"
        else
            return "TOPRIGHT", "BOTTOMRIGHT"
        end
    end, 'dontHook', true)
end

function module:CreateSearchFrame()
    if self.frame.searchFrame then return end
    
    local search = CreateFrame("Frame", self.frame:GetName() .. "SearchFrame", self.frame)
    
    search:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 120, -32)  
    search:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", -110, -32)  -- 修改这里：从-115改为-110
    
    search:SetHeight(24)  
    search:SetBackdrop({
        bgFile = 'Interface\\Tooltips\\UI-Tooltip-Background',
        -- edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 5, right = 25, top = 5, bottom = 5 }
    })
    search:SetBackdropBorderColor(1, 1, 1, 1)
    search:SetBackdropColor(0, 0, 0, 0) 
    search.text = search:CreateFontString(nil, "HIGH", "GameTooltipTextSmall")
    local font, size = search.text:GetFont()
    
    search.edit = CreateFrame("EditBox", nil, search)
    search.edit:SetMaxLetters(20)  
    search.edit:SetPoint("LEFT", search, "LEFT", 8, 0)
    search.edit:SetPoint("RIGHT", search, "RIGHT", -30, 0)
    search.edit:SetHeight(20)  
    search.edit:SetFont(font, size, "OUTLINE")
    search.edit:SetAutoFocus(false)
    search.edit:SetText(L["Search"])
    search.edit:SetTextColor(1,1,1,1)
    search.button = CreateFrame("Button", nil, search)   
    search.button:SetWidth(20)
    search.button:SetHeight(20)
    search.button:SetPoint("RIGHT", search, "RIGHT", -5, 0)
    search.button:SetFrameLevel(search:GetFrameLevel() + 2)
    search.button:SetNormalTexture('Interface\\Buttons\\UI-GroupLoot-Pass-Up')
    search.button:SetPushedTexture('Interface\\Buttons\\UI-GroupLoot-Pass-Up')
    search.button:SetHighlightTexture('Interface\\Buttons\\UI-GroupLoot-Pass-Up')
    search.button:EnableMouse(true)
    search.button:RegisterForClicks("LeftButtonUp")
    search.button:Hide()
    self.frame.searchFrame = search
    
    local function resetSearch()
        search.edit:SetText(L["Search"])
        self:ResetSearchFilter()
        search.button:Hide()
    end

    search.edit:SetScript("OnEditFocusGained", function()
        if this:GetText() == L["Search"] then
            this:SetText("")
        end
    end)

    search.edit:SetScript("OnEditFocusLost", function()
        if this:GetText() == "" then
            resetSearch()
        end
    end)

    search.edit:SetScript("OnTabPressed", function()
        this:ClearFocus()
        resetSearch()
    end)

    search.edit:SetScript("OnEscapePressed", function()
        this:ClearFocus()
        resetSearch()
    end)

    search.button:SetScript("OnClick", function()
        search.edit:ClearFocus()
        resetSearch()
    end) 

    search.edit:SetScript("OnTextChanged", function()
        if this:GetText() == L["Search"] then 
            resetSearch()
            return 
        end
        
        if not search.button:IsVisible() then
            search.button:Show()
        end
        
        self:SearchFilter()
    end)
    
    return search
end

function module:SearchFilter()
    local searchText = self.frame.searchFrame.edit:GetText()
    if not searchText or searchText == "" or searchText == L["Search"] then
        self:ResetSearchFilter()
        return
    end
    
    searchText = string.lower(searchText)
    
    for k, bag in self.fBags do
        if self.frame.bags[bag] then
            for slot = 1, self.frame.bags[bag].size do
                local item = self.frame.bags[bag][slot]
                if item and item:IsVisible() then
                    local texture, itemCount, locked = GetContainerItemInfo(bag, slot)
                    if texture then
                        local itemLink = GetContainerItemLink(bag, slot)
                        if itemLink then
                            local itemName = string.gsub(itemLink, ".*%[(.*)%].*", "%1")
                            if string.find(string.lower(itemName), searchText) then
                                item:SetAlpha(1)
                            else
                                item:SetAlpha(0.25)
                            end
                        else
                            item:SetAlpha(0.25)
                        end
                    else
                        item:SetAlpha(0.25)
                    end
                end
            end
        end
    end
end

function module:ResetSearchFilter()
    for k, bag in self.fBags do
        if self.frame.bags[bag] then
            for slot = 1, self.frame.bags[bag].size do
                local item = self.frame.bags[bag][slot]
                if item then
                    item:SetAlpha(1)
                end
            end
        end
    end
end

OneBag = OneCore:NewModule("OneBag", "AceEvent-2.0", "AceHook-2.0", "AceDebug-2.0", "AceConsole-2.0", "AceDB-2.0")
OneBank = OneCore:NewModule("OneBank", "AceEvent-2.0", "AceHook-2.0", "AceDebug-2.0", "AceConsole-2.0", "AceDB-2.0")
OneRing = OneCore:NewModule("OneRing", "AceEvent-2.0", "AceHook-2.0", "AceDebug-2.0", "AceConsole-2.0", "AceDB-2.0")
OneView = OneCore:NewModule("OneView", "AceEvent-2.0", "AceHook-2.0", "AceDebug-2.0", "AceConsole-2.0", "AceDB-2.0")
OneBagButton = OneCore:NewModule("OneBagButton", "AceEvent-2.0")

-- 删除或注释掉文件开始部分的这个函数：
-- function OneBagButton:OnEnable()
--     self:RegisterEvent("SPELLS_CHANGED", "RefreshSpells")
--     self:RegisterEvent("PLAYER_ENTERING_WORLD", "RefreshSpells")
-- end

OneBagCategory = CreateCategoryModule("OneBagCategory")
OneBagQuality = CreateQualityModule("OneBagQuality")
OneBankCategory = CreateCategoryModule("OneBankCategory")
OneBankQuality = CreateQualityModule("OneBankQuality")

-- 为OneView创建专用的分类和品质模块
OneViewCategory = CreateOneViewCategoryModule("OneViewCategory")
OneViewQuality = CreateOneViewQualityModule("OneViewQuality")

function OneBag:OnInitialize()
    self:RegisterDB("OneBagDB")
    if self.db.profile.locale then L:SetLocale(self.db.profile.locale) else L:SetLocale(true) end
    self:RegisterDefaults('profile', OneCore:GetDefaults())
    
    -- 初始化过滤模块显示状态设置
    if self.db.profile.filterModulesVisible == nil then
        self.db.profile.filterModulesVisible = true  -- 默认显示
    end
    FILTER_MODULES_VISIBLE = self.db.profile.filterModulesVisible
    
    local baseArgs = OneCore:GetFreshOptionsTable(self)
    local customArgs = {
        ["0"] = {
            name = L["Backpack"], type = 'toggle', order = 5,
            desc = L["Turns display of your backpack on and off."],
            get = function() return self.db.profile.show[0] end,
            set = function(v) 
                self.db.profile.show[0] = v 
                self:OrganizeFrame(true)
            end,
        },
        ["1"] = {
            name = L["First Bag"], type = 'toggle', order = 6,
            desc = L["Turns display of your first bag on and off."],
            get = function() return self.db.profile.show[1] end,
            set = function(v) 
                self.db.profile.show[1] = v 
                self:OrganizeFrame(true)
            end,
        },
        ["2"] = {
            name = L["Second Bag"], type = 'toggle', order = 7,
            desc = L["Turns display of your second bag on and off."],
            get = function() return self.db.profile.show[2] end,
            set = function(v) 
                self.db.profile.show[2] = v 
                self:OrganizeFrame(true)
            end,
        },
        ["3"] = {
            name = L["Third Bag"], type = 'toggle', order = 8,
            desc = L["Turns display of your third bag on and off."],
            get = function() return self.db.profile.show[3] end,
            set = function(v) 
                self.db.profile.show[3] = v 
                self:OrganizeFrame(true)
            end,
        },
        ["4"] = {
            name = L["Fourth Bag"], type = 'toggle', order = 9,
            desc = L["Turns display of your fourth bag on and off."],
            get = function() return self.db.profile.show[4] end,
            set = function(v) 
                self.db.profile.show[4] = v 
                self:OrganizeFrame(true)
            end,
        },
    }
    OneCore:CopyTable(customArgs, baseArgs.args.show.args)
    OneCore:LoadOptionalCommands(baseArgs, self)
    OneCore:LoadLocaleCommands(baseArgs, self, L)
    self:RegisterChatCommand({"/ob", "/OneBag"}, baseArgs, string.upper(self.title))
    self.fBags = {0, 1, 2, 3, 4}
    self.rBags = {4, 3, 2, 1, 0}
    OneBagFrameName:SetText(L["Bags"])
    self.frame = OneBagFrame
    self.frame.handler = self
    self.frame.bagFrame = OBBagFram
    self.frame.bagFrame.handler = self
    self.frame.bags = {}
    self:RegisterDewdrop(baseArgs)
    OneBagFramepackupButton:Hide()
    
    self:CreateSearchFrame()
    
    OneBagCategory:Embed(self)
    OneBagQuality:Embed(self)
end

function OneBag:OnEnable()    
    self:Hook("IsBagOpen")
    self:Hook("ToggleBag")
    self:Hook("OpenBag")
    self:Hook("CloseBag")
    self:Hook("OpenBackpack", "OpenBag")
    self:Hook("CloseBackpack", "CloseBag")
    self:Hook("ToggleBackpack", "ToggleBag")
    
    local openEvents = {"BANKFRAME_OPENED", "MERCHANT_SHOW",}
    local closeEvents = {"BANKFRAME_CLOSED", "MERCHANT_CLOSED"}
    
    for _, event in ipairs(openEvents) do
        self:RegisterEvent(event, function() self:OpenBag() end)
    end
    for _, event in ipairs(closeEvents) do
        self:RegisterEvent(event, function() self:CloseBag() end)
    end
    
    self:RegisterEvent(string.format("%s_Locale_Changed", tostring(self)), "UpdateLocale")
end

function OneBag:OnDisable()
    for id=1, 12 do
        local frame = getglobal("ContainerFrame"..id)
        frame:ClearAllPoints()
        frame:SetScale(1)
        frame:SetAlpha(1)        
    end
end

function OneBag:OnKeyRingButtonClick()
    if CursorHasItem() then
        PutKeyInKeyRing()
    else
        ToggleKeyRing()
    end
    local shownContainerID = IsBagOpen(KEYRING_CONTAINER)
    if shownContainerID then
        local frame = getglobal("ContainerFrame"..shownContainerID)
        frame:ClearAllPoints()
        frame:SetPoint("BOTTOMLEFT", this:GetParent():GetName(), "TOPLEFT", -9, 0)
        frame:SetScale(OneBag.db.profile.scale)
        frame:SetAlpha(OneBag.db.profile.alpha)
    else
        for id=1, 12 do
            local frame = getglobal("ContainerFrame"..id)
            frame:ClearAllPoints()
            frame:SetScale(1)
            frame:SetAlpha(1)        
        end
    end
end

function OneBag:ToggleBag(bag)
    if bag and (bag < 0 or bag > 4) then return self.hooks.ToggleBag.orig(bag) end
    if self.frame:IsVisible() then self.frame:Hide() else self.frame:Show() end
end

function OneBag:IsBagOpen(bag)
    if bag < 0 or bag > 4 then return self.hooks.IsBagOpen.orig(bag) end
    if self.frame:IsVisible() then return bag else return nil end
end

function OneBag:OpenBag(bag)
    if bag and (bag < 0 or bag > 4) then return self.hooks.OpenBag.orig(bag) end
    self.frame:Show()
end

function OneBag:CloseBag(bag)
    if bag and (bag < 0 or bag > 4) then return self.hooks.CloseBag.orig(bag) end
    self.frame:Hide()
end

-- 确保按钮在背包显示时更新技能状态
-- 在 OneBag:OnCustomShow() 函数中，确保也调用了技能刷新
function OneBag:OnCustomShow()
    if self.db.profile.point then
        local point = self.db.profile.point
        this:ClearAllPoints()
        this:SetPoint("TOPLEFT", point.parent, "BOTTOMLEFT", point.left, point.top)
    end
    self:RegisterEvent("BAG_UPDATE", function() self:UpdateBag(arg1) end)
    self:RegisterEvent("BAG_UPDATE_COOLDOWN", function() self:UpdateBag(arg1) end)
    self:RegisterEvent("UPDATE_INVENTORY_ALERTS", function() for i = 0, 4 do self:UpdateBag(i) end end)

    if self.frame.searchFrame then
        self.frame.searchFrame:Show()
    end
    
    -- 更新技能按钮状态 - 确保每次打开背包都检查
    if OneBagButton and OneBagButton.RefreshSpells then
        OneBagButton:RefreshSpells()
    end
    
    -- 检查背包侧边栏是否显示
    local bagFrameVisible = self.frame.bagFrame and (self.frame.bagFrame:IsVisible() or self.frame.bagFrame.wasShown)
    
    -- 分类模块的显示逻辑
    if not bagFrameVisible then
        -- 检查全局开关 - 从 OneBag 数据库获取
        local filterVisible = true
        if OneBag and OneBag.db and OneBag.db.profile then
            filterVisible = OneBag.db.profile.filterModulesVisible
        end
        
        if filterVisible then
            if OneBagCategory then
                OneBagCategory:UpdateButtons()
            end
        else
            -- 如果全局开关关闭，隐藏分类标签页
            if OneBagCategory then
                OneBagCategory:Hide()
            end
        end
    else
        -- 如果背包侧边栏正在显示，隐藏分类标签页
        if OneBagCategory then
            OneBagCategory:Hide()
        end
    end
    
    -- 品质模块的显示逻辑 - 始终显示（除非侧边栏显示）
    if not bagFrameVisible then
        if OneBagQuality then
            OneBagQuality:UpdateButtons()
        end
    else
        -- 如果背包侧边栏正在显示，隐藏品质模块
        if OneBagQuality then
            OneBagQuality:Hide()
        end
    end
end

function OneBag:OnCustomHide()
    local shownContainerID = IsBagOpen(KEYRING_CONTAINER)
    if shownContainerID then getglobal("ContainerFrame"..shownContainerID):Hide() end
    for id=1, 12 do
        local frame = getglobal("ContainerFrame"..id)
        frame:ClearAllPoints()
        frame:SetScale(1)
        frame:SetAlpha(1)        
    end
    self:UnregisterEvent("BAG_UPDATE")
    self:UnregisterEvent("BAG_UPDATE_COOLDOWN")
    self:UnregisterEvent("UPDATE_INVENTORY_ALERTS")
    
    -- 总是隐藏分类标签页
    if OneBagCategory then
        OneBagCategory:Hide()
    end
    -- 也需要隐藏品质模块
    if OneBagQuality then
        OneBagQuality:Hide()
    end
end

function OneBag:UpdateLocale(locale)
    L:SetLocale(locale)
    OneBagFrameConfigButton:SetText(L["Menu"])
    OneBagFrameName:SetText(L["Bags"])
    self:DoSlotCounts()

    if self.frame.searchFrame then
        self.frame.searchFrame.edit:SetText(L["Search"])
    end
end

-- 在OneBagButton:OnInitialize()函数中添加分解和开锁按钮
-- 在OneBagButton:OnInitialize()函数中，修改按钮创建顺序和定位逻辑
function OneBagButton:OnInitialize()
    -- 首先获取或创建基础框架引用
    local OneBagFrame = _G["OneBagFrame"]
    if not OneBagFrame then return end
    
    -- 确保按钮都创建在正确的父框架上
    local parentFrame = OneBagFrame
    
    -- 获取已有的配置按钮位置作为参考
    local configButton = _G["OneBagFrameConfigButton"]
    if not configButton then
        -- 如果配置按钮不存在，使用背包框架作为参考
        configButton = parentFrame
    end
    
    -- 创建整理按钮 - 放在配置按钮左边
    local OneBagClean_Up = CreateFrame("Button", "OneBagClean_Up", parentFrame)
    OneBagClean_Up:SetWidth(20)
    OneBagClean_Up:SetHeight(20)
    OneBagClean_Up:SetPoint("RIGHT", configButton, "LEFT", -5, 0)
    OneBagClean_Up:SetFrameLevel(parentFrame:GetFrameLevel() + 5)
    OneBagClean_Up:SetNormalTexture("Interface\\AddOns\\OneBag\\media\\INV_Pet_Broom")
    OneBagClean_Up:SetPushedTexture("Interface\\AddOns\\OneBag\\media\\INV_Pet_Broom")
    OneBagClean_Up:GetPushedTexture():SetTexCoord(.09,.91,.09,.91)
    OneBagClean_Up:SetScript("OnMouseDown", function()
        -- 修改：左键使用反序（不传参数），右键使用正序（传参数1）
        if arg1 == "LeftButton" then
            Clean_Up("bags")  -- 反序整理
        else
            Clean_Up("bags", 1)  -- 正序整理
        end
    end)
    OneBagClean_Up:SetScript("OnEnter", function()
        GameTooltip:ClearLines()
        GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
        GameTooltip:AddLine("[左键]:正序|N[右键]:倒序")
        GameTooltip:Show()    
    end)
    OneBagClean_Up:SetScript("OnLeave", function() GameTooltip:Hide() end)
    
    -- 创建离线银行按钮 - 在整理按钮左边
    local OneBagView = CreateFrame("Button", "OneBagView", parentFrame)
    OneBagView:SetWidth(20)
    OneBagView:SetHeight(20)
    OneBagView:SetPoint("RIGHT", OneBagClean_Up, "LEFT", -5, 0)
    OneBagView:SetFrameLevel(parentFrame:GetFrameLevel() + 5)
    OneBagView:SetNormalTexture("Interface\\Icons\\INV_Box_PetCarrier_01")
    OneBagView:SetPushedTexture("Interface\\Icons\\INV_Box_PetCarrier_01")
    OneBagView:GetPushedTexture():SetTexCoord(.09,.91,.09,.91)
    OneBagView:SetScript('OnClick', function()
        if not OneCore then DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000OneCore 未加载！|r") return end
        if not OneCore:HasModule("OneView") then DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000OneView 模块未找到！|r") return end
        local oneViewModule = OneCore:GetModule("OneView")
        if not oneViewModule then DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000无法获取 OneView 模块！|r") return end
        if not oneViewModule:IsActive() then oneViewModule:Enable() end
        if not OneViewFrame then DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000OneViewFrame 未创建，请重载界面！|r") return end
        if OneViewFrame:IsVisible() then OneViewFrame:Hide() else OneViewFrame:Show() end
    end)
    OneBagView:SetScript("OnEnter", function()
        GameTooltip:ClearLines()
        GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
        GameTooltip:AddLine("离线银行")
        GameTooltip:Show()    
    end)
    OneBagView:SetScript("OnLeave", function() GameTooltip:Hide() end)
    
    -- 在 OneBagButton:OnInitialize() 函数中找到锁定按钮的部分，修改如下：

    -- 创建锁定按钮 - 在离线银行按钮左边
    local OneBagLockButton = CreateFrame("Button", "OneBagLockButton", parentFrame)
    OneBagLockButton:SetWidth(20)
    OneBagLockButton:SetHeight(20)
    OneBagLockButton:SetPoint("RIGHT", OneBagView, "LEFT", -5, 0)
    OneBagLockButton:SetFrameLevel(parentFrame:GetFrameLevel() + 5)
    OneBagLockButton:SetNormalTexture("Interface\\Icons\\Spell_Holy_SealOfProtection")
    OneBagLockButton:SetPushedTexture("Interface\\Icons\\Spell_Holy_SealOfProtection")
    OneBagLockButton:GetPushedTexture():SetTexCoord(.09,.91,.09,.91)
    OneBagLockButton:SetScript('OnMouseDown', function()
        if arg1 == "LeftButton" then
        SlashCmdList["ITEMLOCK"]("list")
        else
        SlashCmdList["ITEMLOCK"]("unlockall")
        end
    end)
    OneBagLockButton:SetScript("OnEnter", function()
        GameTooltip:ClearLines()
        GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
        GameTooltip:AddLine("物品锁定")
        GameTooltip:AddLine("中键点击物品: 锁定/解锁")
        GameTooltip:AddLine("左键点击此按钮: 查看锁定列表")
        GameTooltip:AddLine("右键点击此按钮: 一键解锁物品")
        GameTooltip:Show()    
    end)
    OneBagLockButton:SetScript("OnLeave", function() GameTooltip:Hide() end)

    
    -- 存储当前最左边的按钮，用于后续定位
    local leftMostButton = OneBagLockButton
    
    -- 如果LootFilter插件已加载，创建拾取过滤按钮 - 基于锁定按钮定位
    local OneBagLootFilter
    if IsAddOnLoaded("LootFilter") then
        OneBagLootFilter = CreateFrame("Button", "OneBagLootFilter", parentFrame)
        OneBagLootFilter:SetWidth(20)
        OneBagLootFilter:SetHeight(20)
        OneBagLootFilter:SetPoint("RIGHT", leftMostButton, "LEFT", -5, 0)
        OneBagLootFilter:SetFrameLevel(parentFrame:GetFrameLevel() + 5)
        OneBagLootFilter:SetNormalTexture("Interface\\Icons\\INV_Misc_Spyglass_03")
        OneBagLootFilter:SetPushedTexture("Interface\\Icons\\INV_Misc_Spyglass_03")
        OneBagLootFilter:GetPushedTexture():SetTexCoord(.09,.91,.09,.91)
        OneBagLootFilter:SetScript('OnClick', function()
            if not LootFilterOptions:IsShown() then 
                LootFilterOptions:Show() 
            else 
                LootFilterOptions:Hide() 
            end    
        end)
        OneBagLootFilter:SetScript("OnEnter", function()
            GameTooltip:ClearLines()
            GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
            GameTooltip:AddLine("拾取过滤")
            GameTooltip:Show()    
        end)
        OneBagLootFilter:SetScript("OnLeave", function() GameTooltip:Hide() end)
        
        -- 更新最左边的按钮
        leftMostButton = OneBagLootFilter
    end
    
    -- 创建分解按钮 - 基于拾取过滤或锁定按钮定位
    local OneBagDisenchant = CreateFrame("Button", "OneBagDisenchant", parentFrame)
    OneBagDisenchant:SetWidth(20)
    OneBagDisenchant:SetHeight(20)
    OneBagDisenchant:SetPoint("RIGHT", leftMostButton, "LEFT", -5, 0)
    OneBagDisenchant:SetFrameLevel(parentFrame:GetFrameLevel() + 5)
    OneBagDisenchant:SetNormalTexture("Interface\\Icons\\Spell_Holy_RemoveCurse")
    OneBagDisenchant:SetPushedTexture("Interface\\Icons\\Spell_Holy_RemoveCurse")
    OneBagDisenchant:GetPushedTexture():SetTexCoord(.09,.91,.09,.91)
    OneBagDisenchant:SetScript('OnClick', function()
        -- 查找分解技能ID并施放
        local spellId = self:GetDisenchantSpellId()
        if spellId then
            CastSpell(spellId, BOOKTYPE_SPELL)
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00使用了分解技能|r")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000未学会分解技能|r")
        end
    end)
    OneBagDisenchant:SetScript("OnEnter", function()
        GameTooltip:ClearLines()
        GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
        GameTooltip:AddLine("分解")
        GameTooltip:AddLine("点击：使用分解技能", 0, 1, 0)
        GameTooltip:Show()    
    end)
    OneBagDisenchant:SetScript("OnLeave", function() GameTooltip:Hide() end)
    OneBagDisenchant:Hide() -- 默认隐藏，等检测到技能后再显示
    self.DisenchantButton = OneBagDisenchant
    
    -- 更新最左边的按钮
    leftMostButton = OneBagDisenchant
    
    -- 创建开锁按钮 - 基于分解按钮定位（如果存在），否则基于拾取过滤或锁定按钮
    local OneBagPickLock = CreateFrame("Button", "OneBagPickLock", parentFrame)
    OneBagPickLock:SetWidth(20)
    OneBagPickLock:SetHeight(20)
    
    -- 如果分解按钮存在，基于分解按钮定位，否则基于当前最左边的按钮
    if self.DisenchantButton then
        OneBagPickLock:SetPoint("RIGHT", self.DisenchantButton, "LEFT", -5, 0)
    else
        OneBagPickLock:SetPoint("RIGHT", leftMostButton, "LEFT", -5, 0)
    end
    
    OneBagPickLock:SetFrameLevel(parentFrame:GetFrameLevel() + 5)
    OneBagPickLock:SetNormalTexture("Interface\\Icons\\Spell_Nature_MoonKey")
    OneBagPickLock:SetPushedTexture("Interface\\Icons\\Spell_Nature_MoonKey")
    OneBagPickLock:GetPushedTexture():SetTexCoord(.09,.91,.09,.91)
    OneBagPickLock:SetScript('OnClick', function()
        -- 查找开锁技能ID并施放
        local spellId = self:GetPickLockSpellId()
        if spellId then
            CastSpell(spellId, BOOKTYPE_SPELL)
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00使用了开锁技能|r")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000未学会开锁技能|r")
        end
    end)
    OneBagPickLock:SetScript("OnEnter", function()
        GameTooltip:ClearLines()
        GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
        GameTooltip:AddLine("开锁")
        GameTooltip:AddLine("点击：使用开锁技能", 0, 1, 0)
        GameTooltip:Show()    
    end)
    OneBagPickLock:SetScript("OnLeave", function() GameTooltip:Hide() end)
    OneBagPickLock:Hide() -- 默认隐藏，等检测到技能后再显示
    self.PickLockButton = OneBagPickLock
    
    -- 注册SPELLS_CHANGED事件来更新按钮状态
    self:RegisterEvent("SPELLS_CHANGED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    
    -- 立即尝试刷新一次
    self:ScheduleEvent("OneBagButtonInitialRefresh", self.RefreshSpells, 1, self)
end

function OneBagButton:GetDisenchantSpellId()
    -- 支持中文和英文客户端
    for i = 1, GetNumSpellTabs() do
        local name, texture, offset, numSpells = GetSpellTabInfo(i)
        if name then
            for spellIndex = offset + 1, offset + numSpells do
                local spellName = GetSpellName(spellIndex, BOOKTYPE_SPELL)
                if spellName then
                    -- 中英文分解技能检测
                    if spellName == "分解" or spellName == "Disenchant" then
                        return spellIndex
                    end
                end
            end
        end
    end
    return nil
end

function OneBagButton:GetPickLockSpellId()
    -- 支持中文和英文客户端
    for i = 1, GetNumSpellTabs() do
        local name, texture, offset, numSpells = GetSpellTabInfo(i)
        if name then
            for spellIndex = offset + 1, offset + numSpells do
                local spellName = GetSpellName(spellIndex, BOOKTYPE_SPELL)
                if spellName then
                    -- 中英文开锁技能检测
                    if spellName == "开锁" or spellName == "Pick Lock" then
                        return spellIndex
                    end
                end
            end
        end
    end
    return nil
end

-- 增强 RefreshSpells 函数 - 简化版本
function OneBagButton:RefreshSpells()
    -- 检测分解技能
    local disenchantId = self:GetDisenchantSpellId()
    if disenchantId and self.DisenchantButton then
        self.DisenchantButton:Show()
        self.DisenchantButton:SetID(disenchantId)
        -- 重新确定分解按钮的定位
        local baseButton
        if IsAddOnLoaded("LootFilter") then
            -- 如果有拾取过滤按钮，基于拾取过滤按钮定位
            local lootFilterBtn = _G["OneBagLootFilter"]
            if lootFilterBtn then
                baseButton = lootFilterBtn
            else
                baseButton = _G["OneBagLockButton"]
            end
        else
            -- 否则基于锁定按钮定位
            baseButton = _G["OneBagLockButton"]
        end
        
        if baseButton then
            self.DisenchantButton:ClearAllPoints()
            self.DisenchantButton:SetPoint("RIGHT", baseButton, "LEFT", -5, 0)
        end
        
        self.DisenchantButton:SetFrameLevel(self.DisenchantButton:GetParent():GetFrameLevel() + 5)
        self.DisenchantButton:SetAlpha(1)
    elseif self.DisenchantButton then
        self.DisenchantButton:Hide()
    end
    
    -- 检测开锁技能
    local picklockId = self:GetPickLockSpellId()
    if picklockId and self.PickLockButton then
        self.PickLockButton:Show()
        self.PickLockButton:SetID(picklockId)
        -- 重新确定开锁按钮的定位
        local baseButton
        if disenchantId and self.DisenchantButton and self.DisenchantButton:IsVisible() then
            -- 如果有分解按钮，基于分解按钮定位
            baseButton = self.DisenchantButton
        elseif IsAddOnLoaded("LootFilter") then
            -- 否则如果有拾取过滤按钮，基于拾取过滤按钮定位
            local lootFilterBtn = _G["OneBagLootFilter"]
            if lootFilterBtn then
                baseButton = lootFilterBtn
            else
                baseButton = _G["OneBagLockButton"]
            end
        else
            -- 否则基于锁定按钮定位
            baseButton = _G["OneBagLockButton"]
        end
        
        if baseButton then
            self.PickLockButton:ClearAllPoints()
            self.PickLockButton:SetPoint("RIGHT", baseButton, "LEFT", -5, 0)
        end
        
        self.PickLockButton:SetFrameLevel(self.PickLockButton:GetParent():GetFrameLevel() + 5)
        self.PickLockButton:SetAlpha(1)
    elseif self.PickLockButton then
        self.PickLockButton:Hide()
    end
end

-- 确保 OneBagButton 模块正确启用
function OneBagButton:OnEnable()    
    self:RefreshSpells()
end

-- 添加事件处理方法
function OneBagButton:SPELLS_CHANGED()
    self:RefreshSpells()
end

function OneBagButton:PLAYER_ENTERING_WORLD()
    self:RefreshSpells()
end

function OneBank:OnInitialize()
    local baseArgs = OneCore:GetFreshOptionsTable(self)
    local customArgs = {
        ["5"] = {name = L["First Bag"], type = 'toggle', order = 5, desc = L["Turns display of your first bag on and off."], get = function() return self.db.profile.show[5] end, set = function(v) self.db.profile.show[5] = v self:OrganizeFrame(true) end},
        ["6"] = {name = L["Second Bag"], type = 'toggle', order = 6, desc = L["Turns display of your second bag on and off."], get = function() return self.db.profile.show[6] end, set = function(v) self.db.profile.show[6] = v self:OrganizeFrame(true) end},
        ["7"] = {name = L["Third Bag"], type = 'toggle', order = 7, desc = L["Turns display of your third bag on and off."], get = function() return self.db.profile.show[7] end, set = function(v) self.db.profile.show[7] = v self:OrganizeFrame(true) end},
        ["8"] = {name = L["Fourth Bag"], type = 'toggle', order = 8, desc = L["Turns display of your fourth bag on and off."], get = function() return self.db.profile.show[8] end, set = function(v) self.db.profile.show[8] = v self:OrganizeFrame(true) end},
        ["9"] = {name = L["Fifth Bag"], type = 'toggle', order = 9, desc = L["Turns display of your fifth bag on and off."], get = function() return self.db.profile.show[9] end, set = function(v) self.db.profile.show[9] = v self:OrganizeFrame(true) end},
        ["10"] = {name = L["Sixth Bag"], type = 'toggle', order = 10, desc = L["Turns display of your sixth bag on and off."], get = function() return self.db.profile.show[10] end, set = function(v) self.db.profile.show[10] = v self:OrganizeFrame(true) end},
    }
    OneCore:CopyTable(customArgs, baseArgs.args.show.args)
    OneCore:LoadOptionalCommands(baseArgs, self)
    self:RegisterDB("OneBankDB")
    self:RegisterDefaults('profile', OneBank:GetDefaults())
    self:RegisterChatCommand({"/obb", "/OneBank"}, baseArgs, string.upper(self.title))
    self.fBags = {-1, 5, 6, 7, 8, 9, 10}
    self.rBags = {10, 9, 8, 7, 6, 5, -1}
    OneBankFrameName:SetText(L["Bank Bags"])
    self.frame = OneBankFrame
    self.frame.handler = self
    self.frame.bagFrame = OBBBagFra
    self.frame.bagFrame.handler = self
    self.frame.bags = {["cols"] = 16}
    self.lastCounts = {}
    self.isBank = true
    self:RegisterDewdrop(baseArgs)
    
    self:CreateSearchFrame()
    
    OneBankCategory:Embed(self)
    OneBankQuality:Embed(self)
end

function OneBank:OnEnable()
    if self.frame then self.frame:SetClampedToScreen(true) end
    self:RegisterEvent("BAG_UPDATE", function() self:UpdateBag(arg1) end)
    self:RegisterEvent("BAG_UPDATE_COOLDOWN", function() self:UpdateBag(arg1) end)
    self:RegisterEvent("BANKFRAME_OPENED", function() if self.frame then self.frame:Show() end end)
    self:RegisterEvent("BANKFRAME_CLOSED", function() if self.frame then self.frame:Hide() end end)
    self:RegisterEvent("PLAYERBANKSLOTS_CHANGED", function() 
        if not self.frame.bags[-1].colorLocked then
            for k, v in ipairs(self.frame.bags[-1]) do self:SetBorderColor(v) end
        end
    end)
    if CT_oldPurchaseSlot then PurchaseSlot = CT_oldPurchaseSlot end
    self:Hook("PurchaseSlot", function() self.hooks.PurchaseSlot.orig() self.bagPurchased = true end)
    self:Hook("CloseBankFrame", function() 
        if self.frame then self.frame:Hide() end
        self.hooks.CloseBankFrame.orig() 
    end)
    self:BuildFrame()
end

function OneBank:OnUpdate()
    local total, bagChanged = 0, false
    for i, k in self.fBags do
        local count = GetContainerNumSlots(k)
        if self.lastCounts[k] ~= count then
            self.lastCounts[k] = count
            bagChanged = true
        end
        total = total + count
    end
    if self.lastCount ~= total or bagChanged then
        self:BuildFrame()
        self:OrganizeFrame()
        self:DoSlotCounts()
        self.lastCount = total
    end
    if self.bagPurchased then self:UpdateBagSlotStatus() end
end

function OneBank:StartOnUpdate()
    self:ScheduleRepeatingEvent(self.title, self.OnUpdate, .25, self)
    self:UpdateBag(-1)
end

function OneBank:StopOnUpdate()
    self:CancelScheduledEvent(self.title)
end

function OneBank:UpdateBagSlotStatus() 
    local purchaseFrame = OBBBagFraPurchaseInfo
    if purchaseFrame == nil then return end
    local numSlots, full = GetNumBankSlots()
    local button
    for i=1, NUM_BANKBAGSLOTS, 1 do
        button = getglobal("OBBBagFraBag"..i)
        if button then
            if i <= numSlots then
                SetItemButtonTextureVertexColor(button, 1.0,1.0,1.0)
                button.tooltipText = BANK_BAG
            else
                SetItemButtonTextureVertexColor(button, 1.0,0.1,0.1)
                button.tooltipText = BANK_BAG_PURCHASE
            end
        end
    end
    local cost = GetBankSlotCost(numSlots)
    BankFrame.nextSlotCost = cost
    if GetMoney() >= cost then
        SetMoneyFrameColor("OBBBagFraPurchaseInfoDetailMoneyFrame", 1.0, 1.0, 1.0)
    else
        SetMoneyFrameColor("OBBBagFraPurchaseInfoDetailMoneyFrame", 1.0, 0.1, 0.1)
    end
    MoneyFrame_Update("OBBBagFraPurchaseInfoDetailMoneyFrame", cost)
    if full then purchaseFrame:Hide() else purchaseFrame:Show() end
end

function OneBank:OnCustomShow() 
    if self.db.profile.point then
        local point = self.db.profile.point
        this:ClearAllPoints()
        this:SetPoint("TOPLEFT", point.parent, "BOTTOMLEFT", point.left, point.top)
    else
        if not OneBag:IsActive() then 
            this:ClearAllPoints() 
            this:SetPoint("CENTER", UIParent, "CENTER", 0, 0) 
        else 
            this:ClearAllPoints() 
            this:SetPoint("BOTTOMLEFT", OneBagFrame, "LEFT", -500, 25) 
        end
    end
    self:StartOnUpdate()
    self:UpdateBagSlotStatus()
    if self.frame then self.frame:SetClampedToScreen(self.db.profile.clamped or false) end
    
    if self.frame.searchFrame then
        self.frame.searchFrame:Show()
    end
    
    -- 只在银行侧边栏隐藏时显示分类标签页，并且检查全局开关
    if not self.frame.bagFrame or not self.frame.bagFrame:IsVisible() then
        -- 检查全局开关 - 从 OneBag 数据库获取
        local filterVisible = true
        if OneBag and OneBag.db and OneBag.db.profile then
            filterVisible = OneBag.db.profile.filterModulesVisible
        end
        
        if filterVisible then
            if OneBankCategory then
                OneBankCategory:UpdateButtons()
            end
        else
            -- 如果全局开关关闭，隐藏分类标签页
            if OneBankCategory then
                OneBankCategory:Hide()
            end
        end
        
        -- 无论全局开关如何，都显示Quality模块
        if OneBankQuality then
            OneBankQuality:UpdateButtons()
        end
    else
        -- 如果银行侧边栏正在显示，隐藏分类标签页
        if OneBankCategory then
            OneBankCategory:Hide()
        end
        -- Quality模块不做处理
    end
end

function OneBank:OnCustomHide()
    CloseBankFrame()
    self:StopOnUpdate()
    
    -- 总是隐藏分类标签页
    if OneBankCategory then
        OneBankCategory:Hide()
    end
    -- Quality模块不做处理
end

function OneBank:OnEnable()
    if self.frame then self.frame:SetClampedToScreen(true) end
    self:RegisterEvent("BAG_UPDATE", function() self:UpdateBag(arg1) end)
    self:RegisterEvent("BAG_UPDATE_COOLDOWN", function() self:UpdateBag(arg1) end)
    self:RegisterEvent("BANKFRAME_OPENED", function() if self.frame then self.frame:Show() end end)
    self:RegisterEvent("BANKFRAME_CLOSED", function() if self.frame then self.frame:Hide() end end)
    self:RegisterEvent("PLAYERBANKSLOTS_CHANGED", function() 
        if not self.frame.bags[-1].colorLocked then
            for k, v in ipairs(self.frame.bags[-1]) do self:SetBorderColor(v) end
        end
    end)
    if CT_oldPurchaseSlot then PurchaseSlot = CT_oldPurchaseSlot end
    self:Hook("PurchaseSlot", function() self.hooks.PurchaseSlot.orig() self.bagPurchased = true end)
    self:Hook("CloseBankFrame", function() 
        if self.frame then self.frame:Hide() end
        self.hooks.CloseBankFrame.orig() 
    end)
    self:BuildFrame()
    
    -- 动态设置银行背包按钮的点击事件
    if self.frame and self.frame.bagFrame then
        -- 找到背包按钮，它通常在银行主框架上
        local bagButton = getglobal(self.frame:GetName() .. "BagButton")
        if bagButton then
            bagButton:SetScript("OnClick", function()
                local bagFrame = this:GetParent().bagFrame
                if bagFrame:IsVisible() then
                    this:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
                    this:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
                    bagFrame:Hide()
                    -- 侧边栏隐藏时，显示分类标签页
                    -- 检查全局开关 - 从 OneBag 数据库获取
                    local filterVisible = true
                    if OneBag and OneBag.db and OneBag.db.profile then
                        filterVisible = OneBag.db.profile.filterModulesVisible
                    end
                    if filterVisible then
                        if OneBankCategory then
                            OneBankCategory:UpdateButtons()
                        end
                        -- Quality模块不做处理
                    end
                else
                    this:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
                    this:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
                    bagFrame:Show()
                    -- 侧边栏显示时，隐藏分类标签页
                    if OneBankCategory then
                        OneBankCategory:Hide()
                    end
                    -- Quality模块不做处理
                end
            end)
        end
    end
end

function OneBank:GetDefaults()
    if not self.defaults then
        self.defaults = {
            cols = 12, scale = 1, alpha = 1,
            colors = {
                mouseover = {r = 0, g = .7, b = 1},
                ammo = {r = 1, g = 1, b = 0},
                soul = {r = .5, g = .5, b = 1}, 
                prof = {r = 1, g = 0, b = 1},
                bground = {r = 0, g = 0, b = 0, a = .45},
                glow = false, rarity = true,
            },
            show = {['*'] = true},
            strata = 3, locked = false, clamped = true, bagBreak = false,
        }
    end
    return self.defaults
end

function OneRing:OnInitialize()
    OneRingFrameName:ClearAllPoints()
    OneRingFrameName:SetPoint("TOPLEFT", "OneRingFrame", "TOPLEFT", 10, -15)
    OneRingFrameName:SetText(L["Keyring"])
    OneRingFrameConfigButton:Hide()
    OneRingFramepackupButton:Hide()
    OneRingFrameBagButton:Hide()
    OneRingFrameMoneyFrame:Hide()
    self.fBags = {-2}
    self.rBags = {-2}
    self.frame = OneRingFrame
    self.frame.handler = self
    self.frame.bags = {}
    self:RegisterDB("OneRingDB")
    self:RegisterDefaults('profile', OneRing:GetDefaults())
end

function OneRing:OnEnable()
    self:RegisterEvent("BAG_UPDATE", function() self:UpdateBag(arg1) end)
    self:RegisterEvent("BAG_UPDATE_COOLDOWN", function() self:UpdateBag(arg1) end)
    self:Hook("ToggleKeyRing", function() if self.frame:IsVisible() then self.frame:Hide() else self.frame:Show() end end)
end

function OneRing:OnCustomShow()
    if not OneBag.frame:IsVisible() then 
        this:ClearAllPoints() 
        this:SetPoint("CENTER", UIParent, "CENTER", 0, 0) 
    else 
        this:ClearAllPoints() 
        this:SetPoint("BOTTOMLEFT", OneBagFrame, "TOPLEFT", 0, 8) 
    end
end

function OneRing:OnCustomHide() end

function OneRing:GetDefaults()
    if not self.defaults then
        self.defaults = {
            cols = 4, scale = 1, alpha = 1,
            colors = {
                mouseover = {r = 0, g = .7, b = 1},
                ammo = {r = 1, g = 1, b = 0},
                soul = {r = .5, g = .5, b = 1}, 
                prof = {r = 1, g = 0, b = 1},
                bground = {r = 0, g = 0, b = 0, a = .45},
                glow = false, rarity = true,
            },
            show = {['*'] = true},
            strata = 3, locked = false, clamped = true, bagBreak = false,
        }
    end
    return self.defaults
end

BINDING_HEADER_ONEVIEW = "OneView"

function OneView:OnInitialize()
    local LV = AceLibrary and AceLibrary("AceLocale-2.1"):GetInstance("OneView", true) or setmetatable({}, {__index = function(self, key) return key end})
    if not LV["%s's Bank Bags"] then LV["%s's Bank Bags"] = "%s's Bank Bags" end
    if not LV["%s's Bags"] then LV["%s's Bags"] = "%s's Bags" end
    
    local baseArgs = OneCore:GetFreshOptionsTable(self)
    local customArgs = {
        ["0"] = {name = LV["Backpack"] or "Backpack", type = 'toggle', order = 5, desc = LV["Turns display of your backpack on and off."] or "Turns display of your backpack on and off.", get = function() return self.db.profile.show[0] end, set = function(v) self.db.profile.show[0] = v self:OrganizeFrame(true) end},
        ["1"] = {name = LV["First Bag"] or "First Bag", type = 'toggle', order = 6, desc = LV["Turns display of your first bag on and off."] or "Turns display of your first bag on and off.", get = function() return self.db.profile.show[1] end, set = function(v) self.db.profile.show[1] = v self:OrganizeFrame(true) end},
        ["2"] = {name = LV["Second Bag"] or "Second Bag", type = 'toggle', order = 7, desc = LV["Turns display of your second bag on and off."] or "Turns display of your second bag on and off.", get = function() return self.db.profile.show[2] end, set = function(v) self.db.profile.show[2] = v self:OrganizeFrame(true) end},
        ["3"] = {name = LV["Third Bag"] or "Third Bag", type = 'toggle', order = 8, desc = LV["Turns display of your third bag on and off."] or "Turns display of your third bag on and off.", get = function() return self.db.profile.show[3] end, set = function(v) self.db.profile.show[3] = v self:OrganizeFrame(true) end},
        ["4"] = {name = LV["Fourth Bag"] or "Fourth Bag", type = 'toggle', order = 9, desc = LV["Turns display of your fourth bag on and off."] or "Turns display of your fourth bag on and off.", get = function() return self.db.profile.show[4] end, set = function(v) self.db.profile.show[4] = v self:OrganizeFrame(true) end},
        ["5"] = {name = LV["First Bank Bag"] or "First Bank Bag", type = 'toggle', order = 10, desc = LV["Turns display of your first bag on and off."] or "Turns display of your first bag on and off.", get = function() return self.db.profile.show[5] end, set = function(v) self.db.profile.show[5] = v self:OrganizeFrame(true) end},
        ["6"] = {name = LV["Second Bank Bag"] or "Second Bank Bag", type = 'toggle', order = 11, desc = LV["Turns display of your second bag on and off."] or "Turns display of your second bag on and off.", get = function() return self.db.profile.show[6] end, set = function(v) self.db.profile.show[6] = v self:OrganizeFrame(true) end},
        ["7"] = {name = LV["Third Bank Bag"] or "Third Bank Bag", type = 'toggle', order = 12, desc = LV["Turns display of your third bag on and off."] or "Turns display of your third bag on and off.", get = function() return self.db.profile.show[7] end, set = function(v) self.db.profile.show[7] = v self:OrganizeFrame(true) end},
        ["8"] = {name = LV["Fourth Bank Bag"] or "Fourth Bank Bag", type = 'toggle', order = 13, desc = LV["Turns display of your fourth bag on and off."] or "Turns display of your fourth bag on and off.", get = function() return self.db.profile.show[8] end, set = function(v) self.db.profile.show[8] = v self:OrganizeFrame(true) end},
        ["9"] = {name = LV["Fifth Bank Bag"] or "Fifth Bank Bag", type = 'toggle', order = 14, desc = LV["Turns display of your fifth bag on and off."] or "Turns display of your fifth bag on and off.", get = function() return self.db.profile.show[9] end, set = function(v) self.db.profile.show[9] = v self:OrganizeFrame(true) end},
        ["10"] = {name = LV["Sixth Bank Bag"] or "Sixth Bank Bag", type = 'toggle', order = 15, desc = LV["Turns display of your sixth bag on and off."] or "Turns display of your sixth bag on and off.", get = function() return self.db.profile.show[10] end, set = function(v) self.db.profile.show[10] = v self:OrganizeFrame(true) end},
    }
    OneCore:CopyTable(customArgs, baseArgs.args.show.args)
    baseArgs.args.remember = {
        cmdName = LV["Remember"] or "Remember", guiName = LV["Remember Selection"] or "Remember Selection", type = 'toggle',
        desc = LV["Toggles wether to remember which was the last character you selected."] or "Toggles wether to remember which was the last character you selected.",
        get = function() return self.db.profile.remember end,
        set = function(v) 
            self.db.profile.remember = v 
            if v then
                self.db.account.faction = self.faction 
                self.db.account.characterId = self.charId 
            else
                self.db.account.faction = nil
                self.db.account.characterId = nil
            end
        end,
    }
    self:RegisterDB("OneViewDB")
    self:RegisterDefaults('profile', OneView:GetDefaults())
    self:RegisterChatCommand({"/ov", "/OneView"}, baseArgs, string.upper(self.title))
    self:RegisterChatCommand({"/ovs", "/ovshow"}, {type="execute", func= function() 
            if OneViewFrame:IsVisible() then OneViewFrame:Hide() else OneViewFrame:Show() end
        end})
    self.fBags = {-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
    self.frame = OneViewFrame
    self.frame.bags = {}
    self.frame.handler = self
    self.storage = AceLibrary("OneStorage-2.0")
    self.storage:RegisterDB(self, self.db)
    self:RegisterDewdrop(baseArgs)
    self.L = L
    self.LV = LV

    -- 创建搜索框并调整位置（向下移动）
    self:CreateSearchFrame()
-- 找到银行按钮并添加点击事件处理
        -- 找到银行按钮并添加点击事件处理
    local bankButton = getglobal("OneViewFrameBankButton")
    if bankButton then
        bankButton:SetScript("OnClick", function()
            local handler = this:GetParent().handler
            if handler.db.profile.show.bank then
                this:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
                this:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
                handler.db.profile.show.bank = false
                
                -- 银行隐藏时，隐藏分类和品质模块
                if OneViewCategory then
                    OneViewCategory:Hide()
                end
                if OneViewQuality then
                    OneViewQuality:Hide()
                end
            else
                this:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
                this:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
                handler.db.profile.show.bank = true
                
                -- 银行显示时，更新分类和品质模块
                -- 分类模块检查全局开关
                local filterVisible = true
                if OneBag and OneBag.db and OneBag.db.profile then
                    filterVisible = OneBag.db.profile.filterModulesVisible
                end
                
                if filterVisible then
                    if OneViewCategory then
                        OneViewCategory:UpdateButtons()
                    end
                else
                    -- 如果全局开关关闭，隐藏分类标签页
                    if OneViewCategory then
                        OneViewCategory:Hide()
                    end
                end
                
                -- 品质模块始终显示
                if OneViewQuality then
                    OneViewQuality:UpdateButtons()
                end
            end
            handler:OrganizeFrame()
        end)
    end
    
    -- 嵌入分类和品质模块
    OneViewCategory:Embed(self)
    OneViewQuality:Embed(self)
end

function OneView:CreateSearchFrame()
    if self.frame.searchFrame then return end
    
    local search = CreateFrame("Frame", self.frame:GetName() .. "SearchFrame", self.frame)
    
    -- 调整搜索框位置：变短并移动到右上角
    search:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 120, -32)  -- 向右移动，从120开始
    search:SetPoint("TOPRIGHT", self.frame, "TOPRIGHT", -140, -15) -- 向左移动，距右边140像素
    
    search:SetHeight(24)
    search:SetBackdrop({
        bgFile = 'Interface\\Tooltips\\UI-Tooltip-Background',
        -- edgeFile = 'Interface\\Tooltips\\UI-Tooltip-Border',
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 5, right = 25, top = 5, bottom = 5 }
    })
    search:SetBackdropBorderColor(1, 1, 1, 1)
    search:SetBackdropColor(0, 0, 0, 0)
    search.text = search:CreateFontString(nil, "HIGH", "GameTooltipTextSmall")
    local font, size = search.text:GetFont()
    
    search.edit = CreateFrame("EditBox", nil, search)
    search.edit:SetMaxLetters(20)
    search.edit:SetPoint("LEFT", search, "LEFT", 8, 0)
    search.edit:SetPoint("RIGHT", search, "RIGHT", -30, 0)
    search.edit:SetHeight(20)
    search.edit:SetFont(font, size, "OUTLINE")
    search.edit:SetAutoFocus(false)
    search.edit:SetText(self.L["Search"] or "Search")  
    search.edit:SetTextColor(1,1,1,1)
    search.button = CreateFrame("Button", nil, search)
    search.button:SetWidth(20)
    search.button:SetHeight(20)
    search.button:SetPoint("RIGHT", search, "RIGHT", -5, 0)
    search.button:SetFrameLevel(search:GetFrameLevel() + 2)
    search.button:SetNormalTexture('Interface\\Buttons\\UI-GroupLoot-Pass-Up')
    search.button:SetPushedTexture('Interface\\Buttons\\UI-GroupLoot-Pass-Up')
    search.button:SetHighlightTexture('Interface\\Buttons\\UI-GroupLoot-Pass-Up')
    search.button:EnableMouse(true)
    search.button:RegisterForClicks("LeftButtonUp")
    search.button:Hide()
    self.frame.searchFrame = search
    
    local function resetSearch()
        search.edit:SetText(self.L["Search"] or "Search")   -- 使用self.L["Search"]
        self:ResetSearchFilter()
        search.button:Hide()
    end

    search.edit:SetScript("OnEditFocusGained", function()
        if this:GetText() == (self.L["Search"] or "Search") then   -- 使用self.L["Search"]
            this:SetText("")
        end
    end)

    search.edit:SetScript("OnEditFocusLost", function()
        if this:GetText() == "" then
            resetSearch()
        end
    end)

    search.edit:SetScript("OnTabPressed", function()
        this:ClearFocus()
        resetSearch()
    end)

    search.edit:SetScript("OnEscapePressed", function()
        this:ClearFocus()
        resetSearch()
    end)

    search.button:SetScript("OnClick", function()
        search.edit:ClearFocus()
        resetSearch()
    end)

    search.edit:SetScript("OnTextChanged", function()
        if this:GetText() == (self.L["Search"] or "Search") then   -- 使用self.L["Search"]
            resetSearch()
            return
        end
        
        if not search.button:IsVisible() then
            search.button:Show()
        end
        
        self:SearchFilter()
    end)
    
    return search
end

function OneView:OnEnable()
    self.storage:Initialize()
    if self.frame then self.frame:SetClampedToScreen(true) end
    self:BuildCharSelectOptions()
end

function OneView:BuildFrame()
    if not self.frame.bags[-1] then 
        self.frame.bags[-1] = CreateFrame("Frame", "OVBankBag", self.frame)
        self.frame.bags[-1]:SetID(-1)
        self.frame.bags[-1].size = 24
        for slot = 1, 24 do
            self.frame.bags[-1][slot] = CreateFrame("Button", self.frame.bags[-1]:GetName().."Item"..slot, self.frame.bags[-1], "OneViewItemButtonTemplate")
            self.frame.bags[-1][slot]:SetID(slot)
        end
    end
    for bag = 0, 10 do        
        local itemId, size, isAmmo, isSoul, isProf = self.storage:BagInfo(self.faction, self.charId, bag)
        for slot = 1, (tonumber(size) or 0) do
            if not self.frame.bags[bag] then 
                self.frame.bags[bag] = CreateFrame("Frame", tostring(self)..bag, self.frame)
                self.frame.bags[bag]:SetID(bag)
            end
            if not self.frame.bags[bag][slot] then
                self.frame.bags[bag][slot] = CreateFrame("Button", tostring(self)..bag.."Item"..slot, self.frame.bags[bag], "OneViewItemButtonTemplate")
                self.frame.bags[bag][slot]:SetID(slot)
            end
        end
        if self.frame.bags[bag] then
            local curBag = self.frame.bags[bag]
            curBag.itemId, curBag.size, curBag.isAmmo, curBag.isSoul, curBag.isProf = itemId, size or 0, isAmmo, isSoul, isProf
        end
    end
end

function OneView:OrganizeFrame(needs)
    local cols, curCol, curRow = self.db.profile.cols, 1, 1
    local lastslot
    self.bankSoulSlots, self.bankAmmoSlots, self.bankProfSlots, self.bankSlotCount, self.bankTotalCount = 0, 0, 0, 0, 0
    self.invSoulSlots, self.invAmmoSlots, self.invProfSlots, self.invSlotCount, self.invTotalCount = 0, 0, 0, 0, 0
    for bag = -1, 10 do 
        if self.frame.bags[bag] then for k2, v2 in ipairs(self.frame.bags[bag]) do v2:Hide() end end
        local curBag = getglobal("OneViewFrameBag" .. bag)
        if curBag and not self.db.profile.show.bank and bag > 4 then
            curBag:Hide()
        elseif curBag and not self.db.profile.show.inventory and bag < 5 and bag > 0 then
            curBag:Hide()
        elseif curBag then curBag:Show() end
    end
    for k, bag in {-1, 5, 6, 7, 8, 9, 10} do
        local curBag = self.frame.bags[bag]
        if curBag and curBag.size and curBag.size > 0 then
            if curBag.isAmmo then
                self.bankAmmoSlots = self.bankAmmoSlots + curBag.size
            elseif curBag.isSoul then
                self.bankSoulSlots = self.bankSoulSlots + curBag.size
            elseif curBag.isProf then
                self.bankProfSlots = self.bankProfSlots + curBag.size
            else
                self.bankSlotCount = self.bankSlotCount + curBag.size
            end
            if self.db.profile.show.bank then
                if self:ShouldShow(bag, curBag.isAmmo, curBag.isSoul, curBag.isProf) then
                    self.bankTotalCount = self.bankTotalCount + curBag.size
                    for slot = 1, curBag.size do
                        curBag[slot]:ClearAllPoints()
                        curBag[slot]:SetPoint("TOPLEFT", self.frame:GetName(), "TOPLEFT", self.leftBorder + (self.colWidth * (curCol - 1)) , 0 - self.topBorder - (self.rowHeight * curRow))
                        curBag[slot]:Show()                
                        if curCol == 1 then lastslot = curBag[slot] end
                        curCol = curCol + 1
                        if curCol > cols then curCol, curRow = 1, curRow + 1 end
                    end
                end
            else curRow = curRow + .1 end
        end
    end
    OneViewFrameBankInfo1:ClearAllPoints()
    if self.db.profile.show.bagslots and lastslot then
        OneViewFrameBag5:ClearAllPoints()
        OneViewFrameBag5:SetPoint("TOPLEFT", lastslot, "BOTTOMLEFT", 0, -10)
        OneViewFrameBankInfo1:SetPoint("TOPLEFT", OneViewFrameBag5, "BOTTOMLEFT", 0, -10)
        for i = 5, 10 do getglobal("OneViewFrameBag" .. i):Show() end
    elseif lastslot then
        for i = 5, 10 do getglobal("OneViewFrameBag" .. i):Hide() end
        curRow = curRow - 1
        OneViewFrameBankInfo1:SetPoint("TOPLEFT", lastslot, "BOTTOMLEFT", 0, -10)
    else
        for i = 5, 10 do getglobal("OneViewFrameBag" .. i):Hide() end
        curRow = curRow - 1
        OneViewFrameBankInfo1:SetPoint("TOPLEFT", OneViewFrameBankButton, "BOTTOMLEFT", 5, -10)
    end
    lastslot = nil
    curCol = 1
    curRow = curRow + (self.db.profile.show.bank and 3.5 or 2)
    for bag = 0, 4 do
        local curBag = self.frame.bags[bag]
        if curBag and curBag.size and curBag.size > 0 then
            if curBag.isAmmo then
                self.invAmmoSlots = self.invAmmoSlots + curBag.size
            elseif curBag.isSoul then
                self.invSoulSlots = self.invSoulSlots + curBag.size
            elseif curBag.isProf then
                self.invProfSlots = self.invProfSlots + curBag.size
            else
                self.invSlotCount = self.invSlotCount + curBag.size
            end
            if self.db.profile.show.inventory then
                if self:ShouldShow(bag, curBag.isAmmo, curBag.isSoul, curBag.isProf) then
                    self.invTotalCount = self.invTotalCount + curBag.size
                    for slot = 1, curBag.size do
                        curBag[slot]:ClearAllPoints()
                        curBag[slot]:SetPoint("TOPLEFT", self.frame:GetName(), "TOPLEFT", self.leftBorder + (self.colWidth * (curCol - 1)) , 0 - self.topBorder - (self.rowHeight * curRow))
                        curBag[slot]:Show()                
                        if curCol == 1 then lastslot = curBag[slot] end
                        curCol = curCol + 1
                        if curCol > cols then curCol, curRow = 1, curRow + 1 end
                    end
                end
                local invButton = getglobal(self.frame:GetName() .. "InventoryButton")
                invButton:ClearAllPoints()
                invButton:SetPoint("BOTTOMLEFT", self.frame.bags[0][1]:GetName(), "TOPLEFT", -5, 0)
            else
                local invButton = getglobal(self.frame:GetName() .. "InventoryButton")
                invButton:ClearAllPoints()
                invButton:SetPoint("BOTTOMLEFT", self.frame:GetName(), "BOTTOMLEFT", 3, 24)
            end
        end
    end
    OneViewFrameInventoryInfo1:ClearAllPoints()
    if self.db.profile.show.bagslots and lastslot then
        curRow = curRow + 1
        OneViewFrameBag1:ClearAllPoints()
        OneViewFrameBag1:SetPoint("TOPLEFT", lastslot, "BOTTOMLEFT", 0, -10)
        OneViewFrameInventoryInfo1:SetPoint("TOPLEFT", OneViewFrameBag1, "BOTTOMLEFT", 0, -5)
        for i = 1, 4 do getglobal("OneViewFrameBag" .. i):Show() end
    elseif lastslot then
        for i = 1, 4 do getglobal("OneViewFrameBag" .. i):Hide() end
        OneViewFrameInventoryInfo1:SetPoint("TOPLEFT", lastslot, "BOTTOMLEFT", 0, -5)
    else
        for i = 1, 4 do getglobal("OneViewFrameBag" .. i):Hide() end
        OneViewFrameInventoryInfo1:SetPoint("TOPLEFT", OneViewFrameInventoryButton, "BOTTOMLEFT", 5, -4)
    end
    if math.mod(self.invTotalCount, cols) ~= 0 then curRow = curRow + 1 end
    self.frame:SetHeight(curRow * self.rowHeight + self.bottomBorder + self.topBorder) 
    self.frame:SetWidth(cols * self.colWidth + self.leftBorder + self.rightBorder)
    OneViewFrameInventoryName:ClearAllPoints()
    OneViewFrameInventoryName:SetPoint("LEFT", OneViewFrameInventoryButton, "RIGHT", 5, 1)
    OneViewFrameBankName:ClearAllPoints()
    OneViewFrameBankName:SetPoint("LEFT", OneViewFrameBankButton, "RIGHT", 5, 1)
    local bankBagsText = self.LV and self.LV["%s's Bank Bags"] or self.L and self.L["%s's Bank Bags"] or "%s's Bank Bags"
    local bagsText = self.LV and self.LV["%s's Bags"] or self.L and self.L["%s's Bags"] or "%s's Bags"
    OneViewFrameBankName:SetText(format(bankBagsText, self.charId or ""))
    OneViewFrameInventoryName:SetText(format(bagsText, self.charId or ""))
end

function OneView:FillBags()
    for bag = -1, 10 do
        local curBag = self.frame.bags[bag]
        if curBag and curBag.size and curBag.size > 0 then
            for slot = 1, curBag.size do
                local itemId, qty = self.storage:SlotInfo(self.faction, self.charId, bag, slot)
                if itemId then
                    local itemName, itemLink, itemQuality, itemLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(itemId)
                    getglobal(curBag[slot]:GetName() .. "IconTexture"):SetTexture(itemTexture)
                    getglobal(curBag[slot]:GetName() .. "IconTexture"):Show()
                    if qty > 1 then
                        getglobal(curBag[slot]:GetName() .. "Count"):SetText(qty)
                        getglobal(curBag[slot]:GetName() .. "Count"):Show()
                    else
                        getglobal(curBag[slot]:GetName() .. "Count"):SetText("")
                        getglobal(curBag[slot]:GetName() .. "Count"):Hide()
                    end
                    curBag[slot].itemId = itemId
                    curBag[slot].itemQuality = itemQuality
                    curBag[slot].qty = qty
                    
                    -- 为OneView添加任务标志
                    local isQuestItem = (itemType == "Quest" or itemType == "任务" or itemType == "Key" or itemType == "钥匙")
                    local questIcon = curBag[slot].QuestIcon
                    if isQuestItem then
                        if not questIcon then
                            questIcon = curBag[slot]:CreateTexture(nil, "OVERLAY")
                            questIcon:SetTexture("Interface\\AddOns\\OneBag\\media\\questicon")
                            questIcon:SetWidth(16)
                            questIcon:SetHeight(16)
                            questIcon:SetPoint("TOPLEFT", curBag[slot], "TOPLEFT", 2, -2)
                            questIcon:SetAlpha(0.9)
                            curBag[slot].QuestIcon = questIcon
                        end
                        questIcon:Show()
                    elseif questIcon then
                        questIcon:Hide()
                    end
                else
                    getglobal(curBag[slot]:GetName() .. "IconTexture"):Hide()
                    getglobal(curBag[slot]:GetName() .. "Count"):Hide()
                    curBag[slot].itemId = nil
                    curBag[slot].itemQuality = nil
                    curBag[slot].qty = nil
                    if curBag[slot].QuestIcon then
                        curBag[slot].QuestIcon:Hide()
                    end
                end
                self:SetBorderColor(curBag[slot])
            end
        end
        local bagSlot = getglobal("OneViewFrameBag" .. bag)
        if bagSlot then 
            local itemId = self.storage:BagInfo(self.faction, self.charId, bag)
            if itemId then 
                local itemName, itemLink, itemQuality, itemLevel, itemType, itemSubType, itemCount, itemEquipLoc, itemTexture = GetItemInfo(itemId)
                getglobal(bagSlot:GetName() .. "IconTexture"):SetTexture(itemTexture)
                getglobal(bagSlot:GetName() .. "IconTexture"):Show()
                bagSlot.itemId = itemId
            else
                getglobal(bagSlot:GetName() .. "IconTexture"):Hide()
                bagSlot.itemId = nil
            end
        end
    end
    MoneyFrame_Update(self.frame:GetName().."MoneyFrame", self.storage:GetMoney(self.faction, self.charId) or 0)
    self:DoBankSlotCounts()
    self:DoInventorySlotCounts()
    
    -- 应用分类和品质过滤
    if OneViewCategory then
        OneViewCategory:ApplyFilter()
    end
    if OneViewQuality then
        OneViewQuality:ApplyFilter()
    end
end

function OneView:SetBorderColor(slot)        
    local color = {r = 1, g = 1, b = 1}
    local bag = slot:GetParent()
    local special = false
    if bag.isAmmo then 
        color = self.db.profile.colors.ammo
        special = true
    elseif bag.isSoul then
        color = self.db.profile.colors.soul
        special = true
    elseif bag.isProf then
        color = self.db.profile.colors.prof
        special = true
    elseif self.db.profile.colors.rarity and slot.itemQuality then
        color = ITEM_QUALITY_COLORS[slot.itemQuality]
        if slot.itemQuality > 1 then special = true end
    end
    if special and self.db.profile.colors.glow then        
        slot:SetNormalTexture("Interface\\Buttons\\UI-ActionButton-Border")
        slot:GetNormalTexture():SetBlendMode("ADD")
        slot:GetNormalTexture():SetAlpha(.8)
        slot:GetNormalTexture():SetPoint("CENTER", slot:GetName(), "CENTER", 0, 1)
    elseif special then
        slot:SetNormalTexture("Interface\\AddOns\\OneBag\\media\\BagSlot2")
        slot:GetNormalTexture():SetBlendMode("BLEND")
        slot:GetNormalTexture():SetPoint("CENTER", slot:GetName(), "CENTER", 0, 0)
    else
        slot:SetNormalTexture("Interface\\AddOns\\OneBag\\media\\BagSlot")
        slot:GetNormalTexture():SetBlendMode("BLEND")
        slot:GetNormalTexture():SetPoint("CENTER", slot:GetName(), "CENTER", 0, 0)
    end
    slot:GetNormalTexture():SetVertexColor(color.r, color.g, color.b)
end

function OneView:DoBankSlotCounts()
    local usedSlots, usedAmmoSlots, usedSoulSlots, usedProfSlots, ammoQuantity = 0, 0, 0, 0, 0 
    for k, bag in {-1, 5, 6, 7, 8, 9, 10} do
        if self.frame.bags[bag] then
            local tmp, qty = 0, 0
            for slot = 1, self.frame.bags[bag].size do
                if self.frame.bags[bag][slot].itemId then 
                    tmp = tmp + 1 
                    qty = qty + self.frame.bags[bag][slot].qty
                end
            end
            if self.frame.bags[bag].isAmmo then
                usedAmmoSlots = usedAmmoSlots + tmp
                ammoQuantity = ammoQuantity + qty
            elseif self.frame.bags[bag].isSoul then
                usedSoulSlots = usedSoulSlots + tmp
            elseif self.frame.bags[bag].isProf then
                usedProfSlots = usedProfSlots + tmp
            else
                usedSlots = usedSlots + tmp
            end
        end
    end
    local info = 1
    local name = self.frame:GetName() .. "BankInfo"    

getglobal(name .. info):SetText(format(L["%s/%s Slots"], usedSlots, self.bankSlotCount))
    info = info + 1
    for i = 2, 4 do getglobal(name .. i):SetText("") end
    if self.db.profile.show.counts then
        if self.bankAmmoSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Ammo"], ammoQuantity, self.bankAmmoSlots * 200))
            info = info + 1
        end
        if self.bankSoulSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Soul Shards"], usedSoulSlots, self.bankSoulSlots))
            info = info + 1
        end
        if self.bankProfSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Profession Slots"], usedProfSlots, self.bankProfSlots))
            info = info + 1
        end
    end
end

function OneView:DoInventorySlotCounts()
    local usedSlots, usedAmmoSlots, usedSoulSlots, usedProfSlots, ammoQuantity = 0, 0, 0, 0, 0 
    for bag = 0, 4 do
        if self.frame.bags[bag] then
            local tmp, qty = 0, 0
            for slot = 1, self.frame.bags[bag].size do
                if self.frame.bags[bag][slot].itemId then 
                    tmp = tmp + 1 
                    qty = qty + self.frame.bags[bag][slot].qty
                end
            end
            if self.frame.bags[bag].isAmmo then
                usedAmmoSlots = usedAmmoSlots + tmp
                ammoQuantity = ammoQuantity + qty
            elseif self.frame.bags[bag].isSoul then
                usedSoulSlots = usedSoulSlots + tmp
            elseif self.frame.bags[bag].isProf then
                usedProfSlots = usedProfSlots + tmp
            else
                usedSlots = usedSlots + tmp
            end
        end
    end
    local info = 1
    local name = self.frame:GetName() .. "InventoryInfo"    
    getglobal(name .. info):SetText(format(L["%s/%s Slots"], usedSlots, self.invSlotCount))
    info = info + 1
    for i = 2, 4 do getglobal(name .. i):SetText("") end
    if self.db.profile.show.counts then
        if self.invAmmoSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Ammo"], ammoQuantity, self.invAmmoSlots * 200))
            info = info + 1
        end
        if self.invSoulSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Soul Shards"], usedSoulSlots, self.invSoulSlots))
            info = info + 1
        end
        if self.invProfSlots > 0 then
            getglobal(name .. info):SetText(format(L["%s/%s Profession Slots"], usedProfSlots, self.invProfSlots))
            info = info + 1
        end
    end
end

function OneView:BuildCharSelectOptions()
    local list = self.storage:GetCharListByServerId()
    local args = {type="group", args = {}}
    for serverId, v in list do
        local _, _, server, faction = string.find(serverId, "(.+) . (.+)")

        local serverKey = string.gsub(server, "%s", "")

        local key = serverKey..faction
        args.args[key] = {name = serverId, type = 'group', desc = (self.LV and self.LV["Characters on "] or "Characters on ")..serverId, args = {}}
        
        for k, v2 in v do
            local fact = faction
            local _, _, charName, charId = string.find(v2, "(.+) . (.+)")

        local charKey = string.gsub(charName, "%s", "")
            
            local func = function() self:LoadCharacter(fact, charId) end
            args.args[key].args[charKey] = {name = charName, type = 'execute', func = func, desc = charName}
        end
    end

    self.dewdrop:Register(OneViewFrameCharSelectButton, 'children', args, 'point', 
        function(parent)
            if parent:GetTop() < GetScreenHeight() / 2 then 
                return "BOTTOMLEFT", "TOPLEFT" 
            else 
                return "TOPLEFT", "BOTTOMLEFT" 
            end
        end, 
        'dontHook', true)
end

function OneView:CharSelect()
    if self.dewdrop:IsOpen(getglobal(self.frame:GetName() .. "CharSelectButton")) then
        self.dewdrop:Close()
    else
        self.dewdrop:Open(getglobal(self.frame:GetName() .. "CharSelectButton"), OneViewFrameCharSelectButton)
    end
end

function OneView:LoadCharacter(faction, characterId)
    faction = faction or self.db.account.faction or AceLibrary("AceDB-2.0").FACTION
    characterId = characterId or self.db.account.characterId or AceLibrary("AceDB-2.0").CHAR_ID
    if self.db.profile.remember then
        self.db.account.faction = faction
        self.db.account.characterId = characterId
    end
    self.faction = faction
    self.charId = characterId
    self:BuildFrame()
    self:OrganizeFrame()
    self:FillBags()
    
    -- 重置搜索框
    if self.frame.searchFrame then
        self.frame.searchFrame.edit:SetText(self.L["Search"] or "Search")
        self.frame.searchFrame.button:Hide()
        self:ResetSearchFilter()
    end
    
    -- 重置分类和品质过滤
    if OneViewCategory then
        OneViewCategory:SetActiveCategory()
    end
    if OneViewQuality then
        OneViewQuality:SetActiveQuality()
    end
    
    -- 重新应用显示逻辑（根据银行是否显示）
    local bankVisible = self.db.profile.show.bank
    
    if bankVisible then
        -- 分类模块检查全局开关
        local filterVisible = true
        if OneBag and OneBag.db and OneBag.db.profile then
            filterVisible = OneBag.db.profile.filterModulesVisible
        end
        
        if filterVisible then
            if OneViewCategory then
                OneViewCategory:UpdateButtons()
            end
        else
            if OneViewCategory then
                OneViewCategory:Hide()
            end
        end
        
        -- 品质模块始终显示
        if OneViewQuality then
            OneViewQuality:UpdateButtons()
        end
    else
        -- 如果银行部分不显示，隐藏分类和品质模块
        if OneViewCategory then
            OneViewCategory:Hide()
        end
        if OneViewQuality then
            OneViewQuality:Hide()
        end
    end
end

function OneView:LinkItem(itemId)
    local name, link, quality = GetItemInfo(itemId)
    if ChatFrameEditBox:IsShown() then
        ChatFrameEditBox:Insert(format("%s|H%s|h[%s]|h|r", ITEM_QUALITY_COLORS[quality].hex, link, name))
    end    
end

function OneView:OnCustomShow() 
    if self.db.profile.point then
        local point = self.db.profile.point
        this:ClearAllPoints()
        this:SetPoint("TOPLEFT", point.parent, "BOTTOMLEFT", point.left, point.top)
    end

    -- 确保搜索框显示
    if self.frame.searchFrame then
        self.frame.searchFrame:Show()
    end
    
    -- OneView没有bagFrame，但有bank按钮切换银行显示
    local bankVisible = self.db.profile.show.bank
    
    -- 分类模块的显示逻辑 - 只在银行显示时检查
    if bankVisible then
        -- 检查全局开关 - 从 OneBag 数据库获取
        local filterVisible = true
        if OneBag and OneBag.db and OneBag.db.profile then
            filterVisible = OneBag.db.profile.filterModulesVisible
        end
        
        if filterVisible then
            if OneViewCategory then
                OneViewCategory:UpdateButtons()
            end
        else
            -- 如果全局开关关闭，隐藏分类标签页
            if OneViewCategory then
                OneViewCategory:Hide()
            end
        end
    else
        -- 如果银行部分不显示，隐藏分类标签页
        if OneViewCategory then
            OneViewCategory:Hide()
        end
    end
    
    -- 品质模块的显示逻辑 - 始终显示（当银行显示时）
    if bankVisible then
        if OneViewQuality then
            OneViewQuality:UpdateButtons()
        end
    else
        -- 如果银行部分不显示，隐藏品质模块
        if OneViewQuality then
            OneViewQuality:Hide()
        end
    end
end

function OneView:OnCustomHide()
    -- 如果有搜索框，可以在隐藏时重置搜索
    if self.frame.searchFrame then
        self.frame.searchFrame.edit:SetText(self.L["Search"] or "Search")
        self.frame.searchFrame.button:Hide()
        self:ResetSearchFilter()
    end
    
    -- 隐藏分类和品质按钮
    if OneViewCategory then
        OneViewCategory:Hide()
    end
    if OneViewQuality then
        OneViewQuality:Hide()
    end
end

-- 在 OneView 模块中，需要重写搜索过滤函数，因为OneView使用的是离线数据：
function OneView:SearchFilter()
    local searchText = self.frame.searchFrame.edit:GetText()
    if not searchText or searchText == "" or searchText == (self.L["Search"] or "Search") then
        self:ResetSearchFilter()
        return
    end
    
    searchText = string.lower(searchText)
    
    for k, bag in self.fBags do
        if self.frame.bags[bag] then
            for slot = 1, self.frame.bags[bag].size do
                local item = self.frame.bags[bag][slot]
                if item and item:IsVisible() then
                    if item.itemId then
                        local itemName = GetItemInfo(item.itemId) or ""
                        -- 同时检查分类和品质过滤
                        local categoryMatch = true
                        local qualityMatch = true
                        
                        if OneViewCategory and OneViewCategory:GetActiveCategory() then
                            local category = OneViewCategory:GetItemCategory(item.itemId)
                            categoryMatch = (category == OneViewCategory:GetActiveCategory())
                        end
                        
                        if OneViewQuality and OneViewQuality:GetActiveQuality() then
                            local _, _, quality = GetItemInfo(item.itemId)
                            qualityMatch = (OneViewQuality:GetActiveQuality() == 1 and (quality == 0 or quality == 1)) or (quality == OneViewQuality:GetActiveQuality())
                        end
                        
                        if string.find(string.lower(itemName), searchText) and categoryMatch and qualityMatch then
                            item:SetAlpha(1)
                        else
                            item:SetAlpha(0.25)
                        end
                    else
                        item:SetAlpha(0.25)
                    end
                end
            end
        end
    end
end

function OneView:ResetSearchFilter()
    for k, bag in self.fBags do
        if self.frame.bags[bag] then
            for slot = 1, self.frame.bags[bag].size do
                local item = self.frame.bags[bag][slot]
                if item then
                    -- 应用分类和品质过滤
                    local categoryMatch = true
                    local qualityMatch = true
                    
                    if OneViewCategory and OneViewCategory:GetActiveCategory() then
                        local category = item.itemId and OneViewCategory:GetItemCategory(item.itemId) or "misc"
                        categoryMatch = (category == OneViewCategory:GetActiveCategory())
                    end
                    
                    if OneViewQuality and OneViewQuality:GetActiveQuality() then
                        local _, _, quality = item.itemId and GetItemInfo(item.itemId) or 0
                        qualityMatch = (OneViewQuality:GetActiveQuality() == 1 and (quality == 0 or quality == 1)) or (quality == OneViewQuality:GetActiveQuality())
                    end
                    
                    if categoryMatch and qualityMatch then
                        item:SetAlpha(1)
                    else
                        item:SetAlpha(0.25)
                    end
                end
            end
        end
    end
end

function OneView:GetDefaults()
    if not self.defaults then
        self.defaults = {
            cols = 12, scale = 1, alpha = 1,
            colors = {
                mouseover = {r = 0, g = .7, b = 1},
                ammo = {r = 1, g = 1, b = 0},
                soul = {r = .5, g = .5, b = 1}, 
                prof = {r = 1, g = 0, b = 1},
                bground = {r = 0, g = 0, b = 0, a = .45},
                glow = false, rarity = true,
            },
            show = {['*'] = true},
            strata = 3, locked = false, clamped = true, bagBreak = false,
            remember = true,  -- 是否记住最后选择的角色
        }
    end
    return self.defaults
end

-- 文件末尾添加使用说明
local function PrintHelp()
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[OneBag] 分类过滤模块控制命令:|r")
    DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00/obtogglefilters 或 /obtf - 切换过滤模块的显示/隐藏|r")
    DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00在插件设置菜单中也可以找到此选项|r")
end

-- 注册帮助命令
SlashCmdList["ONEBAG_HELP"] = PrintHelp
SLASH_ONEBAG_HELP1 = "/obhelp"
SLASH_ONEBAG_HELP2 = "/onebaghelp"
