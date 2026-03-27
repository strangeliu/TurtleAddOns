-- 小地图按钮

local minimapButton = nil

-- 创建小地图按钮
local function CreateMinimapButton()
    if minimapButton then return minimapButton end
    
    -- 创建按钮
    local button = CreateFrame("Button", "LootAlertMinimapButton", Minimap)
    button:SetWidth(32)
    button:SetHeight(32)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)
    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    
    -- 图标
    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetWidth(20)
    icon:SetHeight(20)
    icon:SetPoint("CENTER", button, "CENTER", 0, 1)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Coin_01")  -- 使用金币图标
    button.icon = icon
    
    -- 边框
    local overlay = button:CreateTexture(nil, "OVERLAY")
    overlay:SetWidth(53)
    overlay:SetHeight(53)
    overlay:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
    overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    
    -- 拖动功能
    button:SetMovable(true)
    button:EnableMouse(true)
    button:RegisterForDrag("LeftButton")
    button:RegisterForClicks("LeftButtonUp")
    
    local function UpdatePosition()
        local angle = LootAlertDB.minimapAngle or 180
        local x = 80 * cos(angle)
        local y = 80 * sin(angle)
        button:ClearAllPoints()
        button:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end
    
    button:SetScript("OnDragStart", function()
        this:LockHighlight()
        this:SetScript("OnUpdate", function()
            local mx, my = Minimap:GetCenter()
            local px, py = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            px, py = px / scale, py / scale
            
            local angle = math.deg(math.atan2(py - my, px - mx))
            LootAlertDB.minimapAngle = angle
            UpdatePosition()
        end)
    end)
    
    button:SetScript("OnDragStop", function()
        this:SetScript("OnUpdate", nil)
        this:UnlockHighlight()
    end)
    
    -- 点击事件（移除右键功能）
    button:SetScript("OnClick", function()
        if arg1 == "LeftButton" then
            -- 左键打开设置
            ShowLootAlertConfig()
        end
    end)
    
    -- Tooltip（只显示信息，移除右键提示）
    button:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_LEFT")
        GameTooltip:AddLine("拾取提示", 1, 1, 1)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("左键: 打开设置", 0.2, 1, 0.2)
        GameTooltip:AddLine("拖动: 移动按钮", 0.2, 1, 0.2)
        GameTooltip:AddLine(" ")
        if LootAlertDB.enabled then
            GameTooltip:AddLine("状态: |cff00ff00已启用|r")
        else
            GameTooltip:AddLine("状态: |cffff0000已禁用|r")
        end
        GameTooltip:Show()
    end)
    
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    -- 初始位置
    UpdatePosition()
    button:Show()
    
    minimapButton = button
    return button
end

-- 显示/隐藏小地图按钮
function ToggleMinimapButton()
    if not minimapButton then
        CreateMinimapButton()
    else
        if minimapButton:IsShown() then
            minimapButton:Hide()
            LootAlertDB.minimapButton = false
        else
            minimapButton:Show()
            LootAlertDB.minimapButton = true
        end
    end
end

-- 初始化小地图按钮
function InitMinimapButton()
    if LootAlertDB.minimapButton == nil then
        LootAlertDB.minimapButton = true
    end
    
    if LootAlertDB.minimapButton then
        CreateMinimapButton()
    end
end
