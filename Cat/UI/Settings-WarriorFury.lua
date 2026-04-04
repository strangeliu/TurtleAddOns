
-- 定义插件名称
local ADDON_NAME = "Settings-WarriorFury"


-- 创建主框架
CatUISettingsWarriorFury = MPCreateFrame(ADDON_NAME.."Frame", 520, 600, "|cFFC79C6E设置 - 狂暴战|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsWarriorFury:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40


-- 创建单选框 - 狂暴姿态
local checkButton_BerserkerStance = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_BerserkerStance:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_BerserkerStance:SetScale(0.8)

-- 添加文字标签
local checkText_BerserkerStance = checkButton_BerserkerStance:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_BerserkerStance:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_BerserkerStance:SetTextColor(1, 1, 1)
checkText_BerserkerStance:SetPoint("LEFT", checkButton_BerserkerStance, "LEFT", 34, 1)
checkText_BerserkerStance:SetText("保持 狂暴姿态")

-- 设置点击事件
checkButton_BerserkerStance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.BerserkerStance = 1
    else
        MPWarriorFurySaved.BerserkerStance = 0
    end
end)





-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
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
        MPWarriorFurySaved.Trinket_Upper = 1
    else
        MPWarriorFurySaved.Trinket_Upper = 0
    end
end)

local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorFury, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.TUBoss = 1
    else
        MPWarriorFurySaved.TUBoss = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 战斗怒吼
local checkButton_BattleShout = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_BattleShout:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_BattleShout:SetScale(0.8)

-- 添加文字标签
local checkText_BattleShout = checkButton_BattleShout:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_BattleShout:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_BattleShout:SetTextColor(1, 1, 1)
checkText_BattleShout:SetPoint("LEFT", checkButton_BattleShout, "LEFT", 34, 1)
checkText_BattleShout:SetText("保持 战斗怒吼")

-- 设置点击事件
checkButton_BattleShout:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.BattleShout = 1
    else
        MPWarriorFurySaved.BattleShout = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
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
        MPWarriorFurySaved.Trinket_Below = 1
    else
        MPWarriorFurySaved.Trinket_Below = 0
    end
end)

local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorFury, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.TBBoss = 1
    else
        MPWarriorFurySaved.TBBoss = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 血性狂暴
local checkButton_BerserkerRage = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_BerserkerRage:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_BerserkerRage:SetScale(0.8)

-- 添加文字标签
local checkText_BerserkerRage = checkButton_BerserkerRage:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_BerserkerRage:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_BerserkerRage:SetTextColor(1, 1, 1)
checkText_BerserkerRage:SetPoint("LEFT", checkButton_BerserkerRage, "LEFT", 34, 1)
checkText_BerserkerRage:SetText("开启 血性狂暴")

-- 设置点击事件
checkButton_BerserkerRage:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.BerserkerRage = 1
    else
        MPWarriorFurySaved.BerserkerRage = 0
    end
end)



-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
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
        MPWarriorFurySaved.Target = 1
    else
        MPWarriorFurySaved.Target = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 旋风斩
local checkButton_Whirlwind = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Whirlwind:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_Whirlwind:SetScale(0.8)

-- 添加文字标签
local checkText_Whirlwind = checkButton_Whirlwind:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Whirlwind:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Whirlwind:SetTextColor(1, 1, 1)
checkText_Whirlwind:SetPoint("LEFT", checkButton_Whirlwind, "LEFT", 34, 1)
checkText_Whirlwind:SetText("开启 旋风斩")

-- 设置点击事件
checkButton_Whirlwind:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Whirlwind = 1
    else
        MPWarriorFurySaved.Whirlwind = 0
    end
end)




-- 创建单选框 - 单体/群体
local checkButton_NearbyEnemies = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_NearbyEnemies:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
checkButton_NearbyEnemies:SetScale(0.8)

-- 添加文字标签
local checkText_NearbyEnemies = checkButton_NearbyEnemies:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_NearbyEnemies:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_NearbyEnemies:SetTextColor(1, 1, 1)
checkText_NearbyEnemies:SetPoint("LEFT", checkButton_NearbyEnemies, "LEFT", 34, 1)
checkText_NearbyEnemies:SetText("自动 单体/群体")


local slider_NearbyEnemies_Value = CreateFrame("Slider", ADDON_NAME.."Slider_NearbyEnemies_Value", checkButton_NearbyEnemies, "OptionsSliderTemplate")
slider_NearbyEnemies_Value:SetPoint("RIGHT", checkButton_NearbyEnemies, "RIGHT", 250, -2)
slider_NearbyEnemies_Value:SetWidth(150) -- 拖动条长度
slider_NearbyEnemies_Value:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_NearbyEnemies_Value:SetMinMaxValues(5, 20)
slider_NearbyEnemies_Value:SetValueStep(1)
slider_NearbyEnemies_Value:SetValue(8) -- 默认值
MPCatUISliderRegionHide(slider_NearbyEnemies_Value)

local color_NearbyEnemies = "|cFFFFD100"

_G[slider_NearbyEnemies_Value:GetName().."Low"]:Hide()
_G[slider_NearbyEnemies_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_NearbyEnemies_Value:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPWarriorFurySaved.NearbyEnemies_Value = arg1
    _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorFurySaved.NearbyEnemies_Value .."码|r")
end)

-- 设置点击事件
checkButton_NearbyEnemies:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.NearbyEnemies = 1
        color_NearbyEnemies = "|cFFFFD100"
        _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorFurySaved.NearbyEnemies_Value .."码|r")
    else
        MPWarriorFurySaved.NearbyEnemies = 0
        color_NearbyEnemies = "|cFF888888"
        _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorFurySaved.NearbyEnemies_Value .."码|r")
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 斩杀
local checkButton_UseExecute = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_UseExecute:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_UseExecute:SetScale(0.8)

-- 添加文字标签
local checkText_UseExecute = checkButton_UseExecute:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_UseExecute:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_UseExecute:SetTextColor(1, 1, 1)
checkText_UseExecute:SetPoint("LEFT", checkButton_UseExecute, "LEFT", 34, 1)
checkText_UseExecute:SetText("开启 斩杀")

-- 设置点击事件
checkButton_UseExecute:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.UseExecute = 1
    else
        MPWarriorFurySaved.UseExecute = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冲锋/拦截
local checkButton_Charge = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Charge:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_Charge:SetScale(0.8)

-- 添加文字标签
local checkText_Charge = checkButton_Charge:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Charge:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Charge:SetTextColor(1, 1, 1)
checkText_Charge:SetPoint("LEFT", checkButton_Charge, "LEFT", 34, 1)
checkText_Charge:SetText("开启 冲锋/拦截 (谨慎使用)")

-- 设置点击事件
checkButton_Charge:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Charge = 1
    else
        MPWarriorFurySaved.Charge = 0
    end
end)




-- 高级


postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsWarriorFury:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-85


-- 创建单选框 - 横扫
local checkButton_Sweeping = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Sweeping:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_Sweeping:SetScale(0.8)
checkButton_Sweeping:Hide()

-- 添加文字标签
local checkText_Sweeping = checkButton_Sweeping:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Sweeping:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_Sweeping:SetTextColor(1, 1, 1)
checkText_Sweeping:SetPoint("LEFT", checkButton_Sweeping, "LEFT", 34, 1)
checkText_Sweeping:SetText("自动 横扫 \n(SuperWoW)")


local slider_Sweeping = CreateFrame("Slider", ADDON_NAME.."Slider_Sweeping", checkButton_Sweeping, "OptionsSliderTemplate")
slider_Sweeping:SetPoint("RIGHT", checkButton_Sweeping, "RIGHT", 244, -2)
slider_Sweeping:SetWidth(160) -- 拖动条长度
slider_Sweeping:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Sweeping:SetMinMaxValues(20, 100)
slider_Sweeping:SetValueStep(1)
slider_Sweeping:SetValue(90) -- 默认值
MPCatUISliderRegionHide(slider_Sweeping)

local color_Sweeping = "|cFFFFD100"

_G[slider_Sweeping:GetName().."Text"]:SetText("")
_G[slider_Sweeping:GetName().."Low"]:Hide()
_G[slider_Sweeping:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Sweeping:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorFurySaved.Sweeping_Value = arg1
    _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Sweeping:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Sweeping = 1
        color_Sweeping = "|cFFFFD100"
        _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorFurySaved.Sweeping_Value)
    else
        MPWarriorFurySaved.Sweeping = 0
        color_Sweeping = "|cFF888888"
        _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorFurySaved.Sweeping_Value)
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
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
    MPWarriorFurySaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorFurySaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorFurySaved.HealthStone_Value .."%|r")
    else
        MPWarriorFurySaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorFurySaved.HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 压制
local checkButton_Overpower = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Overpower:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_Overpower:SetScale(0.8)

-- 添加文字标签
local checkText_Overpower = checkButton_Overpower:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Overpower:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Overpower:SetTextColor(1, 1, 1)
checkText_Overpower:SetPoint("LEFT", checkButton_Overpower, "LEFT", 34, 1)
checkText_Overpower:SetText("自动 压制")


local slider_Overpower = CreateFrame("Slider", ADDON_NAME.."Slider_Overpower", checkButton_Overpower, "OptionsSliderTemplate")
slider_Overpower:SetPoint("RIGHT", checkButton_Overpower, "RIGHT", 244, -2)
slider_Overpower:SetWidth(160) -- 拖动条长度
slider_Overpower:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Overpower:SetMinMaxValues(10, 100)
slider_Overpower:SetValueStep(1)
slider_Overpower:SetValue(90) -- 默认值
MPCatUISliderRegionHide(slider_Overpower)

local color_Overpower = "|cFFFFD100"

_G[slider_Overpower:GetName().."Text"]:SetText("")
_G[slider_Overpower:GetName().."Low"]:Hide()
_G[slider_Overpower:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Overpower:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorFurySaved.Overpower_Value = arg1
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Overpower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Overpower = 1
        color_Overpower = "|cFFFFD100"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorFurySaved.Overpower_Value)
    else
        MPWarriorFurySaved.Overpower = 0
        color_Overpower = "|cFF888888"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorFurySaved.Overpower_Value)
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
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
    MPWarriorFurySaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorFurySaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorFurySaved.HerbalTea_Value .."%|r")
    else
        MPWarriorFurySaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorFurySaved.HerbalTea_Value .."%|r")
    end
end)








postion_y = postion_y -40


-- 破甲
local checkButton_SunderArmor = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_SunderArmor:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_SunderArmor:SetScale(0.8)

-- 添加文字标签
local checkText_SunderArmor = checkButton_SunderArmor:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SunderArmor:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SunderArmor:SetTextColor(1, 1, 1)
checkText_SunderArmor:SetPoint("LEFT", checkButton_SunderArmor, "LEFT", 34, 1)
checkText_SunderArmor:SetText("自动 破甲")

-- 设置点击事件
checkButton_SunderArmor:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.SunderArmor = 1
    else
        MPWarriorFurySaved.SunderArmor = 0
    end
end)

local checkButton_SunderArmorBOSS = MPCreateCheckButtonSmall(CatUISettingsWarriorFury, ADDON_NAME.."CheckButton", 140, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SunderArmorBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.SunderArmorBOSS = 1
    else
        MPWarriorFurySaved.SunderArmorBOSS = 0
    end
end)

local checkButton_SunderArmorOnce = MPCreateCheckButtonSmall(CatUISettingsWarriorFury, ADDON_NAME.."CheckButton", 240, postion_y, "一破")
checkButton_SunderArmorOnce:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.SunderArmorOnce = 1
    else
        MPWarriorFurySaved.SunderArmorOnce = 0
    end
end)



-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Carrot:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
checkButton_Carrot:SetScale(0.8)

-- 添加文字标签
local checkText_Carrot = checkButton_Carrot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Carrot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Carrot:SetTextColor(1, 1, 1)
checkText_Carrot:SetPoint("LEFT", checkButton_Carrot, "LEFT", 34, 1)
checkText_Carrot:SetText("自动 鞭根块茎")


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
    MPWarriorFurySaved.Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorFurySaved.Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorFurySaved.Carrot_Value .."%|r")
    else
        MPWarriorFurySaved.Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorFurySaved.Carrot_Value .."%|r")
    end
end)











postion_y = postion_y-40

-- 创建单选框 - 断筋
local checkButton_Hamstring = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Hamstring:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_Hamstring:SetScale(0.8)

-- 添加文字标签
local checkText_Hamstring = checkButton_Hamstring:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Hamstring:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Hamstring:SetTextColor(1, 1, 1)
checkText_Hamstring:SetPoint("LEFT", checkButton_Hamstring, "LEFT", 34, 1)
checkText_Hamstring:SetText("开启 断筋加入循环 (狂暴系)")

-- 设置点击事件
checkButton_Hamstring:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Hamstring = 1
    else
        MPWarriorFurySaved.Hamstring = 0
    end
end)


-- 魂能之速
local checkButton_Soulspeed = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Soulspeed:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
checkButton_Soulspeed:SetScale(0.8)

-- 添加文字标签
local checkText_Soulspeed = checkButton_Soulspeed:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Soulspeed:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Soulspeed:SetTextColor(1, 1, 1)
checkText_Soulspeed:SetPoint("LEFT", checkButton_Soulspeed, "LEFT", 34, 1)
checkText_Soulspeed:SetText("自动 魂能之速 (BOSS时)")

-- 设置点击事件
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Soulspeed = 1
    else
        MPWarriorFurySaved.Soulspeed = 0
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 斩杀周围目标
local checkButton_ExecuteOtherTarget = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_ExecuteOtherTarget:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_ExecuteOtherTarget:SetScale(0.8)

-- 添加文字标签
local checkText_ExecuteOtherTarget = checkButton_ExecuteOtherTarget:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ExecuteOtherTarget:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ExecuteOtherTarget:SetTextColor(1, 1, 1)
checkText_ExecuteOtherTarget:SetPoint("LEFT", checkButton_ExecuteOtherTarget, "LEFT", 34, 1)
checkText_ExecuteOtherTarget:SetText("开启 斩杀周围目标 (SuperWoW)")

-- 设置点击事件
checkButton_ExecuteOtherTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.ExecuteOtherTarget = 1
    else
        MPWarriorFurySaved.ExecuteOtherTarget = 0
    end
end)


-- 创建单选框 - 死亡之愿
local checkButton_DeathWish = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_DeathWish:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
checkButton_DeathWish:SetScale(0.8)

-- 添加文字标签
local checkText_DeathWish = checkButton_DeathWish:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_DeathWish:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_DeathWish:SetTextColor(1, 1, 1)
checkText_DeathWish:SetPoint("LEFT", checkButton_DeathWish, "LEFT", 34, 1)
checkText_DeathWish:SetText("自动 死亡之愿")

-- 设置点击事件
checkButton_DeathWish:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.DeathWish = 1
    else
        MPWarriorFurySaved.DeathWish = 0
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 小怪断条猛击斩杀
local checkButton_ExecuteWithoutMonster = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_ExecuteWithoutMonster:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_ExecuteWithoutMonster:SetScale(0.8)

-- 添加文字标签
local checkText_ExecuteWithoutMonster = checkButton_ExecuteWithoutMonster:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ExecuteWithoutMonster:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ExecuteWithoutMonster:SetTextColor(1, 1, 1)
checkText_ExecuteWithoutMonster:SetPoint("LEFT", checkButton_ExecuteWithoutMonster, "LEFT", 34, 1)
checkText_ExecuteWithoutMonster:SetText("开启 小怪断猛击 打斩杀")

-- 设置点击事件
checkButton_ExecuteWithoutMonster:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.ExecuteWithoutMonster = 1
    else
        MPWarriorFurySaved.ExecuteWithoutMonster = 0
    end
end)


postion_y = postion_y - 40



-- 创建单选框 - 英勇/顺劈
local checkButton_HeroicStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_HeroicStrike:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y)
checkButton_HeroicStrike:SetScale(0.8)

-- 添加文字标签
local checkText_HeroicStrike = checkButton_HeroicStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HeroicStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HeroicStrike:SetTextColor(1, 1, 1)
checkText_HeroicStrike:SetPoint("LEFT", checkButton_HeroicStrike, "LEFT", 34, 1)
checkText_HeroicStrike:SetText("英勇/顺劈")


local slider_HeroicStrike = CreateFrame("Slider", ADDON_NAME.."Slider_HeroicStrike", checkButton_HeroicStrike, "OptionsSliderTemplate")
slider_HeroicStrike:SetPoint("RIGHT", checkButton_HeroicStrike, "RIGHT", 244, -2)
slider_HeroicStrike:SetWidth(160) -- 拖动条长度
slider_HeroicStrike:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HeroicStrike:SetMinMaxValues(10, 100)
slider_HeroicStrike:SetValueStep(1)
slider_HeroicStrike:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_HeroicStrike)

local color_HeroicStrike = "|cFFFFD100"

_G[slider_HeroicStrike:GetName().."Text"]:SetText("")
_G[slider_HeroicStrike:GetName().."Low"]:Hide()
_G[slider_HeroicStrike:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_HeroicStrike:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorFurySaved.HeroicStrike_Value = arg1
    _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. arg1)
end)

-- 设置点击事件
checkButton_HeroicStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.HeroicStrike = 1
        color_HeroicStrike = "|cFFFFD100"
        _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorFurySaved.HeroicStrike_Value)
    else
        MPWarriorFurySaved.HeroicStrike = 0
        color_HeroicStrike = "|cFF888888"
        _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorFurySaved.HeroicStrike_Value)
    end
end)


postion_y = postion_y+35+40

-- 猛击节点
local slider_Slam = CreateFrame("Slider", ADDON_NAME.."SliderSlam", CatUISettingsWarriorFury, "OptionsSliderTemplate")
slider_Slam:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 20, postion_y-20)
slider_Slam:SetWidth(220) -- 拖动条长度
slider_Slam:SetHeight(16) -- 拖动条高度

slider_Slam:SetMinMaxValues(0.5, 3)
slider_Slam:SetValueStep(0.1)
slider_Slam:SetValue(1.1) -- 默认值
MPCatUISliderRegionHide(slider_Slam)

_G[slider_Slam:GetName().."Text"]:SetText("")
_G[slider_Slam:GetName().."Low"]:Hide()
_G[slider_Slam:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Slam:SetScript("OnValueChanged", function()
    MPWarriorFurySaved.Slam_Value = arg1

    _G[slider_Slam:GetName().."Text"]:SetText("猛击 >"..string.format("%.1f", arg1).."秒 下一次普攻前")
end)






postion_y = postion_y + 60 -55 -40











-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
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
        MPWarriorFurySaved.RacialTraits = 1
    else
        MPWarriorFurySaved.RacialTraits = 0
    end
end)

postion_y = postion_y - 40

-- 创建单选框 - 自动打断
local checkButton_Interrupt = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Interrupt:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
checkButton_Interrupt:SetScale(0.8)

-- 添加文字标签
local checkText_Interrupt = checkButton_Interrupt:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Interrupt:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Interrupt:SetTextColor(1, 1, 1)
checkText_Interrupt:SetPoint("LEFT", checkButton_Interrupt, "LEFT", 34, 1)
checkText_Interrupt:SetText("自动 打断读条 (SuperWoW)")

-- 设置点击事件
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Interrupt = 1
    else
        MPWarriorFurySaved.Interrupt = 0
    end
end)


postion_y = postion_y - 40


--[[
postion_y = postion_y - 40

-- 创建单选框 - 斩杀嵌入主技能
local checkButton_Execute = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorFury, "UICheckButtonTemplate")
checkButton_Execute:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 340, postion_y)
checkButton_Execute:SetScale(0.8)

-- 添加文字标签
local checkText_Execute = checkButton_Execute:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Execute:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Execute:SetTextColor(1, 1, 1)
checkText_Execute:SetPoint("LEFT", checkButton_Execute, "LEFT", 34, 1)
checkText_Execute:SetText("开启 斩杀嵌入主技能 \n(武器系 或 双持)")

-- 设置点击事件
checkButton_Execute:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Execute = 1
    else
        MPWarriorFurySaved.Execute = 0
    end
end)
]]

--postion_y = postion_y - 40







-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarriorFury, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsWarriorFury, "TOPLEFT", 120, -44)
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
    MPResetWarriorFurySettings()
    MPInitWarriorFurySettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsWarriorFury)

local checkButton_Power = MPPublicCheckButton(CatUISettingsWarriorFury, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Power = 1
    else
        MPWarriorFurySaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsWarriorFury, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsWarriorFury, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorFurySaved.Pick = 1
    else
        MPWarriorFurySaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsWarriorFury, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsWarriorFury:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsWarriorFury, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ 全自动 |cFFC79C6E/fury|r ]  [ 纯单体(防ADD) |cFFC79C6E/furyo|r ]")



-- 配置文件版本号
local WarriorFurySettingsUIVersion = 30

function MPResetWarriorFurySettings()

    MPWarriorFurySaved.Version = WarriorFurySettingsUIVersion

    -- 基本配置
    MPWarriorFurySaved.BerserkerStance = 1
    MPWarriorFurySaved.BerserkerRage = 1
    MPWarriorFurySaved.BattleShout = 1
    MPWarriorFurySaved.Whirlwind = 1
    MPWarriorFurySaved.UseExecute = 1
    MPWarriorFurySaved.Charge = 0
    MPWarriorFurySaved.Trinket_Upper = 1
    MPWarriorFurySaved.TUBoss = 0
    MPWarriorFurySaved.Trinket_Below = 1
    MPWarriorFurySaved.TBBoss = 0
    MPWarriorFurySaved.Target = 0
    MPWarriorFurySaved.NearbyEnemies = 1
    MPWarriorFurySaved.NearbyEnemies_Value = 8

    -- 高级配置
    MPWarriorFurySaved.HeroicStrike = 0
    MPWarriorFurySaved.HeroicStrike_Value = 50

    MPWarriorFurySaved.Sweeping = 0
    MPWarriorFurySaved.Sweeping_Value = 50
    MPWarriorFurySaved.Overpower = 0
    MPWarriorFurySaved.Overpower_Value = 30
    MPWarriorFurySaved.Rend = 0
    MPWarriorFurySaved.Rend_Value = 30
    MPWarriorFurySaved.Slam_Value = 1.5
    MPWarriorFurySaved.Hamstring = 1
    MPWarriorFurySaved.SunderArmor = 0
    MPWarriorFurySaved.SunderArmorBOSS = 0
    MPWarriorFurySaved.SunderArmorOnce = 0

    MPWarriorFurySaved.Soulspeed = 0
    MPWarriorFurySaved.Interrupt = 0
    MPWarriorFurySaved.DeathWish = 0
    MPWarriorFurySaved.Recklessness = 0
    MPWarriorFurySaved.RacialTraits = 0
    MPWarriorFurySaved.Execute = 0
    MPWarriorFurySaved.ExecuteOtherTarget = 0
    MPWarriorFurySaved.ExecuteWithoutMonster = 1

    -- 治疗石、糖水茶
    MPWarriorFurySaved.HealthStone = 1
    MPWarriorFurySaved.HealthStone_Value = 30
    MPWarriorFurySaved.HerbalTea = 1
    MPWarriorFurySaved.HerbalTea_Value = 20
    MPWarriorFurySaved.Carrot = 0
    MPWarriorFurySaved.Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPWarriorFurySaved.SuperWoW = 1
    MPWarriorFurySaved.UnitXP = 1

    -- 通用
    MPWarriorFurySaved.Power = 0
    MPWarriorFurySaved.Pick = 0


end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function InitWarriorFurySettingsPart1()
    checkButton_BerserkerStance:SetChecked(ToBoolean(MPWarriorFurySaved.BerserkerStance))
    checkButton_BerserkerRage:SetChecked(ToBoolean(MPWarriorFurySaved.BerserkerRage))
    checkButton_BattleShout:SetChecked( ToBoolean(MPWarriorFurySaved.BattleShout) )
    checkButton_Whirlwind:SetChecked( ToBoolean(MPWarriorFurySaved.Whirlwind) )
    checkButton_UseExecute:SetChecked( ToBoolean(MPWarriorFurySaved.UseExecute) )
    checkButton_Charge:SetChecked( ToBoolean(MPWarriorFurySaved.Charge) )

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPWarriorFurySaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPWarriorFurySaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPWarriorFurySaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPWarriorFurySaved.TBBoss))

    checkButton_Target:SetChecked(ToBoolean(MPWarriorFurySaved.Target))

    checkButton_NearbyEnemies:SetChecked(ToBoolean(MPWarriorFurySaved.NearbyEnemies))
    slider_NearbyEnemies_Value:SetValue(MPWarriorFurySaved.NearbyEnemies_Value)
    if MPWarriorFurySaved.NearbyEnemies==1 then
        color_NearbyEnemies = "|cFFFFD100"
    else
        color_NearbyEnemies = "|cFF888888"
    end
    _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorFurySaved.NearbyEnemies_Value .."码|r")


    checkButton_HealthStone:SetChecked(ToBoolean(MPWarriorFurySaved.HealthStone))
    slider_HealthStone:SetValue(MPWarriorFurySaved.HealthStone_Value)
    if MPWarriorFurySaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorFurySaved.HealthStone_Value .."%|r")


    checkButton_HerbalTea:SetChecked(MPWarriorFurySaved.HerbalTea)
    slider_HerbalTea:SetValue(MPWarriorFurySaved.HerbalTea_Value)
    if MPWarriorFurySaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorFurySaved.HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPWarriorFurySaved.Carrot)
    slider_Carrot:SetValue(MPWarriorFurySaved.Carrot_Value)
    if MPWarriorFurySaved.Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorFurySaved.Carrot_Value .."%|r")


end

function MPInitWarriorFurySettings()
    if not MPWarriorFurySaved then
        MPWarriorFurySaved = {}
        MPResetWarriorFurySettings()
    end

    if MPWarriorFurySaved.Version ~= WarriorFurySettingsUIVersion then
        MPResetWarriorFurySettings()
    end

    InitWarriorFurySettingsPart1()

    --[[
    slider_Arms_HeroicStrike:SetValue(MPWarriorFurySaved.Arms_HeroicStrike)
    _G[slider_Arms_HeroicStrike:GetName().."Text"]:SetText("武器 英勇/顺劈 >"..MPWarriorFurySaved.Arms_HeroicStrike.." 怒气")
    ]]

    checkButton_HeroicStrike:SetChecked(MPWarriorFurySaved.HeroicStrike)
    slider_HeroicStrike:SetValue(MPWarriorFurySaved.HeroicStrike_Value)
    if MPWarriorFurySaved.HeroicStrike==1 then
        color_HeroicStrike = "|cFFFFD100"
    else
        color_HeroicStrike = "|cFF888888"
    end
    _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorFurySaved.HeroicStrike_Value)


    slider_Slam:SetValue(MPWarriorFurySaved.Slam_Value)
    _G[slider_Slam:GetName().."Text"]:SetText("猛击 >"..string.format("%.1f", MPWarriorFurySaved.Slam_Value).."秒 下一次普攻")

    -- 横扫
    checkButton_Sweeping:SetChecked(MPWarriorFurySaved.Sweeping)
    slider_Sweeping:SetValue(MPWarriorFurySaved.Sweeping_Value)
    if MPWarriorFurySaved.Sweeping==1 then
        color_Sweeping = "|cFFFFD100"
    else
        color_Sweeping = "|cFF888888"
    end
    _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorFurySaved.Sweeping_Value)

    checkButton_Overpower:SetChecked(MPWarriorFurySaved.Overpower)
    slider_Overpower:SetValue(MPWarriorFurySaved.Overpower_Value)
    if MPWarriorFurySaved.Overpower==1 then
        color_Overpower = "|cFFFFD100"
    else
        color_Overpower = "|cFF888888"
    end
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorFurySaved.Overpower_Value)

    --[[
    checkButton_Rend:SetChecked(MPWarriorFurySaved.Rend)
    slider_Rend:SetValue(MPWarriorFurySaved.Rend_Value)
    if MPWarriorFurySaved.Rend==1 then
        color_Rend = "|cFFFFD100"
    else
        color_Rend = "|cFF888888"
    end
    _G[slider_Rend:GetName().."Text"]:SetText(color_Rend.."怒气 < ".. MPWarriorFurySaved.Rend_Value)
    ]]

    checkButton_Hamstring:SetChecked(ToBoolean(MPWarriorFurySaved.Hamstring))


    checkButton_Interrupt:SetChecked(ToBoolean(MPWarriorFurySaved.Interrupt))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPWarriorFurySaved.Soulspeed))
    checkButton_DeathWish:SetChecked(ToBoolean(MPWarriorFurySaved.DeathWish))
    --checkButton_Recklessness:SetChecked(ToBoolean(MPWarriorFurySaved.Recklessness))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPWarriorFurySaved.RacialTraits))
    checkButton_ExecuteOtherTarget:SetChecked(ToBoolean(MPWarriorFurySaved.ExecuteOtherTarget))
    checkButton_ExecuteWithoutMonster:SetChecked(ToBoolean(MPWarriorFurySaved.ExecuteWithoutMonster))
    checkButton_SunderArmor:SetChecked(ToBoolean(MPWarriorFurySaved.SunderArmor))
    checkButton_SunderArmorBOSS:SetChecked(ToBoolean(MPWarriorFurySaved.SunderArmorBOSS))
    checkButton_SunderArmorOnce:SetChecked(ToBoolean(MPWarriorFurySaved.SunderArmorOnce))

    checkButton_Power:SetChecked(ToBoolean(MPWarriorFurySaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPWarriorFurySaved.Pick))
end

