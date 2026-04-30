
-- 定义插件名称
local ADDON_NAME = "Settings-PaladinMeleeHeal"

local ConfigCurrent = 1


-- 创建主框架
CatUISettingsPaladinMeleeHeal = MPCreateFrame(ADDON_NAME.."Frame", 520, 540, "|cFFF58CBA设置 - 近战奶骑|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPaladinMeleeHeal:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 圣光术
local checkButton_HolyLight = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, postion_y, "开启 圣光术 (神圣制裁)")
-- 设置点击事件
checkButton_HolyLight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].HolyLight = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].HolyLight = 0
    end
end)


-- 创建单选框 - 优先治疗目标
local checkButton_TargetFirst = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 目标")
-- 设置点击事件
checkButton_TargetFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].TargetFirst = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].TargetFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 圣光闪现
local checkButton_FlashLight = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, postion_y, "开启 圣光闪现")
-- 设置点击事件
checkButton_FlashLight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].FlashLight = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].FlashLight = 0
    end
end)

-- 创建单选框 - 优先治疗目标 的 目标
local checkButton_TargetTarget = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 目标 的 目标")
-- 设置点击事件
checkButton_TargetTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].TargetTarget = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].TargetTarget = 0
    end
end)





postion_y = postion_y-30

-- 创建单选框 - 神圣震击
local checkButton_HolyShock = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, postion_y, "开启 神圣震击")
-- 设置点击事件
checkButton_HolyShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].HolyShock = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].HolyShock = 0
    end
end)


-- 创建单选框 - 优先治疗自己
local checkButton_SelfFirst = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 自己 (谨慎开启)")
-- 设置点击事件
checkButton_SelfFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].SelfFirst = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].SelfFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 圣疗
local checkButton_LayHands = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, postion_y, "开启 圣疗术")
-- 设置点击事件
checkButton_LayHands:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].LayHands = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].LayHands = 0
    end
end)


-- 创建单选框 - 治疗大团
local checkButton_ScanTeam = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "扫描治疗大团 (血量最低)")
-- 设置点击事件
checkButton_ScanTeam:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].ScanTeam = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].ScanTeam = 0
    end
end)


postion_y = postion_y - 30


-- 创建单选框 - 启用 十字军打击 (重置神圣震击)
local checkButton_CrusaderStrike = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, postion_y, "启用 十字军打击")
-- 设置点击事件
checkButton_CrusaderStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].CrusaderStrike = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].CrusaderStrike = 0
    end
end)


-- 创建单选框 - Tip
local checkButton_Tip = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "开启 提示信息")
-- 设置点击事件
checkButton_Tip:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].Tip = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].Tip = 0
    end
end)


postion_y = postion_y - 30

-- 创建单选框 - 启用 神圣打击 (治疗群体)
local checkButton_HolyStrike = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, postion_y, "启用 神圣打击")
-- 设置点击事件
checkButton_HolyStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].HolyStrike = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].HolyStrike = 0
    end
end)


--起始治疗
local slider_Begin_Value = CreateFrame("Slider", ADDON_NAME.."SliderBegin_Value", CatUISettingsPaladinMeleeHeal, "OptionsSliderTemplate")
slider_Begin_Value:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 270, postion_y+20)
slider_Begin_Value:SetWidth(220) -- 拖动条长度
slider_Begin_Value:SetHeight(16) -- 拖动条高度

slider_Begin_Value:SetMinMaxValues(80, 100)
slider_Begin_Value:SetValueStep(0.5)
slider_Begin_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Begin_Value)

-- 值变化时的回调函数
slider_Begin_Value:SetScript("OnValueChanged", function()
    _G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线："..arg1.."%")
    MPPaladinMeleeHealSaved[ConfigCurrent].Begin_Value = arg1
end)




-- 高级



postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsPaladinMeleeHeal:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-90


-- 创建单选框 - 暴力治疗
local checkButton_Force = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, postion_y, "启用 暴力治疗 (强制最高等级)")
-- 设置点击事件
checkButton_Force:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].Force = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].Force = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

local slider_HealthStone = CreateFrame("Slider", ADDON_NAME.."Slider_HealthStone", checkButton_HealthStone, "OptionsSliderTemplate")
slider_HealthStone:SetPoint("RIGHT", checkButton_HealthStone, "RIGHT", 250, -2)
slider_HealthStone:SetWidth(150) -- 拖动条长度
slider_HealthStone:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HealthStone:SetMinMaxValues(0, 100)
slider_HealthStone:SetValueStep(1)
slider_HealthStone:SetValue(300) -- 默认值
MPCatUISliderRegionHide(slider_HealthStone)

local color_HealthStone = "|cFFFFD100"

-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 溢出治疗
local checkButton_Overflow = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, postion_y, "启用 溢出治疗时打断施法")
-- 设置点击事件
checkButton_Overflow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].Overflow = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].Overflow = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

local slider_HerbalTea = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTea", checkButton_HerbalTea, "OptionsSliderTemplate")
slider_HerbalTea:SetPoint("RIGHT", checkButton_HerbalTea, "RIGHT", 250, -2)
slider_HerbalTea:SetWidth(150) -- 拖动条长度
slider_HerbalTea:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HerbalTea:SetMinMaxValues(0, 100)
slider_HerbalTea:SetValueStep(1)
slider_HerbalTea:SetValue(200) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTea)

local color_HerbalTea = "|cFFFFD100"

-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40



-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

local slider_HerbalTeaMana = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTeaMana", checkButton_HerbalTeaMana, "OptionsSliderTemplate")
slider_HerbalTeaMana:SetPoint("RIGHT", checkButton_HerbalTeaMana, "RIGHT", 250, -2)
slider_HerbalTeaMana:SetWidth(150) -- 拖动条长度
slider_HerbalTeaMana:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HerbalTeaMana:SetMinMaxValues(0, 100)
slider_HerbalTeaMana:SetValueStep(1)
slider_HerbalTeaMana:SetValue(200) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTeaMana)

local color_HerbalTeaMana = "|cFFFFD100"

-- 值变化时的回调函数
slider_HerbalTeaMana:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)




postion_y = postion_y - 40

-- 创建单选框 - 保护之手
local checkButton_Protection = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "自动 保护之手")

local slider_Protection = CreateFrame("Slider", ADDON_NAME.."Slider_Protection", checkButton_Protection, "OptionsSliderTemplate")
slider_Protection:SetPoint("RIGHT", checkButton_Protection, "RIGHT", 250, -2)
slider_Protection:SetWidth(150) -- 拖动条长度
slider_Protection:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Protection:SetMinMaxValues(0, 100)
slider_Protection:SetValueStep(1)
slider_Protection:SetValue(200) -- 默认值
MPCatUISliderRegionHide(slider_Protection)

local color_Protection = "|cFFFFD100"

-- 值变化时的回调函数
slider_Protection:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinMeleeHealSaved[ConfigCurrent].Protection_Value = arg1
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].Protection_Value .."%|r")
end)

-- 设置点击事件
checkButton_Protection:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].Protection = 1
        color_Protection = "|cFFFFD100"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].Protection_Value .."%|r")
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].Protection = 0
        color_Protection = "|cFF888888"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].Protection_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 圣盾术
local checkButton_DivineShield = MPCreateCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, postion_y, "自动 圣盾术")

local slider_DivineShield = CreateFrame("Slider", ADDON_NAME.."Slider_DivineShield", checkButton_DivineShield, "OptionsSliderTemplate")
slider_DivineShield:SetPoint("RIGHT", checkButton_DivineShield, "RIGHT", 250, -2)
slider_DivineShield:SetWidth(150) -- 拖动条长度
slider_DivineShield:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_DivineShield:SetMinMaxValues(0, 100)
slider_DivineShield:SetValueStep(1)
slider_DivineShield:SetValue(200) -- 默认值
MPCatUISliderRegionHide(slider_DivineShield)

local color_DivineShield = "|cFFFFD100"

-- 值变化时的回调函数
slider_DivineShield:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield_Value = arg1
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield_Value .."%|r")
end)

-- 设置点击事件
checkButton_DivineShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield = 1
        color_DivineShield = "|cFFFFD100"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield_Value .."%|r")
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield = 0
        color_DivineShield = "|cFF888888"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield_Value .."%|r")
    end
end)



postion_y = postion_y+100


-- 圣光术 血线
local slider_HolyLight_Value = CreateFrame("Slider", ADDON_NAME.."SliderHolyLight_Value", CatUISettingsPaladinMeleeHeal, "OptionsSliderTemplate")
slider_HolyLight_Value:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y+40)
slider_HolyLight_Value:SetWidth(220) -- 拖动条长度
slider_HolyLight_Value:SetHeight(16) -- 拖动条高度

slider_HolyLight_Value:SetMinMaxValues(10, 100)
slider_HolyLight_Value:SetValueStep(1)
slider_HolyLight_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_HolyLight_Value)

-- 值变化时的回调函数
slider_HolyLight_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_HolyLight_Value:GetName().."Text"]:SetText("圣光术 血线："..arg1.."%")
    MPPaladinMeleeHealSaved[ConfigCurrent].HolyLight_Value = arg1
end)




postion_y = postion_y-40

-- 神圣震击 血线
local slider_HolyShock_Value = CreateFrame("Slider", ADDON_NAME.."SliderHolyShock_Value", CatUISettingsPaladinMeleeHeal, "OptionsSliderTemplate")
slider_HolyShock_Value:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y+40)
slider_HolyShock_Value:SetWidth(220) -- 拖动条长度
slider_HolyShock_Value:SetHeight(16) -- 拖动条高度

slider_HolyShock_Value:SetMinMaxValues(10, 100)
slider_HolyShock_Value:SetValueStep(1)
slider_HolyShock_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_HolyShock_Value)

-- 值变化时的回调函数
slider_HolyShock_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_HolyShock_Value:GetName().."Text"]:SetText("神圣震击 血线："..arg1.."%")
    MPPaladinMeleeHealSaved[ConfigCurrent].HolyShock_Value = arg1
end)


postion_y = postion_y-40

-- 圣疗术 血线
local slider_LayHands_Value = CreateFrame("Slider", ADDON_NAME.."SliderLayHands_Value", CatUISettingsPaladinMeleeHeal, "OptionsSliderTemplate")
slider_LayHands_Value:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y+40)
slider_LayHands_Value:SetWidth(220) -- 拖动条长度
slider_LayHands_Value:SetHeight(16) -- 拖动条高度

slider_LayHands_Value:SetMinMaxValues(10, 100)
slider_LayHands_Value:SetValueStep(1)
slider_LayHands_Value:SetValue(2000) -- 默认值
MPCatUISliderRegionHide(slider_LayHands_Value)

-- 值变化时的回调函数
slider_LayHands_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_LayHands_Value:GetName().."Text"]:SetText("圣疗术 血线："..arg1.."%")
    MPPaladinMeleeHealSaved[ConfigCurrent].LayHands_Value = arg1
end)






postion_y = postion_y + 35

-- 动态控制
local ButtonAutoSeal = CreateFrame("Button", ADDON_NAME.."ButtonAutoSeal", CatUISettingsPaladinMeleeHeal, "UIPanelButtonTemplate")
ButtonAutoSeal:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
ButtonAutoSeal:SetWidth(100)
ButtonAutoSeal:SetHeight(22)
ButtonAutoSeal:SetFont("Fonts\\FRIZQT__.TTF", 12)
ButtonAutoSeal:SetText("审判控制")

ButtonAutoSeal:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
ButtonAutoSeal:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
ButtonAutoSeal:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
ButtonAutoSeal:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
ButtonAutoSeal:SetScript("OnClick", function()
    MPCatPaladinSealInit()
    if CatPaladinSeal:IsVisible() then
        CatPaladinSeal:Hide()
        MPPublicSaved.PaladinSealDisplay = 0
    else
        CatPaladinSeal:Show()
        MPPublicSaved.PaladinSealDisplay = 1
    end
end)



-- 创建按钮
local myButton = MPCreateButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetPaladinMeleeHealSettings(ConfigCurrent)
    MPInitPaladinMeleeHealSettings()
end)

local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsPaladinMeleeHeal, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsPaladinMeleeHeal, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsPaladinMeleeHeal, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 440, -44)
ConfigButton[3].text = ConfigButton[3]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[3].text:SetPoint("LEFT", ConfigButton[3], "RIGHT", 0, 0)
ConfigButton[3].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[3].text:SetText(" 配置 3")

ConfigButton[1]:SetScript("OnClick", function()
    ConfigButton[1]:SetChecked(true)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 1]|r")
    ConfigCurrent = 1
    MPInitPaladinMeleeHealSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitPaladinMeleeHealSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitPaladinMeleeHealSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsPaladinMeleeHeal)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].Power = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved[ConfigCurrent].Pick = 1
    else
        MPPaladinMeleeHealSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)



-- 添加提示内容区域
local TipText = CatUISettingsPaladinMeleeHeal:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPaladinMeleeHeal, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFF58CBA/mpheal|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local PaladinMeleeHealSettingsUIVersion = 3

function MPResetPaladinMeleeHealSettings(config)

    MPPaladinMeleeHealSaved.Version = PaladinMeleeHealSettingsUIVersion

    -- 基本配置

    MPPaladinMeleeHealSaved[config].HolyLight = 1
    MPPaladinMeleeHealSaved[config].FlashLight = 0
    MPPaladinMeleeHealSaved[config].HolyShock = 1
    MPPaladinMeleeHealSaved[config].LayHands = 0
    MPPaladinMeleeHealSaved[config].Justice = 1
    MPPaladinMeleeHealSaved[config].CrusaderStrike = 1
    MPPaladinMeleeHealSaved[config].HolyStrike = 1

    MPPaladinMeleeHealSaved[config].Tip = 1
    MPPaladinMeleeHealSaved[config].TargetFirst = 1
    MPPaladinMeleeHealSaved[config].TargetTarget = 1
    MPPaladinMeleeHealSaved[config].SelfFirst = 0
    MPPaladinMeleeHealSaved[config].ScanTeam = 1

    MPPaladinMeleeHealSaved[config].Begin_Value = 99.5

    -- 高级配置
    MPPaladinMeleeHealSaved[config].Force = 0
    MPPaladinMeleeHealSaved[config].Overflow = 0

    -- 治疗石、糖水茶
    MPPaladinMeleeHealSaved[config].HealthStone = 1
    MPPaladinMeleeHealSaved[config].HealthStone_Value = 30
    MPPaladinMeleeHealSaved[config].HerbalTea = 1
    MPPaladinMeleeHealSaved[config].HerbalTea_Value = 20
    MPPaladinMeleeHealSaved[config].HerbalTeaMana = 0
    MPPaladinMeleeHealSaved[config].HerbalTeaMana_Value = 20

    MPPaladinMeleeHealSaved[config].Protection = 0
    MPPaladinMeleeHealSaved[config].Protection_Value = 10
    MPPaladinMeleeHealSaved[config].DivineShield = 0
    MPPaladinMeleeHealSaved[config].DivineShield_Value = 10

    -- SuperWoW,UnitXP
    MPPaladinMeleeHealSaved[config].SuperWoW = 1
    MPPaladinMeleeHealSaved[config].UnitXP = 1

    MPPaladinMeleeHealSaved[config].HolyLight_Value = 99
    MPPaladinMeleeHealSaved[config].FlashLight_Value = 99
    MPPaladinMeleeHealSaved[config].HolyShock_Value = 99
    MPPaladinMeleeHealSaved[config].LayHands_Value = 10

    -- 通用
    MPPaladinMeleeHealSaved[config].Power = 0
    MPPaladinMeleeHealSaved[config].Pick = 0

end


local function InitPaladinMeleeHealSettingsPart1()
    checkButton_HolyLight:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].HolyLight))
    checkButton_FlashLight:SetChecked( MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].FlashLight) )
    checkButton_HolyShock:SetChecked( MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].HolyShock) )
    checkButton_LayHands:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].LayHands))
    checkButton_CrusaderStrike:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].CrusaderStrike))
    checkButton_HolyStrike:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].HolyStrike))

    checkButton_TargetFirst:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].TargetFirst))
    checkButton_TargetTarget:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].TargetTarget))
    checkButton_SelfFirst:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].SelfFirst))
    checkButton_ScanTeam:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].ScanTeam))
    checkButton_Tip:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].Tip))

    checkButton_Force:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].Force))
    checkButton_Overflow:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].Overflow))

    checkButton_Power:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].Pick))
end

local function InitPaladinMeleeHealSettingsPart2()
    checkButton_HealthStone:SetChecked(MPToBoolean(MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone_Value)
    if MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea_Value)
    if MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinMeleeHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")

    checkButton_Protection:SetChecked(MPPaladinMeleeHealSaved[ConfigCurrent].Protection)
    slider_Protection:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].Protection_Value)
    if MPPaladinMeleeHealSaved[ConfigCurrent].Protection==1 then
        color_Protection = "|cFFFFD100"
    else
        color_Protection = "|cFF888888"
    end
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].Protection_Value .."%|r")


    checkButton_DivineShield:SetChecked(MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield)
    slider_DivineShield:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield_Value)
    if MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield==1 then
        color_DivineShield = "|cFFFFD100"
    else
        color_DivineShield = "|cFF888888"
    end
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinMeleeHealSaved[ConfigCurrent].DivineShield_Value .."%|r")



    slider_HolyLight_Value:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].HolyLight_Value)
    --slider_FlashLight_Value:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].FlashLight_Value)
    slider_HolyShock_Value:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].HolyShock_Value)
    slider_LayHands_Value:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].LayHands_Value)
    slider_Begin_Value:SetValue(MPPaladinMeleeHealSaved[ConfigCurrent].Begin_Value)
end

function MPInitPaladinMeleeHealSettings()
    if not MPPaladinMeleeHealSaved then
        MPPaladinMeleeHealSaved = {}

        -- 第一套配置
        if not MPPaladinMeleeHealSaved[1] then
            MPPaladinMeleeHealSaved[1] = {}
            MPResetPaladinMeleeHealSettings(1)
        end

        -- 第二套配置
        if not MPPaladinMeleeHealSaved[2] then
            MPPaladinMeleeHealSaved[2] = {}
            MPResetPaladinMeleeHealSettings(2)
        end

        -- 第三套配置
        if not MPPaladinMeleeHealSaved[3] then
            MPPaladinMeleeHealSaved[3] = {}
            MPResetPaladinMeleeHealSettings(3)
        end
    end

    if MPPaladinMeleeHealSaved.Version ~= PaladinMeleeHealSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[近战奶骑宏]当前配置，这是新版插件正常数据更新！|r")
        MPPaladinMeleeHealSaved[1] = {}
        MPPaladinMeleeHealSaved[2] = {}
        MPPaladinMeleeHealSaved[3] = {}
        MPResetPaladinMeleeHealSettings(1)
        MPResetPaladinMeleeHealSettings(2)
        MPResetPaladinMeleeHealSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitPaladinMeleeHealSettingsPart1()
    InitPaladinMeleeHealSettingsPart2()


end

