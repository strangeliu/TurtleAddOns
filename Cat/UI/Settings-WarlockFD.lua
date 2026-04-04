
-- 定义插件名称
local ADDON_NAME = "Settings-WarlockFD"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsWarlockFD = MPCreateFrame(ADDON_NAME.."Frame", 520, 620, "|cFF9482C9设置 - 火毁术|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsWarlockFD:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40


-- 创建单选框 - 痛苦诅咒
local checkButton_CurseAgony = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_CurseAgony:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
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
        MPWarlockFDSaved.CurseAgony = 1
    else
        MPWarlockFDSaved.CurseAgony = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
        MPWarlockFDSaved.Trinket_Upper = 1
    else
        MPWarlockFDSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.TUBoss = 1
    else
        MPWarlockFDSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 腐蚀术​
local checkButton_Corruption = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_Corruption:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
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
        MPWarlockFDSaved.Corruption = 1
    else
        MPWarlockFDSaved.Corruption = 0
    end
end)



-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
        MPWarlockFDSaved.Trinket_Below = 1
    else
        MPWarlockFDSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.TBBoss = 1
    else
        MPWarlockFDSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 灵魂之火
local checkButton_SoulFire = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_SoulFire:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
checkButton_SoulFire:SetScale(0.8)

-- 添加文字标签
local checkText_SoulFire = checkButton_SoulFire:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SoulFire:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SoulFire:SetTextColor(1, 1, 1)
checkText_SoulFire:SetPoint("LEFT", checkButton_SoulFire, "LEFT", 34, 1)
checkText_SoulFire:SetText("开启 灵魂之火")

-- 设置点击事件
checkButton_SoulFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.SoulFire = 1
    else
        MPWarlockFDSaved.SoulFire = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
        MPWarlockFDSaved.Target = 1
    else
        MPWarlockFDSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 燃烧​
local checkButton_Conflagrate = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_Conflagrate:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
checkButton_Conflagrate:SetScale(0.8)

-- 添加文字标签
local checkText_Conflagrate = checkButton_Conflagrate:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Conflagrate:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Conflagrate:SetTextColor(1, 1, 1)
checkText_Conflagrate:SetPoint("LEFT", checkButton_Conflagrate, "LEFT", 34, 1)
checkText_Conflagrate:SetText("开启 燃烧​")

-- 设置点击事件
checkButton_Conflagrate:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.Conflagrate = 1
    else
        MPWarlockFDSaved.Conflagrate = 0
    end
end)


-- 创建单选框 - 超越之力
local checkButton_Overpowering = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_Overpowering:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
        MPWarlockFDSaved.Overpowering = 1
    else
        MPWarlockFDSaved.Overpowering = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 献祭
local checkButton_Immolate = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_Immolate:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
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
        MPWarlockFDSaved.Immolate = 1
    else
        MPWarlockFDSaved.Immolate = 0
    end
end)

-- 创建单选框 - 宠物自动攻击
local checkButton_PetAttack = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_PetAttack:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
        MPWarlockFDSaved.PetAttack = 1
    else
        MPWarlockFDSaved.PetAttack = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 暗影灼烧
local checkButton_Shadowburn = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_Shadowburn:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
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
        MPWarlockFDSaved.Shadowburn = 1
    else
        MPWarlockFDSaved.Shadowburn = 0
    end
end)

-- 创建单选框 - 灼热之痛
local checkButton_SearingPain = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_SearingPain:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
checkButton_SearingPain:SetScale(0.8)

-- 添加文字标签
local checkText_SearingPain = checkButton_SearingPain:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SearingPain:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SearingPain:SetTextColor(1, 1, 1)
checkText_SearingPain:SetPoint("LEFT", checkButton_SearingPain, "LEFT", 34, 1)
checkText_SearingPain:SetText("开启 灼热之痛 (单选)")


postion_y = postion_y-30

-- 创建单选框 - 暗影箭
local checkButton_ShadowBolt = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_ShadowBolt:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
checkButton_ShadowBolt:SetScale(0.8)

-- 添加文字标签
local checkText_ShadowBolt = checkButton_ShadowBolt:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ShadowBolt:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ShadowBolt:SetTextColor(1, 1, 1)
checkText_ShadowBolt:SetPoint("LEFT", checkButton_ShadowBolt, "LEFT", 34, 1)
checkText_ShadowBolt:SetText("开启 暗影箭 (单选)")

-- 灼热之痛点击事件
checkButton_SearingPain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.SearingPain = 1
        MPWarlockFDSaved.ShadowBolt = 0
    else
        MPWarlockFDSaved.SearingPain = 0
    end
    checkButton_SearingPain:SetChecked( ToBoolean(MPWarlockFDSaved.SearingPain) )
    checkButton_ShadowBolt:SetChecked( ToBoolean(MPWarlockFDSaved.ShadowBolt) )

end)

-- 暗影箭点击事件
checkButton_ShadowBolt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.ShadowBolt = 1
        MPWarlockFDSaved.SearingPain = 0
    else
        MPWarlockFDSaved.ShadowBolt = 0
    end
    checkButton_SearingPain:SetChecked( ToBoolean(MPWarlockFDSaved.SearingPain) )
    checkButton_ShadowBolt:SetChecked( ToBoolean(MPWarlockFDSaved.ShadowBolt) )

end)







-- 团队诅咒


postion_y = postion_y+10

-- 添加提示内容区域
local TipTextTeam = CatUISettingsWarlockFD:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipTextTeam:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
TipTextTeam:SetWidth(250)
TipTextTeam:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipTextTeam:SetTextColor(1, 0.8, 0)
TipTextTeam:SetJustifyH("LEFT")
TipTextTeam:SetText("大诅咒配置 (单选)")


postion_y = postion_y-85

-- 创建单选框 - 鲁莽诅咒
local checkButton_CurseRecklessness = MPCreateCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 20, postion_y, "鲁莽")

-- 创建单选框 - 元素诅咒
local checkButton_CurseElements = MPCreateCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 105, postion_y, "元素")

-- 创建单选框 - 暗影诅咒
local checkButton_CurseShadow = MPCreateCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 190, postion_y, "暗影")

-- 创建单选框 - 厄运诅咒
local checkButton_CurseDoom = MPCreateCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 275, postion_y, "厄运")

-- 创建单选框 - 语言诅咒
local checkButton_CurseTongues = MPCreateCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 360, postion_y, "语言")

-- 创建单选框 - 虚弱诅咒
local checkButton_CurseWeakness = MPCreateCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 445, postion_y, "虚弱")

-- 创建单选框 - 疲劳诅咒
local checkButton_CurseFatigue = MPCreateCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 530, postion_y, "疲劳")


checkButton_CurseRecklessness:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.CurseRecklessness = 1
        MPWarlockFDSaved.CurseElements = 0
        MPWarlockFDSaved.CurseShadow = 0
        MPWarlockFDSaved.CurseDoom = 0
        MPWarlockFDSaved.CurseTongues = 0
        MPWarlockFDSaved.CurseWeakness = 0
        MPWarlockFDSaved.CurseFatigue = 0
    else
        MPWarlockFDSaved.CurseRecklessness = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockFDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockFDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockFDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockFDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockFDSaved.CurseFatigue))

end)

checkButton_CurseElements:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.CurseRecklessness = 0
        MPWarlockFDSaved.CurseElements = 1
        MPWarlockFDSaved.CurseShadow = 0
        MPWarlockFDSaved.CurseDoom = 0
        MPWarlockFDSaved.CurseTongues = 0
        MPWarlockFDSaved.CurseWeakness = 0
        MPWarlockFDSaved.CurseFatigue = 0
    else
        MPWarlockFDSaved.CurseElements = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockFDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockFDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockFDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockFDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockFDSaved.CurseFatigue))

end)

checkButton_CurseShadow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.CurseRecklessness = 0
        MPWarlockFDSaved.CurseElements = 0
        MPWarlockFDSaved.CurseShadow = 1
        MPWarlockFDSaved.CurseDoom = 0
        MPWarlockFDSaved.CurseTongues = 0
        MPWarlockFDSaved.CurseWeakness = 0
        MPWarlockFDSaved.CurseFatigue = 0
    else
        MPWarlockFDSaved.CurseShadow = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockFDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockFDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockFDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockFDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockFDSaved.CurseFatigue))

end)

checkButton_CurseDoom:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.CurseRecklessness = 0
        MPWarlockFDSaved.CurseElements = 0
        MPWarlockFDSaved.CurseShadow = 0
        MPWarlockFDSaved.CurseDoom = 1
        MPWarlockFDSaved.CurseTongues = 0
        MPWarlockFDSaved.CurseWeakness = 0
        MPWarlockFDSaved.CurseFatigue = 0
    else
        MPWarlockFDSaved.CurseDoom = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockFDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockFDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockFDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockFDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockFDSaved.CurseFatigue))

end)

checkButton_CurseTongues:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.CurseRecklessness = 0
        MPWarlockFDSaved.CurseElements = 0
        MPWarlockFDSaved.CurseShadow = 0
        MPWarlockFDSaved.CurseDoom = 0
        MPWarlockFDSaved.CurseTongues = 1
        MPWarlockFDSaved.CurseWeakness = 0
        MPWarlockFDSaved.CurseFatigue = 0
    else
        MPWarlockFDSaved.CurseTongues = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockFDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockFDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockFDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockFDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockFDSaved.CurseFatigue))

end)

checkButton_CurseWeakness:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.CurseRecklessness = 0
        MPWarlockFDSaved.CurseElements = 0
        MPWarlockFDSaved.CurseShadow = 0
        MPWarlockFDSaved.CurseDoom = 0
        MPWarlockFDSaved.CurseTongues = 0
        MPWarlockFDSaved.CurseWeakness = 1
        MPWarlockFDSaved.CurseFatigue = 0
    else
        MPWarlockFDSaved.CurseWeakness = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockFDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockFDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockFDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockFDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockFDSaved.CurseFatigue))

end)

checkButton_CurseFatigue:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.CurseRecklessness = 0
        MPWarlockFDSaved.CurseElements = 0
        MPWarlockFDSaved.CurseShadow = 0
        MPWarlockFDSaved.CurseDoom = 0
        MPWarlockFDSaved.CurseTongues = 0
        MPWarlockFDSaved.CurseWeakness = 0
        MPWarlockFDSaved.CurseFatigue = 1
    else
        MPWarlockFDSaved.CurseFatigue = 0
    end

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockFDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockFDSaved.CurseShadow))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockFDSaved.CurseDoom))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockFDSaved.CurseTongues))
    checkButton_CurseWeakness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseWeakness))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockFDSaved.CurseFatigue))

end)









-- 高级


postion_y = postion_y+25

-- 添加提示内容区域
local TipText1 = CatUISettingsWarlockFD:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-100


-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
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
        MPWarlockFDSaved.RacialTraits = 1
    else
        MPWarlockFDSaved.RacialTraits = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
    MPWarlockFDSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockFDSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockFDSaved.HealthStone_Value .."%|r")
    else
        MPWarlockFDSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockFDSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - BOSS
local checkButton_BOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_BOSS:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
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
        MPWarlockFDSaved.BOSS = 1
    else
        MPWarlockFDSaved.BOSS = 0
    end
end)




-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
    MPWarlockFDSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockFDSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockFDSaved.HerbalTea_Value .."%|r")
    else
        MPWarlockFDSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockFDSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 创建单选框 - 大诅咒BOSS
local checkButton_CurseBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseBOSS", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_CurseBOSS:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
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
        MPWarlockFDSaved.CurseBOSS = 1
    else
        MPWarlockFDSaved.CurseBOSS = 0
    end
end)



-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
    MPWarlockFDSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockFDSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockFDSaved.HerbalTeaMana_Value .."%|r")
    else
        MPWarlockFDSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockFDSaved.HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 暗影灼烧BOSS
local checkButton_ShadowburnBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonFirstShadowBolt", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_ShadowburnBOSS:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
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
        MPWarlockFDSaved.ShadowburnBOSS = 1
    else
        MPWarlockFDSaved.ShadowburnBOSS = 0
    end
end)


-- 创建单选框 - 生命分流
local checkButton_LifeTap = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_LifeTap", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_LifeTap:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y)
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
    MPWarlockFDSaved.LifeTap_Value = arg1
    _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockFDSaved.LifeTap_Value .."%|r")
end)

-- 设置点击事件
checkButton_LifeTap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.LifeTap = 1
        color_LifeTap = "|cFFFFD100"
        _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockFDSaved.LifeTap_Value .."%|r")
    else
        MPWarlockFDSaved.LifeTap = 0
        color_LifeTap = "|cFF888888"
        _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockFDSaved.LifeTap_Value .."%|r")
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
    MPWarlockFDSaved.LifeTap_Mana = arg1
end)





postion_y = postion_y-40

-- 创建单选框 - 灵魂之火BOSS
local checkButton_SoulFireBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonSoulFireBOSS", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_SoulFireBOSS:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
checkButton_SoulFireBOSS:SetScale(0.8)

-- 添加文字标签
local checkText_SoulFireBOSS = checkButton_SoulFireBOSS:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SoulFireBOSS:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SoulFireBOSS:SetTextColor(1, 1, 1)
checkText_SoulFireBOSS:SetPoint("LEFT", checkButton_SoulFireBOSS, "LEFT", 34, 1)
checkText_SoulFireBOSS:SetText("非BOSS忽略 灵魂之火")

-- 设置点击事件
checkButton_SoulFireBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.SoulFireBOSS = 1
    else
        MPWarlockFDSaved.SoulFireBOSS = 0
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 预读灵魂之火
local checkButton_First = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonFirst", CatUISettingsWarlockFD, "UICheckButtonTemplate")
checkButton_First:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 20, postion_y)
checkButton_First:SetScale(0.8)

-- 添加文字标签
local checkText_First = checkButton_First:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_First:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_First:SetTextColor(1, 1, 1)
checkText_First:SetPoint("LEFT", checkButton_First, "LEFT", 34, 1)
checkText_First:SetText("进战斗前预读 灵魂之火")

-- 设置点击事件
checkButton_First:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.First = 1
    else
        MPWarlockFDSaved.First = 0
    end
end)

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.Soulspeed = 1
    else
        MPWarlockFDSaved.Soulspeed = 0
    end
end)


postion_y = postion_y - 60


-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarlockFD, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 120, -44)
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
    MPResetWarlockFDSettings()
    MPInitWarlockFDSettings()
end)


local MLDButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarlockFD, "UIPanelButtonTemplate")
MLDButton:SetPoint("TOPLEFT", CatUISettingsWarlockFD, "TOPLEFT", 340, postion_y+150)
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
MPBottomLine(CatUISettingsWarlockFD)

local checkButton_Power = MPPublicCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.Power = 1
    else
        MPWarlockFDSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockFDSaved.Pick = 1
    else
        MPWarlockFDSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsWarlockFD, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsWarlockFD:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsWarlockFD, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFF9482C9/fhdps|r ]  [ 多线Dot |cFF9482C9/MDot|r (需SuperWoW) ]")



-- 配置文件版本号
local WarlockFDSettingsUIVersion = 10

function MPResetWarlockFDSettings()

    MPWarlockFDSaved.Version = WarlockFDSettingsUIVersion

    -- 基本配置

    MPWarlockFDSaved.CurseAgony = 0
    MPWarlockFDSaved.Corruption = 0
    MPWarlockFDSaved.SoulFire = 1
    MPWarlockFDSaved.Conflagrate = 1
    MPWarlockFDSaved.SearingPain = 1
    MPWarlockFDSaved.ShadowBolt = 0
    MPWarlockFDSaved.Immolate = 1
    MPWarlockFDSaved.Shadowburn = 0

    MPWarlockFDSaved.PetAttack = 0

    MPWarlockFDSaved.Trinket_Upper = 1
    MPWarlockFDSaved.TUBoss = 0
    MPWarlockFDSaved.Trinket_Below = 1
    MPWarlockFDSaved.TBBoss = 0
    MPWarlockFDSaved.Target = 0
    MPWarlockFDSaved.Overpowering = 0

    MPWarlockFDSaved.CurseRecklessness = 0
    MPWarlockFDSaved.CurseElements = 1
    MPWarlockFDSaved.CurseShadow = 0
    MPWarlockFDSaved.CurseTongues = 0
    MPWarlockFDSaved.CurseWeakness = 0
    MPWarlockFDSaved.CurseFatigue = 0
    MPWarlockFDSaved.CurseDoom = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPWarlockFDSaved.HealthStone = 1
    MPWarlockFDSaved.HealthStone_Value = 30
    MPWarlockFDSaved.HerbalTea = 1
    MPWarlockFDSaved.HerbalTea_Value = 20
    MPWarlockFDSaved.HerbalTeaMana = 0
    MPWarlockFDSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPWarlockFDSaved.SuperWoW = 1
    MPWarlockFDSaved.UnitXP = 1

    MPWarlockFDSaved.BOSS = 0
    MPWarlockFDSaved.CurseBOSS = 0
    MPWarlockFDSaved.ShadowburnBOSS = 0
    MPWarlockFDSaved.SoulFireBOSS = 0
    MPWarlockFDSaved.First = 0

    MPWarlockFDSaved.RacialTraits = 0
    MPWarlockFDSaved.Soulspeed = 0

    MPWarlockFDSaved.LifeTap = 0
    MPWarlockFDSaved.LifeTap_Value = 60
    MPWarlockFDSaved.LifeTap_Mana = 70

    -- 通用
    MPWarlockFDSaved.Power = 0
    MPWarlockFDSaved.Pick = 0

end


local function MPInitWarlockFDSettingsPart1()
    checkButton_CurseAgony:SetChecked(ToBoolean(MPWarlockFDSaved.CurseAgony))
    checkButton_Corruption:SetChecked(ToBoolean(MPWarlockFDSaved.Corruption))

    checkButton_SoulFire:SetChecked(ToBoolean(MPWarlockFDSaved.SoulFire))
    checkButton_Conflagrate:SetChecked( ToBoolean(MPWarlockFDSaved.Conflagrate) )
    checkButton_SearingPain:SetChecked( ToBoolean(MPWarlockFDSaved.SearingPain) )
    checkButton_ShadowBolt:SetChecked( ToBoolean(MPWarlockFDSaved.ShadowBolt) )
    checkButton_Immolate:SetChecked(ToBoolean(MPWarlockFDSaved.Immolate))
    checkButton_Shadowburn:SetChecked(ToBoolean(MPWarlockFDSaved.Shadowburn))
    checkButton_Target:SetChecked(ToBoolean(MPWarlockFDSaved.Target))
    checkButton_Overpowering:SetChecked(ToBoolean(MPWarlockFDSaved.Overpowering))
    checkButton_PetAttack:SetChecked(ToBoolean(MPWarlockFDSaved.PetAttack))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPWarlockFDSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPWarlockFDSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPWarlockFDSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPWarlockFDSaved.TBBoss))

    checkButton_BOSS:SetChecked(ToBoolean(MPWarlockFDSaved.BOSS))
    checkButton_CurseBOSS:SetChecked(ToBoolean(MPWarlockFDSaved.CurseBOSS))
    checkButton_ShadowburnBOSS:SetChecked(ToBoolean(MPWarlockFDSaved.ShadowburnBOSS))
    checkButton_SoulFireBOSS:SetChecked(ToBoolean(MPWarlockFDSaved.SoulFireBOSS))
    checkButton_First:SetChecked(ToBoolean(MPWarlockFDSaved.First))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPWarlockFDSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPWarlockFDSaved.Soulspeed))

    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPWarlockFDSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPWarlockFDSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPWarlockFDSaved.CurseShadow))
    checkButton_CurseTongues:SetChecked(ToBoolean(MPWarlockFDSaved.CurseTongues))
    checkButton_CurseFatigue:SetChecked(ToBoolean(MPWarlockFDSaved.CurseFatigue))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPWarlockFDSaved.CurseDoom))


end

function MPInitWarlockFDSettings()
    if not MPWarlockFDSaved then
        MPWarlockFDSaved = {}
        MPResetWarlockFDSettings()
    end

    if MPWarlockFDSaved.Version ~= WarlockFDSettingsUIVersion then
        MPResetWarlockFDSettings()
    end

    MPInitWarlockFDSettingsPart1()

    checkButton_Power:SetChecked(ToBoolean(MPWarlockFDSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPWarlockFDSaved.Pick))

    checkButton_HealthStone:SetChecked(ToBoolean(MPWarlockFDSaved.HealthStone))
    slider_HealthStone:SetValue(MPWarlockFDSaved.HealthStone_Value)
    if MPWarlockFDSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarlockFDSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPWarlockFDSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPWarlockFDSaved.HerbalTea_Value)
    if MPWarlockFDSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarlockFDSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPWarlockFDSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPWarlockFDSaved.HerbalTeaMana_Value)
    if MPWarlockFDSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPWarlockFDSaved.HerbalTeaMana_Value .."%|r")

    checkButton_LifeTap:SetChecked(MPWarlockFDSaved.LifeTap)
    slider_LifeTap:SetValue(MPWarlockFDSaved.LifeTap_Value)
    if MPWarlockFDSaved.LifeTap==1 then
        color_LifeTap = "|cFFFFD100"
    else
        color_LifeTap = "|cFF888888"
    end
    _G[slider_LifeTap:GetName().."Text"]:SetText(color_LifeTap.."安全血线: ".. MPWarlockFDSaved.LifeTap_Value .."%|r")

    slider_LifeTap_Mana:SetValue(MPWarlockFDSaved.LifeTap_Mana)

end

