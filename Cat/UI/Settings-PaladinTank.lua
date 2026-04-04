
-- 定义插件名称
local ADDON_NAME = "Settings-PaladinTank"


-- 创建主框架
CatUISettingsPaladinTank = MPCreateFrame(ADDON_NAME.."Frame", 520, 550, "|cFFF58CBA设置 - 防骑|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPaladinTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 正义之怒
local checkButton_RighteousFury = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_RighteousFury:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
checkButton_RighteousFury:SetScale(0.8)

-- 添加文字标签
local checkText_RighteousFury = checkButton_RighteousFury:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_RighteousFury:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_RighteousFury:SetTextColor(1, 1, 1)
checkText_RighteousFury:SetPoint("LEFT", checkButton_RighteousFury, "LEFT", 34, 1)
checkText_RighteousFury:SetText("保持 正义之怒")

-- 设置点击事件
checkButton_RighteousFury:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.RighteousFury = 1
    else
        MPPaladinTankSaved.RighteousFury = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
checkButton_Trinket_Upper:SetScale(0.8)

-- 添加文字标签
local checkText_Trinket_Upper = checkButton_Trinket_Upper:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Trinket_Upper:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Trinket_Upper:SetTextColor(1, 1, 1)
checkText_Trinket_Upper:SetPoint("LEFT", checkButton_Trinket_Upper, "LEFT", 34, 1)
checkText_Trinket_Upper:SetText("自动开启饰品(上)")

-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Trinket_Upper = 1
    else
        MPPaladinTankSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.TUBoss = 1
    else
        MPPaladinTankSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奉献
local checkButton_Consecration = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_Consecration:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
checkButton_Consecration:SetScale(0.8)

-- 添加文字标签
local checkText_Consecration = checkButton_Consecration:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Consecration:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Consecration:SetTextColor(1, 1, 1)
checkText_Consecration:SetPoint("LEFT", checkButton_Consecration, "LEFT", 34, 1)
checkText_Consecration:SetText("开启 奉献")

-- 设置点击事件
checkButton_Consecration:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Consecration=1
        MPPaladinTankSaved.Consecration = 1
    else
        MPPaladinCJSaved.Consecration=0
        MPPaladinTankSaved.Consecration = 0
    end
    MPCatPaladinSealInit()
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
checkButton_Trinket_Below:SetScale(0.8)

-- 添加文字标签
local checkText_Trinket_Below = checkButton_Trinket_Below:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Trinket_Below:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Trinket_Below:SetTextColor(1, 1, 1)
checkText_Trinket_Below:SetPoint("LEFT", checkButton_Trinket_Below, "LEFT", 34, 1)
checkText_Trinket_Below:SetText("自动开启饰品(下)")

-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Trinket_Below = 1
    else
        MPPaladinTankSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.TBBoss = 1
    else
        MPPaladinTankSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 神圣之盾
local checkButton_HolyShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_HolyShield:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
checkButton_HolyShield:SetScale(0.8)

-- 添加文字标签
local checkTextHolyShield = checkButton_HolyShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkTextHolyShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkTextHolyShield:SetTextColor(1, 1, 1)
checkTextHolyShield:SetPoint("LEFT", checkButton_HolyShield, "LEFT", 34, 1)
checkTextHolyShield:SetText("开启 神圣之盾")

-- 设置点击事件
checkButton_HolyShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.HolyShield = 1
    else
        MPPaladinTankSaved.HolyShield = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
checkButton_Target:SetScale(0.8)

-- 添加文字标签
local checkText_Target = checkButton_Target:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Target:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Target:SetTextColor(1, 1, 1)
checkText_Target:SetPoint("LEFT", checkButton_Target, "LEFT", 34, 1)
checkText_Target:SetText("自动锁敌 (攻击最近的敌人)")

-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Target = 1
    else
        MPPaladinTankSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 十字军打击
local checkButton_CrusaderStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_CrusaderStrike:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
checkButton_CrusaderStrike:SetScale(0.8)

-- 添加文字标签
local checkText_CrusaderStrike = checkButton_CrusaderStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CrusaderStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CrusaderStrike:SetTextColor(1, 1, 1)
checkText_CrusaderStrike:SetPoint("LEFT", checkButton_CrusaderStrike, "LEFT", 34, 1)
checkText_CrusaderStrike:SetText("开启 十字军打击")

-- 设置点击事件
checkButton_CrusaderStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.CrusaderStrike = 1
    else
        MPPaladinTankSaved.CrusaderStrike = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 驱邪术
local checkButton_Exorcism = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_Exorcism:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
checkButton_Exorcism:SetScale(0.8)

-- 添加文字标签
local checkText_Exorcism = checkButton_Exorcism:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Exorcism:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Exorcism:SetTextColor(1, 1, 1)
checkText_Exorcism:SetPoint("LEFT", checkButton_Exorcism, "LEFT", 34, 1)
checkText_Exorcism:SetText("开启 驱邪术 (亡灵,恶魔)")

-- 设置点击事件
checkButton_Exorcism:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Exorcism = 1
    else
        MPPaladinTankSaved.Exorcism = 0
    end
end)


-- 高级



postion_y = postion_y-10

-- 添加提示内容区域
local TipText1 = CatUISettingsPaladinTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-85


-- 创建单选框 - 神圣之盾
local checkButton_HolyShieldTarget = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonHolyShieldTarget", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_HolyShieldTarget:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
checkButton_HolyShieldTarget:SetScale(0.8)

-- 添加文字标签
local checkText_HolyShieldTarget = checkButton_HolyShieldTarget:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HolyShieldTarget:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HolyShieldTarget:SetTextColor(1, 1, 1)
checkText_HolyShieldTarget:SetPoint("LEFT", checkButton_HolyShieldTarget, "LEFT", 34, 1)
checkText_HolyShieldTarget:SetText("目标看你时 允许 神圣之盾")

-- 设置点击事件
checkButton_HolyShieldTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.HolyShieldTarget = 1
    else
        MPPaladinTankSaved.HolyShieldTarget = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
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
    MPPaladinTankSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinTankSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinTankSaved.HealthStone_Value .."%|r")
    else
        MPPaladinTankSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinTankSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 取消拯救
local checkButton_UnSalvation = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnSalvation", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_UnSalvation:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
checkButton_UnSalvation:SetScale(0.8)

-- 添加文字标签
local checkText_UnSalvation = checkButton_UnSalvation:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_UnSalvation:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_UnSalvation:SetTextColor(1, 1, 1)
checkText_UnSalvation:SetPoint("LEFT", checkButton_UnSalvation, "LEFT", 34, 1)
checkText_UnSalvation:SetText("自动取消 拯救祝福")

-- 设置点击事件
checkButton_UnSalvation:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.UnSalvation = 1
    else
        MPPaladinTankSaved.UnSalvation = 0
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
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
    MPPaladinTankSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinTankSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinTankSaved.HerbalTea_Value .."%|r")
    else
        MPPaladinTankSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinTankSaved.HerbalTea_Value .."%|r")
    end
end)





postion_y = postion_y-40



-- 创建单选框 - 小庇护祝福
local checkButton_Sanctuary = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonSanctuary", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_Sanctuary:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
checkButton_Sanctuary:SetScale(0.8)

-- 添加文字标签
local checkText_Sanctuary = checkButton_Sanctuary:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Sanctuary:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Sanctuary:SetTextColor(1, 1, 1)
checkText_Sanctuary:SetPoint("LEFT", checkButton_Sanctuary, "LEFT", 34, 1)
checkText_Sanctuary:SetText("自动 小庇护祝福")

-- 设置点击事件
checkButton_Sanctuary:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Sanctuary = 1
    else
        MPPaladinTankSaved.Sanctuary = 0
    end
end)




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
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
    MPPaladinTankSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinTankSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinTankSaved.HerbalTeaMana_Value .."%|r")
    else
        MPPaladinTankSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinTankSaved.HerbalTeaMana_Value .."%|r")
    end
end)




postion_y = postion_y-40

-- 审判界限
local slider_JudgementOutHP = CreateFrame("Slider", ADDON_NAME.."SliderJudgementOutHP", CatUISettingsPaladinTank, "OptionsSliderTemplate")
slider_JudgementOutHP:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y+60)
slider_JudgementOutHP:SetWidth(220) -- 拖动条长度
slider_JudgementOutHP:SetHeight(16) -- 拖动条高度

slider_JudgementOutHP:SetMinMaxValues(0, 50000)
slider_JudgementOutHP:SetValueStep(1000)
slider_JudgementOutHP:SetValue(5000) -- 默认值
MPCatUISliderRegionHide(slider_JudgementOutHP)

_G[slider_JudgementOutHP:GetName().."Low"]:Hide()
_G[slider_JudgementOutHP:GetName().."High"]:Hide()
_G[slider_JudgementOutHP:GetName().."Text"]:SetFont("Fonts\\FRIZQT__.TTF", 12, "NONE")

-- 值变化时的回调函数
slider_JudgementOutHP:SetScript("OnValueChanged", function()
    --print("Rip当前值:", arg1)
    MPPaladinTankSaved.JudgementOutHP = arg1
    _G[slider_JudgementOutHP:GetName().."Text"]:SetText("目标生命 <".. MPPaladinTankSaved.JudgementOutHP .." 不审判")
end)


-- 创建单选框 - 正义壁垒
local checkButton_Righteous = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_Righteous", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_Righteous:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
checkButton_Righteous:SetScale(0.8)

-- 添加文字标签
local checkText_Righteous = checkButton_Righteous:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Righteous:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Righteous:SetTextColor(1, 1, 1)
checkText_Righteous:SetPoint("LEFT", checkButton_Righteous, "LEFT", 34, 1)
checkText_Righteous:SetText("自动 正义壁垒")


local slider_Righteous = CreateFrame("Slider", ADDON_NAME.."Slider_Righteous", checkButton_Righteous, "OptionsSliderTemplate")
slider_Righteous:SetPoint("RIGHT", checkButton_Righteous, "RIGHT", 250, -2)
slider_Righteous:SetWidth(150) -- 拖动条长度
slider_Righteous:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Righteous:SetMinMaxValues(0, 100)
slider_Righteous:SetValueStep(1)
slider_Righteous:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Righteous)

local color_Righteous = "|cFFFFD100"

_G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: 20%|r")
_G[slider_Righteous:GetName().."Low"]:Hide()
_G[slider_Righteous:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_Righteous:SetScript("OnValueChanged", function()
    --print("Frenzied当前值:", arg1)
    MPPaladinTankSaved.Righteous_Value = arg1
    _G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Righteous:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Righteous = 1
        color_Righteous = "|cFFFFD100"
        _G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: ".. MPPaladinTankSaved.Righteous_Value .."%|r")
    else
        MPPaladinTankSaved.Righteous = 0
        color_Righteous = "|cFF888888"
        _G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: ".. MPPaladinTankSaved.Righteous_Value .."%|r")
    end
end)



postion_y = postion_y+15

-- 十字军打击时机
local slider_CrusaderStrikeTimer = CreateFrame("Slider", ADDON_NAME.."SliderCrusaderStrikeTimer", CatUISettingsPaladinTank, "OptionsSliderTemplate")
slider_CrusaderStrikeTimer:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
slider_CrusaderStrikeTimer:SetWidth(220) -- 拖动条长度
slider_CrusaderStrikeTimer:SetHeight(16) -- 拖动条高度

slider_CrusaderStrikeTimer:SetMinMaxValues(1, 180)
slider_CrusaderStrikeTimer:SetValueStep(1)
slider_CrusaderStrikeTimer:SetValue(10) -- 默认值
MPCatUISliderRegionHide(slider_CrusaderStrikeTimer)

_G[slider_CrusaderStrikeTimer:GetName().."Text"]:SetText("10秒后开启 十字军打击")
_G[slider_CrusaderStrikeTimer:GetName().."Low"]:Hide()
_G[slider_CrusaderStrikeTimer:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_CrusaderStrikeTimer:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_CrusaderStrikeTimer:GetName().."Text"]:SetText(arg1.."秒后开启 十字军打击")
    MPPaladinTankSaved.CrusaderStrikeTimer = arg1
end)


postion_y = postion_y-45


-- 奉献等级
local slider_Consecration_Level = CreateFrame("Slider", ADDON_NAME.."SliderConsecration_Level", CatUISettingsPaladinTank, "OptionsSliderTemplate")
slider_Consecration_Level:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
slider_Consecration_Level:SetWidth(220) -- 拖动条长度
slider_Consecration_Level:SetHeight(16) -- 拖动条高度

slider_Consecration_Level:SetMinMaxValues(0, 5)
slider_Consecration_Level:SetValueStep(1)
slider_Consecration_Level:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Consecration_Level)

_G[slider_Consecration_Level:GetName().."Text"]:SetText("奉献等级: 自动|r")
_G[slider_Consecration_Level:GetName().."Low"]:Hide()
_G[slider_Consecration_Level:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Consecration_Level:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    if arg1==0 then
        _G[slider_Consecration_Level:GetName().."Text"]:SetText("奉献等级：自动")
    else
        _G[slider_Consecration_Level:GetName().."Text"]:SetText("奉献等级："..arg1)
    end
    MPPaladinTankSaved.Consecration_Level = arg1
end)

postion_y = postion_y-140


postion_y = postion_y-40


postion_y = postion_y+170


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinTank, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
checkButton_RacialTraits:SetScale(0.8)

-- 添加文字标签
local checkText_RacialTraits = checkButton_RacialTraits:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_RacialTraits:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_RacialTraits:SetTextColor(1, 1, 1)
checkText_RacialTraits:SetPoint("LEFT", checkButton_RacialTraits, "LEFT", 34, 1)
checkText_RacialTraits:SetText("自动开启 种族天赋 (爆发类)")

-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.RacialTraits = 1
    else
        MPPaladinTankSaved.RacialTraits = 0
    end
end)



postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Soulspeed = 1
    else
        MPPaladinTankSaved.Soulspeed = 0
    end
end)


-- 动态控制
local ButtonAutoSeal = CreateFrame("Button", ADDON_NAME.."ButtonAutoSeal", CatUISettingsPaladinTank, "UIPanelButtonTemplate")
ButtonAutoSeal:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y+60)
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
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPaladinTank, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 120, -44)
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
    MPResetPaladinTankSettings()
    MPInitPaladinTankSettings()

    MPCatPaladinSealReset()

    CatPaladinSeal:Hide()
    CatPaladinSeal:ClearAllPoints()
    CatPaladinSeal:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

end)



-- 添加分隔线
MPBottomLine(CatUISettingsPaladinTank)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Power = 1
    else
        MPPaladinTankSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved.Pick = 1
    else
        MPPaladinTankSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsPaladinTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPaladinTank, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFFF58CBA/ptank|r ]")



-- 配置文件版本号
local PaladinTankSettingsUIVersion = 18

function MPResetPaladinTankSettings()

    MPPaladinTankSaved.Version = PaladinTankSettingsUIVersion

    -- 基本配置

    MPPaladinTankSaved.Trinket_Upper = 1
    MPPaladinTankSaved.TUBoss = 0
    MPPaladinTankSaved.Trinket_Below = 1
    MPPaladinTankSaved.TBBoss = 0

    MPPaladinTankSaved.RighteousFury = 1
    MPPaladinTankSaved.Consecration = 1
    MPPaladinTankSaved.Consecration_Level = 0

    MPPaladinTankSaved.HolyShield = 1
    MPPaladinTankSaved.Exorcism = 1

    MPPaladinTankSaved.Target = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPPaladinTankSaved.HealthStone = 1
    MPPaladinTankSaved.HealthStone_Value = 30
    MPPaladinTankSaved.HerbalTea = 1
    MPPaladinTankSaved.HerbalTea_Value = 20
    MPPaladinTankSaved.Righteous = 0
    MPPaladinTankSaved.Righteous_Value = 20
    MPPaladinTankSaved.HerbalTeaMana = 0
    MPPaladinTankSaved.HerbalTeaMana_Value = 20

    MPPaladinTankSaved.JudgementOutHP = 5000
    MPPaladinTankSaved.Seal = 1
    MPPaladinTankSaved.Seal_Value = 1


    MPPaladinTankSaved.CrusaderStrike = 0
    MPPaladinTankSaved.CrusaderStrikeTimer = 15


    -- SuperWoW,UnitXP
    MPPaladinTankSaved.SuperWoW = 1
    MPPaladinTankSaved.UnitXP = 1

    MPPaladinTankSaved.UnSalvation = 0
    MPPaladinTankSaved.HolyShieldTarget = 0
    MPPaladinTankSaved.Sanctuary = 0

    MPPaladinTankSaved.RacialTraits = 0
    MPPaladinTankSaved.Soulspeed = 0
    MPPaladinTankSaved.SwipeFirst = 1

    -- 通用
    MPPaladinTankSaved.Power = 0
    MPPaladinTankSaved.Pick = 0

end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

function InitPaladinTankSettingsPart1()
    checkButton_RighteousFury:SetChecked(ToBoolean(MPPaladinTankSaved.RighteousFury))
    checkButton_Consecration:SetChecked( ToBoolean(MPPaladinTankSaved.Consecration) )
    checkButton_HolyShield:SetChecked( ToBoolean(MPPaladinTankSaved.HolyShield) )
    checkButton_CrusaderStrike:SetChecked(ToBoolean(MPPaladinTankSaved.CrusaderStrike))
    checkButton_Exorcism:SetChecked(ToBoolean(MPPaladinTankSaved.Exorcism))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPPaladinTankSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPPaladinTankSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPPaladinTankSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPPaladinTankSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPPaladinTankSaved.Target))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPPaladinTankSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPPaladinTankSaved.Soulspeed))

    checkButton_UnSalvation:SetChecked(ToBoolean(MPPaladinTankSaved.UnSalvation))
    checkButton_HolyShieldTarget:SetChecked(ToBoolean(MPPaladinTankSaved.HolyShieldTarget))
    checkButton_Sanctuary:SetChecked(ToBoolean(MPPaladinTankSaved.Sanctuary))

    checkButton_Power:SetChecked(ToBoolean(MPPaladinTankSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPPaladinTankSaved.Pick))
end

function MPInitPaladinTankSettings()
    if not MPPaladinTankSaved then
        MPPaladinTankSaved = {}
        MPResetPaladinTankSettings()
    end

    if MPPaladinTankSaved.Version ~= PaladinTankSettingsUIVersion then
        MPResetPaladinTankSettings()
    end

    InitPaladinTankSettingsPart1()


    checkButton_HealthStone:SetChecked(ToBoolean(MPPaladinTankSaved.HealthStone))
    slider_HealthStone:SetValue(MPPaladinTankSaved.HealthStone_Value)
    if MPPaladinTankSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinTankSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPaladinTankSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPaladinTankSaved.HerbalTea_Value)
    if MPPaladinTankSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinTankSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPaladinTankSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPaladinTankSaved.HerbalTeaMana_Value)
    if MPPaladinTankSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinTankSaved.HerbalTeaMana_Value .."%|r")


    checkButton_Righteous:SetChecked(MPPaladinTankSaved.Righteous)
    slider_Righteous:SetValue(MPPaladinTankSaved.Righteous_Value)
    if MPPaladinTankSaved.Righteous==1 then
        color_Righteous = "|cFFFFD100"
    else
        color_Righteous = "|cFF888888"
    end
    _G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: ".. MPPaladinTankSaved.Righteous_Value .."%|r")


    --[[ 前置审判
    checkButton_Judgement:SetChecked(MPPaladinTankSaved.Judgement)
    slider_Judgement:SetValue(MPPaladinTankSaved.Judgement_Value)
    if MPPaladinTankSaved.Judgement==1 then
        color_Judgement = "|cFFFFD100"
    else
        color_Judgement = "|cFF888888"
    end
    if MPPaladinTankSaved.Judgement_Value==0 then
        _G[slider_Judgement:GetName().."Text"]:SetText(color_Judgement.."正义审判")
    elseif MPPaladinTankSaved.Judgement_Value==1 then
        _G[slider_Judgement:GetName().."Text"]:SetText(color_Judgement.."智慧审判")
    elseif MPPaladinTankSaved.Judgement_Value==2 then
        _G[slider_Judgement:GetName().."Text"]:SetText(color_Judgement.."十字军审判")
    elseif MPPaladinTankSaved.Judgement_Value==3 then
        _G[slider_Judgement:GetName().."Text"]:SetText(color_Judgement.."光明审判")
    end
    ]]

    slider_JudgementOutHP:SetValue(MPPaladinTankSaved.JudgementOutHP)
    _G[slider_JudgementOutHP:GetName().."Text"]:SetText("目标生命 <".. MPPaladinTankSaved.JudgementOutHP .." 不审判")


    --[[ 中段审判
    checkButton_MiddleJudgement:SetChecked(MPPaladinTankSaved.MiddleJudgement)
    slider_MiddleJudgement:SetValue(MPPaladinTankSaved.MiddleJudgement_Value)
    if MPPaladinTankSaved.MiddleJudgement==1 then
        color_MiddleJudgement = "|cFFFFD100"
    else
        color_MiddleJudgement = "|cFF888888"
    end
    if MPPaladinTankSaved.MiddleJudgement_Value==1 then
        _G[slider_MiddleJudgement:GetName().."Text"]:SetText(color_MiddleJudgement.."智慧审判")
    elseif MPPaladinTankSaved.MiddleJudgement_Value==2 then
        _G[slider_MiddleJudgement:GetName().."Text"]:SetText(color_MiddleJudgement.."十字军审判")
    elseif MPPaladinTankSaved.MiddleJudgement_Value==3 then
        _G[slider_MiddleJudgement:GetName().."Text"]:SetText(color_MiddleJudgement.."光明审判")
    end
    slider_MiddleJudgementTimer:SetValue(MPPaladinTankSaved.MiddleJudgementTimer)
    _G[slider_MiddleJudgementTimer:GetName().."Text"]:SetText(color_MiddleJudgement.."约".. MPPaladinTankSaved.MiddleJudgementTimer .."秒后 中段审判")
    ]]

    -- 奉献
    slider_Consecration_Level:SetValue(MPPaladinTankSaved.Consecration_Level)

    slider_CrusaderStrikeTimer:SetValue(MPPaladinTankSaved.CrusaderStrikeTimer)


end

