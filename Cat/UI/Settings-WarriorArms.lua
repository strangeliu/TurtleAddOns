
-- 定义插件名称
local ADDON_NAME = "Settings-WarriorArms"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsWarriorArms = MPCreateFrame(ADDON_NAME.."Frame", 520, 640, "|cFFC79C6E设置 - 武器战|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsWarriorArms:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsWarriorArms, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)



local postion_y = postion_y-40


-- 创建单选框 - 狂暴姿态
local checkButton_BerserkerStance = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "保持 狂暴姿态")
-- 设置点击事件
checkButton_BerserkerStance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].BerserkerStance = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].BerserkerStance = 0
    end
end)





-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].TUBoss = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].TUBoss = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 战斗怒吼
local checkButton_BattleShout = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "保持 战斗怒吼")
-- 设置点击事件
checkButton_BattleShout:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].BattleShout = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].BattleShout = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].TBBoss = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].TBBoss = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 血性狂暴
local checkButton_BerserkerRage = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "开启 血性狂暴")
-- 设置点击事件
checkButton_BerserkerRage:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].BerserkerRage = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].BerserkerRage = 0
    end
end)



-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Target = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Target = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 旋风斩
local checkButton_Whirlwind = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "开启 旋风斩")
-- 设置点击事件
checkButton_Whirlwind:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Whirlwind = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Whirlwind = 0
    end
end)




-- 创建单选框 - 单体/群体
local checkButton_NearbyEnemies = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动 单体/群体")

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

-- 值变化时的回调函数
slider_NearbyEnemies_Value:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies_Value = arg1
    _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies_Value .."码|r")
end)

-- 设置点击事件
checkButton_NearbyEnemies:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies = 1
        color_NearbyEnemies = "|cFFFFD100"
        _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies_Value .."码|r")
    else
        MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies = 0
        color_NearbyEnemies = "|cFF888888"
        _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies_Value .."码|r")
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 斩杀
local checkButton_UseExecute = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "开启 斩杀")
-- 设置点击事件
checkButton_UseExecute:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].UseExecute = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].UseExecute = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冲锋/拦截
local checkButton_Charge = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "开启 冲锋/拦截 (谨慎使用)")
-- 设置点击事件
checkButton_Charge:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Charge = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Charge = 0
    end
end)




-- 高级


postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsWarriorArms:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsWarriorArms, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-85


-- 创建单选框 - 横扫
local checkButton_Sweeping = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "自动 横扫 \n(SuperWoW)")

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

-- 值变化时的回调函数
slider_Sweeping:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorArmsSaved[ConfigCurrent].Sweeping_Value = arg1
    _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Sweeping:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Sweeping = 1
        color_Sweeping = "|cFFFFD100"
        _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorArmsSaved[ConfigCurrent].Sweeping_Value)
    else
        MPWarriorArmsSaved[ConfigCurrent].Sweeping = 0
        color_Sweeping = "|cFF888888"
        _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorArmsSaved[ConfigCurrent].Sweeping_Value)
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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

-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPWarriorArmsSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPWarriorArmsSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 压制
local checkButton_Overpower = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "自动 压制")

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

-- 值变化时的回调函数
slider_Overpower:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorArmsSaved[ConfigCurrent].Overpower_Value = arg1
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Overpower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Overpower = 1
        color_Overpower = "|cFFFFD100"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorArmsSaved[ConfigCurrent].Overpower_Value)
    else
        MPWarriorArmsSaved[ConfigCurrent].Overpower = 0
        color_Overpower = "|cFF888888"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorArmsSaved[ConfigCurrent].Overpower_Value)
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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

-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorArmsSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPWarriorArmsSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)








postion_y = postion_y -40


-- 破甲
local checkButton_SunderArmor = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "自动 破甲")
-- 设置点击事件
checkButton_SunderArmor:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].SunderArmor = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].SunderArmor = 0
    end
end)

local checkButton_SunderArmorBOSS = MPCreateCheckButtonSmall(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 140, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SunderArmorBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].SunderArmorBOSS = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].SunderArmorBOSS = 0
    end
end)

local checkButton_SunderArmorOnce = MPCreateCheckButtonSmall(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 240, postion_y, "一破")
checkButton_SunderArmorOnce:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].SunderArmorOnce = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].SunderArmorOnce = 0
    end
end)



-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动 鞭根块茎")

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

-- 值变化时的回调函数
slider_Carrot:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorArmsSaved[ConfigCurrent].Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].Carrot_Value .."%|r")
    else
        MPWarriorArmsSaved[ConfigCurrent].Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].Carrot_Value .."%|r")
    end
end)











postion_y = postion_y-40

-- 创建单选框 - 斩杀嵌入主技能
local checkButton_ExecuteWithMortal = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "开启 斩杀期嵌入猛击")
-- 设置点击事件
checkButton_ExecuteWithMortal:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].ExecuteWithMortal = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].ExecuteWithMortal = 0
    end
end)


-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动 魂能之速")
-- 设置点击事件
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Soulspeed = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 斩杀周围目标
local checkButton_ExecuteOtherTarget = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "开启 斩杀周围目标 (SuperWoW)")
-- 设置点击事件
checkButton_ExecuteOtherTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].ExecuteOtherTarget = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].ExecuteOtherTarget = 0
    end
end)

-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].RacialTraits = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 小怪断条猛击斩杀
local checkButton_ExecuteWithoutMonster = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "开启 小怪断猛击 打斩杀")
-- 设置点击事件
checkButton_ExecuteWithoutMonster:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].ExecuteWithoutMonster = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].ExecuteWithoutMonster = 0
    end
end)

-- 创建单选框 - 自动打断
local checkButton_Interrupt = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, postion_y, "自动 打断读条 (SuperWoW)")
-- 设置点击事件
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Interrupt = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Interrupt = 0
    end
end)



postion_y = postion_y - 40



-- 创建单选框 - 英勇/顺劈
local checkButton_HeroicStrike = MPCreateCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, postion_y, "强制英勇怒气")

local slider_HeroicStrike = CreateFrame("Slider", ADDON_NAME.."Slider_HeroicStrike", checkButton_HeroicStrike, "OptionsSliderTemplate")
slider_HeroicStrike:SetPoint("RIGHT", checkButton_HeroicStrike, "RIGHT", 254, -2)
slider_HeroicStrike:SetWidth(140) -- 拖动条长度
slider_HeroicStrike:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HeroicStrike:SetMinMaxValues(10, 90)
slider_HeroicStrike:SetValueStep(1)
slider_HeroicStrike:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_HeroicStrike)

local color_HeroicStrike = "|cFFFFD100"

-- 值变化时的回调函数
slider_HeroicStrike:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorArmsSaved[ConfigCurrent].HeroicStrike_Value = arg1
    _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. arg1)
end)

-- 设置点击事件
checkButton_HeroicStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].HeroicStrike = 1
        color_HeroicStrike = "|cFFFFD100"
        _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorArmsSaved[ConfigCurrent].HeroicStrike_Value)
    else
        MPWarriorArmsSaved[ConfigCurrent].HeroicStrike = 0
        color_HeroicStrike = "|cFF888888"
        _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorArmsSaved[ConfigCurrent].HeroicStrike_Value)
    end
end)


postion_y = postion_y+35+40

-- 猛击节点
local slider_Slam = CreateFrame("Slider", ADDON_NAME.."SliderSlam", CatUISettingsWarriorArms, "OptionsSliderTemplate")
slider_Slam:SetPoint("TOPLEFT", CatUISettingsWarriorArms, "TOPLEFT", 20, postion_y-20)
slider_Slam:SetWidth(220) -- 拖动条长度
slider_Slam:SetHeight(16) -- 拖动条高度

slider_Slam:SetMinMaxValues(0.5, 3)
slider_Slam:SetValueStep(0.1)
slider_Slam:SetValue(5) -- 默认值
MPCatUISliderRegionHide(slider_Slam)

-- 值变化时的回调函数
slider_Slam:SetScript("OnValueChanged", function()
    MPWarriorArmsSaved[ConfigCurrent].Slam_Value = arg1

    _G[slider_Slam:GetName().."Text"]:SetText("猛击 >"..string.format("%.1f", arg1).."秒 下一次普攻前")
end)



postion_y = postion_y-60

-- 猛击节点
local slider_ExecutePower = CreateFrame("Slider", ADDON_NAME.."SliderExecutePower", CatUISettingsWarriorArms, "OptionsSliderTemplate")
slider_ExecutePower:SetPoint("TOPLEFT", CatUISettingsWarriorArms, "TOPLEFT", 20, postion_y)
slider_ExecutePower:SetWidth(220) -- 拖动条长度
slider_ExecutePower:SetHeight(16) -- 拖动条高度

slider_ExecutePower:SetMinMaxValues(15, 130)
slider_ExecutePower:SetValueStep(1)
slider_ExecutePower:SetValue(200) -- 默认值
MPCatUISliderRegionHide(slider_ExecutePower)

-- 值变化时的回调函数
slider_ExecutePower:SetScript("OnValueChanged", function()
    MPWarriorArmsSaved[ConfigCurrent].ExecutePower = arg1

    _G[slider_ExecutePower:GetName().."Text"]:SetText("斩杀 > "..arg1.."怒")
end)









-- 创建按钮
local myButton = MPCreateButton(CatUISettingsWarriorArms, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetWarriorArmsSettings(ConfigCurrent)
    MPInitWarriorArmsSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsWarriorArms, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsWarriorArms, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsWarriorArms, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsWarriorArms, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsWarriorArms, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsWarriorArms, "TOPLEFT", 440, -44)
ConfigButton[3].text = ConfigButton[3]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[3].text:SetPoint("LEFT", ConfigButton[3], "RIGHT", 0, 0)
ConfigButton[3].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[3].text:SetText(" 配置 3")

ConfigButton[1]:SetScript("OnClick", function()
    ConfigButton[1]:SetChecked(true)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 1]|r")
    ConfigCurrent = 1
    MPInitWarriorArmsSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitWarriorArmsSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitWarriorArmsSettings()
end)




-- 添加分隔线
MPBottomLine(CatUISettingsWarriorArms)

local checkButton_Power = MPPublicCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Power = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorArmsSaved[ConfigCurrent].Pick = 1
    else
        MPWarriorArmsSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsWarriorArms, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsWarriorArms:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsWarriorArms, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFC79C6E/arms|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local WarriorArmsSettingsUIVersion = 26

function MPResetWarriorArmsSettings(config)

    MPWarriorArmsSaved.Version = WarriorArmsSettingsUIVersion

    -- 基本配置
    MPWarriorArmsSaved[config].BerserkerStance = 1
    MPWarriorArmsSaved[config].BerserkerRage = 1
    MPWarriorArmsSaved[config].BattleShout = 1
    MPWarriorArmsSaved[config].Whirlwind = 1
    MPWarriorArmsSaved[config].UseExecute = 1
    MPWarriorArmsSaved[config].Charge = 0
    MPWarriorArmsSaved[config].Trinket_Upper = 1
    MPWarriorArmsSaved[config].TUBoss = 0
    MPWarriorArmsSaved[config].Trinket_Below = 1
    MPWarriorArmsSaved[config].TBBoss = 0
    MPWarriorArmsSaved[config].Target = 0
    MPWarriorArmsSaved[config].NearbyEnemies = 1
    MPWarriorArmsSaved[config].NearbyEnemies_Value = 8

    -- 高级配置
    MPWarriorArmsSaved[config].HeroicStrike = 0
    MPWarriorArmsSaved[config].HeroicStrike_Value = 50

    MPWarriorArmsSaved[config].Sweeping = 0
    MPWarriorArmsSaved[config].Sweeping_Value = 50
    MPWarriorArmsSaved[config].Overpower = 0
    MPWarriorArmsSaved[config].Overpower_Value = 30
    MPWarriorArmsSaved[config].Rend = 0
    MPWarriorArmsSaved[config].Rend_Value = 30
    MPWarriorArmsSaved[config].Slam_Value = 1.5
    MPWarriorArmsSaved[config].Hamstring = 1
    MPWarriorArmsSaved[config].SunderArmor = 0
    MPWarriorArmsSaved[config].SunderArmorBOSS = 0
    MPWarriorArmsSaved[config].SunderArmorOnce = 0

    MPWarriorArmsSaved[config].RacialTraits = 0
    MPWarriorArmsSaved[config].RacialTraitsBoss = 1
    MPWarriorArmsSaved[config].Soulspeed = 0
    MPWarriorArmsSaved[config].SoulspeedBoss = 1
    MPWarriorArmsSaved[config].Interrupt = 0
    MPWarriorArmsSaved[config].Recklessness = 0
    MPWarriorArmsSaved[config].ExecuteWithMortal = 1
    MPWarriorArmsSaved[config].ExecuteOtherTarget = 0
    MPWarriorArmsSaved[config].ExecuteWithoutMonster = 1
    MPWarriorArmsSaved[config].ExecutePower = 50

    -- 治疗石、糖水茶
    MPWarriorArmsSaved[config].HealthStone = 1
    MPWarriorArmsSaved[config].HealthStone_Value = 30
    MPWarriorArmsSaved[config].HerbalTea = 1
    MPWarriorArmsSaved[config].HerbalTea_Value = 20
    MPWarriorArmsSaved[config].Carrot = 0
    MPWarriorArmsSaved[config].Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPWarriorArmsSaved[config].SuperWoW = 1
    MPWarriorArmsSaved[config].UnitXP = 1

    -- 通用
    MPWarriorArmsSaved[config].Power = 0
    MPWarriorArmsSaved[config].Pick = 0


end


local function InitWarriorArmsSettingsPart1()
    checkButton_BerserkerStance:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].BerserkerStance))
    checkButton_BerserkerRage:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].BerserkerRage))
    checkButton_BattleShout:SetChecked( MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].BattleShout) )
    checkButton_Whirlwind:SetChecked( MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Whirlwind) )
    checkButton_UseExecute:SetChecked( MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].UseExecute) )
    checkButton_Charge:SetChecked( MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Charge) )

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].TBBoss))

    checkButton_Target:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Target))
    checkButton_NearbyEnemies:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies))
    slider_NearbyEnemies_Value:SetValue(MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies_Value)
    if MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies==1 then
        color_NearbyEnemies = "|cFFFFD100"
    else
        color_NearbyEnemies = "|cFF888888"
    end
    _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorArmsSaved[ConfigCurrent].NearbyEnemies_Value .."码|r")



end

local function InitWarriorArmsSettingsPart2()
    checkButton_HealthStone:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPWarriorArmsSaved[ConfigCurrent].HealthStone_Value)
    if MPWarriorArmsSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].HealthStone_Value .."%|r")


    checkButton_HerbalTea:SetChecked(MPWarriorArmsSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPWarriorArmsSaved[ConfigCurrent].HerbalTea_Value)
    if MPWarriorArmsSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPWarriorArmsSaved[ConfigCurrent].Carrot)
    slider_Carrot:SetValue(MPWarriorArmsSaved[ConfigCurrent].Carrot_Value)
    if MPWarriorArmsSaved[ConfigCurrent].Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorArmsSaved[ConfigCurrent].Carrot_Value .."%|r")

    checkButton_HeroicStrike:SetChecked(MPWarriorArmsSaved[ConfigCurrent].HeroicStrike)
    slider_HeroicStrike:SetValue(MPWarriorArmsSaved[ConfigCurrent].HeroicStrike_Value)
    if MPWarriorArmsSaved[ConfigCurrent].HeroicStrike==1 then
        color_HeroicStrike = "|cFFFFD100"
    else
        color_HeroicStrike = "|cFF888888"
    end
    _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorArmsSaved[ConfigCurrent].HeroicStrike_Value)


    slider_Slam:SetValue(MPWarriorArmsSaved[ConfigCurrent].Slam_Value)
    --_G[slider_Slam:GetName().."Text"]:SetText("猛击 >"..string.format("%.1f", MPWarriorArmsSaved[ConfigCurrent].Slam_Value).."秒 下一次普攻")

    slider_ExecutePower:SetValue(MPWarriorArmsSaved[ConfigCurrent].ExecutePower)

    -- 横扫
    checkButton_Sweeping:SetChecked(MPWarriorArmsSaved[ConfigCurrent].Sweeping)
    slider_Sweeping:SetValue(MPWarriorArmsSaved[ConfigCurrent].Sweeping_Value)
    if MPWarriorArmsSaved[ConfigCurrent].Sweeping==1 then
        color_Sweeping = "|cFFFFD100"
    else
        color_Sweeping = "|cFF888888"
    end
    _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorArmsSaved[ConfigCurrent].Sweeping_Value)

    checkButton_Overpower:SetChecked(MPWarriorArmsSaved[ConfigCurrent].Overpower)
    slider_Overpower:SetValue(MPWarriorArmsSaved[ConfigCurrent].Overpower_Value)
    if MPWarriorArmsSaved[ConfigCurrent].Overpower==1 then
        color_Overpower = "|cFFFFD100"
    else
        color_Overpower = "|cFF888888"
    end
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorArmsSaved[ConfigCurrent].Overpower_Value)

end


function MPInitWarriorArmsSettings()
    if not MPWarriorArmsSaved then
        MPWarriorArmsSaved = {}

        -- 第一套配置
        if not MPWarriorArmsSaved[1] then
            MPWarriorArmsSaved[1] = {}
            MPResetWarriorArmsSettings(1)
        end

        -- 第二套配置
        if not MPWarriorArmsSaved[2] then
            MPWarriorArmsSaved[2] = {}
            MPResetWarriorArmsSettings(2)
        end

        -- 第三套配置
        if not MPWarriorArmsSaved[3] then
            MPWarriorArmsSaved[3] = {}
            MPResetWarriorArmsSettings(3)
        end
    end

    if MPWarriorArmsSaved.Version ~= WarriorArmsSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[武器战宏]当前配置，这是新版插件正常数据更新！|r")
        MPWarriorArmsSaved[1] = {}
        MPWarriorArmsSaved[2] = {}
        MPWarriorArmsSaved[3] = {}
        MPResetWarriorArmsSettings(1)
        MPResetWarriorArmsSettings(2)
        MPResetWarriorArmsSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitWarriorArmsSettingsPart1()
    InitWarriorArmsSettingsPart2()

    --[[
    slider_Arms_HeroicStrike:SetValue(MPWarriorArmsSaved[ConfigCurrent].Arms_HeroicStrike)
    _G[slider_Arms_HeroicStrike:GetName().."Text"]:SetText("武器 英勇/顺劈 >"..MPWarriorArmsSaved[ConfigCurrent].Arms_HeroicStrike.." 怒气")
    ]]


    --[[
    checkButton_Rend:SetChecked(MPWarriorArmsSaved[ConfigCurrent].Rend)
    slider_Rend:SetValue(MPWarriorArmsSaved[ConfigCurrent].Rend_Value)
    if MPWarriorArmsSaved[ConfigCurrent].Rend==1 then
        color_Rend = "|cFFFFD100"
    else
        color_Rend = "|cFF888888"
    end
    _G[slider_Rend:GetName().."Text"]:SetText(color_Rend.."怒气 < ".. MPWarriorArmsSaved[ConfigCurrent].Rend_Value)
    ]]

    --checkButton_Hamstring:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Hamstring))


    checkButton_Interrupt:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Interrupt))
    checkButton_RacialTraits:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].SoulspeedBoss))
    --checkButton_DeathWish:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].DeathWish))
    --checkButton_Recklessness:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Recklessness))
    checkButton_ExecuteWithMortal:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].ExecuteWithMortal))
    checkButton_ExecuteOtherTarget:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].ExecuteOtherTarget))
    checkButton_ExecuteWithoutMonster:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].ExecuteWithoutMonster))
    checkButton_SunderArmor:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].SunderArmor))
    checkButton_SunderArmorBOSS:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].SunderArmorBOSS))
    checkButton_SunderArmorOnce:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].SunderArmorOnce))

    checkButton_Power:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPWarriorArmsSaved[ConfigCurrent].Pick))
end

