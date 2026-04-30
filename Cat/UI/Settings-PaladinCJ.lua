
-- 定义插件名称
local ADDON_NAME = "Settings-PaladinCJ"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsPaladinCJ = MPCreateFrame(ADDON_NAME.."Frame", 520, 570, "|cFFF58CBA设置 - 惩戒骑|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPaladinCJ:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 圣洁光环
local checkButton_HolinessAura = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, postion_y, "保持 圣洁光环")
-- 设置点击事件
checkButton_HolinessAura:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].HolinessAura = 1
    else
        MPPaladinCJSaved[ConfigCurrent].HolinessAura = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].TUBoss = 1
    else
        MPPaladinCJSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奉献
local checkButton_Consecration = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, postion_y, "开启 奉献")
-- 设置点击事件
checkButton_Consecration:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Consecration=1
    else
        MPPaladinCJSaved[ConfigCurrent].Consecration=0
    end
    MPCatPaladinSealInit()
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].TBBoss = 1
    else
        MPPaladinCJSaved[ConfigCurrent].TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 忏悔
local checkButton_Repentance = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, postion_y, "开启 忏悔")
-- 设置点击事件
checkButton_Repentance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Repentance = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Repentance = 0
    end
end)
local checkButton_RepentanceBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RepentanceBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].RepentanceBoss = 1
    else
        MPPaladinCJSaved[ConfigCurrent].RepentanceBoss = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Target = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Target = 0
    end
end)

postion_y = postion_y-30


-- 创建单选框 - 驱邪术
local checkButton_Exorcism = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, postion_y, "开启 驱邪术 (亡灵,恶魔)")
-- 设置点击事件
checkButton_Exorcism:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Exorcism = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Exorcism = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 愤怒之锤
local checkButton_HammerWrath = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, postion_y, "开启 愤怒之锤")
-- 设置点击事件
checkButton_HammerWrath:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].HammerWrath = 1
    else
        MPPaladinCJSaved[ConfigCurrent].HammerWrath = 0
    end
end)
local checkButton_HammerWrathBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_HammerWrathBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].HammerWrathBoss = 1
    else
        MPPaladinCJSaved[ConfigCurrent].HammerWrathBoss = 0
    end
end)







-- 高级


postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsPaladinCJ:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-80


-- 创建单选框 - 使用 圣印
local checkButton_Seal = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, postion_y, "输出圣印")

local slider_Seal = CreateFrame("Slider", ADDON_NAME.."Slider_Seal", checkButton_Seal, "OptionsSliderTemplate")
slider_Seal:SetPoint("RIGHT", checkButton_Seal, "RIGHT", 244, -2)
slider_Seal:SetWidth(160) -- 拖动条长度
slider_Seal:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Seal:SetMinMaxValues(1, 3)
slider_Seal:SetValueStep(1)
slider_Seal:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_Seal)

local color_Seal = "|cFFFFD100"

-- 值变化时的回调函数
slider_Seal:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved[ConfigCurrent].Seal_Value = arg1
    if MPPaladinCJSaved[ConfigCurrent].Seal_Value==1 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."自动识别")
    elseif MPPaladinCJSaved[ConfigCurrent].Seal_Value==2 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."正义圣印")
    elseif MPPaladinCJSaved[ConfigCurrent].Seal_Value==3 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."命令圣印")
    end
end)

-- 设置点击事件
checkButton_Seal:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Seal = 1
        color_Seal = "|cFFFFD100"
        if MPPaladinCJSaved[ConfigCurrent].Seal_Value==1 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."自动识别")
        elseif MPPaladinCJSaved[ConfigCurrent].Seal_Value==2 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."正义圣印")
        elseif MPPaladinCJSaved[ConfigCurrent].Seal_Value==3 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."命令圣印")
        end
    else
        MPPaladinCJSaved[ConfigCurrent].Seal = 0
        color_Seal = "|cFF888888"
        if MPPaladinCJSaved[ConfigCurrent].Seal_Value==1 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."自动识别")
        elseif MPPaladinCJSaved[ConfigCurrent].Seal_Value==2 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."正义圣印")
        elseif MPPaladinCJSaved[ConfigCurrent].Seal_Value==3 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."命令圣印")
        end
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPPaladinCJSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinCJSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinCJSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPPaladinCJSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinCJSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 使用 神打/十打
local checkButton_Strike = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, postion_y, "输出技能")

local slider_Strike = CreateFrame("Slider", ADDON_NAME.."Slider_Strike", checkButton_Strike, "OptionsSliderTemplate")
slider_Strike:SetPoint("RIGHT", checkButton_Strike, "RIGHT", 244, -2)
slider_Strike:SetWidth(160) -- 拖动条长度
slider_Strike:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Strike:SetMinMaxValues(1, 4)
slider_Strike:SetValueStep(1)
slider_Strike:SetValue(2) -- 默认值
MPCatUISliderRegionHide(slider_Strike)

local color_Strike = "|cFFFFD100"

-- 值变化时的回调函数
slider_Strike:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved[ConfigCurrent].Strike_Value = arg1
    if MPPaladinCJSaved[ConfigCurrent].Strike_Value==1 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 神圣打击")
    elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==2 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 神圣打击 (均衡)")
    elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==3 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 十字军打击 (均衡)")
    elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==4 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 十字军打击")
    end
end)

-- 设置点击事件
checkButton_Strike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Strike = 1
        color_Strike = "|cFFFFD100"
        if MPPaladinCJSaved[ConfigCurrent].Strike_Value==1 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 神圣打击")
        elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==2 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 神圣打击 (均衡)")
        elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==3 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 十字军打击 (均衡)")
        elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==4 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 十字军打击")
        end
    else
        MPPaladinCJSaved[ConfigCurrent].Strike = 0
        color_Strike = "|cFF888888"
        if MPPaladinCJSaved[ConfigCurrent].Strike_Value==1 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 神圣打击")
        elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==2 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 神圣打击 (均衡)")
        elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==3 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 十字军打击 (均衡)")
        elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==4 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 十字军打击")
        end
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPPaladinCJSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinCJSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinCJSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPPaladinCJSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinCJSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 保护之手
local checkButton_Protection = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动 保护之手")

local slider_Protection = CreateFrame("Slider", ADDON_NAME.."Slider_Protection", checkButton_Protection, "OptionsSliderTemplate")
slider_Protection:SetPoint("RIGHT", checkButton_Protection, "RIGHT", 250, -2)
slider_Protection:SetWidth(150) -- 拖动条长度
slider_Protection:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Protection:SetMinMaxValues(0, 100)
slider_Protection:SetValueStep(1)
slider_Protection:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Protection)

local color_Protection = "|cFFFFD100"

-- 值变化时的回调函数
slider_Protection:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved[ConfigCurrent].Protection_Value = arg1
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinCJSaved[ConfigCurrent].Protection_Value .."%|r")
end)

-- 设置点击事件
checkButton_Protection:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Protection = 1
        color_Protection = "|cFFFFD100"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinCJSaved[ConfigCurrent].Protection_Value .."%|r")
    else
        MPPaladinCJSaved[ConfigCurrent].Protection = 0
        color_Protection = "|cFF888888"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinCJSaved[ConfigCurrent].Protection_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 圣盾术
local checkButton_DivineShield = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动 圣盾术")

local slider_DivineShield = CreateFrame("Slider", ADDON_NAME.."Slider_DivineShield", checkButton_DivineShield, "OptionsSliderTemplate")
slider_DivineShield:SetPoint("RIGHT", checkButton_DivineShield, "RIGHT", 250, -2)
slider_DivineShield:SetWidth(150) -- 拖动条长度
slider_DivineShield:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_DivineShield:SetMinMaxValues(0, 100)
slider_DivineShield:SetValueStep(1)
slider_DivineShield:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_DivineShield)

local color_DivineShield = "|cFFFFD100"

-- 值变化时的回调函数
slider_DivineShield:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved[ConfigCurrent].DivineShield_Value = arg1
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinCJSaved[ConfigCurrent].DivineShield_Value .."%|r")
end)

-- 设置点击事件
checkButton_DivineShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].DivineShield = 1
        color_DivineShield = "|cFFFFD100"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinCJSaved[ConfigCurrent].DivineShield_Value .."%|r")
    else
        MPPaladinCJSaved[ConfigCurrent].DivineShield = 0
        color_DivineShield = "|cFF888888"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinCJSaved[ConfigCurrent].DivineShield_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 圣契
local checkButton_Relic = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButtonSoulspeed", 20, postion_y, "目标血量<35%切换圣契")
checkButton_Relic:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Relic = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Relic = 0
    end
end)
local checkButton_RelicBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 240, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RelicBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].RelicBoss = 1
    else
        MPPaladinCJSaved[ConfigCurrent].RelicBoss = 0
    end
end)



-- 获取纹理元素（兼容所有版本）
local function GetDownMenuTex(dropdownIn, part)
    return _G[dropdownIn:GetName()..part.."Texture"] or _G[dropdownIn:GetName()..part]
end

-- 创建下拉菜单
local dropdown_Relic_Low = CreateFrame("Button", ADDON_NAME.."Dropdown_Relic_Low", checkButton_Relic, "UIDropDownMenuTemplate")
dropdown_Relic_Low:SetPoint("TOPLEFT", checkButton_Relic, "TOPLEFT", -12, -30)

local middle_Relic_Low = GetDownMenuTex(dropdown_Relic_Low, "Middle")
middle_Relic_Low:SetWidth(110) -- 主宽度
middle_Relic_Low:SetHeight(60) -- 主宽度

-- 定义选项（带固定索引的表）
local modes_Relic_Low = {
    [1] = {text = "|cFF9D38C8最终审判圣契|r", item="最终审判圣契", value = 1}
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Relic_Low()
    for idx, data in pairs(modes_Relic_Low) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_Relic_Low, index)
                MPPaladinCJSaved[ConfigCurrent].Relic_Low = modes_Relic_Low[index].item
            end
        end)(idx)
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Relic_Low, Dropdown_Init_Relic_Low)
UIDropDownMenu_SetSelectedID(dropdown_Relic_Low, 1) -- 默认选中第一项



-- 创建下拉菜单
local dropdown_Relic_Normal = CreateFrame("Button", ADDON_NAME.."CatModeDropdown_Relic_Normal", checkButton_Relic, "UIDropDownMenuTemplate")
dropdown_Relic_Normal:SetPoint("TOPLEFT", checkButton_Relic, "TOPLEFT", 130, -30)

local middle_Relic_Normal = GetDownMenuTex(dropdown_Relic_Normal, "Middle")
middle_Relic_Normal:SetWidth(110) -- 主宽度
middle_Relic_Normal:SetHeight(60) -- 主宽度



-- 定义选项（带固定索引的表）
local modes_Relic_Normal = {
    [1] = {text = "|cFF9D38C8永恒之塔圣契|r", item="永恒之塔圣契", value = 1},
    [2] = {text = "|cFF9D38C8热忱圣契|r", item="热忱圣契", value = 2},
    [3] = {text = "|cFF9D38C8神圣领域圣契|r", item="神圣领域圣契", value = 3},
    [4] = {text = "|cFF0070DD热情圣契|r", item="热情圣契", value = 4},
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Relic_Normal()
    for idx, data in pairs(modes_Relic_Normal) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_Relic_Normal, index)
                MPPaladinCJSaved[ConfigCurrent].Relic_Normal = modes_Relic_Normal[index].item
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Relic_Normal, Dropdown_Init_Relic_Normal)
UIDropDownMenu_SetSelectedID(dropdown_Relic_Normal, 1) -- 默认选中第一项












-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].RacialTraits = 1
    else
        MPPaladinCJSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPPaladinCJSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)



postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Soulspeed = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPPaladinCJSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)





postion_y = postion_y+210

-- 前置审判界限
local slider_JudgementOutHP = CreateFrame("Slider", ADDON_NAME.."SliderJudgementOutHP", CatUISettingsPaladinCJ, "OptionsSliderTemplate")
slider_JudgementOutHP:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
slider_JudgementOutHP:SetWidth(220) -- 拖动条长度
slider_JudgementOutHP:SetHeight(16) -- 拖动条高度

slider_JudgementOutHP:SetMinMaxValues(0, 50000)
slider_JudgementOutHP:SetValueStep(1000)
slider_JudgementOutHP:SetValue(300000) -- 默认值
MPCatUISliderRegionHide(slider_JudgementOutHP)

-- 值变化时的回调函数
slider_JudgementOutHP:SetScript("OnValueChanged", function()
    --print("Rip当前值:", arg1)
    MPPaladinCJSaved[ConfigCurrent].JudgementOutHP = arg1
    _G[slider_JudgementOutHP:GetName().."Text"]:SetText("目标生命 <".. MPPaladinCJSaved[ConfigCurrent].JudgementOutHP .." 不审判")
end)



postion_y = postion_y -40

-- 奉献等级
local slider_Consecration_Level = CreateFrame("Slider", ADDON_NAME.."SliderConsecration_Level", CatUISettingsPaladinCJ, "OptionsSliderTemplate")
slider_Consecration_Level:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
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
    MPPaladinCJSaved[ConfigCurrent].Consecration_Level = arg1
end)



postion_y = postion_y - 120

-- 动态控制
local ButtonAutoSeal = CreateFrame("Button", ADDON_NAME.."ButtonAutoSeal", CatUISettingsPaladinCJ, "UIPanelButtonTemplate")
ButtonAutoSeal:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y+10)
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
local myButton = MPCreateButton(CatUISettingsPaladinCJ, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetPaladinCJSettings(ConfigCurrent)
    MPInitPaladinCJSettings()

    MPCatPaladinSealReset()

    CatPaladinSeal:Hide()
    CatPaladinSeal:ClearAllPoints()
    CatPaladinSeal:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsPaladinCJ, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsPaladinCJ, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsPaladinCJ, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 440, -44)
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
    MPInitPaladinCJSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitPaladinCJSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitPaladinCJSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsPaladinCJ)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Power = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved[ConfigCurrent].Pick = 1
    else
        MPPaladinCJSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsPaladinCJ:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPaladinCJ, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFF58CBA/pdps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local PaladinCJSettingsUIVersion = 17

function MPResetPaladinCJSettings(config)

    MPPaladinCJSaved.Version = PaladinCJSettingsUIVersion

    -- 基本配置
    MPPaladinCJSaved[config].HolinessAura = 1
    MPPaladinCJSaved[config].Consecration = 1
    MPPaladinCJSaved[config].Consecration_Level = 0
    MPPaladinCJSaved[config].Repentance = 1
    MPPaladinCJSaved[config].RepentanceBoss = 1
    MPPaladinCJSaved[config].Exorcism = 1
    MPPaladinCJSaved[config].HammerWrath = 0
    MPPaladinCJSaved[config].HammerWrathBoss = 0

    MPPaladinCJSaved[config].Trinket_Upper = 1
    MPPaladinCJSaved[config].TUBoss = 0
    MPPaladinCJSaved[config].Trinket_Below = 1
    MPPaladinCJSaved[config].TBBoss = 0
    MPPaladinCJSaved[config].Target = 0

    -- 高级配置
    MPPaladinCJSaved[config].JudgementOutHP = 5000
    MPPaladinCJSaved[config].Seal = 1
    MPPaladinCJSaved[config].Seal_Value = 1

    MPPaladinCJSaved[config].Strike = 1
    MPPaladinCJSaved[config].Strike_Value = 3

    MPPaladinCJSaved[config].RacialTraits = 0
    MPPaladinCJSaved[config].RacialTraitsBoss = 1
    MPPaladinCJSaved[config].Soulspeed = 0
    MPPaladinCJSaved[config].SoulspeedBoss = 1
    
    -- 圣契
    MPPaladinCJSaved[config].Relic = 0
    MPPaladinCJSaved[config].Relic_Low = "最终审判圣契"
    MPPaladinCJSaved[config].Relic_Normal = "永恒之塔圣契"
    MPPaladinCJSaved[config].RelicBoss = 0

    -- 治疗石、糖水茶
    MPPaladinCJSaved[config].HealthStone = 1
    MPPaladinCJSaved[config].HealthStone_Value = 30
    MPPaladinCJSaved[config].HerbalTea = 1
    MPPaladinCJSaved[config].HerbalTea_Value = 20
    MPPaladinCJSaved[config].HerbalTeaMana = 0
    MPPaladinCJSaved[config].HerbalTeaMana_Value = 20

    MPPaladinCJSaved[config].Protection = 0
    MPPaladinCJSaved[config].Protection_Value = 10
    MPPaladinCJSaved[config].DivineShield = 0
    MPPaladinCJSaved[config].DivineShield_Value = 10

    -- SuperWoW,UnitXP
    MPPaladinCJSaved[config].SuperWoW = 1
    MPPaladinCJSaved[config].UnitXP = 1


    -- 通用
    MPPaladinCJSaved[config].Power = 0
    MPPaladinCJSaved[config].Pick = 0

end


function InitPaladinCJSetPart1()
    checkButton_HolinessAura:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].HolinessAura))

    checkButton_Consecration:SetChecked( MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Consecration) )
    checkButton_Repentance:SetChecked( MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Repentance) )

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].TBBoss))

    checkButton_Target:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Target))
    checkButton_Exorcism:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Exorcism))
    checkButton_HammerWrath:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].HammerWrath))


    checkButton_HealthStone:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPPaladinCJSaved[ConfigCurrent].HealthStone_Value)
    if MPPaladinCJSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinCJSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPaladinCJSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPPaladinCJSaved[ConfigCurrent].HerbalTea_Value)
    if MPPaladinCJSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinCJSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinCJSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")



    checkButton_Protection:SetChecked(MPPaladinCJSaved[ConfigCurrent].Protection)
    slider_Protection:SetValue(MPPaladinCJSaved[ConfigCurrent].Protection_Value)
    if MPPaladinCJSaved[ConfigCurrent].Protection==1 then
        color_Protection = "|cFFFFD100"
    else
        color_Protection = "|cFF888888"
    end
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinCJSaved[ConfigCurrent].Protection_Value .."%|r")


    checkButton_DivineShield:SetChecked(MPPaladinCJSaved[ConfigCurrent].DivineShield)
    slider_DivineShield:SetValue(MPPaladinCJSaved[ConfigCurrent].DivineShield_Value)
    if MPPaladinCJSaved[ConfigCurrent].DivineShield==1 then
        color_DivineShield = "|cFFFFD100"
    else
        color_DivineShield = "|cFF888888"
    end
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinCJSaved[ConfigCurrent].DivineShield_Value .."%|r")
end


function InitPaladinCJSetPart2()
    checkButton_Seal:SetChecked(MPPaladinCJSaved[ConfigCurrent].Seal)
    slider_Seal:SetValue(MPPaladinCJSaved[ConfigCurrent].Seal_Value)
    if MPPaladinCJSaved[ConfigCurrent].Seal==1 then
        color_Seal = "|cFFFFD100"
    else
        color_Seal = "|cFF888888"
    end
    if MPPaladinCJSaved[ConfigCurrent].Seal_Value==1 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."自动识别")
    elseif MPPaladinCJSaved[ConfigCurrent].Seal_Value==2 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."正义圣印")
    elseif MPPaladinCJSaved[ConfigCurrent].Seal_Value==3 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."命令圣印")
    end

    checkButton_Strike:SetChecked(MPPaladinCJSaved[ConfigCurrent].Strike)
    slider_Strike:SetValue(MPPaladinCJSaved[ConfigCurrent].Strike_Value)
    if MPPaladinCJSaved[ConfigCurrent].Strike==1 then
        color_Strike = "|cFFFFD100"
    else
        color_Strike = "|cFF888888"
    end
    if MPPaladinCJSaved[ConfigCurrent].Strike_Value==1 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 神圣打击")
    elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==2 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 神圣打击 (均衡)")
    elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==3 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 十字军打击 (均衡)")
    elseif MPPaladinCJSaved[ConfigCurrent].Strike_Value==4 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 十字军打击")
    end


    checkButton_Relic:SetChecked(MPPaladinCJSaved[ConfigCurrent].Relic)
    for idx_Relic_Low, data_Relic_Low in pairs(modes_Relic_Low) do
        if string.find(data_Relic_Low.text,MPPaladinCJSaved[ConfigCurrent].Relic_Low) then
            UIDropDownMenu_SetSelectedID(dropdown_Relic_Low, data_Relic_Low.value)
            _G[dropdown_Relic_Low:GetName().."Text"]:SetText(data_Relic_Low.text)
        end
    end
    checkButton_RelicBoss:SetChecked(MPPaladinCJSaved[ConfigCurrent].RelicBoss)

    for idx_Relic_Normal, data_Relic_Normal in pairs(modes_Relic_Normal) do
        if string.find(data_Relic_Normal.text,MPPaladinCJSaved[ConfigCurrent].Relic_Normal) then
            UIDropDownMenu_SetSelectedID(dropdown_Relic_Normal, modes_Relic_Normal[idx_Relic_Normal].value)
            _G[dropdown_Relic_Normal:GetName().."Text"]:SetText(data_Relic_Normal.text)
        end
    end


    slider_JudgementOutHP:SetValue(MPPaladinCJSaved[ConfigCurrent].JudgementOutHP)
    _G[slider_JudgementOutHP:GetName().."Text"]:SetText("目标生命 <".. MPPaladinCJSaved[ConfigCurrent].JudgementOutHP .." 不审判")

    checkButton_RacialTraits:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].SoulspeedBoss))

    slider_Consecration_Level:SetValue(MPPaladinCJSaved[ConfigCurrent].Consecration_Level)

    checkButton_Power:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPPaladinCJSaved[ConfigCurrent].Pick))
end

function MPInitPaladinCJSettings()
    if not MPPaladinCJSaved then
        MPPaladinCJSaved = {}

        -- 第一套配置
        if not MPPaladinCJSaved[1] then
            MPPaladinCJSaved[1] = {}
            MPResetPaladinCJSettings(1)
        end

        -- 第二套配置
        if not MPPaladinCJSaved[2] then
            MPPaladinCJSaved[2] = {}
            MPResetPaladinCJSettings(2)
        end

        -- 第三套配置
        if not MPPaladinCJSaved[3] then
            MPPaladinCJSaved[3] = {}
            MPResetPaladinCJSettings(3)
        end
    end

    if MPPaladinCJSaved.Version ~= PaladinCJSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[惩戒骑宏]当前配置，这是新版插件正常数据更新！|r")
        MPPaladinCJSaved[1] = {}
        MPPaladinCJSaved[2] = {}
        MPPaladinCJSaved[3] = {}
        MPResetPaladinCJSettings(1)
        MPResetPaladinCJSettings(2)
        MPResetPaladinCJSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)


    InitPaladinCJSetPart1()
    InitPaladinCJSetPart2()

end

