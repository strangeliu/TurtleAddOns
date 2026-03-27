-- 定义插件名称
local ADDON_NAME = "Settings-HunterBeast"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

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
TipText:SetText("基本配置")






local postion_y = postion_y-40

-- 创建单选框 - 雄鹰守护​
local checkButton_Hawk = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_Hawk:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
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
        MPHunterBeastSaved.Hawk = 1
    else
        MPHunterBeastSaved.Hawk = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
        MPHunterBeastSaved.Trinket_Upper = 1
    else
        MPHunterBeastSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.TUBoss = 1
    else
        MPHunterBeastSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 强击光环
local checkButton_Trueshot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_Trueshot:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
checkButton_Trueshot:SetScale(0.8)

-- 添加文字标签
local checkText_Trueshot = checkButton_Trueshot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Trueshot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Trueshot:SetTextColor(1, 1, 1)
checkText_Trueshot:SetPoint("LEFT", checkButton_Trueshot, "LEFT", 34, 1)
checkText_Trueshot:SetText("保持 强击光环")
checkButton_Trueshot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.Trueshot = 1
    else
        MPHunterBeastSaved.Trueshot = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
        MPHunterBeastSaved.Trinket_Below = 1
    else
        MPHunterBeastSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.TBBoss = 1
    else
        MPHunterBeastSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30



-- 创建单选框 - 猎人印记
local checkButton_Mark = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_Mark:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
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
        MPHunterBeastSaved.Mark = 1
    else
        MPHunterBeastSaved.Mark = 0
    end
end)

-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
        MPHunterBeastSaved.Target = 1
    else
        MPHunterBeastSaved.Target = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 杀戮命令
local checkButton_KillCommand = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_KillCommand:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
checkButton_KillCommand:SetScale(0.8)

-- 添加文字标签
local checkText_KillCommand = checkButton_KillCommand:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_KillCommand:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_KillCommand:SetTextColor(1, 1, 1)
checkText_KillCommand:SetPoint("LEFT", checkButton_KillCommand, "LEFT", 34, 1)
checkText_KillCommand:SetText("开启 杀戮命令 (自动识别天赋)")
checkButton_KillCommand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.KillCommand = 1
    else
        MPHunterBeastSaved.KillCommand = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 瞄准射击
local checkButton_AimedShot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_AimedShot:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
checkButton_AimedShot:SetScale(0.8)

-- 添加文字标签
local checkText_AimedShot = checkButton_AimedShot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_AimedShot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_AimedShot:SetTextColor(1, 1, 1)
checkText_AimedShot:SetPoint("LEFT", checkButton_AimedShot, "LEFT", 34, 1)
checkText_AimedShot:SetText("开启 瞄准射击 (自动识别天赋)")

-- 设置点击事件
checkButton_AimedShot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.AimedShot = 1
    else
        MPHunterBeastSaved.AimedShot = 0
    end
end)

-- 创建单选框 - 宠物自动攻击
local checkButton_PetAttack = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_PetAttack:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
        MPHunterBeastSaved.PetAttack = 1
    else
        MPHunterBeastSaved.PetAttack = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 多重射击
local checkButton_MultiShot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_MultiShot:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
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
        MPHunterBeastSaved.MultiShot = 1
    else
        MPHunterBeastSaved.MultiShot = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 奥术射击
local checkButton_ArcaneShot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_ArcaneShot:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
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
        MPHunterBeastSaved.ArcaneShot = 1
    else
        MPHunterBeastSaved.ArcaneShot = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - ​​毒蛇钉刺
local checkButton_SerpentSting = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonSerpentSting ", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_SerpentSting:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
checkButton_SerpentSting:SetScale(0.8)

-- 添加文字标签
local checkText_SerpentSting = checkButton_SerpentSting:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SerpentSting:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SerpentSting:SetTextColor(1, 1, 1)
checkText_SerpentSting:SetPoint("LEFT", checkButton_SerpentSting, "LEFT", 34, 1)
checkText_SerpentSting:SetText("保持 ​​毒蛇钉刺 (钉刺仅单选)")



-- 创建单选框 - 近身 猛禽一击
local checkButton_RaptorStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_RaptorStrike:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
        MPHunterBeastSaved.RaptorStrike = 1
    else
        MPHunterBeastSaved.RaptorStrike = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - ​​蝰蛇钉刺
local checkButton_ViperSting = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonViperSting", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_ViperSting:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
checkButton_ViperSting:SetScale(0.8)

-- 添加文字标签
local checkText_ViperSting = checkButton_ViperSting:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ViperSting:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ViperSting:SetTextColor(1, 1, 1)
checkText_ViperSting:SetPoint("LEFT", checkButton_ViperSting, "LEFT", 34, 1)
checkText_ViperSting:SetText("保持 ​​蝰蛇钉刺 (钉刺仅单选)")


-- 创建单选框 - 近身 猫鼬撕咬
local checkButton_MeerkatsBiting = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_MeerkatsBiting:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
        MPHunterBeastSaved.MeerkatsBiting = 1
    else
        MPHunterBeastSaved.MeerkatsBiting = 0
    end
end)




-- 毒蛇钉刺点击事件
checkButton_SerpentSting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.Serpent = 1
        MPHunterBeastSaved.Viper = 0
    else
        MPHunterBeastSaved.Serpent = 0
    end
    checkButton_SerpentSting:SetChecked(ToBoolean(MPHunterBeastSaved.Serpent))
    checkButton_ViperSting:SetChecked(ToBoolean(MPHunterBeastSaved.Viper))

end)
-- 蝰蛇钉刺点击事件
checkButton_ViperSting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.Viper = 1
        MPHunterBeastSaved.Serpent = 0
    else
        MPHunterBeastSaved.Viper = 0
    end
    checkButton_SerpentSting:SetChecked(ToBoolean(MPHunterBeastSaved.Serpent))
    checkButton_ViperSting:SetChecked(ToBoolean(MPHunterBeastSaved.Viper))

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
TipText1:SetText("高级配置")


postion_y = postion_y-120


-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
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
        MPHunterBeastSaved.RacialTraits = 1
    else
        MPHunterBeastSaved.RacialTraits = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
    MPHunterBeastSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterBeastSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterBeastSaved.HealthStone_Value .."%|r")
    else
        MPHunterBeastSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterBeastSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40



-- 创建单选框 - 蝰蛇守护
local checkButton_ViperGuardian = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_ViperGuardian", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_ViperGuardian:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 20, postion_y)
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
    MPHunterBeastSaved.Viper_Value = arg1
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterBeastSaved.Viper_Value .."|r")
end)
-- 设置点击事件
checkButton_ViperGuardian:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.ViperGuardian = 1
        color_ViperGuardian = "|cFFFFD100"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterBeastSaved.Viper_Value .."|r")
    else
        MPHunterBeastSaved.ViperGuardian = 0
        color_ViperGuardian = "|cFF888888"
        _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterBeastSaved.Viper_Value .."|r")
    end
end)





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
    MPHunterBeastSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterBeastSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterBeastSaved.HerbalTea_Value .."%|r")
    else
        MPHunterBeastSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterBeastSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsHunterBeast, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 340, postion_y)
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
    MPHunterBeastSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterBeastSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterBeastSaved.HerbalTeaMana_Value .."%|r")
    else
        MPHunterBeastSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterBeastSaved.HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.Soulspeed = 1
    else
        MPHunterBeastSaved.Soulspeed = 0
    end
end)


postion_y = postion_y - 40

-- 急速射击
local checkButton_RapidFire = MPCreateCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 急速射击")
checkButton_RapidFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.RapidFire = 1
    else
        MPHunterBeastSaved.RapidFire = 0
    end
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsHunterBeast, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsHunterBeast, "TOPLEFT", 120, -44)
myButton:SetWidth(100)
myButton:SetHeight(22)
myButton:SetFont("Fonts\\FRIZQT__.TTF", 12)
myButton:SetText("恢复默认值")

-- 调整按钮纹理
myButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
myButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
myButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
myButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
-- 按钮点击事件
myButton:SetScript("OnClick", function()
    MPResetHunterBeastSettings()
    MPInitHunterBeastSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsHunterBeast)

local checkButton_Power = MPPublicCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.Power = 1
    else
        MPHunterBeastSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPHunterBeastSaved.Pick = 1
    else
        MPHunterBeastSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsHunterBeast, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
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
TipText:SetText("宏命令 -  [ |cFFABD473/hbdps|r ]")



-- 配置文件版本号
local HunterBeastSettingsUIVersion = 10

function MPResetHunterBeastSettings()

    MPHunterBeastSaved.Version = HunterBeastSettingsUIVersion

    -- 基本配置

    MPHunterBeastSaved.Hawk = 1
    MPHunterBeastSaved.Trueshot = 1
    MPHunterBeastSaved.Mark = 0
    MPHunterBeastSaved.KillCommand = 1
    MPHunterBeastSaved.AimedShot = 1
    MPHunterBeastSaved.BaitShot = 1
    MPHunterBeastSaved.SteadyShot = 1
    MPHunterBeastSaved.MultiShot = 1
    MPHunterBeastSaved.ArcaneShot = 1
    MPHunterBeastSaved.Serpent = 1
    MPHunterBeastSaved.Viper = 0

    MPHunterBeastSaved.Trinket_Upper = 1
    MPHunterBeastSaved.TUBoss = 0
    MPHunterBeastSaved.Trinket_Below = 1
    MPHunterBeastSaved.TBBoss = 0
    MPHunterBeastSaved.Target = 0
    MPHunterBeastSaved.PetAttack = 0

    MPHunterBeastSaved.RaptorStrike = 1
    MPHunterBeastSaved.MeerkatsBiting = 1

    -- 高级配置

    -- 治疗石、糖水茶
    MPHunterBeastSaved.HealthStone = 1
    MPHunterBeastSaved.HealthStone_Value = 30
    MPHunterBeastSaved.HerbalTea = 1
    MPHunterBeastSaved.HerbalTea_Value = 20
    MPHunterBeastSaved.HerbalTeaMana = 0
    MPHunterBeastSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPHunterBeastSaved.SuperWoW = 1
    MPHunterBeastSaved.UnitXP = 1

    MPHunterBeastSaved.RacialTraits = 0
    MPHunterBeastSaved.Soulspeed = 0
    MPHunterBeastSaved.RapidFire = 0

    MPHunterBeastSaved.ViperGuardian = 0
    MPHunterBeastSaved.Viper_Value = 1000

    MPHunterBeastSaved.SteadyShot_Value = 1.9

    -- 通用
    MPHunterBeastSaved.Power = 0
    MPHunterBeastSaved.Pick = 0

end


local function MPInitHunterBeastSettingsPart1()

    checkButton_Hawk:SetChecked(ToBoolean(MPHunterBeastSaved.Hawk))
    checkButton_Mark:SetChecked( ToBoolean(MPHunterBeastSaved.Mark) )
    checkButton_KillCommand:SetChecked( ToBoolean(MPHunterBeastSaved.KillCommand) )
    checkButton_Trueshot:SetChecked(ToBoolean(MPHunterBeastSaved.Trueshot))
    checkButton_AimedShot:SetChecked(ToBoolean(MPHunterBeastSaved.AimedShot))
    checkButton_MultiShot:SetChecked(ToBoolean(MPHunterBeastSaved.MultiShot))
    checkButton_ArcaneShot:SetChecked(ToBoolean(MPHunterBeastSaved.ArcaneShot))
    checkButton_SerpentSting:SetChecked(ToBoolean(MPHunterBeastSaved.Serpent))
    checkButton_ViperSting:SetChecked(ToBoolean(MPHunterBeastSaved.Viper))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPHunterBeastSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPHunterBeastSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPHunterBeastSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPHunterBeastSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPHunterBeastSaved.Target))
    checkButton_PetAttack:SetChecked(ToBoolean(MPHunterBeastSaved.PetAttack))

    checkButton_RaptorStrike:SetChecked(ToBoolean(MPHunterBeastSaved.RaptorStrike))
    checkButton_MeerkatsBiting:SetChecked(ToBoolean(MPHunterBeastSaved.MeerkatsBiting))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPHunterBeastSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPHunterBeastSaved.Soulspeed))
    checkButton_RapidFire:SetChecked(ToBoolean(MPHunterBeastSaved.RapidFire))

    checkButton_Power:SetChecked(ToBoolean(MPHunterBeastSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPHunterBeastSaved.Pick))
end

function MPInitHunterBeastSettings()
    if not MPHunterBeastSaved then
        MPHunterBeastSaved = {}
        MPResetHunterBeastSettings()
    end

    if MPHunterBeastSaved.Version ~= HunterBeastSettingsUIVersion then
        MPResetHunterBeastSettings()
    end

    MPInitHunterBeastSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPHunterBeastSaved.HealthStone))
    slider_HealthStone:SetValue(MPHunterBeastSaved.HealthStone_Value)
    if MPHunterBeastSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPHunterBeastSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPHunterBeastSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPHunterBeastSaved.HerbalTea_Value)
    if MPHunterBeastSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPHunterBeastSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPHunterBeastSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPHunterBeastSaved.HerbalTeaMana_Value)
    if MPHunterBeastSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPHunterBeastSaved.HerbalTeaMana_Value .."%|r")


    checkButton_ViperGuardian:SetChecked(ToBoolean(MPHunterBeastSaved.ViperGuardian))
    slider_ViperGuardian:SetValue(MPHunterBeastSaved.Viper_Value)
    if MPHunterBeastSaved.ViperGuardian==1 then
        color_ViperGuardian = "|cFFFFD100"
    else
        color_ViperGuardian = "|cFF888888"
    end
    _G[slider_ViperGuardian:GetName().."Text"]:SetText(color_ViperGuardian.."蓝量 < ".. MPHunterBeastSaved.Viper_Value .."|r")

end

