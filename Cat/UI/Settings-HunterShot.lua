-- 定义插件名称
local ADDON_NAME = "Settings-HunterShot"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsHunterShot = MPCreateFrame(ADDON_NAME.."Frame", 520, 590, "|cFFABD473设置 - 射击猎|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsHunterShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 雄鹰守护​
local checkButton_Hawk = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_Hawk:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_Hawk:SetScale(0.8)

-- 添加文字标签
local checkText_Hawk = checkButton_Hawk:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Hawk:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Hawk:SetTextColor(1, 1, 1)
checkText_Hawk:SetPoint("LEFT", checkButton_Hawk, "LEFT", 34, 1)
checkText_Hawk:SetText("保持 雄鹰守护​")

-- 设置点击事件
checkButton_Hawk:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Hawk = 1
    else
        MPHunterShotSaved.Hawk = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
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
        MPHunterShotSaved.Trinket_Upper = 1
    else
        MPHunterShotSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsHunterShot, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.TUBoss = 1
    else
        MPHunterShotSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 强击光环​
local checkButton_Trueshot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_Trueshot:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_Trueshot:SetScale(0.8)

-- 添加文字标签
local checkText_Trueshot = checkButton_Trueshot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Trueshot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Trueshot:SetTextColor(1, 1, 1)
checkText_Trueshot:SetPoint("LEFT", checkButton_Trueshot, "LEFT", 34, 1)
checkText_Trueshot:SetText("保持 强击光环")

-- 设置点击事件
checkButton_Trueshot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Trueshot = 1
    else
        MPHunterShotSaved.Trueshot = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
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
        MPHunterShotSaved.Trinket_Below = 1
    else
        MPHunterShotSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsHunterShot, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.TBBoss = 1
    else
        MPHunterShotSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 猎人印记
local checkButton_Mark = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_Mark:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_Mark:SetScale(0.8)

-- 添加文字标签
local checkText_Mark = checkButton_Mark:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Mark:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Mark:SetTextColor(1, 1, 1)
checkText_Mark:SetPoint("LEFT", checkButton_Mark, "LEFT", 34, 1)
checkText_Mark:SetText("保持 猎人印记")

-- 设置点击事件
checkButton_Mark:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Mark = 1
    else
        MPHunterShotSaved.Mark = 0
    end
end)

local checkButton_MarkBossOnly = MPCreateCheckButtonSmall(CatUISettingsHunterShot, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_MarkBossOnly:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.MarkBossOnly = 1
    else
        MPHunterShotSaved.MarkBossOnly = 0
    end
end)


-- 创建单选框 - 自动锁敌 近
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
checkButton_Target:SetScale(0.8)

-- 添加文字标签
local checkText_Target = checkButton_Target:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Target:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Target:SetTextColor(1, 1, 1)
checkText_Target:SetPoint("LEFT", checkButton_Target, "LEFT", 34, 1)
checkText_Target:SetText("自动锁敌 (攻击|cFF33BB33最近|r的敌人)")



postion_y = postion_y-30

-- 创建单选框 - 瞄准射击
local checkButton_AimedShot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_AimedShot:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_AimedShot:SetScale(0.8)

-- 添加文字标签
local checkText_AimedShot = checkButton_AimedShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_AimedShot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_AimedShot:SetTextColor(1, 1, 1)
checkText_AimedShot:SetPoint("LEFT", checkButton_AimedShot, "LEFT", 34, 1)
checkText_AimedShot:SetText("开启 瞄准射击 (主技能)")

-- 设置点击事件
checkButton_AimedShot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.AimedShot = 1
    else
        MPHunterShotSaved.AimedShot = 0
    end
end)


-- 创建单选框 - 自动锁敌 远
local checkButton_Distant = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_Distant:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
checkButton_Distant:SetScale(0.8)

-- 添加文字标签
local checkText_Distant = checkButton_Distant:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Distant:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Distant:SetTextColor(1, 1, 1)
checkText_Distant:SetPoint("LEFT", checkButton_Distant, "LEFT", 34, 1)
checkText_Distant:SetText("自动锁敌 (攻击|cFFDDBB33最远|r的敌人)")

-- 设置点击事件 近
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Target = 1
        MPHunterShotSaved.Distant = 0
    else
        MPHunterShotSaved.Target = 0
    end
    checkButton_Target:SetChecked(ToBoolean(MPHunterShotSaved.Target))
    checkButton_Distant:SetChecked(ToBoolean(MPHunterShotSaved.Distant))
end)

-- 设置点击事件 远
checkButton_Distant:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Distant = 1
        MPHunterShotSaved.Target = 0
    else
        MPHunterShotSaved.Distant = 0
    end
    checkButton_Target:SetChecked(ToBoolean(MPHunterShotSaved.Target))
    checkButton_Distant:SetChecked(ToBoolean(MPHunterShotSaved.Distant))
end)



postion_y = postion_y-30

-- 创建单选框 - 多重射击
local checkButton_MultiShot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_MultiShot:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_MultiShot:SetScale(0.8)

-- 添加文字标签
local checkText_MultiShot = checkButton_MultiShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_MultiShot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_MultiShot:SetTextColor(1, 1, 1)
checkText_MultiShot:SetPoint("LEFT", checkButton_MultiShot, "LEFT", 34, 1)
checkText_MultiShot:SetText("开启 多重射击")

-- 设置点击事件
checkButton_MultiShot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.MultiShot = 1
    else
        MPHunterShotSaved.MultiShot = 0
    end
end)

-- 创建单选框 - 宠物自动攻击
local checkButton_PetAttack = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_PetAttack:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
checkButton_PetAttack:SetScale(0.8)

-- 添加文字标签
local checkText_PetAttack = checkButton_PetAttack:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_PetAttack:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_PetAttack:SetTextColor(1, 1, 1)
checkText_PetAttack:SetPoint("LEFT", checkButton_PetAttack, "LEFT", 34, 1)
checkText_PetAttack:SetText("宠物自动攻击")

-- 设置点击事件
checkButton_PetAttack:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.PetAttack = 1
    else
        MPHunterShotSaved.PetAttack = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 奥术射击
local checkButton_ArcaneShot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_ArcaneShot:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_ArcaneShot:SetScale(0.8)

-- 添加文字标签
local checkText_ArcaneShot = checkButton_ArcaneShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ArcaneShot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ArcaneShot:SetTextColor(1, 1, 1)
checkText_ArcaneShot:SetPoint("LEFT", checkButton_ArcaneShot, "LEFT", 34, 1)
checkText_ArcaneShot:SetText("开启 奥术射击")

-- 设置点击事件
checkButton_ArcaneShot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.ArcaneShot = 1
    else
        MPHunterShotSaved.ArcaneShot = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - ​​毒蛇钉刺
local checkButton_SerpentSting = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonSerpentSting ", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_SerpentSting:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_SerpentSting:SetScale(0.8)

-- 添加文字标签
local checkText_SerpentSting = checkButton_SerpentSting:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SerpentSting:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SerpentSting:SetTextColor(1, 1, 1)
checkText_SerpentSting:SetPoint("LEFT", checkButton_SerpentSting, "LEFT", 34, 1)
checkText_SerpentSting:SetText("保持 ​​毒蛇钉刺 (钉刺仅单选)")



-- 创建单选框 - 近身 猛禽一击
local checkButton_RaptorStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_RaptorStrike:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
checkButton_RaptorStrike:SetScale(0.8)

-- 添加文字标签
local checkText_RaptorStrike = checkButton_RaptorStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_RaptorStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_RaptorStrike:SetTextColor(1, 1, 1)
checkText_RaptorStrike:SetPoint("LEFT", checkButton_RaptorStrike, "LEFT", 34, 1)
checkText_RaptorStrike:SetText("近身 猛禽一击 (UnitXP模组)")

-- 设置点击事件
checkButton_RaptorStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.RaptorStrike = 1
    else
        MPHunterShotSaved.RaptorStrike = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - ​​蝰蛇钉刺
local checkButton_ViperSting = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonViperSting", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_ViperSting:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_ViperSting:SetScale(0.8)

-- 添加文字标签
local checkText_ViperSting = checkButton_ViperSting:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ViperSting:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ViperSting:SetTextColor(1, 1, 1)
checkText_ViperSting:SetPoint("LEFT", checkButton_ViperSting, "LEFT", 34, 1)
checkText_ViperSting:SetText("保持 ​​蝰蛇钉刺 (钉刺仅单选)")


-- 创建单选框 - 近身 猫鼬撕咬
local checkButton_MeerkatsBiting = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_MeerkatsBiting:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
checkButton_MeerkatsBiting:SetScale(0.8)

-- 添加文字标签
local checkText_MeerkatsBiting = checkButton_MeerkatsBiting:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_MeerkatsBiting:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_MeerkatsBiting:SetTextColor(1, 1, 1)
checkText_MeerkatsBiting:SetPoint("LEFT", checkButton_MeerkatsBiting, "LEFT", 34, 1)
checkText_MeerkatsBiting:SetText("近身 猫鼬撕咬 (UnitXP模组)")

-- 设置点击事件
checkButton_MeerkatsBiting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.MeerkatsBiting = 1
    else
        MPHunterShotSaved.MeerkatsBiting = 0
    end
end)




-- 毒蛇钉刺点击事件
checkButton_SerpentSting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Serpent = 1
        MPHunterShotSaved.Viper = 0
    else
        MPHunterShotSaved.Serpent = 0
    end
    checkButton_SerpentSting:SetChecked(ToBoolean(MPHunterShotSaved.Serpent))
    checkButton_ViperSting:SetChecked(ToBoolean(MPHunterShotSaved.Viper))

end)
-- 蝰蛇钉刺点击事件
checkButton_ViperSting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Viper = 1
        MPHunterShotSaved.Serpent = 0
    else
        MPHunterShotSaved.Viper = 0
    end
    checkButton_SerpentSting:SetChecked(ToBoolean(MPHunterShotSaved.Serpent))
    checkButton_ViperSting:SetChecked(ToBoolean(MPHunterShotSaved.Viper))

end)



-- 添加文字标签
local checkText_Help = CatUISettingsHunterShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Help:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_Help:SetTextColor(1, 1, 1)
checkText_Help:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkText_Help:SetText("|cFFDD4080关键配置：|r需将【自动射击】拖出至任意技能栏里。")




postion_y = postion_y-30






-- 高级


postion_y = postion_y-10

-- 添加提示内容区域
local TipText1 = CatUISettingsHunterShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-110


-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
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
        MPHunterShotSaved.RacialTraits = 1
    else
        MPHunterShotSaved.RacialTraits = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
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
    MPHunterShotSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterShotSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterShotSaved.HealthStone_Value .."%|r")
    else
        MPHunterShotSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterShotSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 预读 瞄准射击
local checkButton_FirstAimedShot = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_FirstAimedShot:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_FirstAimedShot:SetScale(0.8)

-- 添加文字标签
local checkText_FirstAimedShot = checkButton_FirstAimedShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FirstAimedShot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FirstAimedShot:SetTextColor(1, 1, 1)
checkText_FirstAimedShot:SetPoint("LEFT", checkButton_FirstAimedShot, "LEFT", 34, 1)
checkText_FirstAimedShot:SetText("进战斗前预读 瞄准射击")

-- 设置点击事件
checkButton_FirstAimedShot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.FirstAimedShot = 1
    else
        MPHunterShotSaved.FirstAimedShot = 0
    end
end)





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
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
    MPHunterShotSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterShotSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterShotSaved.HerbalTea_Value .."%|r")
    else
        MPHunterShotSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterShotSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 蝰蛇守护
local checkButton_ViperGuardian = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_ViperGuardian", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_ViperGuardian:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y)
checkButton_ViperGuardian:SetScale(0.8)

-- 添加文字标签
local checkText_ViperGuardian = checkButton_ViperGuardian:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ViperGuardian:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ViperGuardian:SetTextColor(1, 1, 1)
checkText_ViperGuardian:SetPoint("LEFT", checkButton_ViperGuardian, "LEFT", 34, 1)
checkText_ViperGuardian:SetText("自动 蝰蛇守护")


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

_G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < 1000|r")
_G[slider_ViperGuardian:GetName().."Low"]:Hide()
_G[slider_ViperGuardian:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_ViperGuardian:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPHunterShotSaved.Viper_Value = arg1
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterShotSaved.Viper_Value .."|r")
end)
-- 设置点击事件
checkButton_ViperGuardian:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.ViperGuardian = 1
        color_ViperGuardian = "|cFFFFD100"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterShotSaved.Viper_Value .."|r")
    else
        MPHunterShotSaved.ViperGuardian = 0
        color_ViperGuardian = "|cFF888888"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterShotSaved.Viper_Value .."|r")
    end
end)




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsHunterShot, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 340, postion_y)
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
    MPHunterShotSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterShotSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterShotSaved.HerbalTeaMana_Value .."%|r")
    else
        MPHunterShotSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterShotSaved.HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 稳固节点
local slider_SteadyShot = CreateFrame("Slider", ADDON_NAME.."SliderSteadyShot", CatUISettingsHunterShot, "OptionsSliderTemplate")
slider_SteadyShot:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 20, postion_y+90)
slider_SteadyShot:SetWidth(220) -- 拖动条长度
slider_SteadyShot:SetHeight(16) -- 拖动条高度

slider_SteadyShot:SetMinMaxValues(0.8, 3)
slider_SteadyShot:SetValueStep(0.1)
slider_SteadyShot:SetValue(1.5) -- 默认值
MPCatUISliderRegionHide(slider_SteadyShot)

_G[slider_SteadyShot:GetName().."Text"]:SetText("")
_G[slider_SteadyShot:GetName().."Low"]:Hide()
_G[slider_SteadyShot:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_SteadyShot:SetScript("OnValueChanged", function()
    MPHunterShotSaved.SteadyShot_Value = arg1

    _G[slider_SteadyShot:GetName().."Text"]:SetText("稳固 >"..string.format("%.1f", arg1).."秒 下一次平射前")
end)



-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsHunterShot, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Soulspeed = 1
    else
        MPHunterShotSaved.Soulspeed = 0
    end
end)


postion_y = postion_y - 40

-- 急速射击
local checkButton_RapidFire = MPCreateCheckButton(CatUISettingsHunterShot, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 急速射击")
checkButton_RapidFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.RapidFire = 1
    else
        MPHunterShotSaved.RapidFire = 0
    end
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsHunterShot, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsHunterShot, "TOPLEFT", 120, -44)
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
    MPResetHunterShotSettings()
    MPInitHunterShotSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsHunterShot)

local checkButton_Power = MPPublicCheckButton(CatUISettingsHunterShot, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Power = 1
    else
        MPHunterShotSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsHunterShot, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsHunterShot, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterShotSaved.Pick = 1
    else
        MPHunterShotSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsHunterShot, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsHunterShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsHunterShot, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFFABD473/sjdps|r ]")



-- 配置文件版本号
local HunterShotSettingsUIVersion = 22

function MPResetHunterShotSettings()

    MPHunterShotSaved.Version = HunterShotSettingsUIVersion

    -- 基本配置

    MPHunterShotSaved.Hawk = 1
    MPHunterShotSaved.Trueshot = 1
    MPHunterShotSaved.Mark = 0
    MPHunterShotSaved.MarkBossOnly = 0
    MPHunterShotSaved.AimedShot = 1
    MPHunterShotSaved.MultiShot = 1
    MPHunterShotSaved.ArcaneShot = 1
    MPHunterShotSaved.Serpent = 1
    MPHunterShotSaved.Viper = 0

    MPHunterShotSaved.Trinket_Upper = 1
    MPHunterShotSaved.TUBoss = 0
    MPHunterShotSaved.Trinket_Below = 1
    MPHunterShotSaved.TBBoss = 0
    MPHunterShotSaved.Target = 0
    MPHunterShotSaved.Distant = 0
    MPHunterShotSaved.PetAttack = 0

    MPHunterShotSaved.RaptorStrike = 1
    MPHunterShotSaved.MeerkatsBiting = 1

    -- 高级配置

    -- 治疗石、糖水茶
    MPHunterShotSaved.HealthStone = 1
    MPHunterShotSaved.HealthStone_Value = 30
    MPHunterShotSaved.HerbalTea = 1
    MPHunterShotSaved.HerbalTea_Value = 20
    MPHunterShotSaved.HerbalTeaMana = 0
    MPHunterShotSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPHunterShotSaved.SuperWoW = 1
    MPHunterShotSaved.UnitXP = 1

    MPHunterShotSaved.RacialTraits = 0
    MPHunterShotSaved.FirstAimedShot = 0
    MPHunterShotSaved.ViperGuardian = 0
    MPHunterShotSaved.Viper_Value = 1000
    MPHunterShotSaved.Soulspeed = 0
    MPHunterShotSaved.RapidFire = 0

    MPHunterShotSaved.SteadyShot_Value = 1.5

    -- 通用
    MPHunterShotSaved.Power = 0
    MPHunterShotSaved.Pick = 0

end


local function MPInitHunterShotSettingsPart1()

    checkButton_Hawk:SetChecked(ToBoolean(MPHunterShotSaved.Hawk))
    checkButton_Trueshot:SetChecked( ToBoolean(MPHunterShotSaved.Trueshot) )
    checkButton_Mark:SetChecked( ToBoolean(MPHunterShotSaved.Mark) )
    checkButton_MarkBossOnly:SetChecked( ToBoolean(MPHunterShotSaved.MarkBossOnly) )
    checkButton_AimedShot:SetChecked(ToBoolean(MPHunterShotSaved.AimedShot))
    checkButton_MultiShot:SetChecked(ToBoolean(MPHunterShotSaved.MultiShot))
    checkButton_ArcaneShot:SetChecked(ToBoolean(MPHunterShotSaved.ArcaneShot))
    checkButton_SerpentSting:SetChecked(ToBoolean(MPHunterShotSaved.Serpent))
    checkButton_ViperSting:SetChecked(ToBoolean(MPHunterShotSaved.Viper))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPHunterShotSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPHunterShotSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPHunterShotSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPHunterShotSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPHunterShotSaved.Target))
    checkButton_Distant:SetChecked(ToBoolean(MPHunterShotSaved.Distant))
    checkButton_PetAttack:SetChecked(ToBoolean(MPHunterShotSaved.PetAttack))

    checkButton_RaptorStrike:SetChecked(ToBoolean(MPHunterShotSaved.RaptorStrike))
    checkButton_MeerkatsBiting:SetChecked(ToBoolean(MPHunterShotSaved.MeerkatsBiting))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPHunterShotSaved.RacialTraits))
    checkButton_FirstAimedShot:SetChecked(ToBoolean(MPHunterShotSaved.FirstAimedShot))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPHunterShotSaved.Soulspeed))
    checkButton_RapidFire:SetChecked(ToBoolean(MPHunterShotSaved.RapidFire))

    checkButton_Power:SetChecked(ToBoolean(MPHunterShotSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPHunterShotSaved.Pick))
end

function MPInitHunterShotSettings()
    if not MPHunterShotSaved then
        MPHunterShotSaved = {}
        MPResetHunterShotSettings()
    end

    if MPHunterShotSaved.Version ~= HunterShotSettingsUIVersion then
        MPResetHunterShotSettings()
    end

    MPInitHunterShotSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPHunterShotSaved.HealthStone))
    slider_HealthStone:SetValue(MPHunterShotSaved.HealthStone_Value)
    if MPHunterShotSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterShotSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPHunterShotSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPHunterShotSaved.HerbalTea_Value)
    if MPHunterShotSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterShotSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPHunterShotSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPHunterShotSaved.HerbalTeaMana_Value)
    if MPHunterShotSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterShotSaved.HerbalTeaMana_Value .."%|r")


    slider_SteadyShot:SetValue(MPHunterShotSaved.SteadyShot_Value)
    _G[slider_SteadyShot:GetName().."Text"]:SetText("稳固射击 射击前 >"..string.format("%.1f", MPHunterShotSaved.SteadyShot_Value).." 秒")

        --[[
    checkButton_JewelMana:SetChecked(MPHunterShotSaved.JewelMana)
    slider_JewelMana:SetValue(MPHunterShotSaved.JewelMana_Value)
    if MPHunterShotSaved.JewelMana==1 then
        color_JewelMana = "|cFFFFD100"
    else
        color_JewelMana = "|cFF888888"
    end
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPHunterShotSaved.JewelMana_Value .."%|r")


    checkButton_ArcanePowerSafe:SetChecked(MPHunterShotSaved.ArcanePowerSafe)
    slider_ArcanePowerSafe:SetValue(MPHunterShotSaved.ArcanePowerSafe_Value)
    if MPHunterShotSaved.ArcanePowerSafe==1 then
        color_ArcanePowerSafe = "|cFFFFD100"
    else
        color_ArcanePowerSafe = "|cFF888888"
    end
    _G[slider_ArcanePowerSafe:GetName().."Text"]:SetText(color_ArcanePowerSafe.."蓝量: ".. MPHunterShotSaved.ArcanePowerSafe_Value .."%|r")
    ]]

    checkButton_ViperGuardian:SetChecked(ToBoolean(MPHunterShotSaved.ViperGuardian))
    slider_ViperGuardian:SetValue(MPHunterShotSaved.Viper_Value)
    if MPHunterShotSaved.ViperGuardian==1 then
        color_ViperGuardian = "|cFFFFD100"
    else
        color_ViperGuardian = "|cFF888888"
    end
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterShotSaved.Viper_Value .."|r")


end

