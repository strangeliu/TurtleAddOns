-- 定义插件名称
local ADDON_NAME = "Settings-HunterMelee"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsHunterMelee = MPCreateFrame(ADDON_NAME.."Frame", 520, 510, "|cFFABD473设置 - 生存猎|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsHunterMelee:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 孤狼守护​
local checkButton_LoneWolf = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, postion_y, "保持 孤狼守护")
-- 设置点击事件
checkButton_LoneWolf:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].LoneWolf = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].LoneWolf = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].TUBoss = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 强击光环
local checkButton_Trueshot = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, postion_y, "保持 强击光环")
checkButton_Trueshot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Trueshot = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Trueshot = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].TBBoss = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 猛禽一击​
local checkButton_RaptorStrike = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, postion_y, "开启 猛禽一击")
-- 设置点击事件
checkButton_RaptorStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].RaptorStrike = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].RaptorStrike = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Target = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 猫鼬撕咬
local checkButton_MeerkatsBiting = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, postion_y, "开启 猫鼬撕咬")
-- 设置点击事件
checkButton_MeerkatsBiting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].MeerkatsBiting = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].MeerkatsBiting = 0
    end
end)



-- 创建单选框 - 宠物自动攻击
local checkButton_PetAttack = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "宠物自动攻击")
-- 设置点击事件
checkButton_PetAttack:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].PetAttack = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].PetAttack = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 切碎
local checkButton_Rake = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, postion_y, "开启 切碎 (自动识别天赋)")
-- 设置点击事件
checkButton_Rake:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Rake = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Rake = 0
    end
end)



-- 创建单选框 - Trap
local checkButton_Trap = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "开启陷阱")
-- 设置点击事件
checkButton_Trap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Trap = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Trap = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 割伤
local checkButton_Gore = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, postion_y, "开启 割伤 (自动识别天赋)")
-- 设置点击事件
checkButton_Gore:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Gore = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Gore = 0
    end
end)



-- 创建单选框 - ​​爆炸陷阱
local checkButton_ExplosiveTrap = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 370, postion_y, "爆炸陷阱")


-- 创建单选框 - ​​献祭陷阱
local checkButton_ImmolationTrap = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 470, postion_y, "献祭陷阱")


postion_y = postion_y-30

-- 创建单选框 - 摔绊
local checkButton_WingClip = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, postion_y, "开启 摔绊")
-- 设置点击事件
checkButton_WingClip:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].WingClip = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].WingClip = 0
    end
end)


-- 创建单选框 - 自动陷阱
local checkButton_AutoTrap = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 370, postion_y, "自动判断陷阱 (SuperWoW)")

-- 爆炸陷阱点击事件
checkButton_ExplosiveTrap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].ExplosiveTrap = 1
        MPHunterMeleeSaved[ConfigCurrent].ImmolationTrap = 0
        MPHunterMeleeSaved[ConfigCurrent].AutoTrap = 0
    else
        MPHunterMeleeSaved[ConfigCurrent].ExplosiveTrap = 0
    end
    checkButton_ExplosiveTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ExplosiveTrap))
    checkButton_ImmolationTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ImmolationTrap))
    checkButton_AutoTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].AutoTrap))
end)
-- 献祭陷阱点击事件
checkButton_ImmolationTrap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].ImmolationTrap = 1
        MPHunterMeleeSaved[ConfigCurrent].ExplosiveTrap = 0
        MPHunterMeleeSaved[ConfigCurrent].AutoTrap = 0
    else
        MPHunterMeleeSaved[ConfigCurrent].ImmolationTrap = 0
    end
    checkButton_ExplosiveTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ExplosiveTrap))
    checkButton_ImmolationTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ImmolationTrap))
    checkButton_AutoTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].AutoTrap))
end)
-- 自动陷阱点击事件
checkButton_AutoTrap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].AutoTrap = 1
        MPHunterMeleeSaved[ConfigCurrent].ImmolationTrap = 0
        MPHunterMeleeSaved[ConfigCurrent].ExplosiveTrap = 0
    else
        MPHunterMeleeSaved[ConfigCurrent].AutoTrap = 0
    end
    checkButton_ExplosiveTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ExplosiveTrap))
    checkButton_ImmolationTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ImmolationTrap))
    checkButton_AutoTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].AutoTrap))
end)








-- 高级


postion_y = postion_y+20

-- 添加提示内容区域
local TipText1 = CatUISettingsHunterMelee:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-90

-- 急速射击
local checkButton_RapidFire = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButtonSoulspeed", 20, postion_y, "自动 急速射击")
checkButton_RapidFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].RapidFire = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].RapidFire = 0
    end
end)
local checkButton_RapidFireBoss = MPCreateCheckButtonSmall(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RapidFireBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].RapidFireBoss = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].RapidFireBoss = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPHunterMeleeSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterMeleeSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterMeleeSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPHunterMeleeSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterMeleeSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40



-- 创建单选框 - 蝰蛇守护
local checkButton_ViperGuardian = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, postion_y, "自动 蝰蛇守护")

local slider_ViperGuardian = CreateFrame("Slider", ADDON_NAME.."Slider_ViperGuardian", checkButton_ViperGuardian, "OptionsSliderTemplate")
slider_ViperGuardian:SetPoint("RIGHT", checkButton_ViperGuardian, "RIGHT", 260, -2)
slider_ViperGuardian:SetWidth(150) -- 拖动条长度
slider_ViperGuardian:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_ViperGuardian:SetMinMaxValues(100, 3000)
slider_ViperGuardian:SetValueStep(100)
slider_ViperGuardian:SetValue(1000) -- 默认值
MPCatUISliderRegionHide(slider_ViperGuardian)

local color_ViperGuardian = "|cFFFFD100"

-- 值变化时的回调函数
slider_ViperGuardian:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPHunterMeleeSaved[ConfigCurrent].Viper_Value = arg1
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterMeleeSaved[ConfigCurrent].Viper_Value .."|r")
end)
-- 设置点击事件
checkButton_ViperGuardian:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].ViperGuardian = 1
        color_ViperGuardian = "|cFFFFD100"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterMeleeSaved[ConfigCurrent].Viper_Value .."|r")
    else
        MPHunterMeleeSaved[ConfigCurrent].ViperGuardian = 0
        color_ViperGuardian = "|cFF888888"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterMeleeSaved[ConfigCurrent].Viper_Value .."|r")
    end
end)






-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPHunterMeleeSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterMeleeSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterMeleeSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPHunterMeleeSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterMeleeSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40





-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Soulspeed = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].RacialTraits = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)





-- 创建按钮
local myButton = MPCreateButton(CatUISettingsHunterMelee, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetHunterMeleeSettings(ConfigCurrent)
    MPInitHunterMeleeSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsHunterMelee, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsHunterMelee, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsHunterMelee, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 440, -44)
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
    MPInitHunterMeleeSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitHunterMeleeSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitHunterMeleeSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsHunterMelee)

local checkButton_Power = MPPublicCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Power = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved[ConfigCurrent].Pick = 1
    else
        MPHunterMeleeSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsHunterMelee:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsHunterMelee, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFABD473/hmdps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local HunterMeleeSettingsUIVersion = 10

function MPResetHunterMeleeSettings(config)

    MPHunterMeleeSaved.Version = HunterMeleeSettingsUIVersion

    -- 基本配置

    MPHunterMeleeSaved[config].LoneWolf = 1
    MPHunterMeleeSaved[config].Trueshot = 1
    MPHunterMeleeSaved[config].RaptorStrike = 1
    MPHunterMeleeSaved[config].MeerkatsBiting = 1
    MPHunterMeleeSaved[config].Rake = 1
    MPHunterMeleeSaved[config].Gore = 1
    MPHunterMeleeSaved[config].ExplosiveTrap = 0
    MPHunterMeleeSaved[config].ImmolationTrap = 0
    MPHunterMeleeSaved[config].AutoTrap = 1
    MPHunterMeleeSaved[config].Trap = 1
    MPHunterMeleeSaved[config].WingClip = 0

    MPHunterMeleeSaved[config].Trinket_Upper = 1
    MPHunterMeleeSaved[config].TUBoss = 0
    MPHunterMeleeSaved[config].Trinket_Below = 1
    MPHunterMeleeSaved[config].TBBoss = 0
    MPHunterMeleeSaved[config].Target = 0
    MPHunterMeleeSaved[config].PetAttack = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPHunterMeleeSaved[config].HealthStone = 1
    MPHunterMeleeSaved[config].HealthStone_Value = 30
    MPHunterMeleeSaved[config].HerbalTea = 1
    MPHunterMeleeSaved[config].HerbalTea_Value = 20
    MPHunterMeleeSaved[config].HerbalTeaMana = 0
    MPHunterMeleeSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPHunterMeleeSaved[config].SuperWoW = 1
    MPHunterMeleeSaved[config].UnitXP = 1

    MPHunterMeleeSaved[config].RacialTraits = 0
    MPHunterMeleeSaved[config].RacialTraitsBoss = 1
    MPHunterMeleeSaved[config].Soulspeed = 0
    MPHunterMeleeSaved[config].SoulspeedBoss = 1
    MPHunterMeleeSaved[config].RapidFire = 0
    MPHunterMeleeSaved[config].RapidFireBoss = 0

    MPHunterMeleeSaved[config].ViperGuardian = 0
    MPHunterMeleeSaved[config].Viper_Value = 1000

    -- 通用
    MPHunterMeleeSaved[config].Power = 0
    MPHunterMeleeSaved[config].Pick = 0

end

local function MPInitHunterMeleeSettingsPart1()

    checkButton_LoneWolf:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].LoneWolf))
    checkButton_Trueshot:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Trueshot))
    checkButton_RaptorStrike:SetChecked( MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].RaptorStrike) )
    checkButton_MeerkatsBiting:SetChecked( MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].MeerkatsBiting) )
    checkButton_Rake:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Rake))
    checkButton_Gore:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Gore))
    checkButton_ExplosiveTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ExplosiveTrap))
    checkButton_ImmolationTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ImmolationTrap))
    checkButton_AutoTrap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].AutoTrap))
    checkButton_Trap:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Trap))
    checkButton_WingClip:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].WingClip))

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].TBBoss))
    checkButton_Target:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Target))
    checkButton_PetAttack:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].PetAttack))

end


function MPInitHunterMeleeSettings()
    if not MPHunterMeleeSaved then
        MPHunterMeleeSaved = {}

        -- 第一套配置
        if not MPHunterMeleeSaved[1] then
            MPHunterMeleeSaved[1] = {}
            MPResetHunterMeleeSettings(1)
        end

        -- 第二套配置
        if not MPHunterMeleeSaved[2] then
            MPHunterMeleeSaved[2] = {}
            MPResetHunterMeleeSettings(2)
        end

        -- 第三套配置
        if not MPHunterMeleeSaved[3] then
            MPHunterMeleeSaved[3] = {}
            MPResetHunterMeleeSettings(3)
        end
    end

    if MPHunterMeleeSaved.Version ~= HunterMeleeSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[生存猎宏]当前配置，这是新版插件正常数据更新！|r")
        MPHunterMeleeSaved[1] = {}
        MPHunterMeleeSaved[2] = {}
        MPHunterMeleeSaved[3] = {}
        MPResetHunterMeleeSettings(1)
        MPResetHunterMeleeSettings(2)
        MPResetHunterMeleeSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    MPInitHunterMeleeSettingsPart1()


    checkButton_RacialTraits:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].SoulspeedBoss))
    checkButton_RapidFire:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].RapidFire))
    checkButton_RapidFireBoss:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].RapidFireBoss))

    checkButton_HealthStone:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPHunterMeleeSaved[ConfigCurrent].HealthStone_Value)
    if MPHunterMeleeSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterMeleeSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPHunterMeleeSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPHunterMeleeSaved[ConfigCurrent].HerbalTea_Value)
    if MPHunterMeleeSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterMeleeSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterMeleeSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")


    checkButton_Power:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].Pick))

    checkButton_ViperGuardian:SetChecked(MPToBoolean(MPHunterMeleeSaved[ConfigCurrent].ViperGuardian))
    slider_ViperGuardian:SetValue(MPHunterMeleeSaved[ConfigCurrent].Viper_Value)
    if MPHunterMeleeSaved[ConfigCurrent].ViperGuardian==1 then
        color_ViperGuardian = "|cFFFFD100"
    else
        color_ViperGuardian = "|cFF888888"
    end
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterMeleeSaved[ConfigCurrent].Viper_Value .."|r")

end

