-- 定义插件名称
local ADDON_NAME = "Settings-HunterMelee"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

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
local checkButton_LoneWolf = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_LoneWolf:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
checkButton_LoneWolf:SetScale(0.8)

-- 添加文字标签
local checkText_LoneWolf = checkButton_LoneWolf:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LoneWolf:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LoneWolf:SetTextColor(1, 1, 1)
checkText_LoneWolf:SetPoint("LEFT", checkButton_LoneWolf, "LEFT", 34, 1)
checkText_LoneWolf:SetText("保持 孤狼守护​")

-- 设置点击事件
checkButton_LoneWolf:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.LoneWolf = 1
    else
        MPHunterMeleeSaved.LoneWolf = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 340, postion_y)
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
        MPHunterMeleeSaved.Trinket_Upper = 1
    else
        MPHunterMeleeSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.TUBoss = 1
    else
        MPHunterMeleeSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 强击光环
local checkButton_Trueshot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_Trueshot:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
checkButton_Trueshot:SetScale(0.8)

-- 添加文字标签
local checkText_Trueshot = checkButton_Trueshot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Trueshot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Trueshot:SetTextColor(1, 1, 1)
checkText_Trueshot:SetPoint("LEFT", checkButton_Trueshot, "LEFT", 34, 1)
checkText_Trueshot:SetText("保持 强击光环")
checkButton_Trueshot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.Trueshot = 1
    else
        MPHunterMeleeSaved.Trueshot = 0
    end
end)



-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 340, postion_y)
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
        MPHunterMeleeSaved.Trinket_Below = 1
    else
        MPHunterMeleeSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.TBBoss = 1
    else
        MPHunterMeleeSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 猛禽一击​
local checkButton_RaptorStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_RaptorStrike:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
checkButton_RaptorStrike:SetScale(0.8)

-- 添加文字标签
local checkText_RaptorStrike = checkButton_RaptorStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_RaptorStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_RaptorStrike:SetTextColor(1, 1, 1)
checkText_RaptorStrike:SetPoint("LEFT", checkButton_RaptorStrike, "LEFT", 34, 1)
checkText_RaptorStrike:SetText("开启 猛禽一击​")

-- 设置点击事件
checkButton_RaptorStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.RaptorStrike = 1
    else
        MPHunterMeleeSaved.RaptorStrike = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 340, postion_y)
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
        MPHunterMeleeSaved.Target = 1
    else
        MPHunterMeleeSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 猫鼬撕咬
local checkButton_MeerkatsBiting = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_MeerkatsBiting:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
checkButton_MeerkatsBiting:SetScale(0.8)

-- 添加文字标签
local checkText_MeerkatsBiting = checkButton_MeerkatsBiting:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_MeerkatsBiting:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_MeerkatsBiting:SetTextColor(1, 1, 1)
checkText_MeerkatsBiting:SetPoint("LEFT", checkButton_MeerkatsBiting, "LEFT", 34, 1)
checkText_MeerkatsBiting:SetText("开启 猫鼬撕咬")

-- 设置点击事件
checkButton_MeerkatsBiting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.MeerkatsBiting = 1
    else
        MPHunterMeleeSaved.MeerkatsBiting = 0
    end
end)



-- 创建单选框 - 宠物自动攻击
local checkButton_PetAttack = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_PetAttack:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 340, postion_y)
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
        MPHunterMeleeSaved.PetAttack = 1
    else
        MPHunterMeleeSaved.PetAttack = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 切碎
local checkButton_Rake = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_Rake:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
checkButton_Rake:SetScale(0.8)

-- 添加文字标签
local checkText_Rake = checkButton_Rake:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Rake:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Rake:SetTextColor(1, 1, 1)
checkText_Rake:SetPoint("LEFT", checkButton_Rake, "LEFT", 34, 1)
checkText_Rake:SetText("开启 切碎 (自动识别天赋)")

-- 设置点击事件
checkButton_Rake:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.Rake = 1
    else
        MPHunterMeleeSaved.Rake = 0
    end
end)



-- 创建单选框 - Trap
local checkButton_Trap = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_Trap:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 340, postion_y)
checkButton_Trap:SetScale(0.8)

-- 添加文字标签
local checkText_Trap = checkButton_Trap:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Trap:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Trap:SetTextColor(1, 1, 1)
checkText_Trap:SetPoint("LEFT", checkButton_Trap, "LEFT", 34, 1)
checkText_Trap:SetText("开启陷阱")

-- 设置点击事件
checkButton_Trap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.Trap = 1
    else
        MPHunterMeleeSaved.Trap = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 割伤
local checkButton_Gore = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_Gore:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
checkButton_Gore:SetScale(0.8)

-- 添加文字标签
local checkText_Gore = checkButton_Gore:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Gore:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Gore:SetTextColor(1, 1, 1)
checkText_Gore:SetPoint("LEFT", checkButton_Gore, "LEFT", 34, 1)
checkText_Gore:SetText("开启 割伤 (自动识别天赋)")

-- 设置点击事件
checkButton_Gore:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.Gore = 1
    else
        MPHunterMeleeSaved.Gore = 0
    end
end)



-- 创建单选框 - ​​爆炸陷阱
local checkButton_ExplosiveTrap = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonExplosiveTrap", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_ExplosiveTrap:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 370, postion_y)
checkButton_ExplosiveTrap:SetScale(0.8)

-- 添加文字标签
local checkText_ExplosiveTrap = checkButton_ExplosiveTrap:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ExplosiveTrap:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_ExplosiveTrap:SetTextColor(1, 1, 1)
checkText_ExplosiveTrap:SetPoint("LEFT", checkButton_ExplosiveTrap, "LEFT", 34, 1)
checkText_ExplosiveTrap:SetText("​​爆炸陷阱")


-- 创建单选框 - ​​献祭陷阱
local checkButton_ImmolationTrap = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonImmolationTrap", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_ImmolationTrap:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 470, postion_y)
checkButton_ImmolationTrap:SetScale(0.8)

-- 添加文字标签
local checkText_ImmolationTrap = checkButton_ImmolationTrap:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ImmolationTrap:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_ImmolationTrap:SetTextColor(1, 1, 1)
checkText_ImmolationTrap:SetPoint("LEFT", checkButton_ImmolationTrap, "LEFT", 34, 1)
checkText_ImmolationTrap:SetText("​​献祭陷阱")


postion_y = postion_y-30

-- 创建单选框 - 摔绊
local checkButton_WingClip = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_WingClip:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
checkButton_WingClip:SetScale(0.8)

-- 添加文字标签
local checkText_WingClip = checkButton_WingClip:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WingClip:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WingClip:SetTextColor(1, 1, 1)
checkText_WingClip:SetPoint("LEFT", checkButton_WingClip, "LEFT", 34, 1)
checkText_WingClip:SetText("开启 摔绊")

-- 设置点击事件
checkButton_WingClip:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.WingClip = 1
    else
        MPHunterMeleeSaved.WingClip = 0
    end
end)


-- 创建单选框 - 自动陷阱
local checkButton_AutoTrap = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonAutoTrap", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_AutoTrap:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 370, postion_y)
checkButton_AutoTrap:SetScale(0.8)

-- 添加文字标签
local checkText_AutoTrap = checkButton_AutoTrap:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_AutoTrap:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_AutoTrap:SetTextColor(1, 1, 1)
checkText_AutoTrap:SetPoint("LEFT", checkButton_AutoTrap, "LEFT", 34, 1)
checkText_AutoTrap:SetText("​​自动判断陷阱 (SuperWoW)")



-- 爆炸陷阱点击事件
checkButton_ExplosiveTrap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.ExplosiveTrap = 1
        MPHunterMeleeSaved.ImmolationTrap = 0
        MPHunterMeleeSaved.AutoTrap = 0
    else
        MPHunterMeleeSaved.ExplosiveTrap = 0
    end
    checkButton_ExplosiveTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.ExplosiveTrap))
    checkButton_ImmolationTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.ImmolationTrap))
    checkButton_AutoTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.AutoTrap))
end)
-- 献祭陷阱点击事件
checkButton_ImmolationTrap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.ImmolationTrap = 1
        MPHunterMeleeSaved.ExplosiveTrap = 0
        MPHunterMeleeSaved.AutoTrap = 0
    else
        MPHunterMeleeSaved.ImmolationTrap = 0
    end
    checkButton_ExplosiveTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.ExplosiveTrap))
    checkButton_ImmolationTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.ImmolationTrap))
    checkButton_AutoTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.AutoTrap))
end)
-- 自动陷阱点击事件
checkButton_AutoTrap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.AutoTrap = 1
        MPHunterMeleeSaved.ImmolationTrap = 0
        MPHunterMeleeSaved.ExplosiveTrap = 0
    else
        MPHunterMeleeSaved.AutoTrap = 0
    end
    checkButton_ExplosiveTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.ExplosiveTrap))
    checkButton_ImmolationTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.ImmolationTrap))
    checkButton_AutoTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.AutoTrap))
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


-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
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
        MPHunterMeleeSaved.RacialTraits = 1
    else
        MPHunterMeleeSaved.RacialTraits = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 340, postion_y)
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
    MPHunterMeleeSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterMeleeSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterMeleeSaved.HealthStone_Value .."%|r")
    else
        MPHunterMeleeSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterMeleeSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40



-- 创建单选框 - 蝰蛇守护
local checkButton_ViperGuardian = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_ViperGuardian", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_ViperGuardian:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 20, postion_y)
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
    MPHunterMeleeSaved.Viper_Value = arg1
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterMeleeSaved.Viper_Value .."|r")
end)
-- 设置点击事件
checkButton_ViperGuardian:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.ViperGuardian = 1
        color_ViperGuardian = "|cFFFFD100"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterMeleeSaved.Viper_Value .."|r")
    else
        MPHunterMeleeSaved.ViperGuardian = 0
        color_ViperGuardian = "|cFF888888"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterMeleeSaved.Viper_Value .."|r")
    end
end)






-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 340, postion_y)
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
    MPHunterMeleeSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterMeleeSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterMeleeSaved.HerbalTea_Value .."%|r")
    else
        MPHunterMeleeSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterMeleeSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40





-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsHunterMelee, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 340, postion_y)
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
    MPHunterMeleeSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterMeleeSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterMeleeSaved.HerbalTeaMana_Value .."%|r")
    else
        MPHunterMeleeSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterMeleeSaved.HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.Soulspeed = 1
    else
        MPHunterMeleeSaved.Soulspeed = 0
    end
end)

postion_y = postion_y - 40

-- 急速射击
local checkButton_RapidFire = MPCreateCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 急速射击")
checkButton_RapidFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.RapidFire = 1
    else
        MPHunterMeleeSaved.RapidFire = 0
    end
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsHunterMelee, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsHunterMelee, "TOPLEFT", 120, -44)
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
    MPResetHunterMeleeSettings()
    MPInitHunterMeleeSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsHunterMelee)

local checkButton_Power = MPPublicCheckButton(CatUISettingsHunterMelee, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterMeleeSaved.Power = 1
    else
        MPHunterMeleeSaved.Power = 0
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
        MPHunterMeleeSaved.Pick = 1
    else
        MPHunterMeleeSaved.Pick = 0
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
TipText:SetText("宏命令 -  [ |cFFABD473/hmdps|r ]")



-- 配置文件版本号
local HunterMeleeSettingsUIVersion = 8

function MPResetHunterMeleeSettings()

    MPHunterMeleeSaved.Version = HunterMeleeSettingsUIVersion

    -- 基本配置

    MPHunterMeleeSaved.LoneWolf = 1
    MPHunterMeleeSaved.Trueshot = 1
    MPHunterMeleeSaved.RaptorStrike = 1
    MPHunterMeleeSaved.MeerkatsBiting = 1
    MPHunterMeleeSaved.Rake = 1
    MPHunterMeleeSaved.Gore = 1
    MPHunterMeleeSaved.ExplosiveTrap = 0
    MPHunterMeleeSaved.ImmolationTrap = 0
    MPHunterMeleeSaved.AutoTrap = 1
    MPHunterMeleeSaved.Trap = 1
    MPHunterMeleeSaved.WingClip = 0

    MPHunterMeleeSaved.Trinket_Upper = 1
    MPHunterMeleeSaved.TUBoss = 0
    MPHunterMeleeSaved.Trinket_Below = 1
    MPHunterMeleeSaved.TBBoss = 0
    MPHunterMeleeSaved.Target = 0
    MPHunterMeleeSaved.PetAttack = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPHunterMeleeSaved.HealthStone = 1
    MPHunterMeleeSaved.HealthStone_Value = 30
    MPHunterMeleeSaved.HerbalTea = 1
    MPHunterMeleeSaved.HerbalTea_Value = 20
    MPHunterMeleeSaved.HerbalTeaMana = 0
    MPHunterMeleeSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPHunterMeleeSaved.SuperWoW = 1
    MPHunterMeleeSaved.UnitXP = 1

    MPHunterMeleeSaved.RacialTraits = 0
    MPHunterMeleeSaved.Soulspeed = 0
    MPHunterMeleeSaved.RapidFire = 0

    MPHunterMeleeSaved.ViperGuardian = 0
    MPHunterMeleeSaved.Viper_Value = 1000

    -- 通用
    MPHunterMeleeSaved.Power = 0
    MPHunterMeleeSaved.Pick = 0

end

local function MPInitHunterMeleeSettingsPart1()

    checkButton_LoneWolf:SetChecked(ToBoolean(MPHunterMeleeSaved.LoneWolf))
    checkButton_Trueshot:SetChecked(ToBoolean(MPHunterMeleeSaved.Trueshot))
    checkButton_RaptorStrike:SetChecked( ToBoolean(MPHunterMeleeSaved.RaptorStrike) )
    checkButton_MeerkatsBiting:SetChecked( ToBoolean(MPHunterMeleeSaved.MeerkatsBiting) )
    checkButton_Rake:SetChecked(ToBoolean(MPHunterMeleeSaved.Rake))
    checkButton_Gore:SetChecked(ToBoolean(MPHunterMeleeSaved.Gore))
    checkButton_ExplosiveTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.ExplosiveTrap))
    checkButton_ImmolationTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.ImmolationTrap))
    checkButton_AutoTrap:SetChecked(ToBoolean(MPHunterMeleeSaved.AutoTrap))
    checkButton_Trap:SetChecked(ToBoolean(MPHunterMeleeSaved.Trap))
    checkButton_WingClip:SetChecked(ToBoolean(MPHunterMeleeSaved.WingClip))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPHunterMeleeSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPHunterMeleeSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPHunterMeleeSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPHunterMeleeSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPHunterMeleeSaved.Target))
    checkButton_PetAttack:SetChecked(ToBoolean(MPHunterMeleeSaved.PetAttack))

end


function MPInitHunterMeleeSettings()
    if not MPHunterMeleeSaved then
        MPHunterMeleeSaved = {}
        MPResetHunterMeleeSettings()
    end

    if MPHunterMeleeSaved.Version ~= HunterMeleeSettingsUIVersion then
        MPResetHunterMeleeSettings()
    end

    MPInitHunterMeleeSettingsPart1()


    checkButton_RacialTraits:SetChecked(ToBoolean(MPHunterMeleeSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPHunterMeleeSaved.Soulspeed))
    checkButton_RapidFire:SetChecked(ToBoolean(MPHunterMeleeSaved.RapidFire))

    checkButton_HealthStone:SetChecked(ToBoolean(MPHunterMeleeSaved.HealthStone))
    slider_HealthStone:SetValue(MPHunterMeleeSaved.HealthStone_Value)
    if MPHunterMeleeSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterMeleeSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPHunterMeleeSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPHunterMeleeSaved.HerbalTea_Value)
    if MPHunterMeleeSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterMeleeSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPHunterMeleeSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPHunterMeleeSaved.HerbalTeaMana_Value)
    if MPHunterMeleeSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterMeleeSaved.HerbalTeaMana_Value .."%|r")


    checkButton_Power:SetChecked(ToBoolean(MPHunterMeleeSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPHunterMeleeSaved.Pick))

    checkButton_ViperGuardian:SetChecked(ToBoolean(MPHunterMeleeSaved.ViperGuardian))
    slider_ViperGuardian:SetValue(MPHunterMeleeSaved.Viper_Value)
    if MPHunterMeleeSaved.ViperGuardian==1 then
        color_ViperGuardian = "|cFFFFD100"
    else
        color_ViperGuardian = "|cFF888888"
    end
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterMeleeSaved.Viper_Value .."|r")

end

