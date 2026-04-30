
-- 定义插件名称
local ADDON_NAME = "Settings-PriestShadow"

local ConfigCurrent = 1


-- 创建主框架
CatUISettingsPriestShadow = MPCreateFrame(ADDON_NAME.."Frame", 520, 570, "|cFFFFFFFF设置 - 暗牧|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPriestShadow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 保持暗影形态
local checkButton_Shadowform = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 暗影形态")
checkButton_Shadowform:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Shadowform = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Shadowform = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].TUBoss = 1
    else
        MPPriestShadowSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 保持 心灵之火
local checkButton_InnerFire = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 心灵之火")
checkButton_InnerFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].InnerFire = 1
    else
        MPPriestShadowSaved[ConfigCurrent].InnerFire = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].TBBoss = 1
    else
        MPPriestShadowSaved[ConfigCurrent].TBBoss = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 保持 暗言术：痛
local checkButton_Pain = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 暗言术：痛")
checkButton_Pain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Pain = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Pain = 0
    end
end)



-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Target = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 心灵震爆
local checkButton_MindBlast = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 心灵震爆")
checkButton_MindBlast:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].MindBlast = 1
    else
        MPPriestShadowSaved[ConfigCurrent].MindBlast = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 精神鞭笞
local checkButton_MindFlay = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 精神鞭笞")
checkButton_MindFlay:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].MindFlay = 1
    else
        MPPriestShadowSaved[ConfigCurrent].MindFlay = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 痛苦尖刺
local checkButton_MindSpike = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 痛苦尖刺")
checkButton_MindSpike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].MindSpike = 1
    else
        MPPriestShadowSaved[ConfigCurrent].MindSpike = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 吸血鬼的拥抱
local checkButton_Vampiric = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 吸血鬼的拥抱")
checkButton_Vampiric:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Vampiric = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Vampiric = 0
    end
end)
local checkButton_VampiricBOSS = MPCreateCheckButtonSmall(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_VampiricBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].VampiricBOSS = 1
    else
        MPPriestShadowSaved[ConfigCurrent].VampiricBOSS = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 渐隐术
local checkButton_Fade = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 渐隐术")
checkButton_Fade:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Fade = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Fade = 0
    end
end)




-- 高级



postion_y = postion_y+20

-- 添加提示内容区域
local TipText1 = CatUISettingsPriestShadow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-100


-- 创建单选框 - 二段鞭笞
local checkButton_SecondMindFlay = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 二段鞭笞 (5层易伤前)")
-- 设置点击事件
checkButton_SecondMindFlay:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].SecondMindFlay = 1
    else
        MPPriestShadowSaved[ConfigCurrent].SecondMindFlay = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

local slider_HealthStone = CreateFrame("Slider", ADDON_NAME.."Slider_HealthStone", checkButton_HealthStone, "OptionsSliderTemplate")
slider_HealthStone:SetPoint("RIGHT", checkButton_HealthStone, "RIGHT", 250, -2)
slider_HealthStone:SetWidth(150) -- 拖动条长度
slider_HealthStone:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HealthStone:SetMinMaxValues(0, 100)
slider_HealthStone:SetValueStep(1)
slider_HealthStone:SetValue(300) -- 默认值
MPCatUISliderRegionHide(slider_HealthStone)

local color_HealthStone = "|cFFFFD100"

-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPPriestShadowSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPPriestShadowSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40







-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

local slider_HerbalTea = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTea", checkButton_HerbalTea, "OptionsSliderTemplate")
slider_HerbalTea:SetPoint("RIGHT", checkButton_HerbalTea, "RIGHT", 250, -2)
slider_HerbalTea:SetWidth(150) -- 拖动条长度
slider_HerbalTea:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HerbalTea:SetMinMaxValues(0, 100)
slider_HerbalTea:SetValueStep(1)
slider_HerbalTea:SetValue(200) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTea)

local color_HerbalTea = "|cFFFFD100"

-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPriestShadowSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPPriestShadowSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40



-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

local slider_HerbalTeaMana = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTeaMana", checkButton_HerbalTeaMana, "OptionsSliderTemplate")
slider_HerbalTeaMana:SetPoint("RIGHT", checkButton_HerbalTeaMana, "RIGHT", 250, -2)
slider_HerbalTeaMana:SetWidth(150) -- 拖动条长度
slider_HerbalTeaMana:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HerbalTeaMana:SetMinMaxValues(0, 100)
slider_HerbalTeaMana:SetValueStep(1)
slider_HerbalTeaMana:SetValue(200) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTeaMana)

local color_HerbalTeaMana = "|cFFFFD100"

-- 值变化时的回调函数
slider_HerbalTeaMana:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Soulspeed = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPPriestShadowSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].RacialTraits = 1
    else
        MPPriestShadowSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPPriestShadowSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)



-- 渐隐术 等级
local slider_Fade_Value = CreateFrame("Slider", ADDON_NAME.."SliderFade_Value", CatUISettingsPriestShadow, "OptionsSliderTemplate")
slider_Fade_Value:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y+180)
slider_Fade_Value:SetWidth(220) -- 拖动条长度
slider_Fade_Value:SetHeight(16) -- 拖动条高度

slider_Fade_Value:SetMinMaxValues(1, 6)
slider_Fade_Value:SetValueStep(1)
slider_Fade_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Fade_Value)

-- 值变化时的回调函数
slider_Fade_Value:SetScript("OnValueChanged", function()
    _G[slider_Fade_Value:GetName().."Text"]:SetText("渐隐术 等级："..arg1)
    MPPriestShadowSaved[ConfigCurrent].Fade_Value = arg1
end)






-- 创建按钮
local myButton = MPCreateButton(CatUISettingsPriestShadow, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetPriestShadowSettings(ConfigCurrent)
    MPInitPriestShadowSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsPriestShadow, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsPriestShadow, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsPriestShadow, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 440, -44)
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
    MPInitPriestShadowSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitPriestShadowSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitPriestShadowSettings()
end)



local MLDButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPriestShadow, "UIPanelButtonTemplate")
MLDButton:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 340, postion_y+70)
MLDButton:SetWidth(120)
MLDButton:SetHeight(22)
MLDButton:SetFont("Fonts\\FRIZQT__.TTF", 12)
MLDButton:SetText("多线DOT设置")

-- 调整按钮纹理
MLDButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
MLDButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
MLDButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
MLDButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
-- 按钮点击事件
MLDButton:SetScript("OnClick", function()
    MPCatSettingsCloseAll() 
    CatUISettingsMultilineDot:Show()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsPriestShadow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Power = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved[ConfigCurrent].Pick = 1
    else
        MPPriestShadowSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)

-- 添加提示内容区域
local TipText = CatUISettingsPriestShadow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPriestShadow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFFFFFF/amdps|r [ 1 | 2 | 3 ]   多线Dot |cFFFFFFFF/MDot|r")



-- 配置文件版本号
local PriestShadowSettingsUIVersion = 10

function MPResetPriestShadowSettings(config)

    MPPriestShadowSaved.Version = PriestShadowSettingsUIVersion

    -- 基本配置

    MPPriestShadowSaved[config].Shadowform = 1
    MPPriestShadowSaved[config].InnerFire = 1

    MPPriestShadowSaved[config].MindBlast = 1
    MPPriestShadowSaved[config].Pain = 1
    MPPriestShadowSaved[config].MindFlay = 1
    MPPriestShadowSaved[config].MindSpike = 0
    MPPriestShadowSaved[config].Vampiric = 0
    MPPriestShadowSaved[config].Fade = 0

    MPPriestShadowSaved[config].Trinket_Upper = 1
    MPPriestShadowSaved[config].TUBoss = 0
    MPPriestShadowSaved[config].Trinket_Below = 1
    MPPriestShadowSaved[config].TBBoss = 0
    MPPriestShadowSaved[config].Target = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPPriestShadowSaved[config].HealthStone = 1
    MPPriestShadowSaved[config].HealthStone_Value = 30
    MPPriestShadowSaved[config].HerbalTea = 1
    MPPriestShadowSaved[config].HerbalTea_Value = 20
    MPPriestShadowSaved[config].HerbalTeaMana = 0
    MPPriestShadowSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPPriestShadowSaved[config].SuperWoW = 1
    MPPriestShadowSaved[config].UnitXP = 1

    MPPriestShadowSaved[config].SecondMindFlay = 0
    MPPriestShadowSaved[config].VampiricBOSS = 0

    MPPriestShadowSaved[config].Fade_Value = 6
    MPPriestShadowSaved[config].RacialTraits = 0
    MPPriestShadowSaved[config].RacialTraitsBoss = 1
    MPPriestShadowSaved[config].Soulspeed = 0
    MPPriestShadowSaved[config].SoulspeedBoss = 1

    -- 通用
    MPPriestShadowSaved[config].Power = 0
    MPPriestShadowSaved[config].Pick = 0

end

local function MPInitPriestShadowSettingsPart1()
    checkButton_Shadowform:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Shadowform))
    checkButton_InnerFire:SetChecked( MPToBoolean(MPPriestShadowSaved[ConfigCurrent].InnerFire) )
    checkButton_MindBlast:SetChecked( MPToBoolean(MPPriestShadowSaved[ConfigCurrent].MindBlast) )
    checkButton_Pain:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Pain))
    checkButton_MindFlay:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].MindFlay))
    checkButton_MindSpike:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].MindSpike))
    checkButton_Vampiric:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Vampiric))
    checkButton_Fade:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Fade))

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].TBBoss))
    checkButton_Target:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Target))

    checkButton_SecondMindFlay:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].SecondMindFlay))
    checkButton_VampiricBOSS:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].VampiricBOSS))
    checkButton_RacialTraits:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].SoulspeedBoss))
end

function MPInitPriestShadowSettings()
    if not MPPriestShadowSaved then
        MPPriestShadowSaved = {}

        -- 第一套配置
        if not MPPriestShadowSaved[1] then
            MPPriestShadowSaved[1] = {}
            MPResetPriestShadowSettings(1)
        end

        -- 第二套配置
        if not MPPriestShadowSaved[2] then
            MPPriestShadowSaved[2] = {}
            MPResetPriestShadowSettings(2)
        end

        -- 第三套配置
        if not MPPriestShadowSaved[3] then
            MPPriestShadowSaved[3] = {}
            MPResetPriestShadowSettings(3)
        end
    end

    if MPPriestShadowSaved.Version ~= PriestShadowSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[暗牧宏]当前配置，这是新版插件正常数据更新！|r")
        MPPriestShadowSaved[1] = {}
        MPPriestShadowSaved[2] = {}
        MPPriestShadowSaved[3] = {}
        MPResetPriestShadowSettings(1)
        MPResetPriestShadowSettings(2)
        MPResetPriestShadowSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    MPInitPriestShadowSettingsPart1()

    checkButton_HealthStone:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPPriestShadowSaved[ConfigCurrent].HealthStone_Value)
    if MPPriestShadowSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestShadowSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPriestShadowSaved[ConfigCurrent].HerbalTea_Value)
    if MPPriestShadowSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestShadowSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPriestShadowSaved[ConfigCurrent].HerbalTea_Value)
    if MPPriestShadowSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestShadowSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")

    slider_Fade_Value:SetValue(MPPriestShadowSaved[ConfigCurrent].Fade_Value)

    checkButton_Power:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPPriestShadowSaved[ConfigCurrent].Pick))

end

