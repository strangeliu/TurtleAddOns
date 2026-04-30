-- 定义插件名称
local ADDON_NAME = "Settings-Elixir"


-- 创建主框架
CatUISettingsElixir = MPCreateFrame(ADDON_NAME.."Frame", 780, 830, "|cFF007582附加 - 自动药剂|r")
CatUISettingsElixir:SetScale(0.8)

local function SEWarningText(pos)
    local Warning = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    Warning:SetPoint("TOPLEFT", pos, "TOPLEFT", -10, -6)
    Warning:SetWidth(50)
    Warning:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
    Warning:SetJustifyH("LEFT")
    Warning:SetText("|cFFFF0000！|r")
    Warning:Hide()

    return Warning
end

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)

local postion_y = postion_y-40

--[[
-- 创建单选框 - 使用
local checkButton_Use = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "开启自动药剂")
checkButton_Use:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Use = 1
    else
        MPElixirSaved.Use = 0
    end
end)

-- 创建单选框 - 战斗中
local checkButton_Combat = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "仅在战斗中生效")
checkButton_Combat:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Combat = 1
    else
        MPElixirSaved.Combat = 0
    end
end)
]]

local slider_LeftTime = CreateFrame("Slider", ADDON_NAME.."LeftTime_Value", CatUISettingsElixir, "OptionsSliderTemplate")
slider_LeftTime:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
slider_LeftTime:SetWidth(220) -- 拖动条长度
slider_LeftTime:SetHeight(16) -- 拖动条高度

slider_LeftTime:SetMinMaxValues(0, 10)
slider_LeftTime:SetValueStep(1)
slider_LeftTime:SetValue(2) -- 默认值
MPCatUISliderRegionHide(slider_LeftTime)

-- 值变化时的回调函数
slider_LeftTime:SetScript("OnValueChanged", function()
    MPElixirSaved.LeftTime = arg1
    _G[slider_LeftTime:GetName().."Text"]:SetText(MPLanguage.UI_Set_RemainingMinutes..MPElixirSaved.LeftTime..MPLanguage.UI_Set_MinutesRefill)
end)

-- 创建按钮 提示信息
local checkButton_Msg = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, MPLanguage.UI_Set_MsgNotify)
checkButton_Msg:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Msg = 1
    else
        MPElixirSaved.Msg = 0
    end
end)


-- 创建按钮 动态状态窗
local ShowButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsElixir, "UIPanelButtonTemplate")
ShowButton:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 530, postion_y+15)
ShowButton:SetWidth(120)
ShowButton:SetHeight(22)
ShowButton:SetFont("Fonts\\FRIZQT__.TTF", 12)
ShowButton:SetText(MPLanguage.UI_Set_DynamicWindow)

-- 调整按钮纹理
ShowButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
ShowButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
ShowButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
ShowButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
-- 按钮点击事件
ShowButton:SetScript("OnClick", function()
    MPCatElixirReset()
    CatElixir:Show()
    MPPublicSaved.ElixirWindowDisplay=1
end)

local slider_WindowSize = CreateFrame("Slider", ADDON_NAME.."WindowSize_Value", CatUISettingsElixir, "OptionsSliderTemplate")
slider_WindowSize:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 660, postion_y+10)
slider_WindowSize:SetWidth(80) -- 拖动条长度
slider_WindowSize:SetHeight(16) -- 拖动条高度

slider_WindowSize:SetMinMaxValues(0.5, 1.5)
slider_WindowSize:SetValueStep(0.1)
slider_WindowSize:SetValue(0.8) -- 默认值
MPCatUISliderRegionHide(slider_WindowSize)

-- 值变化时的回调函数
slider_WindowSize:SetScript("OnValueChanged", function()
    MPElixirSaved.WindowSize = arg1
    _G[slider_WindowSize:GetName().."Text"]:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    _G[slider_WindowSize:GetName().."Text"]:SetText(MPLanguage.UI_Set_WindowSize..string.format("%.1f", MPElixirSaved.WindowSize))
    CatElixir:SetScale(MPElixirSaved.WindowSize)
end)




postion_y = postion_y-30

-- 添加提示内容区域
local noCDTipText = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
noCDTipText:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
noCDTipText:SetWidth(250)
noCDTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
noCDTipText:SetTextColor(1, 0.8, 0)
noCDTipText:SetJustifyH("LEFT")
noCDTipText:SetText("合剂 ( 不自动使用，仅用于监控 )")


postion_y = postion_y-45


-- 创建单选框 - 泰坦合剂
local checkButton_Titans = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "泰坦合剂")
local Warning_Titans = SEWarningText(checkButton_Titans)
checkButton_Titans:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Titans = 1
    else
        MPElixirSaved.Titans = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)

-- 创建单选框 - 超级能量合剂
local checkButton_SupremePower = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "超级能量合剂")
local Warning_SupremePower = SEWarningText(checkButton_SupremePower)
checkButton_SupremePower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.SupremePower = 1
    else
        MPElixirSaved.SupremePower = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)

-- 创建单选框 - 精炼智慧合剂
local checkButton_DistilledWisdom = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "精炼智慧合剂")
local Warning_DistilledWisdom = SEWarningText(checkButton_DistilledWisdom)
checkButton_DistilledWisdom:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DistilledWisdom = 1
    else
        MPElixirSaved.DistilledWisdom = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)



postion_y = postion_y+5

-- 添加提示内容区域
local noCDTipText = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
noCDTipText:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
noCDTipText:SetWidth(250)
noCDTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
noCDTipText:SetTextColor(1, 0.8, 0)
noCDTipText:SetJustifyH("LEFT")
noCDTipText:SetText("独特药剂")


postion_y = postion_y-55


-- 创建单选框 - 赞扎之速
local checkButton_ZanzaSpeed = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "赞扎之速 (20移速)")
local Warning_ZanzaSpeed = SEWarningText(checkButton_ZanzaSpeed)
checkButton_ZanzaSpeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ZanzaSpeed = 1
    else
        MPElixirSaved.ZanzaSpeed = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)

-- 创建单选框 - 阿尔萨斯的礼物
local checkButton_ArthasGift = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "阿尔萨斯的礼物 (疾病)")
checkButton_ArthasGift:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ArthasGift = 1
    else
        MPElixirSaved.ArthasGift = 0
    end
    MPCatElixirReset()
end)


postion_y = postion_y+15

-- 生存药剂
local noCDTipText = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
noCDTipText:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
noCDTipText:SetWidth(250)
noCDTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
noCDTipText:SetTextColor(1, 0.8, 0)
noCDTipText:SetJustifyH("LEFT")
noCDTipText:SetText(MPLanguage.UI_Set_SurvivalElixir)


postion_y = postion_y-65


-- 创建单选框 - 赞扎之魂
local checkButton_ZanzaSpirit = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "赞扎之魂 (50耐)")
local Warning_ZanzaSpirit = SEWarningText(checkButton_ZanzaSpirit)

-- 赞扎之魂
checkButton_ZanzaSpirit:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ZanzaSpirit = 1
    else
        MPElixirSaved.ZanzaSpirit = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)



-- 创建单选框 - 麦迪文的葡萄酒
local checkButton_MedivhWine = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "麦迪文的葡萄酒 (25耐)")
checkButton_MedivhWine:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.MedivhWine = 1
    else
        MPElixirSaved.MedivhWine = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 肺片鸡尾酒
local checkButton_Cocktail = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "肺片鸡尾酒 (25耐)")
local Warning_Cocktail = SEWarningText(checkButton_Cocktail)

-- 肺片鸡尾酒
checkButton_Cocktail:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Cocktail = 1
    else
        MPElixirSaved.Cocktail = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


postion_y = postion_y-30

-- 创建单选框 - 坚韧药剂
local checkButton_Fortitude = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "坚韧药剂 (120生命)")
checkButton_Fortitude:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Fortitude = 1
    else
        MPElixirSaved.Fortitude = 0
    end
    MPCatElixirReset()
end)



-- 创建单选框 - 特效巨魔之血药水
local checkButton_TrollBlood = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "特效巨魔之血药水 (20回)")
checkButton_TrollBlood:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.TrollBlood = 1
    else
        MPElixirSaved.TrollBlood = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 超强防御药剂
local checkButton_Stoneshield = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "超强防御药剂 (450甲)")
checkButton_Stoneshield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Stoneshield = 1
    else
        MPElixirSaved.Stoneshield = 0
    end
    MPCatElixirReset()
end)






postion_y = postion_y+30

-- 物理药剂
local Text = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
Text:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
Text:SetWidth(250)
Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
Text:SetTextColor(1, 0.8, 0)
Text:SetJustifyH("LEFT")
Text:SetText(MPLanguage.UI_Set_PhysicalElixir)


postion_y = postion_y-82

-- 创建单选框 - 猫鼬药剂
local checkButton_Mongoose = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "猫鼬药剂 (25敏+2暴击)")
local Warning_Mongoose = SEWarningText(checkButton_Mongoose)
checkButton_Mongoose:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Mongoose = 1
    else
        MPElixirSaved.Mongoose = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


-- 创建单选框 - 敏捷药剂
local checkButton_Agility = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "敏捷药剂 (15敏)")
local Warning_Agility = SEWarningText(checkButton_Agility)
checkButton_Agility:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Agility = 1
    else
        MPElixirSaved.Agility = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


-- 创建单选框 - 厚甲蝎药粉
local checkButton_Encrusted = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "厚甲蝎药粉 (25敏捷)")
local Warning_Encrusted = SEWarningText(checkButton_Encrusted)

checkButton_Encrusted:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Encrusted = 1
    else
        MPElixirSaved.Encrusted = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


postion_y = postion_y-30



-- 创建单选框 - 巨人药剂
local checkButton_Giants = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "巨人药剂 (25力量)")
local Warning_Giants = SEWarningText(checkButton_Giants)

checkButton_Giants:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Giants = 1
    else
        MPElixirSaved.Giants = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


-- 创建单选框 - 魂能之力
local checkButton_SoulEnergy = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "魂能之力 (30力量)")
local Warning_SoulEnergy = SEWarningText(checkButton_SoulEnergy)

checkButton_SoulEnergy:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.SoulEnergy = 1
    else
        MPElixirSaved.SoulEnergy = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


-- 创建单选框 - 土狼兴奋剂
local checkButton_HyenaStimulant = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "土狼兴奋剂 (25力量)")
local Warning_HyenaStimulant = SEWarningText(checkButton_HyenaStimulant)

checkButton_HyenaStimulant:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.HyenaStimulant = 1
    else
        MPElixirSaved.HyenaStimulant = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)

postion_y = postion_y-30

-- 创建单选框 - 冬泉火酒
local checkButton_Firewater = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "冬泉火酒 (35AP)")
local Warning_Firewater = SEWarningText(checkButton_Firewater)

checkButton_Firewater:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Firewater = 1
    else
        MPElixirSaved.Firewater = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


-- 创建单选框 - 黑根酒
local checkButton_HerbalBrew = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "黑根酒 (35AP)")
local Warning_HerbalBrew = SEWarningText(checkButton_HerbalBrew)

checkButton_HerbalBrew:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.HerbalBrew = 1
    else
        MPElixirSaved.HerbalBrew = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)



-- 创建单选框 - 魂能之击
local checkButton_SoulStrike = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "魂能之击 (40AP)")
local Warning_SoulStrike = SEWarningText(checkButton_SoulStrike)

checkButton_SoulStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.SoulStrike = 1
    else
        MPElixirSaved.SoulStrike = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


postion_y = postion_y-30

-- 创建单选框 - 蛮力药剂
local checkButton_BruteForce = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "蛮力药剂 (18力+18耐)")
local Warning_BruteForce = SEWarningText(checkButton_BruteForce)

checkButton_BruteForce:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.BruteForce = 1
    else
        MPElixirSaved.BruteForce = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


-- 创建单选框 - 屠魔药剂
local checkButton_Demon = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "屠魔药剂")
checkButton_Demon:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Demon = 1
    else
        MPElixirSaved.Demon = 0
    end
    MPCatElixirReset()
end)
local checkButton_DemonBoss = MPCreateCheckButtonSmall(CatUISettingsElixir, ADDON_NAME.."CheckButton", 510, postion_y, MPLanguage.UI_Set_BossOnlyDemon)
checkButton_DemonBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DemonBoss = 1
    else
        MPElixirSaved.DemonBoss = 0
    end
end)






postion_y = postion_y+55

-- 法术药剂
local Text = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
Text:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
Text:SetWidth(250)
Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
Text:SetTextColor(1, 0.8, 0)
Text:SetJustifyH("LEFT")
Text:SetText(MPLanguage.UI_Set_SpellElixir)


postion_y = postion_y-110


-- 创建单选框 - 梦境精华药剂
local checkButton_DreamEssence = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "梦境精华药剂 (15法伤/治疗+2暴击)")
checkButton_DreamEssence:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DreamEssence = 1
    else
        MPElixirSaved.DreamEssence = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 强效奥法药剂
local checkButton_ArcanePower = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "强效奥法药剂 (35法伤)")
checkButton_ArcanePower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ArcanePower = 1
    else
        MPElixirSaved.ArcanePower = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 梦境酊剂
local checkButton_Dreamshire = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "梦境酊剂 (35法伤)")
checkButton_Dreamshire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Dreamshire = 1
    else
        MPElixirSaved.Dreamshire = 0
    end
    MPCatElixirReset()
end)


postion_y = postion_y-30

-- 创建单选框 - 强效聪颖药剂
local checkButton_Intellect = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "强效聪颖药剂 (25智力)")
local Warning_Intellect = SEWarningText(checkButton_Intellect)

checkButton_Intellect:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Intellect = 1
    else
        MPElixirSaved.Intellect = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


-- 创建单选框 - 魂能之诈
local checkButton_SoulTrickery = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "魂能之诈 (30智力)")
local Warning_SoulTrickery = SEWarningText(checkButton_SoulTrickery)

checkButton_SoulTrickery:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.SoulTrickery = 1
    else
        MPElixirSaved.SoulTrickery = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)

-- 创建单选框 - 脑皮层混合饮料
local checkButton_CortexPotion = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "脑皮层混合饮料 (25智力)")
local Warning_CortexPotion = SEWarningText(checkButton_CortexPotion)

checkButton_CortexPotion:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.CortexPotion = 1
    else
        MPElixirSaved.CortexPotion = 0
    end
    MPCatElixirReset()
    MPResetConflict()
end)


postion_y = postion_y-30

-- 创建单选框 - 强效冰霜之力药剂
local checkButton_FrostPower = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "强效冰霜之力药剂 (40冰)")
checkButton_FrostPower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.FrostPower = 1
    else
        MPElixirSaved.FrostPower = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 强效奥术之力药剂
local checkButton_GreaterArcanePower = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "强效奥术之力药剂 (40奥)")
checkButton_GreaterArcanePower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.GreaterArcanePower = 1
    else
        MPElixirSaved.GreaterArcanePower = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 强效自然之力药水
local checkButton_NaturePower = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "强效自然之力药水 (55自然)")
checkButton_NaturePower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.NaturePower = 1
    else
        MPElixirSaved.NaturePower = 0
    end
    MPCatElixirReset()
end)

postion_y = postion_y-30

-- 创建单选框 - 强效火力药剂
local checkButton_Firepower = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "强效火力药剂 (40火)")
checkButton_Firepower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.Firepower = 1
    else
        MPElixirSaved.Firepower = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 暗影之力药剂
local checkButton_ShadowPower = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "暗影之力药剂 (40暗)")
checkButton_ShadowPower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ShadowPower = 1
    else
        MPElixirSaved.ShadowPower = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 魔血药水
local checkButton_FelMana = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "魔血药水 (12回)")
checkButton_FelMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.FelMana = 1
    else
        MPElixirSaved.FelMana = 0
    end
    MPCatElixirReset()
end)

postion_y = postion_y-30

-- 创建单选框 - 麦迪文的蓝标葡萄酒
local checkButton_MedivhBlue = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "麦迪文的蓝标葡萄酒 (15智力)")
checkButton_MedivhBlue:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.MedivhBlue = 1
    else
        MPElixirSaved.MedivhBlue = 0
    end
    MPCatElixirReset()
end)




postion_y = postion_y+90

-- 混合药剂
local Text = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
Text:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
Text:SetWidth(250)
Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
Text:SetTextColor(1, 0.8, 0)
Text:SetJustifyH("LEFT")
Text:SetText(MPLanguage.UI_Set_MixedElixir)


postion_y = postion_y-145

-- 创建单选框 - 翡翠猫鼬药剂
local checkButton_DreamMongoose = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "翡翠猫鼬药剂 (25敏+15法伤+2暴)")
checkButton_DreamMongoose:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DreamMongoose = 1
    else
        MPElixirSaved.DreamMongoose = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 奥法巨人药剂
local checkButton_ArcaneGiants = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "奥法巨人药剂 (25力+35法伤)")
checkButton_ArcaneGiants:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ArcaneGiants = 1
    else
        MPElixirSaved.ArcaneGiants = 0
    end
    MPCatElixirReset()
end)

-- 创建单选框 - 梦境火酒药剂
local checkButton_DreamFirewater = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "梦境火酒药剂 (35AP+35法伤)")
checkButton_DreamFirewater:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DreamFirewater = 1
    else
        MPElixirSaved.DreamFirewater = 0
    end
    MPCatElixirReset()
end)




postion_y = postion_y+103

-- 烹饪食物 (单选)
local Text = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
Text:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
Text:SetWidth(250)
Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
Text:SetTextColor(1, 0.8, 0)
Text:SetJustifyH("LEFT")
Text:SetText(MPLanguage.UI_Set_FoodElixir)


postion_y = postion_y-157

-- 创建单选框 - 沙漠肉丸子
local checkButton_DesertDumplings = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "沙漠肉丸子 (20力量)")

-- 创建单选框 - 营养的魔法蘑菇
local checkButton_Nutritious = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "营养的魔法蘑菇 (20力量)")

-- 创建单选框 - 大鱼片
local checkButton_BigFish = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "大鱼片 (20力量)")

postion_y = postion_y-30

-- 创建单选框 - 烤鱿鱼
local checkButton_GrilledSquid = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "烤鱿鱼 (10敏捷)")

-- 创建单选框 - 酸甜的山地浆果
local checkButton_SweetBerries = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "酸甜的山地浆果 (10敏捷)")

-- 创建单选框 - 鱿鱼鳗串
local checkButton_Skewers = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "鱿鱼鳗串 (20敏捷)")
--checkButton_Skewers:Disable()


postion_y = postion_y-30

-- 创建单选框 - 达农佐的泰拉比姆情调
local checkButton_TerrabeMood = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "达农佐的泰拉比姆情调 (2急速)")

-- 创建单选框 - 达农佐的泰拉比姆趣味
local checkButton_TerrabeFun = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "达农佐的泰拉比姆趣味 (22法伤)")

-- 创建单选框 - 达农佐的泰拉比姆惊喜
local checkButton_TerrabeSurprise = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "达农佐的泰拉比姆惊喜 (45远程AP)")


postion_y = postion_y-30

-- 创建单选框 - 夜鳞鱼汤
local checkButton_NightfinSoup = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "夜鳞鱼汤 (8回蓝)")

-- 创建单选框 - 烟熏鲈鱼
local checkButton_SmokedPerch = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "烟熏鲈鱼 (30精神)")

-- 创建单选框 - 强能草药沙拉
local checkButton_HerbSalad = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "强能草药沙拉 (24治疗)")


postion_y = postion_y-30

-- 创建单选框 - 香脆的魔法蘑菇
local checkButton_Crispy = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "香脆的魔法蘑菇 (25耐力)")

-- 创建单选框 - 迪尔格的超美味奇美拉肉片
local checkButton_Chimera = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "迪尔格的超美味奇美拉肉片(30耐2闪)")

-- 创建单选框 - 深海炖菜
local checkButton_Seafood = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "深海炖菜 (20回+150甲)")
--checkButton_Seafood:Disable()

postion_y = postion_y-30

-- 创建单选框 - 煮熟的光滑大鱼
local checkButton_CookedFish = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "煮熟的光滑大鱼 (15法穿)")

-- 创建单选框 - 龙息红椒
local checkButton_Dragonbreath = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "龙息红椒 (喷火)")


checkButton_DesertDumplings:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 1
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.DesertDumplings = 0
    end

    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_Nutritious:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 1
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.Nutritious = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_Crispy:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 1
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.Crispy = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_GrilledSquid:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 1
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.GrilledSquid = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_SweetBerries:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 1
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.SweetBerries = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_TerrabeMood:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 1
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.TerrabeMood = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_TerrabeFun:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 1
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.TerrabeFun = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_TerrabeSurprise:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 1
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.TerrabeSurprise = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_HerbSalad:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 1
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.HerbSalad = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_Dragonbreath:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 1
    else
        MPElixirSaved.Dragonbreath = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_NightfinSoup:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 1
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.NightfinSoup = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_BigFish:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 1
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.BigFish = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_Skewers:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 1
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.Skewers = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_SmokedPerch:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 1
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.SmokedPerch = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_Chimera:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 1
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.Chimera = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_Seafood:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 1
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.Seafood = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)
checkButton_CookedFish:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0
        MPElixirSaved.CookedFish = 1
        MPElixirSaved.Dragonbreath = 0
    else
        MPElixirSaved.CookedFish = 0
    end
    MPInitElixirSettingsPart3()
    MPCatElixirReset()
end)



postion_y = postion_y+145

-- 武器临时附魔 (单选)
local Text = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
Text:SetPoint("TOPLEFT", CatUISettingsElixir, "TOPLEFT", 30, postion_y)
Text:SetWidth(250)
Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
Text:SetTextColor(1, 0.8, 0)
Text:SetJustifyH("LEFT")
Text:SetText(MPLanguage.UI_Set_WeaponEnchant)


postion_y = postion_y-197

-- 创建单选框 - 元素磨刀石
local checkButton_ElementalStone = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "元素磨刀石 (2暴击)")

-- 创建单选框 - 神圣磨刀石
local checkButton_SacredStone = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "神圣磨刀石 (100亡灵AP)")

-- 创建单选框 - 神圣巫师之油
local checkButton_SacredOil = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 660, postion_y, "神圣巫师之油 (60亡灵法伤)")

postion_y = postion_y-30

-- 创建单选框 - 卓越巫师之油
local checkButton_WizardOil = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 30, postion_y, "卓越巫师之油 (36法伤+1暴)")

-- 创建单选框 - 卓越法力之油
local checkButton_ManaOil = MPCreateCheckButton(CatUISettingsElixir, ADDON_NAME.."CheckButton", 350, postion_y, "卓越法力之油 (25治疗12回)")

checkButton_ElementalStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ElementalStone = 0
        MPElixirSaved.SacredStone = 0
        MPElixirSaved.SacredOil = 0
        MPElixirSaved.WizardOil = 0
        MPElixirSaved.ManaOil = 0
        MPElixirSaved.ElementalStone = 1
    else
        MPElixirSaved.ElementalStone = 0
    end
    checkButton_ElementalStone:SetChecked(MPToBoolean(MPElixirSaved.ElementalStone))
    checkButton_SacredStone:SetChecked(MPToBoolean(MPElixirSaved.SacredStone))
    checkButton_SacredOil:SetChecked(MPToBoolean(MPElixirSaved.SacredOil))
    checkButton_WizardOil:SetChecked(MPToBoolean(MPElixirSaved.WizardOil))
    checkButton_ManaOil:SetChecked(MPToBoolean(MPElixirSaved.ManaOil))
    MPCatElixirReset()
end)
checkButton_SacredStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ElementalStone = 0
        MPElixirSaved.SacredStone = 0
        MPElixirSaved.SacredOil = 0
        MPElixirSaved.WizardOil = 0
        MPElixirSaved.ManaOil = 0
        MPElixirSaved.SacredStone = 1
    else
        MPElixirSaved.SacredStone = 0
    end
    checkButton_ElementalStone:SetChecked(MPToBoolean(MPElixirSaved.ElementalStone))
    checkButton_SacredStone:SetChecked(MPToBoolean(MPElixirSaved.SacredStone))
    checkButton_SacredOil:SetChecked(MPToBoolean(MPElixirSaved.SacredOil))
    checkButton_WizardOil:SetChecked(MPToBoolean(MPElixirSaved.WizardOil))
    checkButton_ManaOil:SetChecked(MPToBoolean(MPElixirSaved.ManaOil))
    MPCatElixirReset()
end)
checkButton_SacredOil:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ElementalStone = 0
        MPElixirSaved.SacredStone = 0
        MPElixirSaved.SacredOil = 0
        MPElixirSaved.WizardOil = 0
        MPElixirSaved.ManaOil = 0
        MPElixirSaved.SacredOil = 1
    else
        MPElixirSaved.SacredOil = 0
    end
    checkButton_ElementalStone:SetChecked(MPToBoolean(MPElixirSaved.ElementalStone))
    checkButton_SacredStone:SetChecked(MPToBoolean(MPElixirSaved.SacredStone))
    checkButton_SacredOil:SetChecked(MPToBoolean(MPElixirSaved.SacredOil))
    checkButton_WizardOil:SetChecked(MPToBoolean(MPElixirSaved.WizardOil))
    checkButton_ManaOil:SetChecked(MPToBoolean(MPElixirSaved.ManaOil))
    MPCatElixirReset()
end)
checkButton_WizardOil:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ElementalStone = 0
        MPElixirSaved.SacredStone = 0
        MPElixirSaved.SacredOil = 0
        MPElixirSaved.WizardOil = 0
        MPElixirSaved.ManaOil = 0
        MPElixirSaved.WizardOil = 1
    else
        MPElixirSaved.WizardOil = 0
    end
    checkButton_ElementalStone:SetChecked(MPToBoolean(MPElixirSaved.ElementalStone))
    checkButton_SacredStone:SetChecked(MPToBoolean(MPElixirSaved.SacredStone))
    checkButton_SacredOil:SetChecked(MPToBoolean(MPElixirSaved.SacredOil))
    checkButton_WizardOil:SetChecked(MPToBoolean(MPElixirSaved.WizardOil))
    checkButton_ManaOil:SetChecked(MPToBoolean(MPElixirSaved.ManaOil))
    MPCatElixirReset()
end)
checkButton_ManaOil:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPElixirSaved.ElementalStone = 0
        MPElixirSaved.SacredStone = 0
        MPElixirSaved.SacredOil = 0
        MPElixirSaved.WizardOil = 0
        MPElixirSaved.ManaOil = 0
        MPElixirSaved.ManaOil = 1
    else
        MPElixirSaved.ManaOil = 0
    end
    checkButton_ElementalStone:SetChecked(MPToBoolean(MPElixirSaved.ElementalStone))
    checkButton_SacredStone:SetChecked(MPToBoolean(MPElixirSaved.SacredStone))
    checkButton_SacredOil:SetChecked(MPToBoolean(MPElixirSaved.SacredOil))
    checkButton_WizardOil:SetChecked(MPToBoolean(MPElixirSaved.WizardOil))
    checkButton_ManaOil:SetChecked(MPToBoolean(MPElixirSaved.ManaOil))
    MPCatElixirReset()
end)






-- 创建按钮
local myButton = MPCreateButton(CatUISettingsElixir, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetElixirSettings()
    MPInitElixirSettings()
    MPCatElixirReset()
    CatElixir:ClearAllPoints()
    CatElixir:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
end)


-- 添加提示内容区域
local TipText = CatUISettingsElixir:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsElixir, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText(MPLanguage.UI_Set_ElixirMacroTip)



-- 配置文件版本号
local ElixirSettingsUIVersion = 15

function MPResetElixirSettings()

    MPElixirSaved.Version = ElixirSettingsUIVersion

    -- 基本配置
    MPElixirSaved.Use = 1
    MPElixirSaved.Combat = 0
    MPElixirSaved.LeftTime = 4
    MPElixirSaved.Msg = 1
    MPElixirSaved.WindowSize = 0.8

    -- 独特功能
    MPElixirSaved.ZanzaSpeed = 0
    MPElixirSaved.ArthasGift = 0

    -- 生存
    MPElixirSaved.ZanzaSpirit = 0
    MPElixirSaved.Fortitude = 0
    MPElixirSaved.MedivhWine = 0
    MPElixirSaved.Cocktail = 0
    MPElixirSaved.TrollBlood = 0
    MPElixirSaved.Stoneshield = 0

    -- 物理
    MPElixirSaved.Mongoose = 0
    MPElixirSaved.Agility = 0
    MPElixirSaved.Encrusted = 0
    MPElixirSaved.Giants = 0
    MPElixirSaved.SoulEnergy = 0
    MPElixirSaved.Firewater = 0
    MPElixirSaved.HerbalBrew = 0
    MPElixirSaved.SoulStrike = 0
    MPElixirSaved.HyenaStimulant = 0
    MPElixirSaved.BruteForce = 0
    MPElixirSaved.Demon = 0
    MPElixirSaved.DemonBoss = 1

    -- 法伤
    MPElixirSaved.DreamEssence = 0
    MPElixirSaved.ArcanePower = 0
    MPElixirSaved.Dreamshire = 0
    MPElixirSaved.CortexPotion = 0
    MPElixirSaved.Intellect = 0
    MPElixirSaved.SoulTrickery = 0

    MPElixirSaved.Firepower = 0
    MPElixirSaved.ShadowPower = 0
    MPElixirSaved.FrostPower = 0
    MPElixirSaved.GreaterArcanePower = 0
    MPElixirSaved.NaturePower = 0
    MPElixirSaved.FelMana = 0
    MPElixirSaved.MedivhBlue = 0

    -- 混合
    MPElixirSaved.DreamMongoose = 0
    MPElixirSaved.ArcaneGiants = 0
    MPElixirSaved.DreamFirewater = 0

    -- 烹饪

        -- 力量
        MPElixirSaved.DesertDumplings = 0
        MPElixirSaved.Nutritious = 0
        MPElixirSaved.BigFish = 0

        -- 敏捷
        MPElixirSaved.GrilledSquid = 0
        MPElixirSaved.SweetBerries = 0
        MPElixirSaved.Skewers = 0

        -- 达农佐
        MPElixirSaved.TerrabeMood = 0
        MPElixirSaved.TerrabeFun = 0
        MPElixirSaved.TerrabeSurprise = 0

        -- 法系
        MPElixirSaved.NightfinSoup = 0
        MPElixirSaved.SmokedPerch = 0
        MPElixirSaved.HerbSalad = 0

        -- 耐力
        MPElixirSaved.Crispy = 0
        MPElixirSaved.Chimera = 0
        MPElixirSaved.Seafood = 0

        -- 特殊
        MPElixirSaved.CookedFish = 0
        MPElixirSaved.Dragonbreath = 0

    -- 附魔
    MPElixirSaved.ElementalStone = 0
    MPElixirSaved.SacredStone = 0
    MPElixirSaved.SacredOil = 0
    MPElixirSaved.WizardOil = 0
    MPElixirSaved.ManaOil = 0

    -- 合剂
    MPElixirSaved.Titans = 0
    MPElixirSaved.SupremePower = 0
    MPElixirSaved.DistilledWisdom = 0

end


function MPResetConflict()

    -- 泰坦合剂
    Warning_Titans:Hide()
    if MPElixirSaved.Titans==1 and (MPElixirSaved.SupremePower==1 or MPElixirSaved.DistilledWisdom==1) then
        Warning_Titans:Show()
    end

    -- 超级能量合剂
    Warning_SupremePower:Hide()
    if MPElixirSaved.SupremePower==1 and (MPElixirSaved.Titans==1 or MPElixirSaved.DistilledWisdom==1) then
        Warning_SupremePower:Show()
    end

    -- 精炼智慧合剂
    Warning_DistilledWisdom:Hide()
    if MPElixirSaved.DistilledWisdom==1 and (MPElixirSaved.Titans==1 or MPElixirSaved.SupremePower==1) then
        Warning_DistilledWisdom:Show()
    end

    -- 赞扎之速
    Warning_ZanzaSpeed:Hide()
    if MPElixirSaved.ZanzaSpeed==1 and MPElixirSaved.ZanzaSpirit==1 then
        Warning_ZanzaSpeed:Show()
    end

    -- 赞扎之魂
    Warning_ZanzaSpirit:Hide()
    if MPElixirSaved.ZanzaSpirit==1 and (MPElixirSaved.ZanzaSpeed==1 or MPElixirSaved.Cocktail==1) then
        Warning_ZanzaSpirit:Show()
    end

    -- 猫鼬药剂
    Warning_Mongoose:Hide()
    if MPElixirSaved.Mongoose==1 and MPElixirSaved.Agility==1 then
        Warning_Mongoose:Show()
    end

    -- 肺片鸡尾酒
    Warning_Cocktail:Hide()
    if MPElixirSaved.Cocktail==1 and (MPElixirSaved.ZanzaSpirit==1 or MPElixirSaved.HyenaStimulant==1 or MPElixirSaved.Encrusted==1 or MPElixirSaved.CortexPotion==1) then
        Warning_Cocktail:Show()
    end

    -- 巨人药剂
    Warning_Giants:Hide()
    if MPElixirSaved.Giants==1 and (MPElixirSaved.SoulEnergy==1 or MPElixirSaved.BruteForce==1) then
        Warning_Giants:Show()
    end

    -- 蛮力药剂
    Warning_BruteForce:Hide()
    if MPElixirSaved.BruteForce==1 and (MPElixirSaved.Giants==1 or MPElixirSaved.SoulEnergy==1) then
        Warning_BruteForce:Show()
    end

    -- 敏捷药剂
    Warning_Agility:Hide()
    if MPElixirSaved.Agility==1 and MPElixirSaved.Mongoose==1 then
        Warning_Agility:Show()
    end

    -- 魂能之力
    Warning_SoulEnergy:Hide()
    if MPElixirSaved.SoulEnergy==1 and (MPElixirSaved.Giants==1 or MPElixirSaved.BruteForce==1) then
        Warning_SoulEnergy:Show()
    end

    -- 冬泉火酒
    Warning_Firewater:Hide()
    if MPElixirSaved.Firewater==1 and (MPElixirSaved.HerbalBrew==1 or MPElixirSaved.SoulStrike==1) then
        Warning_Firewater:Show()
    end

    -- 黑根酒
    Warning_HerbalBrew:Hide()
    if MPElixirSaved.HerbalBrew==1 and (MPElixirSaved.Firewater==1 or MPElixirSaved.SoulStrike==1) then
        Warning_HerbalBrew:Show()
    end

    --魂能之击
    Warning_SoulStrike:Hide()
    if MPElixirSaved.SoulStrike==1 and (MPElixirSaved.Firewater==1 or MPElixirSaved.HerbalBrew==1) then
        Warning_SoulStrike:Show()
    end

    -- 土狼兴奋剂
    Warning_HyenaStimulant:Hide()
    if MPElixirSaved.HyenaStimulant==1 and (MPElixirSaved.Encrusted==1 or MPElixirSaved.Cocktail==1 or MPElixirSaved.CortexPotion==1) then
        Warning_HyenaStimulant:Show()
    end

    -- 厚甲蝎药粉
    Warning_Encrusted:Hide()
    if MPElixirSaved.Encrusted==1 and (MPElixirSaved.HyenaStimulant==1 or MPElixirSaved.Cocktail==1 or MPElixirSaved.CortexPotion==1) then
        Warning_Encrusted:Show()
    end

    -- 强效聪颖药剂
    Warning_Intellect:Hide()
    if MPElixirSaved.Intellect==1 and MPElixirSaved.SoulTrickery==1 then
        Warning_Intellect:Show()
    end

    --魂能之诈
    Warning_SoulTrickery:Hide()
    if MPElixirSaved.SoulTrickery==1 and MPElixirSaved.Intellect==1 then
        Warning_SoulTrickery:Show()
    end

    -- 脑皮层混合饮料
    Warning_CortexPotion:Hide()
    if MPElixirSaved.CortexPotion==1 and (MPElixirSaved.Cocktail==1 or MPElixirSaved.HyenaStimulant==1 or MPElixirSaved.Encrusted==1) then
        Warning_CortexPotion:Show()
    end

end

function MPInitElixirSettingsPart1()
    --checkButton_Use:SetChecked(MPToBoolean(MPElixirSaved.Use))
    --checkButton_Combat:SetChecked(MPToBoolean(MPElixirSaved.Combat))
    checkButton_Msg:SetChecked(MPToBoolean(MPElixirSaved.Msg))

    -- 独特
    checkButton_ZanzaSpeed:SetChecked(MPToBoolean(MPElixirSaved.ZanzaSpeed))
    checkButton_ArthasGift:SetChecked(MPToBoolean(MPElixirSaved.ArthasGift))

    -- 生存
    checkButton_ZanzaSpirit:SetChecked(MPToBoolean(MPElixirSaved.ZanzaSpirit))
    checkButton_Fortitude:SetChecked(MPToBoolean(MPElixirSaved.Fortitude))
    checkButton_MedivhWine:SetChecked(MPToBoolean(MPElixirSaved.MedivhWine))
    checkButton_Cocktail:SetChecked(MPToBoolean(MPElixirSaved.Cocktail))
    checkButton_TrollBlood:SetChecked(MPToBoolean(MPElixirSaved.TrollBlood))
    checkButton_Stoneshield:SetChecked(MPToBoolean(MPElixirSaved.Stoneshield))



    -- 物理
    checkButton_Mongoose:SetChecked(MPToBoolean(MPElixirSaved.Mongoose))
    checkButton_Agility:SetChecked(MPToBoolean(MPElixirSaved.Agility))
    checkButton_Encrusted:SetChecked(MPToBoolean(MPElixirSaved.Encrusted))
    checkButton_Giants:SetChecked(MPToBoolean(MPElixirSaved.Giants))
    checkButton_SoulEnergy:SetChecked(MPToBoolean(MPElixirSaved.SoulEnergy))
    checkButton_Firewater:SetChecked(MPToBoolean(MPElixirSaved.Firewater))
    checkButton_HerbalBrew:SetChecked(MPToBoolean(MPElixirSaved.HerbalBrew))
    checkButton_SoulStrike:SetChecked(MPToBoolean(MPElixirSaved.SoulStrike))
    checkButton_HyenaStimulant:SetChecked(MPToBoolean(MPElixirSaved.HyenaStimulant))
    checkButton_BruteForce:SetChecked(MPToBoolean(MPElixirSaved.BruteForce))
    checkButton_Demon:SetChecked(MPToBoolean(MPElixirSaved.Demon))
    checkButton_DemonBoss:SetChecked(MPToBoolean(MPElixirSaved.DemonBoss))

end

function MPInitElixirSettingsPart2()
    -- 法伤
    checkButton_DreamEssence:SetChecked(MPToBoolean(MPElixirSaved.DreamEssence))
    checkButton_ArcanePower:SetChecked(MPToBoolean(MPElixirSaved.ArcanePower))
    checkButton_Dreamshire:SetChecked(MPToBoolean(MPElixirSaved.Dreamshire))
    checkButton_CortexPotion:SetChecked(MPToBoolean(MPElixirSaved.CortexPotion))
    checkButton_Intellect:SetChecked(MPToBoolean(MPElixirSaved.Intellect))
    checkButton_SoulTrickery:SetChecked(MPToBoolean(MPElixirSaved.SoulTrickery))

    checkButton_Firepower:SetChecked(MPToBoolean(MPElixirSaved.Firepower))
    checkButton_ShadowPower:SetChecked(MPToBoolean(MPElixirSaved.ShadowPower))
    checkButton_FrostPower:SetChecked(MPToBoolean(MPElixirSaved.FrostPower))
    checkButton_GreaterArcanePower:SetChecked(MPToBoolean(MPElixirSaved.GreaterArcanePower))
    checkButton_NaturePower:SetChecked(MPToBoolean(MPElixirSaved.NaturePower))
    checkButton_FelMana:SetChecked(MPToBoolean(MPElixirSaved.FelMana))
    checkButton_MedivhBlue:SetChecked(MPToBoolean(MPElixirSaved.MedivhBlue))


end

function MPInitElixirSettingsPart3()
    -- 烹饪
    checkButton_DesertDumplings:SetChecked(MPToBoolean(MPElixirSaved.DesertDumplings))
    checkButton_Nutritious:SetChecked(MPToBoolean(MPElixirSaved.Nutritious))
    checkButton_BigFish:SetChecked(MPToBoolean(MPElixirSaved.BigFish))

    checkButton_GrilledSquid:SetChecked(MPToBoolean(MPElixirSaved.GrilledSquid))
    checkButton_SweetBerries:SetChecked(MPToBoolean(MPElixirSaved.SweetBerries))
    checkButton_Skewers:SetChecked(MPToBoolean(MPElixirSaved.Skewers))

    checkButton_TerrabeMood:SetChecked(MPToBoolean(MPElixirSaved.TerrabeMood))
    checkButton_TerrabeFun:SetChecked(MPToBoolean(MPElixirSaved.TerrabeFun))
    checkButton_TerrabeSurprise:SetChecked(MPToBoolean(MPElixirSaved.TerrabeSurprise))

    checkButton_NightfinSoup:SetChecked(MPToBoolean(MPElixirSaved.NightfinSoup))
    checkButton_SmokedPerch:SetChecked(MPToBoolean(MPElixirSaved.SmokedPerch))
    checkButton_HerbSalad:SetChecked(MPToBoolean(MPElixirSaved.HerbSalad))

    checkButton_Crispy:SetChecked(MPToBoolean(MPElixirSaved.Crispy))
    checkButton_Chimera:SetChecked(MPToBoolean(MPElixirSaved.Chimera))
    checkButton_Seafood:SetChecked(MPToBoolean(MPElixirSaved.Seafood))

    checkButton_CookedFish:SetChecked(MPToBoolean(MPElixirSaved.CookedFish))
    checkButton_Dragonbreath:SetChecked(MPToBoolean(MPElixirSaved.Dragonbreath))
end


function MPInitElixirSettings()

    if not MPElixirSaved then
        MPElixirSaved = {}
        MPResetElixirSettings()
    end

    if MPElixirSaved.Version ~= ElixirSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[自动药剂宏]当前配置，这是新版插件正常数据更新！|r")
        MPResetElixirSettings()
    end

    MPInitElixirSettingsPart1()
    MPInitElixirSettingsPart2()
    MPInitElixirSettingsPart3()

    MPResetConflict()

    -- 混合
    checkButton_DreamMongoose:SetChecked(MPToBoolean(MPElixirSaved.DreamMongoose))
    checkButton_ArcaneGiants:SetChecked(MPToBoolean(MPElixirSaved.ArcaneGiants))
    checkButton_DreamFirewater:SetChecked(MPToBoolean(MPElixirSaved.DreamFirewater))


    -- 附魔
    checkButton_ElementalStone:SetChecked(MPToBoolean(MPElixirSaved.ElementalStone))
    checkButton_SacredStone:SetChecked(MPToBoolean(MPElixirSaved.SacredStone))
    checkButton_SacredOil:SetChecked(MPToBoolean(MPElixirSaved.SacredOil))
    checkButton_WizardOil:SetChecked(MPToBoolean(MPElixirSaved.WizardOil))
    checkButton_ManaOil:SetChecked(MPToBoolean(MPElixirSaved.ManaOil))

    slider_LeftTime:SetValue(MPElixirSaved.LeftTime)

    slider_WindowSize:SetValue(MPElixirSaved.WindowSize)
    CatElixir:SetScale(MPElixirSaved.WindowSize)

end

