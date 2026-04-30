
-- 定义插件名称
local ADDON_NAME = "Settings-DriudBear"

local ConfigCurrent = 1

CatUISettingsBearWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 500, "|cFFFF7D0A设置 - 熊德|r")



local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsBearWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsBearWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 熊形态
local checkButton_Bear = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 巨熊形态")
checkButton_Bear:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Bear = 1
    else
        MPDriudBearSaved[ConfigCurrent].Bear = 0
    end
end)

-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPDriudBearSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].TUBoss = 1
    else
        MPDriudBearSaved[ConfigCurrent].TUBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 挫志咆哮
local checkButton_Demoralizing = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 挫志咆哮")
checkButton_Demoralizing:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Demoralizing = 1
    else
        MPDriudBearSaved[ConfigCurrent].Demoralizing = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPDriudBearSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].TBBoss = 1
    else
        MPDriudBearSaved[ConfigCurrent].TBBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 狂怒
local checkButton_Fury = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 狂怒")
checkButton_Fury:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Fury = 1
    else
        MPDriudBearSaved[ConfigCurrent].Fury = 0
    end
end)
local checkButton_FuryBoss = MPCreateCheckButtonSmall(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_FuryBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].FuryBoss = 1
    else
        MPDriudBearSaved[ConfigCurrent].FuryBoss = 0
    end
end)




-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Target = 1
    else
        MPDriudBearSaved[ConfigCurrent].Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 挥击
local checkButton_Swipe = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 挥击")
checkButton_Swipe:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Swipe = 1
    else
        MPDriudBearSaved[ConfigCurrent].Swipe = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 精灵之火
local checkButton_FaerieFire = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 精灵之火")
checkButton_FaerieFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].FaerieFire = 1
    else
        MPDriudBearSaved[ConfigCurrent].FaerieFire = 0
    end
end)







-- 高级



postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsBearWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsBearWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-80


-- 创建单选框 - 群体优先挥击
local checkButton_SwipeFirst = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonSwipeFirst", 20, postion_y, "群体策略 优先挥击 (SuperWow)")
checkButton_SwipeFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].SwipeFirst = 1
    else
        MPDriudBearSaved[ConfigCurrent].SwipeFirst = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonSuperWow", 340, postion_y, "自动 治疗石")

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
-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPDriudBearSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudBearSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudBearSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPDriudBearSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudBearSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 优先槌击
local checkButton_MangleFirst = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonMangleFirst", 20, postion_y, "单体策略 槌击优先")
checkButton_MangleFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].MangleFirst = 1
    else
        MPDriudBearSaved[ConfigCurrent].MangleFirst = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton_HerbalTea", 340, postion_y, "自动 草药茶")

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
-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPDriudBearSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudBearSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudBearSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPDriudBearSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudBearSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40

--[[
-- boss再开爆发
local checkButton_Burst = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonBurst", 20, postion_y, "爆发保留BOSS阶段 狂怒")
checkButton_Burst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Burst = 1
    else
        MPDriudBearSaved[ConfigCurrent].Burst = 0
    end
end)
]]
-- 创建单选框 - 取消拯救
local checkButton_UnSalvation = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonUnSalvation", 20, postion_y, "自动取消 拯救祝福")
checkButton_UnSalvation:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].UnSalvation = 1
    else
        MPDriudBearSaved[ConfigCurrent].UnSalvation = 0
    end
end)

-- 创建单选框 - 狂暴回复
local checkButton_Frenzied = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton_Frenzied", 340, postion_y, "自动 狂暴回复")

local slider_Frenzied = CreateFrame("Slider", ADDON_NAME.."Slider_Frenzied", checkButton_Frenzied, "OptionsSliderTemplate")
slider_Frenzied:SetPoint("RIGHT", checkButton_Frenzied, "RIGHT", 250, -2)
slider_Frenzied:SetWidth(150) -- 拖动条长度
slider_Frenzied:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Frenzied:SetMinMaxValues(0, 100)
slider_Frenzied:SetValueStep(1)
slider_Frenzied:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Frenzied)

local color_Frenzied = "|cFFFFD100"

_G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: 20%|r")
-- 值变化时的回调函数
slider_Frenzied:SetScript("OnValueChanged", function()
    --print("Frenzied当前值:", arg1)
    MPDriudBearSaved[ConfigCurrent].Frenzied_Value = arg1
    _G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Frenzied:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Frenzied = 1
        color_Frenzied = "|cFFFFD100"
        _G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: ".. MPDriudBearSaved[ConfigCurrent].Frenzied_Value .."%|r")
    else
        MPDriudBearSaved[ConfigCurrent].Frenzied = 0
        color_Frenzied = "|cFF888888"
        _G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: ".. MPDriudBearSaved[ConfigCurrent].Frenzied_Value .."%|r")
    end
end)



postion_y = postion_y-40





-- 创建单选框 - 狂暴
local checkButton_Berserk = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton_Berserk", 340, postion_y, "自动 狂暴")

local slider_Berserk = CreateFrame("Slider", ADDON_NAME.."Slider_Berserk", checkButton_Berserk, "OptionsSliderTemplate")
slider_Berserk:SetPoint("RIGHT", checkButton_Berserk, "RIGHT", 250, -2)
slider_Berserk:SetWidth(150) -- 拖动条长度
slider_Berserk:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Berserk:SetMinMaxValues(0, 100)
slider_Berserk:SetValueStep(1)
slider_Berserk:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Berserk)

local color_Berserk = "|cFFFFD100"

_G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: 20%|r")
-- 值变化时的回调函数
slider_Berserk:SetScript("OnValueChanged", function()
    --print("Berserk当前值:", arg1)
    MPDriudBearSaved[ConfigCurrent].Berserk_Value = arg1
    _G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Berserk:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Berserk = 1
        color_Berserk = "|cFFFFD100"
        _G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: ".. MPDriudBearSaved[ConfigCurrent].Berserk_Value .."%|r")
    else
        MPDriudBearSaved[ConfigCurrent].Berserk = 0
        color_Berserk = "|cFF888888"
        _G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: ".. MPDriudBearSaved[ConfigCurrent].Berserk_Value .."%|r")
    end
end)





postion_y = postion_y-40





-- 创建单选框 - 树皮术
local checkButton_Barkskin = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton_Barkskin", 340, postion_y, "自动 树皮术")

local slider_Barkskin = CreateFrame("Slider", ADDON_NAME.."Slider_Barkskin", checkButton_Barkskin, "OptionsSliderTemplate")
slider_Barkskin:SetPoint("RIGHT", checkButton_Barkskin, "RIGHT", 250, -2)
slider_Barkskin:SetWidth(150) -- 拖动条长度
slider_Barkskin:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Barkskin:SetMinMaxValues(0, 100)
slider_Barkskin:SetValueStep(1)
slider_Barkskin:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Barkskin)

local color_Barkskin = "|cFFFFD100"

_G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: 20%|r")
-- 值变化时的回调函数
slider_Barkskin:SetScript("OnValueChanged", function()
    --print("Berserk当前值:", arg1)
    MPDriudBearSaved[ConfigCurrent].Barkskin_Value = arg1
    _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Barkskin:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Barkskin = 1
        color_Barkskin = "|cFFFFD100"
        _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudBearSaved[ConfigCurrent].Barkskin_Value .."%|r")
    else
        MPDriudBearSaved[ConfigCurrent].Barkskin = 0
        color_Barkskin = "|cFF888888"
        _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudBearSaved[ConfigCurrent].Barkskin_Value .."%|r")
    end
end)



postion_y = postion_y-40



-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Soulspeed = 1
    else
        MPDriudBearSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPDriudBearSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)





local myButton = MPCreateButton(CatUISettingsBearWindow, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetBearSettings(ConfigCurrent)
    MPInitBearSettings()
end)



local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsBearWindow, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsBearWindow, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsBearWindow, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsBearWindow, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsBearWindow, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsBearWindow, "TOPLEFT", 440, -44)
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
    MPInitBearSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitBearSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitBearSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsBearWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Power = 1
    else
        MPDriudBearSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved[ConfigCurrent].Pick = 1
    else
        MPDriudBearSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsBearWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsBearWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFF7D0A/beardps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local BearSettingsUIVersion = 16

function MPResetBearSettings(config)

    MPDriudBearSaved.Version = BearSettingsUIVersion

    -- 基本配置

    MPDriudBearSaved[config].Bear = 1
    MPDriudBearSaved[config].Trinket_Upper = 1
    MPDriudBearSaved[config].TUBoss = 0
    MPDriudBearSaved[config].Trinket_Below = 1
    MPDriudBearSaved[config].TBBoss = 0
    MPDriudBearSaved[config].Fury = 1
    MPDriudBearSaved[config].FuryBoss = 0
    MPDriudBearSaved[config].Swipe = 1
    MPDriudBearSaved[config].FaerieFire = 1
    MPDriudBearSaved[config].Demoralizing = 1
    MPDriudBearSaved[config].Target = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPDriudBearSaved[config].HealthStone = 1
    MPDriudBearSaved[config].HealthStone_Value = 30
    MPDriudBearSaved[config].HerbalTea = 1
    MPDriudBearSaved[config].HerbalTea_Value = 20
    MPDriudBearSaved[config].Frenzied = 0
    MPDriudBearSaved[config].Frenzied_Value = 20
    MPDriudBearSaved[config].Berserk = 0
    MPDriudBearSaved[config].Berserk_Value = 20
    MPDriudBearSaved[config].Barkskin = 0
    MPDriudBearSaved[config].Barkskin_Value = 30

    -- SuperWoW,UnitXP
    MPDriudBearSaved[config].SuperWoW = 1
    MPDriudBearSaved[config].UnitXP = 1

    MPDriudBearSaved[config].SwipeFirst = 1
    MPDriudBearSaved[config].MangleFirst = 0
    MPDriudBearSaved[config].Burst = 0
    MPDriudBearSaved[config].UnSalvation = 0
    MPDriudBearSaved[config].Soulspeed = 0
    MPDriudBearSaved[config].SoulspeedBoss = 1

    -- 通用
    MPDriudBearSaved[config].Power = 0
    MPDriudBearSaved[config].Pick = 0

end


local function InitBearSettingsPart1()
    checkButton_Bear:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Bear))
    checkButton_Frenzied:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Frenzied))
    checkButton_Berserk:SetChecked( MPToBoolean(MPDriudBearSaved[ConfigCurrent].Berserk) )
    checkButton_FaerieFire:SetChecked( MPToBoolean(MPDriudBearSaved[ConfigCurrent].FaerieFire) )
    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].TBBoss))
    checkButton_Target:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Target))
    checkButton_Demoralizing:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Demoralizing))
    checkButton_Fury:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Fury))
    checkButton_FuryBoss:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].FuryBoss))
    checkButton_Swipe:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Swipe))

    --checkButton_SuperWoW:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].SuperWoW))
    --checkButton_UnitXP:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].UnitXP))
    checkButton_SwipeFirst:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].SwipeFirst))
    checkButton_MangleFirst:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].MangleFirst))
    --checkButton_Burst:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Burst))
    checkButton_UnSalvation:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].UnSalvation))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].SoulspeedBoss))

    checkButton_Power:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].Pick))

end

function MPInitBearSettings()
    if not MPDriudBearSaved then
        MPDriudBearSaved = {}

        -- 第一套配置
        if not MPDriudBearSaved[1] then
            MPDriudBearSaved[1] = {}
            MPResetBearSettings(1)
        end

        -- 第二套配置
        if not MPDriudBearSaved[2] then
            MPDriudBearSaved[2] = {}
            MPResetBearSettings(2)
        end

        -- 第三套配置
        if not MPDriudBearSaved[3] then
            MPDriudBearSaved[3] = {}
            MPResetBearSettings(3)
        end
    end

    if MPDriudBearSaved.Version ~= BearSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[熊德宏]当前配置，这是新版插件正常数据更新！|r")
        MPDriudBearSaved[1] = {}
        MPDriudBearSaved[2] = {}
        MPDriudBearSaved[3] = {}
        MPResetBearSettings(1)
        MPResetBearSettings(2)
        MPResetBearSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitBearSettingsPart1()

    checkButton_HealthStone:SetChecked(MPToBoolean(MPDriudBearSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPDriudBearSaved[ConfigCurrent].HealthStone_Value)
    if MPDriudBearSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudBearSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudBearSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPDriudBearSaved[ConfigCurrent].HerbalTea_Value)
    if MPDriudBearSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudBearSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_Frenzied:SetChecked(MPDriudBearSaved[ConfigCurrent].Frenzied)
    slider_Frenzied:SetValue(MPDriudBearSaved[ConfigCurrent].Frenzied_Value)
    if MPDriudBearSaved[ConfigCurrent].Frenzied==1 then
        color_Frenzied = "|cFFFFD100"
    else
        color_Frenzied = "|cFF888888"
    end
    _G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: ".. MPDriudBearSaved[ConfigCurrent].Frenzied_Value .."%|r")

    checkButton_Berserk:SetChecked(MPDriudBearSaved[ConfigCurrent].Berserk)
    slider_Berserk:SetValue(MPDriudBearSaved[ConfigCurrent].Berserk_Value)
    if MPDriudBearSaved[ConfigCurrent].Berserk==1 then
        color_Berserk = "|cFFFFD100"
    else
        color_Berserk = "|cFF888888"
    end
    _G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: ".. MPDriudBearSaved[ConfigCurrent].Berserk_Value .."%|r")

    checkButton_Barkskin:SetChecked(MPDriudBearSaved[ConfigCurrent].Barkskin)
    slider_Barkskin:SetValue(MPDriudBearSaved[ConfigCurrent].Barkskin_Value)
    if MPDriudBearSaved[ConfigCurrent].Barkskin==1 then
        color_Barkskin = "|cFFFFD100"
    else
        color_Barkskin = "|cFF888888"
    end
    _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudBearSaved[ConfigCurrent].Barkskin_Value .."%|r")

end

