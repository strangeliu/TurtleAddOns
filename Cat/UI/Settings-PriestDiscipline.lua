
-- 定义插件名称
local ADDON_NAME = "Settings-PriestDiscipline"



-- 创建主框架
CatUISettingsPriestDiscipline = MPCreateFrame(ADDON_NAME.."Frame", 520, 440, "|cFFFFFFFF设置 - 戒律牧|r")

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
        MPPriestDisciplineSaved.HolyFire = 1
    else
        MPPriestDisciplineSaved.HolyFire = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.Trinket_Upper = 1
    else
        MPPriestDisciplineSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.TUBoss = 1
    else
        MPPriestDisciplineSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 保持 心灵之火
local checkButton_InnerFire = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "保持 心灵之火")
checkButton_InnerFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.InnerFire = 1
    else
        MPPriestDisciplineSaved.InnerFire = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.Trinket_Below = 1
    else
        MPPriestDisciplineSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.TBBoss = 1
    else
        MPPriestDisciplineSaved.TBBoss = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 保持 痛
local checkButton_Pain = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "保持 暗言术：痛")
checkButton_Pain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.Pain = 1
    else
        MPPriestDisciplineSaved.Pain = 0
    end
end)




-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.Target = 1
    else
        MPPriestDisciplineSaved.Target = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 惩击
local checkButton_Smite = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "开启 惩击")
checkButton_Smite:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.Smite = 1
    else
        MPPriestDisciplineSaved.Smite = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 责罚
local checkButton_Chastise = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "开启 责罚")
checkButton_Chastise:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.Chastise = 1
    else
        MPPriestDisciplineSaved.Chastise = 0
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


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "自动开启 种族天赋 (爆发类)")
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.RacialTraits = 1
    else
        MPPriestDisciplineSaved.RacialTraits = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsPriestDiscipline, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 340, postion_y)
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
    MPPriestDisciplineSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestDisciplineSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestDisciplineSaved.HealthStone_Value .."%|r")
    else
        MPPriestDisciplineSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestDisciplineSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 启发对自己
local checkButton_InspireMyself = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "启发 对 自己使用")
checkButton_InspireMyself:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.InspireMyself = 1
    else
        MPPriestDisciplineSaved.InspireMyself = 0
    end
end)




-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsPriestDiscipline, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 340, postion_y)
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
    MPPriestDisciplineSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved.HerbalTea_Value .."%|r")
    else
        MPPriestDisciplineSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 责罚对自己
local checkButton_ChastiseMyself = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, postion_y, "责罚 对 自己使用")
checkButton_ChastiseMyself:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.ChastiseMyself = 1
    else
        MPPriestDisciplineSaved.ChastiseMyself = 0
    end
end)




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsPriestDiscipline, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 340, postion_y)
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
    MPPriestDisciplineSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestDisciplineSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestDisciplineSaved.HerbalTeaMana_Value .."%|r")
    else
        MPPriestDisciplineSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestDisciplineSaved.HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.Soulspeed = 1
    else
        MPPriestDisciplineSaved.Soulspeed = 0
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
slider_Fade_Value:SetValue(6) -- 默认值
MPCatUISliderRegionHide(slider_Fade_Value)

_G[slider_Fade_Value:GetName().."Text"]:SetText("渐隐术 等级：6")

-- 值变化时的回调函数
slider_Fade_Value:SetScript("OnValueChanged", function()
    _G[slider_Fade_Value:GetName().."Text"]:SetText("渐隐术 等级："..arg1)
    MPPriestDisciplineSaved.Fade_Value = arg1
end)
]]





-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPriestDiscipline, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsPriestDiscipline, "TOPLEFT", 120, -44)
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
    MPResetPriestDisciplineSettings()
    MPInitPriestDisciplineSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsPriestDiscipline)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPriestDiscipline, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestDisciplineSaved.Power = 1
    else
        MPPriestDisciplineSaved.Power = 0
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
        MPPriestDisciplineSaved.Pick = 1
    else
        MPPriestDisciplineSaved.Pick = 0
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
TipText:SetText("宏命令 -  [ |cFFFFFFFF/JLdps|r ]")



-- 配置文件版本号
local PriestDisciplineSettingsUIVersion = 7

function MPResetPriestDisciplineSettings()

    MPPriestDisciplineSaved.Version = PriestDisciplineSettingsUIVersion

    -- 基本配置

    MPPriestDisciplineSaved.HolyFire = 1
    MPPriestDisciplineSaved.InnerFire = 1
    MPPriestDisciplineSaved.Pain = 0

    MPPriestDisciplineSaved.Smite = 1
    MPPriestDisciplineSaved.Chastise = 0

    MPPriestDisciplineSaved.Trinket_Upper = 1
    MPPriestDisciplineSaved.TUBoss = 0
    MPPriestDisciplineSaved.Trinket_Below = 1
    MPPriestDisciplineSaved.TBBoss = 0
    MPPriestDisciplineSaved.Target = 0



    MPPriestDisciplineSaved.RacialTraits = 0
    MPPriestDisciplineSaved.InspireMyself = 0
    MPPriestDisciplineSaved.ChastiseMyself = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPPriestDisciplineSaved.HealthStone = 1
    MPPriestDisciplineSaved.HealthStone_Value = 30
    MPPriestDisciplineSaved.HerbalTea = 1
    MPPriestDisciplineSaved.HerbalTea_Value = 20
    MPPriestDisciplineSaved.HerbalTeaMana = 0
    MPPriestDisciplineSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPPriestDisciplineSaved.SuperWoW = 1
    MPPriestDisciplineSaved.UnitXP = 1

    --MPPriestDisciplineSaved.Fade_Value = 6
    MPPriestDisciplineSaved.Soulspeed = 0

    -- 通用
    MPPriestDisciplineSaved.Power = 0
    MPPriestDisciplineSaved.Pick = 0

end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end


function MPInitPriestDisciplineSettings()
    if not MPPriestDisciplineSaved then
        MPPriestDisciplineSaved = {}
        MPResetPriestDisciplineSettings()
    end

    if MPPriestDisciplineSaved.Version ~= PriestDisciplineSettingsUIVersion then
        MPResetPriestDisciplineSettings()
    end

    checkButton_HolyFire:SetChecked(ToBoolean(MPPriestDisciplineSaved.HolyFire))
    checkButton_InnerFire:SetChecked( ToBoolean(MPPriestDisciplineSaved.InnerFire) )
    checkButton_Pain:SetChecked( ToBoolean(MPPriestDisciplineSaved.Pain) )
    checkButton_Smite:SetChecked(ToBoolean(MPPriestDisciplineSaved.Smite))
    checkButton_Chastise:SetChecked( ToBoolean(MPPriestDisciplineSaved.Chastise) )

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPPriestDisciplineSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPPriestDisciplineSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPPriestDisciplineSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPPriestDisciplineSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPPriestDisciplineSaved.Target))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPPriestDisciplineSaved.RacialTraits))
    checkButton_ChastiseMyself:SetChecked(ToBoolean(MPPriestDisciplineSaved.ChastiseMyself))
    checkButton_InspireMyself:SetChecked(ToBoolean(MPPriestDisciplineSaved.InspireMyself))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPPriestDisciplineSaved.Soulspeed))

    checkButton_HealthStone:SetChecked(ToBoolean(MPPriestDisciplineSaved.HealthStone))
    slider_HealthStone:SetValue(MPPriestDisciplineSaved.HealthStone_Value)
    if MPPriestDisciplineSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestDisciplineSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestDisciplineSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPriestDisciplineSaved.HerbalTea_Value)
    if MPPriestDisciplineSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestDisciplineSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPriestDisciplineSaved.HerbalTea_Value)
    if MPPriestDisciplineSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestDisciplineSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPriestDisciplineSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPriestDisciplineSaved.HerbalTeaMana_Value)
    if MPPriestDisciplineSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestDisciplineSaved.HerbalTeaMana_Value .."%|r")

    --slider_Fade_Value:SetValue(MPPriestDisciplineSaved.Fade_Value)

    checkButton_Power:SetChecked(ToBoolean(MPPriestDisciplineSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPPriestDisciplineSaved.Pick))

end

