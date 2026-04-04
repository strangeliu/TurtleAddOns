
-- 定义插件名称
local ADDON_NAME = "Settings-WarlockSD"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsWarlockSD = MPCreateFrame(ADDON_NAME.."Frame", 520, 600, "|cFF9482C9设置 - 暗毁术|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsWarlockSD:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 痛苦诅咒
local checkButton_CurseAgony = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_CurseAgony:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_CurseAgony:SetScale(0.8)

-- 添加文字标签
local checkText_CurseAgony = checkButton_CurseAgony:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CurseAgony:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CurseAgony:SetTextColor(1, 1, 1)
checkText_CurseAgony:SetPoint("LEFT", checkButton_CurseAgony, "LEFT", 34, 1)
checkText_CurseAgony:SetText("保持 痛苦诅咒")

-- 设置点击事件
checkButton_CurseAgony:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseAgony = 1
    else
        MPWarlockSDSaved.CurseAgony = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
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
        MPWarlockSDSaved.Trinket_Upper = 1
    else
        MPWarlockSDSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.TUBoss = 1
    else
        MPWarlockSDSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 腐蚀术​
local checkButton_Corruption = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_Corruption:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_Corruption:SetScale(0.8)

-- 添加文字标签
local checkText_Corruption = checkButton_Corruption:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Corruption:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Corruption:SetTextColor(1, 1, 1)
checkText_Corruption:SetPoint("LEFT", checkButton_Corruption, "LEFT", 34, 1)
checkText_Corruption:SetText("保持 腐蚀术​")

-- 设置点击事件
checkButton_Corruption:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.Corruption = 1
    else
        MPWarlockSDSaved.Corruption = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
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
        MPWarlockSDSaved.Trinket_Below = 1
    else
        MPWarlockSDSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.TBBoss = 1
    else
        MPWarlockSDSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 生命虹吸
local checkButton_SiphonLife = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_SiphonLife:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_SiphonLife:SetScale(0.8)

-- 添加文字标签
local checkText_SiphonLife = checkButton_SiphonLife:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SiphonLife:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SiphonLife:SetTextColor(1, 1, 1)
checkText_SiphonLife:SetPoint("LEFT", checkButton_SiphonLife, "LEFT", 34, 1)
checkText_SiphonLife:SetText("保持 生命虹吸 (自动识别天赋)")

-- 设置点击事件
checkButton_SiphonLife:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.SiphonLife = 1
    else
        MPWarlockSDSaved.SiphonLife = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
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
        MPWarlockSDSaved.Target = 1
    else
        MPWarlockSDSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 献祭
local checkButton_Immolate = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_Immolate:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_Immolate:SetScale(0.8)

-- 添加文字标签
local checkText_Immolate = checkButton_Immolate:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Immolate:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Immolate:SetTextColor(1, 1, 1)
checkText_Immolate:SetPoint("LEFT", checkButton_Immolate, "LEFT", 34, 1)
checkText_Immolate:SetText("保持 献祭")

-- 设置点击事件
checkButton_Immolate:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.Immolate = 1
    else
        MPWarlockSDSaved.Immolate = 0
    end
end)


-- 创建单选框 - 超越之力
local checkButton_Overpowering = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_Overpowering:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
checkButton_Overpowering:SetScale(0.8)

-- 添加文字标签
local checkText_Overpowering = checkButton_Overpowering:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Overpowering:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Overpowering:SetTextColor(1, 1, 1)
checkText_Overpowering:SetPoint("LEFT", checkButton_Overpowering, "LEFT", 34, 1)
checkText_Overpowering:SetText("开启 超越之力 (自动识别天赋)")

-- 设置点击事件
checkButton_Overpowering:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.Overpowering = 1
    else
        MPWarlockSDSaved.Overpowering = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 暗影灼烧
local checkButton_Shadowburn = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_Shadowburn:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_Shadowburn:SetScale(0.8)

-- 添加文字标签
local checkText_Shadowburn = checkButton_Shadowburn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Shadowburn:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Shadowburn:SetTextColor(1, 1, 1)
checkText_Shadowburn:SetPoint("LEFT", checkButton_Shadowburn, "LEFT", 34, 1)
checkText_Shadowburn:SetText("开启 暗影灼烧 (自动识别天赋)")

-- 设置点击事件
checkButton_Shadowburn:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.Shadowburn = 1
    else
        MPWarlockSDSaved.Shadowburn = 0
    end
end)

-- 创建单选框 - 宠物自动攻击
local checkButton_PetAttack = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_PetAttack:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
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
        MPWarlockSDSaved.PetAttack = 1
    else
        MPWarlockSDSaved.PetAttack = 0
    end
end)







-- 团队诅咒


postion_y = postion_y-10

-- 添加提示内容区域
local TipTextTeam = CatUISettingsWarlockSD:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipTextTeam:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
TipTextTeam:SetWidth(250)
TipTextTeam:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipTextTeam:SetTextColor(1, 0.8, 0)
TipTextTeam:SetJustifyH("LEFT")
TipTextTeam:SetText("大诅咒配置 (单选)")


postion_y = postion_y-80

-- 创建单选框 - 鲁莽诅咒
local checkButton_CurseRecklessness = MPCreateCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 20, postion_y, "鲁莽")

-- 创建单选框 - 元素诅咒
local checkButton_CurseElements = MPCreateCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 105, postion_y, "元素")

-- 创建单选框 - 暗影诅咒
local checkButton_CurseShadow = MPCreateCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 190, postion_y, "暗影")

-- 创建单选框 - 厄运诅咒
local checkButton_CurseDoom = MPCreateCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 275, postion_y, "厄运")

-- 创建单选框 - 语言诅咒
local checkButton_CurseTongues = MPCreateCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 360, postion_y, "语言")

-- 创建单选框 - 虚弱诅咒
local checkButton_CurseWeakness = MPCreateCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 445, postion_y, "虚弱")

-- 创建单选框 - 疲劳诅咒
local checkButton_CurseFatigue = MPCreateCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 530, postion_y, "疲劳")


checkButton_CurseRecklessness:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseRecklessness = 1
        MPWarlockSDSaved.CurseElements = 0
        MPWarlockSDSaved.CurseShadow = 0
        MPWarlockSDSaved.CurseDoom = 0
        MPWarlockSDSaved.CurseTongues = 0
        MPWarlockSDSaved.CurseWeakness = 0
        MPWarlockSDSaved.CurseFatigue = 0
    else
        MPWarlockSDSaved.CurseRecklessness = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockSDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockSDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockSDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockSDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockSDSaved.CurseFatigue))

end)

checkButton_CurseElements:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseRecklessness = 0
        MPWarlockSDSaved.CurseElements = 1
        MPWarlockSDSaved.CurseShadow = 0
        MPWarlockSDSaved.CurseDoom = 0
        MPWarlockSDSaved.CurseTongues = 0
        MPWarlockSDSaved.CurseWeakness = 0
        MPWarlockSDSaved.CurseFatigue = 0
    else
        MPWarlockSDSaved.CurseElements = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockSDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockSDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockSDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockSDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockSDSaved.CurseFatigue))

end)

checkButton_CurseShadow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseRecklessness = 0
        MPWarlockSDSaved.CurseElements = 0
        MPWarlockSDSaved.CurseShadow = 1
        MPWarlockSDSaved.CurseDoom = 0
        MPWarlockSDSaved.CurseTongues = 0
        MPWarlockSDSaved.CurseWeakness = 0
        MPWarlockSDSaved.CurseFatigue = 0
    else
        MPWarlockSDSaved.CurseShadow = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockSDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockSDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockSDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockSDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockSDSaved.CurseFatigue))

end)

checkButton_CurseDoom:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseRecklessness = 0
        MPWarlockSDSaved.CurseElements = 0
        MPWarlockSDSaved.CurseShadow = 0
        MPWarlockSDSaved.CurseDoom = 1
        MPWarlockSDSaved.CurseTongues = 0
        MPWarlockSDSaved.CurseWeakness = 0
        MPWarlockSDSaved.CurseFatigue = 0
    else
        MPWarlockSDSaved.CurseDoom = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockSDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockSDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockSDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockSDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockSDSaved.CurseFatigue))

end)

checkButton_CurseTongues:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseRecklessness = 0
        MPWarlockSDSaved.CurseElements = 0
        MPWarlockSDSaved.CurseShadow = 0
        MPWarlockSDSaved.CurseDoom = 0
        MPWarlockSDSaved.CurseTongues = 1
        MPWarlockSDSaved.CurseWeakness = 0
        MPWarlockSDSaved.CurseFatigue = 0
    else
        MPWarlockSDSaved.CurseTongues = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockSDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockSDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockSDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockSDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockSDSaved.CurseFatigue))

end)

checkButton_CurseWeakness:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseRecklessness = 0
        MPWarlockSDSaved.CurseElements = 0
        MPWarlockSDSaved.CurseShadow = 0
        MPWarlockSDSaved.CurseDoom = 0
        MPWarlockSDSaved.CurseTongues = 0
        MPWarlockSDSaved.CurseWeakness = 1
        MPWarlockSDSaved.CurseFatigue = 0
    else
        MPWarlockSDSaved.CurseWeakness = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockSDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockSDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockSDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockSDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockSDSaved.CurseFatigue))

end)

checkButton_CurseFatigue:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseRecklessness = 0
        MPWarlockSDSaved.CurseElements = 0
        MPWarlockSDSaved.CurseShadow = 0
        MPWarlockSDSaved.CurseDoom = 0
        MPWarlockSDSaved.CurseTongues = 0
        MPWarlockSDSaved.CurseWeakness = 0
        MPWarlockSDSaved.CurseFatigue = 1
    else
        MPWarlockSDSaved.CurseFatigue = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockSDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockSDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockSDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockSDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockSDSaved.CurseFatigue))

end)








-- 高级


postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsWarlockSD:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-95


-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
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
        MPWarlockSDSaved.RacialTraits = 1
    else
        MPWarlockSDSaved.RacialTraits = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
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
    MPWarlockSDSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockSDSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockSDSaved.HealthStone_Value .."%|r")
    else
        MPWarlockSDSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockSDSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - BOSS
local checkButton_BOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_BOSS:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_BOSS:SetScale(0.8)

-- 添加文字标签
local checkText_BOSS = checkButton_BOSS:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_BOSS:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_BOSS:SetTextColor(1, 1, 1)
checkText_BOSS:SetPoint("LEFT", checkButton_BOSS, "LEFT", 34, 1)
checkText_BOSS:SetText("非BOSS忽略 持续伤害技能 (DOT)")

-- 设置点击事件
checkButton_BOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.BOSS = 1
    else
        MPWarlockSDSaved.BOSS = 0
    end
end)





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
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
    MPWarlockSDSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockSDSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockSDSaved.HerbalTea_Value .."%|r")
    else
        MPWarlockSDSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockSDSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 创建单选框 - 大诅咒BOSS
local checkButton_CurseBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseBOSS", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_CurseBOSS:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_CurseBOSS:SetScale(0.8)

-- 添加文字标签
local checkText_CurseBOSS = checkButton_CurseBOSS:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CurseBOSS:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CurseBOSS:SetTextColor(1, 1, 1)
checkText_CurseBOSS:SetPoint("LEFT", checkButton_CurseBOSS, "LEFT", 34, 1)
checkText_CurseBOSS:SetText("非BOSS忽略 大诅咒")

-- 设置点击事件
checkButton_CurseBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseBOSS = 1
    else
        MPWarlockSDSaved.CurseBOSS = 0
    end
end)


-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
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
    MPWarlockSDSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockSDSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockSDSaved.HerbalTeaMana_Value .."%|r")
    else
        MPWarlockSDSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockSDSaved.HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 暗影灼烧BOSS
local checkButton_ShadowburnBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonFirstShadowBolt", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_ShadowburnBOSS:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_ShadowburnBOSS:SetScale(0.8)

-- 添加文字标签
local checkText_ShadowburnBOSS = checkButton_ShadowburnBOSS:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ShadowburnBOSS:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ShadowburnBOSS:SetTextColor(1, 1, 1)
checkText_ShadowburnBOSS:SetPoint("LEFT", checkButton_ShadowburnBOSS, "LEFT", 34, 1)
checkText_ShadowburnBOSS:SetText("非BOSS忽略 暗影灼烧")

-- 设置点击事件
checkButton_ShadowburnBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.ShadowburnBOSS = 1
    else
        MPWarlockSDSaved.ShadowburnBOSS = 0
    end
end)


-- 创建单选框 - 生命分流
local checkButton_LifeTap = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_LifeTap", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_LifeTap:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y)
checkButton_LifeTap:SetScale(0.8)

-- 添加文字标签
local checkText_LifeTap = checkButton_LifeTap:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LifeTap:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LifeTap:SetTextColor(1, 1, 1)
checkText_LifeTap:SetPoint("LEFT", checkButton_LifeTap, "LEFT", 34, 1)
checkText_LifeTap:SetText("自动 生命分流")


local slider_LifeTap = CreateFrame("Slider", ADDON_NAME.."Slider_LifeTap", checkButton_LifeTap, "OptionsSliderTemplate")
slider_LifeTap:SetPoint("RIGHT", checkButton_LifeTap, "RIGHT", 250, -2)
slider_LifeTap:SetWidth(150) -- 拖动条长度
slider_LifeTap:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_LifeTap:SetMinMaxValues(10, 100)
slider_LifeTap:SetValueStep(1)
slider_LifeTap:SetValue(60) -- 默认值
MPCatUISliderRegionHide(slider_LifeTap)

local color_LifeTap = "|cFFFFD100"

_G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: 60%|r")
_G[slider_LifeTap:GetName().."Low"]:Hide()
_G[slider_LifeTap:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_LifeTap:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarlockSDSaved.LifeTap_Value = arg1
    _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockSDSaved.LifeTap_Value .."%|r")
end)

-- 设置点击事件
checkButton_LifeTap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.LifeTap = 1
        color_LifeTap = "|cFFFFD100"
        _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockSDSaved.LifeTap_Value .."%|r")
    else
        MPWarlockSDSaved.LifeTap = 0
        color_LifeTap = "|cFF888888"
        _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockSDSaved.LifeTap_Value .."%|r")
    end
end)


-- 生命分流 蓝量百分比
local slider_LifeTap_Mana = CreateFrame("Slider", ADDON_NAME.."SliderLifeTap_Mana", checkButton_LifeTap, "OptionsSliderTemplate")
slider_LifeTap_Mana:SetPoint("RIGHT", checkButton_LifeTap, "RIGHT", 250, -50)
slider_LifeTap_Mana:SetWidth(200) -- 拖动条长度
slider_LifeTap_Mana:SetHeight(16) -- 拖动条高度

slider_LifeTap_Mana:SetMinMaxValues(10, 99)
slider_LifeTap_Mana:SetValueStep(1)
slider_LifeTap_Mana:SetValue(70) -- 默认值
MPCatUISliderRegionHide(slider_LifeTap_Mana)

_G[slider_LifeTap_Mana:GetName().."Text"]:SetText("生命分流 蓝量启动线: 70%|r")

-- 值变化时的回调函数
slider_LifeTap_Mana:SetScript("OnValueChanged", function()
    _G[slider_LifeTap_Mana:GetName().."Text"]:SetText("生命分流 蓝量启动线："..arg1.."%")
    MPWarlockSDSaved.LifeTap_Mana = arg1
end)





postion_y = postion_y - 40



-- 创建单选框 - 预读暗影箭
local checkButton_FirstShadowBolt = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonFirstShadowBolt", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_FirstShadowBolt:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_FirstShadowBolt:SetScale(0.8)

-- 添加文字标签
local checkText_FirstShadowBolt = checkButton_FirstShadowBolt:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FirstShadowBolt:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FirstShadowBolt:SetTextColor(1, 1, 1)
checkText_FirstShadowBolt:SetPoint("LEFT", checkButton_FirstShadowBolt, "LEFT", 34, 1)
checkText_FirstShadowBolt:SetText("进战斗前预读 暗影箭")

-- 设置点击事件
checkButton_FirstShadowBolt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.FirstShadowBolt = 1
    else
        MPWarlockSDSaved.FirstShadowBolt = 0
    end
end)


postion_y = postion_y - 40

-- 创建单选框 - 邪咒
local checkButton_CurseEvil = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsWarlockSD, "UICheckButtonTemplate")
checkButton_CurseEvil:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 20, postion_y)
checkButton_CurseEvil:SetScale(0.8)

-- 添加文字标签
local checkText_CurseEvil = checkButton_CurseEvil:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CurseEvil:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CurseEvil:SetTextColor(1, 1, 1)
checkText_CurseEvil:SetPoint("LEFT", checkButton_CurseEvil, "LEFT", 34, 1)
checkText_CurseEvil:SetText("启用 邪咒替换痛苦诅咒 (自动识别)")

-- 设置点击事件
checkButton_CurseEvil:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.CurseEvil = 1
    else
        MPWarlockSDSaved.CurseEvil = 0
    end
end)


-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.Soulspeed = 1
    else
        MPWarlockSDSaved.Soulspeed = 0
    end
end)






-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarlockSD, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 120, -44)
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
    MPResetWarlockSDSettings()
    MPInitWarlockSDSettings()
end)


local MLDButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarlockSD, "UIPanelButtonTemplate")
MLDButton:SetPoint("TOPLEFT", CatUISettingsWarlockSD, "TOPLEFT", 340, postion_y+80)
MLDButton:SetWidth(100)
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
MPBottomLine(CatUISettingsWarlockSD)

local checkButton_Power = MPPublicCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.Power = 1
    else
        MPWarlockSDSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockSDSaved.Pick = 1
    else
        MPWarlockSDSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsWarlockSD, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)

-- 添加提示内容区域
local TipText = CatUISettingsWarlockSD:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsWarlockSD, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFF9482C9/ahdps|r ]  [ 多线Dot |cFF9482C9/MDot|r (需SuperWoW) ]")



-- 配置文件版本号
local WarlockSDSettingsUIVersion = 13

function MPResetWarlockSDSettings()

    MPWarlockSDSaved.Version = WarlockSDSettingsUIVersion

    -- 基本配置

    MPWarlockSDSaved.CurseAgony = 1
    MPWarlockSDSaved.Corruption = 1
    MPWarlockSDSaved.SiphonLife = 1
    MPWarlockSDSaved.Immolate = 0
    MPWarlockSDSaved.Shadowburn = 0

    MPWarlockSDSaved.PetAttack = 0

    MPWarlockSDSaved.Trinket_Upper = 1
    MPWarlockSDSaved.TUBoss = 0
    MPWarlockSDSaved.Trinket_Below = 1
    MPWarlockSDSaved.TBBoss = 0
    MPWarlockSDSaved.Target = 0
    MPWarlockSDSaved.Overpowering = 0

    MPWarlockSDSaved.CurseRecklessness = 0
    MPWarlockSDSaved.CurseElements = 0
    MPWarlockSDSaved.CurseShadow = 1
    MPWarlockSDSaved.CurseTongues = 0
    MPWarlockSDSaved.CurseWeakness = 0
    MPWarlockSDSaved.CurseFatigue = 0
    MPWarlockSDSaved.CurseDoom = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPWarlockSDSaved.HealthStone = 1
    MPWarlockSDSaved.HealthStone_Value = 30
    MPWarlockSDSaved.HerbalTea = 1
    MPWarlockSDSaved.HerbalTea_Value = 20
    MPWarlockSDSaved.HerbalTeaMana = 0
    MPWarlockSDSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPWarlockSDSaved.SuperWoW = 1
    MPWarlockSDSaved.UnitXP = 1

    MPWarlockSDSaved.BOSS = 0
    MPWarlockSDSaved.CurseBOSS = 0
    MPWarlockSDSaved.ShadowburnBOSS = 0
    MPWarlockSDSaved.FirstShadowBolt = 0
    MPWarlockSDSaved.CurseEvil = 0

    MPWarlockSDSaved.RacialTraits = 0
    MPWarlockSDSaved.Soulspeed = 0

    MPWarlockSDSaved.LifeTap = 0
    MPWarlockSDSaved.LifeTap_Value = 60
    MPWarlockSDSaved.LifeTap_Mana = 70

    -- 通用
    MPWarlockSDSaved.Power = 0
    MPWarlockSDSaved.Pick = 0

end


local function MPInitWarlockSDSettingsPart1()
    checkButton_CurseAgony:SetChecked(ToBoolean(MPWarlockSDSaved.CurseAgony))
    checkButton_Corruption:SetChecked( ToBoolean(MPWarlockSDSaved.Corruption) )
    checkButton_SiphonLife:SetChecked( ToBoolean(MPWarlockSDSaved.SiphonLife) )
    checkButton_Immolate:SetChecked(ToBoolean(MPWarlockSDSaved.Immolate))
    checkButton_Shadowburn:SetChecked(ToBoolean(MPWarlockSDSaved.Shadowburn))
    checkButton_Target:SetChecked(ToBoolean(MPWarlockSDSaved.Target))
    checkButton_Overpowering:SetChecked(ToBoolean(MPWarlockSDSaved.Overpowering))
    checkButton_PetAttack:SetChecked(ToBoolean(MPWarlockSDSaved.PetAttack))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPWarlockSDSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPWarlockSDSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPWarlockSDSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPWarlockSDSaved.TBBoss))
    checkButton_BOSS:SetChecked(ToBoolean(MPWarlockSDSaved.BOSS))
    checkButton_CurseBOSS:SetChecked(ToBoolean(MPWarlockSDSaved.CurseBOSS))
    checkButton_ShadowburnBOSS:SetChecked(ToBoolean(MPWarlockSDSaved.ShadowburnBOSS))
    checkButton_FirstShadowBolt:SetChecked(ToBoolean(MPWarlockSDSaved.FirstShadowBolt))
    checkButton_CurseEvil:SetChecked(ToBoolean(MPWarlockSDSaved.CurseEvil))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPWarlockSDSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPWarlockSDSaved.Soulspeed))

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockSDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockSDSaved.CurseShadow))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockSDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockSDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockSDSaved.CurseFatigue))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockSDSaved.CurseDoom))

end

function MPInitWarlockSDSettings()
    if not MPWarlockSDSaved then
        MPWarlockSDSaved = {}
        MPResetWarlockSDSettings()
    end

    if MPWarlockSDSaved.Version ~= WarlockSDSettingsUIVersion then
        MPResetWarlockSDSettings()
    end

    MPInitWarlockSDSettingsPart1()

    checkButton_Power:SetChecked(ToBoolean(MPWarlockSDSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPWarlockSDSaved.Pick))

    checkButton_HealthStone:SetChecked(ToBoolean(MPWarlockSDSaved.HealthStone))
    slider_HealthStone:SetValue(MPWarlockSDSaved.HealthStone_Value)
    if MPWarlockSDSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockSDSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPWarlockSDSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPWarlockSDSaved.HerbalTea_Value)
    if MPWarlockSDSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockSDSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPWarlockSDSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPWarlockSDSaved.HerbalTeaMana_Value)
    if MPWarlockSDSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockSDSaved.HerbalTeaMana_Value .."%|r")

    checkButton_LifeTap:SetChecked(MPWarlockSDSaved.LifeTap)
    slider_LifeTap:SetValue(MPWarlockSDSaved.LifeTap_Value)
    if MPWarlockSDSaved.LifeTap==1 then
        color_LifeTap = "|cFFFFD100"
    else
        color_LifeTap = "|cFF888888"
    end
    _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockSDSaved.LifeTap_Value .."%|r")

    slider_LifeTap_Mana:SetValue(MPWarlockSDSaved.LifeTap_Mana)

end

