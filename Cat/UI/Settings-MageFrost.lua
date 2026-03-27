
-- 定义插件名称
local ADDON_NAME = "Settings-MageFrost"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsMageFrost = MPCreateFrame(ADDON_NAME.."Frame", 520, 510, "|cFF69CCF0设置 - 冰法|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsMageFrost:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")






local postion_y = postion_y-40

-- 创建单选框 - 魔甲术
local checkButton_MageArmor = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_MageArmor:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
checkButton_MageArmor:SetScale(0.8)

-- 添加文字标签
local checkText_MageArmor = checkButton_MageArmor:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_MageArmor:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_MageArmor:SetTextColor(1, 1, 1)
checkText_MageArmor:SetPoint("LEFT", checkButton_MageArmor, "LEFT", 34, 1)
checkText_MageArmor:SetText("保持 魔甲术")

-- 设置点击事件
checkButton_MageArmor:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.MageArmor = 1
    else
        MPMageFrostSaved.MageArmor = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 340, postion_y)
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
        MPMageFrostSaved.Trinket_Upper = 1
    else
        MPMageFrostSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.TUBoss = 1
    else
        MPMageFrostSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 寒冰护体
local checkButton_IceBarrier = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_IceBarrier:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
checkButton_IceBarrier:SetScale(0.8)

-- 添加文字标签
local checkText_IceBarrier = checkButton_IceBarrier:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_IceBarrier:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_IceBarrier:SetTextColor(1, 1, 1)
checkText_IceBarrier:SetPoint("LEFT", checkButton_IceBarrier, "LEFT", 34, 1)
checkText_IceBarrier:SetText("保持 寒冰护体 (自动识别天赋)")

-- 设置点击事件
checkButton_IceBarrier:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.IceBarrier = 1
    else
        MPMageFrostSaved.IceBarrier = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 340, postion_y)
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
        MPMageFrostSaved.Trinket_Below = 1
    else
        MPMageFrostSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.TBBoss = 1
    else
        MPMageFrostSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奥术涌动​
local checkButton_ArcaneSurge = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_ArcaneSurge:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
checkButton_ArcaneSurge:SetScale(0.8)

-- 添加文字标签
local checkText_ArcaneSurge = checkButton_ArcaneSurge:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ArcaneSurge:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ArcaneSurge:SetTextColor(1, 1, 1)
checkText_ArcaneSurge:SetPoint("LEFT", checkButton_ArcaneSurge, "LEFT", 34, 1)
checkText_ArcaneSurge:SetText("开启 奥术涌动​")

-- 设置点击事件
checkButton_ArcaneSurge:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.ArcaneSurge = 1
    else
        MPMageFrostSaved.ArcaneSurge = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 340, postion_y)
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
        MPMageFrostSaved.Target = 1
    else
        MPMageFrostSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冰锥术​
local checkButton_ConeCold = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_ConeCold:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
checkButton_ConeCold:SetScale(0.8)

-- 添加文字标签
local checkText_ConeCold = checkButton_ConeCold:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ConeCold:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ConeCold:SetTextColor(1, 1, 1)
checkText_ConeCold:SetPoint("LEFT", checkButton_ConeCold, "LEFT", 34, 1)
checkText_ConeCold:SetText("开启 冰锥术 (需UnitXP支持)​")

-- 设置点击事件
checkButton_ConeCold:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.ConeCold = 1
    else
        MPMageFrostSaved.ConeCold = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冰霜新星
local checkButton_FrostNova = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_FrostNova:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
checkButton_FrostNova:SetScale(0.8)

-- 添加文字标签
local checkText_FrostNova = checkButton_FrostNova:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FrostNova:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FrostNova:SetTextColor(1, 1, 1)
checkText_FrostNova:SetPoint("LEFT", checkButton_FrostNova, "LEFT", 34, 1)
checkText_FrostNova:SetText("开启 冰霜新星 (需UnitXP支持)​")

-- 设置点击事件
checkButton_FrostNova:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.FrostNova = 1
    else
        MPMageFrostSaved.FrostNova = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冰柱​
local checkButton_Icicle = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_Icicle:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
checkButton_Icicle:SetScale(0.8)

-- 添加文字标签
local checkText_Icicle = checkButton_Icicle:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Icicle:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Icicle:SetTextColor(1, 1, 1)
checkText_Icicle:SetPoint("LEFT", checkButton_Icicle, "LEFT", 34, 1)
checkText_Icicle:SetText("开启 冰柱 (自动识别天赋)​")

-- 设置点击事件
checkButton_Icicle:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.Icicle = 1
    else
        MPMageFrostSaved.Icicle = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 火焰冲击
local checkButton_FireBlast = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_FireBlast:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
checkButton_FireBlast:SetScale(0.8)

-- 添加文字标签
local checkText_FireBlast = checkButton_FireBlast:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FireBlast:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FireBlast:SetTextColor(1, 1, 1)
checkText_FireBlast:SetPoint("LEFT", checkButton_FireBlast, "LEFT", 34, 1)
checkText_FireBlast:SetText("开启 火焰冲击")

-- 设置点击事件
checkButton_FireBlast:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.FireBlast = 1
    else
        MPMageFrostSaved.FireBlast = 0
    end
end)











-- 高级


postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsMageFrost:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-95


-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
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
        MPMageFrostSaved.RacialTraits = 1
    else
        MPMageFrostSaved.RacialTraits = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 340, postion_y)
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
    MPMageFrostSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFrostSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFrostSaved.HealthStone_Value .."%|r")
    else
        MPMageFrostSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFrostSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 冰霜速冻
local checkButton_Frostbite = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_Frostbite:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 20, postion_y)
checkButton_Frostbite:SetScale(0.8)

-- 添加文字标签
local checkText_Frostbite = checkButton_Frostbite:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Frostbite:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Frostbite:SetTextColor(1, 1, 1)
checkText_Frostbite:SetPoint("LEFT", checkButton_Frostbite, "LEFT", 34, 1)
checkText_Frostbite:SetText("开启 冰柱条件 冰霜速冻")

-- 设置点击事件
checkButton_Frostbite:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.Frostbite = 1
    else
        MPMageFrostSaved.Frostbite = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 340, postion_y)
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
    MPMageFrostSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFrostSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFrostSaved.HerbalTea_Value .."%|r")
    else
        MPMageFrostSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFrostSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40





-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 340, postion_y)
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
    MPMageFrostSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFrostSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFrostSaved.HerbalTeaMana_Value .."%|r")
    else
        MPMageFrostSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFrostSaved.HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40




-- 创建单选框 - 宝石 蓝量
local checkButton_JewelMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_JewelMana", CatUISettingsMageFrost, "UICheckButtonTemplate")
checkButton_JewelMana:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 340, postion_y)
checkButton_JewelMana:SetScale(0.8)

-- 添加文字标签
local checkText_JewelMana = checkButton_JewelMana:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_JewelMana:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_JewelMana:SetTextColor(1, 1, 1)
checkText_JewelMana:SetPoint("LEFT", checkButton_JewelMana, "LEFT", 34, 1)
checkText_JewelMana:SetText("自动 法力宝石")


local slider_JewelMana = CreateFrame("Slider", ADDON_NAME.."Slider_JewelMana", checkButton_JewelMana, "OptionsSliderTemplate")
slider_JewelMana:SetPoint("RIGHT", checkButton_JewelMana, "RIGHT", 250, -2)
slider_JewelMana:SetWidth(150) -- 拖动条长度
slider_JewelMana:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_JewelMana:SetMinMaxValues(1, 100)
slider_JewelMana:SetValueStep(1)
slider_JewelMana:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_JewelMana)

local color_JewelMana = "|cFFFFD100"

_G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: 20%|r")
_G[slider_JewelMana:GetName().."Low"]:Hide()
_G[slider_JewelMana:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_JewelMana:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPMageFrostSaved.JewelMana_Value = arg1
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFrostSaved.JewelMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_JewelMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.JewelMana = 1
        color_JewelMana = "|cFFFFD100"
        _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFrostSaved.JewelMana_Value .."%|r")
    else
        MPMageFrostSaved.JewelMana = 0
        color_JewelMana = "|cFF888888"
        _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFrostSaved.JewelMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.Soulspeed = 1
    else
        MPMageFrostSaved.Soulspeed = 0
    end
end)



-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsMageFrost, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsMageFrost, "TOPLEFT", 120, -44)
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
    MPResetMageFrostSettings()
    MPInitMageFrostSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsMageFrost)

local checkButton_Power = MPPublicCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.Power = 1
    else
        MPMageFrostSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFrostSaved.Pick = 1
    else
        MPMageFrostSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsMageFrost, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsMageFrost:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsMageFrost, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFF69CCF0/mfdps|r ]")



-- 配置文件版本号
local MageFrostSettingsUIVersion = 7

function MPResetMageFrostSettings()

    MPMageFrostSaved.Version = MageFrostSettingsUIVersion

    -- 基本配置

    MPMageFrostSaved.MageArmor = 1
    MPMageFrostSaved.IceBarrier = 1
    MPMageFrostSaved.ArcaneSurge = 1
    MPMageFrostSaved.ConeCold = 0
    MPMageFrostSaved.FrostNova = 1
    MPMageFrostSaved.Icicle = 1
    MPMageFrostSaved.FireBlast = 0

    MPMageFrostSaved.Trinket_Upper = 1
    MPMageFrostSaved.TUBoss = 0
    MPMageFrostSaved.Trinket_Below = 1
    MPMageFrostSaved.TBBoss = 0
    MPMageFrostSaved.Target = 0



    -- 高级配置

    -- 治疗石、糖水茶
    MPMageFrostSaved.HealthStone = 1
    MPMageFrostSaved.HealthStone_Value = 30
    MPMageFrostSaved.HerbalTea = 1
    MPMageFrostSaved.HerbalTea_Value = 20
    MPMageFrostSaved.HerbalTeaMana = 0
    MPMageFrostSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPMageFrostSaved.SuperWoW = 1
    MPMageFrostSaved.UnitXP = 1

    MPMageFrostSaved.RacialTraits = 0
    MPMageFrostSaved.Frostbite = 1
    MPMageFrostSaved.Soulspeed = 0

    MPMageFrostSaved.JewelMana_Value = 35
    MPMageFrostSaved.JewelMana = 0

    -- 通用
    MPMageFrostSaved.Power = 0
    MPMageFrostSaved.Pick = 0

end


local function MPInitMageFrostSettingsPart1()

    checkButton_MageArmor:SetChecked(ToBoolean(MPMageFrostSaved.MageArmor))
    checkButton_IceBarrier:SetChecked( ToBoolean(MPMageFrostSaved.IceBarrier) )
    checkButton_ArcaneSurge:SetChecked( ToBoolean(MPMageFrostSaved.ArcaneSurge) )
    checkButton_ConeCold:SetChecked(ToBoolean(MPMageFrostSaved.ConeCold))
    checkButton_FrostNova:SetChecked(ToBoolean(MPMageFrostSaved.FrostNova))
    checkButton_Icicle:SetChecked(ToBoolean(MPMageFrostSaved.Icicle))
    checkButton_FireBlast:SetChecked(ToBoolean(MPMageFrostSaved.FireBlast))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPMageFrostSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPMageFrostSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPMageFrostSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPMageFrostSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPMageFrostSaved.Target))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPMageFrostSaved.RacialTraits))
    checkButton_Frostbite:SetChecked(ToBoolean(MPMageFrostSaved.Frostbite))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPMageFrostSaved.Soulspeed))

    checkButton_Power:SetChecked(ToBoolean(MPMageFrostSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPMageFrostSaved.Pick))
end

function MPInitMageFrostSettings()
    if not MPMageFrostSaved then
        MPMageFrostSaved = {}
        MPResetMageFrostSettings()
    end

    if MPMageFrostSaved.Version ~= MageFrostSettingsUIVersion then
        MPResetMageFrostSettings()
    end

    MPInitMageFrostSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPMageFrostSaved.HealthStone))
    slider_HealthStone:SetValue(MPMageFrostSaved.HealthStone_Value)
    if MPMageFrostSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFrostSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPMageFrostSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPMageFrostSaved.HerbalTea_Value)
    if MPMageFrostSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFrostSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPMageFrostSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPMageFrostSaved.HerbalTeaMana_Value)
    if MPMageFrostSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFrostSaved.HerbalTeaMana_Value .."%|r")

    checkButton_JewelMana:SetChecked(MPMageFrostSaved.JewelMana)
    slider_JewelMana:SetValue(MPMageFrostSaved.JewelMana_Value)
    if MPMageFrostSaved.JewelMana==1 then
        color_JewelMana = "|cFFFFD100"
    else
        color_JewelMana = "|cFF888888"
    end
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFrostSaved.JewelMana_Value .."%|r")


end

