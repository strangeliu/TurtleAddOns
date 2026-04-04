
-- 定义插件名称
local ADDON_NAME = "Settings-Rogue"

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsRogue = MPCreateFrame(ADDON_NAME.."Frame", 520, 760, "|cFFFFF569设置 - 盗贼 自配置|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40


local CB_SliceDiceTipText = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
CB_SliceDiceTipText:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y+12)
CB_SliceDiceTipText:SetWidth(250)
CB_SliceDiceTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
CB_SliceDiceTipText:SetTextColor(1, 0.8, 0)
CB_SliceDiceTipText:SetJustifyH("LEFT")
CB_SliceDiceTipText:SetText("切割")

-- 创建单选框 - 切割
local CB_SliceDice = {}
CB_SliceDice[1] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 60, postion_y, "1")
CB_SliceDice[1]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.SliceDiceStar[1] = 1
    else
        MPRogueSaved.SliceDiceStar[1] = 0
    end
end)
-- 创建单选框 - 切割2星
CB_SliceDice[2] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 110, postion_y, "2")
CB_SliceDice[2]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.SliceDiceStar[2] = 1
    else
        MPRogueSaved.SliceDiceStar[2] = 0
    end
end)
-- 创建单选框 - 切割3星
CB_SliceDice[3] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 160, postion_y, "3")
CB_SliceDice[3]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.SliceDiceStar[3] = 1
    else
        MPRogueSaved.SliceDiceStar[3] = 0
    end
end)
-- 创建单选框 - 切割4星
CB_SliceDice[4] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 210, postion_y, "4")
CB_SliceDice[4]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.SliceDiceStar[4] = 1
    else
        MPRogueSaved.SliceDiceStar[4] = 0
    end
end)
-- 创建单选框 - 切割5星
CB_SliceDice[5] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 260, postion_y, "5")
CB_SliceDice[5]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.SliceDiceStar[5] = 1
    else
        MPRogueSaved.SliceDiceStar[5] = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Trinket_Upper = 1
    else
        MPRogueSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsRogue, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.TUBoss = 1
    else
        MPRogueSaved.TUBoss = 0
    end
end)





postion_y = postion_y-30


postion_y = postion_y-5
local CB_EnvenomTipText = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
CB_EnvenomTipText:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y+19)
CB_EnvenomTipText:SetWidth(250)
CB_EnvenomTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
CB_EnvenomTipText:SetTextColor(1, 0.8, 0)
CB_EnvenomTipText:SetJustifyH("LEFT")
CB_EnvenomTipText:SetText("毒伤")

-- 创建单选框 - 毒伤
local CB_Envenom = {}
CB_Envenom[1] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 60, postion_y, "1")
CB_Envenom[1]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EnvenomStar[1] = 1
    else
        MPRogueSaved.EnvenomStar[1] = 0
    end
end)
-- 创建单选框 - 2星
CB_Envenom[2] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 110, postion_y, "2")
CB_Envenom[2]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EnvenomStar[2] = 1
    else
        MPRogueSaved.EnvenomStar[2] = 0
    end
end)
-- 创建单选框 - 3星
CB_Envenom[3] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 160, postion_y, "3")
CB_Envenom[3]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EnvenomStar[3] = 1
    else
        MPRogueSaved.EnvenomStar[3] = 0
    end
end)
-- 创建单选框 - 4星
CB_Envenom[4] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 210, postion_y, "4")
CB_Envenom[4]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EnvenomStar[4] = 1
    else
        MPRogueSaved.EnvenomStar[4] = 0
    end
end)
-- 创建单选框 - 5星
CB_Envenom[5] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 260, postion_y, "5")
CB_Envenom[5]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EnvenomStar[5] = 1
    else
        MPRogueSaved.EnvenomStar[5] = 0
    end
end)
postion_y = postion_y+5

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Trinket_Below = 1
    else
        MPRogueSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsRogue, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.TBBoss = 1
    else
        MPRogueSaved.TBBoss = 0
    end
end)



postion_y = postion_y-30



postion_y = postion_y-5
local CB_BloodyTipText = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
CB_BloodyTipText:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y+24)
CB_BloodyTipText:SetWidth(250)
CB_BloodyTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
CB_BloodyTipText:SetTextColor(1, 0.8, 0)
CB_BloodyTipText:SetJustifyH("LEFT")
CB_BloodyTipText:SetText("割裂")

-- 创建单选框 - 割裂
local CB_Bloody = {}
CB_Bloody[1] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 60, postion_y, "1")
CB_Bloody[1]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.BloodyStar[1] = 1
    else
        MPRogueSaved.BloodyStar[1] = 0
    end
end)
-- 创建单选框 - 2星
CB_Bloody[2] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 110, postion_y, "2")
CB_Bloody[2]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.BloodyStar[2] = 1
    else
        MPRogueSaved.BloodyStar[2] = 0
    end
end)
-- 创建单选框 - 3星
CB_Bloody[3] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 160, postion_y, "3")
CB_Bloody[3]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.BloodyStar[3] = 1
    else
        MPRogueSaved.BloodyStar[3] = 0
    end
end)
-- 创建单选框 - 4星
CB_Bloody[4] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 210, postion_y, "4")
CB_Bloody[4]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.BloodyStar[4] = 1
    else
        MPRogueSaved.BloodyStar[4] = 0
    end
end)
-- 创建单选框 - 5星
CB_Bloody[5] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 260, postion_y, "5")
CB_Bloody[5]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.BloodyStar[5] = 1
    else
        MPRogueSaved.BloodyStar[5] = 0
    end
end)

postion_y = postion_y+5




-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Target = 1
    else
        MPRogueSaved.Target = 0
    end
end)



postion_y = postion_y-30


postion_y = postion_y-5
local CB_ExposeArmorTipText = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
CB_ExposeArmorTipText:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y+30)
CB_ExposeArmorTipText:SetWidth(250)
CB_ExposeArmorTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
CB_ExposeArmorTipText:SetTextColor(1, 0.8, 0)
CB_ExposeArmorTipText:SetJustifyH("LEFT")
CB_ExposeArmorTipText:SetText("破甲")

-- 创建单选框 - 破甲
local CB_ExposeArmor = {}
CB_ExposeArmor[1] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 60, postion_y, "1")
CB_ExposeArmor[1]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.ExposeArmorStar[1] = 1
    else
        MPRogueSaved.ExposeArmorStar[1] = 0
    end
end)
-- 创建单选框 - 2星
CB_ExposeArmor[2] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 110, postion_y, "2")
CB_ExposeArmor[2]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.ExposeArmorStar[2] = 1
    else
        MPRogueSaved.ExposeArmorStar[2] = 0
    end
end)
-- 创建单选框 - 3星
CB_ExposeArmor[3] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 160, postion_y, "3")
CB_ExposeArmor[3]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.ExposeArmorStar[3] = 1
    else
        MPRogueSaved.ExposeArmorStar[3] = 0
    end
end)
-- 创建单选框 - 4星
CB_ExposeArmor[4] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 210, postion_y, "4")
CB_ExposeArmor[4]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.ExposeArmorStar[4] = 1
    else
        MPRogueSaved.ExposeArmorStar[4] = 0
    end
end)
-- 创建单选框 - 5星
CB_ExposeArmor[5] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 260, postion_y, "5")
CB_ExposeArmor[5]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.ExposeArmorStar[5] = 1
    else
        MPRogueSaved.ExposeArmorStar[5] = 0
    end
end)
postion_y = postion_y+5


-- 创建单选框 - 潜行
local checkButton_Stealth = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "潜行时自动 伏击/绞喉")
checkButton_Stealth:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Stealth = 1
    else
        MPRogueSaved.Stealth = 0
    end
end)



postion_y = postion_y-30


postion_y = postion_y-5
local CB_AdrenalineTipText = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
CB_AdrenalineTipText:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y+35)
CB_AdrenalineTipText:SetWidth(250)
CB_AdrenalineTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
CB_AdrenalineTipText:SetTextColor(1, 0.8, 0)
CB_AdrenalineTipText:SetJustifyH("LEFT")
CB_AdrenalineTipText:SetText("兴奋")

-- 创建单选框 - 兴奋
local CB_Adrenaline = {}
CB_Adrenaline[1] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 60, postion_y, "1")
CB_Adrenaline[1]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.AdrenalineStar[1] = 1
    else
        MPRogueSaved.AdrenalineStar[1] = 0
    end
end)
-- 创建单选框 - 2星
CB_Adrenaline[2] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 110, postion_y, "2")
CB_Adrenaline[2]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.AdrenalineStar[2] = 1
    else
        MPRogueSaved.AdrenalineStar[2] = 0
    end
end)
-- 创建单选框 - 3星
CB_Adrenaline[3] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 160, postion_y, "3")
CB_Adrenaline[3]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.AdrenalineStar[3] = 1
    else
        MPRogueSaved.AdrenalineStar[3] = 0
    end
end)
-- 创建单选框 - 4星
CB_Adrenaline[4] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 210, postion_y, "4")
CB_Adrenaline[4]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.AdrenalineStar[4] = 1
    else
        MPRogueSaved.AdrenalineStar[4] = 0
    end
end)
-- 创建单选框 - 5星
CB_Adrenaline[5] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 260, postion_y, "5")
CB_Adrenaline[5]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.AdrenalineStar[5] = 1
    else
        MPRogueSaved.AdrenalineStar[5] = 0
    end
end)
postion_y = postion_y+5


-- 创建单选框 - 还击
local checkButton_Riposte = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "启用 还击")
checkButton_Riposte:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Riposte = 1
    else
        MPRogueSaved.Riposte = 0
    end
end)



postion_y = postion_y-30


postion_y = postion_y-5
local CB_EviscerateTipText = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
CB_EviscerateTipText:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y+42)
CB_EviscerateTipText:SetWidth(250)
CB_EviscerateTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
CB_EviscerateTipText:SetTextColor(1, 0.8, 0)
CB_EviscerateTipText:SetJustifyH("LEFT")
CB_EviscerateTipText:SetText("剔骨")

-- 创建单选框 - 剔骨
local CB_Eviscerate = {}
CB_Eviscerate[1] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 60, postion_y, "1")
CB_Eviscerate[1]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EviscerateStar[1] = 1
    else
        MPRogueSaved.EviscerateStar[1] = 0
    end
end)
-- 创建单选框 - 2星
CB_Eviscerate[2] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 110, postion_y, "2")
CB_Eviscerate[2]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EviscerateStar[2] = 1
    else
        MPRogueSaved.EviscerateStar[2] = 0
    end
end)
-- 创建单选框 - 3星
CB_Eviscerate[3] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 160, postion_y, "3")
CB_Eviscerate[3]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EviscerateStar[3] = 1
    else
        MPRogueSaved.EviscerateStar[3] = 0
    end
end)
-- 创建单选框 - 4星
CB_Eviscerate[4] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 210, postion_y, "4")
CB_Eviscerate[4]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EviscerateStar[4] = 1
    else
        MPRogueSaved.EviscerateStar[4] = 0
    end
end)
-- 创建单选框 - 5星
CB_Eviscerate[5] = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 260, postion_y, "5")
CB_Eviscerate[5]:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.EviscerateStar[5] = 1
    else
        MPRogueSaved.EviscerateStar[5] = 0
    end
end)
postion_y = postion_y+5


-- 创建单选框 - 鬼魅攻击
local checkButton_GhostlyStrike = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "启用 鬼魅攻击")
checkButton_GhostlyStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.GhostlyStrike = 1
    else
        MPRogueSaved.GhostlyStrike = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 突袭
local checkButton_SurpriseStrike = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "启用 突袭")
checkButton_SurpriseStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.SurpriseStrike = 1
    else
        MPRogueSaved.SurpriseStrike = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 佯攻
local checkButton_Feint = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "启用 佯攻 (需要TWT插件)")
checkButton_Feint:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Feint = 1
    else
        MPRogueSaved.Feint = 0
    end
end)








-- 主技能


postion_y = postion_y+20

-- 添加提示内容区域
local TipText1 = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("主技能配置(单选)")


postion_y = postion_y-90

-- 创建单选框 - 邪恶攻击
local checkButton_Sinister = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 20, postion_y, "邪恶攻击")

-- 创建单选框 - 双刃毒袭
local checkButton_Poison = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 175, postion_y, "双刃毒袭")

-- 创建单选框 - 出血
local checkButton_Hemo = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 330, postion_y, "出血")

-- 创建单选框 - 背刺
local checkButton_Backstab = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 485, postion_y, "背刺")


-- 邪恶攻击点击事件
checkButton_Sinister:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Sinister = 1
        MPRogueSaved.Poison = 0
        MPRogueSaved.Hemo = 0
        MPRogueSaved.Backstab = 0
    else
        MPRogueSaved.Sinister = 0
    end
    checkButton_Sinister:SetChecked(ToBoolean(MPRogueSaved.Sinister))
    checkButton_Poison:SetChecked(ToBoolean(MPRogueSaved.Poison))
    checkButton_Hemo:SetChecked(ToBoolean(MPRogueSaved.Hemo))
    checkButton_Backstab:SetChecked(ToBoolean(MPRogueSaved.Backstab))
end)

-- 双刃毒袭点击事件
checkButton_Poison:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Sinister = 0
        MPRogueSaved.Poison = 1
        MPRogueSaved.Hemo = 0
        MPRogueSaved.Backstab = 0
    else
        MPRogueSaved.Poison = 0
    end
    checkButton_Sinister:SetChecked(ToBoolean(MPRogueSaved.Sinister))
    checkButton_Poison:SetChecked(ToBoolean(MPRogueSaved.Poison))
    checkButton_Hemo:SetChecked(ToBoolean(MPRogueSaved.Hemo))
    checkButton_Backstab:SetChecked(ToBoolean(MPRogueSaved.Backstab))
end)

-- 出血点击事件
checkButton_Hemo:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Sinister = 0
        MPRogueSaved.Poison = 0
        MPRogueSaved.Hemo = 1
        MPRogueSaved.Backstab = 0
    else
        MPRogueSaved.Hemo = 0
    end
    checkButton_Sinister:SetChecked(ToBoolean(MPRogueSaved.Sinister))
    checkButton_Poison:SetChecked(ToBoolean(MPRogueSaved.Poison))
    checkButton_Hemo:SetChecked(ToBoolean(MPRogueSaved.Hemo))
    checkButton_Backstab:SetChecked(ToBoolean(MPRogueSaved.Backstab))
end)

-- 背刺点击事件
checkButton_Backstab:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Sinister = 0
        MPRogueSaved.Poison = 0
        MPRogueSaved.Hemo = 0
        MPRogueSaved.Backstab = 1
    else
        MPRogueSaved.Backstab = 0
    end
    checkButton_Sinister:SetChecked(ToBoolean(MPRogueSaved.Sinister))
    checkButton_Poison:SetChecked(ToBoolean(MPRogueSaved.Poison))
    checkButton_Hemo:SetChecked(ToBoolean(MPRogueSaved.Hemo))
    checkButton_Backstab:SetChecked(ToBoolean(MPRogueSaved.Backstab))
end)







-- 毒药


postion_y = postion_y+30

-- 添加提示内容区域
local TipText1 = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(450)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("毒药配置")




postion_y = postion_y-105

-- 主手
local checkButton_MainHand = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 20, postion_y, "主手")
checkButton_MainHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.MainHand = 1
    else
        MPRogueSaved.MainHand = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_MainHand = {
    [1] = {text = "溶解毒药 II", value = 1},
    [2] = {text = "速效毒药 VI", value = 2},
    [3] = {text = "腐蚀毒药 II", value = 3},
    [4] = {text = "致命毒药 V",   value = 4},
    [5] = {text = "致命毒药 IV",   value = 5},
    [6] = {text = "麻痹毒药 III",   value = 6},
    [7] = {text = "致残毒药 II",   value = 7},
    [8] = {text = "致伤毒药",   value = 8},
}

-- 创建下拉菜单
local dropdown_MainHand = CreateFrame("Button", ADDON_NAME.."Dropdown_MainHand", checkButton_MainHand, "UIDropDownMenuTemplate")
dropdown_MainHand:SetPoint("TOPLEFT", checkButton_MainHand, "TOPLEFT", 80, 0)

-- 菜单初始化
local function Dropdown_Init_MainHand()
    for idx, data in pairs(modes_MainHand) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_MainHand, index)
                MPRogueSaved.MainHand_Value = modes_MainHand[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_MainHand, Dropdown_Init_MainHand)
UIDropDownMenu_SetSelectedID(dropdown_MainHand, 1) -- 默认选中第一项


-- 主手毒药次数
local slider_MainHandCount = CreateFrame("Slider", ADDON_NAME.."Slider_MainHandCount", CatUISettingsRogue, "OptionsSliderTemplate")
slider_MainHandCount:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y+30)
slider_MainHandCount:SetWidth(220) -- 拖动条长度
slider_MainHandCount:SetHeight(16) -- 拖动条高度

slider_MainHandCount:SetMinMaxValues(1, 100)
slider_MainHandCount:SetValueStep(1)
slider_MainHandCount:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_MainHandCount)

_G[slider_MainHandCount:GetName().."Text"]:SetText("")
_G[slider_MainHandCount:GetName().."Low"]:Hide()
_G[slider_MainHandCount:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_MainHandCount:SetScript("OnValueChanged", function()
    MPRogueSaved.MainHandCount = arg1
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..arg1.." 补充")
end)



-- 副手
local checkButton_OffHand = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "副手")
checkButton_OffHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.OffHand = 1
    else
        MPRogueSaved.OffHand = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_OffHand = {
    [1] = {text = "溶解毒药 II", value = 1},
    [2] = {text = "速效毒药 VI", value = 2},
    [3] = {text = "腐蚀毒药 II", value = 3},
    [4] = {text = "致命毒药 V",   value = 4},
    [5] = {text = "致命毒药 IV",   value = 5},
    [6] = {text = "麻痹毒药 III",   value = 6},
    [7] = {text = "致残毒药 II",   value = 7},
    [8] = {text = "致伤毒药",   value = 8},
}

-- 创建下拉菜单
local dropdown_OffHand = CreateFrame("Button", ADDON_NAME.."Dropdown_OffHand", checkButton_OffHand, "UIDropDownMenuTemplate")
dropdown_OffHand:SetPoint("TOPLEFT", checkButton_OffHand, "TOPLEFT", 80, 0)

-- 菜单初始化
local function Dropdown_Init_OffHand()
    for idx, data in pairs(modes_OffHand) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_OffHand, index)
                MPRogueSaved.OffHand_Value = modes_OffHand[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_OffHand, Dropdown_Init_OffHand)
UIDropDownMenu_SetSelectedID(dropdown_OffHand, 1) -- 默认选中第一项

-- 副手毒药次数
local slider_OffHandCount = CreateFrame("Slider", ADDON_NAME.."Slider_OffHandCount", CatUISettingsRogue, "OptionsSliderTemplate")
slider_OffHandCount:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 275, postion_y+30)
slider_OffHandCount:SetWidth(220) -- 拖动条长度
slider_OffHandCount:SetHeight(16) -- 拖动条高度

slider_OffHandCount:SetMinMaxValues(1, 100)
slider_OffHandCount:SetValueStep(1)
slider_OffHandCount:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_OffHandCount)

-- 值变化时的回调函数
slider_OffHandCount:SetScript("OnValueChanged", function()
    MPRogueSaved.OffHandCount = arg1
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..arg1.." 补充")
end)


postion_y = postion_y-100

-- 脱战上毒
local checkButton_LeaveFight = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 20, postion_y, "补毒药 仅在脱离战斗时")
checkButton_LeaveFight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.LeaveFight = 1
    else
        MPRogueSaved.LeaveFight = 0
    end
end)


-- 覆盖旧毒药
local checkButton_Cover = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "覆盖原武器上不同的毒药")
checkButton_Cover:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Cover = 1
    else
        MPRogueSaved.Cover = 0
    end
end)







-- 高级

postion_y = postion_y+65

-- 添加提示内容区域
local TipText1 = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-140

-- 创建单选框 - UnitXP
local checkButton_UnitXP = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 20, postion_y, "启用UnitXP模组 (朝向判断)")
-- 设置点击事件
checkButton_UnitXP:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.UnitXP = 1
    else
        MPRogueSaved.UnitXP = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPRogueSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueSaved.HealthStone_Value .."%|r")
    else
        MPRogueSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 剑刃乱舞
local checkButton_BladeFlurry = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 20, postion_y, "自动 剑刃乱舞")
local slider_BladeFlurry_Value = CreateFrame("Slider", ADDON_NAME.."Slider_BladeFlurry_Value", checkButton_BladeFlurry, "OptionsSliderTemplate")
slider_BladeFlurry_Value:SetPoint("RIGHT", checkButton_BladeFlurry, "RIGHT", 260, -2)
slider_BladeFlurry_Value:SetWidth(150) -- 拖动条长度
slider_BladeFlurry_Value:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_BladeFlurry_Value:SetMinMaxValues(5, 20)
slider_BladeFlurry_Value:SetValueStep(1)
slider_BladeFlurry_Value:SetValue(8) -- 默认值
MPCatUISliderRegionHide(slider_BladeFlurry_Value)

local color_BladeFlurry = "|cFFFFD100"

_G[slider_BladeFlurry_Value:GetName().."Low"]:Hide()
_G[slider_BladeFlurry_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_BladeFlurry_Value:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPRogueSaved.BladeFlurry_Value = arg1
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueSaved.BladeFlurry_Value .."码|r")
end)

-- 设置点击事件
checkButton_BladeFlurry:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.BladeFlurry = 1
        color_BladeFlurry = "|cFFFFD100"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueSaved.BladeFlurry_Value .."码|r")
    else
        MPRogueSaved.BladeFlurry = 0
        color_BladeFlurry = "|cFF888888"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueSaved.BladeFlurry_Value .."码|r")
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPRogueSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueSaved.HerbalTea_Value .."%|r")
    else
        MPRogueSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40

-- 创建单选框 - buff时间
local checkButton_LeftTime = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 20, postion_y, "提前保持Buff\n(SuperWoW)")

local slider_LeftTime = CreateFrame("Slider", ADDON_NAME.."Slider_SliceDiceTime", checkButton_LeftTime, "OptionsSliderTemplate")
slider_LeftTime:SetPoint("RIGHT", checkButton_LeftTime, "RIGHT", 260, -2)
slider_LeftTime:SetWidth(150) -- 拖动条长度
slider_LeftTime:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_LeftTime:SetMinMaxValues(0, 10)
slider_LeftTime:SetValueStep(1)
slider_LeftTime:SetValue(5) -- 默认值
MPCatUISliderRegionHide(slider_LeftTime)

local color_LeftTime = "|cFFFFD100"

_G[slider_LeftTime:GetName().."Text"]:SetText(color_LeftTime.."提前 5 秒|r")
-- 值变化时的回调函数
slider_LeftTime:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPRogueSaved.LeftTime_Value = arg1
    _G[slider_LeftTime:GetName().."Text"]:SetText(color_LeftTime.."提前 ".. MPRogueSaved.LeftTime_Value .." 秒|r")
end)

-- 设置点击事件
checkButton_LeftTime:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.LeftTime = 1
        color_LeftTime = "|cFFFFD100"
        _G[slider_LeftTime:GetName().."Text"]:SetText(color_LeftTime.."提前 ".. MPRogueSaved.LeftTime_Value .." 秒|r")
    else
        MPRogueSaved.LeftTime = 0
        color_LeftTime = "|cFF888888"
        _G[slider_LeftTime:GetName().."Text"]:SetText(color_LeftTime.."提前 ".. MPRogueSaved.LeftTime_Value .." 秒|r")
    end
end)


-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "自动 鞭根块茎")

local slider_Carrot = CreateFrame("Slider", ADDON_NAME.."Slider_Carrot", checkButton_Carrot, "OptionsSliderTemplate")
slider_Carrot:SetPoint("RIGHT", checkButton_Carrot, "RIGHT", 250, -2)
slider_Carrot:SetWidth(150) -- 拖动条长度
slider_Carrot:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Carrot:SetMinMaxValues(0, 100)
slider_Carrot:SetValueStep(1)
slider_Carrot:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Carrot)

local color_Carrot = "|cFFFFD100"

_G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: 20%|r")
_G[slider_Carrot:GetName().."Low"]:Hide()
_G[slider_Carrot:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_Carrot:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPRogueSaved.Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueSaved.Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueSaved.Carrot_Value .."%|r")
    else
        MPRogueSaved.Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueSaved.Carrot_Value .."%|r")
    end
end)





postion_y = postion_y-40


-- 创建单选框 - 背刺 改 邪恶
local checkButton_SinisterStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogue, "UICheckButtonTemplate")
checkButton_SinisterStrike:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 20, postion_y)
checkButton_SinisterStrike:SetScale(0.8)

-- 添加文字标签
local checkText_SinisterStrike = checkButton_SinisterStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SinisterStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SinisterStrike:SetTextColor(1, 1, 1)
checkText_SinisterStrike:SetPoint("LEFT", checkButton_SinisterStrike, "LEFT", 34, 1)
checkText_SinisterStrike:SetText("背刺 不可用时启用 邪恶攻击")

-- 设置点击事件
checkButton_SinisterStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.SinisterStrike = 1
    else
        MPRogueSaved.SinisterStrike = 0
    end
end)



-- 创建单选框 - 自动打断
local checkButton_Interrupt = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "自动 打断读条 (SuperWoW)")
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Interrupt = 1
    else
        MPRogueSaved.Interrupt = 0
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 保护剑刃乱舞
local checkButton_Protect = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 20, postion_y, "保护剑刃乱舞 自动取消无用Buff")
checkButton_Protect:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Protect = 1
    else
        MPRogueSaved.Protect = 0
    end
end)

-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启 种族天赋 (爆发类)")
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.RacialTraits = 1
    else
        MPRogueSaved.RacialTraits = 0
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Soulspeed = 1
    else
        MPRogueSaved.Soulspeed = 0
    end
end)





-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsRogue, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsRogue, "TOPLEFT", 120, -44)
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
    MPResetRogueSettings()
    MPInitRogueSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsRogue)

local checkButton_Power = MPPublicCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Power = 1
    else
        MPRogueSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueSaved.Pick = 1
    else
        MPRogueSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsRogue, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)

-- 添加提示内容区域
local TipText = CatUISettingsRogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsRogue, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFFFFF569/rdps|r ]")



-- 配置文件版本号
local RogueSettingsUIVersion = 27

function MPResetRogueSettings()

    MPRogueSaved.Version = RogueSettingsUIVersion

    -- 基本配置

    MPRogueSaved.Trinket_Upper = 1
    MPRogueSaved.TUBoss = 0
    MPRogueSaved.Trinket_Below = 1
    MPRogueSaved.TBBoss = 0
    MPRogueSaved.Target = 0

    MPRogueSaved.SliceDice = 1
    MPRogueSaved.Bloody = 1
    MPRogueSaved.Eviscerate = 1
    MPRogueSaved.Envenom = 1
    MPRogueSaved.ExposeArmor = 0
    MPRogueSaved.Adrenaline = 0

    MPRogueSaved.SurpriseStrike = 0
    MPRogueSaved.GhostlyStrike = 0
    MPRogueSaved.Stealth = 1
    MPRogueSaved.Hemorrhage = 0
    MPRogueSaved.Riposte = 0
    MPRogueSaved.Feint = 0

    MPRogueSaved.Sinister = 1
    MPRogueSaved.Poison = 0
    MPRogueSaved.Hemo = 0
    MPRogueSaved.Backstab = 0


    -- 毒药
    MPRogueSaved.MainHand = 0
    MPRogueSaved.OffHand = 0
    MPRogueSaved.MainHand_Value = "溶解毒药 II"
    MPRogueSaved.OffHand_Value = "溶解毒药 II"
    MPRogueSaved.MainHandCount = 50
    MPRogueSaved.OffHandCount = 50
    MPRogueSaved.LeaveFight = 0
    MPRogueSaved.Cover = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPRogueSaved.HealthStone = 1
    MPRogueSaved.HealthStone_Value = 30
    MPRogueSaved.HerbalTea = 1
    MPRogueSaved.HerbalTea_Value = 20
    MPRogueSaved.Carrot = 0
    MPRogueSaved.Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPRogueSaved.SuperWoW = 1
    MPRogueSaved.UnitXP = 0


    -- 星星

    MPRogueSaved.SliceDiceStar = {}
    MPRogueSaved.SliceDiceStar[1] = 1
    MPRogueSaved.SliceDiceStar[2] = 1
    MPRogueSaved.SliceDiceStar[3] = 0
    MPRogueSaved.SliceDiceStar[4] = 0
    MPRogueSaved.SliceDiceStar[5] = 0

    MPRogueSaved.EnvenomStar = {}
    MPRogueSaved.EnvenomStar[1] = 1
    MPRogueSaved.EnvenomStar[2] = 1
    MPRogueSaved.EnvenomStar[3] = 0
    MPRogueSaved.EnvenomStar[4] = 0
    MPRogueSaved.EnvenomStar[5] = 0

    MPRogueSaved.BloodyStar = {}
    MPRogueSaved.BloodyStar[1] = 0
    MPRogueSaved.BloodyStar[2] = 0
    MPRogueSaved.BloodyStar[3] = 0
    MPRogueSaved.BloodyStar[4] = 0
    MPRogueSaved.BloodyStar[5] = 1

    MPRogueSaved.EviscerateStar = {}
    MPRogueSaved.EviscerateStar[1] = 0
    MPRogueSaved.EviscerateStar[2] = 0
    MPRogueSaved.EviscerateStar[3] = 0
    MPRogueSaved.EviscerateStar[4] = 1
    MPRogueSaved.EviscerateStar[5] = 1

    MPRogueSaved.ExposeArmorStar = {}
    MPRogueSaved.ExposeArmorStar[1] = 0
    MPRogueSaved.ExposeArmorStar[2] = 0
    MPRogueSaved.ExposeArmorStar[3] = 0
    MPRogueSaved.ExposeArmorStar[4] = 0
    MPRogueSaved.ExposeArmorStar[5] = 0

    MPRogueSaved.AdrenalineStar = {}
    MPRogueSaved.AdrenalineStar[1] = 0
    MPRogueSaved.AdrenalineStar[2] = 0
    MPRogueSaved.AdrenalineStar[3] = 0
    MPRogueSaved.AdrenalineStar[4] = 0
    MPRogueSaved.AdrenalineStar[5] = 0


    MPRogueSaved.Interrupt = 0
    MPRogueSaved.RacialTraits = 0
    MPRogueSaved.Soulspeed = 0

    MPRogueSaved.LeftTime = 1
    MPRogueSaved.LeftTime_Value = 2

    MPRogueSaved.BladeFlurry = 0
    MPRogueSaved.BladeFlurry_Value = 10
    MPRogueSaved.Protect = 0

    MPRogueSaved.SinisterStrike = 1

    -- 通用
    MPRogueSaved.Power = 0
    MPRogueSaved.Pick = 0

end


local function InitRogueSettingsPart1()

    checkButton_Riposte:SetChecked(ToBoolean(MPRogueSaved.Riposte))
    checkButton_SurpriseStrike:SetChecked(ToBoolean(MPRogueSaved.SurpriseStrike))
    checkButton_GhostlyStrike:SetChecked(ToBoolean(MPRogueSaved.GhostlyStrike))
    checkButton_Stealth:SetChecked(ToBoolean(MPRogueSaved.Stealth))

    checkButton_Sinister:SetChecked(ToBoolean(MPRogueSaved.Sinister))
    checkButton_Poison:SetChecked(ToBoolean(MPRogueSaved.Poison))
    checkButton_Hemo:SetChecked(ToBoolean(MPRogueSaved.Hemo))
    checkButton_Backstab:SetChecked(ToBoolean(MPRogueSaved.Backstab))
    checkButton_Feint:SetChecked(ToBoolean(MPRogueSaved.Feint))

    checkButton_Target:SetChecked(ToBoolean(MPRogueSaved.Target))
    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPRogueSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPRogueSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPRogueSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPRogueSaved.TBBoss))
    checkButton_UnitXP:SetChecked(ToBoolean(MPRogueSaved.UnitXP))

    checkButton_Interrupt:SetChecked(ToBoolean(MPRogueSaved.Interrupt))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPRogueSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPRogueSaved.Soulspeed))

    checkButton_Protect:SetChecked(MPRogueSaved.Protect)
    checkButton_SinisterStrike:SetChecked(MPRogueSaved.SinisterStrike)

    checkButton_LeaveFight:SetChecked(ToBoolean(MPRogueSaved.LeaveFight))
    checkButton_Cover:SetChecked(ToBoolean(MPRogueSaved.Cover))

    checkButton_Power:SetChecked(ToBoolean(MPRogueSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPRogueSaved.Pick))
end

local function InitRogueSettingsPart2()

    for i = 1, 5, 1 do
        CB_SliceDice[i]:SetChecked(ToBoolean(MPRogueSaved.SliceDiceStar[i]))
        CB_Envenom[i]:SetChecked(ToBoolean(MPRogueSaved.EnvenomStar[i]))
        CB_Bloody[i]:SetChecked(ToBoolean(MPRogueSaved.BloodyStar[i]))
        CB_Eviscerate[i]:SetChecked(ToBoolean(MPRogueSaved.EviscerateStar[i]))
        CB_ExposeArmor[i]:SetChecked(ToBoolean(MPRogueSaved.ExposeArmorStar[i]))
        CB_Adrenaline[i]:SetChecked(ToBoolean(MPRogueSaved.AdrenalineStar[i]))
    end

end

function MPInitRogueSettings()
    if not MPRogueSaved then
        MPRogueSaved = {}
        MPResetRogueSettings()
    end

    if MPRogueSaved.Version ~= RogueSettingsUIVersion then
        MPResetRogueSettings()
    end

    InitRogueSettingsPart1()
    InitRogueSettingsPart2()


    checkButton_HealthStone:SetChecked(ToBoolean(MPRogueSaved.HealthStone))
    slider_HealthStone:SetValue(MPRogueSaved.HealthStone_Value)
    if MPRogueSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueSaved.HealthStone_Value .."%|r")



    checkButton_HerbalTea:SetChecked(MPRogueSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPRogueSaved.HerbalTea_Value)
    if MPRogueSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueSaved.HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPRogueSaved.Carrot)
    slider_Carrot:SetValue(MPRogueSaved.Carrot_Value)
    if MPRogueSaved.Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueSaved.Carrot_Value .."%|r")


    checkButton_BladeFlurry:SetChecked(MPRogueSaved.BladeFlurry)
    slider_BladeFlurry_Value:SetValue(MPRogueSaved.BladeFlurry_Value)
    if MPRogueSaved.BladeFlurry==1 then
        color_BladeFlurry = "|cFFFFD100"
    else
        color_BladeFlurry = "|cFF888888"
    end
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueSaved.BladeFlurry_Value .."码|r")



    checkButton_LeftTime:SetChecked(MPRogueSaved.LeftTime)
    slider_LeftTime:SetValue(MPRogueSaved.LeftTime_Value)
    if MPRogueSaved.LeftTime==1 then
        color_LeftTime = "|cFFFFD100"
    else
        color_LeftTime = "|cFF888888"
    end
    _G[slider_LeftTime:GetName().."Text"]:SetText(color_LeftTime.."提前 ".. MPRogueSaved.LeftTime_Value .." 秒|r")



    checkButton_MainHand:SetChecked(ToBoolean(MPRogueSaved.MainHand))
    for idx_MainHand, data_MainHand in pairs(modes_MainHand) do
        if string.find(data_MainHand.text, MPRogueSaved.MainHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_MainHand, data_MainHand.value)
            _G[dropdown_MainHand:GetName().."Text"]:SetText(data_MainHand.text)
        end
    end

    checkButton_OffHand:SetChecked(ToBoolean(MPRogueSaved.OffHand))
    for idx_OffHand, data_OffHand in pairs(modes_OffHand) do
        if string.find(data_OffHand.text, MPRogueSaved.OffHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_OffHand, data_OffHand.value)
            _G[dropdown_OffHand:GetName().."Text"]:SetText(data_OffHand.text)
        end
    end

    slider_MainHandCount:SetValue(MPRogueSaved.MainHandCount)
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..MPRogueSaved.MainHandCount.." 补充")
    slider_OffHandCount:SetValue(MPRogueSaved.OffHandCount)
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..MPRogueSaved.OffHandCount.." 补充")

end

