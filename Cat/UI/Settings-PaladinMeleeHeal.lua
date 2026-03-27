
-- 定义插件名称
local ADDON_NAME = "Settings-PaladinMeleeHeal"



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
TipText:SetText("基本配置")






local postion_y = postion_y-40

-- 创建单选框 - 圣光术
local checkButton_HolyLight = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_HolyLight:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
checkButton_HolyLight:SetScale(0.8)

-- 添加文字标签
local checkText_HolyLight = checkButton_HolyLight:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HolyLight:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HolyLight:SetTextColor(1, 1, 1)
checkText_HolyLight:SetPoint("LEFT", checkButton_HolyLight, "LEFT", 34, 1)
checkText_HolyLight:SetText("开启 圣光术 (神圣制裁)")

-- 设置点击事件
checkButton_HolyLight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.HolyLight = 1
    else
        MPPaladinMeleeHealSaved.HolyLight = 0
    end
end)


-- 创建单选框 - 优先治疗目标
local checkButton_TargetFirst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_TargetFirst:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
        MPPaladinMeleeHealSaved.TargetFirst = 1
    else
        MPPaladinMeleeHealSaved.TargetFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 圣光闪现
local checkButton_FlashLight = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_FlashLight:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
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
        MPPaladinMeleeHealSaved.FlashLight = 1
    else
        MPPaladinMeleeHealSaved.FlashLight = 0
    end
end)

-- 创建单选框 - 优先治疗目标 的 目标
local checkButton_TargetTarget = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_TargetTarget:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
        MPPaladinMeleeHealSaved.TargetTarget = 1
    else
        MPPaladinMeleeHealSaved.TargetTarget = 0
    end
end)





postion_y = postion_y-30

-- 创建单选框 - 神圣震击
local checkButton_HolyShock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_HolyShock:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
checkButton_HolyShock:SetScale(0.8)

-- 添加文字标签
local checkText_HolyShock = checkButton_HolyShock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HolyShock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HolyShock:SetTextColor(1, 1, 1)
checkText_HolyShock:SetPoint("LEFT", checkButton_HolyShock, "LEFT", 34, 1)
checkText_HolyShock:SetText("开启 神圣震击")

-- 设置点击事件
checkButton_HolyShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.HolyShock = 1
    else
        MPPaladinMeleeHealSaved.HolyShock = 0
    end
end)


-- 创建单选框 - 优先治疗自己
local checkButton_SelfFirst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_SelfFirst:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
        MPPaladinMeleeHealSaved.SelfFirst = 1
    else
        MPPaladinMeleeHealSaved.SelfFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 圣疗
local checkButton_LayHands = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_LayHands:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
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
        MPPaladinMeleeHealSaved.LayHands = 1
    else
        MPPaladinMeleeHealSaved.LayHands = 0
    end
end)


-- 创建单选框 - 治疗大团
local checkButton_ScanTeam = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_ScanTeam:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
checkButton_ScanTeam:SetScale(0.8)

-- 添加文字标签
local checkText_ScanTeam = checkButton_ScanTeam:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ScanTeam:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ScanTeam:SetTextColor(1, 1, 1)
checkText_ScanTeam:SetPoint("LEFT", checkButton_ScanTeam, "LEFT", 34, 1)
checkText_ScanTeam:SetText("扫描治疗大团 (血量最低)")

-- 设置点击事件
checkButton_ScanTeam:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.ScanTeam = 1
    else
        MPPaladinMeleeHealSaved.ScanTeam = 0
    end
end)


postion_y = postion_y - 30

--[[
-- 创建单选框 - 保持 智慧审判
local checkButton_Justice = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_Justice:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
checkButton_Justice:SetScale(0.8)

-- 添加文字标签
local checkText_Justice = checkButton_Justice:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Justice:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Justice:SetTextColor(1, 1, 1)
checkText_Justice:SetPoint("LEFT", checkButton_Justice, "LEFT", 34, 1)
checkText_Justice:SetText("保持 智慧审判")

-- 设置点击事件
checkButton_Justice:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.Justice = 1
    else
        MPPaladinMeleeHealSaved.Justice = 0
    end
end)
]]
-- 创建单选框 - 启用 十字军打击 (重置神圣震击)
local checkButton_CrusaderStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_CrusaderStrike:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
checkButton_CrusaderStrike:SetScale(0.8)

-- 添加文字标签
local checkText_CrusaderStrike = checkButton_CrusaderStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CrusaderStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CrusaderStrike:SetTextColor(1, 1, 1)
checkText_CrusaderStrike:SetPoint("LEFT", checkButton_CrusaderStrike, "LEFT", 34, 1)
checkText_CrusaderStrike:SetText("启用 十字军打击")

-- 设置点击事件
checkButton_CrusaderStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.CrusaderStrike = 1
    else
        MPPaladinMeleeHealSaved.CrusaderStrike = 0
    end
end)


-- 创建单选框 - Tip
local checkButton_Tip = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_Tip:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
        MPPaladinMeleeHealSaved.Tip = 1
    else
        MPPaladinMeleeHealSaved.Tip = 0
    end
end)


postion_y = postion_y - 30

-- 创建单选框 - 启用 神圣打击 (治疗群体)
local checkButton_HolyStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_HolyStrike:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
checkButton_HolyStrike:SetScale(0.8)

-- 添加文字标签
local checkText_HolyStrike = checkButton_HolyStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HolyStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HolyStrike:SetTextColor(1, 1, 1)
checkText_HolyStrike:SetPoint("LEFT", checkButton_HolyStrike, "LEFT", 34, 1)
checkText_HolyStrike:SetText("启用 神圣打击")

-- 设置点击事件
checkButton_HolyStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.HolyStrike = 1
    else
        MPPaladinMeleeHealSaved.HolyStrike = 0
    end
end)




--起始治疗
local slider_Begin_Value = CreateFrame("Slider", ADDON_NAME.."SliderBegin_Value", CatUISettingsPaladinMeleeHeal, "OptionsSliderTemplate")
slider_Begin_Value:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 270, postion_y+20)
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
    MPPaladinMeleeHealSaved.Begin_Value = arg1
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
TipText1:SetText("高级配置")


postion_y = postion_y-90


-- 创建单选框 - 暴力治疗
local checkButton_Force = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForce", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_Force:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
checkButton_Force:SetScale(0.8)

-- 添加文字标签
local checkText_Force = checkButton_Force:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Force:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Force:SetTextColor(1, 1, 1)
checkText_Force:SetPoint("LEFT", checkButton_Force, "LEFT", 34, 1)
checkText_Force:SetText("启用 暴力治疗 (强制最高等级)")

-- 设置点击事件
checkButton_Force:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.Force = 1
    else
        MPPaladinMeleeHealSaved.Force = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
    MPPaladinMeleeHealSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinMeleeHealSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinMeleeHealSaved.HealthStone_Value .."%|r")
    else
        MPPaladinMeleeHealSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinMeleeHealSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 溢出治疗
local checkButton_Overflow = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForce", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_Overflow:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y)
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
        MPPaladinMeleeHealSaved.Overflow = 1
    else
        MPPaladinMeleeHealSaved.Overflow = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
    MPPaladinMeleeHealSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinMeleeHealSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinMeleeHealSaved.HerbalTea_Value .."%|r")
    else
        MPPaladinMeleeHealSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinMeleeHealSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40



-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
    MPPaladinMeleeHealSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinMeleeHealSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinMeleeHealSaved.HerbalTeaMana_Value .."%|r")
    else
        MPPaladinMeleeHealSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinMeleeHealSaved.HerbalTeaMana_Value .."%|r")
    end
end)




postion_y = postion_y - 40

-- 创建单选框 - 保护之手
local checkButton_Protection = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_Protection:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
    MPPaladinMeleeHealSaved.Protection_Value = arg1
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinMeleeHealSaved.Protection_Value .."%|r")
end)

-- 设置点击事件
checkButton_Protection:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.Protection = 1
        color_Protection = "|cFFFFD100"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinMeleeHealSaved.Protection_Value .."%|r")
    else
        MPPaladinMeleeHealSaved.Protection = 0
        color_Protection = "|cFF888888"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinMeleeHealSaved.Protection_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 圣盾术
local checkButton_DivineShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinMeleeHeal, "UICheckButtonTemplate")
checkButton_DivineShield:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 340, postion_y)
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
    MPPaladinMeleeHealSaved.DivineShield_Value = arg1
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinMeleeHealSaved.DivineShield_Value .."%|r")
end)

-- 设置点击事件
checkButton_DivineShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.DivineShield = 1
        color_DivineShield = "|cFFFFD100"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinMeleeHealSaved.DivineShield_Value .."%|r")
    else
        MPPaladinMeleeHealSaved.DivineShield = 0
        color_DivineShield = "|cFF888888"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinMeleeHealSaved.DivineShield_Value .."%|r")
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
slider_HolyLight_Value:SetValue(60) -- 默认值
MPCatUISliderRegionHide(slider_HolyLight_Value)

_G[slider_HolyLight_Value:GetName().."Text"]:SetText("圣光术 血线: 60%|r")
_G[slider_HolyLight_Value:GetName().."Low"]:Hide()
_G[slider_HolyLight_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_HolyLight_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_HolyLight_Value:GetName().."Text"]:SetText("圣光术 血线："..arg1.."%")
    MPPaladinMeleeHealSaved.HolyLight_Value = arg1
end)




postion_y = postion_y-40

-- 神圣震击 血线
local slider_HolyShock_Value = CreateFrame("Slider", ADDON_NAME.."SliderHolyShock_Value", CatUISettingsPaladinMeleeHeal, "OptionsSliderTemplate")
slider_HolyShock_Value:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y+40)
slider_HolyShock_Value:SetWidth(220) -- 拖动条长度
slider_HolyShock_Value:SetHeight(16) -- 拖动条高度

slider_HolyShock_Value:SetMinMaxValues(10, 100)
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
    MPPaladinMeleeHealSaved.HolyShock_Value = arg1
end)


postion_y = postion_y-40

-- 圣疗术 血线
local slider_LayHands_Value = CreateFrame("Slider", ADDON_NAME.."SliderLayHands_Value", CatUISettingsPaladinMeleeHeal, "OptionsSliderTemplate")
slider_LayHands_Value:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 20, postion_y+40)
slider_LayHands_Value:SetWidth(220) -- 拖动条长度
slider_LayHands_Value:SetHeight(16) -- 拖动条高度

slider_LayHands_Value:SetMinMaxValues(10, 100)
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
    MPPaladinMeleeHealSaved.LayHands_Value = arg1
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
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPaladinMeleeHeal, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsPaladinMeleeHeal, "TOPLEFT", 120, -44)
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
    MPResetPaladinMeleeHealSettings()
    MPInitPaladinMeleeHealSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsPaladinMeleeHeal)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.Power = 1
    else
        MPPaladinMeleeHealSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinMeleeHealSaved.Pick = 1
    else
        MPPaladinMeleeHealSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPaladinMeleeHeal, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
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
TipText:SetText("宏命令 -  [ |cFFF58CBA/mpheal|r ]")



-- 配置文件版本号
local PaladinMeleeHealSettingsUIVersion = 2

function MPResetPaladinMeleeHealSettings()

    MPPaladinMeleeHealSaved.Version = PaladinMeleeHealSettingsUIVersion

    -- 基本配置

    MPPaladinMeleeHealSaved.HolyLight = 1
    MPPaladinMeleeHealSaved.FlashLight = 0
    MPPaladinMeleeHealSaved.HolyShock = 1
    MPPaladinMeleeHealSaved.LayHands = 0
    MPPaladinMeleeHealSaved.Justice = 1
    MPPaladinMeleeHealSaved.CrusaderStrike = 1
    MPPaladinMeleeHealSaved.HolyStrike = 1

    MPPaladinMeleeHealSaved.Tip = 1
    MPPaladinMeleeHealSaved.TargetFirst = 1
    MPPaladinMeleeHealSaved.TargetTarget = 1
    MPPaladinMeleeHealSaved.SelfFirst = 0
    MPPaladinMeleeHealSaved.ScanTeam = 1

    MPPaladinMeleeHealSaved.Begin_Value = 99.5

    -- 高级配置
    MPPaladinMeleeHealSaved.Force = 0
    MPPaladinMeleeHealSaved.Overflow = 0

    -- 治疗石、糖水茶
    MPPaladinMeleeHealSaved.HealthStone = 1
    MPPaladinMeleeHealSaved.HealthStone_Value = 30
    MPPaladinMeleeHealSaved.HerbalTea = 1
    MPPaladinMeleeHealSaved.HerbalTea_Value = 20
    MPPaladinMeleeHealSaved.HerbalTeaMana = 0
    MPPaladinMeleeHealSaved.HerbalTeaMana_Value = 20

    MPPaladinMeleeHealSaved.Protection = 0
    MPPaladinMeleeHealSaved.Protection_Value = 10
    MPPaladinMeleeHealSaved.DivineShield = 0
    MPPaladinMeleeHealSaved.DivineShield_Value = 10

    -- SuperWoW,UnitXP
    MPPaladinMeleeHealSaved.SuperWoW = 1
    MPPaladinMeleeHealSaved.UnitXP = 1

    MPPaladinMeleeHealSaved.HolyLight_Value = 99
    MPPaladinMeleeHealSaved.FlashLight_Value = 99
    MPPaladinMeleeHealSaved.HolyShock_Value = 99
    MPPaladinMeleeHealSaved.LayHands_Value = 10

    -- 通用
    MPPaladinMeleeHealSaved.Power = 0
    MPPaladinMeleeHealSaved.Pick = 0

end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function InitPaladinMeleeHealSettingsPart1()
    checkButton_HolyLight:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.HolyLight))
    checkButton_FlashLight:SetChecked( ToBoolean(MPPaladinMeleeHealSaved.FlashLight) )
    checkButton_HolyShock:SetChecked( ToBoolean(MPPaladinMeleeHealSaved.HolyShock) )
    checkButton_LayHands:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.LayHands))
    checkButton_CrusaderStrike:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.CrusaderStrike))
    checkButton_HolyStrike:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.HolyStrike))

    checkButton_TargetFirst:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.TargetFirst))
    checkButton_TargetTarget:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.TargetTarget))
    checkButton_SelfFirst:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.SelfFirst))
    checkButton_ScanTeam:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.ScanTeam))
    checkButton_Tip:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.Tip))

    checkButton_Force:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.Force))
    checkButton_Overflow:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.Overflow))

    checkButton_Power:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.Pick))
end

function MPInitPaladinMeleeHealSettings()
    if not MPPaladinMeleeHealSaved then
        MPPaladinMeleeHealSaved = {}
        MPResetPaladinMeleeHealSettings()
    end

    if MPPaladinMeleeHealSaved.Version ~= PaladinMeleeHealSettingsUIVersion then
        MPResetPaladinMeleeHealSettings()
    end

    InitPaladinMeleeHealSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPPaladinMeleeHealSaved.HealthStone))
    slider_HealthStone:SetValue(MPPaladinMeleeHealSaved.HealthStone_Value)
    if MPPaladinMeleeHealSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinMeleeHealSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPaladinMeleeHealSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPaladinMeleeHealSaved.HerbalTea_Value)
    if MPPaladinMeleeHealSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinMeleeHealSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPaladinMeleeHealSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPaladinMeleeHealSaved.HerbalTeaMana_Value)
    if MPPaladinMeleeHealSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinMeleeHealSaved.HerbalTeaMana_Value .."%|r")

    checkButton_Protection:SetChecked(MPPaladinMeleeHealSaved.Protection)
    slider_Protection:SetValue(MPPaladinMeleeHealSaved.Protection_Value)
    if MPPaladinMeleeHealSaved.Protection==1 then
        color_Protection = "|cFFFFD100"
    else
        color_Protection = "|cFF888888"
    end
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinMeleeHealSaved.Protection_Value .."%|r")


    checkButton_DivineShield:SetChecked(MPPaladinMeleeHealSaved.DivineShield)
    slider_DivineShield:SetValue(MPPaladinMeleeHealSaved.DivineShield_Value)
    if MPPaladinMeleeHealSaved.DivineShield==1 then
        color_DivineShield = "|cFFFFD100"
    else
        color_DivineShield = "|cFF888888"
    end
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinMeleeHealSaved.DivineShield_Value .."%|r")



    slider_HolyLight_Value:SetValue(MPPaladinMeleeHealSaved.HolyLight_Value)
    --slider_FlashLight_Value:SetValue(MPPaladinMeleeHealSaved.FlashLight_Value)
    slider_HolyShock_Value:SetValue(MPPaladinMeleeHealSaved.HolyShock_Value)
    slider_LayHands_Value:SetValue(MPPaladinMeleeHealSaved.LayHands_Value)
    slider_Begin_Value:SetValue(MPPaladinMeleeHealSaved.Begin_Value)

end

