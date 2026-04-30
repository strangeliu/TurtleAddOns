
-- 定义插件名称
local ADDON_NAME = "Settings-WarriorEvil"

local ConfigCurrent = 1

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
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40


-- 创建单选框 - 狂暴姿态
local checkButton_BerserkerStance = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "保持 狂暴姿态")
-- 设置点击事件
checkButton_BerserkerStance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].BerserkerStance = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].BerserkerStance = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].TUBoss = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].TUBoss = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 战斗怒吼
local checkButton_BattleShout = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "保持 战斗怒吼")
-- 设置点击事件
checkButton_BattleShout:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].BattleShout = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].BattleShout = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].TBBoss = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].TBBoss = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 血性狂暴
local checkButton_BerserkerRage = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "开启 血性狂暴")
-- 设置点击事件
checkButton_BerserkerRage:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].BerserkerRage = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].BerserkerRage = 0
    end
end)



-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Target = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Target = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 旋风斩
local checkButton_Whirlwind = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "开启 旋风斩")
-- 设置点击事件
checkButton_Whirlwind:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Whirlwind = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Whirlwind = 0
    end
end)




-- 创建单选框 - 单体/群体
local checkButton_NearbyEnemies = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动 单体/群体")

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
    MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies_Value = arg1
    _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies_Value .."码|r")
end)

-- 设置点击事件
checkButton_NearbyEnemies:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies = 1
        color_NearbyEnemies = "|cFFFFD100"
        _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies_Value .."码|r")
    else
        MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies = 0
        color_NearbyEnemies = "|cFF888888"
        _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies_Value .."码|r")
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 斩杀
local checkButton_UseExecute = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "开启 斩杀")
-- 设置点击事件
checkButton_UseExecute:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].UseExecute = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].UseExecute = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 冲锋/拦截
local checkButton_Charge = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "开启 冲锋/拦截 (谨慎使用)")
-- 设置点击事件
checkButton_Charge:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Charge = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Charge = 0
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
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-85


-- 创建单选框 - 横扫
local checkButton_Sweeping = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "自动 横扫 \n(SuperWoW)")

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
    MPWarriorEvilSaved[ConfigCurrent].Sweeping_Value = arg1
    _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Sweeping:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Sweeping = 1
        color_Sweeping = "|cFFFFD100"
        _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorEvilSaved[ConfigCurrent].Sweeping_Value)
    else
        MPWarriorEvilSaved[ConfigCurrent].Sweeping = 0
        color_Sweeping = "|cFF888888"
        _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorEvilSaved[ConfigCurrent].Sweeping_Value)
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPWarriorEvilSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPWarriorEvilSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 压制
local checkButton_Overpower = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "自动 压制")

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
    MPWarriorEvilSaved[ConfigCurrent].Overpower_Value = arg1
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Overpower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Overpower = 1
        color_Overpower = "|cFFFFD100"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorEvilSaved[ConfigCurrent].Overpower_Value)
    else
        MPWarriorEvilSaved[ConfigCurrent].Overpower = 0
        color_Overpower = "|cFF888888"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorEvilSaved[ConfigCurrent].Overpower_Value)
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPWarriorEvilSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPWarriorEvilSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)








postion_y = postion_y -40


-- 破甲
local checkButton_SunderArmor = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "自动 破甲")
-- 设置点击事件
checkButton_SunderArmor:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].SunderArmor = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].SunderArmor = 0
    end
end)

local checkButton_SunderArmorBOSS = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 140, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SunderArmorBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].SunderArmorBOSS = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].SunderArmorBOSS = 0
    end
end)

local checkButton_SunderArmorOnce = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 240, postion_y, "一破")
checkButton_SunderArmorOnce:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].SunderArmorOnce = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].SunderArmorOnce = 0
    end
end)



-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动 鞭根块茎")

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
    MPWarriorEvilSaved[ConfigCurrent].Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].Carrot_Value .."%|r")
    else
        MPWarriorEvilSaved[ConfigCurrent].Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].Carrot_Value .."%|r")
    end
end)





postion_y = postion_y-40

-- 创建单选框 - 断筋
local checkButton_Hamstring = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "开启 断筋加入循环 (狂暴系)")
-- 设置点击事件
checkButton_Hamstring:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Hamstring = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Hamstring = 0
    end
end)


-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动 魂能之速")
-- 设置点击事件
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Soulspeed = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 斩杀周围目标
local checkButton_ExecuteOtherTarget = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "开启 斩杀周围目标 (SuperWoW)")
-- 设置点击事件
checkButton_ExecuteOtherTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].ExecuteOtherTarget = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].ExecuteOtherTarget = 0
    end
end)


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].RacialTraits = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 小怪断条猛击斩杀
local checkButton_ExecuteWithoutMonster = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "开启 小怪断猛击 打斩杀")
-- 设置点击事件
checkButton_ExecuteWithoutMonster:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].ExecuteWithoutMonster = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].ExecuteWithoutMonster = 0
    end
end)


postion_y = postion_y - 40



-- 创建单选框 - 英勇/顺劈
local checkButton_HeroicStrike = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, postion_y, "强制英勇怒气")

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
    MPWarriorEvilSaved[ConfigCurrent].HeroicStrike_Value = arg1
    _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. arg1)
end)

-- 设置点击事件
checkButton_HeroicStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].HeroicStrike = 1
        color_HeroicStrike = "|cFFFFD100"
        _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorEvilSaved[ConfigCurrent].HeroicStrike_Value)
    else
        MPWarriorEvilSaved[ConfigCurrent].HeroicStrike = 0
        color_HeroicStrike = "|cFF888888"
        _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorEvilSaved[ConfigCurrent].HeroicStrike_Value)
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

-- 值变化时的回调函数
slider_Slam:SetScript("OnValueChanged", function()
    MPWarriorEvilSaved[ConfigCurrent].Slam_Value = arg1

    _G[slider_Slam:GetName().."Text"]:SetText("猛击 >"..string.format("%.1f", arg1).."秒 下一次普攻前")
end)




postion_y = postion_y + 60 -55 -40


-- 创建单选框 - 死亡之愿
local checkButton_DeathWish = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动 死亡之愿")
-- 设置点击事件
checkButton_DeathWish:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].DeathWish = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].DeathWish = 0
    end
end)
local checkButton_DeathWishBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_DeathWishBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].DeathWishBoss = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].DeathWishBoss = 0
    end
end)




postion_y = postion_y - 40

-- 创建单选框 - 自动打断
local checkButton_Interrupt = MPCreateCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, postion_y, "自动 打断读条 (SuperWoW)")

-- 设置点击事件
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Interrupt = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Interrupt = 0
    end
end)


postion_y = postion_y - 40





-- 创建按钮
local myButton = MPCreateButton(CatUISettingsWarriorEvil, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetWarriorEvilSettings(ConfigCurrent)
    MPInitWarriorEvilSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsWarriorEvil, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsWarriorEvil, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsWarriorEvil, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsWarriorEvil, "TOPLEFT", 440, -44)
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
    MPInitWarriorEvilSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitWarriorEvilSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitWarriorEvilSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsWarriorEvil)

local checkButton_Power = MPPublicCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Power = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorEvilSaved[ConfigCurrent].Pick = 1
    else
        MPWarriorEvilSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsWarriorEvil, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
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
TipText:SetText("宏命令 |cFFC79C6E/evil|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local WarriorEvilSettingsUIVersion = 4

function MPResetWarriorEvilSettings(config)

    MPWarriorEvilSaved.Version = WarriorEvilSettingsUIVersion

    -- 基本配置
    MPWarriorEvilSaved[config].BerserkerStance = 1
    MPWarriorEvilSaved[config].BerserkerRage = 1
    MPWarriorEvilSaved[config].BattleShout = 1
    MPWarriorEvilSaved[config].Whirlwind = 1
    MPWarriorEvilSaved[config].UseExecute = 1
    MPWarriorEvilSaved[config].Charge = 0
    MPWarriorEvilSaved[config].Trinket_Upper = 1
    MPWarriorEvilSaved[config].TUBoss = 0
    MPWarriorEvilSaved[config].Trinket_Below = 1
    MPWarriorEvilSaved[config].TBBoss = 0
    MPWarriorEvilSaved[config].Target = 0
    MPWarriorEvilSaved[config].NearbyEnemies = 1
    MPWarriorEvilSaved[config].NearbyEnemies_Value = 8

    -- 高级配置
    MPWarriorEvilSaved[config].HeroicStrike = 0
    MPWarriorEvilSaved[config].HeroicStrike_Value = 50

    MPWarriorEvilSaved[config].Sweeping = 0
    MPWarriorEvilSaved[config].Sweeping_Value = 50
    MPWarriorEvilSaved[config].Overpower = 0
    MPWarriorEvilSaved[config].Overpower_Value = 30
    MPWarriorEvilSaved[config].Rend = 0
    MPWarriorEvilSaved[config].Rend_Value = 30
    MPWarriorEvilSaved[config].Slam_Value = 0.9
    MPWarriorEvilSaved[config].Hamstring = 1
    MPWarriorEvilSaved[config].SunderArmor = 0
    MPWarriorEvilSaved[config].SunderArmorBOSS = 0
    MPWarriorEvilSaved[config].SunderArmorOnce = 0

    MPWarriorEvilSaved[config].Recklessness = 0
    MPWarriorEvilSaved[config].RacialTraitsBoss = 1
    MPWarriorEvilSaved[config].Soulspeed = 0
    MPWarriorEvilSaved[config].SoulspeedBoss = 1
    MPWarriorEvilSaved[config].DeathWish = 0
    MPWarriorEvilSaved[config].DeathWishBoss = 1
    MPWarriorEvilSaved[config].Interrupt = 0
    MPWarriorEvilSaved[config].RacialTraits = 0
    MPWarriorEvilSaved[config].Execute = 0
    MPWarriorEvilSaved[config].ExecuteOtherTarget = 0
    MPWarriorEvilSaved[config].ExecuteWithoutMonster = 1

    -- 治疗石、糖水茶
    MPWarriorEvilSaved[config].HealthStone = 1
    MPWarriorEvilSaved[config].HealthStone_Value = 30
    MPWarriorEvilSaved[config].HerbalTea = 1
    MPWarriorEvilSaved[config].HerbalTea_Value = 20
    MPWarriorEvilSaved[config].Carrot = 0
    MPWarriorEvilSaved[config].Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPWarriorEvilSaved[config].SuperWoW = 1
    MPWarriorEvilSaved[config].UnitXP = 1

    -- 通用
    MPWarriorEvilSaved[config].Power = 0
    MPWarriorEvilSaved[config].Pick = 0


end


local function InitWarriorEvilSettingsPart1()
    checkButton_BerserkerStance:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].BerserkerStance))
    checkButton_BerserkerRage:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].BerserkerRage))
    checkButton_BattleShout:SetChecked( MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].BattleShout) )
    checkButton_Whirlwind:SetChecked( MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Whirlwind) )
    checkButton_UseExecute:SetChecked( MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].UseExecute) )
    checkButton_Charge:SetChecked( MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Charge) )

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].TBBoss))

    checkButton_Target:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Target))
    checkButton_NearbyEnemies:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies))
    slider_NearbyEnemies_Value:SetValue(MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies_Value)
    if MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies==1 then
        color_NearbyEnemies = "|cFFFFD100"
    else
        color_NearbyEnemies = "|cFF888888"
    end
    _G[slider_NearbyEnemies_Value:GetName().."Text"]:SetText(color_NearbyEnemies.."感应范围".. MPWarriorEvilSaved[ConfigCurrent].NearbyEnemies_Value .."码|r")


    checkButton_HealthStone:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPWarriorEvilSaved[ConfigCurrent].HealthStone_Value)
    if MPWarriorEvilSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].HealthStone_Value .."%|r")


    checkButton_HerbalTea:SetChecked(MPWarriorEvilSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPWarriorEvilSaved[ConfigCurrent].HerbalTea_Value)
    if MPWarriorEvilSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPWarriorEvilSaved[ConfigCurrent].Carrot)
    slider_Carrot:SetValue(MPWarriorEvilSaved[ConfigCurrent].Carrot_Value)
    if MPWarriorEvilSaved[ConfigCurrent].Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorEvilSaved[ConfigCurrent].Carrot_Value .."%|r")


end

function MPInitWarriorEvilSettings()
    if not MPWarriorEvilSaved then
        MPWarriorEvilSaved = {}

        -- 第一套配置
        if not MPWarriorEvilSaved[1] then
            MPWarriorEvilSaved[1] = {}
            MPResetWarriorEvilSettings(1)
        end

        -- 第二套配置
        if not MPWarriorEvilSaved[2] then
            MPWarriorEvilSaved[2] = {}
            MPResetWarriorEvilSettings(2)
        end

        -- 第三套配置
        if not MPWarriorEvilSaved[3] then
            MPWarriorEvilSaved[3] = {}
            MPResetWarriorEvilSettings(3)
        end
    end

    if MPWarriorEvilSaved.Version ~= WarriorEvilSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[邪修宏]当前配置，这是新版插件正常数据更新！|r")
        MPWarriorEvilSaved[1] = {}
        MPWarriorEvilSaved[2] = {}
        MPWarriorEvilSaved[3] = {}
        MPResetWarriorEvilSettings(1)
        MPResetWarriorEvilSettings(2)
        MPResetWarriorEvilSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitWarriorEvilSettingsPart1()

    --[[
    slider_Arms_HeroicStrike:SetValue(MPWarriorEvilSaved[ConfigCurrent].Arms_HeroicStrike)
    _G[slider_Arms_HeroicStrike:GetName().."Text"]:SetText("武器 英勇/顺劈 >"..MPWarriorEvilSaved[ConfigCurrent].Arms_HeroicStrike.." 怒气")
    ]]

    checkButton_HeroicStrike:SetChecked(MPWarriorEvilSaved[ConfigCurrent].HeroicStrike)
    slider_HeroicStrike:SetValue(MPWarriorEvilSaved[ConfigCurrent].HeroicStrike_Value)
    if MPWarriorEvilSaved[ConfigCurrent].HeroicStrike==1 then
        color_HeroicStrike = "|cFFFFD100"
    else
        color_HeroicStrike = "|cFF888888"
    end
    _G[slider_HeroicStrike:GetName().."Text"]:SetText(color_HeroicStrike.."怒气 > ".. MPWarriorEvilSaved[ConfigCurrent].HeroicStrike_Value)


    slider_Slam:SetValue(MPWarriorEvilSaved[ConfigCurrent].Slam_Value)
    _G[slider_Slam:GetName().."Text"]:SetText("猛击 >"..string.format("%.1f", MPWarriorEvilSaved[ConfigCurrent].Slam_Value).."秒 下一次普攻")

    -- 横扫
    checkButton_Sweeping:SetChecked(MPWarriorEvilSaved[ConfigCurrent].Sweeping)
    slider_Sweeping:SetValue(MPWarriorEvilSaved[ConfigCurrent].Sweeping_Value)
    if MPWarriorEvilSaved[ConfigCurrent].Sweeping==1 then
        color_Sweeping = "|cFFFFD100"
    else
        color_Sweeping = "|cFF888888"
    end
    _G[slider_Sweeping:GetName().."Text"]:SetText(color_Sweeping.."怒气 < ".. MPWarriorEvilSaved[ConfigCurrent].Sweeping_Value)

    checkButton_Overpower:SetChecked(MPWarriorEvilSaved[ConfigCurrent].Overpower)
    slider_Overpower:SetValue(MPWarriorEvilSaved[ConfigCurrent].Overpower_Value)
    if MPWarriorEvilSaved[ConfigCurrent].Overpower==1 then
        color_Overpower = "|cFFFFD100"
    else
        color_Overpower = "|cFF888888"
    end
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorEvilSaved[ConfigCurrent].Overpower_Value)

    --[[
    checkButton_Rend:SetChecked(MPWarriorEvilSaved[ConfigCurrent].Rend)
    slider_Rend:SetValue(MPWarriorEvilSaved[ConfigCurrent].Rend_Value)
    if MPWarriorEvilSaved[ConfigCurrent].Rend==1 then
        color_Rend = "|cFFFFD100"
    else
        color_Rend = "|cFF888888"
    end
    _G[slider_Rend:GetName().."Text"]:SetText(color_Rend.."怒气 < ".. MPWarriorEvilSaved[ConfigCurrent].Rend_Value)
    ]]

    checkButton_Hamstring:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Hamstring))


    checkButton_Interrupt:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Interrupt))
    checkButton_RacialTraits:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].SoulspeedBoss))
    checkButton_DeathWish:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].DeathWish))
    checkButton_DeathWishBoss:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].DeathWishBoss))
    --checkButton_Recklessness:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Recklessness))
    checkButton_ExecuteOtherTarget:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].ExecuteOtherTarget))
    checkButton_ExecuteWithoutMonster:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].ExecuteWithoutMonster))
    checkButton_SunderArmor:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].SunderArmor))
    checkButton_SunderArmorBOSS:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].SunderArmorBOSS))
    checkButton_SunderArmorOnce:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].SunderArmorOnce))

    checkButton_Power:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPWarriorEvilSaved[ConfigCurrent].Pick))
end

