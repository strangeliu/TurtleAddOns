
-- 定义插件名称
local ADDON_NAME = "Settings-DriudHeal"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end


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
        MPDriudHealSaved.TargetFirst = 1
    else
        MPDriudHealSaved.TargetFirst = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 愈合
local checkButton_Regrowth = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 愈合 (主技能，谨慎关闭)")
checkButton_Regrowth:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.Regrowth = 1
    else
        MPDriudHealSaved.Regrowth = 0
    end
end)

-- 创建单选框 - 优先治疗目标 的 目标
local checkButton_TargetTarget = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 目标 的 目标")
checkButton_TargetTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.TargetTarget = 1
    else
        MPDriudHealSaved.TargetTarget = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 治疗之触
local checkButton_HealingTouch = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 治疗之触 (优先级>愈合)")
checkButton_HealingTouch:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.HealingTouch = 1
        MPDriudHealSaved.Shapeshift = 0
    else
        MPDriudHealSaved.HealingTouch = 0
    end
    checkButton_Shapeshift:SetChecked(ToBoolean(MPDriudHealSaved.Shapeshift))
    checkButton_HealingTouch:SetChecked(ToBoolean(MPDriudHealSaved.HealingTouch))

end)

-- 形态点击事件
checkButton_Shapeshift:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.Shapeshift = 1
        MPDriudHealSaved.HealingTouch = 0
    else
        MPDriudHealSaved.Shapeshift = 0
    end
    checkButton_Shapeshift:SetChecked(ToBoolean(MPDriudHealSaved.Shapeshift))
    checkButton_HealingTouch:SetChecked(ToBoolean(MPDriudHealSaved.HealingTouch))
end)

-- 创建单选框 - 优先治疗自己
local checkButton_SelfFirst = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "优先治疗 自己 (谨慎开启)")
checkButton_SelfFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.SelfFirst = 1
    else
        MPDriudHealSaved.SelfFirst = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 迅捷治愈
local checkButton_Swiftmend = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 迅捷治愈")
checkButton_Swiftmend:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.Swiftmend = 1
    else
        MPDriudHealSaved.Swiftmend = 0
    end
end)


-- 创建单选框 - 治疗大团
local checkButton_ScanTeam = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "治疗大团")
checkButton_ScanTeam:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.ScanTeam = 1
    else
        MPDriudHealSaved.ScanTeam = 0
    end
end)

local checkButton_ScanTeam_Low = MPCreateCheckButtonSmall(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 460, postion_y, "血量最低")
local checkButton_ScanTeam_Rand = MPCreateCheckButtonSmall(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 560, postion_y, "随机")

checkButton_ScanTeam_Low:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.ScanTeam_Low = 1
        MPDriudHealSaved.ScanTeam_Rand = 0
    else
        MPDriudHealSaved.ScanTeam_Low = 0
        MPDriudHealSaved.ScanTeam_Rand = 1
    end
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPDriudHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPDriudHealSaved.ScanTeam_Rand))
end)
checkButton_ScanTeam_Rand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.ScanTeam_Rand = 1
        MPDriudHealSaved.ScanTeam_Low = 0
    else
        MPDriudHealSaved.ScanTeam_Rand = 0
        MPDriudHealSaved.ScanTeam_Low = 1
    end
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPDriudHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPDriudHealSaved.ScanTeam_Rand))
end)



postion_y = postion_y-30

-- 创建单选框 - 移动回春
local checkButton_MoveRejuvenation = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 回春术 (移动时)")
checkButton_MoveRejuvenation:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.MoveRejuvenation = 1
    else
        MPDriudHealSaved.MoveRejuvenation = 0
    end
end)


-- 创建单选框 - Tip
local checkButton_Tip = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "开启 提示信息")
checkButton_Tip:Hide()
checkButton_Tip:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.Tip = 1
    else
        MPDriudHealSaved.Tip = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 重叠愈合
local checkButton_RegrowthAgain = MPCreateCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 百花齐放 (树形态)")
checkButton_RegrowthAgain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.RegrowthAgain = 1
    else
        MPDriudHealSaved.RegrowthAgain = 0
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
slider_Begin_Value:SetValue(99.5) -- 默认值
MPCatUISliderRegionHide(slider_Begin_Value)

_G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线：99.5%")
_G[slider_Begin_Value:GetName().."Low"]:Hide()
_G[slider_Begin_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Begin_Value:SetScript("OnValueChanged", function()
    _G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线："..arg1.."%")
    MPDriudHealSaved.Begin_Value = arg1
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
local checkButton_Overflow = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForce", CatUISettingsDriudHealWindow, "UICheckButtonTemplate")
checkButton_Overflow:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y)
checkButton_Overflow:SetScale(0.8)

-- 添加文字标签
local checkText_Overflow = checkButton_Overflow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Overflow:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Overflow:SetTextColor(1, 1, 1)
checkText_Overflow:SetPoint("LEFT", checkButton_Overflow, "LEFT", 34, 1)
checkText_Overflow:SetText("启用 溢出治疗时打断施法")

-- 设置点击事件
checkButton_Overflow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.Overflow = 1
    else
        MPDriudHealSaved.Overflow = 0
    end
end)




-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsDriudHealWindow, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 340, postion_y)
checkButton_HealthStone:SetScale(0.8)

-- 添加文字标签
local checkText_HealthStone = checkButton_HealthStone:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HealthStone:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HealthStone:SetTextColor(1, 1, 1)
checkText_HealthStone:SetPoint("LEFT", checkButton_HealthStone, "LEFT", 34, 1)
checkText_HealthStone:SetText("自动 治疗石")


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

_G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: 30%|r")
_G[slider_HealthStone:GetName().."Low"]:Hide()
_G[slider_HealthStone:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPDriudHealSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudHealSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudHealSaved.HealthStone_Value .."%|r")
    else
        MPDriudHealSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudHealSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsDriudHealWindow, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 340, postion_y)
checkButton_HerbalTea:SetScale(0.8)

-- 添加文字标签
local checkText_HerbalTea = checkButton_HerbalTea:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HerbalTea:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HerbalTea:SetTextColor(1, 1, 1)
checkText_HerbalTea:SetPoint("LEFT", checkButton_HerbalTea, "LEFT", 34, 1)
checkText_HerbalTea:SetText("自动 草药茶")


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

_G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: 20%|r")
_G[slider_HerbalTea:GetName().."Low"]:Hide()
_G[slider_HerbalTea:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPDriudHealSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved.HerbalTea_Value .."%|r")
    else
        MPDriudHealSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsDriudHealWindow, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 340, postion_y)
checkButton_HerbalTeaMana:SetScale(0.8)

-- 添加文字标签
local checkText_HerbalTeaMana = checkButton_HerbalTeaMana:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HerbalTeaMana:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HerbalTeaMana:SetTextColor(1, 1, 1)
checkText_HerbalTeaMana:SetPoint("LEFT", checkButton_HerbalTeaMana, "LEFT", 34, 1)
checkText_HerbalTeaMana:SetText("自动 草药茶")


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

_G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: 20%|r")
_G[slider_HerbalTeaMana:GetName().."Low"]:Hide()
_G[slider_HerbalTeaMana:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_HerbalTeaMana:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPDriudHealSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudHealSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudHealSaved.HerbalTeaMana_Value .."%|r")
    else
        MPDriudHealSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudHealSaved.HerbalTeaMana_Value .."%|r")
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
slider_RegrowthAgain_Value:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_RegrowthAgain_Value)

_G[slider_RegrowthAgain_Value:GetName().."Text"]:SetText("百花齐放 血线：50%")
_G[slider_RegrowthAgain_Value:GetName().."Low"]:Hide()
_G[slider_RegrowthAgain_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_RegrowthAgain_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_RegrowthAgain_Value:GetName().."Text"]:SetText("百花齐放 血线："..arg1.."%")
    MPDriudHealSaved.RegrowthAgain_Value = arg1
end)



postion_y = postion_y-40

-- 迅捷治愈 血线
local slider_Swiftmend_Value = CreateFrame("Slider", ADDON_NAME.."SliderSwiftmend_Value", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_Swiftmend_Value:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_Swiftmend_Value:SetWidth(220) -- 拖动条长度
slider_Swiftmend_Value:SetHeight(16) -- 拖动条高度

slider_Swiftmend_Value:SetMinMaxValues(10, 99)
slider_Swiftmend_Value:SetValueStep(1)
slider_Swiftmend_Value:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Swiftmend_Value)

_G[slider_Swiftmend_Value:GetName().."Text"]:SetText("迅捷治愈 血线：20%")
_G[slider_Swiftmend_Value:GetName().."Low"]:Hide()
_G[slider_Swiftmend_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Swiftmend_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_Swiftmend_Value:GetName().."Text"]:SetText("迅捷治愈 血线："..arg1.."%")
    MPDriudHealSaved.Swiftmend_Value = arg1
end)


postion_y = postion_y-40

-- 回春最低等级
local slider_RejuvenationMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderRejuvenationMinLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RejuvenationMinLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_RejuvenationMinLevel:SetWidth(105) -- 拖动条长度
slider_RejuvenationMinLevel:SetHeight(16) -- 拖动条高度

slider_RejuvenationMinLevel:SetMinMaxValues(1, 11)
slider_RejuvenationMinLevel:SetValueStep(1)
slider_RejuvenationMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_RejuvenationMinLevel)

_G[slider_RejuvenationMinLevel:GetName().."Text"]:SetText("回春最低1级")

-- 值变化时的回调函数
slider_RejuvenationMinLevel:SetScript("OnValueChanged", function()
    _G[slider_RejuvenationMinLevel:GetName().."Text"]:SetText("回春最低"..arg1.."级")
    MPDriudHealSaved.RejuvenationMinLevel = arg1
end)

-- 回春最高等级
local slider_RejuvenationMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderRejuvenationMaxLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RejuvenationMaxLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 135, postion_y+40)
slider_RejuvenationMaxLevel:SetWidth(105) -- 拖动条长度
slider_RejuvenationMaxLevel:SetHeight(16) -- 拖动条高度

slider_RejuvenationMaxLevel:SetMinMaxValues(1, 11)
slider_RejuvenationMaxLevel:SetValueStep(1)
slider_RejuvenationMaxLevel:SetValue(11) -- 默认值
MPCatUISliderRegionHide(slider_RejuvenationMaxLevel)

_G[slider_RejuvenationMaxLevel:GetName().."Text"]:SetText("回春最高11级")

-- 值变化时的回调函数
slider_RejuvenationMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_RejuvenationMaxLevel:GetName().."Text"]:SetText("回春最高"..arg1.."级")
    MPDriudHealSaved.RejuvenationMaxLevel = arg1
end)



postion_y = postion_y-40

-- 愈合最高等级
local slider_RegrowthMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderRegrowthMinLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RegrowthMinLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_RegrowthMinLevel:SetWidth(105) -- 拖动条长度
slider_RegrowthMinLevel:SetHeight(16) -- 拖动条高度

slider_RegrowthMinLevel:SetMinMaxValues(1, 9)
slider_RegrowthMinLevel:SetValueStep(1)
slider_RegrowthMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_RegrowthMinLevel)

_G[slider_RegrowthMinLevel:GetName().."Text"]:SetText("愈合最低1级")

-- 值变化时的回调函数
slider_RegrowthMinLevel:SetScript("OnValueChanged", function()
    _G[slider_RegrowthMinLevel:GetName().."Text"]:SetText("愈合最低"..arg1.."级")
    MPDriudHealSaved.RegrowthMinLevel = arg1
end)

-- 愈合最高等级
local slider_RegrowthMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderRegrowthMaxLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_RegrowthMaxLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 135, postion_y+40)
slider_RegrowthMaxLevel:SetWidth(105) -- 拖动条长度
slider_RegrowthMaxLevel:SetHeight(16) -- 拖动条高度

slider_RegrowthMaxLevel:SetMinMaxValues(1, 9)
slider_RegrowthMaxLevel:SetValueStep(1)
slider_RegrowthMaxLevel:SetValue(9) -- 默认值
MPCatUISliderRegionHide(slider_RegrowthMaxLevel)

_G[slider_RegrowthMaxLevel:GetName().."Text"]:SetText("愈合最高9级")

-- 值变化时的回调函数
slider_RegrowthMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_RegrowthMaxLevel:GetName().."Text"]:SetText("愈合最高"..arg1.."级")
    MPDriudHealSaved.RegrowthMaxLevel = arg1
end)


postion_y = postion_y-40

-- 治疗之触最高等级
local slider_TouchMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderTouchMinLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_TouchMinLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 20, postion_y+40)
slider_TouchMinLevel:SetWidth(105) -- 拖动条长度
slider_TouchMinLevel:SetHeight(16) -- 拖动条高度

slider_TouchMinLevel:SetMinMaxValues(1, 11)
slider_TouchMinLevel:SetValueStep(1)
slider_TouchMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_TouchMinLevel)

_G[slider_TouchMinLevel:GetName().."Text"]:SetText("触最低1级")
_G[slider_TouchMinLevel:GetName().."Low"]:Hide()
_G[slider_TouchMinLevel:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_TouchMinLevel:SetScript("OnValueChanged", function()
    _G[slider_TouchMinLevel:GetName().."Text"]:SetText("触最低"..arg1.."级")
    MPDriudHealSaved.TouchMinLevel = arg1
end)

-- 治疗之触最高等级
local slider_TouchMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderTouchMaxLevel", CatUISettingsDriudHealWindow, "OptionsSliderTemplate")
slider_TouchMaxLevel:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 135, postion_y+40)
slider_TouchMaxLevel:SetWidth(105) -- 拖动条长度
slider_TouchMaxLevel:SetHeight(16) -- 拖动条高度

slider_TouchMaxLevel:SetMinMaxValues(1, 11)
slider_TouchMaxLevel:SetValueStep(1)
slider_TouchMaxLevel:SetValue(11) -- 默认值
MPCatUISliderRegionHide(slider_TouchMaxLevel)

_G[slider_TouchMaxLevel:GetName().."Text"]:SetText("触最高11级")
_G[slider_TouchMaxLevel:GetName().."Low"]:Hide()
_G[slider_TouchMaxLevel:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_TouchMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_TouchMaxLevel:GetName().."Text"]:SetText("触最高"..arg1.."级")
    MPDriudHealSaved.TouchMaxLevel = arg1
end)





-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsDriudHealWindow, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsDriudHealWindow, "TOPLEFT", 120, -44)
myButton:SetWidth(100)
myButton:SetHeight(22)
myButton:SetFont("Fonts\\FRIZQT__.TTF", 12)
myButton:SetText(MPLanguage.UI_Set_ResetDefaults)

-- 调整按钮纹理
myButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
myButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
myButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
myButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
-- 按钮点击事件
myButton:SetScript("OnClick", function()
    MPResetDriudHealSettings()
    MPInitDriudHealSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsDriudHealWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsDriudHealWindow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudHealSaved.Power = 1
    else
        MPDriudHealSaved.Power = 0
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
        MPDriudHealSaved.Pick = 1
    else
        MPDriudHealSaved.Pick = 0
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
TipText:SetText("宏命令 -  [ |cFFFF7D0A/dheal|r ]")



-- 配置文件版本号
local DriudHealSettingsUIVersion = 18

function MPResetDriudHealSettings()

    MPDriudHealSaved.Version = DriudHealSettingsUIVersion

    -- 基本配置

    MPDriudHealSaved.Shapeshift = 1
    MPDriudHealSaved.MoveRejuvenation = 1
    MPDriudHealSaved.Regrowth = 1
    MPDriudHealSaved.HealingTouch = 0
    MPDriudHealSaved.Swiftmend = 1
    MPDriudHealSaved.Tip = 1
    MPDriudHealSaved.TargetFirst = 1
    MPDriudHealSaved.TargetTarget = 1
    MPDriudHealSaved.SelfFirst = 0
    MPDriudHealSaved.ScanTeam = 1
    MPDriudHealSaved.ScanTeam_Low = 1
    MPDriudHealSaved.ScanTeam_Rand = 0
    MPDriudHealSaved.RegrowthAgain = 0
    MPDriudHealSaved.Overflow = 0

    MPDriudHealSaved.Begin_Value = 99.5

    -- 高级配置

    -- 治疗石、糖水茶
    MPDriudHealSaved.HealthStone = 1
    MPDriudHealSaved.HealthStone_Value = 30
    MPDriudHealSaved.HerbalTea = 1
    MPDriudHealSaved.HerbalTea_Value = 20
    MPDriudHealSaved.HerbalTeaMana = 0
    MPDriudHealSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPDriudHealSaved.SuperWoW = 1
    MPDriudHealSaved.UnitXP = 1

    MPDriudHealSaved.Regrowth_Value = 99
    MPDriudHealSaved.Rejuvenation_Value = 99
    MPDriudHealSaved.Swiftmend_Value = 40
    MPDriudHealSaved.RegrowthAgain_Value = 50

    MPDriudHealSaved.RejuvenationMinLevel = 1
    MPDriudHealSaved.RejuvenationMaxLevel = 11
    MPDriudHealSaved.RegrowthMinLevel = 1
    MPDriudHealSaved.RegrowthMaxLevel = 9
    MPDriudHealSaved.TouchMinLevel = 1
    MPDriudHealSaved.TouchMaxLevel = 11

    -- 通用
    MPDriudHealSaved.Power = 0
    MPDriudHealSaved.Pick = 0
end


function MPInitDriudHealSettingsPart1()
    checkButton_Shapeshift:SetChecked(ToBoolean(MPDriudHealSaved.Shapeshift))
    checkButton_MoveRejuvenation:SetChecked( ToBoolean(MPDriudHealSaved.MoveRejuvenation) )
    checkButton_Regrowth:SetChecked( ToBoolean(MPDriudHealSaved.Regrowth) )
    checkButton_HealingTouch:SetChecked( ToBoolean(MPDriudHealSaved.HealingTouch) )
    checkButton_Swiftmend:SetChecked(ToBoolean(MPDriudHealSaved.Swiftmend))
    checkButton_RegrowthAgain:SetChecked(ToBoolean(MPDriudHealSaved.RegrowthAgain))

    checkButton_TargetFirst:SetChecked(ToBoolean(MPDriudHealSaved.TargetFirst))
    checkButton_TargetTarget:SetChecked(ToBoolean(MPDriudHealSaved.TargetTarget))
    checkButton_SelfFirst:SetChecked(ToBoolean(MPDriudHealSaved.SelfFirst))
    checkButton_ScanTeam:SetChecked(ToBoolean(MPDriudHealSaved.ScanTeam))
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPDriudHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPDriudHealSaved.ScanTeam_Rand))
    checkButton_Tip:SetChecked(ToBoolean(MPDriudHealSaved.Tip))

    checkButton_Overflow:SetChecked(ToBoolean(MPDriudHealSaved.Overflow))

    checkButton_Power:SetChecked(ToBoolean(MPDriudHealSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPDriudHealSaved.Pick))
end

function MPInitDriudHealSettings()
    if not MPDriudHealSaved then
        MPDriudHealSaved = {}
        MPResetDriudHealSettings()
    end

    if MPDriudHealSaved.Version ~= DriudHealSettingsUIVersion then
        MPResetDriudHealSettings()
    end

    MPInitDriudHealSettingsPart1()


    checkButton_HealthStone:SetChecked(ToBoolean(MPDriudHealSaved.HealthStone))
    slider_HealthStone:SetValue(MPDriudHealSaved.HealthStone_Value)
    if MPDriudHealSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudHealSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudHealSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPDriudHealSaved.HerbalTea_Value)
    if MPDriudHealSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudHealSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPDriudHealSaved.HerbalTea_Value)
    if MPDriudHealSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudHealSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPDriudHealSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPDriudHealSaved.HerbalTeaMana_Value)
    if MPDriudHealSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudHealSaved.HerbalTeaMana_Value .."%|r")

    --slider_Regrowth_Value:SetValue(MPDriudHealSaved.Regrowth_Value)
    --slider_Rejuvenation_Value:SetValue(MPDriudHealSaved.Rejuvenation_Value)
    slider_RegrowthAgain_Value:SetValue(MPDriudHealSaved.RegrowthAgain_Value)
    slider_Swiftmend_Value:SetValue(MPDriudHealSaved.Swiftmend_Value)

    slider_Begin_Value:SetValue(MPDriudHealSaved.Begin_Value)

    slider_RejuvenationMinLevel:SetValue(MPDriudHealSaved.RejuvenationMinLevel)
    slider_RejuvenationMaxLevel:SetValue(MPDriudHealSaved.RejuvenationMaxLevel)
    slider_RegrowthMinLevel:SetValue(MPDriudHealSaved.RegrowthMinLevel)
    slider_RegrowthMaxLevel:SetValue(MPDriudHealSaved.RegrowthMaxLevel)
    slider_TouchMinLevel:SetValue(MPDriudHealSaved.TouchMinLevel)
    slider_TouchMaxLevel:SetValue(MPDriudHealSaved.TouchMaxLevel)

end

