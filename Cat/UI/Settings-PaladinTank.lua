
-- 定义插件名称
local ADDON_NAME = "Settings-PaladinTank"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsPaladinTank = MPCreateFrame(ADDON_NAME.."Frame", 520, 550, "|cFFF58CBA设置 - 防骑|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPaladinTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 正义之怒
local checkButton_RighteousFury = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "保持 正义之怒")
-- 设置点击事件
checkButton_RighteousFury:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].RighteousFury = 1
    else
        MPPaladinTankSaved[ConfigCurrent].RighteousFury = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPPaladinTankSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].TUBoss = 1
    else
        MPPaladinTankSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奉献
local checkButton_Consecration = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 奉献")
-- 设置点击事件
checkButton_Consecration:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Consecration=1
        MPPaladinTankSaved[ConfigCurrent].Consecration = 1
    else
        MPPaladinCJSaved.Consecration=0
        MPPaladinTankSaved[ConfigCurrent].Consecration = 0
    end
    MPCatPaladinSealInit()
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPPaladinTankSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].TBBoss = 1
    else
        MPPaladinTankSaved[ConfigCurrent].TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 神圣之盾
local checkButton_HolyShield = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 神圣之盾")
-- 设置点击事件
checkButton_HolyShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].HolyShield = 1
    else
        MPPaladinTankSaved[ConfigCurrent].HolyShield = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Target = 1
    else
        MPPaladinTankSaved[ConfigCurrent].Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 十字军打击
local checkButton_CrusaderStrike = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 十字军打击")
-- 设置点击事件
checkButton_CrusaderStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].CrusaderStrike = 1
    else
        MPPaladinTankSaved[ConfigCurrent].CrusaderStrike = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 驱邪术
local checkButton_Exorcism = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 驱邪术 (亡灵,恶魔)")
-- 设置点击事件
checkButton_Exorcism:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Exorcism = 1
    else
        MPPaladinTankSaved[ConfigCurrent].Exorcism = 0
    end
end)


-- 高级



postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsPaladinTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-75


-- 创建单选框 - 神圣之盾
local checkButton_HolyShieldTarget = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "目标看你时 允许 神圣之盾")
-- 设置点击事件
checkButton_HolyShieldTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].HolyShieldTarget = 1
    else
        MPPaladinTankSaved[ConfigCurrent].HolyShieldTarget = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPPaladinTankSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinTankSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinTankSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPPaladinTankSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinTankSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 取消拯救
local checkButton_UnSalvation = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "自动取消 拯救祝福")
-- 设置点击事件
checkButton_UnSalvation:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].UnSalvation = 1
    else
        MPPaladinTankSaved[ConfigCurrent].UnSalvation = 0
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPPaladinTankSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinTankSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinTankSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPPaladinTankSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinTankSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)





postion_y = postion_y-40



-- 创建单选框 - 小庇护祝福
local checkButton_Sanctuary = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "自动 小庇护祝福")
-- 设置点击事件
checkButton_Sanctuary:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Sanctuary = 1
    else
        MPPaladinTankSaved[ConfigCurrent].Sanctuary = 0
    end
end)




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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

-- 值变化时的回调函数
slider_HerbalTeaMana:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)




postion_y = postion_y-40



-- 创建单选框 - 正义壁垒
local checkButton_Righteous = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, postion_y, "自动 正义壁垒")

local slider_Righteous = CreateFrame("Slider", ADDON_NAME.."Slider_Righteous", checkButton_Righteous, "OptionsSliderTemplate")
slider_Righteous:SetPoint("RIGHT", checkButton_Righteous, "RIGHT", 250, -2)
slider_Righteous:SetWidth(150) -- 拖动条长度
slider_Righteous:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Righteous:SetMinMaxValues(0, 100)
slider_Righteous:SetValueStep(1)
slider_Righteous:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Righteous)

local color_Righteous = "|cFFFFD100"

-- 值变化时的回调函数
slider_Righteous:SetScript("OnValueChanged", function()
    --print("Frenzied当前值:", arg1)
    MPPaladinTankSaved[ConfigCurrent].Righteous_Value = arg1
    _G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Righteous:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Righteous = 1
        color_Righteous = "|cFFFFD100"
        _G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: ".. MPPaladinTankSaved[ConfigCurrent].Righteous_Value .."%|r")
    else
        MPPaladinTankSaved[ConfigCurrent].Righteous = 0
        color_Righteous = "|cFF888888"
        _G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: ".. MPPaladinTankSaved[ConfigCurrent].Righteous_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 圣疗术
local checkButton_LayHands = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动 圣疗术")

local slider_LayHands = CreateFrame("Slider", ADDON_NAME.."Slider_LayHands", checkButton_LayHands, "OptionsSliderTemplate")
slider_LayHands:SetPoint("RIGHT", checkButton_LayHands, "RIGHT", 250, -2)
slider_LayHands:SetWidth(150) -- 拖动条长度
slider_LayHands:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_LayHands:SetMinMaxValues(0, 100)
slider_LayHands:SetValueStep(1)
slider_LayHands:SetValue(10) -- 默认值
MPCatUISliderRegionHide(slider_LayHands)

local color_LayHands = "|cFFFFD100"

-- 值变化时的回调函数
slider_LayHands:SetScript("OnValueChanged", function()
    --print("Frenzied当前值:", arg1)
    MPPaladinTankSaved[ConfigCurrent].LayHands_Value = arg1
    _G[slider_LayHands:GetName().."Text"]:SetText(color_LayHands.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_LayHands:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].LayHands = 1
        color_LayHands = "|cFFFFD100"
        _G[slider_LayHands:GetName().."Text"]:SetText(color_LayHands.."血线: ".. MPPaladinTankSaved[ConfigCurrent].LayHands_Value .."%|r")
    else
        MPPaladinTankSaved[ConfigCurrent].LayHands = 0
        color_LayHands = "|cFF888888"
        _G[slider_LayHands:GetName().."Text"]:SetText(color_LayHands.."血线: ".. MPPaladinTankSaved[ConfigCurrent].LayHands_Value .."%|r")
    end
end)

postion_y = postion_y-40


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].RacialTraits = 1
    else
        MPPaladinTankSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPPaladinTankSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)


postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Soulspeed = 1
    else
        MPPaladinTankSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPPaladinTankSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)


postion_y = postion_y+150


-- 审判界限
local slider_JudgementOutHP = CreateFrame("Slider", ADDON_NAME.."SliderJudgementOutHP", CatUISettingsPaladinTank, "OptionsSliderTemplate")
slider_JudgementOutHP:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
slider_JudgementOutHP:SetWidth(220) -- 拖动条长度
slider_JudgementOutHP:SetHeight(16) -- 拖动条高度

slider_JudgementOutHP:SetMinMaxValues(0, 50000)
slider_JudgementOutHP:SetValueStep(1000)
slider_JudgementOutHP:SetValue(500000) -- 默认值
MPCatUISliderRegionHide(slider_JudgementOutHP)

-- 值变化时的回调函数
slider_JudgementOutHP:SetScript("OnValueChanged", function()
    --print("Rip当前值:", arg1)
    MPPaladinTankSaved[ConfigCurrent].JudgementOutHP = arg1
    _G[slider_JudgementOutHP:GetName().."Text"]:SetText("目标生命 <".. MPPaladinTankSaved[ConfigCurrent].JudgementOutHP .." 不审判")
end)

postion_y = postion_y-45

-- 十字军打击时机
local slider_CrusaderStrikeTimer = CreateFrame("Slider", ADDON_NAME.."SliderCrusaderStrikeTimer", CatUISettingsPaladinTank, "OptionsSliderTemplate")
slider_CrusaderStrikeTimer:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
slider_CrusaderStrikeTimer:SetWidth(220) -- 拖动条长度
slider_CrusaderStrikeTimer:SetHeight(16) -- 拖动条高度

slider_CrusaderStrikeTimer:SetMinMaxValues(1, 180)
slider_CrusaderStrikeTimer:SetValueStep(1)
slider_CrusaderStrikeTimer:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_CrusaderStrikeTimer)

-- 值变化时的回调函数
slider_CrusaderStrikeTimer:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_CrusaderStrikeTimer:GetName().."Text"]:SetText(arg1.."秒后开启 十字军打击")
    MPPaladinTankSaved[ConfigCurrent].CrusaderStrikeTimer = arg1
end)


postion_y = postion_y-45


-- 奉献等级
local slider_Consecration_Level = CreateFrame("Slider", ADDON_NAME.."SliderConsecration_Level", CatUISettingsPaladinTank, "OptionsSliderTemplate")
slider_Consecration_Level:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 20, postion_y)
slider_Consecration_Level:SetWidth(220) -- 拖动条长度
slider_Consecration_Level:SetHeight(16) -- 拖动条高度

slider_Consecration_Level:SetMinMaxValues(0, 5)
slider_Consecration_Level:SetValueStep(1)
slider_Consecration_Level:SetValue(10) -- 默认值
MPCatUISliderRegionHide(slider_Consecration_Level)

-- 值变化时的回调函数
slider_Consecration_Level:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    if arg1==0 then
        _G[slider_Consecration_Level:GetName().."Text"]:SetText("奉献等级：自动")
    else
        _G[slider_Consecration_Level:GetName().."Text"]:SetText("奉献等级："..arg1)
    end
    MPPaladinTankSaved[ConfigCurrent].Consecration_Level = arg1
end)




-- 动态控制
local ButtonAutoSeal = CreateFrame("Button", ADDON_NAME.."ButtonAutoSeal", CatUISettingsPaladinTank, "UIPanelButtonTemplate")
ButtonAutoSeal:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 340, postion_y)
ButtonAutoSeal:SetWidth(100)
ButtonAutoSeal:SetHeight(22)
ButtonAutoSeal:SetFont("Fonts\\FRIZQT__.TTF", 12)
ButtonAutoSeal:SetText("审判控制")

ButtonAutoSeal:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
ButtonAutoSeal:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
ButtonAutoSeal:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
ButtonAutoSeal:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
ButtonAutoSeal:SetScript("OnClick", function()
    MPCatPaladinSealInit()
    if CatPaladinSeal:IsVisible() then
        CatPaladinSeal:Hide()
        MPPublicSaved.PaladinSealDisplay = 0
    else
        CatPaladinSeal:Show()
        MPPublicSaved.PaladinSealDisplay = 1
    end
end)



-- 创建按钮
local myButton = MPCreateButton(CatUISettingsPaladinTank, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetPaladinTankSettings(ConfigCurrent)
    MPInitPaladinTankSettings()

    MPCatPaladinSealReset()

    CatPaladinSeal:Hide()
    CatPaladinSeal:ClearAllPoints()
    CatPaladinSeal:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsPaladinTank, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsPaladinTank, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsPaladinTank, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsPaladinTank, "TOPLEFT", 440, -44)
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
    MPInitPaladinTankSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitPaladinTankSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitPaladinTankSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsPaladinTank)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Power = 1
    else
        MPPaladinTankSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinTankSaved[ConfigCurrent].Pick = 1
    else
        MPPaladinTankSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPaladinTank, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsPaladinTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPaladinTank, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFF58CBA/ptank|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local PaladinTankSettingsUIVersion = 21

function MPResetPaladinTankSettings(config)

    MPPaladinTankSaved.Version = PaladinTankSettingsUIVersion

    -- 基本配置

    MPPaladinTankSaved[config].Trinket_Upper = 1
    MPPaladinTankSaved[config].TUBoss = 0
    MPPaladinTankSaved[config].Trinket_Below = 1
    MPPaladinTankSaved[config].TBBoss = 0

    MPPaladinTankSaved[config].RighteousFury = 1
    MPPaladinTankSaved[config].Consecration = 1
    MPPaladinTankSaved[config].Consecration_Level = 0

    MPPaladinTankSaved[config].HolyShield = 1
    MPPaladinTankSaved[config].Exorcism = 1

    MPPaladinTankSaved[config].Target = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPPaladinTankSaved[config].HealthStone = 1
    MPPaladinTankSaved[config].HealthStone_Value = 30
    MPPaladinTankSaved[config].HerbalTea = 1
    MPPaladinTankSaved[config].HerbalTea_Value = 20
    MPPaladinTankSaved[config].HerbalTeaMana = 0
    MPPaladinTankSaved[config].HerbalTeaMana_Value = 20
    MPPaladinTankSaved[config].Righteous = 0
    MPPaladinTankSaved[config].Righteous_Value = 20
    MPPaladinTankSaved[config].LayHands = 0
    MPPaladinTankSaved[config].LayHands_Value = 10

    MPPaladinTankSaved[config].JudgementOutHP = 5000
    MPPaladinTankSaved[config].Seal = 1
    MPPaladinTankSaved[config].Seal_Value = 1


    MPPaladinTankSaved[config].CrusaderStrike = 0
    MPPaladinTankSaved[config].CrusaderStrikeTimer = 15


    -- SuperWoW,UnitXP
    MPPaladinTankSaved[config].SuperWoW = 1
    MPPaladinTankSaved[config].UnitXP = 1

    MPPaladinTankSaved[config].UnSalvation = 0
    MPPaladinTankSaved[config].HolyShieldTarget = 0
    MPPaladinTankSaved[config].Sanctuary = 0

    MPPaladinTankSaved[config].RacialTraits = 0
    MPPaladinTankSaved[config].RacialTraitsBoss = 1
    MPPaladinTankSaved[config].Soulspeed = 0
    MPPaladinTankSaved[config].SoulspeedBoss = 1
    MPPaladinTankSaved[config].SwipeFirst = 1

    -- 通用
    MPPaladinTankSaved[config].Power = 0
    MPPaladinTankSaved[config].Pick = 0

end


function InitPaladinTankSettingsPart1()
    checkButton_RighteousFury:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].RighteousFury))
    checkButton_Consecration:SetChecked( MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Consecration) )
    checkButton_HolyShield:SetChecked( MPToBoolean(MPPaladinTankSaved[ConfigCurrent].HolyShield) )
    checkButton_CrusaderStrike:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].CrusaderStrike))
    checkButton_Exorcism:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Exorcism))

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].TBBoss))
    checkButton_Target:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Target))

    checkButton_RacialTraits:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].SoulspeedBoss))

    checkButton_UnSalvation:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].UnSalvation))
    checkButton_HolyShieldTarget:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].HolyShieldTarget))
    checkButton_Sanctuary:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Sanctuary))

    checkButton_Power:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].Pick))
end

function InitPaladinTankSettingsPart2()
    checkButton_HealthStone:SetChecked(MPToBoolean(MPPaladinTankSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPPaladinTankSaved[ConfigCurrent].HealthStone_Value)
    if MPPaladinTankSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinTankSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPaladinTankSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPaladinTankSaved[ConfigCurrent].HerbalTea_Value)
    if MPPaladinTankSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinTankSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinTankSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")


    checkButton_Righteous:SetChecked(MPPaladinTankSaved[ConfigCurrent].Righteous)
    slider_Righteous:SetValue(MPPaladinTankSaved[ConfigCurrent].Righteous_Value)
    if MPPaladinTankSaved[ConfigCurrent].Righteous==1 then
        color_Righteous = "|cFFFFD100"
    else
        color_Righteous = "|cFF888888"
    end
    _G[slider_Righteous:GetName().."Text"]:SetText(color_Righteous.."血线: ".. MPPaladinTankSaved[ConfigCurrent].Righteous_Value .."%|r")


    checkButton_LayHands:SetChecked(MPPaladinTankSaved[ConfigCurrent].LayHands)
    slider_LayHands:SetValue(MPPaladinTankSaved[ConfigCurrent].LayHands_Value)
    if MPPaladinTankSaved[ConfigCurrent].LayHands==1 then
        color_LayHands = "|cFFFFD100"
    else
        color_LayHands = "|cFF888888"
    end
    _G[slider_LayHands:GetName().."Text"]:SetText(color_LayHands.."血线: ".. MPPaladinTankSaved[ConfigCurrent].LayHands_Value .."%|r")


    --[[ 前置审判
    checkButton_Judgement:SetChecked(MPPaladinTankSaved[ConfigCurrent].Judgement)
    slider_Judgement:SetValue(MPPaladinTankSaved[ConfigCurrent].Judgement_Value)
    if MPPaladinTankSaved[ConfigCurrent].Judgement==1 then
        color_Judgement = "|cFFFFD100"
    else
        color_Judgement = "|cFF888888"
    end
    if MPPaladinTankSaved[ConfigCurrent].Judgement_Value==0 then
        _G[slider_Judgement:GetName().."Text"]:SetText(color_Judgement.."正义审判")
    elseif MPPaladinTankSaved[ConfigCurrent].Judgement_Value==1 then
        _G[slider_Judgement:GetName().."Text"]:SetText(color_Judgement.."智慧审判")
    elseif MPPaladinTankSaved[ConfigCurrent].Judgement_Value==2 then
        _G[slider_Judgement:GetName().."Text"]:SetText(color_Judgement.."十字军审判")
    elseif MPPaladinTankSaved[ConfigCurrent].Judgement_Value==3 then
        _G[slider_Judgement:GetName().."Text"]:SetText(color_Judgement.."光明审判")
    end
    ]]

    slider_JudgementOutHP:SetValue(MPPaladinTankSaved[ConfigCurrent].JudgementOutHP)
    _G[slider_JudgementOutHP:GetName().."Text"]:SetText("目标生命 <".. MPPaladinTankSaved[ConfigCurrent].JudgementOutHP .." 不审判")


    --[[ 中段审判
    checkButton_MiddleJudgement:SetChecked(MPPaladinTankSaved[ConfigCurrent].MiddleJudgement)
    slider_MiddleJudgement:SetValue(MPPaladinTankSaved[ConfigCurrent].MiddleJudgement_Value)
    if MPPaladinTankSaved[ConfigCurrent].MiddleJudgement==1 then
        color_MiddleJudgement = "|cFFFFD100"
    else
        color_MiddleJudgement = "|cFF888888"
    end
    if MPPaladinTankSaved[ConfigCurrent].MiddleJudgement_Value==1 then
        _G[slider_MiddleJudgement:GetName().."Text"]:SetText(color_MiddleJudgement.."智慧审判")
    elseif MPPaladinTankSaved[ConfigCurrent].MiddleJudgement_Value==2 then
        _G[slider_MiddleJudgement:GetName().."Text"]:SetText(color_MiddleJudgement.."十字军审判")
    elseif MPPaladinTankSaved[ConfigCurrent].MiddleJudgement_Value==3 then
        _G[slider_MiddleJudgement:GetName().."Text"]:SetText(color_MiddleJudgement.."光明审判")
    end
    slider_MiddleJudgementTimer:SetValue(MPPaladinTankSaved[ConfigCurrent].MiddleJudgementTimer)
    _G[slider_MiddleJudgementTimer:GetName().."Text"]:SetText(color_MiddleJudgement.."约".. MPPaladinTankSaved[ConfigCurrent].MiddleJudgementTimer .."秒后 中段审判")
    ]]

    -- 奉献
    slider_Consecration_Level:SetValue(MPPaladinTankSaved[ConfigCurrent].Consecration_Level)

    slider_CrusaderStrikeTimer:SetValue(MPPaladinTankSaved[ConfigCurrent].CrusaderStrikeTimer)

end


function MPInitPaladinTankSettings()
    if not MPPaladinTankSaved then
        MPPaladinTankSaved = {}

        -- 第一套配置
        if not MPPaladinTankSaved[1] then
            MPPaladinTankSaved[1] = {}
            MPResetPaladinTankSettings(1)
        end

        -- 第二套配置
        if not MPPaladinTankSaved[2] then
            MPPaladinTankSaved[2] = {}
            MPResetPaladinTankSettings(2)
        end

        -- 第三套配置
        if not MPPaladinTankSaved[3] then
            MPPaladinTankSaved[3] = {}
            MPResetPaladinTankSettings(3)
        end
    end

    if MPPaladinTankSaved.Version ~= PaladinTankSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[防骑宏]当前配置，这是新版插件正常数据更新！|r")
        MPPaladinTankSaved[1] = {}
        MPPaladinTankSaved[2] = {}
        MPPaladinTankSaved[3] = {}
        MPResetPaladinTankSettings(1)
        MPResetPaladinTankSettings(2)
        MPResetPaladinTankSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitPaladinTankSettingsPart1()
    InitPaladinTankSettingsPart2()


end

