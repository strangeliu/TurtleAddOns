
-- 定义插件名称
local ADDON_NAME = "Settings-MageFire"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsMageFire = MPCreateFrame(ADDON_NAME.."Frame", 520, 500, "|cFF69CCF0设置 - 火法|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsMageFire:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 魔甲术
local checkButton_MageArmor = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_MageArmor:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
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
        MPMageFireSaved.MageArmor = 1
    else
        MPMageFireSaved.MageArmor = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 340, postion_y)
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
        MPMageFireSaved.Trinket_Upper = 1
    else
        MPMageFireSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsMageFire, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.TUBoss = 1
    else
        MPMageFireSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 火球术
local checkButton_Fireball = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_Fireball:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
checkButton_Fireball:SetScale(0.8)

-- 添加文字标签
local checkText_Fireball = checkButton_Fireball:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Fireball:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Fireball:SetTextColor(1, 1, 1)
checkText_Fireball:SetPoint("LEFT", checkButton_Fireball, "LEFT", 34, 1)
checkText_Fireball:SetText("开启 火球术")

-- 设置点击事件
checkButton_Fireball:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.Fireball = 1
    else
        MPMageFireSaved.Fireball = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 340, postion_y)
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
        MPMageFireSaved.Trinket_Below = 1
    else
        MPMageFireSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsMageFire, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.TBBoss = 1
    else
        MPMageFireSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奥术涌动​
local checkButton_ArcaneSurge = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_ArcaneSurge:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
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
        MPMageFireSaved.ArcaneSurge = 1
    else
        MPMageFireSaved.ArcaneSurge = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 340, postion_y)
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
        MPMageFireSaved.Target = 1
    else
        MPMageFireSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 火焰冲击
local checkButton_FireBlast = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_FireBlast:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
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
        MPMageFireSaved.FireBlast = 1
    else
        MPMageFireSaved.FireBlast = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 炎爆术
local checkButton_Pyroblast = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_Pyroblast:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
checkButton_Pyroblast:SetScale(0.8)

-- 添加文字标签
local checkText_Pyroblast = checkButton_Pyroblast:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Pyroblast:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Pyroblast:SetTextColor(1, 1, 1)
checkText_Pyroblast:SetPoint("LEFT", checkButton_Pyroblast, "LEFT", 34, 1)
checkText_Pyroblast:SetText("开启 炎爆术​ (自动识别天赋)")

-- 设置点击事件
checkButton_Pyroblast:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.Pyroblast = 1
    else
        MPMageFireSaved.Pyroblast = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 灼烧
local checkButton_Scorch = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_Scorch:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
checkButton_Scorch:SetScale(0.8)

-- 添加文字标签
local checkText_Scorch = checkButton_Scorch:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Scorch:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Scorch:SetTextColor(1, 1, 1)
checkText_Scorch:SetPoint("LEFT", checkButton_Scorch, "LEFT", 34, 1)
checkText_Scorch:SetText("保持 火焰易伤 (SuperWoW)")

-- 设置点击事件
checkButton_Scorch:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.Scorch = 1
    else
        MPMageFireSaved.Scorch = 0
    end
end)














-- 高级


postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsMageFire:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-85


-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
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
        MPMageFireSaved.RacialTraits = 1
    else
        MPMageFireSaved.RacialTraits = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 340, postion_y)
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
    MPMageFireSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFireSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFireSaved.HealthStone_Value .."%|r")
    else
        MPMageFireSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFireSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 进战斗前预读 炎爆术
local checkButton_FirstPyroblast = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_FirstPyroblast:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y)
checkButton_FirstPyroblast:SetScale(0.8)

-- 添加文字标签
local checkText_FirstPyroblast = checkButton_FirstPyroblast:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FirstPyroblast:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FirstPyroblast:SetTextColor(1, 1, 1)
checkText_FirstPyroblast:SetPoint("LEFT", checkButton_FirstPyroblast, "LEFT", 34, 1)
checkText_FirstPyroblast:SetText("进战斗前预读 炎爆术")

-- 设置点击事件
checkButton_FirstPyroblast:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.FirstPyroblast = 1
    else
        MPMageFireSaved.FirstPyroblast = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 340, postion_y)
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
    MPMageFireSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFireSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFireSaved.HerbalTea_Value .."%|r")
    else
        MPMageFireSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFireSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40





-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 340, postion_y)
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
    MPMageFireSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFireSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFireSaved.HerbalTeaMana_Value .."%|r")
    else
        MPMageFireSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFireSaved.HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40


-- 创建单选框 - 宝石 蓝量
local checkButton_JewelMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_JewelMana", CatUISettingsMageFire, "UICheckButtonTemplate")
checkButton_JewelMana:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 340, postion_y)
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
    MPMageFireSaved.JewelMana_Value = arg1
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFireSaved.JewelMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_JewelMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.JewelMana = 1
        color_JewelMana = "|cFFFFD100"
        _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFireSaved.JewelMana_Value .."%|r")
    else
        MPMageFireSaved.JewelMana = 0
        color_JewelMana = "|cFF888888"
        _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFireSaved.JewelMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsMageFire, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.Soulspeed = 1
    else
        MPMageFireSaved.Soulspeed = 0
    end
end)




-- 炎爆术 法术连击
local slider_Pyromaniac = CreateFrame("Slider", ADDON_NAME.."SliderPyromaniac", CatUISettingsMageFire, "OptionsSliderTemplate")
slider_Pyromaniac:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 20, postion_y+140)
slider_Pyromaniac:SetWidth(220) -- 拖动条长度
slider_Pyromaniac:SetHeight(16) -- 拖动条高度

slider_Pyromaniac:SetMinMaxValues(1, 5)
slider_Pyromaniac:SetValueStep(1)
slider_Pyromaniac:SetValue(3) -- 默认值
MPCatUISliderRegionHide(slider_Pyromaniac)

_G[slider_Pyromaniac:GetName().."Text"]:SetText("炎爆术 法术连击 层级：3")

-- 值变化时的回调函数
slider_Pyromaniac:SetScript("OnValueChanged", function()
    _G[slider_Pyromaniac:GetName().."Text"]:SetText("炎爆术 法术连击 层级："..arg1)
    MPMageFireSaved.Pyromaniac = arg1
end)



-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsMageFire, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsMageFire, "TOPLEFT", 120, -44)
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
    MPResetMageFireSettings()
    MPInitMageFireSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsMageFire)

local checkButton_Power = MPPublicCheckButton(CatUISettingsMageFire, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.Power = 1
    else
        MPMageFireSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsMageFire, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsMageFire, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageFireSaved.Pick = 1
    else
        MPMageFireSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsMageFire, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)

-- 添加提示内容区域
local TipText = CatUISettingsMageFire:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsMageFire, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFF69CCF0/mhdps|r ]")



-- 配置文件版本号
local MageFireSettingsUIVersion = 5

function MPResetMageFireSettings()

    MPMageFireSaved.Version = MageFireSettingsUIVersion

    -- 基本配置

    MPMageFireSaved.MageArmor = 1
    MPMageFireSaved.Fireball = 1
    MPMageFireSaved.ArcaneSurge = 1
    MPMageFireSaved.FireBlast = 1
    MPMageFireSaved.Pyroblast = 1
    MPMageFireSaved.Scorch = 0

    MPMageFireSaved.Trinket_Upper = 1
    MPMageFireSaved.TUBoss = 0
    MPMageFireSaved.Trinket_Below = 1
    MPMageFireSaved.TBBoss = 0
    MPMageFireSaved.Target = 0



    -- 高级配置

    -- 治疗石、糖水茶
    MPMageFireSaved.HealthStone = 1
    MPMageFireSaved.HealthStone_Value = 30
    MPMageFireSaved.HerbalTea = 1
    MPMageFireSaved.HerbalTea_Value = 20
    MPMageFireSaved.HerbalTeaMana = 0
    MPMageFireSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPMageFireSaved.SuperWoW = 1
    MPMageFireSaved.UnitXP = 1

    MPMageFireSaved.RacialTraits = 0
    MPMageFireSaved.FirstPyroblast = 0
    MPMageFireSaved.Pyromaniac = 3
    MPMageFireSaved.Soulspeed = 0

    MPMageFireSaved.JewelMana_Value = 35
    MPMageFireSaved.JewelMana = 0

    -- 通用
    MPMageFireSaved.Power = 0
    MPMageFireSaved.Pick = 0

end


local function MPInitMageFireSettingsPart1()

    checkButton_MageArmor:SetChecked(ToBoolean(MPMageFireSaved.MageArmor))
    checkButton_Fireball:SetChecked( ToBoolean(MPMageFireSaved.Fireball) )
    checkButton_ArcaneSurge:SetChecked( ToBoolean(MPMageFireSaved.ArcaneSurge) )
    checkButton_FireBlast:SetChecked(ToBoolean(MPMageFireSaved.FireBlast))
    checkButton_Pyroblast:SetChecked(ToBoolean(MPMageFireSaved.Pyroblast))
    checkButton_Scorch:SetChecked(ToBoolean(MPMageFireSaved.Scorch))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPMageFireSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPMageFireSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPMageFireSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPMageFireSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPMageFireSaved.Target))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPMageFireSaved.RacialTraits))
    checkButton_FirstPyroblast:SetChecked(ToBoolean(MPMageFireSaved.FirstPyroblast))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPMageFireSaved.Soulspeed))

    checkButton_Power:SetChecked(ToBoolean(MPMageFireSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPMageFireSaved.Pick))

end

function MPInitMageFireSettings()
    if not MPMageFireSaved then
        MPMageFireSaved = {}
        MPResetMageFireSettings()
    end

    if MPMageFireSaved.Version ~= MageFireSettingsUIVersion then
        MPResetMageFireSettings()
    end

    MPInitMageFireSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPMageFireSaved.HealthStone))
    slider_HealthStone:SetValue(MPMageFireSaved.HealthStone_Value)
    if MPMageFireSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageFireSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPMageFireSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPMageFireSaved.HerbalTea_Value)
    if MPMageFireSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageFireSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPMageFireSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPMageFireSaved.HerbalTeaMana_Value)
    if MPMageFireSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageFireSaved.HerbalTeaMana_Value .."%|r")

    checkButton_JewelMana:SetChecked(MPMageFireSaved.JewelMana)
    slider_JewelMana:SetValue(MPMageFireSaved.JewelMana_Value)
    if MPMageFireSaved.JewelMana==1 then
        color_JewelMana = "|cFFFFD100"
    else
        color_JewelMana = "|cFF888888"
    end
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageFireSaved.JewelMana_Value .."%|r")

    slider_Pyromaniac:SetValue(MPMageFireSaved.Pyromaniac)
    _G[slider_Pyromaniac:GetName().."Text"]:SetText("炎爆术 法术连击 层级："..MPMageFireSaved.Pyromaniac)

end

