
-- 定义插件名称
local ADDON_NAME = "Settings-WarlockAff"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsWarlockAff = MPCreateFrame(ADDON_NAME.."Frame", 520, 620, "|cFF9482C9设置 - 痛苦术|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsWarlockAff:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")






local postion_y = postion_y-40


-- 创建单选框 - 痛苦诅咒
local checkButton_CurseAgony = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_CurseAgony:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.CurseAgony = 1
    else
        MPWarlockAffSaved.CurseAgony = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
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
        MPWarlockAffSaved.Trinket_Upper = 1
    else
        MPWarlockAffSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.TUBoss = 1
    else
        MPWarlockAffSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 腐蚀术​
local checkButton_Corruption = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_Corruption:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.Corruption = 1
    else
        MPWarlockAffSaved.Corruption = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
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
        MPWarlockAffSaved.Trinket_Below = 1
    else
        MPWarlockAffSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.TBBoss = 1
    else
        MPWarlockAffSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 生命虹吸
local checkButton_SiphonLife = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_SiphonLife:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.SiphonLife = 1
    else
        MPWarlockAffSaved.SiphonLife = 0
    end
end)



-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
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
        MPWarlockAffSaved.Target = 1
    else
        MPWarlockAffSaved.Target = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 献祭
local checkButton_Immolate = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_Immolate:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.Immolate = 1
    else
        MPWarlockAffSaved.Immolate = 0
    end
end)


-- 创建单选框 - 宠物自动攻击
local checkButton_PetAttack = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_PetAttack:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
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
        MPWarlockAffSaved.PetAttack = 1
    else
        MPWarlockAffSaved.PetAttack = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 暗影收割
local checkButton_ShadowHarvest = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_ShadowHarvest:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
checkButton_ShadowHarvest:SetScale(0.8)

-- 添加文字标签
local checkText_ShadowHarvest = checkButton_ShadowHarvest:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ShadowHarvest:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ShadowHarvest:SetTextColor(1, 1, 1)
checkText_ShadowHarvest:SetPoint("LEFT", checkButton_ShadowHarvest, "LEFT", 34, 1)
checkText_ShadowHarvest:SetText("开启 暗影收割")

-- 设置点击事件
checkButton_ShadowHarvest:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.ShadowHarvest = 1
    else
        MPWarlockAffSaved.ShadowHarvest = 0
    end
end)


-- 创建单选框 - 吸取生命
local checkButton_DrainLife = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_DrainLife:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
checkButton_DrainLife:SetScale(0.8)

-- 添加文字标签
local checkText_DrainLife = checkButton_DrainLife:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_DrainLife:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_DrainLife:SetTextColor(1, 1, 1)
checkText_DrainLife:SetPoint("LEFT", checkButton_DrainLife, "LEFT", 34, 1)
checkText_DrainLife:SetText("开启 吸取生命 (单选)")



postion_y = postion_y-30

-- 创建单选框 - 暗影灼烧
local checkButton_Shadowburn = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_Shadowburn:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.Shadowburn = 1
    else
        MPWarlockAffSaved.Shadowburn = 0
    end
end)


-- 创建单选框 - 吸取灵魂
local checkButton_DrainSoul = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_DrainSoul:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
checkButton_DrainSoul:SetScale(0.8)

-- 添加文字标签
local checkText_DrainSoul = checkButton_DrainSoul:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_DrainSoul:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_DrainSoul:SetTextColor(1, 1, 1)
checkText_DrainSoul:SetPoint("LEFT", checkButton_DrainSoul, "LEFT", 34, 1)
checkText_DrainSoul:SetText("开启 吸取灵魂 (单选)")


-- 设置点击事件
checkButton_DrainLife:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.DrainLife = 1
        MPWarlockAffSaved.DrainSoul = 0
    else
        MPWarlockAffSaved.DrainLife = 0
    end

    checkButton_DrainLife:SetChecked(ToBoolean(MPWarlockAffSaved.DrainLife))
    checkButton_DrainSoul:SetChecked(ToBoolean(MPWarlockAffSaved.DrainSoul))

end)

-- 设置点击事件
checkButton_DrainSoul:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.DrainSoul = 1
        MPWarlockAffSaved.DrainLife = 0
    else
        MPWarlockAffSaved.DrainSoul = 0
    end

    checkButton_DrainLife:SetChecked(ToBoolean(MPWarlockAffSaved.DrainLife))
    checkButton_DrainSoul:SetChecked(ToBoolean(MPWarlockAffSaved.DrainSoul))

end)






-- 团队诅咒


postion_y = postion_y+10

-- 添加提示内容区域
local TipTextTeam = CatUISettingsWarlockAff:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipTextTeam:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
TipTextTeam:SetWidth(250)
TipTextTeam:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipTextTeam:SetTextColor(1, 0.8, 0)
TipTextTeam:SetJustifyH("LEFT")
TipTextTeam:SetText("大诅咒配置 (单选)")


postion_y = postion_y-85

-- 创建单选框 - 鲁莽诅咒
local checkButton_CurseRecklessness = MPCreateCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 20, postion_y, "鲁莽")

-- 创建单选框 - 元素诅咒
local checkButton_CurseElements = MPCreateCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 105, postion_y, "元素")

-- 创建单选框 - 暗影诅咒
local checkButton_CurseShadow = MPCreateCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 190, postion_y, "暗影")

-- 创建单选框 - 厄运诅咒
local checkButton_CurseDoom = MPCreateCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 275, postion_y, "厄运")

-- 创建单选框 - 语言诅咒
local checkButton_CurseTongues = MPCreateCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 360, postion_y, "语言")

-- 创建单选框 - 虚弱诅咒
local checkButton_CurseWeakness = MPCreateCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 445, postion_y, "虚弱")

-- 创建单选框 - 疲劳诅咒
local checkButton_CurseFatigue = MPCreateCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 530, postion_y, "疲劳")


checkButton_CurseRecklessness:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.CurseRecklessness = 1
        MPWarlockAffSaved.CurseElements = 0
        MPWarlockAffSaved.CurseShadow = 0
        MPWarlockAffSaved.CurseDoom = 0
        MPWarlockAffSaved.CurseTongues = 0
        MPWarlockAffSaved.CurseWeakness = 0
        MPWarlockAffSaved.CurseFatigue = 0
    else
        MPWarlockAffSaved.CurseRecklessness = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockAffSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockAffSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockAffSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockAffSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockAffSaved.CurseFatigue))

end)

checkButton_CurseElements:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.CurseRecklessness = 0
        MPWarlockAffSaved.CurseElements = 1
        MPWarlockAffSaved.CurseShadow = 0
        MPWarlockAffSaved.CurseDoom = 0
        MPWarlockAffSaved.CurseTongues = 0
        MPWarlockAffSaved.CurseWeakness = 0
        MPWarlockAffSaved.CurseFatigue = 0
    else
        MPWarlockAffSaved.CurseElements = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockAffSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockAffSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockAffSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockAffSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockAffSaved.CurseFatigue))

end)

checkButton_CurseShadow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.CurseRecklessness = 0
        MPWarlockAffSaved.CurseElements = 0
        MPWarlockAffSaved.CurseShadow = 1
        MPWarlockAffSaved.CurseDoom = 0
        MPWarlockAffSaved.CurseTongues = 0
        MPWarlockAffSaved.CurseWeakness = 0
        MPWarlockAffSaved.CurseFatigue = 0
    else
        MPWarlockAffSaved.CurseShadow = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockAffSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockAffSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockAffSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockAffSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockAffSaved.CurseFatigue))

end)

checkButton_CurseDoom:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.CurseRecklessness = 0
        MPWarlockAffSaved.CurseElements = 0
        MPWarlockAffSaved.CurseShadow = 0
        MPWarlockAffSaved.CurseDoom = 1
        MPWarlockAffSaved.CurseTongues = 0
        MPWarlockAffSaved.CurseWeakness = 0
        MPWarlockAffSaved.CurseFatigue = 0
    else
        MPWarlockAffSaved.CurseDoom = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockAffSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockAffSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockAffSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockAffSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockAffSaved.CurseFatigue))

end)

checkButton_CurseTongues:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.CurseRecklessness = 0
        MPWarlockAffSaved.CurseElements = 0
        MPWarlockAffSaved.CurseShadow = 0
        MPWarlockAffSaved.CurseDoom = 0
        MPWarlockAffSaved.CurseTongues = 1
        MPWarlockAffSaved.CurseWeakness = 0
        MPWarlockAffSaved.CurseFatigue = 0
    else
        MPWarlockAffSaved.CurseTongues = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockAffSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockAffSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockAffSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockAffSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockAffSaved.CurseFatigue))

end)

checkButton_CurseWeakness:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.CurseRecklessness = 0
        MPWarlockAffSaved.CurseElements = 0
        MPWarlockAffSaved.CurseShadow = 0
        MPWarlockAffSaved.CurseDoom = 0
        MPWarlockAffSaved.CurseTongues = 0
        MPWarlockAffSaved.CurseWeakness = 1
        MPWarlockAffSaved.CurseFatigue = 0
    else
        MPWarlockAffSaved.CurseWeakness = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockAffSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockAffSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockAffSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockAffSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockAffSaved.CurseFatigue))

end)

checkButton_CurseFatigue:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.CurseRecklessness = 0
        MPWarlockAffSaved.CurseElements = 0
        MPWarlockAffSaved.CurseShadow = 0
        MPWarlockAffSaved.CurseDoom = 0
        MPWarlockAffSaved.CurseTongues = 0
        MPWarlockAffSaved.CurseWeakness = 0
        MPWarlockAffSaved.CurseFatigue = 1
    else
        MPWarlockAffSaved.CurseFatigue = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockAffSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockAffSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockAffSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockAffSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockAffSaved.CurseFatigue))

end)










-- 高级


postion_y = postion_y+30

-- 添加提示内容区域
local TipText1 = CatUISettingsWarlockAff:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-100

--[[
-- 创建单选框 - superwow
local checkButton_SuperWoW = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonSuperWow", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_SuperWoW:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
checkButton_SuperWoW:SetScale(0.8)
checkButton_SuperWoW:Disable()

-- 添加文字标签
local checkText_SuperWoW = checkButton_SuperWoW:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SuperWoW:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SuperWoW:SetTextColor(1, 1, 1)
checkText_SuperWoW:SetPoint("LEFT", checkButton_SuperWoW, "LEFT", 34, 1)
checkText_SuperWoW:SetText("适配SuperWoW模组 (不可关闭)")

-- 设置点击事件
checkButton_SuperWoW:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.SuperWoW = 1
    else
        MPWarlockAffSaved.SuperWoW = 0
    end
end)
]]
-- 创建单选框 - 打断 吸取灵魂
local checkButton_ClipDrainSoul = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonSuperWow", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_ClipDrainSoul:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
checkButton_ClipDrainSoul:SetScale(0.8)

-- 添加文字标签
local checkText_ClipDrainSoul = checkButton_ClipDrainSoul:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ClipDrainSoul:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ClipDrainSoul:SetTextColor(1, 1, 1)
checkText_ClipDrainSoul:SetPoint("LEFT", checkButton_ClipDrainSoul, "LEFT", 34, 1)
checkText_ClipDrainSoul:SetText("允许中断 吸取灵魂 (SuperWoW)")

-- 设置点击事件
checkButton_ClipDrainSoul:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.ClipDrainSoul = 1
    else
        MPWarlockAffSaved.ClipDrainSoul = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
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
    MPWarlockAffSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockAffSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockAffSaved.HealthStone_Value .."%|r")
    else
        MPWarlockAffSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockAffSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - BOSS
local checkButton_BOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_BOSS:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.BOSS = 1
    else
        MPWarlockAffSaved.BOSS = 0
    end
end)





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
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
    MPWarlockAffSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockAffSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockAffSaved.HerbalTea_Value .."%|r")
    else
        MPWarlockAffSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockAffSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 创建单选框 - 大诅咒BOSS
local checkButton_CurseBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseBOSS", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_CurseBOSS:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.CurseBOSS = 1
    else
        MPWarlockAffSaved.CurseBOSS = 0
    end
end)


-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
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
    MPWarlockAffSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockAffSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockAffSaved.HerbalTeaMana_Value .."%|r")
    else
        MPWarlockAffSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockAffSaved.HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 暗影灼烧BOSS
local checkButton_ShadowburnBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonFirstShadowBolt", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_ShadowburnBOSS:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.ShadowburnBOSS = 1
    else
        MPWarlockAffSaved.ShadowburnBOSS = 0
    end
end)


-- 创建单选框 - 生命分流
local checkButton_LifeTap = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_LifeTap", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_LifeTap:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y)
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
    MPWarlockAffSaved.LifeTap_Value = arg1
    _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockAffSaved.LifeTap_Value .."%|r")
end)

-- 设置点击事件
checkButton_LifeTap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.LifeTap = 1
        color_LifeTap = "|cFFFFD100"
        _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockAffSaved.LifeTap_Value .."%|r")
    else
        MPWarlockAffSaved.LifeTap = 0
        color_LifeTap = "|cFF888888"
        _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockAffSaved.LifeTap_Value .."%|r")
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
    MPWarlockAffSaved.LifeTap_Mana = arg1
end)





postion_y = postion_y - 40



-- 创建单选框 - 预读暗影箭
local checkButton_FirstShadowBolt = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonFirstShadowBolt", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_FirstShadowBolt:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.FirstShadowBolt = 1
    else
        MPWarlockAffSaved.FirstShadowBolt = 0
    end
end)


postion_y = postion_y - 40

-- 创建单选框 - 邪咒
local checkButton_CurseEvil = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_CurseEvil:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.CurseEvil = 1
    else
        MPWarlockAffSaved.CurseEvil = 0
    end
end)

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.Soulspeed = 1
    else
        MPWarlockAffSaved.Soulspeed = 0
    end
end)




postion_y = postion_y - 40

-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsWarlockAff, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 20, postion_y)
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
        MPWarlockAffSaved.RacialTraits = 1
    else
        MPWarlockAffSaved.RacialTraits = 0
    end
end)





-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarlockAff, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 120, -44)
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
    MPResetWarlockAffSettings()
    MPInitWarlockAffSettings()
end)


local MLDButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarlockAff, "UIPanelButtonTemplate")
MLDButton:SetPoint("TOPLEFT", CatUISettingsWarlockAff, "TOPLEFT", 340, postion_y+110)
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
MPBottomLine(CatUISettingsWarlockAff)

local checkButton_Power = MPPublicCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.Power = 1
    else
        MPWarlockAffSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved.Pick = 1
    else
        MPWarlockAffSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsWarlockAff, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsWarlockAff:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsWarlockAff, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFF9482C9/tkdps|r ]  [ 多线Dot |cFF9482C9/MDot|r (需SuperWoW) ]")



-- 配置文件版本号
local WarlockAffSettingsUIVersion = 9

function MPResetWarlockAffSettings()

    MPWarlockAffSaved.Version = WarlockAffSettingsUIVersion

    -- 基本配置

    MPWarlockAffSaved.Corruption = 1
    MPWarlockAffSaved.SiphonLife = 1
    MPWarlockAffSaved.Immolate = 0
    MPWarlockAffSaved.DrainLife = 0
    MPWarlockAffSaved.DrainSoul = 1
    MPWarlockAffSaved.ShadowHarvest = 1
    MPWarlockAffSaved.Shadowburn = 0

    MPWarlockAffSaved.PetAttack = 0

    MPWarlockAffSaved.Trinket_Upper = 1
    MPWarlockAffSaved.TUBoss = 0
    MPWarlockAffSaved.Trinket_Below = 1
    MPWarlockAffSaved.TBBoss = 0
    MPWarlockAffSaved.Target = 0


    MPWarlockAffSaved.CurseAgony = 1
    MPWarlockAffSaved.CurseRecklessness = 0
    MPWarlockAffSaved.CurseElements = 0
    MPWarlockAffSaved.CurseShadow = 1
    MPWarlockAffSaved.CurseTongues = 0
    MPWarlockAffSaved.CurseWeakness = 0
    MPWarlockAffSaved.CurseFatigue = 0
    MPWarlockAffSaved.CurseDoom = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPWarlockAffSaved.HealthStone = 1
    MPWarlockAffSaved.HealthStone_Value = 30
    MPWarlockAffSaved.HerbalTea = 1
    MPWarlockAffSaved.HerbalTea_Value = 20
    MPWarlockAffSaved.HerbalTeaMana = 0
    MPWarlockAffSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPWarlockAffSaved.SuperWoW = 1
    MPWarlockAffSaved.UnitXP = 1

    MPWarlockAffSaved.ClipDrainSoul = 0
    MPWarlockAffSaved.BOSS = 0
    MPWarlockAffSaved.CurseBOSS = 0
    MPWarlockAffSaved.ShadowburnBOSS = 0
    MPWarlockAffSaved.FirstShadowBolt = 0
    MPWarlockAffSaved.CurseEvil = 0

    MPWarlockAffSaved.RacialTraits = 0
    MPWarlockAffSaved.Soulspeed = 0

    MPWarlockAffSaved.LifeTap = 0
    MPWarlockAffSaved.LifeTap_Value = 60
    MPWarlockAffSaved.LifeTap_Mana = 70

    -- 通用
    MPWarlockAffSaved.Power = 0
    MPWarlockAffSaved.Pick = 0

end


local function MPInitWarlockAffSettingsPart1()
    checkButton_CurseAgony:SetChecked(ToBoolean(MPWarlockAffSaved.CurseAgony))
    checkButton_Corruption:SetChecked( ToBoolean(MPWarlockAffSaved.Corruption) )
    checkButton_SiphonLife:SetChecked( ToBoolean(MPWarlockAffSaved.SiphonLife) )
    checkButton_Immolate:SetChecked(ToBoolean(MPWarlockAffSaved.Immolate))
    checkButton_DrainLife:SetChecked(ToBoolean(MPWarlockAffSaved.DrainLife))
    checkButton_DrainSoul:SetChecked(ToBoolean(MPWarlockAffSaved.DrainSoul))
    checkButton_ShadowHarvest:SetChecked(ToBoolean(MPWarlockAffSaved.ShadowHarvest))
    checkButton_Shadowburn:SetChecked(ToBoolean(MPWarlockAffSaved.Shadowburn))
    checkButton_Target:SetChecked(ToBoolean(MPWarlockAffSaved.Target))
    checkButton_PetAttack:SetChecked(ToBoolean(MPWarlockAffSaved.PetAttack))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPWarlockAffSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPWarlockAffSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPWarlockAffSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPWarlockAffSaved.TBBoss))
    checkButton_ClipDrainSoul:SetChecked(ToBoolean(MPWarlockAffSaved.ClipDrainSoul))
    checkButton_BOSS:SetChecked(ToBoolean(MPWarlockAffSaved.BOSS))
    checkButton_CurseBOSS:SetChecked(ToBoolean(MPWarlockAffSaved.CurseBOSS))
    checkButton_ShadowburnBOSS:SetChecked(ToBoolean(MPWarlockAffSaved.ShadowburnBOSS))
    checkButton_FirstShadowBolt:SetChecked(ToBoolean(MPWarlockAffSaved.FirstShadowBolt))
    checkButton_CurseEvil:SetChecked(ToBoolean(MPWarlockAffSaved.CurseEvil))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPWarlockAffSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPWarlockAffSaved.Soulspeed))

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockAffSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockAffSaved.CurseShadow))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockAffSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockAffSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockAffSaved.CurseFatigue))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockAffSaved.CurseDoom))


end

function MPInitWarlockAffSettings()
    if not MPWarlockAffSaved then
        MPWarlockAffSaved = {}
        MPResetWarlockAffSettings()
    end

    if MPWarlockAffSaved.Version ~= WarlockAffSettingsUIVersion then
        MPResetWarlockAffSettings()
    end

    MPInitWarlockAffSettingsPart1()

    checkButton_Power:SetChecked(ToBoolean(MPWarlockAffSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPWarlockAffSaved.Pick))

    checkButton_HealthStone:SetChecked(ToBoolean(MPWarlockAffSaved.HealthStone))
    slider_HealthStone:SetValue(MPWarlockAffSaved.HealthStone_Value)
    if MPWarlockAffSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockAffSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPWarlockAffSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPWarlockAffSaved.HerbalTea_Value)
    if MPWarlockAffSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockAffSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPWarlockAffSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPWarlockAffSaved.HerbalTeaMana_Value)
    if MPWarlockAffSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockAffSaved.HerbalTeaMana_Value .."%|r")

    checkButton_LifeTap:SetChecked(MPWarlockAffSaved.LifeTap)
    slider_LifeTap:SetValue(MPWarlockAffSaved.LifeTap_Value)
    if MPWarlockAffSaved.LifeTap==1 then
        color_LifeTap = "|cFFFFD100"
    else
        color_LifeTap = "|cFF888888"
    end
    _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockAffSaved.LifeTap_Value .."%|r")

    slider_LifeTap_Mana:SetValue(MPWarlockAffSaved.LifeTap_Mana)

end

