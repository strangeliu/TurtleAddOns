
-- 定义插件名称
local ADDON_NAME = "Settings-DriudHeal"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsDriudHealWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 620, "|cFFFF7D0A设置 - 奶德|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsDriudHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 生命之树形态
local checkButton_Shapeshift = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 生命之树形态")


-- 创建单选框 - 优先治疗目标
local checkButton_TargetFirst = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 目标")
checkButton_TargetFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].TargetFirst = 1
    else
        MPDriudHealSaved[ConfigCurrent].TargetFirst = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 愈合
local checkButton_Regrowth = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 愈合 (主技能，谨慎关闭)")
checkButton_Regrowth:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].Regrowth = 1
    else
        MPDriudHealSaved[ConfigCurrent].Regrowth = 0
    end
end)

-- 创建单选框 - 优先治疗目标 的 目标
local checkButton_TargetTarget = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 目标 的 目标")
checkButton_TargetTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].TargetTarget = 1
    else
        MPDriudHealSaved[ConfigCurrent].TargetTarget = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 治疗之触
local checkButton_HealingTouch = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 治疗之触 (优先级>愈合)")
checkButton_HealingTouch:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].HealingTouch = 1
        MPDriudHealSaved[ConfigCurrent].Shapeshift = 0
    else
        MPDriudHealSaved[ConfigCurrent].HealingTouch = 0
    end
    checkButton_Shapeshift:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].Shapeshift))
    checkButton_HealingTouch:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].HealingTouch))

end)

-- 形态点击事件
checkButton_Shapeshift:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].Shapeshift = 1
        MPDriudHealSaved[ConfigCurrent].HealingTouch = 0
    else
        MPDriudHealSaved[ConfigCurrent].Shapeshift = 0
    end
    checkButton_Shapeshift:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].Shapeshift))
    checkButton_HealingTouch:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].HealingTouch))
end)

-- 创建单选框 - 优先治疗自己
local checkButton_SelfFirst = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 自己 (谨慎开启)")
checkButton_SelfFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].SelfFirst = 1
    else
        MPDriudHealSaved[ConfigCurrent].SelfFirst = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 迅捷治愈
local checkButton_Swiftmend = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 迅捷治愈")
checkButton_Swiftmend:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].Swiftmend = 1
    else
        MPDriudHealSaved[ConfigCurrent].Swiftmend = 0
    end
end)


-- 创建单选框 - 治疗大团
local checkButton_ScanTeam = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "治疗大团")
checkButton_ScanTeam:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].ScanTeam = 1
    else
        MPDriudHealSaved[ConfigCurrent].ScanTeam = 0
    end
end)

local checkButton_ScanTeam_Low = MPCreateCheckButtonSmall(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 460, postion_y, "血量最低")
local checkButton_ScanTeam_Rand = MPCreateCheckButtonSmall(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 560, postion_y, "随机")

checkButton_ScanTeam_Low:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].ScanTeam_Low = 1
        MPDriudHealSaved[ConfigCurrent].ScanTeam_Rand = 0
    else
        MPDriudHealSaved[ConfigCurrent].ScanTeam_Low = 0
        MPDriudHealSaved[ConfigCurrent].ScanTeam_Rand = 1
    end
    checkButton_ScanTeam_Low:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].ScanTeam_Rand))
end)
checkButton_ScanTeam_Rand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].ScanTeam_Rand = 1
        MPDriudHealSaved[ConfigCurrent].ScanTeam_Low = 0
    else
        MPDriudHealSaved[ConfigCurrent].ScanTeam_Rand = 0
        MPDriudHealSaved[ConfigCurrent].ScanTeam_Low = 1
    end
    checkButton_ScanTeam_Low:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].ScanTeam_Rand))
end)



postion_y = postion_y-30

-- 创建单选框 - 移动回春
local checkButton_MoveRejuvenation = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 回春术 (移动时)")
checkButton_MoveRejuvenation:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].MoveRejuvenation = 1
    else
        MPDriudHealSaved[ConfigCurrent].MoveRejuvenation = 0
    end
end)


-- 创建单选框 - Tip
local checkButton_Tip = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "开启 提示信息")
checkButton_Tip:Hide()
checkButton_Tip:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].Tip = 1
    else
        MPDriudHealSaved[ConfigCurrent].Tip = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 重叠愈合
local checkButton_RegrowthAgain = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 百花齐放 (树形态)")
checkButton_RegrowthAgain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].RegrowthAgain = 1
    else
        MPDriudHealSaved[ConfigCurrent].RegrowthAgain = 0
    end
end)


postion_y = postion_y - 50

--起始治疗
local slider_Begin_Value = CreateFrame("Slider", ADDON_NAME.."SliderBegin_Value", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_Begin_Value:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_Begin_Value:SetWidth(220) -- 拖动条长度
slider_Begin_Value:SetHeight(16) -- 拖动条高度

slider_Begin_Value:SetMinMaxValues(80, 100)
slider_Begin_Value:SetValueStep(0.5)
slider_Begin_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Begin_Value)

-- 值变化时的回调函数
slider_Begin_Value:SetScript("OnValueChanged", function()
    _G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线："..arg1.."%")
    MPDriudHealSaved[ConfigCurrent].Begin_Value = arg1
end)




-- 高级



postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsDriudHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-100


-- 创建单选框 - 溢出治疗
local checkButton_Overflow = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "启用 溢出治疗时打断施法")
-- 设置点击事件
checkButton_Overflow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].Overflow = 1
    else
        MPDriudHealSaved[ConfigCurrent].Overflow = 0
    end
end)




-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

local slider_HealthStone = CreateFrame("Slider", ADDON_NAME.."Slider_HealthStone", checkButton_HealthStone, "OptionsSliderTemplate")
slider_HealthStone:SetPoint("RIGHT", checkButton_HealthStone, "RIGHT", 250, -2)
slider_HealthStone:SetWidth(150) -- 拖动条长度
slider_HealthStone:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HealthStone:SetMinMaxValues(0, 100)
slider_HealthStone:SetValueStep(1)
slider_HealthStone:SetValue(30) -- 默认值
MPCatUISliderRegionHide(slider_HealthStone)

local color_HealthStone = "|cFFFFD100"

-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPDriudHealSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPDriudHealSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudHealSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

local slider_HerbalTea = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTea", checkButton_HerbalTea, "OptionsSliderTemplate")
slider_HerbalTea:SetPoint("RIGHT", checkButton_HerbalTea, "RIGHT", 250, -2)
slider_HerbalTea:SetWidth(150) -- 拖动条长度
slider_HerbalTea:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HerbalTea:SetMinMaxValues(0, 100)
slider_HerbalTea:SetValueStep(1)
slider_HerbalTea:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTea)

local color_HerbalTea = "|cFFFFD100"

-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPDriudHealSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPDriudHealSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

local slider_HerbalTeaMana = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTeaMana", checkButton_HerbalTeaMana, "OptionsSliderTemplate")
slider_HerbalTeaMana:SetPoint("RIGHT", checkButton_HerbalTeaMana, "RIGHT", 250, -2)
slider_HerbalTeaMana:SetWidth(150) -- 拖动条长度
slider_HerbalTeaMana:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HerbalTeaMana:SetMinMaxValues(0, 100)
slider_HerbalTeaMana:SetValueStep(1)
slider_HerbalTeaMana:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTeaMana)

local color_HerbalTeaMana = "|cFFFFD100"

-- 值变化时的回调函数
slider_HerbalTeaMana:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPDriudHealSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPDriudHealSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y+30+40

-- 百花齐放 血线
local slider_RegrowthAgain_Value = CreateFrame("Slider", ADDON_NAME.."SliderRegrowthAgain_Value", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RegrowthAgain_Value:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_RegrowthAgain_Value:SetWidth(220) -- 拖动条长度
slider_RegrowthAgain_Value:SetHeight(16) -- 拖动条高度

slider_RegrowthAgain_Value:SetMinMaxValues(10, 99)
slider_RegrowthAgain_Value:SetValueStep(1)
slider_RegrowthAgain_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_RegrowthAgain_Value)

-- 值变化时的回调函数
slider_RegrowthAgain_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_RegrowthAgain_Value:GetName().."Text"]:SetText("百花齐放 血线："..arg1.."%")
    MPDriudHealSaved[ConfigCurrent].RegrowthAgain_Value = arg1
end)



postion_y = postion_y-40

-- 迅捷治愈 血线
local slider_Swiftmend_Value = CreateFrame("Slider", ADDON_NAME.."SliderSwiftmend_Value", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_Swiftmend_Value:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_Swiftmend_Value:SetWidth(220) -- 拖动条长度
slider_Swiftmend_Value:SetHeight(16) -- 拖动条高度

slider_Swiftmend_Value:SetMinMaxValues(10, 99)
slider_Swiftmend_Value:SetValueStep(1)
slider_Swiftmend_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Swiftmend_Value)

-- 值变化时的回调函数
slider_Swiftmend_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_Swiftmend_Value:GetName().."Text"]:SetText("迅捷治愈 血线："..arg1.."%")
    MPDriudHealSaved[ConfigCurrent].Swiftmend_Value = arg1
end)


postion_y = postion_y-40

-- 回春最低等级
local slider_RejuvenationMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderRejuvenationMinLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RejuvenationMinLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_RejuvenationMinLevel:SetWidth(105) -- 拖动条长度
slider_RejuvenationMinLevel:SetHeight(16) -- 拖动条高度

slider_RejuvenationMinLevel:SetMinMaxValues(1, 11)
slider_RejuvenationMinLevel:SetValueStep(1)
slider_RejuvenationMinLevel:SetValue(100) -- 默认值
MPCatUISliderRegionHide(slider_RejuvenationMinLevel)

-- 值变化时的回调函数
slider_RejuvenationMinLevel:SetScript("OnValueChanged", function()
    _G[slider_RejuvenationMinLevel:GetName().."Text"]:SetText("回春最低"..arg1.."级")
    MPDriudHealSaved[ConfigCurrent].RejuvenationMinLevel = arg1
end)

-- 回春最高等级
local slider_RejuvenationMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderRejuvenationMaxLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RejuvenationMaxLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 135, postion_y+40)
slider_RejuvenationMaxLevel:SetWidth(105) -- 拖动条长度
slider_RejuvenationMaxLevel:SetHeight(16) -- 拖动条高度

slider_RejuvenationMaxLevel:SetMinMaxValues(1, 11)
slider_RejuvenationMaxLevel:SetValueStep(1)
slider_RejuvenationMaxLevel:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_RejuvenationMaxLevel)

-- 值变化时的回调函数
slider_RejuvenationMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_RejuvenationMaxLevel:GetName().."Text"]:SetText("回春最高"..arg1.."级")
    MPDriudHealSaved[ConfigCurrent].RejuvenationMaxLevel = arg1
end)



postion_y = postion_y-40

-- 愈合最高等级
local slider_RegrowthMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderRegrowthMinLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RegrowthMinLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_RegrowthMinLevel:SetWidth(105) -- 拖动条长度
slider_RegrowthMinLevel:SetHeight(16) -- 拖动条高度

slider_RegrowthMinLevel:SetMinMaxValues(1, 9)
slider_RegrowthMinLevel:SetValueStep(1)
slider_RegrowthMinLevel:SetValue(100) -- 默认值
MPCatUISliderRegionHide(slider_RegrowthMinLevel)

-- 值变化时的回调函数
slider_RegrowthMinLevel:SetScript("OnValueChanged", function()
    _G[slider_RegrowthMinLevel:GetName().."Text"]:SetText("愈合最低"..arg1.."级")
    MPDriudHealSaved[ConfigCurrent].RegrowthMinLevel = arg1
end)

-- 愈合最高等级
local slider_RegrowthMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderRegrowthMaxLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RegrowthMaxLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 135, postion_y+40)
slider_RegrowthMaxLevel:SetWidth(105) -- 拖动条长度
slider_RegrowthMaxLevel:SetHeight(16) -- 拖动条高度

slider_RegrowthMaxLevel:SetMinMaxValues(1, 9)
slider_RegrowthMaxLevel:SetValueStep(1)
slider_RegrowthMaxLevel:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_RegrowthMaxLevel)

-- 值变化时的回调函数
slider_RegrowthMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_RegrowthMaxLevel:GetName().."Text"]:SetText("愈合最高"..arg1.."级")
    MPDriudHealSaved[ConfigCurrent].RegrowthMaxLevel = arg1
end)


postion_y = postion_y-40

-- 治疗之触最低等级
local slider_TouchMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderTouchMinLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_TouchMinLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_TouchMinLevel:SetWidth(105) -- 拖动条长度
slider_TouchMinLevel:SetHeight(16) -- 拖动条高度

slider_TouchMinLevel:SetMinMaxValues(1, 11)
slider_TouchMinLevel:SetValueStep(1)
slider_TouchMinLevel:SetValue(100) -- 默认值
MPCatUISliderRegionHide(slider_TouchMinLevel)

-- 值变化时的回调函数
slider_TouchMinLevel:SetScript("OnValueChanged", function()
    _G[slider_TouchMinLevel:GetName().."Text"]:SetText("触最低"..arg1.."级")
    MPDriudHealSaved[ConfigCurrent].TouchMinLevel = arg1
end)

-- 治疗之触最高等级
local slider_TouchMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderTouchMaxLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_TouchMaxLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 135, postion_y+40)
slider_TouchMaxLevel:SetWidth(105) -- 拖动条长度
slider_TouchMaxLevel:SetHeight(16) -- 拖动条高度

slider_TouchMaxLevel:SetMinMaxValues(1, 11)
slider_TouchMaxLevel:SetValueStep(1)
slider_TouchMaxLevel:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_TouchMaxLevel)

-- 值变化时的回调函数
slider_TouchMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_TouchMaxLevel:GetName().."Text"]:SetText("触最高"..arg1.."级")
    MPDriudHealSaved[ConfigCurrent].TouchMaxLevel = arg1
end)




local myButton = MPCreateButton(CatUISettingsDriudHealWindow, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetDriudHealSettings(ConfigCurrent)
    MPInitDriudHealSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsDriudHealWindow, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsDriudHealWindow, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsDriudHealWindow, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 440, -44)
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
    MPInitDriudHealSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitDriudHealSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitDriudHealSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsDriudHealWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].Power = 1
    else
        MPDriudHealSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved[ConfigCurrent].Pick = 1
    else
        MPDriudHealSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsDriudHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsDriudHealWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFF7D0A/dheal|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local DriudHealSettingsUIVersion = 20

function MPResetDriudHealSettings(config)

    MPDriudHealSaved.Version = DriudHealSettingsUIVersion

    -- 基本配置

    MPDriudHealSaved[config].Shapeshift = 1
    MPDriudHealSaved[config].MoveRejuvenation = 1
    MPDriudHealSaved[config].Regrowth = 1
    MPDriudHealSaved[config].HealingTouch = 0
    MPDriudHealSaved[config].Swiftmend = 1
    MPDriudHealSaved[config].Tip = 1
    MPDriudHealSaved[config].TargetFirst = 1
    MPDriudHealSaved[config].TargetTarget = 1
    MPDriudHealSaved[config].SelfFirst = 0
    MPDriudHealSaved[config].ScanTeam = 1
    MPDriudHealSaved[config].ScanTeam_Low = 1
    MPDriudHealSaved[config].ScanTeam_Rand = 0
    MPDriudHealSaved[config].RegrowthAgain = 1
    MPDriudHealSaved[config].Overflow = 0

    MPDriudHealSaved[config].Begin_Value = 99.5

    -- 高级配置

    -- 治疗石、糖水茶
    MPDriudHealSaved[config].HealthStone = 1
    MPDriudHealSaved[config].HealthStone_Value = 30
    MPDriudHealSaved[config].HerbalTea = 1
    MPDriudHealSaved[config].HerbalTea_Value = 20
    MPDriudHealSaved[config].HerbalTeaMana = 0
    MPDriudHealSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPDriudHealSaved[config].SuperWoW = 1
    MPDriudHealSaved[config].UnitXP = 1

    MPDriudHealSaved[config].Regrowth_Value = 99
    MPDriudHealSaved[config].Rejuvenation_Value = 99
    MPDriudHealSaved[config].Swiftmend_Value = 50
    MPDriudHealSaved[config].RegrowthAgain_Value = 70

    MPDriudHealSaved[config].RejuvenationMinLevel = 1
    MPDriudHealSaved[config].RejuvenationMaxLevel = 11
    MPDriudHealSaved[config].RegrowthMinLevel = 1
    MPDriudHealSaved[config].RegrowthMaxLevel = 9
    MPDriudHealSaved[config].TouchMinLevel = 1
    MPDriudHealSaved[config].TouchMaxLevel = 11

    -- 通用
    MPDriudHealSaved[config].Power = 0
    MPDriudHealSaved[config].Pick = 0
end


function MPInitDriudHealSettingsPart1()
    checkButton_Shapeshift:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].Shapeshift))
    checkButton_MoveRejuvenation:SetChecked( MPToBoolean(MPDriudHealSaved[ConfigCurrent].MoveRejuvenation) )
    checkButton_Regrowth:SetChecked( MPToBoolean(MPDriudHealSaved[ConfigCurrent].Regrowth) )
    checkButton_HealingTouch:SetChecked( MPToBoolean(MPDriudHealSaved[ConfigCurrent].HealingTouch) )
    checkButton_Swiftmend:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].Swiftmend))
    checkButton_RegrowthAgain:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].RegrowthAgain))

    checkButton_TargetFirst:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].TargetFirst))
    checkButton_TargetTarget:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].TargetTarget))
    checkButton_SelfFirst:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].SelfFirst))
    checkButton_ScanTeam:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].ScanTeam))
    checkButton_ScanTeam_Low:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].ScanTeam_Rand))
    checkButton_Tip:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].Tip))

    checkButton_Overflow:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].Overflow))

    checkButton_Power:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].Pick))
end

function MPInitDriudHealSettings()
    if not MPDriudHealSaved then
        MPDriudHealSaved = {}

        -- 第一套配置
        if not MPDriudHealSaved[1] then
            MPDriudHealSaved[1] = {}
            MPResetDriudHealSettings(1)
        end

        -- 第二套配置
        if not MPDriudHealSaved[2] then
            MPDriudHealSaved[2] = {}
            MPResetDriudHealSettings(2)
        end

        -- 第三套配置
        if not MPDriudHealSaved[3] then
            MPDriudHealSaved[3] = {}
            MPResetDriudHealSettings(3)
        end
    end

    if MPDriudHealSaved.Version ~= DriudHealSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[奶德宏]当前配置，这是新版插件正常数据更新！|r")
        MPDriudHealSaved[1] = {}
        MPDriudHealSaved[2] = {}
        MPDriudHealSaved[3] = {}
        MPResetDriudHealSettings(1)
        MPResetDriudHealSettings(2)
        MPResetDriudHealSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)


    MPInitDriudHealSettingsPart1()


    checkButton_HealthStone:SetChecked(MPToBoolean(MPDriudHealSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPDriudHealSaved[ConfigCurrent].HealthStone_Value)
    if MPDriudHealSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudHealSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudHealSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPDriudHealSaved[ConfigCurrent].HerbalTea_Value)
    if MPDriudHealSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudHealSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPDriudHealSaved[ConfigCurrent].HerbalTea_Value)
    if MPDriudHealSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPDriudHealSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPDriudHealSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPDriudHealSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudHealSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")

    --slider_Regrowth_Value:SetValue(MPDriudHealSaved[ConfigCurrent].Regrowth_Value)
    --slider_Rejuvenation_Value:SetValue(MPDriudHealSaved[ConfigCurrent].Rejuvenation_Value)
    slider_RegrowthAgain_Value:SetValue(MPDriudHealSaved[ConfigCurrent].RegrowthAgain_Value)
    slider_Swiftmend_Value:SetValue(MPDriudHealSaved[ConfigCurrent].Swiftmend_Value)

    slider_Begin_Value:SetValue(MPDriudHealSaved[ConfigCurrent].Begin_Value)

    slider_RejuvenationMinLevel:SetValue(MPDriudHealSaved[ConfigCurrent].RejuvenationMinLevel)
    slider_RejuvenationMaxLevel:SetValue(MPDriudHealSaved[ConfigCurrent].RejuvenationMaxLevel)
    slider_RegrowthMinLevel:SetValue(MPDriudHealSaved[ConfigCurrent].RegrowthMinLevel)
    slider_RegrowthMaxLevel:SetValue(MPDriudHealSaved[ConfigCurrent].RegrowthMaxLevel)
    slider_TouchMinLevel:SetValue(MPDriudHealSaved[ConfigCurrent].TouchMinLevel)
    slider_TouchMaxLevel:SetValue(MPDriudHealSaved[ConfigCurrent].TouchMaxLevel)

end

