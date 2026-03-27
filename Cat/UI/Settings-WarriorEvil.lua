
-- 定义插件名称
local ADDON_NAME = "Settings-WarriorEvil"


-- 创建主框架
CatUISettingsWarriorEvil = MPCreateFrame(ADDON_NAME.."Frame", 520, 600, "|cFFC79C6E设置 - 邪修|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsWarriorEvil:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")






local postion_y = postion_y-40


-- 创建单选框 - 狂暴姿态
local checkButton_BerserkerStance = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_BerserkerStance:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.BerserkerStance = 1
    else
        MPWarriorEvilSaved.BerserkerStance = 0
    end
end)





-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
        MPWarriorEvilSaved.Trinket_Upper = 1
    else
        MPWarriorEvilSaved.Trinket_Upper = 0
    end
end)

local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.TUBoss = 1
    else
        MPWarriorEvilSaved.TUBoss = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 战斗怒吼
local checkButton_BattleShout = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_BattleShout:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.BattleShout = 1
    else
        MPWarriorEvilSaved.BattleShout = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
        MPWarriorEvilSaved.Trinket_Below = 1
    else
        MPWarriorEvilSaved.Trinket_Below = 0
    end
end)

local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.TBBoss = 1
    else
        MPWarriorEvilSaved.TBBoss = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 血性狂暴
local checkButton_BerserkerRage = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_BerserkerRage:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.BerserkerRage = 1
    else
        MPWarriorEvilSaved.BerserkerRage = 0
    end
end)



-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
        MPWarriorEvilSaved.Target = 1
    else
        MPWarriorEvilSaved.Target = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 旋风斩
local checkButton_Whirlwind = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Whirlwind:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.Whirlwind = 1
    else
        MPWarriorEvilSaved.Whirlwind = 0
    end
end)




-- 创建单选框 - 单体/群体
local checkButton_NearbyEnemies = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_NearbyEnemies:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
checkButton_NearbyEnemies:SetScale(0.8)

-- 添加文字标签
local checkText_NearbyEnemies = checkButton_NearbyEnemies:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_NearbyEnemies:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_NearbyEnemies:SetTextColor(1, 1, 1)
checkText_NearbyEnemies:SetPoint("LEFT", checkButton_NearbyEnemies, "LEFT", 34, 1)
checkText_NearbyEnemies:SetText("自动判断 单体/群体 (SuperWoW)")

-- 设置点击事件
checkButton_NearbyEnemies:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.NearbyEnemies = 1
    else
        MPWarriorEvilSaved.NearbyEnemies = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 斩杀
local checkButton_UseExecute = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_UseExecute:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.UseExecute = 1
    else
        MPWarriorEvilSaved.UseExecute = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冲锋/拦截
local checkButton_Charge = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Charge:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.Charge = 1
    else
        MPWarriorEvilSaved.Charge = 0
    end
end)




-- 高级


postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsWarriorEvil:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-85


-- 创建单选框 - 横扫
local checkButton_Sweeping = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Sweeping:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
checkButton_Sweeping:SetScale(0.8)

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
    MPWarriorEvilSaved.Sweeping_Value = arg1
    _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Sweeping:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.Sweeping = 1
        color_Sweeping = "|cFFFFD100"
        _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorEvilSaved.Sweeping_Value)
    else
        MPWarriorEvilSaved.Sweeping = 0
        color_Sweeping = "|cFF888888"
        _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorEvilSaved.Sweeping_Value)
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
    MPWarriorEvilSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorEvilSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorEvilSaved.HealthStone_Value .."%|r")
    else
        MPWarriorEvilSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorEvilSaved.HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 压制
local checkButton_Overpower = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Overpower:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
    MPWarriorEvilSaved.Overpower_Value = arg1
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Overpower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.Overpower = 1
        color_Overpower = "|cFFFFD100"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorEvilSaved.Overpower_Value)
    else
        MPWarriorEvilSaved.Overpower = 0
        color_Overpower = "|cFF888888"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorEvilSaved.Overpower_Value)
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
    MPWarriorEvilSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorEvilSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorEvilSaved.HerbalTea_Value .."%|r")
    else
        MPWarriorEvilSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorEvilSaved.HerbalTea_Value .."%|r")
    end
end)








postion_y = postion_y -40


-- 破甲
local checkButton_SunderArmor = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_SunderArmor:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.SunderArmor = 1
    else
        MPWarriorEvilSaved.SunderArmor = 0
    end
end)

local checkButton_SunderArmorBOSS = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 140, postion_y, "仅BOSS")
checkButton_SunderArmorBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.SunderArmorBOSS = 1
    else
        MPWarriorEvilSaved.SunderArmorBOSS = 0
    end
end)

local checkButton_SunderArmorOnce = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 240, postion_y, "一破")
checkButton_SunderArmorOnce:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.SunderArmorOnce = 1
    else
        MPWarriorEvilSaved.SunderArmorOnce = 0
    end
end)



-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Carrot:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
    MPWarriorEvilSaved.Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorEvilSaved.Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorEvilSaved.Carrot_Value .."%|r")
    else
        MPWarriorEvilSaved.Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorEvilSaved.Carrot_Value .."%|r")
    end
end)











postion_y = postion_y-40

-- 创建单选框 - 断筋
local checkButton_Hamstring = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Hamstring:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.Hamstring = 1
    else
        MPWarriorEvilSaved.Hamstring = 0
    end
end)


-- 魂能之速
local checkButton_Soulspeed = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Soulspeed:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
        MPWarriorEvilSaved.Soulspeed = 1
    else
        MPWarriorEvilSaved.Soulspeed = 0
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 斩杀周围目标
local checkButton_ExecuteOtherTarget = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_ExecuteOtherTarget:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.ExecuteOtherTarget = 1
    else
        MPWarriorEvilSaved.ExecuteOtherTarget = 0
    end
end)


-- 创建单选框 - 死亡之愿
local checkButton_DeathWish = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_DeathWish:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
        MPWarriorEvilSaved.DeathWish = 1
    else
        MPWarriorEvilSaved.DeathWish = 0
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 小怪断条猛击斩杀
local checkButton_ExecuteWithoutMonster = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_ExecuteWithoutMonster:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
        MPWarriorEvilSaved.ExecuteWithoutMonster = 1
    else
        MPWarriorEvilSaved.ExecuteWithoutMonster = 0
    end
end)


postion_y = postion_y - 40



-- 创建单选框 - 英勇/顺劈
local checkButton_HeroicStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_HeroicStrike:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y)
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
    MPWarriorEvilSaved.HeroicStrike_Value = arg1
    _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. arg1)
end)

-- 设置点击事件
checkButton_HeroicStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.HeroicStrike = 1
        color_HeroicStrike = "|cFFFFD100"
        _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorEvilSaved.HeroicStrike_Value)
    else
        MPWarriorEvilSaved.HeroicStrike = 0
        color_HeroicStrike = "|cFF888888"
        _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorEvilSaved.HeroicStrike_Value)
    end
end)


postion_y = postion_y+35+40

-- 猛击节点
local slider_Slam = CreateFrame("Slider", ADDON_NAME.."SliderSlam", CatUISettingsWarriorEvil, "OptionsSliderTemplate")
slider_Slam:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 20, postion_y-20)
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
    MPWarriorEvilSaved.Slam_Value = arg1

    _G[slider_Slam:GetName().."Text"]:SetText("猛击 >"..string.format("%.1f", arg1).."秒 下一次普攻前")
end)






postion_y = postion_y + 60 -55 -40











-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
        MPWarriorEvilSaved.RacialTraits = 1
    else
        MPWarriorEvilSaved.RacialTraits = 0
    end
end)

postion_y = postion_y - 40

-- 创建单选框 - 自动打断
local checkButton_Interrupt = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Interrupt:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
        MPWarriorEvilSaved.Interrupt = 1
    else
        MPWarriorEvilSaved.Interrupt = 0
    end
end)


postion_y = postion_y - 40


--[[
postion_y = postion_y - 40

-- 创建单选框 - 斩杀嵌入主技能
local checkButton_Execute = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorEvil, "UICheckButtonTemplate")
checkButton_Execute:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 340, postion_y)
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
        MPWarriorEvilSaved.Execute = 1
    else
        MPWarriorEvilSaved.Execute = 0
    end
end)
]]

--postion_y = postion_y - 40







-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarriorEvil, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 120, -44)
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
    MPResetWarriorEvilSettings()
    MPInitWarriorEvilSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsWarriorEvil)

local checkButton_Power = MPPublicCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.Power = 1
    else
        MPWarriorEvilSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved.Pick = 1
    else
        MPWarriorEvilSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsWarriorEvil:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsWarriorEvil, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ 全自动 |cFFC79C6E/evil|r ]  [ 纯单体(防ADD) |cFFC79C6E/evilo|r ]")



-- 配置文件版本号
local WarriorEvilSettingsUIVersion = 0

function MPResetWarriorEvilSettings()

    MPWarriorEvilSaved.Version = WarriorEvilSettingsUIVersion

    -- 基本配置
    MPWarriorEvilSaved.BerserkerStance = 1
    MPWarriorEvilSaved.BerserkerRage = 1
    MPWarriorEvilSaved.BattleShout = 1
    MPWarriorEvilSaved.Whirlwind = 1
    MPWarriorEvilSaved.UseExecute = 1
    MPWarriorEvilSaved.Charge = 0
    MPWarriorEvilSaved.Trinket_Upper = 1
    MPWarriorEvilSaved.TUBoss = 0
    MPWarriorEvilSaved.Trinket_Below = 1
    MPWarriorEvilSaved.TBBoss = 0
    MPWarriorEvilSaved.Target = 0
    MPWarriorEvilSaved.NearbyEnemies = 1

    -- 高级配置
    MPWarriorEvilSaved.HeroicStrike = 0
    MPWarriorEvilSaved.HeroicStrike_Value = 50

    MPWarriorEvilSaved.Sweeping = 0
    MPWarriorEvilSaved.Sweeping_Value = 50
    MPWarriorEvilSaved.Overpower = 0
    MPWarriorEvilSaved.Overpower_Value = 30
    MPWarriorEvilSaved.Rend = 0
    MPWarriorEvilSaved.Rend_Value = 30
    MPWarriorEvilSaved.Slam_Value = 0.9
    MPWarriorEvilSaved.Hamstring = 1
    MPWarriorEvilSaved.SunderArmor = 0
    MPWarriorEvilSaved.SunderArmorBOSS = 0
    MPWarriorEvilSaved.SunderArmorOnce = 0

    MPWarriorEvilSaved.Soulspeed = 0
    MPWarriorEvilSaved.Interrupt = 0
    MPWarriorEvilSaved.DeathWish = 0
    MPWarriorEvilSaved.Recklessness = 0
    MPWarriorEvilSaved.RacialTraits = 0
    MPWarriorEvilSaved.Execute = 0
    MPWarriorEvilSaved.ExecuteOtherTarget = 0
    MPWarriorEvilSaved.ExecuteWithoutMonster = 1

    -- 治疗石、糖水茶
    MPWarriorEvilSaved.HealthStone = 1
    MPWarriorEvilSaved.HealthStone_Value = 30
    MPWarriorEvilSaved.HerbalTea = 1
    MPWarriorEvilSaved.HerbalTea_Value = 20
    MPWarriorEvilSaved.Carrot = 0
    MPWarriorEvilSaved.Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPWarriorEvilSaved.SuperWoW = 1
    MPWarriorEvilSaved.UnitXP = 1

    -- 通用
    MPWarriorEvilSaved.Power = 0
    MPWarriorEvilSaved.Pick = 0


end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function InitWarriorEvilSettingsPart1()
    checkButton_BerserkerStance:SetChecked(ToBoolean(MPWarriorEvilSaved.BerserkerStance))
    checkButton_BerserkerRage:SetChecked(ToBoolean(MPWarriorEvilSaved.BerserkerRage))
    checkButton_BattleShout:SetChecked( ToBoolean(MPWarriorEvilSaved.BattleShout) )
    checkButton_Whirlwind:SetChecked( ToBoolean(MPWarriorEvilSaved.Whirlwind) )
    checkButton_UseExecute:SetChecked( ToBoolean(MPWarriorEvilSaved.UseExecute) )
    checkButton_Charge:SetChecked( ToBoolean(MPWarriorEvilSaved.Charge) )

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPWarriorEvilSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPWarriorEvilSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPWarriorEvilSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPWarriorEvilSaved.TBBoss))

    checkButton_Target:SetChecked(ToBoolean(MPWarriorEvilSaved.Target))
    checkButton_NearbyEnemies:SetChecked(ToBoolean(MPWarriorEvilSaved.NearbyEnemies))


    checkButton_HealthStone:SetChecked(ToBoolean(MPWarriorEvilSaved.HealthStone))
    slider_HealthStone:SetValue(MPWarriorEvilSaved.HealthStone_Value)
    if MPWarriorEvilSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorEvilSaved.HealthStone_Value .."%|r")


    checkButton_HerbalTea:SetChecked(MPWarriorEvilSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPWarriorEvilSaved.HerbalTea_Value)
    if MPWarriorEvilSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorEvilSaved.HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPWarriorEvilSaved.Carrot)
    slider_Carrot:SetValue(MPWarriorEvilSaved.Carrot_Value)
    if MPWarriorEvilSaved.Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorEvilSaved.Carrot_Value .."%|r")


end

function MPInitWarriorEvilSettings()
    if not MPWarriorEvilSaved then
        MPWarriorEvilSaved = {}
        MPResetWarriorEvilSettings()
    end

    if MPWarriorEvilSaved.Version ~= WarriorEvilSettingsUIVersion then
        MPResetWarriorEvilSettings()
    end

    InitWarriorEvilSettingsPart1()

    --[[
    slider_Arms_HeroicStrike:SetValue(MPWarriorEvilSaved.Arms_HeroicStrike)
    _G[slider_Arms_HeroicStrike:GetName().."Text"]:SetText("武器 英勇/顺劈 >"..MPWarriorEvilSaved.Arms_HeroicStrike.." 怒气")
    ]]

    checkButton_HeroicStrike:SetChecked(MPWarriorEvilSaved.HeroicStrike)
    slider_HeroicStrike:SetValue(MPWarriorEvilSaved.HeroicStrike_Value)
    if MPWarriorEvilSaved.HeroicStrike==1 then
        color_HeroicStrike = "|cFFFFD100"
    else
        color_HeroicStrike = "|cFF888888"
    end
    _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorEvilSaved.HeroicStrike_Value)


    slider_Slam:SetValue(MPWarriorEvilSaved.Slam_Value)
    _G[slider_Slam:GetName().."Text"]:SetText("猛击 >"..string.format("%.1f", MPWarriorEvilSaved.Slam_Value).."秒 下一次普攻")

    -- 横扫
    checkButton_Sweeping:SetChecked(MPWarriorEvilSaved.Sweeping)
    slider_Sweeping:SetValue(MPWarriorEvilSaved.Sweeping_Value)
    if MPWarriorEvilSaved.Sweeping==1 then
        color_Sweeping = "|cFFFFD100"
    else
        color_Sweeping = "|cFF888888"
    end
    _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorEvilSaved.Sweeping_Value)

    checkButton_Overpower:SetChecked(MPWarriorEvilSaved.Overpower)
    slider_Overpower:SetValue(MPWarriorEvilSaved.Overpower_Value)
    if MPWarriorEvilSaved.Overpower==1 then
        color_Overpower = "|cFFFFD100"
    else
        color_Overpower = "|cFF888888"
    end
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorEvilSaved.Overpower_Value)

    --[[
    checkButton_Rend:SetChecked(MPWarriorEvilSaved.Rend)
    slider_Rend:SetValue(MPWarriorEvilSaved.Rend_Value)
    if MPWarriorEvilSaved.Rend==1 then
        color_Rend = "|cFFFFD100"
    else
        color_Rend = "|cFF888888"
    end
    _G[slider_Rend:GetName().."Text"]:SetText(color_Rend.."怒气 < ".. MPWarriorEvilSaved.Rend_Value)
    ]]

    checkButton_Hamstring:SetChecked(ToBoolean(MPWarriorEvilSaved.Hamstring))


    checkButton_Interrupt:SetChecked(ToBoolean(MPWarriorEvilSaved.Interrupt))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPWarriorEvilSaved.Soulspeed))
    checkButton_DeathWish:SetChecked(ToBoolean(MPWarriorEvilSaved.DeathWish))
    --checkButton_Recklessness:SetChecked(ToBoolean(MPWarriorEvilSaved.Recklessness))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPWarriorEvilSaved.RacialTraits))
    checkButton_ExecuteOtherTarget:SetChecked(ToBoolean(MPWarriorEvilSaved.ExecuteOtherTarget))
    checkButton_ExecuteWithoutMonster:SetChecked(ToBoolean(MPWarriorEvilSaved.ExecuteWithoutMonster))
    checkButton_SunderArmor:SetChecked(ToBoolean(MPWarriorEvilSaved.SunderArmor))
    checkButton_SunderArmorBOSS:SetChecked(ToBoolean(MPWarriorEvilSaved.SunderArmorBOSS))
    checkButton_SunderArmorOnce:SetChecked(ToBoolean(MPWarriorEvilSaved.SunderArmorOnce))

    checkButton_Power:SetChecked(ToBoolean(MPWarriorEvilSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPWarriorEvilSaved.Pick))
end

