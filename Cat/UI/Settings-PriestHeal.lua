
-- 定义插件名称
local ADDON_NAME = "Settings-PriestHeal"

local ConfigCurrent = 1


-- 创建主框架
CatUISettingsPriestHealWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 680, "|cFFFFFFFF设置 - 神牧|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPriestHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)




local postion_y = postion_y-40

-- 治疗祷言
local checkButton_PrayerHealing = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 治疗祷言")
checkButton_PrayerHealing:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].PrayerHealing = 1
    else
        MPPriestHealSaved[ConfigCurrent].PrayerHealing = 0
    end
end)



-- 创建单选框 - 优先治疗目标
local checkButton_TargetFirst = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 目标")
-- 设置点击事件
checkButton_TargetFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].TargetFirst = 1
    else
        MPPriestHealSaved[ConfigCurrent].TargetFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 强效治疗术
local checkButton_GreaterHeal = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 强效治疗术")
-- 设置点击事件
checkButton_GreaterHeal:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].GreaterHeal = 1
    else
        MPPriestHealSaved[ConfigCurrent].GreaterHeal = 0
    end
end)


-- 创建单选框 - 优先治疗目标 的 目标
local checkButton_TargetTarget = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 目标 的 目标")
-- 设置点击事件
checkButton_TargetTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].TargetTarget = 1
    else
        MPPriestHealSaved[ConfigCurrent].TargetTarget = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 快速治疗
local checkButton_FlashHeal = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 快速治疗")
-- 设置点击事件
checkButton_FlashHeal:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].FlashHeal = 1
    else
        MPPriestHealSaved[ConfigCurrent].FlashHeal = 0
    end
end)



-- 创建单选框 - 优先治疗自己
local checkButton_SelfFirst = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 自己 (谨慎开启)")
-- 设置点击事件
checkButton_SelfFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].SelfFirst = 1
    else
        MPPriestHealSaved[ConfigCurrent].SelfFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 绝望祷言
local checkButton_DesperatePrayer = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 绝望祷言")
-- 设置点击事件
checkButton_DesperatePrayer:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].DesperatePrayer = 1
    else
        MPPriestHealSaved[ConfigCurrent].DesperatePrayer = 0
    end
end)


-- 创建单选框 - 治疗大团
local checkButton_ScanTeam = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "治疗大团")
checkButton_ScanTeam:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].ScanTeam = 1
    else
        MPPriestHealSaved[ConfigCurrent].ScanTeam = 0
    end
end)

local checkButton_ScanTeam_Low = MPCreateCheckButtonSmall(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 460, postion_y, "血量最低")
local checkButton_ScanTeam_Rand = MPCreateCheckButtonSmall(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 560, postion_y, "随机")

checkButton_ScanTeam_Low:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].ScanTeam_Low = 1
        MPPriestHealSaved[ConfigCurrent].ScanTeam_Rand = 0
    else
        MPPriestHealSaved[ConfigCurrent].ScanTeam_Low = 0
        MPPriestHealSaved[ConfigCurrent].ScanTeam_Rand = 1
    end
    checkButton_ScanTeam_Low:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].ScanTeam_Rand))
end)
checkButton_ScanTeam_Rand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].ScanTeam_Rand = 1
        MPPriestHealSaved[ConfigCurrent].ScanTeam_Low = 0
    else
        MPPriestHealSaved[ConfigCurrent].ScanTeam_Rand = 0
        MPPriestHealSaved[ConfigCurrent].ScanTeam_Low = 1
    end
    checkButton_ScanTeam_Low:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].ScanTeam_Rand))
end)



postion_y = postion_y-30


-- 创建单选框 - 移动恢复
local checkButton_MoveRenew = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 恢复 (移动时)")
-- 设置点击事件
checkButton_MoveRenew:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].MoveRenew = 1
    else
        MPPriestHealSaved[ConfigCurrent].MoveRenew = 0
    end
end)


-- 创建单选框 - Tip
local checkButton_Tip = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "开启 提示信息")
-- 设置点击事件
checkButton_Tip:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].Tip = 1
    else
        MPPriestHealSaved[ConfigCurrent].Tip = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 真言术：盾
local checkButton_Shield = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 真言术：盾")
-- 设置点击事件
checkButton_Shield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].Shield = 1
    else
        MPPriestHealSaved[ConfigCurrent].Shield = 0
    end
end)

postion_y = postion_y - 40

-- 起始治疗
local slider_Begin_Value = CreateFrame("Slider", ADDON_NAME.."SliderBegin_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_Begin_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y+40)
slider_Begin_Value:SetWidth(220) -- 拖动条长度
slider_Begin_Value:SetHeight(16) -- 拖动条高度

slider_Begin_Value:SetMinMaxValues(80, 100)
slider_Begin_Value:SetValueStep(0.5)
slider_Begin_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Begin_Value)

-- 值变化时的回调函数
slider_Begin_Value:SetScript("OnValueChanged", function()
    _G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线："..arg1.."%")
    MPPriestHealSaved[ConfigCurrent].Begin_Value = arg1
end)




-- 高级



postion_y = postion_y+5

-- 添加提示内容区域
local TipText1 = CatUISettingsPriestHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-90


-- 创建单选框 - 溢出治疗
local checkButton_Overflow = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "启用 溢出治疗时打断施法")
-- 设置点击事件
checkButton_Overflow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].Overflow = 1
    else
        MPPriestHealSaved[ConfigCurrent].Overflow = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPPriestHealSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPPriestHealSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPPriestHealSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPPriestHealSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPPriestHealSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPPriestHealSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 祈祷之书
local checkButton_PrayerBook = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "|cFF888888自动 祈祷之书 (未完工)|r")
checkButton_PrayerBook:Disable()
checkButton_PrayerBook:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].PrayerBook = 1
    else
        MPPriestHealSaved[ConfigCurrent].PrayerBook = 0
    end
end)

postion_y = postion_y - 40

postion_y = postion_y - 40

-- 治疗祷言 本队优先
local checkButton_PrayerHealingPartyFirst = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "治疗祷言 本队优先")
checkButton_PrayerHealingPartyFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].PrayerHealingPartyFirst = 1
    else
        MPPriestHealSaved[ConfigCurrent].PrayerHealingPartyFirst = 0
    end
end)

-- 治疗祷言 权重
local slider_PrayerHealing_Value = CreateFrame("Slider", ADDON_NAME.."SliderPrayerHealing_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_PrayerHealing_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 270, postion_y+70)
slider_PrayerHealing_Value:SetWidth(220) -- 拖动条长度
slider_PrayerHealing_Value:SetHeight(16) -- 拖动条高度

slider_PrayerHealing_Value:SetMinMaxValues(2, 14)
slider_PrayerHealing_Value:SetValueStep(1)
slider_PrayerHealing_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_PrayerHealing_Value)

-- 值变化时的回调函数
slider_PrayerHealing_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_PrayerHealing_Value:GetName().."Text"]:SetText("治疗祷言 权重："..arg1)
    MPPriestHealSaved[ConfigCurrent].PrayerHealing_Value = arg1
end)



postion_y = postion_y+60+40+40+40+40


-- 强效治疗 血线
local slider_GreaterHeal_Value = CreateFrame("Slider", ADDON_NAME.."SliderGreaterHeal_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_GreaterHeal_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_GreaterHeal_Value:SetWidth(220) -- 拖动条长度
slider_GreaterHeal_Value:SetHeight(16) -- 拖动条高度

slider_GreaterHeal_Value:SetMinMaxValues(10, 99)
slider_GreaterHeal_Value:SetValueStep(1)
slider_GreaterHeal_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_GreaterHeal_Value)

-- 值变化时的回调函数
slider_GreaterHeal_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_GreaterHeal_Value:GetName().."Text"]:SetText("强效治疗术​ 血线："..arg1.."%")
    MPPriestHealSaved[ConfigCurrent].GreaterHeal_Value = arg1
end)



postion_y = postion_y-40

-- 绝望祷言​ 血线
local slider_Desperate_Value = CreateFrame("Slider", ADDON_NAME.."SliderDesperate_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_Desperate_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_Desperate_Value:SetWidth(220) -- 拖动条长度
slider_Desperate_Value:SetHeight(16) -- 拖动条高度

slider_Desperate_Value:SetMinMaxValues(10, 99)
slider_Desperate_Value:SetValueStep(1)
slider_Desperate_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Desperate_Value)

-- 值变化时的回调函数
slider_Desperate_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_Desperate_Value:GetName().."Text"]:SetText("绝望祷言​ 血线："..arg1.."%")
    MPPriestHealSaved[ConfigCurrent].Desperate_Value = arg1
end)


postion_y = postion_y-40

-- 真言术：盾​ 血线
local slider_Shield_Value = CreateFrame("Slider", ADDON_NAME.."SliderShield_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_Shield_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_Shield_Value:SetWidth(220) -- 拖动条长度
slider_Shield_Value:SetHeight(16) -- 拖动条高度

slider_Shield_Value:SetMinMaxValues(10, 99)
slider_Shield_Value:SetValueStep(1)
slider_Shield_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Shield_Value)

-- 值变化时的回调函数
slider_Shield_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_Shield_Value:GetName().."Text"]:SetText("真言术：盾​ 血线："..arg1.."%")
    MPPriestHealSaved[ConfigCurrent].Shield_Value = arg1
end)


postion_y = postion_y-40

-- 恢复最低等级
local slider_RenewMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderRenewMinLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_RenewMinLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_RenewMinLevel:SetWidth(105) -- 拖动条长度
slider_RenewMinLevel:SetHeight(16) -- 拖动条高度

slider_RenewMinLevel:SetMinMaxValues(1, 10)
slider_RenewMinLevel:SetValueStep(1)
slider_RenewMinLevel:SetValue(100) -- 默认值
MPCatUISliderRegionHide(slider_RenewMinLevel)

slider_RenewMinLevel:SetScript("OnValueChanged", function()
    _G[slider_RenewMinLevel:GetName().."Text"]:SetText("恢复最低"..arg1.."级")
    MPPriestHealSaved[ConfigCurrent].RenewMinLevel = arg1
end)

-- 恢复最高等级
local slider_RenewMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderRenewMaxLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_RenewMaxLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 135, postion_y)
slider_RenewMaxLevel:SetWidth(105) -- 拖动条长度
slider_RenewMaxLevel:SetHeight(16) -- 拖动条高度

slider_RenewMaxLevel:SetMinMaxValues(1, 10)
slider_RenewMaxLevel:SetValueStep(1)
slider_RenewMaxLevel:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_RenewMaxLevel)

slider_RenewMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_RenewMaxLevel:GetName().."Text"]:SetText("恢复最高"..arg1.."级")
    MPPriestHealSaved[ConfigCurrent].RenewMaxLevel = arg1
end)


postion_y = postion_y-40

-- 快速治疗​最低等级
local slider_FlashHealMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderFlashHealMinLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_FlashHealMinLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_FlashHealMinLevel:SetWidth(105) -- 拖动条长度
slider_FlashHealMinLevel:SetHeight(16) -- 拖动条高度

slider_FlashHealMinLevel:SetMinMaxValues(1, 7)
slider_FlashHealMinLevel:SetValueStep(1)
slider_FlashHealMinLevel:SetValue(100) -- 默认值
MPCatUISliderRegionHide(slider_FlashHealMinLevel)

slider_FlashHealMinLevel:SetScript("OnValueChanged", function()
    _G[slider_FlashHealMinLevel:GetName().."Text"]:SetText("快速治疗最低"..arg1.."级")
    MPPriestHealSaved[ConfigCurrent].FlashHealMinLevel = arg1
end)

-- 快速治疗​最高等级
local slider_FlashHealMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderFlashHealMaxLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_FlashHealMaxLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 135, postion_y)
slider_FlashHealMaxLevel:SetWidth(105) -- 拖动条长度
slider_FlashHealMaxLevel:SetHeight(16) -- 拖动条高度

slider_FlashHealMaxLevel:SetMinMaxValues(1, 7)
slider_FlashHealMaxLevel:SetValueStep(1)
slider_FlashHealMaxLevel:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_FlashHealMaxLevel)

slider_FlashHealMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_FlashHealMaxLevel:GetName().."Text"]:SetText("快速治疗最高"..arg1.."级")
    MPPriestHealSaved[ConfigCurrent].FlashHealMaxLevel = arg1
end)


postion_y = postion_y-40

-- 强效治疗​最低等级
local slider_GreaterHealMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderGreaterHealMinLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_GreaterHealMinLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_GreaterHealMinLevel:SetWidth(105) -- 拖动条长度
slider_GreaterHealMinLevel:SetHeight(16) -- 拖动条高度

slider_GreaterHealMinLevel:SetMinMaxValues(1, 5)
slider_GreaterHealMinLevel:SetValueStep(1)
slider_GreaterHealMinLevel:SetValue(100) -- 默认值
MPCatUISliderRegionHide(slider_GreaterHealMinLevel)

slider_GreaterHealMinLevel:SetScript("OnValueChanged", function()
    _G[slider_GreaterHealMinLevel:GetName().."Text"]:SetText("强效治疗最低"..arg1.."级")
    MPPriestHealSaved[ConfigCurrent].GreaterHealMinLevel = arg1
end)

-- 强效治疗​最高等级
local slider_GreaterHealMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderGreaterHealMaxLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_GreaterHealMaxLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 135, postion_y)
slider_GreaterHealMaxLevel:SetWidth(105) -- 拖动条长度
slider_GreaterHealMaxLevel:SetHeight(16) -- 拖动条高度

slider_GreaterHealMaxLevel:SetMinMaxValues(1, 5)
slider_GreaterHealMaxLevel:SetValueStep(1)
slider_GreaterHealMaxLevel:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_GreaterHealMaxLevel)

slider_GreaterHealMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_GreaterHealMaxLevel:GetName().."Text"]:SetText("强效治疗最高"..arg1.."级")
    MPPriestHealSaved[ConfigCurrent].GreaterHealMaxLevel = arg1
end)


postion_y = postion_y-40

-- 治疗祷言最低等级
local slider_PrayerHealingMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderPrayerHealingMinLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_PrayerHealingMinLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_PrayerHealingMinLevel:SetWidth(105) -- 拖动条长度
slider_PrayerHealingMinLevel:SetHeight(16) -- 拖动条高度

slider_PrayerHealingMinLevel:SetMinMaxValues(1, 3)
slider_PrayerHealingMinLevel:SetValueStep(1)
slider_PrayerHealingMinLevel:SetValue(100) -- 默认值
MPCatUISliderRegionHide(slider_PrayerHealingMinLevel)

slider_PrayerHealingMinLevel:SetScript("OnValueChanged", function()
    _G[slider_PrayerHealingMinLevel:GetName().."Text"]:SetText("治疗祷言最低"..arg1.."级")
    MPPriestHealSaved[ConfigCurrent].PrayerHealingMinLevel = arg1
end)

-- 强效治疗​最高等级
local slider_PrayerHealingMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderPrayerHealingMaxLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_PrayerHealingMaxLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 135, postion_y)
slider_PrayerHealingMaxLevel:SetWidth(105) -- 拖动条长度
slider_PrayerHealingMaxLevel:SetHeight(16) -- 拖动条高度

slider_PrayerHealingMaxLevel:SetMinMaxValues(1, 5)
slider_PrayerHealingMaxLevel:SetValueStep(1)
slider_PrayerHealingMaxLevel:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_PrayerHealingMaxLevel)

slider_PrayerHealingMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_PrayerHealingMaxLevel:GetName().."Text"]:SetText("治疗祷言最高"..arg1.."级")
    MPPriestHealSaved[ConfigCurrent].PrayerHealingMaxLevel = arg1
end)




-- 创建按钮
local myButton = MPCreateButton(CatUISettingsPriestHealWindow, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetPriestHealSettings(ConfigCurrent)
    MPInitPriestHealSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsPriestHealWindow, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsPriestHealWindow, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsPriestHealWindow, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 440, -44)
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
    MPInitPriestHealSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitPriestHealSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitPriestHealSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsPriestHealWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].Power = 1
    else
        MPPriestHealSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved[ConfigCurrent].Pick = 1
    else
        MPPriestHealSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsPriestHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPriestHealWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFFFFFF/mheal|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local PriestHealSettingsUIVersion = 18

function MPResetPriestHealSettings(config)

    MPPriestHealSaved.Version = PriestHealSettingsUIVersion

    -- 基本配置

    MPPriestHealSaved[config].GreaterHeal = 0
    MPPriestHealSaved[config].PrayerHealing = 1
    MPPriestHealSaved[config].MoveRenew = 1
    MPPriestHealSaved[config].FlashHeal = 1
    MPPriestHealSaved[config].DesperatePrayer = 0
    MPPriestHealSaved[config].Shield = 0
    MPPriestHealSaved[config].Tip = 1
    MPPriestHealSaved[config].TargetFirst = 1
    MPPriestHealSaved[config].TargetTarget = 1
    MPPriestHealSaved[config].SelfFirst = 0
    MPPriestHealSaved[config].ScanTeam = 1
    MPPriestHealSaved[config].ScanTeam_Low = 1
    MPPriestHealSaved[config].ScanTeam_Rand = 0

    MPPriestHealSaved[config].Begin_Value = 99.5

    -- 高级配置

    -- 治疗石、糖水茶
    MPPriestHealSaved[config].HealthStone = 1
    MPPriestHealSaved[config].HealthStone_Value = 30
    MPPriestHealSaved[config].HerbalTea = 1
    MPPriestHealSaved[config].HerbalTea_Value = 20
    MPPriestHealSaved[config].HerbalTeaMana = 0
    MPPriestHealSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPPriestHealSaved[config].SuperWoW = 1
    MPPriestHealSaved[config].UnitXP = 1

    MPPriestHealSaved[config].Overflow = 0
    MPPriestHealSaved[config].PrayerBook = 0
    MPPriestHealSaved[config].PrayerBook_Value = 0

    MPPriestHealSaved[config].Desperate_Value = 20
    MPPriestHealSaved[config].GreaterHeal_Value = 50
    MPPriestHealSaved[config].Shield_Value = 30
    MPPriestHealSaved[config].PrayerHealingPartyFirst = 1
    MPPriestHealSaved[config].PrayerHealing_Value = 5

    MPPriestHealSaved[config].RenewMinLevel = 1
    MPPriestHealSaved[config].RenewMaxLevel = 10
    MPPriestHealSaved[config].FlashHealMinLevel = 1
    MPPriestHealSaved[config].FlashHealMaxLevel = 7
    MPPriestHealSaved[config].GreaterHealMinLevel = 1
    MPPriestHealSaved[config].GreaterHealMaxLevel = 5
    MPPriestHealSaved[config].PrayerHealingMinLevel = 1
    MPPriestHealSaved[config].PrayerHealingMaxLevel = 5

    -- 通用
    MPPriestHealSaved[config].Power = 0
    MPPriestHealSaved[config].Pick = 0

end


function MPInitPriestHealSettingsPart1()
    checkButton_GreaterHeal:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].GreaterHeal))
    checkButton_PrayerHealing:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].PrayerHealing))
    checkButton_MoveRenew:SetChecked( MPToBoolean(MPPriestHealSaved[ConfigCurrent].MoveRenew) )
    checkButton_FlashHeal:SetChecked( MPToBoolean(MPPriestHealSaved[ConfigCurrent].FlashHeal) )
    checkButton_DesperatePrayer:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].DesperatePrayer))
    checkButton_Shield:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].Shield))

    checkButton_TargetFirst:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].TargetFirst))
    checkButton_TargetTarget:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].TargetTarget))
    checkButton_SelfFirst:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].SelfFirst))
    checkButton_ScanTeam:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].ScanTeam))
    checkButton_ScanTeam_Low:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].ScanTeam_Rand))
    checkButton_Tip:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].Tip))

    checkButton_Overflow:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].Overflow))
    checkButton_PrayerBook:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].PrayerBook))
    checkButton_PrayerHealingPartyFirst:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].PrayerHealingPartyFirst))

    checkButton_Power:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].Pick))
end


function MPInitPriestHealSettings()
    if not MPPriestHealSaved then
        MPPriestHealSaved = {}

        -- 第一套配置
        if not MPPriestHealSaved[1] then
            MPPriestHealSaved[1] = {}
            MPResetPriestHealSettings(1)
        end

        -- 第二套配置
        if not MPPriestHealSaved[2] then
            MPPriestHealSaved[2] = {}
            MPResetPriestHealSettings(2)
        end

        -- 第三套配置
        if not MPPriestHealSaved[3] then
            MPPriestHealSaved[3] = {}
            MPResetPriestHealSettings(3)
        end
    end

    if MPPriestHealSaved.Version ~= PriestHealSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[神牧宏]当前配置，这是新版插件正常数据更新！|r")
        MPPriestHealSaved[1] = {}
        MPPriestHealSaved[2] = {}
        MPPriestHealSaved[3] = {}
        MPResetPriestHealSettings(1)
        MPResetPriestHealSettings(2)
        MPResetPriestHealSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    MPInitPriestHealSettingsPart1()


    checkButton_HealthStone:SetChecked(MPToBoolean(MPPriestHealSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPPriestHealSaved[ConfigCurrent].HealthStone_Value)
    if MPPriestHealSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestHealSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestHealSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPriestHealSaved[ConfigCurrent].HerbalTea_Value)
    if MPPriestHealSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestHealSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPriestHealSaved[ConfigCurrent].HerbalTea_Value)
    if MPPriestHealSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPriestHealSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPriestHealSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPPriestHealSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")

    slider_GreaterHeal_Value:SetValue(MPPriestHealSaved[ConfigCurrent].GreaterHeal_Value)
    slider_Desperate_Value:SetValue(MPPriestHealSaved[ConfigCurrent].Desperate_Value)

    slider_Begin_Value:SetValue(MPPriestHealSaved[ConfigCurrent].Begin_Value)
    slider_Shield_Value:SetValue(MPPriestHealSaved[ConfigCurrent].Shield_Value)

    slider_RenewMinLevel:SetValue(MPPriestHealSaved[ConfigCurrent].RenewMinLevel)
    slider_RenewMaxLevel:SetValue(MPPriestHealSaved[ConfigCurrent].RenewMaxLevel)
    slider_FlashHealMinLevel:SetValue(MPPriestHealSaved[ConfigCurrent].FlashHealMinLevel)
    slider_FlashHealMaxLevel:SetValue(MPPriestHealSaved[ConfigCurrent].FlashHealMaxLevel)
    slider_GreaterHealMinLevel:SetValue(MPPriestHealSaved[ConfigCurrent].GreaterHealMinLevel)
    slider_GreaterHealMaxLevel:SetValue(MPPriestHealSaved[ConfigCurrent].GreaterHealMaxLevel)
    slider_PrayerHealingMinLevel:SetValue(MPPriestHealSaved[ConfigCurrent].PrayerHealingMinLevel)
    slider_PrayerHealingMaxLevel:SetValue(MPPriestHealSaved[ConfigCurrent].PrayerHealingMaxLevel)

    slider_PrayerHealing_Value:SetValue(MPPriestHealSaved[ConfigCurrent].PrayerHealing_Value)

end

