
-- 定义插件名称
local ADDON_NAME = "Settings-PriestDiscipline"

local ConfigCurrent = 1


-- 创建主框架
CatUISettingsPriestDiscipline = MPCreateFrame(ADDON_NAME.."Frame", 520, 460, "|cFFFFFFFF设置 - 戒律牧|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPriestDiscipline:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 保持神圣之火
local checkButton_HolyFire = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "保持 神圣之火")
checkButton_HolyFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].HolyFire = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].HolyFire = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].TUBoss = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 保持 心灵之火
local checkButton_InnerFire = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "保持 心灵之火")
checkButton_InnerFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].InnerFire = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].InnerFire = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].TBBoss = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].TBBoss = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 保持 痛
local checkButton_Pain = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "保持 暗言术：痛")
checkButton_Pain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Pain = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Pain = 0
    end
end)




-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Target = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Target = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 惩击
local checkButton_Smite = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "开启 惩击")
checkButton_Smite:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Smite = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Smite = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 责罚
local checkButton_Chastise = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "开启 责罚")
checkButton_Chastise:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Chastise = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Chastise = 0
    end
end)









-- 高级



postion_y = postion_y+5

-- 添加提示内容区域
local TipText1 = CatUISettingsPriestDiscipline:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-80


-- 创建单选框 - 启发对自己
local checkButton_InspireMyself = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "启发 对 自己使用")
checkButton_InspireMyself:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].InspireMyself = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].InspireMyself = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPPriestDisciplineSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPPriestDisciplineSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 责罚对自己
local checkButton_ChastiseMyself = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "责罚 对 自己使用")
checkButton_ChastiseMyself:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].ChastiseMyself = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].ChastiseMyself = 0
    end
end)




-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPPriestDisciplineSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPPriestDisciplineSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40






-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Soulspeed = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)



postion_y = postion_y-40

-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].RacialTraits = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)



--[[
-- 渐隐术 等级
local slider_Fade_Value = CreateFrame("Slider", ADDON_NAME.."SliderFade_Value", CatUISettingsPriestDiscipline, "OptionsSliderTemplate")
slider_Fade_Value:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 20, postion_y+80)
slider_Fade_Value:SetWidth(220) -- 拖动条长度
slider_Fade_Value:SetHeight(16) -- 拖动条高度

slider_Fade_Value:SetMinMaxValues(1, 6)
slider_Fade_Value:SetValueStep(1)
slider_Fade_Value:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Fade_Value)

-- 值变化时的回调函数
slider_Fade_Value:SetScript("OnValueChanged", function()
    _G[slider_Fade_Value:GetName().."Text"]:SetText("渐隐术 等级："..arg1)
    MPPriestDisciplineSaved[ConfigCurrent].Fade_Value = arg1
end)
]]





-- 创建按钮
local myButton = MPCreateButton(CatUISettingsPriestDiscipline, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetPriestDisciplineSettings(ConfigCurrent)
    MPInitPriestDisciplineSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsPriestDiscipline, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsPriestDiscipline, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsPriestDiscipline, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 440, -44)
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
    MPInitPriestDisciplineSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitPriestDisciplineSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitPriestDisciplineSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsPriestDiscipline)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Power = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved[ConfigCurrent].Pick = 1
    else
        MPPriestDisciplineSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsPriestDiscipline:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPriestDiscipline, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFFFFFF/JLdps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local PriestDisciplineSettingsUIVersion = 9

function MPResetPriestDisciplineSettings(config)

    MPPriestDisciplineSaved.Version = PriestDisciplineSettingsUIVersion

    -- 基本配置

    MPPriestDisciplineSaved[config].HolyFire = 1
    MPPriestDisciplineSaved[config].InnerFire = 1
    MPPriestDisciplineSaved[config].Pain = 0

    MPPriestDisciplineSaved[config].Smite = 1
    MPPriestDisciplineSaved[config].Chastise = 0

    MPPriestDisciplineSaved[config].Trinket_Upper = 1
    MPPriestDisciplineSaved[config].TUBoss = 0
    MPPriestDisciplineSaved[config].Trinket_Below = 1
    MPPriestDisciplineSaved[config].TBBoss = 0
    MPPriestDisciplineSaved[config].Target = 0



    MPPriestDisciplineSaved[config].InspireMyself = 0
    MPPriestDisciplineSaved[config].ChastiseMyself = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPPriestDisciplineSaved[config].HealthStone = 1
    MPPriestDisciplineSaved[config].HealthStone_Value = 30
    MPPriestDisciplineSaved[config].HerbalTea = 1
    MPPriestDisciplineSaved[config].HerbalTea_Value = 20
    MPPriestDisciplineSaved[config].HerbalTeaMana = 0
    MPPriestDisciplineSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPPriestDisciplineSaved[config].SuperWoW = 1
    MPPriestDisciplineSaved[config].UnitXP = 1

    --MPPriestDisciplineSaved[config].Fade_Value = 6
    MPPriestDisciplineSaved[config].RacialTraits = 0
    MPPriestDisciplineSaved[config].RacialTraitsBoss = 1
    MPPriestDisciplineSaved[config].Soulspeed = 0
    MPPriestDisciplineSaved[config].SoulspeedBoss = 1

    -- 通用
    MPPriestDisciplineSaved[config].Power = 0
    MPPriestDisciplineSaved[config].Pick = 0

end


function MPInitPriestDisciplineSettings()
    if not MPPriestDisciplineSaved then
        MPPriestDisciplineSaved = {}

        -- 第一套配置
        if not MPPriestDisciplineSaved[1] then
            MPPriestDisciplineSaved[1] = {}
            MPResetPriestDisciplineSettings(1)
        end

        -- 第二套配置
        if not MPPriestDisciplineSaved[2] then
            MPPriestDisciplineSaved[2] = {}
            MPResetPriestDisciplineSettings(2)
        end

        -- 第三套配置
        if not MPPriestDisciplineSaved[3] then
            MPPriestDisciplineSaved[3] = {}
            MPResetPriestDisciplineSettings(3)
        end
    end

    if MPPriestDisciplineSaved.Version ~= PriestDisciplineSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[戒律牧宏]当前配置，这是新版插件正常数据更新！|r")
        MPPriestDisciplineSaved[1] = {}
        MPPriestDisciplineSaved[2] = {}
        MPPriestDisciplineSaved[3] = {}
        MPResetPriestDisciplineSettings(1)
        MPResetPriestDisciplineSettings(2)
        MPResetPriestDisciplineSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)


    checkButton_HolyFire:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].HolyFire))
    checkButton_InnerFire:SetChecked( MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].InnerFire) )
    checkButton_Pain:SetChecked( MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Pain) )
    checkButton_Smite:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Smite))
    checkButton_Chastise:SetChecked( MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Chastise) )

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].TBBoss))
    checkButton_Target:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Target))

    checkButton_ChastiseMyself:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].ChastiseMyself))
    checkButton_InspireMyself:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].InspireMyself))
    checkButton_RacialTraits:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].SoulspeedBoss))

    checkButton_HealthStone:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPPriestDisciplineSaved[ConfigCurrent].HealthStone_Value)
    if MPPriestDisciplineSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestDisciplineSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPriestDisciplineSaved[ConfigCurrent].HerbalTea_Value)
    if MPPriestDisciplineSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestDisciplineSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPriestDisciplineSaved[ConfigCurrent].HerbalTea_Value)
    if MPPriestDisciplineSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestDisciplineSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")

    --slider_Fade_Value:SetValue(MPPriestDisciplineSaved[ConfigCurrent].Fade_Value)

    checkButton_Power:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPPriestDisciplineSaved[ConfigCurrent].Pick))

end

