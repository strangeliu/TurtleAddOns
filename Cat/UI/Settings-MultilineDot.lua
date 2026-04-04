-- 定义插件名称
local ADDON_NAME = "Settings-MultilineDot"

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsMultilineDot = MPCreateFrame(ADDON_NAME.."Frame", 520, 510, "|cFFDD4080"..MPLanguage.UI_Set_MultiDotTitle.."|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsMultilineDot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)




local postion_y = postion_y-40

-- 创建单选框 - 德鲁伊 - 月火术
local checkButton_Moonfire = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_Moonfire:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_Moonfire:SetScale(0.8)

-- 添加文字标签
local checkText_Moonfire = checkButton_Moonfire:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Moonfire:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Moonfire:SetTextColor(1, 1, 1)
checkText_Moonfire:SetPoint("LEFT", checkButton_Moonfire, "LEFT", 34, 1)
checkText_Moonfire:SetText(MPLanguage.UI_Set_DruidMoonfire)

-- 设置点击事件
checkButton_Moonfire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.Moonfire = 1
    else
        MPMultilineDotSaved.Moonfire = 0
    end
end)


local checkButton_InsectSwarm = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_InsectSwarm:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 340, postion_y)
checkButton_InsectSwarm:SetScale(0.8)

-- 添加文字标签
local checkText_InsectSwarm = checkButton_InsectSwarm:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_InsectSwarm:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_InsectSwarm:SetTextColor(1, 1, 1)
checkText_InsectSwarm:SetPoint("LEFT", checkButton_InsectSwarm, "LEFT", 34, 1)
checkText_InsectSwarm:SetText(MPLanguage.UI_Set_DruidInsectSwarm)

-- 设置点击事件
checkButton_InsectSwarm:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.InsectSwarm = 1
    else
        MPMultilineDotSaved.InsectSwarm = 0
    end
end)






postion_y = postion_y-60


-- 创建单选框 - 牧师 - 痛
local checkButton_Pain = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_Pain:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_Pain:SetScale(0.8)

-- 添加文字标签
local checkText_Pain = checkButton_Pain:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Pain:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Pain:SetTextColor(1, 1, 1)
checkText_Pain:SetPoint("LEFT", checkButton_Pain, "LEFT", 34, 1)
checkText_Pain:SetText(MPLanguage.UI_Set_PriestPain)

-- 设置点击事件
checkButton_Pain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.Pain = 1
    else
        MPMultilineDotSaved.Pain = 0
    end
end)




postion_y = postion_y-60

-- 创建单选框 - 术士 - 痛苦诅咒
local checkButton_CurseAgony = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_CurseAgony:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_CurseAgony:SetScale(0.8)

-- 添加文字标签
local checkText_CurseAgony = checkButton_CurseAgony:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CurseAgony:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CurseAgony:SetTextColor(1, 1, 1)
checkText_CurseAgony:SetPoint("LEFT", checkButton_CurseAgony, "LEFT", 34, 1)
checkText_CurseAgony:SetText(MPLanguage.UI_Set_WarlockCurseAgony)



-- 创建单选框 - 术士 - 腐蚀术
local checkButton_Corruption = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_Shaman", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_Corruption:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 340, postion_y)
checkButton_Corruption:SetScale(0.8)

-- 添加文字标签
local checkText_Corruption = checkButton_Corruption:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Corruption:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Corruption:SetTextColor(1, 1, 1)
checkText_Corruption:SetPoint("LEFT", checkButton_Corruption, "LEFT", 34, 1)
checkText_Corruption:SetText(MPLanguage.UI_Set_WarlockCorruption)

-- 设置点击事件
checkButton_Corruption:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.Corruption = 1
    else
        MPMultilineDotSaved.Corruption = 0
    end
end)




postion_y = postion_y-30


local checkButton_CurseDoom = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_Shaman", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_CurseDoom:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_CurseDoom:SetScale(0.8)

-- 添加文字标签
local checkText_CurseDoom = checkButton_CurseDoom:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CurseDoom:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CurseDoom:SetTextColor(1, 1, 1)
checkText_CurseDoom:SetPoint("LEFT", checkButton_CurseDoom, "LEFT", 34, 1)
checkText_CurseDoom:SetText(MPLanguage.UI_Set_WarlockCurseDoom)





-- 创建单选框 - 术士 - 生命虹吸
local checkButton_SiphonLife = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_SiphonLife:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 340, postion_y)
checkButton_SiphonLife:SetScale(0.8)

-- 添加文字标签
local checkText_SiphonLife = checkButton_SiphonLife:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SiphonLife:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SiphonLife:SetTextColor(1, 1, 1)
checkText_SiphonLife:SetPoint("LEFT", checkButton_SiphonLife, "LEFT", 34, 1)
checkText_SiphonLife:SetText(MPLanguage.UI_Set_WarlockSiphonLife)

-- 设置点击事件
checkButton_SiphonLife:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.SiphonLife = 1
    else
        MPMultilineDotSaved.SiphonLife = 0
    end
end)





postion_y = postion_y-30

-- 创建单选框 - 术士 - 鲁莽诅咒
local checkButton_CurseRecklessness = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_Shaman", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_CurseRecklessness:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_CurseRecklessness:SetScale(0.8)

-- 添加文字标签
local checkText_CurseRecklessness = checkButton_CurseRecklessness:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CurseRecklessness:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CurseRecklessness:SetTextColor(1, 1, 1)
checkText_CurseRecklessness:SetPoint("LEFT", checkButton_CurseRecklessness, "LEFT", 34, 1)
checkText_CurseRecklessness:SetText(MPLanguage.UI_Set_WarlockCurseRecklessness)


-- 创建单选框 - 术士 - 献祭
local checkButton_Immolate = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_Immolate:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 340, postion_y)
checkButton_Immolate:SetScale(0.8)

-- 添加文字标签
local checkText_Immolate = checkButton_Immolate:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Immolate:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Immolate:SetTextColor(1, 1, 1)
checkText_Immolate:SetPoint("LEFT", checkButton_Immolate, "LEFT", 34, 1)
checkText_Immolate:SetText(MPLanguage.UI_Set_WarlockImmolate)

-- 设置点击事件
checkButton_Immolate:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.Immolate = 1
    else
        MPMultilineDotSaved.Immolate = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 术士 - 元素诅咒
local checkButton_CurseElements = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_Shaman", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_CurseElements:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_CurseElements:SetScale(0.8)

-- 添加文字标签
local checkText_CurseElements = checkButton_CurseElements:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CurseElements:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CurseElements:SetTextColor(1, 1, 1)
checkText_CurseElements:SetPoint("LEFT", checkButton_CurseElements, "LEFT", 34, 1)
checkText_CurseElements:SetText(MPLanguage.UI_Set_WarlockCurseElements)


postion_y = postion_y-30

-- 创建单选框 - 术士 - 暗影诅咒
local checkButton_CurseShadow = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_Shaman", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_CurseShadow:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_CurseShadow:SetScale(0.8)

-- 添加文字标签
local checkText_CurseShadow = checkButton_CurseShadow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_CurseShadow:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_CurseShadow:SetTextColor(1, 1, 1)
checkText_CurseShadow:SetPoint("LEFT", checkButton_CurseShadow, "LEFT", 34, 1)
checkText_CurseShadow:SetText(MPLanguage.UI_Set_WarlockCurseShadow)



-- 痛苦点击事件
checkButton_CurseAgony:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.CurseAgony = 1
        MPMultilineDotSaved.CurseDoom = 0
        MPMultilineDotSaved.CurseRecklessness = 0
        MPMultilineDotSaved.CurseElements = 0
        MPMultilineDotSaved.CurseShadow = 0
    else
        MPMultilineDotSaved.CurseAgony = 0
    end
    checkButton_CurseAgony:SetChecked(ToBoolean(MPMultilineDotSaved.CurseAgony))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPMultilineDotSaved.CurseDoom))
    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPMultilineDotSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPMultilineDotSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPMultilineDotSaved.CurseShadow))
end)

-- 厄运点击事件
checkButton_CurseDoom:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.CurseAgony = 0
        MPMultilineDotSaved.CurseDoom = 1
        MPMultilineDotSaved.CurseRecklessness = 0
        MPMultilineDotSaved.CurseElements = 0
        MPMultilineDotSaved.CurseShadow = 0
    else
        MPMultilineDotSaved.CurseDoom = 0
    end
    checkButton_CurseAgony:SetChecked(ToBoolean(MPMultilineDotSaved.CurseAgony))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPMultilineDotSaved.CurseDoom))
    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPMultilineDotSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPMultilineDotSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPMultilineDotSaved.CurseShadow))

end)

-- 鲁莽诅咒点击事件
checkButton_CurseRecklessness:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.CurseAgony = 0
        MPMultilineDotSaved.CurseDoom = 0
        MPMultilineDotSaved.CurseRecklessness = 1
        MPMultilineDotSaved.CurseElements = 0
        MPMultilineDotSaved.CurseShadow = 0
    else
        MPMultilineDotSaved.CurseRecklessness = 0
    end
    checkButton_CurseAgony:SetChecked(ToBoolean(MPMultilineDotSaved.CurseAgony))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPMultilineDotSaved.CurseDoom))
    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPMultilineDotSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPMultilineDotSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPMultilineDotSaved.CurseShadow))

end)

-- 元素诅咒点击事件
checkButton_CurseElements:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.CurseAgony = 0
        MPMultilineDotSaved.CurseDoom = 0
        MPMultilineDotSaved.CurseRecklessness = 0
        MPMultilineDotSaved.CurseElements = 1
        MPMultilineDotSaved.CurseShadow = 0
    else
        MPMultilineDotSaved.CurseElements = 0
    end
    checkButton_CurseAgony:SetChecked(ToBoolean(MPMultilineDotSaved.CurseAgony))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPMultilineDotSaved.CurseDoom))
    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPMultilineDotSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPMultilineDotSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPMultilineDotSaved.CurseShadow))

end)

-- 暗影诅咒点击事件
checkButton_CurseShadow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.CurseAgony = 0
        MPMultilineDotSaved.CurseDoom = 0
        MPMultilineDotSaved.CurseRecklessness = 0
        MPMultilineDotSaved.CurseElements = 0
        MPMultilineDotSaved.CurseShadow = 1
    else
        MPMultilineDotSaved.CurseShadow = 0
    end
    checkButton_CurseAgony:SetChecked(ToBoolean(MPMultilineDotSaved.CurseAgony))
    checkButton_CurseDoom:SetChecked(ToBoolean(MPMultilineDotSaved.CurseDoom))
    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPMultilineDotSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPMultilineDotSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPMultilineDotSaved.CurseShadow))

end)




postion_y = postion_y+20


-- 添加提示内容区域
local TipText = CatUISettingsMultilineDot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-105


-- 创建单选框 - 战斗中
local checkButton_InFight = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_InFight:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_InFight:SetScale(0.8)

-- 添加文字标签
local checkText_InFight = checkButton_InFight:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_InFight:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_InFight:SetTextColor(1, 1, 1)
checkText_InFight:SetPoint("LEFT", checkButton_InFight, "LEFT", 34, 1)
checkText_InFight:SetText(MPLanguage.UI_Set_InFightOnly)

-- 设置点击事件
checkButton_InFight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.InFight = 1
    else
        MPMultilineDotSaved.InFight = 0
    end
end)

-- 创建单选框 - 忽略被硬控目标
local checkButton_NoCC = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_NoCC:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 340, postion_y)
checkButton_NoCC:SetScale(0.8)

-- 添加文字标签
local checkText_NoCC = checkButton_NoCC:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_NoCC:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_NoCC:SetTextColor(1, 1, 1)
checkText_NoCC:SetPoint("LEFT", checkButton_NoCC, "LEFT", 34, 1)
checkText_NoCC:SetText(MPLanguage.UI_Set_IgnoreCC)

-- 设置点击事件
checkButton_NoCC:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.NoCC = 1
    else
        MPMultilineDotSaved.NoCC = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 主动索敌
local checkButton_ScanEnemy = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_ScanEnemy:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y)
checkButton_ScanEnemy:SetScale(0.8)

-- 添加文字标签
local checkText_ScanEnemy = checkButton_ScanEnemy:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ScanEnemy:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ScanEnemy:SetTextColor(1, 1, 1)
checkText_ScanEnemy:SetPoint("LEFT", checkButton_ScanEnemy, "LEFT", 34, 1)
checkText_ScanEnemy:SetText(MPLanguage.UI_Set_ScanEnemy)

-- 设置点击事件
checkButton_ScanEnemy:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.ScanEnemy = 1
    else
        MPMultilineDotSaved.ScanEnemy = 0
    end
end)



-- 创建单选框 - 忽略未进入战斗目标
local checkButton_NoCombat = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_NoCombat:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 340, postion_y)
checkButton_NoCombat:SetScale(0.8)

-- 添加文字标签
local checkText_NoCombat = checkButton_NoCombat:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_NoCombat:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_NoCombat:SetTextColor(1, 1, 1)
checkText_NoCombat:SetPoint("LEFT", checkButton_NoCombat, "LEFT", 34, 1)
checkText_NoCombat:SetText(MPLanguage.UI_Set_IgnoreNotInCombat)

-- 设置点击事件
checkButton_NoCombat:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.NoCombat = 1
    else
        MPMultilineDotSaved.NoCombat = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 忽略玩家目标
local checkButton_NOPlayer = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMultilineDot, "UICheckButtonTemplate")
checkButton_NOPlayer:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 340, postion_y)
checkButton_NOPlayer:SetScale(0.8)

-- 添加文字标签
local checkText_NOPlayer = checkButton_NOPlayer:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_NOPlayer:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_NOPlayer:SetTextColor(1, 1, 1)
checkText_NOPlayer:SetPoint("LEFT", checkButton_NOPlayer, "LEFT", 34, 1)
checkText_NOPlayer:SetText(MPLanguage.UI_Set_IgnorePlayer)

-- 设置点击事件
checkButton_NOPlayer:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMultilineDotSaved.NOPlayer = 1
    else
        MPMultilineDotSaved.NOPlayer = 0
    end
end)

-- 血量节点
local slider_BeginValue = CreateFrame("Slider", ADDON_NAME.."BeginValue", CatUISettingsMultilineDot, "OptionsSliderTemplate")
slider_BeginValue:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 20, postion_y+60)
slider_BeginValue:SetWidth(220) -- 拖动条长度
slider_BeginValue:SetHeight(16) -- 拖动条高度

slider_BeginValue:SetMinMaxValues(0, 60000)
slider_BeginValue:SetValueStep(1000)
slider_BeginValue:SetValue(3000) -- 默认值
MPCatUISliderRegionHide(slider_BeginValue)

_G[slider_BeginValue:GetName().."Text"]:SetText("")
_G[slider_BeginValue:GetName().."Low"]:Hide()
_G[slider_BeginValue:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_BeginValue:SetScript("OnValueChanged", function()
    MPMultilineDotSaved.BeginValue = arg1

    _G[slider_BeginValue:GetName().."Text"]:SetText(MPLanguage.UI_Set_HPAbove..MPMultilineDotSaved.BeginValue)
end)





postion_y = postion_y + 270

-- 添加文字标签
local checkText_SuperWoW = CatUISettingsMultilineDot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SuperWoW:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_SuperWoW:SetTextColor(1, 1, 1)
checkText_SuperWoW:SetPoint("LEFT", CatUISettingsMultilineDot, "LEFT", 20, postion_y)
checkText_SuperWoW:SetText(MPLanguage.UI_Set_MultiDotNote)



-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsMultilineDot, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsMultilineDot, "TOPLEFT", 120, -44)
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
    MPResetMultilineDotSettings()
    MPInitMultilineDotSettings()
end)


-- 添加提示内容区域
local TipText = CatUISettingsMultilineDot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsMultilineDot, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText(MPLanguage.UI_Set_MultiDotMacroTip)



-- 配置文件版本号
local MultilineDotSettingsUIVersion = 12

function MPResetMultilineDotSettings()

    MPMultilineDotSaved.Version = MultilineDotSettingsUIVersion

    -- 基本配置

    MPMultilineDotSaved.Moonfire = 1
    MPMultilineDotSaved.InsectSwarm = 0

    MPMultilineDotSaved.CurseAgony = 1
    MPMultilineDotSaved.Corruption = 1
    MPMultilineDotSaved.SiphonLife = 0
    MPMultilineDotSaved.Immolate = 0

    MPMultilineDotSaved.CurseDoom = 0
    MPMultilineDotSaved.CurseRecklessness = 0
    MPMultilineDotSaved.CurseElements = 0
    MPMultilineDotSaved.CurseShadow = 0

    MPMultilineDotSaved.Pain = 1

    MPMultilineDotSaved.InFight = 0
    MPMultilineDotSaved.ScanEnemy = 0
    MPMultilineDotSaved.NoCC = 1
    MPMultilineDotSaved.NoCombat = 1
    MPMultilineDotSaved.NOPlayer = 0

    MPMultilineDotSaved.BeginValue = 1000

end




function MPInitMultilineDotSettings()

    if not MPMultilineDotSaved then
        MPMultilineDotSaved = {}
        MPResetMultilineDotSettings()
    end

    if MPMultilineDotSaved.Version ~= MultilineDotSettingsUIVersion then
        MPResetMultilineDotSettings()
    end

    checkButton_Moonfire:SetChecked(ToBoolean(MPMultilineDotSaved.Moonfire))
    checkButton_InsectSwarm:SetChecked(ToBoolean(MPMultilineDotSaved.InsectSwarm))

    checkButton_CurseAgony:SetChecked(ToBoolean(MPMultilineDotSaved.CurseAgony))
    checkButton_Corruption:SetChecked(ToBoolean(MPMultilineDotSaved.Corruption))
    checkButton_SiphonLife:SetChecked(ToBoolean(MPMultilineDotSaved.SiphonLife))
    checkButton_Immolate:SetChecked(ToBoolean(MPMultilineDotSaved.Immolate))

    checkButton_CurseDoom:SetChecked(ToBoolean(MPMultilineDotSaved.CurseDoom))
    checkButton_CurseRecklessness:SetChecked(ToBoolean(MPMultilineDotSaved.CurseRecklessness))
    checkButton_CurseElements:SetChecked(ToBoolean(MPMultilineDotSaved.CurseElements))
    checkButton_CurseShadow:SetChecked(ToBoolean(MPMultilineDotSaved.CurseShadow))

    checkButton_Pain:SetChecked(ToBoolean(MPMultilineDotSaved.Pain))

    checkButton_InFight:SetChecked(ToBoolean(MPMultilineDotSaved.InFight))
    checkButton_ScanEnemy:SetChecked(ToBoolean(MPMultilineDotSaved.ScanEnemy))
    checkButton_NoCC:SetChecked(ToBoolean(MPMultilineDotSaved.NoCC))
    checkButton_NoCombat:SetChecked(ToBoolean(MPMultilineDotSaved.NoCombat))
    checkButton_NOPlayer:SetChecked(ToBoolean(MPMultilineDotSaved.NOPlayer))

    slider_BeginValue:SetValue(MPMultilineDotSaved.BeginValue)
    _G[slider_BeginValue:GetName().."Text"]:SetText(MPLanguage.UI_Set_HPAbove..MPMultilineDotSaved.BeginValue)

end

