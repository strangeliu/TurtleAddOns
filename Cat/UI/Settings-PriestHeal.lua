
-- 定义插件名称
local ADDON_NAME = "Settings-PriestHeal"



-- 创建主框架
CatUISettingsPriestHealWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 650, "|cFFFFFFFF设置 - 神牧|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPriestHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
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

-- 治疗祷言
local checkButton_PrayerHealing = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 治疗祷言")
checkButton_PrayerHealing:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.PrayerHealing = 1
    else
        MPPriestHealSaved.PrayerHealing = 0
    end
end)



-- 创建单选框 - 优先治疗目标
local checkButton_TargetFirst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_TargetFirst:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 340, postion_y)
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
        MPPriestHealSaved.TargetFirst = 1
    else
        MPPriestHealSaved.TargetFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 强效治疗术
local checkButton_GreaterHeal = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_GreaterHeal:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
checkButton_GreaterHeal:SetScale(0.8)

-- 添加文字标签
local checkText_GreaterHeal = checkButton_GreaterHeal:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_GreaterHeal:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_GreaterHeal:SetTextColor(1, 1, 1)
checkText_GreaterHeal:SetPoint("LEFT", checkButton_GreaterHeal, "LEFT", 34, 1)
checkText_GreaterHeal:SetText("开启 强效治疗术")

-- 设置点击事件
checkButton_GreaterHeal:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.GreaterHeal = 1
    else
        MPPriestHealSaved.GreaterHeal = 0
    end
end)


-- 创建单选框 - 优先治疗目标 的 目标
local checkButton_TargetTarget = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_TargetTarget:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 340, postion_y)
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
        MPPriestHealSaved.TargetTarget = 1
    else
        MPPriestHealSaved.TargetTarget = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 快速治疗
local checkButton_FlashHeal = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_FlashHeal:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
checkButton_FlashHeal:SetScale(0.8)
--checkButton_FlashHeal:Disable()

-- 添加文字标签
local checkText_FlashHeal = checkButton_FlashHeal:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FlashHeal:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FlashHeal:SetTextColor(1, 1, 1)
checkText_FlashHeal:SetPoint("LEFT", checkButton_FlashHeal, "LEFT", 34, 1)
checkText_FlashHeal:SetText("开启 快速治疗")

-- 设置点击事件
checkButton_FlashHeal:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.FlashHeal = 1
    else
        MPPriestHealSaved.FlashHeal = 0
    end
end)



-- 创建单选框 - 优先治疗自己
local checkButton_SelfFirst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_SelfFirst:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 340, postion_y)
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
        MPPriestHealSaved.SelfFirst = 1
    else
        MPPriestHealSaved.SelfFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 绝望祷言
local checkButton_DesperatePrayer = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_DesperatePrayer:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
checkButton_DesperatePrayer:SetScale(0.8)

-- 添加文字标签
local checkText_DesperatePrayer = checkButton_DesperatePrayer:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_DesperatePrayer:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_DesperatePrayer:SetTextColor(1, 1, 1)
checkText_DesperatePrayer:SetPoint("LEFT", checkButton_DesperatePrayer, "LEFT", 34, 1)
checkText_DesperatePrayer:SetText("开启 绝望祷言")

-- 设置点击事件
checkButton_DesperatePrayer:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.DesperatePrayer = 1
    else
        MPPriestHealSaved.DesperatePrayer = 0
    end
end)


-- 创建单选框 - 治疗大团
local checkButton_ScanTeam = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "治疗大团")
checkButton_ScanTeam:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.ScanTeam = 1
    else
        MPPriestHealSaved.ScanTeam = 0
    end
end)

local checkButton_ScanTeam_Low = MPCreateCheckButtonSmall(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 460, postion_y, "血量最低")
local checkButton_ScanTeam_Rand = MPCreateCheckButtonSmall(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 560, postion_y, "随机")

checkButton_ScanTeam_Low:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.ScanTeam_Low = 1
        MPPriestHealSaved.ScanTeam_Rand = 0
    else
        MPPriestHealSaved.ScanTeam_Low = 0
        MPPriestHealSaved.ScanTeam_Rand = 1
    end
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPPriestHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPPriestHealSaved.ScanTeam_Rand))
end)
checkButton_ScanTeam_Rand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.ScanTeam_Rand = 1
        MPPriestHealSaved.ScanTeam_Low = 0
    else
        MPPriestHealSaved.ScanTeam_Rand = 0
        MPPriestHealSaved.ScanTeam_Low = 1
    end
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPPriestHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPPriestHealSaved.ScanTeam_Rand))
end)



postion_y = postion_y-30


-- 创建单选框 - 移动恢复
local checkButton_MoveRenew = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_MoveRenew:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
checkButton_MoveRenew:SetScale(0.8)

-- 添加文字标签
local checkText_MoveRenew = checkButton_MoveRenew:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_MoveRenew:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_MoveRenew:SetTextColor(1, 1, 1)
checkText_MoveRenew:SetPoint("LEFT", checkButton_MoveRenew, "LEFT", 34, 1)
checkText_MoveRenew:SetText("开启 恢复 (移动时)")

-- 设置点击事件
checkButton_MoveRenew:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.MoveRenew = 1
    else
        MPPriestHealSaved.MoveRenew = 0
    end
end)


-- 创建单选框 - Tip
local checkButton_Tip = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_Tip:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 340, postion_y)
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
        MPPriestHealSaved.Tip = 1
    else
        MPPriestHealSaved.Tip = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 真言术：盾
local checkButton_Shield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_Shield:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
checkButton_Shield:SetScale(0.8)

-- 添加文字标签
local checkText_Shield = checkButton_Shield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Shield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Shield:SetTextColor(1, 1, 1)
checkText_Shield:SetPoint("LEFT", checkButton_Shield, "LEFT", 34, 1)
checkText_Shield:SetText("开启 真言术：盾")

-- 设置点击事件
checkButton_Shield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.Shield = 1
    else
        MPPriestHealSaved.Shield = 0
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
slider_Begin_Value:SetValue(99.5) -- 默认值
MPCatUISliderRegionHide(slider_Begin_Value)

_G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线：99.5%")
_G[slider_Begin_Value:GetName().."Low"]:Hide()
_G[slider_Begin_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Begin_Value:SetScript("OnValueChanged", function()
    _G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线："..arg1.."%")
    MPPriestHealSaved.Begin_Value = arg1
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
TipText1:SetText("高级配置")


postion_y = postion_y-90


-- 创建单选框 - 溢出治疗
local checkButton_Overflow = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForce", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_Overflow:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
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
        MPPriestHealSaved.Overflow = 1
    else
        MPPriestHealSaved.Overflow = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 340, postion_y)
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
    MPPriestHealSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestHealSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestHealSaved.HealthStone_Value .."%|r")
    else
        MPPriestHealSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestHealSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 340, postion_y)
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
    MPPriestHealSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved.HerbalTea_Value .."%|r")
    else
        MPPriestHealSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsPriestHealWindow, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 340, postion_y)
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
    MPPriestHealSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestHealSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestHealSaved.HerbalTeaMana_Value .."%|r")
    else
        MPPriestHealSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestHealSaved.HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 祈祷之书
local checkButton_PrayerBook = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "|cFF888888自动 祈祷之书 (未完工)|r")
checkButton_PrayerBook:Disable()
checkButton_PrayerBook:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.PrayerBook = 1
    else
        MPPriestHealSaved.PrayerBook = 0
    end
end)

postion_y = postion_y - 40

postion_y = postion_y - 40

-- 治疗祷言 本队优先
local checkButton_PrayerHealingPartyFirst = MPCreateCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "治疗祷言 本队优先")
checkButton_PrayerHealingPartyFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.PrayerHealingPartyFirst = 1
    else
        MPPriestHealSaved.PrayerHealingPartyFirst = 0
    end
end)

-- 治疗祷言 权重
local slider_PrayerHealing_Value = CreateFrame("Slider", ADDON_NAME.."SliderPrayerHealing_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_PrayerHealing_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 270, postion_y+70)
slider_PrayerHealing_Value:SetWidth(220) -- 拖动条长度
slider_PrayerHealing_Value:SetHeight(16) -- 拖动条高度

slider_PrayerHealing_Value:SetMinMaxValues(2, 14)
slider_PrayerHealing_Value:SetValueStep(1)
slider_PrayerHealing_Value:SetValue(7) -- 默认值
MPCatUISliderRegionHide(slider_PrayerHealing_Value)

--_G[slider_PrayerHealing_Value:GetName().."Text"]:SetText("强效治疗术​ 血线：50%")
_G[slider_PrayerHealing_Value:GetName().."Low"]:Hide()
_G[slider_PrayerHealing_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_PrayerHealing_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_PrayerHealing_Value:GetName().."Text"]:SetText("治疗祷言 权重："..arg1)
    MPPriestHealSaved.PrayerHealing_Value = arg1
end)



postion_y = postion_y+60+40+40+40+40


-- 强效治疗 血线
local slider_GreaterHeal_Value = CreateFrame("Slider", ADDON_NAME.."SliderGreaterHeal_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_GreaterHeal_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_GreaterHeal_Value:SetWidth(220) -- 拖动条长度
slider_GreaterHeal_Value:SetHeight(16) -- 拖动条高度

slider_GreaterHeal_Value:SetMinMaxValues(10, 99)
slider_GreaterHeal_Value:SetValueStep(1)
slider_GreaterHeal_Value:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_GreaterHeal_Value)

--_G[slider_GreaterHeal_Value:GetName().."Text"]:SetText("强效治疗术​ 血线：50%")
_G[slider_GreaterHeal_Value:GetName().."Low"]:Hide()
_G[slider_GreaterHeal_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_GreaterHeal_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_GreaterHeal_Value:GetName().."Text"]:SetText("强效治疗术​ 血线："..arg1.."%")
    MPPriestHealSaved.GreaterHeal_Value = arg1
end)



postion_y = postion_y-40

-- 绝望祷言​ 血线
local slider_Desperate_Value = CreateFrame("Slider", ADDON_NAME.."SliderDesperate_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_Desperate_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_Desperate_Value:SetWidth(220) -- 拖动条长度
slider_Desperate_Value:SetHeight(16) -- 拖动条高度

slider_Desperate_Value:SetMinMaxValues(10, 99)
slider_Desperate_Value:SetValueStep(1)
slider_Desperate_Value:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Desperate_Value)

_G[slider_Desperate_Value:GetName().."Text"]:SetText("绝望祷言​ 血线：20%")
_G[slider_Desperate_Value:GetName().."Low"]:Hide()
_G[slider_Desperate_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Desperate_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_Desperate_Value:GetName().."Text"]:SetText("绝望祷言​ 血线："..arg1.."%")
    MPPriestHealSaved.Desperate_Value = arg1
end)


postion_y = postion_y-40

-- 真言术：盾​ 血线
local slider_Shield_Value = CreateFrame("Slider", ADDON_NAME.."SliderShield_Value", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_Shield_Value:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_Shield_Value:SetWidth(220) -- 拖动条长度
slider_Shield_Value:SetHeight(16) -- 拖动条高度

slider_Shield_Value:SetMinMaxValues(10, 99)
slider_Shield_Value:SetValueStep(1)
slider_Shield_Value:SetValue(30) -- 默认值
MPCatUISliderRegionHide(slider_Shield_Value)

_G[slider_Shield_Value:GetName().."Text"]:SetText("真言术：盾 血线：30%")
_G[slider_Shield_Value:GetName().."Low"]:Hide()
_G[slider_Shield_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Shield_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_Shield_Value:GetName().."Text"]:SetText("真言术：盾​ 血线："..arg1.."%")
    MPPriestHealSaved.Shield_Value = arg1
end)


postion_y = postion_y-40

-- 恢复最低等级
local slider_RenewMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderRenewMinLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_RenewMinLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_RenewMinLevel:SetWidth(105) -- 拖动条长度
slider_RenewMinLevel:SetHeight(16) -- 拖动条高度

slider_RenewMinLevel:SetMinMaxValues(1, 10)
slider_RenewMinLevel:SetValueStep(1)
slider_RenewMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_RenewMinLevel)

_G[slider_RenewMinLevel:GetName().."Text"]:SetText("恢复最低1级")

slider_RenewMinLevel:SetScript("OnValueChanged", function()
    _G[slider_RenewMinLevel:GetName().."Text"]:SetText("恢复最低"..arg1.."级")
    MPPriestHealSaved.RenewMinLevel = arg1
end)

-- 恢复最高等级
local slider_RenewMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderRenewMaxLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_RenewMaxLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 135, postion_y)
slider_RenewMaxLevel:SetWidth(105) -- 拖动条长度
slider_RenewMaxLevel:SetHeight(16) -- 拖动条高度

slider_RenewMaxLevel:SetMinMaxValues(1, 10)
slider_RenewMaxLevel:SetValueStep(1)
slider_RenewMaxLevel:SetValue(10) -- 默认值
MPCatUISliderRegionHide(slider_RenewMaxLevel)

_G[slider_RenewMaxLevel:GetName().."Text"]:SetText("恢复最高10级")

slider_RenewMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_RenewMaxLevel:GetName().."Text"]:SetText("恢复最高"..arg1.."级")
    MPPriestHealSaved.RenewMaxLevel = arg1
end)


postion_y = postion_y-40

-- 快速治疗​最低等级
local slider_FlashHealMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderFlashHealMinLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_FlashHealMinLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_FlashHealMinLevel:SetWidth(105) -- 拖动条长度
slider_FlashHealMinLevel:SetHeight(16) -- 拖动条高度

slider_FlashHealMinLevel:SetMinMaxValues(1, 7)
slider_FlashHealMinLevel:SetValueStep(1)
slider_FlashHealMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_FlashHealMinLevel)

_G[slider_FlashHealMinLevel:GetName().."Text"]:SetText("快速治疗​最低1级")

slider_FlashHealMinLevel:SetScript("OnValueChanged", function()
    _G[slider_FlashHealMinLevel:GetName().."Text"]:SetText("快速治疗最低"..arg1.."级")
    MPPriestHealSaved.FlashHealMinLevel = arg1
end)

-- 快速治疗​最高等级
local slider_FlashHealMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderFlashHealMaxLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_FlashHealMaxLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 135, postion_y)
slider_FlashHealMaxLevel:SetWidth(105) -- 拖动条长度
slider_FlashHealMaxLevel:SetHeight(16) -- 拖动条高度

slider_FlashHealMaxLevel:SetMinMaxValues(1, 7)
slider_FlashHealMaxLevel:SetValueStep(1)
slider_FlashHealMaxLevel:SetValue(7) -- 默认值
MPCatUISliderRegionHide(slider_FlashHealMaxLevel)

_G[slider_FlashHealMaxLevel:GetName().."Text"]:SetText("快速治疗​最高7级")

slider_FlashHealMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_FlashHealMaxLevel:GetName().."Text"]:SetText("快速治疗最高"..arg1.."级")
    MPPriestHealSaved.FlashHealMaxLevel = arg1
end)


postion_y = postion_y-40

-- 强效治疗​最低等级
local slider_GreaterHealMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderGreaterHealMinLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_GreaterHealMinLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 20, postion_y)
slider_GreaterHealMinLevel:SetWidth(105) -- 拖动条长度
slider_GreaterHealMinLevel:SetHeight(16) -- 拖动条高度

slider_GreaterHealMinLevel:SetMinMaxValues(1, 5)
slider_GreaterHealMinLevel:SetValueStep(1)
slider_GreaterHealMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_GreaterHealMinLevel)

_G[slider_GreaterHealMinLevel:GetName().."Text"]:SetText("强效治疗​最低1级")

slider_GreaterHealMinLevel:SetScript("OnValueChanged", function()
    _G[slider_GreaterHealMinLevel:GetName().."Text"]:SetText("强效治疗最低"..arg1.."级")
    MPPriestHealSaved.GreaterHealMinLevel = arg1
end)

-- 强效治疗​最高等级
local slider_GreaterHealMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderGreaterHealMaxLevel", CatUISettingsPriestHealWindow, "OptionsSliderTemplate")
slider_GreaterHealMaxLevel:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 135, postion_y)
slider_GreaterHealMaxLevel:SetWidth(105) -- 拖动条长度
slider_GreaterHealMaxLevel:SetHeight(16) -- 拖动条高度

slider_GreaterHealMaxLevel:SetMinMaxValues(1, 5)
slider_GreaterHealMaxLevel:SetValueStep(1)
slider_GreaterHealMaxLevel:SetValue(5) -- 默认值
MPCatUISliderRegionHide(slider_GreaterHealMaxLevel)

_G[slider_GreaterHealMaxLevel:GetName().."Text"]:SetText("强效治疗​最高5级")

slider_GreaterHealMaxLevel:SetScript("OnValueChanged", function()
    _G[slider_GreaterHealMaxLevel:GetName().."Text"]:SetText("强效治疗最高"..arg1.."级")
    MPPriestHealSaved.GreaterHealMaxLevel = arg1
end)






-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPriestHealWindow, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsPriestHealWindow, "TOPLEFT", 120, -44)
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
    MPResetPriestHealSettings()
    MPInitPriestHealSettings()
end)




-- 添加分隔线
MPBottomLine(CatUISettingsPriestHealWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.Power = 1
    else
        MPPriestHealSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestHealSaved.Pick = 1
    else
        MPPriestHealSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPriestHealWindow, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
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
TipText:SetText("宏命令 -  [ |cFFFFFFFF/mheal|r ]")



-- 配置文件版本号
local PriestHealSettingsUIVersion = 16

function MPResetPriestHealSettings()

    MPPriestHealSaved.Version = PriestHealSettingsUIVersion

    -- 基本配置

    MPPriestHealSaved.GreaterHeal = 0
    MPPriestHealSaved.PrayerHealing = 1
    MPPriestHealSaved.MoveRenew = 1
    MPPriestHealSaved.FlashHeal = 1
    MPPriestHealSaved.DesperatePrayer = 0
    MPPriestHealSaved.Shield = 0
    MPPriestHealSaved.Tip = 1
    MPPriestHealSaved.TargetFirst = 1
    MPPriestHealSaved.TargetTarget = 1
    MPPriestHealSaved.SelfFirst = 0
    MPPriestHealSaved.ScanTeam = 1
    MPPriestHealSaved.ScanTeam_Low = 1
    MPPriestHealSaved.ScanTeam_Rand = 0

    MPPriestHealSaved.Begin_Value = 99.5

    -- 高级配置

    -- 治疗石、糖水茶
    MPPriestHealSaved.HealthStone = 1
    MPPriestHealSaved.HealthStone_Value = 30
    MPPriestHealSaved.HerbalTea = 1
    MPPriestHealSaved.HerbalTea_Value = 20
    MPPriestHealSaved.HerbalTeaMana = 0
    MPPriestHealSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPPriestHealSaved.SuperWoW = 1
    MPPriestHealSaved.UnitXP = 1

    MPPriestHealSaved.Overflow = 0
    MPPriestHealSaved.PrayerBook = 0

    MPPriestHealSaved.Desperate_Value = 20
    MPPriestHealSaved.GreaterHeal_Value = 50
    MPPriestHealSaved.Shield_Value = 30
    MPPriestHealSaved.PrayerHealingPartyFirst = 1
    MPPriestHealSaved.PrayerHealing_Value = 5

    MPPriestHealSaved.RenewMinLevel = 1
    MPPriestHealSaved.RenewMaxLevel = 10
    MPPriestHealSaved.FlashHealMinLevel = 1
    MPPriestHealSaved.FlashHealMaxLevel = 7
    MPPriestHealSaved.GreaterHealMinLevel = 1
    MPPriestHealSaved.GreaterHealMaxLevel = 5

    -- 通用
    MPPriestHealSaved.Power = 0
    MPPriestHealSaved.Pick = 0

end


function MPInitPriestHealSettingsPart1()
    checkButton_GreaterHeal:SetChecked(ToBoolean(MPPriestHealSaved.GreaterHeal))
    checkButton_PrayerHealing:SetChecked(ToBoolean(MPPriestHealSaved.PrayerHealing))
    checkButton_MoveRenew:SetChecked( ToBoolean(MPPriestHealSaved.MoveRenew) )
    checkButton_FlashHeal:SetChecked( ToBoolean(MPPriestHealSaved.FlashHeal) )
    checkButton_DesperatePrayer:SetChecked(ToBoolean(MPPriestHealSaved.DesperatePrayer))
    checkButton_Shield:SetChecked(ToBoolean(MPPriestHealSaved.Shield))

    checkButton_TargetFirst:SetChecked(ToBoolean(MPPriestHealSaved.TargetFirst))
    checkButton_TargetTarget:SetChecked(ToBoolean(MPPriestHealSaved.TargetTarget))
    checkButton_SelfFirst:SetChecked(ToBoolean(MPPriestHealSaved.SelfFirst))
    checkButton_ScanTeam:SetChecked(ToBoolean(MPPriestHealSaved.ScanTeam))
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPPriestHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPPriestHealSaved.ScanTeam_Rand))
    checkButton_Tip:SetChecked(ToBoolean(MPPriestHealSaved.Tip))

    checkButton_Overflow:SetChecked(ToBoolean(MPPriestHealSaved.Overflow))
    checkButton_PrayerBook:SetChecked(ToBoolean(MPPriestHealSaved.PrayerBook))
    checkButton_PrayerHealingPartyFirst:SetChecked(ToBoolean(MPPriestHealSaved.PrayerHealingPartyFirst))

    checkButton_Power:SetChecked(ToBoolean(MPPriestHealSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPPriestHealSaved.Pick))
end


function MPInitPriestHealSettings()
    if not MPPriestHealSaved then
        MPPriestHealSaved = {}
        MPResetPriestHealSettings()
    end

    if MPPriestHealSaved.Version ~= PriestHealSettingsUIVersion then
        MPResetPriestHealSettings()
    end

    MPInitPriestHealSettingsPart1()


    checkButton_HealthStone:SetChecked(ToBoolean(MPPriestHealSaved.HealthStone))
    slider_HealthStone:SetValue(MPPriestHealSaved.HealthStone_Value)
    if MPPriestHealSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestHealSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestHealSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPriestHealSaved.HerbalTea_Value)
    if MPPriestHealSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestHealSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPriestHealSaved.HerbalTea_Value)
    if MPPriestHealSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestHealSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPriestHealSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPriestHealSaved.HerbalTeaMana_Value)
    if MPPriestHealSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestHealSaved.HerbalTeaMana_Value .."%|r")

    slider_GreaterHeal_Value:SetValue(MPPriestHealSaved.GreaterHeal_Value)
    slider_Desperate_Value:SetValue(MPPriestHealSaved.Desperate_Value)

    slider_Begin_Value:SetValue(MPPriestHealSaved.Begin_Value)
    slider_Shield_Value:SetValue(MPPriestHealSaved.Shield_Value)

    slider_RenewMinLevel:SetValue(MPPriestHealSaved.RenewMinLevel)
    slider_RenewMaxLevel:SetValue(MPPriestHealSaved.RenewMaxLevel)
    slider_FlashHealMinLevel:SetValue(MPPriestHealSaved.FlashHealMinLevel)
    slider_FlashHealMaxLevel:SetValue(MPPriestHealSaved.FlashHealMaxLevel)
    slider_GreaterHealMinLevel:SetValue(MPPriestHealSaved.GreaterHealMinLevel)
    slider_GreaterHealMaxLevel:SetValue(MPPriestHealSaved.GreaterHealMaxLevel)

    slider_PrayerHealing_Value:SetValue(MPPriestHealSaved.PrayerHealing_Value)

end

