-- 拾取提示设置面板

local configFrame = nil

-- 创建 DragonflightReloaded 风格的按钮
local function CreateDFButton(parent, width, height, text, colorType)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetWidth(width)
    btn:SetHeight(height)
    
    -- 背景和边框
    btn:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    
    -- 根据类型设置颜色
    if colorType == "red" then
        -- 红色按钮（重置/危险操作）
        btn:SetBackdropColor(0.5, 0, 0, 0.8)
        btn:SetBackdropBorderColor(0.8, 0.1, 0.1, 1)
    elseif colorType == "green" then
        -- 绿色按钮（确认操作）
        btn:SetBackdropColor(0, 0.3, 0, 0.8)
        btn:SetBackdropBorderColor(0.1, 0.8, 0.1, 1)
    else
        -- 默认深色按钮
        btn:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
        btn:SetBackdropBorderColor(1, 0.82, 0, 1)  -- 金色边框
    end
    
    -- 按钮文字
    btn.text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    btn.text:SetPoint("CENTER", btn, "CENTER", 0, 0)
    btn.text:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    btn.text:SetText(text)
    btn.text:SetTextColor(1, 0.85, 0.1)  -- 金色文字
    
    -- 鼠标悬停效果
    btn:SetScript("OnEnter", function()
        if colorType == "red" then
            this:SetBackdropColor(0.7, 0, 0, 0.9)
            this:SetBackdropBorderColor(1, 0.2, 0.2, 1)
        elseif colorType == "green" then
            this:SetBackdropColor(0, 0.5, 0, 0.9)
            this:SetBackdropBorderColor(0.2, 1, 0.2, 1)
        else
            this:SetBackdropColor(0.2, 0.2, 0.2, 0.9)
            this:SetBackdropBorderColor(1, 1, 0, 1)  -- 更亮的金色
        end
    end)
    
    btn:SetScript("OnLeave", function()
        if colorType == "red" then
            this:SetBackdropColor(0.5, 0, 0, 0.8)
            this:SetBackdropBorderColor(0.8, 0.1, 0.1, 1)
        elseif colorType == "green" then
            this:SetBackdropColor(0, 0.3, 0, 0.8)
            this:SetBackdropBorderColor(0.1, 0.8, 0.1, 1)
        else
            this:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
            this:SetBackdropBorderColor(1, 0.82, 0, 1)
        end
    end)
    
    -- 按下效果
    btn:SetScript("OnMouseDown", function()
        this.text:SetPoint("CENTER", this, "CENTER", 1, -1)
    end)
    
    btn:SetScript("OnMouseUp", function()
        this.text:SetPoint("CENTER", this, "CENTER", 0, 0)
    end)
    
    return btn
end

-- 创建设置面板
local function CreateConfigPanel()
    if configFrame then return configFrame end
    
    -- 主框架
    local frame = CreateFrame("Frame", "LootAlertConfigFrame", UIParent)
    frame:SetWidth(600)
    frame:SetHeight(600)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    frame:SetFrameStrata("DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetClampedToScreen(true)
    frame:Hide()
    
    -- 背景（DragonflightReloaded 风格 - 深色半透明 + 金色边框）
    frame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",  -- 纯色背景
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.95)  -- 深黑色半透明背景
    frame:SetBackdropBorderColor(1, 0.82, 0, 1)  -- 金色边框（DragonflightReloaded 风格）
    
    -- 标题（DragonflightReloaded 风格 - 更亮的金色，无背景条）
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -20)
    title:SetFont("Fonts\\FZXHLJW.TTF", 16, "OUTLINE")  -- 更大的字体
    title:SetText("拾取提示设置")
    title:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    -- 关闭按钮（右上角，DragonflightReloaded 风格）
    local closeBtn = CreateDFButton(frame, 60, 25, "关闭", "default")
    closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -10, -10)
    closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)
    
    -- 使标题栏可拖动
    local titleBar = CreateFrame("Frame", nil, frame)
    titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
    titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -80, -10)
    titleBar:SetHeight(30)
    titleBar:EnableMouse(true)
    titleBar:SetScript("OnMouseDown", function()
        frame:StartMoving()
    end)
    titleBar:SetScript("OnMouseUp", function()
        frame:StopMovingOrSizing()
    end)
    
    -- 顶部标签按钮区域（模仿 DragonflightReloaded 的插件管理界面）
    local tabY = -50
    
    -- 创建内容容器（用于分组显示不同标签的内容）
    local contentFrames = {}
    
    -- 创建标签按钮（居中显示）
    -- 计算居中位置：4个按钮，每个120宽，间隔5，总宽度 = 120*4 + 5*3 = 495
    local totalWidth = 120 * 4 + 5 * 3
    local startX = (600 - totalWidth) / 2  -- 600是frame的宽度
    
    local tab1 = CreateDFButton(frame, 120, 28, "基础设置", "default")
    tab1:SetPoint("TOPLEFT", frame, "TOPLEFT", startX, tabY)
    tab1:SetBackdropColor(0.15, 0.15, 0.15, 0.9)  -- 选中状态
    tab1:SetBackdropBorderColor(1, 0.85, 0.1, 1)
    
    local tab2 = CreateDFButton(frame, 120, 28, "音效设置", "default")
    tab2:SetPoint("LEFT", tab1, "RIGHT", 5, 0)
    tab2:SetBackdropColor(0.05, 0.05, 0.05, 0.7)  -- 未选中状态
    
    local tab3 = CreateDFButton(frame, 120, 28, "显示设置", "default")
    tab3:SetPoint("LEFT", tab2, "RIGHT", 5, 0)
    tab3:SetBackdropColor(0.05, 0.05, 0.05, 0.7)  -- 未选中状态
    
    local tab4 = CreateDFButton(frame, 120, 28, "高级选项", "default")
    tab4:SetPoint("LEFT", tab3, "RIGHT", 5, 0)
    tab4:SetBackdropColor(0.05, 0.05, 0.05, 0.7)  -- 未选中状态
    
    -- 创建4个内容框架
    for i = 1, 4 do
        local contentFrame = CreateFrame("Frame", nil, frame)
        contentFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, -90)
        contentFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 70)
        contentFrame:Hide()  -- 默认隐藏
        contentFrames[i] = contentFrame
    end
    
    -- 显示第一个标签的内容
    contentFrames[1]:Show()
    
    -- 标签按钮点击事件
    local function SelectTab(selectedTab, tabIndex)
        -- 重置所有标签
        tab1:SetBackdropColor(0.05, 0.05, 0.05, 0.7)
        tab2:SetBackdropColor(0.05, 0.05, 0.05, 0.7)
        tab3:SetBackdropColor(0.05, 0.05, 0.05, 0.7)
        tab4:SetBackdropColor(0.05, 0.05, 0.05, 0.7)
        
        -- 隐藏所有内容
        for i = 1, 4 do
            contentFrames[i]:Hide()
        end
        
        -- 高亮选中的标签
        selectedTab:SetBackdropColor(0.15, 0.15, 0.15, 0.9)
        
        -- 显示对应的内容
        contentFrames[tabIndex]:Show()
    end
    
    tab1:SetScript("OnClick", function() SelectTab(this, 1) end)
    tab2:SetScript("OnClick", function() SelectTab(this, 2) end)
    tab3:SetScript("OnClick", function() SelectTab(this, 3) end)
    tab4:SetScript("OnClick", function() SelectTab(this, 4) end)
    
    -- 将后续的控件添加到对应的内容框架中
    -- 第一个标签：基础设置
    local basicFrame = contentFrames[1]
    local yOffset = -20
    
    -- 启用/禁用复选框（DragonflightReloaded 风格）
    local enableCheck = CreateFrame("CheckButton", "LootAlertEnableCheck", basicFrame, "UICheckButtonTemplate")
    enableCheck:SetPoint("TOPLEFT", basicFrame, "TOPLEFT", 30, yOffset)
    local enableText = getglobal(enableCheck:GetName() .. "Text")
    enableText:SetText("启用拾取提示")
    enableText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    enableText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    enableCheck:SetChecked(LootAlertDB.enabled)
    enableCheck:SetScript("OnClick", function()
        LootAlertDB.enabled = this:GetChecked() == 1
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] " .. (LootAlertDB.enabled and "已启用" or "已禁用") .. "|r")
    end)
    
    yOffset = yOffset - 45
    
    -- 显示金币复选框（左边）
    local moneyCheck = CreateFrame("CheckButton", "LootAlertMoneyCheck", basicFrame, "UICheckButtonTemplate")
    moneyCheck:SetPoint("TOPLEFT", basicFrame, "TOPLEFT", 30, yOffset)
    local moneyText = getglobal(moneyCheck:GetName() .. "Text")
    moneyText:SetText("显示金币拾取")
    moneyText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    moneyText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    moneyCheck:SetChecked(LootAlertDB.showMoney)
    moneyCheck:SetScript("OnClick", function()
        LootAlertDB.showMoney = this:GetChecked() == 1
    end)
    
    -- 边框样式下拉菜单（右边，和"显示金币拾取"同一行）
    local borderStyleLabel = basicFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    borderStyleLabel:SetPoint("TOPRIGHT", basicFrame, "TOPRIGHT", -40, yOffset + 5)
    borderStyleLabel:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    borderStyleLabel:SetText("边框样式")
    borderStyleLabel:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local borderStyleDropdown = CreateFrame("Frame", "LootAlertBorderStyleDropdown", basicFrame, "UIDropDownMenuTemplate")
    borderStyleDropdown:SetPoint("TOPRIGHT", borderStyleLabel, "BOTTOMRIGHT", 15, -5)
    
    -- 边框样式选项
    local borderStyles = {
        {value = "default", text = "默认"},
        {value = "beautycase", text = "美化"},
        {value = "azerite", text = "艾泽里特（粗边框）"},
        {value = "elv", text = "ElvUI（极简）"},
    }
    
    UIDropDownMenu_Initialize(borderStyleDropdown, function()
        for _, style in ipairs(borderStyles) do
            local info = {}
            info.text = style.text
            info.value = style.value
            -- 使用闭包捕获 style 的值
            local capturedText = style.text
            local capturedValue = style.value
            info.func = function()
                LootAlertDB.borderStyle = capturedValue
                UIDropDownMenu_SetSelectedValue(borderStyleDropdown, capturedValue)
                -- 更新所有提示框的边框样式
                if alertPool then
                    for _, alert in ipairs(alertPool) do
                        if ApplyBorderStyle then
                            ApplyBorderStyle(alert)
                        end
                    end
                end
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 边框样式已更改为: " .. capturedText .. "|r")
            end
            info.checked = (LootAlertDB.borderStyle == style.value)
            UIDropDownMenu_AddButton(info)
        end
    end)
    
    -- 设置当前选中的边框样式
    UIDropDownMenu_SetSelectedValue(borderStyleDropdown, LootAlertDB.borderStyle or "azerite")
    UIDropDownMenu_SetWidth(180, borderStyleDropdown)  -- WoW 1.12: 参数顺序是 (width, frame)
    
    yOffset = yOffset - 45
    
    -- 显示物品等级复选框（左边）
    local itemLevelCheck = CreateFrame("CheckButton", "LootAlertItemLevelCheck", basicFrame, "UICheckButtonTemplate")
    itemLevelCheck:SetPoint("TOPLEFT", basicFrame, "TOPLEFT", 30, yOffset)
    local itemLevelText = getglobal(itemLevelCheck:GetName() .. "Text")
    itemLevelText:SetText("显示物品等级")
    itemLevelText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    itemLevelText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    itemLevelCheck:SetChecked(LootAlertDB.showItemLevel)
    itemLevelCheck:SetScript("OnClick", function()
        LootAlertDB.showItemLevel = this:GetChecked() == 1
    end)
    
    -- 鼠标穿透复选框（右边）
    local mouseThroughCheck = CreateFrame("CheckButton", "LootAlertMouseThroughCheck", basicFrame, "UICheckButtonTemplate")
    mouseThroughCheck:SetPoint("LEFT", itemLevelCheck, "RIGHT", 150, 0)
    local mouseThroughText = getglobal(mouseThroughCheck:GetName() .. "Text")
    mouseThroughText:SetText("鼠标穿透")
    mouseThroughText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    mouseThroughText:SetTextColor(1, 0.85, 0.1)
    mouseThroughCheck:SetChecked(LootAlertDB.mouseThrough)
    mouseThroughCheck:SetScript("OnClick", function()
        LootAlertDB.mouseThrough = this:GetChecked() == 1
        -- 更新所有提示框的鼠标交互状态
        if UpdateAllMouseInteraction then
            UpdateAllMouseInteraction()
        end
    end)
    
    yOffset = yOffset - 45
    
    -- 追踪金币损失复选框（参考 ls_Toasts）
    local trackLossCheck = CreateFrame("CheckButton", "LootAlertTrackLossCheck", basicFrame, "UICheckButtonTemplate")
    trackLossCheck:SetPoint("TOPLEFT", basicFrame, "TOPLEFT", 30, yOffset)
    local trackLossText = getglobal(trackLossCheck:GetName() .. "Text")
    trackLossText:SetText("追踪金币损失（维修/购买）")
    trackLossText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    trackLossText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    trackLossCheck:SetChecked(LootAlertDB.trackLoss or false)
    trackLossCheck:SetScript("OnClick", function()
        LootAlertDB.trackLoss = this:GetChecked() == 1
        -- 如果启用追踪损失，禁用阈值
        if LootAlertDB.trackLoss then
            LootAlertDB.useGoldThreshold = false
            if thresholdCheck then
                thresholdCheck:SetChecked(false)
            end
        end
    end)
    
    yOffset = yOffset - 45
    
    -- 金币阈值复选框
    local thresholdCheck = CreateFrame("CheckButton", "LootAlertThresholdCheck", basicFrame, "UICheckButtonTemplate")
    thresholdCheck:SetPoint("TOPLEFT", basicFrame, "TOPLEFT", 30, yOffset)
    local thresholdCheckText = getglobal(thresholdCheck:GetName() .. "Text")
    thresholdCheckText:SetText("启用金币阈值")
    thresholdCheckText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    thresholdCheckText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    thresholdCheck:SetChecked(LootAlertDB.useGoldThreshold or false)
    thresholdCheck:SetScript("OnClick", function()
        LootAlertDB.useGoldThreshold = this:GetChecked() == 1
        -- 如果启用阈值，禁用追踪损失
        if LootAlertDB.useGoldThreshold then
            LootAlertDB.trackLoss = false
            if trackLossCheck then
                trackLossCheck:SetChecked(false)
            end
        end
    end)
    
    -- 金币阈值输入框（在右边）
    local thresholdLabel = basicFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    thresholdLabel:SetPoint("LEFT", thresholdCheck, "RIGHT", 150, 0)
    thresholdLabel:SetFont("Fonts\\FZXHLJW.TTF", 12, "OUTLINE")
    thresholdLabel:SetText("阈值(铜币):")
    thresholdLabel:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local thresholdInput = CreateFrame("EditBox", "LootAlertThresholdInput", basicFrame, "InputBoxTemplate")
    thresholdInput:SetPoint("LEFT", thresholdLabel, "RIGHT", 5, 0)
    thresholdInput:SetWidth(80)
    thresholdInput:SetHeight(25)
    thresholdInput:SetAutoFocus(false)
    thresholdInput:SetText(tostring(LootAlertDB.goldThreshold or 1))
    -- 添加背景
    local inputBg = thresholdInput:CreateTexture(nil, "BACKGROUND")
    inputBg:SetAllPoints()
    inputBg:SetTexture(0, 0, 0, 0.5)
    thresholdInput:SetScript("OnEnterPressed", function()
        local value = tonumber(this:GetText())
        if value and value >= 1 then
            LootAlertDB.goldThreshold = value
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 金币阈值设置为 " .. value .. " 铜币|r")
        else
            this:SetText(tostring(LootAlertDB.goldThreshold or 1))
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[拾取提示] 请输入大于等于1的数字|r")
        end
        this:ClearFocus()
    end)
    
    -- 阈值说明
    local thresholdDesc = basicFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    thresholdDesc:SetPoint("LEFT", thresholdInput, "RIGHT", 10, 0)
    thresholdDesc:SetText("(低于此值不显示)")
    thresholdDesc:SetTextColor(0.7, 0.7, 0.7)
    
    -- 第二个标签：音效设置
    local soundFrame = contentFrames[2]
    yOffset = -20
    
    -- 播放物品音效复选框
    local soundCheck = CreateFrame("CheckButton", "LootAlertSoundCheck", soundFrame, "UICheckButtonTemplate")
    soundCheck:SetPoint("TOPLEFT", soundFrame, "TOPLEFT", 30, yOffset)
    local soundCheckText = getglobal(soundCheck:GetName() .. "Text")
    soundCheckText:SetText("播放物品音效")
    soundCheckText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    soundCheckText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    soundCheck:SetChecked(LootAlertDB.playSound)
    soundCheck:SetScript("OnClick", function()
        LootAlertDB.playSound = this:GetChecked() == 1
        -- 测试音效
        if LootAlertDB.playSound and PlayLootSound then
            PlayLootSound()
        end
    end)
    
    -- 根据品质自动选择音效复选框（在右边）
    local autoSoundCheck = CreateFrame("CheckButton", "LootAlertAutoSoundCheck", soundFrame, "UICheckButtonTemplate")
    autoSoundCheck:SetPoint("LEFT", soundCheck, "RIGHT", 150, 0)
    local autoSoundText = getglobal(autoSoundCheck:GetName() .. "Text")
    autoSoundText:SetText("根据品质自动选择")
    autoSoundText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    autoSoundText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    autoSoundCheck:SetChecked(LootAlertDB.autoSoundByQuality)
    autoSoundCheck:SetScript("OnClick", function()
        LootAlertDB.autoSoundByQuality = this:GetChecked() == 1
    end)
    
    yOffset = yOffset - 45
    
    -- 播放金币音效复选框
    local moneySoundCheck = CreateFrame("CheckButton", "LootAlertMoneySoundCheck", soundFrame, "UICheckButtonTemplate")
    moneySoundCheck:SetPoint("TOPLEFT", soundFrame, "TOPLEFT", 30, yOffset)
    local moneySoundText = getglobal(moneySoundCheck:GetName() .. "Text")
    moneySoundText:SetText("播放金币音效")
    moneySoundText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    moneySoundText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    moneySoundCheck:SetChecked(LootAlertDB.playMoneySound)
    moneySoundCheck:SetScript("OnClick", function()
        LootAlertDB.playMoneySound = this:GetChecked() == 1
        -- 测试金币音效
        if LootAlertDB.playMoneySound and PlayMoneySound then
            PlayMoneySound()
        end
    end)
    
    -- 第三个标签：显示设置
    local displayFrame = contentFrames[3]
    yOffset = -20
    
    -- 最低品质滑块（左边）
    local qualitySlider = CreateFrame("Slider", "LootAlertQualitySlider", displayFrame, "OptionsSliderTemplate")
    qualitySlider:SetPoint("TOPLEFT", displayFrame, "TOPLEFT", 40, yOffset)
    qualitySlider:SetMinMaxValues(0, 5)
    qualitySlider:SetValue(LootAlertDB.minQuality)
    qualitySlider:SetValueStep(1)
    qualitySlider:SetWidth(220)
    getglobal(qualitySlider:GetName() .. "Low"):SetText("灰色")
    getglobal(qualitySlider:GetName() .. "High"):SetText("橙色")
    local qualityText = getglobal(qualitySlider:GetName() .. "Text")
    qualityText:SetText("最低品质")
    qualityText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    qualityText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local qualityNames = {"灰色", "白色", "绿色", "蓝色", "紫色", "橙色"}
    local qualityColors = {
        {0.6, 0.6, 0.6},  -- 灰色
        {1.0, 1.0, 1.0},  -- 白色
        {0.1, 1.0, 0.1},  -- 绿色
        {0.0, 0.5, 1.0},  -- 蓝色
        {0.7, 0.3, 1.0},  -- 紫色
        {1.0, 0.5, 0.0},  -- 橙色
    }
    local qualityLabel = displayFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    qualityLabel:SetPoint("TOP", qualitySlider, "BOTTOM", 0, 0)
    qualityLabel:SetText(qualityNames[LootAlertDB.minQuality + 1])
    local color = qualityColors[LootAlertDB.minQuality + 1]
    qualityLabel:SetTextColor(color[1], color[2], color[3])
    
    qualitySlider:SetScript("OnValueChanged", function()
        local value = this:GetValue()
        LootAlertDB.minQuality = value
        qualityLabel:SetText(qualityNames[value + 1])
        local color = qualityColors[value + 1]
        qualityLabel:SetTextColor(color[1], color[2], color[3])
    end)
    
    -- 背景透明度滑块（右边）
    local alphaSlider = CreateFrame("Slider", "LootAlertAlphaSlider", displayFrame, "OptionsSliderTemplate")
    alphaSlider:SetPoint("TOPRIGHT", displayFrame, "TOPRIGHT", -40, yOffset)
    alphaSlider:SetMinMaxValues(0.0, 1.0)
    alphaSlider:SetValue(LootAlertDB.bgAlpha or 1.0)
    alphaSlider:SetValueStep(0.05)
    alphaSlider:SetWidth(220)
    getglobal(alphaSlider:GetName() .. "Low"):SetText("透明")
    getglobal(alphaSlider:GetName() .. "High"):SetText("不透明")
    local alphaText = getglobal(alphaSlider:GetName() .. "Text")
    alphaText:SetText("背景透明度")
    alphaText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    alphaText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local alphaLabel = displayFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    alphaLabel:SetPoint("TOP", alphaSlider, "BOTTOM", 0, 0)
    alphaLabel:SetText(string.format("%.0f%%", (LootAlertDB.bgAlpha or 1.0) * 100))
    
    alphaSlider:SetScript("OnValueChanged", function()
        local value = this:GetValue()
        LootAlertDB.bgAlpha = value
        alphaLabel:SetText(string.format("%.0f%%", value * 100))
        -- 更新所有正在显示的提示框的整体透明度
        for _, alert in ipairs(activeAlerts) do
            if alert:IsShown() then
                -- 如果正在暂停或显示中，直接设置为用户透明度
                if alert.isPaused or (GetTime() - alert.startTime < LootAlertDB.duration) then
                    alert:SetAlpha(value)
                else
                    -- 如果正在淡出，保持淡出效果但应用透明度
                    local elapsed = GetTime() - alert.startTime
                    if elapsed < LootAlertDB.duration + 1.2 then
                        local fadeProgress = (elapsed - LootAlertDB.duration) / 1.2
                        alert:SetAlpha((1 - fadeProgress) * value)
                    end
                end
            end
        end
    end)
    
    yOffset = yOffset - 65
    
    -- 缩放滑块（左边）
    local scaleSlider = CreateFrame("Slider", "LootAlertScaleSlider", displayFrame, "OptionsSliderTemplate")
    scaleSlider:SetPoint("TOPLEFT", displayFrame, "TOPLEFT", 40, yOffset)
    scaleSlider:SetMinMaxValues(0.5, 2.0)
    scaleSlider:SetValue(LootAlertDB.scale)
    scaleSlider:SetValueStep(0.1)
    scaleSlider:SetWidth(220)
    getglobal(scaleSlider:GetName() .. "Low"):SetText("50%")
    getglobal(scaleSlider:GetName() .. "High"):SetText("200%")
    local scaleText = getglobal(scaleSlider:GetName() .. "Text")
    scaleText:SetText("缩放比例")
    scaleText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    scaleText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local scaleLabel = displayFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    scaleLabel:SetPoint("TOP", scaleSlider, "BOTTOM", 0, 0)
    scaleLabel:SetText(string.format("%.1f", LootAlertDB.scale))
    
    scaleSlider:SetScript("OnValueChanged", function()
        local value = this:GetValue()
        LootAlertDB.scale = value
        scaleLabel:SetText(string.format("%.1f", value))
        -- 更新所有提示框的缩放
        for _, alert in ipairs(alertPool) do
            if not alert:IsShown() then
                alert:SetScale(value)
            end
        end
    end)
    
    -- 最大显示数量滑块（右边）
    local maxSlider = CreateFrame("Slider", "LootAlertMaxSlider", displayFrame, "OptionsSliderTemplate")
    maxSlider:SetPoint("TOPRIGHT", displayFrame, "TOPRIGHT", -40, yOffset)
    maxSlider:SetMinMaxValues(1, 12)
    maxSlider:SetValue(LootAlertDB.maxAlerts)
    maxSlider:SetValueStep(1)
    maxSlider:SetWidth(220)
    getglobal(maxSlider:GetName() .. "Low"):SetText("1")
    getglobal(maxSlider:GetName() .. "High"):SetText("12")
    local maxText = getglobal(maxSlider:GetName() .. "Text")
    maxText:SetText("最大显示数量")
    maxText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    maxText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local maxLabel = displayFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    maxLabel:SetPoint("TOP", maxSlider, "BOTTOM", 0, 0)
    maxLabel:SetText(tostring(LootAlertDB.maxAlerts))
    
    maxSlider:SetScript("OnValueChanged", function()
        local value = this:GetValue()
        LootAlertDB.maxAlerts = value
        maxLabel:SetText(tostring(value))
    end)
    
    yOffset = yOffset - 65
    
    -- 间距滑块（左边）
    local spacingSlider = CreateFrame("Slider", "LootAlertSpacingSlider", displayFrame, "OptionsSliderTemplate")
    spacingSlider:SetPoint("TOPLEFT", displayFrame, "TOPLEFT", 40, yOffset)
    spacingSlider:SetMinMaxValues(0, 50)
    spacingSlider:SetValue(LootAlertDB.spacing or 14)
    spacingSlider:SetValueStep(1)
    spacingSlider:SetWidth(220)
    getglobal(spacingSlider:GetName() .. "Low"):SetText("0")
    getglobal(spacingSlider:GetName() .. "High"):SetText("50")
    local spacingText = getglobal(spacingSlider:GetName() .. "Text")
    spacingText:SetText("提示框间距")
    spacingText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    spacingText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local spacingLabel = displayFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    spacingLabel:SetPoint("TOP", spacingSlider, "BOTTOM", 0, 0)
    spacingLabel:SetText(string.format("%d 像素", LootAlertDB.spacing or 14))
    
    spacingSlider:SetScript("OnValueChanged", function()
        local value = this:GetValue()
        LootAlertDB.spacing = value
        spacingLabel:SetText(string.format("%d 像素", value))
        -- 立即更新所有提示框的布局
        if UpdateAlertPositions then
            UpdateAlertPositions()
        end
    end)
    
    -- 第四个标签：高级选项
    local advancedFrame = contentFrames[4]
    yOffset = -20
    
    -- 框架层级下拉菜单（左边）
    local strataLabel = advancedFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    strataLabel:SetPoint("TOPLEFT", advancedFrame, "TOPLEFT", 40, yOffset + 5)
    strataLabel:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    strataLabel:SetText("框架层级")
    strataLabel:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local strataDropdown = CreateFrame("Frame", "LootAlertStrataDropdown", advancedFrame, "UIDropDownMenuTemplate")
    strataDropdown:SetPoint("TOPLEFT", strataLabel, "BOTTOMLEFT", -15, -5)
    
    -- 框架层级选项
    local strataOptions = {
        {value = "BACKGROUND", text = "背景层 (最低)"},
        {value = "LOW", text = "低层"},
        {value = "MEDIUM", text = "中层"},
        {value = "HIGH", text = "高层 (推荐)"},
        {value = "DIALOG", text = "对话框层 (最高)"},
    }
    
    UIDropDownMenu_Initialize(strataDropdown, function()
        for _, option in ipairs(strataOptions) do
            local info = {}
            info.text = option.text
            info.value = option.value
            -- 使用闭包捕获值
            local capturedText = option.text
            local capturedValue = option.value
            info.func = function()
                LootAlertDB.strata = capturedValue
                UIDropDownMenu_SetSelectedValue(strataDropdown, capturedValue)
                
                -- 更新所有框架的层级
                if UpdateAllStrata then
                    UpdateAllStrata()
                end
                
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 框架层级已更改为: " .. capturedText .. "|r")
            end
            info.checked = (LootAlertDB.strata == option.value)
            UIDropDownMenu_AddButton(info)
        end
    end)
    
    -- 设置当前选中的框架层级
    UIDropDownMenu_SetSelectedValue(strataDropdown, LootAlertDB.strata or "HIGH")
    UIDropDownMenu_SetWidth(180, strataDropdown)  -- WoW 1.12: 参数顺序是 (width, frame)
    
    yOffset = yOffset - 65
    
    -- 持续时间滑块（左边，下移一行）
    local durationSlider = CreateFrame("Slider", "LootAlertDurationSlider", advancedFrame, "OptionsSliderTemplate")
    durationSlider:SetPoint("TOPLEFT", advancedFrame, "TOPLEFT", 40, yOffset)
    durationSlider:SetMinMaxValues(1, 10)
    durationSlider:SetValue(LootAlertDB.duration)
    durationSlider:SetValueStep(0.5)
    durationSlider:SetWidth(220)
    getglobal(durationSlider:GetName() .. "Low"):SetText("1秒")
    getglobal(durationSlider:GetName() .. "High"):SetText("10秒")
    local durationText = getglobal(durationSlider:GetName() .. "Text")
    durationText:SetText("显示时长")
    durationText:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    durationText:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local durationLabel = advancedFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    durationLabel:SetPoint("TOP", durationSlider, "BOTTOM", 0, 0)
    durationLabel:SetText(string.format("%.1f秒", LootAlertDB.duration))
    
    durationSlider:SetScript("OnValueChanged", function()
        local value = this:GetValue()
        LootAlertDB.duration = value
        durationLabel:SetText(string.format("%.1f秒", value))
    end)
    
    -- 物品背景素材下拉菜单（右边，和持续时间同一行）
    local textureLabel = advancedFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    textureLabel:SetPoint("TOPRIGHT", advancedFrame, "TOPRIGHT", -40, yOffset + 5)
    textureLabel:SetFont("Fonts\\FZXHLJW.TTF", 13, "OUTLINE")
    textureLabel:SetText("物品背景素材")
    textureLabel:SetTextColor(1, 0.85, 0.1)  -- 更亮的金色（DragonflightReloaded 风格）
    
    local textureDropdown = CreateFrame("Frame", "LootAlertTextureDropdown", advancedFrame, "UIDropDownMenuTemplate")
    textureDropdown:SetPoint("TOPRIGHT", textureLabel, "BOTTOMRIGHT", 15, -5)
    
    -- 背景素材选项
    local textureOptions = {
        {value = 1, text = "素材 1"},
        {value = 2, text = "素材 2"},
        {value = 3, text = "素材 3"},
        {value = 4, text = "素材 4"},
        {value = 5, text = "素材 5"},
        {value = 6, text = "素材 6"},
        {value = 7, text = "素材 7"},
        {value = 8, text = "素材 8"},
        {value = 9, text = "素材 9"},
        {value = 10, text = "素材 10"},
        {value = 11, text = "素材 11"},
        {value = 12, text = "素材 12"},
        {value = 13, text = "素材 13"},
        {value = 14, text = "素材 14"},
        {value = 15, text = "素材 15 (纯色)"},
    }
    
    UIDropDownMenu_Initialize(textureDropdown, function()
        for _, option in ipairs(textureOptions) do
            local info = {}
            info.text = option.text
            info.value = option.value
            -- 使用闭包捕获值
            local capturedText = option.text
            local capturedValue = option.value
            info.func = function()
                LootAlertDB.itemBgTexture = capturedValue
                UIDropDownMenu_SetSelectedValue(textureDropdown, capturedValue)
                
                -- 更新所有提示框的背景素材
                if alertPool then
                    for _, alert in ipairs(alertPool) do
                        if alert.bg then
                            if capturedValue == 15 then
                                -- 素材15：纯色背景
                                alert.bg:SetTexture(0.06, 0.06, 0.06, 0.8)
                                alert.bg:SetTexCoord(0, 1, 0, 1)
                            else
                                -- 使用纹理
                                alert.bg.SetTextureOriginal(alert.bg, "Interface\\AddOns\\LootAlert\\assets\\" .. capturedValue)
                                alert.bg:SetTexCoord(1/512, 449/512, 1/128, 97/128)
                                alert.bg:SetVertexColor(1, 1, 1, 1)
                            end
                        end
                    end
                end
                
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 背景素材已更改为: " .. capturedText .. "|r")
                
                -- 显示所有品质的测试
                if TestLootAlert then
                    -- 清空当前队列和显示
                    if lootQueue then
                        for i = getn(lootQueue), 1, -1 do
                            table.remove(lootQueue, i)
                        end
                    end
                    if activeAlerts then
                        for i = getn(activeAlerts), 1, -1 do
                            local alert = activeAlerts[i]
                            if alert and alert.Release then
                                alert:Release()
                            end
                        end
                    end
                    
                    -- 显示所有品质的测试（灰、白、绿、蓝、紫、橙）
                    for quality = 0, 5 do
                        TestLootAlert(quality)
                    end
                end
            end
            info.checked = (LootAlertDB.itemBgTexture == option.value)
            UIDropDownMenu_AddButton(info)
        end
    end)
    
    -- 设置当前选中的背景素材
    UIDropDownMenu_SetSelectedValue(textureDropdown, LootAlertDB.itemBgTexture or 1)
    UIDropDownMenu_SetWidth(180, textureDropdown)  -- WoW 1.12: 参数顺序是 (width, frame)
    
    -- 底部按钮（DragonflightReloaded 风格）
    local testBtn = CreateDFButton(frame, 140, 35, "测试", "default")
    testBtn:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 20, 20)
    testBtn:SetScript("OnClick", function()
        -- 使用斜杠命令测试
        SlashCmdList["LOOTALERT"]("test")
    end)
    
    local moveBtn = CreateDFButton(frame, 140, 35, "移动位置", "default")
    moveBtn:SetPoint("BOTTOM", frame, "BOTTOM", 0, 20)
    moveBtn:SetScript("OnClick", function()
        if LootAlertFrame:IsShown() then
            LootAlertFrame:Hide()
            LootAlertFrame:EnableMouse(false)
            moveBtn.text:SetText("移动位置")
        else
            LootAlertFrame:Show()
            LootAlertFrame:EnableMouse(true)
            moveBtn.text:SetText("锁定位置")
        end
    end)
    
    local resetBtn = CreateDFButton(frame, 140, 35, "重置位置", "red")
    resetBtn:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -20, 20)
    resetBtn:SetScript("OnClick", function()
        LootAlertDB.position = nil
        LootAlertFrame:ClearAllPoints()
        LootAlertFrame:SetPoint("TOP", UIParent, "TOP", 0, -150)
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 位置已重置|r")
    end)
    
    configFrame = frame
    return frame
end

-- 显示设置面板
function ShowLootAlertConfig()
    local frame = CreateConfigPanel()
    if frame:IsShown() then
        frame:Hide()
    else
        frame:Show()
    end
end

-- 添加到斜杠命令
SLASH_LOOTALERTCONFIG1 = "/lgconfig"
SLASH_LOOTALERTCONFIG2 = "/拾取设置"
SlashCmdList["LOOTALERTCONFIG"] = ShowLootAlertConfig
