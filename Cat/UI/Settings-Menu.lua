-- 定义插件名称
local ADDON_NAME = "Settings-CatMenu"


-- 创建主框架
CatUISettingsCatMenu = MPCreateFrame(ADDON_NAME.."Frame", 520, 130, "设置界面 - 快捷入口")
tinsert(UISpecialFrames, ADDON_NAME.."Frame")


local postion_y = -50



-- 添加提示内容区域
local TipText = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsCatMenu, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("打开菜单命令 -  [ |cFFFFFFFF/CatUI|r ]      [ 版本: "..MPCatAddonVer.." ]")



-- 创建扁平化按钮
local function CreateFlatButton(name, parent, width, height, text, onClick)
    local button = CreateFrame("Button", name, parent, "UIPanelButtonTemplate")
    button:SetWidth(width or 90)
    button:SetHeight(height or 28)
    button:SetFont("Fonts\\FRIZQT__.TTF", 12)


    -- 设置文本
    button:SetText(text or "Button")
    
    button:SetScript("OnMouseUp", function(self)
        if onClick then onClick(this) end
    end)
    
    return button
end

local postion_x = 94
local postion_y = -10
local offset = 100
local height = 0


    postion_y = postion_y-50

    -- 添加提示内容区域
    local TipTextDruid = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextDruid:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextDruid:SetWidth(150)
    TipTextDruid:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextDruid:SetTextColor(1, 0.8, 0)
    TipTextDruid:SetJustifyH("LEFT")
    TipTextDruid:SetText("|cFFFF7D0A德鲁伊|r")

    local buttonCat = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "猫德", function()
        MPCatSettingsCloseAll()
        CatUISettingsCatWindow:Show()
    end)
    buttonCat:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonBear = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "熊德", function()
        MPCatSettingsCloseAll()
        CatUISettingsBearWindow:Show()
    end)
    buttonBear:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonBird = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "鸟德", function()
        MPCatSettingsCloseAll()
        CatUISettingsCOOWindow:Show()
    end)
    buttonBird:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)


    local buttonHeal = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "奶德", function()
        MPCatSettingsCloseAll()
        CatUISettingsDriudHealWindow:Show()
    end)
    buttonHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)


    local lineDriud = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    lineDriud:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    lineDriud:SetTexCoord(0.81, 0.94, 0.5, 1)
    lineDriud:SetVertexColor(0.5, 0.5, 0.5)
    lineDriud:SetWidth(460)
    lineDriud:SetHeight(3)
    lineDriud:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)



    postion_y = postion_y-50

    -- 添加提示内容区域
    local TipTextWarrior = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextWarrior:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextWarrior:SetWidth(150)
    TipTextWarrior:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextWarrior:SetTextColor(1, 0.8, 0)
    TipTextWarrior:SetJustifyH("LEFT")
    TipTextWarrior:SetText("|cFFC79C6E战士|r")

    local buttonWarriorArms = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "武器", function()
        MPCatSettingsCloseAll()
        CatUISettingsWarriorArms:Show()
    end)
    buttonWarriorArms:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonWarriorFury = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "狂暴", function()
        MPCatSettingsCloseAll()
        CatUISettingsWarriorFury:Show()
    end)
    buttonWarriorFury:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonWarriorEvil = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "邪修", function()
        MPCatSettingsCloseAll()
        CatUISettingsWarriorEvil:Show()
    end)
    buttonWarriorEvil:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)

    local buttonWarriorTank = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "防战", function()
        MPCatSettingsCloseAll()
        CatUISettingsWarriorTank:Show()
    end)
    buttonWarriorTank:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)

    local lineWarrior = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    lineWarrior:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    lineWarrior:SetTexCoord(0.81, 0.94, 0.5, 1)
    lineWarrior:SetVertexColor(0.5, 0.5, 0.5)
    lineWarrior:SetWidth(460)
    lineWarrior:SetHeight(3)
    lineWarrior:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)



    postion_y = postion_y-50

    local TipTextPaladin = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextPaladin:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextPaladin:SetWidth(150)
    TipTextPaladin:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextPaladin:SetTextColor(1, 0.8, 0)
    TipTextPaladin:SetJustifyH("LEFT")
    TipTextPaladin:SetText("|cFFF58CBA圣骑士|r")

    local buttonPaladinCJ = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "惩戒", function()
        MPCatSettingsCloseAll()
        CatUISettingsPaladinCJ:Show()
    end)
    buttonPaladinCJ:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonPaladinTank = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "防骑", function()
        MPCatSettingsCloseAll()
        CatUISettingsPaladinTank:Show()
    end)
    buttonPaladinTank:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonPaladinHeal = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "奶骑", function()
        MPCatSettingsCloseAll()
        CatUISettingsPaladinHealWindow:Show()
    end)
    buttonPaladinHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)

    local buttonPaladinMeleeHeal = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "近战奶", function()
        MPCatSettingsCloseAll()
        CatUISettingsPaladinMeleeHeal:Show()
    end)
    buttonPaladinMeleeHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)


    local linePaladin = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    linePaladin:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    linePaladin:SetTexCoord(0.81, 0.94, 0.5, 1)
    linePaladin:SetVertexColor(0.5, 0.5, 0.5)
    linePaladin:SetWidth(460)
    linePaladin:SetHeight(3)
    linePaladin:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)




    postion_y = postion_y-50

    local TipTextRogue = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextRogue:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextRogue:SetWidth(150)
    TipTextRogue:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextRogue:SetTextColor(1, 0.8, 0)
    TipTextRogue:SetJustifyH("LEFT")
    TipTextRogue:SetText("|cFFFFF569盗贼|r")

    local buttonRogueCombatDPS = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "战斗贼", function()
        MPCatSettingsCloseAll()
        CatUISettingsRogueCombat:Show()
    end)
    buttonRogueCombatDPS:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonRogueEnvenomDPS = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "毒伤贼", function()
        MPCatSettingsCloseAll()
        CatUISettingsRogueEnvenom:Show()
    end)
    buttonRogueEnvenomDPS:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonRogueArmor = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "破甲贼", function()
        MPCatSettingsCloseAll()
        CatUISettingsRogueArmor:Show()
    end)
    buttonRogueArmor:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)

    local buttonRogue = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "自配置", function()
        MPCatSettingsCloseAll()
        CatUISettingsRogue:Show()
    end)
    buttonRogue:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)

    local lineRogue = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    lineRogue:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    lineRogue:SetTexCoord(0.81, 0.94, 0.5, 1)
    lineRogue:SetVertexColor(0.5, 0.5, 0.5)
    lineRogue:SetWidth(460)
    lineRogue:SetHeight(3)
    lineRogue:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)





    postion_y = postion_y-50

    local TipTextShaman = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextShaman:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextShaman:SetWidth(150)
    TipTextShaman:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextShaman:SetTextColor(1, 0.8, 0)
    TipTextShaman:SetJustifyH("LEFT")
    TipTextShaman:SetText("|cFF0070DE萨满|r")

    local buttonShamanEnhance = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "增强萨", function()
        MPCatSettingsCloseAll()
        CatUISettingsShamanEnhanceWindow:Show()
    end)
    buttonShamanEnhance:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonShamanElemental = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "元素萨", function()
        MPCatSettingsCloseAll()
        CatUISettingsShamanElementalWindow:Show()
    end)
    buttonShamanElemental:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonShamanHeal = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "奶萨", function()
        MPCatSettingsCloseAll()
        CatUISettingsShamanHealWindow:Show()
    end)
    buttonShamanHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)

    local lineShaman = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    lineShaman:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    lineShaman:SetTexCoord(0.81, 0.94, 0.5, 1)
    lineShaman:SetVertexColor(0.5, 0.5, 0.5)
    lineShaman:SetWidth(460)
    lineShaman:SetHeight(3)
    lineShaman:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)




    postion_y = postion_y-50

    local TipTextWarlock = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextWarlock:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextWarlock:SetWidth(150)
    TipTextWarlock:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextWarlock:SetTextColor(1, 0.8, 0)
    TipTextWarlock:SetJustifyH("LEFT")
    TipTextWarlock:SetText("|cFF9482C9术士|r")

    local buttonWarlockSD = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "暗毁术", function()
        MPCatSettingsCloseAll()
        CatUISettingsWarlockSD:Show()
    end)
    buttonWarlockSD:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonWarlockFD = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "火毁术", function()
        MPCatSettingsCloseAll()
        CatUISettingsWarlockFD:Show()
    end)
    buttonWarlockFD:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonWarlockAff = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "痛苦术", function()
        MPCatSettingsCloseAll()
        CatUISettingsWarlockAff:Show()
    end)
    buttonWarlockAff:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)

    local buttonWarlockDemo = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "恶魔术", function()
        MPCatSettingsCloseAll()
        CatUISettingsWarlockDemo:Show()
    end)
    buttonWarlockDemo:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)


    local lineWarlock = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    lineWarlock:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    lineWarlock:SetTexCoord(0.81, 0.94, 0.5, 1)
    lineWarlock:SetVertexColor(0.5, 0.5, 0.5)
    lineWarlock:SetWidth(460)
    lineWarlock:SetHeight(3)
    lineWarlock:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)




    postion_y = postion_y-50

    local TipTextMage = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextMage:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextMage:SetWidth(150)
    TipTextMage:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextMage:SetTextColor(1, 0.8, 0)
    TipTextMage:SetJustifyH("LEFT")
    TipTextMage:SetText("|cFF69CCF0法师|r")

    local buttonMageArcane = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "奥法", function()
        MPCatSettingsCloseAll()
        CatUISettingsMageArcane:Show()
    end)
    buttonMageArcane:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonMageFire = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "火法", function()
        MPCatSettingsCloseAll()
        CatUISettingsMageFire:Show()
    end)
    buttonMageFire:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonMageFrost = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "冰法", function()
        MPCatSettingsCloseAll()
        CatUISettingsMageFrost:Show()
    end)
    buttonMageFrost:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)


    local lineMage = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    lineMage:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    lineMage:SetTexCoord(0.81, 0.94, 0.5, 1)
    lineMage:SetVertexColor(0.5, 0.5, 0.5)
    lineMage:SetWidth(460)
    lineMage:SetHeight(3)
    lineMage:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)



    postion_y = postion_y-50

    local TipTextPriest = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextPriest:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextPriest:SetWidth(150)
    TipTextPriest:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextPriest:SetTextColor(1, 0.8, 0)
    TipTextPriest:SetJustifyH("LEFT")
    TipTextPriest:SetText("|cFFFFFFFF牧师|r")

    local buttonPriestShadow = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "暗牧", function()
        MPCatSettingsCloseAll()
        CatUISettingsPriestShadow:Show()
    end)
    buttonPriestShadow:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonPriestDiscipline = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "戒律牧", function()
        MPCatSettingsCloseAll()
        CatUISettingsPriestDiscipline:Show()
    end)
    buttonPriestDiscipline:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonPriestHeal = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "神牧", function()
        MPCatSettingsCloseAll()
        CatUISettingsPriestHealWindow:Show()
    end)
    buttonPriestHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)

    local linePriest = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    linePriest:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    linePriest:SetTexCoord(0.81, 0.94, 0.5, 1)
    linePriest:SetVertexColor(0.5, 0.5, 0.5)
    linePriest:SetWidth(460)
    linePriest:SetHeight(3)
    linePriest:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)




    postion_y = postion_y-50

    local TipTextHunter = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    TipTextHunter:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    TipTextHunter:SetWidth(150)
    TipTextHunter:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
    TipTextHunter:SetTextColor(1, 0.8, 0)
    TipTextHunter:SetJustifyH("LEFT")
    TipTextHunter:SetText("|cFFABD473猎人|r")

    local buttonHunterBeast = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "兽王猎", function()
        MPCatSettingsCloseAll()
        CatUISettingsHunterBeast:Show()
    end)
    buttonHunterBeast:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

    local buttonHunterShot = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "射击猎", function()
        MPCatSettingsCloseAll()
        CatUISettingsHunterShot:Show()
    end)
    buttonHunterShot:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

    local buttonHunterMelee = CreateFlatButton("MyFlatButton1", CatUISettingsCatMenu, nil, nil, "生存猎", function()
        MPCatSettingsCloseAll()
        CatUISettingsHunterMelee:Show()
    end)
    buttonHunterMelee:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)

    local lineHunter = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
    lineHunter:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    lineHunter:SetTexCoord(0.81, 0.94, 0.5, 1)
    lineHunter:SetVertexColor(0.5, 0.5, 0.5)
    lineHunter:SetWidth(460)
    lineHunter:SetHeight(3)
    lineHunter:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)






postion_y = postion_y-50

local TipTextNormal = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipTextNormal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
TipTextNormal:SetWidth(150)
TipTextNormal:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
TipTextNormal:SetTextColor(1, 0.8, 0)
TipTextNormal:SetJustifyH("LEFT")
TipTextNormal:SetText("|cFFDD4080通用|r")

local buttonNormalINT = CreateFlatButton("buttonNormalINT", CatUISettingsCatMenu, nil, nil, "读条打断", function()
    MPCatSettingsCloseAll()
    CatUISettingsInterrupt:Show()
end)
buttonNormalINT:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

local buttonNormalDOT = CreateFlatButton("buttonNormalDOT", CatUISettingsCatMenu, nil, nil, "多线DOT", function()
    MPCatSettingsCloseAll()
    CatUISettingsMultilineDot:Show()
end)
buttonNormalDOT:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)


local buttonAutoLoot = CreateFlatButton("buttonAutoLoot", CatUISettingsCatMenu, nil, nil, "自动拾取", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)
buttonAutoLoot:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

local buttonPower = CreateFlatButton("buttonPower", CatUISettingsCatMenu, nil, nil, "功能药水", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)
buttonPower:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)


local lineNormal = CatUISettingsCatMenu:CreateTexture(nil, "ARTWORK")
lineNormal:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
lineNormal:SetTexCoord(0.81, 0.94, 0.5, 1)
lineNormal:SetVertexColor(0.5, 0.5, 0.5)
lineNormal:SetWidth(460)
lineNormal:SetHeight(3)
lineNormal:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)


postion_y = postion_y-50

local TipTextAdd = CatUISettingsCatMenu:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipTextAdd:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
TipTextAdd:SetWidth(150)
TipTextAdd:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
TipTextAdd:SetTextColor(1, 0.8, 0)
TipTextAdd:SetJustifyH("LEFT")
TipTextAdd:SetText("|cFF007582附加|r")


local buttonNormalElixir = CreateFlatButton("buttonNormalElixir", CatUISettingsCatMenu, nil, nil, "自动药剂", function()
    MPCatSettingsCloseAll()
    CatUISettingsElixir:Show()
end)
buttonNormalElixir:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)

local buttonNormalMelee = CreateFlatButton("buttonNormalDebug", CatUISettingsCatMenu, nil, nil, "近战距离", function()
    if not MP_UnitXP then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."未发现UnitXP模组，近战距离监视无法使用！")
    else
        MPCatSettingsCloseAll()
        CatUIMelee:Show()
        MPPublicSaved.MeleeWindowDisplay=1
    end
end)
buttonNormalMelee:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)

local buttonNormalDebug = CreateFlatButton("buttonNormalDebug", CatUISettingsCatMenu, nil, nil, "实时监控", function()
    MPCatSettingsCloseAll()
    CatDebugWindow:Show()
    MPPublicSaved.DebugWindowDisplay=1
end)
buttonNormalDebug:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)


local buttonNormalClassUp = CreateFlatButton("buttonNormalClass", CatUISettingsCatMenu, nil, nil, "收缩↑", function()
    MPCatSettingsCloseAll()
    MPPublicSaved.AllClass=0 
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."关闭所有职业宏，仅保留当前职业。")
end)

buttonNormalClassUp:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
local buttonNormalClassDown = CreateFlatButton("buttonNormalClass", CatUISettingsCatMenu, nil, nil, "展开↓", function()
    MPCatSettingsCloseAll()
    MPPublicSaved.AllClass=1 
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."打开所有职业宏。")
end)
buttonNormalClassDown:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)




local function InitMenuSettingsPart1()

    if MPPlayerClass == "DRUID" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextDruid:Show()
        buttonCat:Show()
        buttonBear:Show()
        buttonBird:Show()
        buttonHeal:Show()
        lineDriud:Show()
        TipTextDruid:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonCat:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonBear:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonBird:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        buttonHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
        lineDriud:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextDruid:Hide()
        buttonCat:Hide()
        buttonBear:Hide()
        buttonBird:Hide()
        buttonHeal:Hide()
        lineDriud:Hide()
    end

    if MPPlayerClass == "WARRIOR" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextWarrior:Show()
        buttonWarriorArms:Show()
        buttonWarriorFury:Show()
        buttonWarriorEvil:Show()
        buttonWarriorTank:Show()
        lineWarrior:Show()
        TipTextWarrior:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonWarriorArms:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonWarriorFury:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonWarriorEvil:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        buttonWarriorTank:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
        lineWarrior:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextWarrior:Hide()
        buttonWarriorArms:Hide()
        buttonWarriorFury:Hide()
        buttonWarriorEvil:Hide()
        buttonWarriorTank:Hide()
        lineWarrior:Hide()
    end

    if MPPlayerClass == "PALADIN" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextPaladin:Show()
        buttonPaladinCJ:Show()
        buttonPaladinTank:Show()
        buttonPaladinHeal:Show()
        buttonPaladinMeleeHeal:Show()
        linePaladin:Show()
        TipTextPaladin:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonPaladinCJ:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonPaladinTank:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonPaladinHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        buttonPaladinMeleeHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
        linePaladin:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextPaladin:Hide()
        buttonPaladinCJ:Hide()
        buttonPaladinTank:Hide()
        buttonPaladinHeal:Hide()
        buttonPaladinMeleeHeal:Hide()
        linePaladin:Hide()
    end

    if MPPlayerClass == "ROGUE" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextRogue:Show()
        buttonRogueCombatDPS:Show()
        buttonRogueEnvenomDPS:Show()
        buttonRogueArmor:Show()
        buttonRogue:Show()
        lineRogue:Show()
        TipTextRogue:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonRogueCombatDPS:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonRogueEnvenomDPS:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonRogueArmor:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        buttonRogue:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
        lineRogue:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextRogue:Hide()
        buttonRogueCombatDPS:Hide()
        buttonRogueEnvenomDPS:Hide()
        buttonRogueArmor:Hide()
        buttonRogue:Hide()
        lineRogue:Hide()
    end

end

local function InitMenuSettingsPart2()

    if MPPlayerClass == "SHAMAN" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextShaman:Show()
        buttonShamanEnhance:Show()
        buttonShamanElemental:Show()
        buttonShamanHeal:Show()
        lineShaman:Show()
        TipTextShaman:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonShamanEnhance:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonShamanElemental:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonShamanHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        lineShaman:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextShaman:Hide()
        buttonShamanEnhance:Hide()
        buttonShamanElemental:Hide()
        buttonShamanHeal:Hide()
        lineShaman:Hide()
    end

    if MPPlayerClass == "WARLOCK" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextWarlock:Show()
        buttonWarlockSD:Show()
        buttonWarlockFD:Show()
        buttonWarlockAff:Show()
        buttonWarlockDemo:Show()
        lineWarlock:Show()
        TipTextWarlock:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonWarlockSD:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonWarlockFD:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonWarlockAff:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        buttonWarlockDemo:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
        lineWarlock:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextWarlock:Hide()
        buttonWarlockSD:Hide()
        buttonWarlockFD:Hide()
        buttonWarlockAff:Hide()
        buttonWarlockDemo:Hide()
        lineWarlock:Hide()
    end

    if MPPlayerClass == "PRIEST" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextPriest:Show()
        buttonPriestShadow:Show()
        buttonPriestDiscipline:Show()
        buttonPriestHeal:Show()
        linePriest:Show()
        TipTextPriest:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonPriestShadow:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonPriestDiscipline:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonPriestHeal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        linePriest:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextPriest:Hide()
        buttonPriestShadow:Hide()
        buttonPriestDiscipline:Hide()
        buttonPriestHeal:Hide()
        linePriest:Hide()
    end

    if MPPlayerClass == "MAGE" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextMage:Show()
        buttonMageArcane:Show()
        buttonMageFire:Show()
        buttonMageFrost:Show()
        lineMage:Show()
        TipTextMage:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonMageArcane:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonMageFire:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonMageFrost:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        lineMage:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextMage:Hide()
        buttonMageArcane:Hide()
        buttonMageFire:Hide()
        buttonMageFrost:Hide()
        lineMage:Hide()
    end
    if MPPlayerClass == "HUNTER" or MPPublicSaved.AllClass==1 then
        height = height + 50
        postion_y = postion_y-50
        TipTextHunter:Show()
        buttonHunterBeast:Show()
        buttonHunterShot:Show()
        buttonHunterMelee:Show()
        lineHunter:Show()
        TipTextHunter:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
        buttonHunterBeast:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
        buttonHunterShot:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
        buttonHunterMelee:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
        lineHunter:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)
    else
        TipTextHunter:Hide()
        buttonHunterBeast:Hide()
        buttonHunterShot:Hide()
        buttonHunterMelee:Hide()
        lineHunter:Hide()
    end

end


function MPInitMenuSettings()
    height = 0
    postion_y = -10
    offset = 100

    InitMenuSettingsPart1()
    InitMenuSettingsPart2()


    postion_y = postion_y-50
    TipTextNormal:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    buttonNormalINT:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
    buttonNormalDOT:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
    buttonAutoLoot:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)
    buttonPower:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
    lineNormal:SetPoint("TOP", CatUISettingsCatMenu, "TOP", 0, postion_y-36)

    postion_y = postion_y-50
    TipTextAdd:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", 34, postion_y-6)
    buttonNormalElixir:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x, postion_y)
    buttonNormalMelee:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset, postion_y)
    buttonNormalDebug:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*2, postion_y)


    if MPPublicSaved and MPPublicSaved.AllClass and MPPublicSaved.AllClass==1 then 
        buttonNormalClassUp:Show()
        buttonNormalClassDown:Hide()
        buttonNormalClassUp:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
    else
        buttonNormalClassUp:Hide()
        buttonNormalClassDown:Show()
        buttonNormalClassDown:SetPoint("TOPLEFT", CatUISettingsCatMenu, "TOPLEFT", postion_x+offset*3, postion_y)
    end

    -- 设置总窗口高度
    CatUISettingsCatMenu:SetHeight(180+height)

end

