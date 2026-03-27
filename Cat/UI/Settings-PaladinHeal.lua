
-- 定义插件名称
local ADDON_NAME = "Settings-PaladinHeal"



-- 创建主框架
CatUISettingsPaladinHealWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 580, "|cFFF58CBA设置 - 奶骑|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPaladinHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end





local postion_y = postion_y-40

-- 创建单选框 - 圣光术
local checkButton_HolyLight = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_HolyLight:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y)
checkButton_HolyLight:SetScale(0.8)

-- 添加文字标签
local checkText_HolyLight = checkButton_HolyLight:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HolyLight:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HolyLight:SetTextColor(1, 1, 1)
checkText_HolyLight:SetPoint("LEFT", checkButton_HolyLight, "LEFT", 34, 1)
checkText_HolyLight:SetText("开启 圣光术")

-- 设置点击事件
checkButton_HolyLight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.HolyLight = 1
    else
        MPPaladinHealSaved.HolyLight = 0
    end
end)


-- 创建单选框 - 优先治疗目标
local checkButton_TargetFirst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_TargetFirst:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
checkButton_TargetFirst:SetScale(0.8)

-- 添加文字标签
local checkText_TargetFirst = checkButton_TargetFirst:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_TargetFirst:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_TargetFirst:SetTextColor(1, 1, 1)
checkText_TargetFirst:SetPoint("LEFT", checkButton_TargetFirst, "LEFT", 34, 1)
checkText_TargetFirst:SetText("优先治疗 目标")

-- 设置点击事件
checkButton_TargetFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.TargetFirst = 1
    else
        MPPaladinHealSaved.TargetFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 圣光闪现
local checkButton_FlashLight = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_FlashLight:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y)
checkButton_FlashLight:SetScale(0.8)

-- 添加文字标签
local checkText_FlashLight = checkButton_FlashLight:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FlashLight:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FlashLight:SetTextColor(1, 1, 1)
checkText_FlashLight:SetPoint("LEFT", checkButton_FlashLight, "LEFT", 34, 1)
checkText_FlashLight:SetText("开启 圣光闪现")

-- 设置点击事件
checkButton_FlashLight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.FlashLight = 1
    else
        MPPaladinHealSaved.FlashLight = 0
    end
end)

-- 创建单选框 - 优先治疗目标 的 目标
local checkButton_TargetTarget = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_TargetTarget:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
checkButton_TargetTarget:SetScale(0.8)

-- 添加文字标签
local checkText_TargetTarget = checkButton_TargetTarget:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_TargetTarget:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_TargetTarget:SetTextColor(1, 1, 1)
checkText_TargetTarget:SetPoint("LEFT", checkButton_TargetTarget, "LEFT", 34, 1)
checkText_TargetTarget:SetText("优先治疗 目标 的 目标")

-- 设置点击事件
checkButton_TargetTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.TargetTarget = 1
    else
        MPPaladinHealSaved.TargetTarget = 0
    end
end)





postion_y = postion_y-30

-- 创建单选框 - 神圣震击
local checkButton_HolyShock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_HolyShock:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y)
checkButton_HolyShock:SetScale(0.8)

-- 添加文字标签
local checkText_HolyShock = checkButton_HolyShock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HolyShock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HolyShock:SetTextColor(1, 1, 1)
checkText_HolyShock:SetPoint("LEFT", checkButton_HolyShock, "LEFT", 34, 1)
checkText_HolyShock:SetText("开启 神圣震击 (移动也能施放)")

-- 设置点击事件
checkButton_HolyShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.HolyShock = 1
    else
        MPPaladinHealSaved.HolyShock = 0
    end
end)


-- 创建单选框 - 优先治疗自己
local checkButton_SelfFirst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_SelfFirst:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
checkButton_SelfFirst:SetScale(0.8)

-- 添加文字标签
local checkText_SelfFirst = checkButton_SelfFirst:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SelfFirst:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SelfFirst:SetTextColor(1, 1, 1)
checkText_SelfFirst:SetPoint("LEFT", checkButton_SelfFirst, "LEFT", 34, 1)
checkText_SelfFirst:SetText("优先治疗 自己 (谨慎开启)")

-- 设置点击事件
checkButton_SelfFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.SelfFirst = 1
    else
        MPPaladinHealSaved.SelfFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 圣疗
local checkButton_LayHands = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_LayHands:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y)
checkButton_LayHands:SetScale(0.8)

-- 添加文字标签
local checkText_LayHands = checkButton_LayHands:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LayHands:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LayHands:SetTextColor(1, 1, 1)
checkText_LayHands:SetPoint("LEFT", checkButton_LayHands, "LEFT", 34, 1)
checkText_LayHands:SetText("开启 圣疗术")

-- 设置点击事件
checkButton_LayHands:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.LayHands = 1
    else
        MPPaladinHealSaved.LayHands = 0
    end
end)


-- 创建单选框 - 治疗大团
local checkButton_ScanTeam = MPCreateCheckButton(CatUISettingsPaladinHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "治疗大团")
checkButton_ScanTeam:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.ScanTeam = 1
    else
        MPPaladinHealSaved.ScanTeam = 0
    end
end)

local checkButton_ScanTeam_Low = MPCreateCheckButtonSmall(CatUISettingsPaladinHealWindow, ADDON_NAME.."CheckButton", 460, postion_y, "血量最低")
local checkButton_ScanTeam_Rand = MPCreateCheckButtonSmall(CatUISettingsPaladinHealWindow, ADDON_NAME.."CheckButton", 560, postion_y, "随机")

checkButton_ScanTeam_Low:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.ScanTeam_Low = 1
        MPPaladinHealSaved.ScanTeam_Rand = 0
    else
        MPPaladinHealSaved.ScanTeam_Low = 0
        MPPaladinHealSaved.ScanTeam_Rand = 1
    end
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPPaladinHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPPaladinHealSaved.ScanTeam_Rand))
end)
checkButton_ScanTeam_Rand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.ScanTeam_Rand = 1
        MPPaladinHealSaved.ScanTeam_Low = 0
    else
        MPPaladinHealSaved.ScanTeam_Rand = 0
        MPPaladinHealSaved.ScanTeam_Low = 1
    end
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPPaladinHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPPaladinHealSaved.ScanTeam_Rand))
end)



postion_y = postion_y - 30

-- 创建单选框 - Tip
local checkButton_Tip = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_Tip:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
checkButton_Tip:SetScale(0.8)
checkButton_Tip:Hide()

-- 添加文字标签
local checkText_Tip = checkButton_Tip:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Tip:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Tip:SetTextColor(1, 1, 1)
checkText_Tip:SetPoint("LEFT", checkButton_Tip, "LEFT", 34, 1)
checkText_Tip:SetText("开启 提示信息")

-- 设置点击事件
checkButton_Tip:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.Tip = 1
    else
        MPPaladinHealSaved.Tip = 0
    end
end)

postion_y = postion_y - 60 + 30

--起始治疗
local slider_Begin_Value = CreateFrame("Slider", ADDON_NAME.."SliderBegin_Value", CatUISettingsPaladinHealWindow, "OptionsSliderTemplate")
slider_Begin_Value:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y+40)
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
    MPPaladinHealSaved.Begin_Value = arg1
end)




-- 高级



postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsPaladinHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-90


-- 创建单选框 - 溢出治疗
local checkButton_Overflow = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForce", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_Overflow:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y)
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
        MPPaladinHealSaved.Overflow = 1
    else
        MPPaladinHealSaved.Overflow = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
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
    MPPaladinHealSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinHealSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinHealSaved.HealthStone_Value .."%|r")
    else
        MPPaladinHealSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinHealSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
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
    MPPaladinHealSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinHealSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinHealSaved.HerbalTea_Value .."%|r")
    else
        MPPaladinHealSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinHealSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
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
    MPPaladinHealSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinHealSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinHealSaved.HerbalTeaMana_Value .."%|r")
    else
        MPPaladinHealSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinHealSaved.HerbalTeaMana_Value .."%|r")
    end
end)




postion_y = postion_y - 40


-- 创建单选框 - 保护之手
local checkButton_Protection = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_Protection:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
checkButton_Protection:SetScale(0.8)

-- 添加文字标签
local checkText_Protection = checkButton_Protection:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Protection:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Protection:SetTextColor(1, 1, 1)
checkText_Protection:SetPoint("LEFT", checkButton_Protection, "LEFT", 34, 1)
checkText_Protection:SetText("自动 保护之手")


local slider_Protection = CreateFrame("Slider", ADDON_NAME.."Slider_Protection", checkButton_Protection, "OptionsSliderTemplate")
slider_Protection:SetPoint("RIGHT", checkButton_Protection, "RIGHT", 250, -2)
slider_Protection:SetWidth(150) -- 拖动条长度
slider_Protection:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Protection:SetMinMaxValues(0, 100)
slider_Protection:SetValueStep(1)
slider_Protection:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Protection)

local color_Protection = "|cFFFFD100"

_G[slider_Protection:GetName().."Low"]:Hide()
_G[slider_Protection:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Protection:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinHealSaved.Protection_Value = arg1
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinHealSaved.Protection_Value .."%|r")
end)

-- 设置点击事件
checkButton_Protection:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.Protection = 1
        color_Protection = "|cFFFFD100"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinHealSaved.Protection_Value .."%|r")
    else
        MPPaladinHealSaved.Protection = 0
        color_Protection = "|cFF888888"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinHealSaved.Protection_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 圣盾术
local checkButton_DivineShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinHealWindow, "UICheckButtonTemplate")
checkButton_DivineShield:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
checkButton_DivineShield:SetScale(0.8)

-- 添加文字标签
local checkText_DivineShield = checkButton_DivineShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_DivineShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_DivineShield:SetTextColor(1, 1, 1)
checkText_DivineShield:SetPoint("LEFT", checkButton_DivineShield, "LEFT", 34, 1)
checkText_DivineShield:SetText("自动 圣盾术")


local slider_DivineShield = CreateFrame("Slider", ADDON_NAME.."Slider_DivineShield", checkButton_DivineShield, "OptionsSliderTemplate")
slider_DivineShield:SetPoint("RIGHT", checkButton_DivineShield, "RIGHT", 250, -2)
slider_DivineShield:SetWidth(150) -- 拖动条长度
slider_DivineShield:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_DivineShield:SetMinMaxValues(0, 100)
slider_DivineShield:SetValueStep(1)
slider_DivineShield:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_DivineShield)

local color_DivineShield = "|cFFFFD100"

_G[slider_DivineShield:GetName().."Low"]:Hide()
_G[slider_DivineShield:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_DivineShield:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinHealSaved.DivineShield_Value = arg1
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinHealSaved.DivineShield_Value .."%|r")
end)

-- 设置点击事件
checkButton_DivineShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.DivineShield = 1
        color_DivineShield = "|cFFFFD100"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinHealSaved.DivineShield_Value .."%|r")
    else
        MPPaladinHealSaved.DivineShield = 0
        color_DivineShield = "|cFF888888"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinHealSaved.DivineShield_Value .."%|r")
    end
end)


postion_y = postion_y+100+40


-- 圣光术 血线
local slider_HolyLight_Value = CreateFrame("Slider", ADDON_NAME.."SliderHolyLight_Value", CatUISettingsPaladinHealWindow, "OptionsSliderTemplate")
slider_HolyLight_Value:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y+40)
slider_HolyLight_Value:SetWidth(220) -- 拖动条长度
slider_HolyLight_Value:SetHeight(16) -- 拖动条高度

slider_HolyLight_Value:SetMinMaxValues(10, 99)
slider_HolyLight_Value:SetValueStep(1)
slider_HolyLight_Value:SetValue(60) -- 默认值
MPCatUISliderRegionHide(slider_HolyLight_Value)

_G[slider_HolyLight_Value:GetName().."Text"]:SetText("圣光术 血线: 60%|r")
_G[slider_HolyLight_Value:GetName().."Low"]:Hide()
_G[slider_HolyLight_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_HolyLight_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_HolyLight_Value:GetName().."Text"]:SetText("圣光术 血线："..arg1.."%")
    MPPaladinHealSaved.HolyLight_Value = arg1
end)




postion_y = postion_y-40

-- 神圣震击 血线
local slider_HolyShock_Value = CreateFrame("Slider", ADDON_NAME.."SliderHolyShock_Value", CatUISettingsPaladinHealWindow, "OptionsSliderTemplate")
slider_HolyShock_Value:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y+40)
slider_HolyShock_Value:SetWidth(220) -- 拖动条长度
slider_HolyShock_Value:SetHeight(16) -- 拖动条高度

slider_HolyShock_Value:SetMinMaxValues(10, 99)
slider_HolyShock_Value:SetValueStep(1)
slider_HolyShock_Value:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_HolyShock_Value)

_G[slider_HolyShock_Value:GetName().."Text"]:SetText("神圣震击 血线: 20%|r")
_G[slider_HolyShock_Value:GetName().."Low"]:Hide()
_G[slider_HolyShock_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_HolyShock_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_HolyShock_Value:GetName().."Text"]:SetText("神圣震击 血线："..arg1.."%")
    MPPaladinHealSaved.HolyShock_Value = arg1
end)


postion_y = postion_y-40

-- 圣疗术 血线
local slider_LayHands_Value = CreateFrame("Slider", ADDON_NAME.."SliderLayHands_Value", CatUISettingsPaladinHealWindow, "OptionsSliderTemplate")
slider_LayHands_Value:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y+40)
slider_LayHands_Value:SetWidth(220) -- 拖动条长度
slider_LayHands_Value:SetHeight(16) -- 拖动条高度

slider_LayHands_Value:SetMinMaxValues(10, 99)
slider_LayHands_Value:SetValueStep(1)
slider_LayHands_Value:SetValue(10) -- 默认值
MPCatUISliderRegionHide(slider_LayHands_Value)

_G[slider_LayHands_Value:GetName().."Text"]:SetText("圣疗术 血线: 10%|r")
_G[slider_LayHands_Value:GetName().."Low"]:Hide()
_G[slider_LayHands_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_LayHands_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_LayHands_Value:GetName().."Text"]:SetText("圣疗术 血线："..arg1.."%")
    MPPaladinHealSaved.LayHands_Value = arg1
end)


postion_y = postion_y-40

-- 圣光闪现最低等级
local slider_FlashLightMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderLayFlashLightMinLevel", CatUISettingsPaladinHealWindow, "OptionsSliderTemplate")
slider_FlashLightMinLevel:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y+40)
slider_FlashLightMinLevel:SetWidth(105) -- 拖动条长度
slider_FlashLightMinLevel:SetHeight(16) -- 拖动条高度

slider_FlashLightMinLevel:SetMinMaxValues(1, 7)
slider_FlashLightMinLevel:SetValueStep(1)
slider_FlashLightMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_FlashLightMinLevel)

_G[slider_FlashLightMinLevel:GetName().."Text"]:SetText("圣光闪现最低1级")

-- 值变化时的回调函数
slider_FlashLightMinLevel:SetScript("OnValueChanged", function()
    _G[slider_FlashLightMinLevel:GetName().."Text"]:SetText("圣光闪现最低"..arg1.."级")
    MPPaladinHealSaved.FlashLightMinLevel = arg1
end)

-- 圣光闪现最高等级
local slider_FlashLightMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderLayFlashLightMaxLevel", CatUISettingsPaladinHealWindow, "OptionsSliderTemplate")
slider_FlashLightMaxLevel:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 135, postion_y+40)
slider_FlashLightMaxLevel:SetWidth(105) -- 拖动条长度
slider_FlashLightMaxLevel:SetHeight(16) -- 拖动条高度

slider_FlashLightMaxLevel:SetMinMaxValues(1, 7)
slider_FlashLightMaxLevel:SetValueStep(1)
slider_FlashLightMaxLevel:SetValue(7) -- 默认值
MPCatUISliderRegionHide(slider_FlashLightMaxLevel)

_G[slider_FlashLightMaxLevel:GetName().."Text"]:SetText("圣光闪现最高7级")

slider_FlashLightMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_FlashLightMaxLevel:GetName().."Text"]:SetText("圣光闪现最高"..arg1.."级")
    MPPaladinHealSaved.FlashLightMaxLevel = arg1
end)


postion_y = postion_y-40

-- 圣光术最低等级
local slider_HolyLightMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderLayHolyLightMinLevel", CatUISettingsPaladinHealWindow, "OptionsSliderTemplate")
slider_HolyLightMinLevel:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 20, postion_y+40)
slider_HolyLightMinLevel:SetWidth(105) -- 拖动条长度
slider_HolyLightMinLevel:SetHeight(16) -- 拖动条高度

slider_HolyLightMinLevel:SetMinMaxValues(1, 9)
slider_HolyLightMinLevel:SetValueStep(1)
slider_HolyLightMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_HolyLightMinLevel)

_G[slider_HolyLightMinLevel:GetName().."Text"]:SetText("圣光术最低1级")

slider_HolyLightMinLevel:SetScript("OnValueChanged", function()
    _G[slider_HolyLightMinLevel:GetName().."Text"]:SetText("圣光术最低"..arg1.."级")
    MPPaladinHealSaved.HolyLightMinLevel = arg1
end)

-- 圣光术最高等级
local slider_HolyLightMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderLayHolyLightMaxLevel", CatUISettingsPaladinHealWindow, "OptionsSliderTemplate")
slider_HolyLightMaxLevel:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 135, postion_y+40)
slider_HolyLightMaxLevel:SetWidth(105) -- 拖动条长度
slider_HolyLightMaxLevel:SetHeight(16) -- 拖动条高度

slider_HolyLightMaxLevel:SetMinMaxValues(1, 9)
slider_HolyLightMaxLevel:SetValueStep(1)
slider_HolyLightMaxLevel:SetValue(9) -- 默认值
MPCatUISliderRegionHide(slider_HolyLightMaxLevel)

_G[slider_HolyLightMaxLevel:GetName().."Text"]:SetText("圣光术最高9级")

slider_HolyLightMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_HolyLightMaxLevel:GetName().."Text"]:SetText("圣光术最高"..arg1.."级")
    MPPaladinHealSaved.HolyLightMaxLevel = arg1
end)




postion_y = postion_y+40



-- 动态控制
local ButtonControl = CreateFrame("Button", ADDON_NAME.."ButtonControl", CatUISettingsPaladinHealWindow, "UIPanelButtonTemplate")
ButtonControl:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 340, postion_y)
ButtonControl:SetWidth(100)
ButtonControl:SetHeight(22)
ButtonControl:SetFont("Fonts\\FRIZQT__.TTF", 12)
ButtonControl:SetText("动态控制")

ButtonControl:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
ButtonControl:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
ButtonControl:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
ButtonControl:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
ButtonControl:SetScript("OnClick", function()
    MPCatPaladinControlHealInit()
    if CatPaladinHeal:IsVisible() then
        CatPaladinHeal:Hide()
        MPPublicSaved.PaladinHealDisplay = 0
    else
        CatPaladinHeal:Show()
        MPPublicSaved.PaladinHealDisplay = 1
    end
end)

-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPaladinHealWindow, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsPaladinHealWindow, "TOPLEFT", 120, -44)
myButton:SetWidth(100)
myButton:SetHeight(22)
myButton:SetFont("Fonts\\FRIZQT__.TTF", 12)
myButton:SetText("恢复默认值")

-- 调整按钮纹理
myButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
myButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
myButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
myButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
-- 按钮点击事件
myButton:SetScript("OnClick", function()
    MPResetPaladinHealSettings()
    MPInitPaladinHealSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsPaladinHealWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPaladinHealWindow, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.Power = 1
    else
        MPPaladinHealSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPaladinHealWindow, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPaladinHealWindow, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinHealSaved.Pick = 1
    else
        MPPaladinHealSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPaladinHealWindow, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)



-- 添加提示内容区域
local TipText = CatUISettingsPaladinHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPaladinHealWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFFF58CBA/pheal|r ]")



-- 配置文件版本号
local PaladinHealSettingsUIVersion = 16

function MPResetPaladinHealSettings()

    MPPaladinHealSaved.Version = PaladinHealSettingsUIVersion

    -- 基本配置

    MPPaladinHealSaved.HolyLight = 1
    MPPaladinHealSaved.FlashLight = 1
    MPPaladinHealSaved.HolyShock = 1
    MPPaladinHealSaved.LayHands = 0
    MPPaladinHealSaved.Tip = 1
    MPPaladinHealSaved.TargetFirst = 1
    MPPaladinHealSaved.TargetTarget = 1
    MPPaladinHealSaved.SelfFirst = 0
    MPPaladinHealSaved.ScanTeam = 1
    MPPaladinHealSaved.ScanTeam_Low = 1
    MPPaladinHealSaved.ScanTeam_Rand = 0

    MPPaladinHealSaved.Begin_Value = 99.5

    -- 高级配置
    MPPaladinHealSaved.Overflow = 0

    -- 治疗石、糖水茶
    MPPaladinHealSaved.HealthStone = 1
    MPPaladinHealSaved.HealthStone_Value = 30
    MPPaladinHealSaved.HerbalTea = 1
    MPPaladinHealSaved.HerbalTea_Value = 20
    MPPaladinHealSaved.HerbalTeaMana = 0
    MPPaladinHealSaved.HerbalTeaMana_Value = 20

    MPPaladinHealSaved.Protection = 0
    MPPaladinHealSaved.Protection_Value = 10
    MPPaladinHealSaved.DivineShield = 0
    MPPaladinHealSaved.DivineShield_Value = 10

    -- SuperWoW,UnitXP
    MPPaladinHealSaved.SuperWoW = 1
    MPPaladinHealSaved.UnitXP = 1

    MPPaladinHealSaved.HolyLight_Value = 60
    MPPaladinHealSaved.FlashLight_Value = 99
    MPPaladinHealSaved.HolyShock_Value = 40
    MPPaladinHealSaved.LayHands_Value = 10

    MPPaladinHealSaved.FlashLightMinLevel = 1
    MPPaladinHealSaved.FlashLightMaxLevel = 7
    MPPaladinHealSaved.HolyLightMinLevel = 1
    MPPaladinHealSaved.HolyLightMaxLevel = 9

    -- 通用
    MPPaladinHealSaved.Power = 0
    MPPaladinHealSaved.Pick = 0

end

local function InitPaladinHealSettingsPart1()
    checkButton_HolyLight:SetChecked(ToBoolean(MPPaladinHealSaved.HolyLight))
    checkButton_FlashLight:SetChecked( ToBoolean(MPPaladinHealSaved.FlashLight) )
    checkButton_HolyShock:SetChecked( ToBoolean(MPPaladinHealSaved.HolyShock) )
    checkButton_LayHands:SetChecked(ToBoolean(MPPaladinHealSaved.LayHands))

    checkButton_TargetFirst:SetChecked(ToBoolean(MPPaladinHealSaved.TargetFirst))
    checkButton_TargetTarget:SetChecked(ToBoolean(MPPaladinHealSaved.TargetTarget))
    checkButton_SelfFirst:SetChecked(ToBoolean(MPPaladinHealSaved.SelfFirst))
    checkButton_ScanTeam:SetChecked(ToBoolean(MPPaladinHealSaved.ScanTeam))
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPPaladinHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPPaladinHealSaved.ScanTeam_Rand))
    checkButton_Tip:SetChecked(ToBoolean(MPPaladinHealSaved.Tip))

    checkButton_Overflow:SetChecked(ToBoolean(MPPaladinHealSaved.Overflow))

    checkButton_Power:SetChecked(ToBoolean(MPPaladinHealSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPPaladinHealSaved.Pick))

end

function MPInitPaladinHealSettings()
    if not MPPaladinHealSaved then
        MPPaladinHealSaved = {}
        MPResetPaladinHealSettings()
    end

    if MPPaladinHealSaved.Version ~= PaladinHealSettingsUIVersion then
        MPResetPaladinHealSettings()
    end

    InitPaladinHealSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPPaladinHealSaved.HealthStone))
    slider_HealthStone:SetValue(MPPaladinHealSaved.HealthStone_Value)
    if MPPaladinHealSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinHealSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPaladinHealSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPaladinHealSaved.HerbalTea_Value)
    if MPPaladinHealSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinHealSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPaladinHealSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPaladinHealSaved.HerbalTeaMana_Value)
    if MPPaladinHealSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinHealSaved.HerbalTeaMana_Value .."%|r")

    checkButton_Protection:SetChecked(MPPaladinHealSaved.Protection)
    slider_Protection:SetValue(MPPaladinHealSaved.Protection_Value)
    if MPPaladinHealSaved.Protection==1 then
        color_Protection = "|cFFFFD100"
    else
        color_Protection = "|cFF888888"
    end
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinHealSaved.Protection_Value .."%|r")


    checkButton_DivineShield:SetChecked(MPPaladinHealSaved.DivineShield)
    slider_DivineShield:SetValue(MPPaladinHealSaved.DivineShield_Value)
    if MPPaladinHealSaved.DivineShield==1 then
        color_DivineShield = "|cFFFFD100"
    else
        color_DivineShield = "|cFF888888"
    end
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinHealSaved.DivineShield_Value .."%|r")



    slider_HolyLight_Value:SetValue(MPPaladinHealSaved.HolyLight_Value)
    --slider_FlashLight_Value:SetValue(MPPaladinHealSaved.FlashLight_Value)
    slider_HolyShock_Value:SetValue(MPPaladinHealSaved.HolyShock_Value)
    slider_LayHands_Value:SetValue(MPPaladinHealSaved.LayHands_Value)
    slider_Begin_Value:SetValue(MPPaladinHealSaved.Begin_Value)

    slider_FlashLightMinLevel:SetValue(MPPaladinHealSaved.FlashLightMinLevel)
    slider_FlashLightMaxLevel:SetValue(MPPaladinHealSaved.FlashLightMaxLevel)
    slider_HolyLightMinLevel:SetValue(MPPaladinHealSaved.HolyLightMinLevel)
    slider_HolyLightMaxLevel:SetValue(MPPaladinHealSaved.HolyLightMaxLevel)

end

