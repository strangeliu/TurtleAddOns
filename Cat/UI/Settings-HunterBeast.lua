-- 定义插件名称
local ADDON_NAME = "Settings-HunterBeast"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsHunterBeast = MPCreateFrame(ADDON_NAME.."Frame", 520, 600, "|cFFABD473设置 - 兽王猎|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsHunterBeast:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 雄鹰守护​
local checkButton_Hawk = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "保持 雄鹰守护")
-- 设置点击事件
checkButton_Hawk:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Hawk = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Hawk = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].TUBoss = 1
    else
        MPHunterBeastSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 强击光环
local checkButton_Trueshot = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "保持 强击光环")
checkButton_Trueshot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Trueshot = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Trueshot = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].TBBoss = 1
    else
        MPHunterBeastSaved[ConfigCurrent].TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 猎人印记
local checkButton_Mark = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "保持 猎人印记")
-- 设置点击事件
checkButton_Mark:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Mark = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Mark = 0
    end
end)
local checkButton_MarkBossOnly = MPCreateCheckButtonSmall(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_MarkBossOnly:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].MarkBossOnly = 1
    else
        MPHunterBeastSaved[ConfigCurrent].MarkBossOnly = 0
    end
end)

-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Target = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Target = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 杀戮命令
local checkButton_KillCommand = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "开启 杀戮命令")
checkButton_KillCommand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].KillCommand = 1
    else
        MPHunterBeastSaved[ConfigCurrent].KillCommand = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 瞄准射击
local checkButton_AimedShot = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "开启 瞄准射击")
-- 设置点击事件
checkButton_AimedShot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].AimedShot = 1
    else
        MPHunterBeastSaved[ConfigCurrent].AimedShot = 0
    end
end)

-- 创建单选框 - 宠物自动攻击
local checkButton_PetAttack = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "宠物自动攻击")
-- 设置点击事件
checkButton_PetAttack:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].PetAttack = 1
    else
        MPHunterBeastSaved[ConfigCurrent].PetAttack = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 多重射击
local checkButton_MultiShot = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "开启 多重射击")
-- 设置点击事件
checkButton_MultiShot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].MultiShot = 1
    else
        MPHunterBeastSaved[ConfigCurrent].MultiShot = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 奥术射击
local checkButton_ArcaneShot = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "开启 奥术射击")
-- 设置点击事件
checkButton_ArcaneShot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].ArcaneShot = 1
    else
        MPHunterBeastSaved[ConfigCurrent].ArcaneShot = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - ​​毒蛇钉刺
local checkButton_SerpentSting = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "保持 ​​毒蛇钉刺 (钉刺单选)")



-- 创建单选框 - 近身 猛禽一击
local checkButton_RaptorStrike = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "近身 猛禽一击 (UnitXP模组)")
-- 设置点击事件
checkButton_RaptorStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].RaptorStrike = 1
    else
        MPHunterBeastSaved[ConfigCurrent].RaptorStrike = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - ​​蝰蛇钉刺
local checkButton_ViperSting = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "保持 ​​蝰蛇钉刺 (钉刺单选)")


-- 创建单选框 - 近身 猫鼬撕咬
local checkButton_MeerkatsBiting = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "近身 猫鼬撕咬 (UnitXP模组)")
-- 设置点击事件
checkButton_MeerkatsBiting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].MeerkatsBiting = 1
    else
        MPHunterBeastSaved[ConfigCurrent].MeerkatsBiting = 0
    end
end)




-- 毒蛇钉刺点击事件
checkButton_SerpentSting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Serpent = 1
        MPHunterBeastSaved[ConfigCurrent].Viper = 0
    else
        MPHunterBeastSaved[ConfigCurrent].Serpent = 0
    end
    checkButton_SerpentSting:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Serpent))
    checkButton_ViperSting:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Viper))

end)
-- 蝰蛇钉刺点击事件
checkButton_ViperSting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Viper = 1
        MPHunterBeastSaved[ConfigCurrent].Serpent = 0
    else
        MPHunterBeastSaved[ConfigCurrent].Viper = 0
    end
    checkButton_SerpentSting:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Serpent))
    checkButton_ViperSting:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Viper))

end)



-- 添加文字标签
local checkText_Help = CatUISettingsHunterBeast:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Help:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_Help:SetTextColor(1, 1, 1)
checkText_Help:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y+20)
checkText_Help:SetText("|cFFDD4080关键配置：|r需将【自动射击】拖出至任意技能栏里。")








-- 高级


postion_y = postion_y-10

-- 添加提示内容区域
local TipText1 = CatUISettingsHunterBeast:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-120


-- 急速射击
local checkButton_RapidFire = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "自动 急速射击")
checkButton_RapidFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].RapidFire = 1
    else
        MPHunterBeastSaved[ConfigCurrent].RapidFire = 0
    end
end)
local checkButton_RapidFireBoss = MPCreateCheckButtonSmall(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RapidFireBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].RapidFireBoss = 1
    else
        MPHunterBeastSaved[ConfigCurrent].RapidFireBoss = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPHunterBeastSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterBeastSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterBeastSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPHunterBeastSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterBeastSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40



-- 创建单选框 - 蝰蛇守护
local checkButton_ViperGuardian = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, postion_y, "自动 蝰蛇守护")

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
    MPHunterBeastSaved[ConfigCurrent].Viper_Value = arg1
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterBeastSaved[ConfigCurrent].Viper_Value .."|r")
end)
-- 设置点击事件
checkButton_ViperGuardian:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].ViperGuardian = 1
        color_ViperGuardian = "|cFFFFD100"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterBeastSaved[ConfigCurrent].Viper_Value .."|r")
    else
        MPHunterBeastSaved[ConfigCurrent].ViperGuardian = 0
        color_ViperGuardian = "|cFF888888"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterBeastSaved[ConfigCurrent].Viper_Value .."|r")
    end
end)





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPHunterBeastSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterBeastSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterBeastSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPHunterBeastSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterBeastSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Soulspeed = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPHunterBeastSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)


postion_y = postion_y - 40

-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].RacialTraits = 1
    else
        MPHunterBeastSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPHunterBeastSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)





-- 创建按钮
local myButton = MPCreateButton(CatUISettingsHunterBeast, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetHunterBeastSettings(ConfigCurrent)
    MPInitHunterBeastSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsHunterBeast, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsHunterBeast, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsHunterBeast, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 440, -44)
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
    MPInitHunterBeastSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitHunterBeastSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitHunterBeastSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsHunterBeast)

local checkButton_Power = MPPublicCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Power = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved[ConfigCurrent].Pick = 1
    else
        MPHunterBeastSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsHunterBeast:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsHunterBeast, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFABD473/hbdps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local HunterBeastSettingsUIVersion = 13

function MPResetHunterBeastSettings(config)

    MPHunterBeastSaved.Version = HunterBeastSettingsUIVersion

    -- 基本配置

    MPHunterBeastSaved[config].Hawk = 1
    MPHunterBeastSaved[config].Trueshot = 1
    MPHunterBeastSaved[config].Mark = 0
    MPHunterBeastSaved[config].MarkBossOnly = 0
    MPHunterBeastSaved[config].KillCommand = 1
    MPHunterBeastSaved[config].AimedShot = 1
    MPHunterBeastSaved[config].BaitShot = 1
    MPHunterBeastSaved[config].SteadyShot = 1
    MPHunterBeastSaved[config].MultiShot = 1
    MPHunterBeastSaved[config].ArcaneShot = 1
    MPHunterBeastSaved[config].Serpent = 1
    MPHunterBeastSaved[config].Viper = 0

    MPHunterBeastSaved[config].Trinket_Upper = 1
    MPHunterBeastSaved[config].TUBoss = 0
    MPHunterBeastSaved[config].Trinket_Below = 1
    MPHunterBeastSaved[config].TBBoss = 0
    MPHunterBeastSaved[config].Target = 0
    MPHunterBeastSaved[config].PetAttack = 0

    MPHunterBeastSaved[config].RaptorStrike = 1
    MPHunterBeastSaved[config].MeerkatsBiting = 1

    -- 高级配置

    -- 治疗石、糖水茶
    MPHunterBeastSaved[config].HealthStone = 1
    MPHunterBeastSaved[config].HealthStone_Value = 30
    MPHunterBeastSaved[config].HerbalTea = 1
    MPHunterBeastSaved[config].HerbalTea_Value = 20
    MPHunterBeastSaved[config].HerbalTeaMana = 0
    MPHunterBeastSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPHunterBeastSaved[config].SuperWoW = 1
    MPHunterBeastSaved[config].UnitXP = 1

    MPHunterBeastSaved[config].RacialTraits = 0
    MPHunterBeastSaved[config].RacialTraitsBoss = 1
    MPHunterBeastSaved[config].Soulspeed = 0
    MPHunterBeastSaved[config].SoulspeedBoss = 1
    MPHunterBeastSaved[config].RapidFire = 0
    MPHunterBeastSaved[config].RapidFireBoss = 0

    MPHunterBeastSaved[config].ViperGuardian = 0
    MPHunterBeastSaved[config].Viper_Value = 1000

    MPHunterBeastSaved[config].SteadyShot_Value = 1.9

    -- 通用
    MPHunterBeastSaved[config].Power = 0
    MPHunterBeastSaved[config].Pick = 0

end


local function MPInitHunterBeastSettingsPart1()

    checkButton_Hawk:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Hawk))
    checkButton_Mark:SetChecked( MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Mark) )
    checkButton_MarkBossOnly:SetChecked( MPToBoolean(MPHunterBeastSaved[ConfigCurrent].MarkBossOnly) )
    checkButton_KillCommand:SetChecked( MPToBoolean(MPHunterBeastSaved[ConfigCurrent].KillCommand) )
    checkButton_Trueshot:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Trueshot))
    checkButton_AimedShot:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].AimedShot))
    checkButton_MultiShot:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].MultiShot))
    checkButton_ArcaneShot:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].ArcaneShot))
    checkButton_SerpentSting:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Serpent))
    checkButton_ViperSting:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Viper))

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].TBBoss))
    checkButton_Target:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Target))
    checkButton_PetAttack:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].PetAttack))

    checkButton_RaptorStrike:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].RaptorStrike))
    checkButton_MeerkatsBiting:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].MeerkatsBiting))

    checkButton_RacialTraits:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].SoulspeedBoss))
    checkButton_RapidFire:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].RapidFire))
    checkButton_RapidFireBoss:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].RapidFireBoss))

    checkButton_Power:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].Pick))
end

function MPInitHunterBeastSettings()
    if not MPHunterBeastSaved then
        MPHunterBeastSaved = {}

        -- 第一套配置
        if not MPHunterBeastSaved[1] then
            MPHunterBeastSaved[1] = {}
            MPResetHunterBeastSettings(1)
        end

        -- 第二套配置
        if not MPHunterBeastSaved[2] then
            MPHunterBeastSaved[2] = {}
            MPResetHunterBeastSettings(2)
        end

        -- 第三套配置
        if not MPHunterBeastSaved[3] then
            MPHunterBeastSaved[3] = {}
            MPResetHunterBeastSettings(3)
        end
    end

    if MPHunterBeastSaved.Version ~= HunterBeastSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[兽王猎宏]当前配置，这是新版插件正常数据更新！|r")
        MPHunterBeastSaved[1] = {}
        MPHunterBeastSaved[2] = {}
        MPHunterBeastSaved[3] = {}
        MPResetHunterBeastSettings(1)
        MPResetHunterBeastSettings(2)
        MPResetHunterBeastSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    MPInitHunterBeastSettingsPart1()

    checkButton_HealthStone:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPHunterBeastSaved[ConfigCurrent].HealthStone_Value)
    if MPHunterBeastSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterBeastSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPHunterBeastSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPHunterBeastSaved[ConfigCurrent].HerbalTea_Value)
    if MPHunterBeastSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterBeastSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterBeastSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")


    checkButton_ViperGuardian:SetChecked(MPToBoolean(MPHunterBeastSaved[ConfigCurrent].ViperGuardian))
    slider_ViperGuardian:SetValue(MPHunterBeastSaved[ConfigCurrent].Viper_Value)
    if MPHunterBeastSaved[ConfigCurrent].ViperGuardian==1 then
        color_ViperGuardian = "|cFFFFD100"
    else
        color_ViperGuardian = "|cFF888888"
    end
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterBeastSaved[ConfigCurrent].Viper_Value .."|r")

end

