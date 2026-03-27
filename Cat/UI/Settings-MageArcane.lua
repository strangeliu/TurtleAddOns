
-- 定义插件名称
local ADDON_NAME = "Settings-MageArcane"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsMageArcane = MPCreateFrame(ADDON_NAME.."Frame", 520, 470, "|cFF69CCF0设置 - 奥法|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsMageArcane:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")






local postion_y = postion_y-40

-- 创建单选框 - 魔甲术
local checkButton_MageArmor = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_MageArmor:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
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
        MPMageArcaneSaved.MageArmor = 1
    else
        MPMageArcaneSaved.MageArmor = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 340, postion_y)
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
        MPMageArcaneSaved.Trinket_Upper = 1
    else
        MPMageArcaneSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsMageArcane, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.TUBoss = 1
    else
        MPMageArcaneSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奥术溃裂​
local checkButton_ArcaneExplosion = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_ArcaneExplosion:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
checkButton_ArcaneExplosion:SetScale(0.8)

-- 添加文字标签
local checkText_ArcaneExplosion = checkButton_ArcaneExplosion:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ArcaneExplosion:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ArcaneExplosion:SetTextColor(1, 1, 1)
checkText_ArcaneExplosion:SetPoint("LEFT", checkButton_ArcaneExplosion, "LEFT", 34, 1)
checkText_ArcaneExplosion:SetText("开启 奥术溃裂​​ (自动识别天赋)")

-- 设置点击事件
checkButton_ArcaneExplosion:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.ArcaneExplosion = 1
    else
        MPMageArcaneSaved.ArcaneExplosion = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 340, postion_y)
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
        MPMageArcaneSaved.Trinket_Below = 1
    else
        MPMageArcaneSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsMageArcane, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.TBBoss = 1
    else
        MPMageArcaneSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奥术飞弹
local checkButton_ArcaneMissiles = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_ArcaneMissiles:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
checkButton_ArcaneMissiles:SetScale(0.8)

-- 添加文字标签
local checkText_ArcaneMissiles = checkButton_ArcaneMissiles:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ArcaneMissiles:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ArcaneMissiles:SetTextColor(1, 1, 1)
checkText_ArcaneMissiles:SetPoint("LEFT", checkButton_ArcaneMissiles, "LEFT", 34, 1)
checkText_ArcaneMissiles:SetText("开启 奥术飞弹")

-- 设置点击事件
checkButton_ArcaneMissiles:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.ArcaneMissiles = 1
    else
        MPMageArcaneSaved.ArcaneMissiles = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 340, postion_y)
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
        MPMageArcaneSaved.Target = 1
    else
        MPMageArcaneSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 奥术涌动​
local checkButton_ArcaneSurge = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_ArcaneSurge:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
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
        MPMageArcaneSaved.ArcaneSurge = 1
    else
        MPMageArcaneSaved.ArcaneSurge = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 火焰冲击
local checkButton_FireBlast = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_FireBlast:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
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
        MPMageArcaneSaved.FireBlast = 1
    else
        MPMageArcaneSaved.FireBlast = 0
    end
end)












-- 高级


postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsMageArcane:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-80


-- 创建单选框 - 奥术强化保护
local checkButton_ArcanePowerSafe = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonArcanePowerSafe", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_ArcanePowerSafe:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
checkButton_ArcanePowerSafe:SetScale(0.8)

-- 添加文字标签
local checkText_ArcanePowerSafe = checkButton_ArcanePowerSafe:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ArcanePowerSafe:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ArcanePowerSafe:SetTextColor(1, 1, 1)
checkText_ArcanePowerSafe:SetPoint("LEFT", checkButton_ArcanePowerSafe, "LEFT", 34, 1)
checkText_ArcanePowerSafe:SetText("开启 奥术强化保护")

local slider_ArcanePowerSafe = CreateFrame("Slider", ADDON_NAME.."Slider_ArcanePowerSafe", checkButton_ArcanePowerSafe, "OptionsSliderTemplate")
slider_ArcanePowerSafe:SetPoint("RIGHT", checkButton_ArcanePowerSafe, "RIGHT", 260, -2)
slider_ArcanePowerSafe:SetWidth(120) -- 拖动条长度
slider_ArcanePowerSafe:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_ArcanePowerSafe:SetMinMaxValues(10, 30)
slider_ArcanePowerSafe:SetValueStep(1)
slider_ArcanePowerSafe:SetValue(30) -- 默认值
MPCatUISliderRegionHide(slider_ArcanePowerSafe)

local color_ArcanePowerSafe = "|cFFFFD100"

_G[slider_ArcanePowerSafe:GetName().."Text"]:SetText(color_ArcanePowerSafe.."蓝量: 30%|r")
_G[slider_ArcanePowerSafe:GetName().."Low"]:Hide()
_G[slider_ArcanePowerSafe:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_ArcanePowerSafe:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPMageArcaneSaved.ArcanePowerSafe_Value = arg1
    _G[slider_ArcanePowerSafe:GetName().."Text"]:SetText(color_ArcanePowerSafe.."蓝量: ".. MPMageArcaneSaved.ArcanePowerSafe_Value .."%|r")
end)

-- 设置点击事件
checkButton_ArcanePowerSafe:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.ArcanePowerSafe = 1
        color_ArcanePowerSafe = "|cFFFFD100"
        _G[slider_ArcanePowerSafe:GetName().."Text"]:SetText(color_ArcanePowerSafe.."蓝量: ".. MPMageArcaneSaved.ArcanePowerSafe_Value .."%|r")
    else
        MPMageArcaneSaved.ArcanePowerSafe = 0
        color_ArcanePowerSafe = "|cFF888888"
        _G[slider_ArcanePowerSafe:GetName().."Text"]:SetText(color_ArcanePowerSafe.."蓝量: ".. MPMageArcaneSaved.ArcanePowerSafe_Value .."%|r")
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 340, postion_y)
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
    MPMageArcaneSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageArcaneSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageArcaneSaved.HealthStone_Value .."%|r")
    else
        MPMageArcaneSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageArcaneSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 奥术强化时不涌动
local checkButton_ArcanePowerNoSurge = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonArcanePowerNoSurge", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_ArcanePowerNoSurge:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
checkButton_ArcanePowerNoSurge:SetScale(0.8)

-- 添加文字标签
local checkText_ArcanePowerNoSurge = checkButton_ArcanePowerNoSurge:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ArcanePowerNoSurge:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ArcanePowerNoSurge:SetTextColor(1, 1, 1)
checkText_ArcanePowerNoSurge:SetPoint("LEFT", checkButton_ArcanePowerNoSurge, "LEFT", 34, 1)
checkText_ArcanePowerNoSurge:SetText("奥术强化时 不打 奥术涌动")

-- 设置点击事件
checkButton_ArcanePowerNoSurge:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.ArcanePowerNoSurge = 1
    else
        MPMageArcaneSaved.ArcanePowerNoSurge = 0
    end
end)




-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 340, postion_y)
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
    MPMageArcaneSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageArcaneSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageArcaneSaved.HerbalTea_Value .."%|r")
    else
        MPMageArcaneSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageArcaneSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 奥术溃裂 时不涌动
local checkButton_ArcaneExplosionNoSurge = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonArcanePowerNoSurge", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_ArcaneExplosionNoSurge:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
checkButton_ArcaneExplosionNoSurge:SetScale(0.8)

-- 添加文字标签
local checkText_ArcaneExplosionNoSurge = checkButton_ArcaneExplosionNoSurge:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ArcaneExplosionNoSurge:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ArcaneExplosionNoSurge:SetTextColor(1, 1, 1)
checkText_ArcaneExplosionNoSurge:SetPoint("LEFT", checkButton_ArcaneExplosionNoSurge, "LEFT", 34, 1)
checkText_ArcaneExplosionNoSurge:SetText("奥术溃裂时 不打 奥术涌动")

-- 设置点击事件
checkButton_ArcaneExplosionNoSurge:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.ArcaneExplosionNoSurge = 1
    else
        MPMageArcaneSaved.ArcaneExplosionNoSurge = 0
    end
end)



-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 340, postion_y)
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
    MPMageArcaneSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageArcaneSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageArcaneSaved.HerbalTeaMana_Value .."%|r")
    else
        MPMageArcaneSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageArcaneSaved.HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y - 40


-- 创建单选框 - 断条补溃裂
local checkButton_IntExplosion = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonIntExplosion", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_IntExplosion:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
checkButton_IntExplosion:SetScale(0.8)

-- 添加文字标签
local checkText_IntExplosion = checkButton_IntExplosion:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_IntExplosion:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_IntExplosion:SetTextColor(1, 1, 1)
checkText_IntExplosion:SetPoint("LEFT", checkButton_IntExplosion, "LEFT", 34, 1)
checkText_IntExplosion:SetText("断条补 奥术溃裂")

-- 设置点击事件
checkButton_IntExplosion:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.IntExplosion = 1
    else
        MPMageArcaneSaved.IntExplosion = 0
    end
end)



-- 创建单选框 - 宝石 蓝量
local checkButton_JewelMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_JewelMana", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_JewelMana:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 340, postion_y)
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
    MPMageArcaneSaved.JewelMana_Value = arg1
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageArcaneSaved.JewelMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_JewelMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.JewelMana = 1
        color_JewelMana = "|cFFFFD100"
        _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageArcaneSaved.JewelMana_Value .."%|r")
    else
        MPMageArcaneSaved.JewelMana = 0
        color_JewelMana = "|cFF888888"
        _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageArcaneSaved.JewelMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 种族天赋 (爆发类)
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonCurseEvil", CatUISettingsMageArcane, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 20, postion_y)
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
        MPMageArcaneSaved.RacialTraits = 1
    else
        MPMageArcaneSaved.RacialTraits = 0
    end
end)


-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsMageArcane, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.Soulspeed = 1
    else
        MPMageArcaneSaved.Soulspeed = 0
    end
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsMageArcane, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsMageArcane, "TOPLEFT", 120, -44)
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
    MPResetMageArcaneSettings()
    MPInitMageArcaneSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsMageArcane)

local checkButton_Power = MPPublicCheckButton(CatUISettingsMageArcane, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.Power = 1
    else
        MPMageArcaneSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsMageArcane, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsMageArcane, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMageArcaneSaved.Pick = 1
    else
        MPMageArcaneSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsMageArcane, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)

-- 添加提示内容区域
local TipText = CatUISettingsMageArcane:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsMageArcane, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFF69CCF0/madps|r ]")



-- 配置文件版本号
local MageArcaneSettingsUIVersion = 8

function MPResetMageArcaneSettings()

    MPMageArcaneSaved.Version = MageArcaneSettingsUIVersion

    -- 基本配置

    MPMageArcaneSaved.MageArmor = 1
    MPMageArcaneSaved.ArcaneExplosion = 1
    MPMageArcaneSaved.ArcaneMissiles = 1
    MPMageArcaneSaved.ArcaneSurge = 1
    MPMageArcaneSaved.FireBlast = 0

    MPMageArcaneSaved.Trinket_Upper = 1
    MPMageArcaneSaved.TUBoss = 0
    MPMageArcaneSaved.Trinket_Below = 1
    MPMageArcaneSaved.TBBoss = 0
    MPMageArcaneSaved.Target = 0



    -- 高级配置

    -- 治疗石、糖水茶
    MPMageArcaneSaved.HealthStone = 1
    MPMageArcaneSaved.HealthStone_Value = 30
    MPMageArcaneSaved.HerbalTea = 1
    MPMageArcaneSaved.HerbalTea_Value = 20
    MPMageArcaneSaved.HerbalTeaMana = 0
    MPMageArcaneSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPMageArcaneSaved.SuperWoW = 1
    MPMageArcaneSaved.UnitXP = 1

    MPMageArcaneSaved.ArcanePowerSafe = 0
    MPMageArcaneSaved.ArcanePowerSafe_Value = 30
    MPMageArcaneSaved.ArcanePowerNoSurge = 0
    MPMageArcaneSaved.ArcaneExplosionNoSurge = 0
    MPMageArcaneSaved.IntExplosion = 0
    MPMageArcaneSaved.RacialTraits = 0
    MPMageArcaneSaved.Soulspeed = 0

    MPMageArcaneSaved.JewelMana_Value = 35
    MPMageArcaneSaved.JewelMana = 0

    -- 通用
    MPMageArcaneSaved.Power = 0
    MPMageArcaneSaved.Pick = 0

end


local function MPInitMageArcaneSettingsPart1()

    checkButton_MageArmor:SetChecked(ToBoolean(MPMageArcaneSaved.MageArmor))
    checkButton_ArcaneExplosion:SetChecked( ToBoolean(MPMageArcaneSaved.ArcaneExplosion) )
    checkButton_ArcaneMissiles:SetChecked( ToBoolean(MPMageArcaneSaved.ArcaneMissiles) )
    checkButton_ArcaneSurge:SetChecked(ToBoolean(MPMageArcaneSaved.ArcaneSurge))
    checkButton_FireBlast:SetChecked(ToBoolean(MPMageArcaneSaved.FireBlast))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPMageArcaneSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPMageArcaneSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPMageArcaneSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPMageArcaneSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPMageArcaneSaved.Target))

    checkButton_IntExplosion:SetChecked(ToBoolean(MPMageArcaneSaved.IntExplosion))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPMageArcaneSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPMageArcaneSaved.Soulspeed))

    checkButton_ArcanePowerNoSurge:SetChecked(MPMageArcaneSaved.ArcanePowerNoSurge)
    checkButton_ArcaneExplosionNoSurge:SetChecked(MPMageArcaneSaved.ArcaneExplosionNoSurge)

    checkButton_Power:SetChecked(ToBoolean(MPMageArcaneSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPMageArcaneSaved.Pick))
end

function MPInitMageArcaneSettings()
    if not MPMageArcaneSaved then
        MPMageArcaneSaved = {}
        MPResetMageArcaneSettings()
    end

    if MPMageArcaneSaved.Version ~= MageArcaneSettingsUIVersion then
        MPResetMageArcaneSettings()
    end

    MPInitMageArcaneSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPMageArcaneSaved.HealthStone))
    slider_HealthStone:SetValue(MPMageArcaneSaved.HealthStone_Value)
    if MPMageArcaneSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPMageArcaneSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPMageArcaneSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPMageArcaneSaved.HerbalTea_Value)
    if MPMageArcaneSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPMageArcaneSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPMageArcaneSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPMageArcaneSaved.HerbalTeaMana_Value)
    if MPMageArcaneSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPMageArcaneSaved.HerbalTeaMana_Value .."%|r")

    checkButton_JewelMana:SetChecked(MPMageArcaneSaved.JewelMana)
    slider_JewelMana:SetValue(MPMageArcaneSaved.JewelMana_Value)
    if MPMageArcaneSaved.JewelMana==1 then
        color_JewelMana = "|cFFFFD100"
    else
        color_JewelMana = "|cFF888888"
    end
    _G[slider_JewelMana:GetName().."Text"]:SetText(color_JewelMana.."蓝量: ".. MPMageArcaneSaved.JewelMana_Value .."%|r")

    checkButton_ArcanePowerSafe:SetChecked(MPMageArcaneSaved.ArcanePowerSafe)
    slider_ArcanePowerSafe:SetValue(MPMageArcaneSaved.ArcanePowerSafe_Value)
    if MPMageArcaneSaved.ArcanePowerSafe==1 then
        color_ArcanePowerSafe = "|cFFFFD100"
    else
        color_ArcanePowerSafe = "|cFF888888"
    end
    _G[slider_ArcanePowerSafe:GetName().."Text"]:SetText(color_ArcanePowerSafe.."蓝量: ".. MPMageArcaneSaved.ArcanePowerSafe_Value .."%|r")


end

