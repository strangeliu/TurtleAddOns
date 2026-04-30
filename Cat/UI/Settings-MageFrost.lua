
-- 定义插件名称
local ADDON_NAME = "Settings-MageFrost"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsMageFrost = MPCreateFrame(ADDON_NAME.."Frame", 520, 540, "|cFF69CCF0设置 - 冰法|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsMageFrost:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 魔甲术
local checkButton_MageArmor = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "保持 魔甲术")
-- 设置点击事件
checkButton_MageArmor:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].MageArmor = 1
    else
        MPMageFrostSaved[ConfigCurrent].MageArmor = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPMageFrostSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].TUBoss = 1
    else
        MPMageFrostSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 寒冰护体
local checkButton_IceBarrier = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "保持 寒冰护体")
-- 设置点击事件
checkButton_IceBarrier:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].IceBarrier = 1
    else
        MPMageFrostSaved[ConfigCurrent].IceBarrier = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPMageFrostSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].TBBoss = 1
    else
        MPMageFrostSaved[ConfigCurrent].TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奥术涌动​
local checkButton_ArcaneSurge = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "开启 奥术涌动")
-- 设置点击事件
checkButton_ArcaneSurge:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].ArcaneSurge = 1
    else
        MPMageFrostSaved[ConfigCurrent].ArcaneSurge = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].Target = 1
    else
        MPMageFrostSaved[ConfigCurrent].Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冰锥术​
local checkButton_ConeCold = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "开启 冰锥术 (需UnitXP)")
-- 设置点击事件
checkButton_ConeCold:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].ConeCold = 1
    else
        MPMageFrostSaved[ConfigCurrent].ConeCold = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冰霜新星
local checkButton_FrostNova = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "开启 冰霜新星 (需UnitXP)")
-- 设置点击事件
checkButton_FrostNova:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].FrostNova = 1
    else
        MPMageFrostSaved[ConfigCurrent].FrostNova = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冰柱​
local checkButton_Icicle = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "开启 冰柱")
-- 设置点击事件
checkButton_Icicle:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].Icicle = 1
    else
        MPMageFrostSaved[ConfigCurrent].Icicle = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 火焰冲击
local checkButton_FireBlast = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "开启 火焰冲击")
-- 设置点击事件
checkButton_FireBlast:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].FireBlast = 1
    else
        MPMageFrostSaved[ConfigCurrent].FireBlast = 0
    end
end)











-- 高级


postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsMageFrost:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-95


-- 创建单选框 - 冰霜速冻
local checkButton_Frostbite = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "开启 冰柱条件 冰霜速冻")
-- 设置点击事件
checkButton_Frostbite:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].Frostbite = 1
    else
        MPMageFrostSaved[ConfigCurrent].Frostbite = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPMageFrostSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFrostSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFrostSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPMageFrostSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFrostSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 冰冷血脉
local checkButton_ColdBloodline = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "仅保持 冰冷血脉")
-- 设置点击事件
checkButton_ColdBloodline:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].ColdBloodline = 1
    else
        MPMageFrostSaved[ConfigCurrent].ColdBloodline = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPMageFrostSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFrostSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFrostSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPMageFrostSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFrostSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 保护点燃
local checkButton_IgniteProtect = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, postion_y, "保护 优质点燃 (团队中)")
-- 设置点击事件
checkButton_IgniteProtect:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].IgniteProtect = 1
    else
        MPMageFrostSaved[ConfigCurrent].IgniteProtect = 0
    end
end)


-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPMageFrostSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFrostSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFrostSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPMageFrostSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFrostSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40




-- 创建单选框 - 宝石 蓝量
local checkButton_JewelMana = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, postion_y, "自动 法力宝石")

local slider_JewelMana = CreateFrame("Slider", ADDON_NAME.."Slider_JewelMana", checkButton_JewelMana, "OptionsSliderTemplate")
slider_JewelMana:SetPoint("RIGHT", checkButton_JewelMana, "RIGHT", 250, -2)
slider_JewelMana:SetWidth(150) -- 拖动条长度
slider_JewelMana:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_JewelMana:SetMinMaxValues(1, 100)
slider_JewelMana:SetValueStep(1)
slider_JewelMana:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_JewelMana)

local color_JewelMana = "|cFFFFD100"

-- 值变化时的回调函数
slider_JewelMana:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPMageFrostSaved[ConfigCurrent].JewelMana_Value = arg1
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFrostSaved[ConfigCurrent].JewelMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_JewelMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].JewelMana = 1
        color_JewelMana = "|cFFFFD100"
        _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFrostSaved[ConfigCurrent].JewelMana_Value .."%|r")
    else
        MPMageFrostSaved[ConfigCurrent].JewelMana = 0
        color_JewelMana = "|cFF888888"
        _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFrostSaved[ConfigCurrent].JewelMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].Soulspeed = 1
    else
        MPMageFrostSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPMageFrostSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].RacialTraits = 1
    else
        MPMageFrostSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPMageFrostSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)




-- 创建按钮
local myButton = MPCreateButton(CatUISettingsMageFrost, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetMageFrostSettings(ConfigCurrent)
    MPInitMageFrostSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsMageFrost, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsMageFrost, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsMageFrost, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 440, -44)
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
    MPInitMageFrostSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitMageFrostSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitMageFrostSettings()
end)




-- 添加分隔线
MPBottomLine(CatUISettingsMageFrost)

local checkButton_Power = MPPublicCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].Power = 1
    else
        MPMageFrostSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved[ConfigCurrent].Pick = 1
    else
        MPMageFrostSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsMageFrost:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsMageFrost, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFF69CCF0/mfdps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local MageFrostSettingsUIVersion = 11

function MPResetMageFrostSettings(config)

    MPMageFrostSaved.Version = MageFrostSettingsUIVersion

    -- 基本配置

    MPMageFrostSaved[config].MageArmor = 1
    MPMageFrostSaved[config].IceBarrier = 1
    MPMageFrostSaved[config].ArcaneSurge = 1
    MPMageFrostSaved[config].ConeCold = 0
    MPMageFrostSaved[config].FrostNova = 1
    MPMageFrostSaved[config].Icicle = 1
    MPMageFrostSaved[config].FireBlast = 0

    MPMageFrostSaved[config].Trinket_Upper = 1
    MPMageFrostSaved[config].TUBoss = 0
    MPMageFrostSaved[config].Trinket_Below = 1
    MPMageFrostSaved[config].TBBoss = 0
    MPMageFrostSaved[config].Target = 0



    -- 高级配置

    -- 治疗石、糖水茶
    MPMageFrostSaved[config].HealthStone = 1
    MPMageFrostSaved[config].HealthStone_Value = 30
    MPMageFrostSaved[config].HerbalTea = 1
    MPMageFrostSaved[config].HerbalTea_Value = 20
    MPMageFrostSaved[config].HerbalTeaMana = 0
    MPMageFrostSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPMageFrostSaved[config].SuperWoW = 1
    MPMageFrostSaved[config].UnitXP = 1

    MPMageFrostSaved[config].Frostbite = 1
    MPMageFrostSaved[config].RacialTraits = 0
    MPMageFrostSaved[config].RacialTraitsBoss = 1
    MPMageFrostSaved[config].Soulspeed = 0
    MPMageFrostSaved[config].SoulspeedBoss = 1
    MPMageFrostSaved[config].IgniteProtect = 1
    MPMageFrostSaved[config].ColdBloodline = 0

    MPMageFrostSaved[config].JewelMana_Value = 35
    MPMageFrostSaved[config].JewelMana = 0

    -- 通用
    MPMageFrostSaved[config].Power = 0
    MPMageFrostSaved[config].Pick = 0

end


local function MPInitMageFrostSettingsPart1()

    checkButton_MageArmor:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].MageArmor))
    checkButton_IceBarrier:SetChecked( MPToBoolean(MPMageFrostSaved[ConfigCurrent].IceBarrier) )
    checkButton_ArcaneSurge:SetChecked( MPToBoolean(MPMageFrostSaved[ConfigCurrent].ArcaneSurge) )
    checkButton_ConeCold:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].ConeCold))
    checkButton_FrostNova:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].FrostNova))
    checkButton_Icicle:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].Icicle))
    checkButton_FireBlast:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].FireBlast))

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].TBBoss))
    checkButton_Target:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].Target))

    checkButton_Frostbite:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].Frostbite))
    checkButton_RacialTraits:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].SoulspeedBoss))
    checkButton_IgniteProtect:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].IgniteProtect))
    checkButton_ColdBloodline:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].ColdBloodline))

    checkButton_Power:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].Pick))
end

function MPInitMageFrostSettings()
    if not MPMageFrostSaved then
        MPMageFrostSaved = {}

        -- 第一套配置
        if not MPMageFrostSaved[1] then
            MPMageFrostSaved[1] = {}
            MPResetMageFrostSettings(1)
        end

        -- 第二套配置
        if not MPMageFrostSaved[2] then
            MPMageFrostSaved[2] = {}
            MPResetMageFrostSettings(2)
        end

        -- 第三套配置
        if not MPMageFrostSaved[3] then
            MPMageFrostSaved[3] = {}
            MPResetMageFrostSettings(3)
        end
    end

    if MPMageFrostSaved.Version ~= MageFrostSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[猫德宏]当前配置，这是新版插件正常数据更新！|r")
        MPMageFrostSaved[1] = {}
        MPMageFrostSaved[2] = {}
        MPMageFrostSaved[3] = {}
        MPResetMageFrostSettings(1)
        MPResetMageFrostSettings(2)
        MPResetMageFrostSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    MPInitMageFrostSettingsPart1()

    checkButton_HealthStone:SetChecked(MPToBoolean(MPMageFrostSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPMageFrostSaved[ConfigCurrent].HealthStone_Value)
    if MPMageFrostSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFrostSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPMageFrostSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPMageFrostSaved[ConfigCurrent].HerbalTea_Value)
    if MPMageFrostSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFrostSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPMageFrostSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPMageFrostSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPMageFrostSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFrostSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")

    checkButton_JewelMana:SetChecked(MPMageFrostSaved[ConfigCurrent].JewelMana)
    slider_JewelMana:SetValue(MPMageFrostSaved[ConfigCurrent].JewelMana_Value)
    if MPMageFrostSaved[ConfigCurrent].JewelMana==1 then
        color_JewelMana = "|cFFFFD100"
    else
        color_JewelMana = "|cFF888888"
    end
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFrostSaved[ConfigCurrent].JewelMana_Value .."%|r")


end

