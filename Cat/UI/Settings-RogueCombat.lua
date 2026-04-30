
-- 定义插件名称
local ADDON_NAME = "Settings-RogueCombat"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsRogueCombat = MPCreateFrame(ADDON_NAME.."Frame", 520, 690, "|cFFFFF569设置 - 战斗贼|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsRogueCombat:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 切割
local checkButton_SliceDice = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "开启 切割 (终结技)")
-- 设置点击事件
checkButton_SliceDice:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].SliceDice = 1
    else
        MPRogueCombatSaved[ConfigCurrent].SliceDice = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].TUBoss = 1
    else
        MPRogueCombatSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 割裂
local checkButton_Bloody = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "开启 割裂 (终结技)")
-- 设置点击事件
checkButton_Bloody:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Bloody = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Bloody = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].TBBoss = 1
    else
        MPRogueCombatSaved[ConfigCurrent].TBBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 毒伤
local checkButton_Envenom = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "开启 毒伤 (终结技)")
-- 设置点击事件
checkButton_Envenom:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Envenom = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Envenom = 0
    end
end)




-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Target = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Target = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 剔骨
local checkButton_Eviscerate = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "开启 剔骨 (终结技)")
-- 设置点击事件
checkButton_Eviscerate:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Eviscerate = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Eviscerate = 0
    end
end)


-- 创建单选框 - 鬼魅攻击
local checkButton_GhostlyStrike = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "启用 鬼魅攻击")
-- 设置点击事件
checkButton_GhostlyStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].GhostlyStrike = 1
    else
        MPRogueCombatSaved[ConfigCurrent].GhostlyStrike = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 还击
local checkButton_Riposte = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "启用 还击")
-- 设置点击事件
checkButton_Riposte:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Riposte = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Riposte = 0
    end
end)



postion_y = postion_y-30




-- 创建单选框 - 背刺攻击
local checkButton_Backstab = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "启用 背刺 (自动识别匕首)")
-- 设置点击事件
checkButton_Backstab:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Backstab = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Backstab = 0
    end
end)



-- 创建单选框 - 突袭
local checkButton_SurpriseStrike = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "启用 突袭")
-- 设置点击事件
checkButton_SurpriseStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].SurpriseStrike = 1
    else
        MPRogueCombatSaved[ConfigCurrent].SurpriseStrike = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 潜行
local checkButton_Stealth = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "潜行时自动 伏击/绞喉")
-- 设置点击事件
checkButton_Stealth:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Stealth = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Stealth = 0
    end
end)

-- 创建单选框 - 佯攻
local checkButton_Feint = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "启用 佯攻 (需要TWT插件)")
checkButton_Feint:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Feint = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Feint = 0
    end
end)




-- 毒药


postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsRogueCombat:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(450)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("毒药配置")




postion_y = postion_y-90

-- 主手
local checkButton_MainHand = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "主手")
checkButton_MainHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].MainHand = 1
    else
        MPRogueCombatSaved[ConfigCurrent].MainHand = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_MainHand = {
    [1] = {text = "溶解毒药 II", value = 1},
    [2] = {text = "速效毒药 VI", value = 2},
    [3] = {text = "腐蚀毒药 II", value = 3},
    [4] = {text = "致命毒药 V",   value = 4},
    [5] = {text = "致命毒药 IV",   value = 5},
    [6] = {text = "麻痹毒药 III",   value = 6},
    [7] = {text = "致残毒药 II",   value = 7},
    [8] = {text = "致伤毒药",   value = 8},
}

-- 创建下拉菜单
local dropdown_MainHand = CreateFrame("Button", ADDON_NAME.."Dropdown_MainHand", checkButton_MainHand, "UIDropDownMenuTemplate")
dropdown_MainHand:SetPoint("TOPLEFT", checkButton_MainHand, "TOPLEFT", 80, 0)

-- 菜单初始化
local function Dropdown_Init_MainHand()
    for idx, data in pairs(modes_MainHand) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_MainHand, index)
                MPRogueCombatSaved[ConfigCurrent].MainHand_Value = modes_MainHand[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_MainHand, Dropdown_Init_MainHand)
UIDropDownMenu_SetSelectedID(dropdown_MainHand, 1) -- 默认选中第一项


-- 主手毒药次数
local slider_MainHandCount = CreateFrame("Slider", ADDON_NAME.."Slider_MainHandCount", CatUISettingsRogueCombat, "OptionsSliderTemplate")
slider_MainHandCount:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y+20)
slider_MainHandCount:SetWidth(220) -- 拖动条长度
slider_MainHandCount:SetHeight(16) -- 拖动条高度

slider_MainHandCount:SetMinMaxValues(1, 100)
slider_MainHandCount:SetValueStep(1)
slider_MainHandCount:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_MainHandCount)

-- 值变化时的回调函数
slider_MainHandCount:SetScript("OnValueChanged", function()
    MPRogueCombatSaved[ConfigCurrent].MainHandCount = arg1
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..arg1.." 补充")
end)



-- 副手
local checkButton_OffHand = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "副手")
checkButton_OffHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].OffHand = 1
    else
        MPRogueCombatSaved[ConfigCurrent].OffHand = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_OffHand = {
    [1] = {text = "溶解毒药 II", value = 1},
    [2] = {text = "速效毒药 VI", value = 2},
    [3] = {text = "腐蚀毒药 II", value = 3},
    [4] = {text = "致命毒药 V",   value = 4},
    [5] = {text = "致命毒药 IV",   value = 5},
    [6] = {text = "麻痹毒药 III",   value = 6},
    [7] = {text = "致残毒药 II",   value = 7},
    [8] = {text = "致伤毒药",   value = 8},
}

-- 创建下拉菜单
local dropdown_OffHand = CreateFrame("Button", ADDON_NAME.."Dropdown_OffHand", checkButton_OffHand, "UIDropDownMenuTemplate")
dropdown_OffHand:SetPoint("TOPLEFT", checkButton_OffHand, "TOPLEFT", 80, 0)

-- 菜单初始化
local function Dropdown_Init_OffHand()
    for idx, data in pairs(modes_OffHand) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_OffHand, index)
                MPRogueCombatSaved[ConfigCurrent].OffHand_Value = modes_OffHand[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_OffHand, Dropdown_Init_OffHand)
UIDropDownMenu_SetSelectedID(dropdown_OffHand, 1) -- 默认选中第一项

-- 副手毒药次数
local slider_OffHandCount = CreateFrame("Slider", ADDON_NAME.."Slider_OffHandCount", CatUISettingsRogueCombat, "OptionsSliderTemplate")
slider_OffHandCount:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 275, postion_y+20)
slider_OffHandCount:SetWidth(220) -- 拖动条长度
slider_OffHandCount:SetHeight(16) -- 拖动条高度

slider_OffHandCount:SetMinMaxValues(1, 100)
slider_OffHandCount:SetValueStep(1)
slider_OffHandCount:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_OffHandCount)

-- 值变化时的回调函数
slider_OffHandCount:SetScript("OnValueChanged", function()
    MPRogueCombatSaved[ConfigCurrent].OffHandCount = arg1
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..arg1.." 补充")
end)


postion_y = postion_y-100

-- 脱战上毒
local checkButton_LeaveFight = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "补毒药 仅在脱离战斗时")
checkButton_LeaveFight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].LeaveFight = 1
    else
        MPRogueCombatSaved[ConfigCurrent].LeaveFight = 0
    end
end)

-- 覆盖旧毒药
local checkButton_Cover = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "覆盖原武器上不同的毒药")
checkButton_Cover:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Cover = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Cover = 0
    end
end)






-- 高级



postion_y = postion_y+50

-- 添加提示内容区域
local TipText1 = CatUISettingsRogueCombat:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-130


-- 创建单选框 - UnitXP
local checkButton_UnitXP = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "启用UnitXP模组 (朝向判断)")
-- 设置点击事件
checkButton_UnitXP:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].UnitXP = 1
    else
        MPRogueCombatSaved[ConfigCurrent].UnitXP = 0
    end
end)




-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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

-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPRogueCombatSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueCombatSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueCombatSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPRogueCombatSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueCombatSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 剑刃乱舞
local checkButton_BladeFlurry = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "自动 剑刃乱舞")

local slider_BladeFlurry_Value = CreateFrame("Slider", ADDON_NAME.."Slider_BladeFlurry_Value", checkButton_BladeFlurry, "OptionsSliderTemplate")
slider_BladeFlurry_Value:SetPoint("RIGHT", checkButton_BladeFlurry, "RIGHT", 260, -2)
slider_BladeFlurry_Value:SetWidth(150) -- 拖动条长度
slider_BladeFlurry_Value:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_BladeFlurry_Value:SetMinMaxValues(5, 20)
slider_BladeFlurry_Value:SetValueStep(1)
slider_BladeFlurry_Value:SetValue(8) -- 默认值
MPCatUISliderRegionHide(slider_BladeFlurry_Value)

local color_BladeFlurry = "|cFFFFD100"

-- 值变化时的回调函数
slider_BladeFlurry_Value:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPRogueCombatSaved[ConfigCurrent].BladeFlurry_Value = arg1
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueCombatSaved[ConfigCurrent].BladeFlurry_Value .."码|r")
end)

-- 设置点击事件
checkButton_BladeFlurry:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].BladeFlurry = 1
        color_BladeFlurry = "|cFFFFD100"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueCombatSaved[ConfigCurrent].BladeFlurry_Value .."码|r")
    else
        MPRogueCombatSaved[ConfigCurrent].BladeFlurry = 0
        color_BladeFlurry = "|cFF888888"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueCombatSaved[ConfigCurrent].BladeFlurry_Value .."码|r")
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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

-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPRogueCombatSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueCombatSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueCombatSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPRogueCombatSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueCombatSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40



-- 创建单选框 - 背刺 改 邪恶
local checkButton_SinisterStrike = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "背刺 不可用时启用 邪恶攻击")
-- 设置点击事件
checkButton_SinisterStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].SinisterStrike = 1
    else
        MPRogueCombatSaved[ConfigCurrent].SinisterStrike = 0
    end
end)


-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "自动 鞭根块茎")

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

-- 值变化时的回调函数
slider_Carrot:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPRogueCombatSaved[ConfigCurrent].Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueCombatSaved[ConfigCurrent].Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueCombatSaved[ConfigCurrent].Carrot_Value .."%|r")
    else
        MPRogueCombatSaved[ConfigCurrent].Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueCombatSaved[ConfigCurrent].Carrot_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 保护剑刃乱舞
local checkButton_Protect = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "保护剑刃乱舞 自动取消无用Buff")
-- 设置点击事件
checkButton_Protect:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Protect = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Protect = 0
    end
end)


-- 创建单选框 - 自动打断
local checkButton_Interrupt = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "自动 打断读条 (SuperWoW)")
-- 设置点击事件
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Interrupt = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Interrupt = 0
    end
end)



postion_y = postion_y-40

-- 创建单选框 - 冲动
local checkButton_Impulse = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "自动 冲动")
checkButton_Impulse:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Impulse = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Impulse = 0
    end
end)
local checkButton_ImpulseBoss = MPCreateCheckButtonSmall(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_ImpulseBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarlockAffSaved[ConfigCurrent].ImpulseBoss = 1
    else
        MPWarlockAffSaved[ConfigCurrent].ImpulseBoss = 0
    end
end)


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].RacialTraits = 1
    else
        MPRogueCombatSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPRogueCombatSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Soulspeed = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPRogueCombatSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)




-- 创建按钮
local myButton = MPCreateButton(CatUISettingsRogueCombat, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetRogueCombatSettings(ConfigCurrent)
    MPInitRogueCombatSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsRogueCombat, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsRogueCombat, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsRogueCombat, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 440, -44)
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
    MPInitRogueCombatSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitRogueCombatSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitRogueCombatSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsRogueCombat)

local checkButton_Power = MPPublicCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Power = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Power = 0
    end
end)



local ButtonPower = MPPublicButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved[ConfigCurrent].Pick = 1
    else
        MPRogueCombatSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsRogueCombat:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsRogueCombat, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFFF569/zddps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local RogueCombatSettingsUIVersion = 14

function MPResetRogueCombatSettings(config)

    MPRogueCombatSaved.Version = RogueCombatSettingsUIVersion

    -- 基本配置

    MPRogueCombatSaved[config].Trinket_Upper = 1
    MPRogueCombatSaved[config].TUBoss = 0
    MPRogueCombatSaved[config].Trinket_Below = 1
    MPRogueCombatSaved[config].TBBoss = 0
    MPRogueCombatSaved[config].Target = 0

    MPRogueCombatSaved[config].SliceDice = 1
    MPRogueCombatSaved[config].Bloody = 1
    MPRogueCombatSaved[config].Eviscerate = 1
    MPRogueCombatSaved[config].SurpriseStrike = 0
    MPRogueCombatSaved[config].GhostlyStrike = 0
    MPRogueCombatSaved[config].Backstab = 1
    MPRogueCombatSaved[config].Envenom = 1
    MPRogueCombatSaved[config].ExposeArmor = 0
    MPRogueCombatSaved[config].Stealth = 1
    MPRogueCombatSaved[config].Hemorrhage = 0
    MPRogueCombatSaved[config].Riposte = 0
    MPRogueCombatSaved[config].Feint = 0

    -- 毒药
    MPRogueCombatSaved[config].MainHand = 0
    MPRogueCombatSaved[config].OffHand = 0
    MPRogueCombatSaved[config].MainHand_Value = "溶解毒药 II"
    MPRogueCombatSaved[config].OffHand_Value = "溶解毒药 II"
    MPRogueCombatSaved[config].MainHandCount = 50
    MPRogueCombatSaved[config].OffHandCount = 50
    MPRogueCombatSaved[config].LeaveFight = 0
    MPRogueCombatSaved[config].Cover = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPRogueCombatSaved[config].HealthStone = 1
    MPRogueCombatSaved[config].HealthStone_Value = 30
    MPRogueCombatSaved[config].HerbalTea = 1
    MPRogueCombatSaved[config].HerbalTea_Value = 20
    MPRogueCombatSaved[config].Carrot = 0
    MPRogueCombatSaved[config].Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPRogueCombatSaved[config].SuperWoW = 1
    MPRogueCombatSaved[config].UnitXP = 0

    MPRogueCombatSaved[config].EvisceratePoint = 5
    MPRogueCombatSaved[config].EviscerateEnergy = 30
    MPRogueCombatSaved[config].BloodyPoint = 5
    MPRogueCombatSaved[config].EnvenomPoint = 1
    MPRogueCombatSaved[config].SliceDicePoint = 1

    MPRogueCombatSaved[config].Interrupt = 0

    MPRogueCombatSaved[config].RacialTraits = 0
    MPRogueCombatSaved[config].RacialTraitsBoss = 1
    MPRogueCombatSaved[config].Soulspeed = 0
    MPRogueCombatSaved[config].SoulspeedBoss = 1

    MPRogueCombatSaved[config].LeftTime = 1
    MPRogueCombatSaved[config].LeftTime_Value = 2

    MPRogueCombatSaved[config].BladeFlurry = 0
    MPRogueCombatSaved[config].BladeFlurry_Value = 10
    MPRogueCombatSaved[config].Protect = 0
    MPRogueCombatSaved[config].Impulse = 0
    MPRogueCombatSaved[config].ImpulseBoss = 1
    MPRogueCombatSaved[config].SinisterStrike = 1

    -- 通用
    MPRogueCombatSaved[config].Power = 0
    MPRogueCombatSaved[config].Pick = 0


end

local function InitRogueCombatSettingsPart1()
    checkButton_SliceDice:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].SliceDice))
    checkButton_Bloody:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Bloody))
    checkButton_Eviscerate:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Eviscerate))
    checkButton_SurpriseStrike:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].SurpriseStrike))
    checkButton_GhostlyStrike:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].GhostlyStrike))
    checkButton_Backstab:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Backstab))
    checkButton_Envenom:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Envenom))
    checkButton_Stealth:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Stealth))
    checkButton_Riposte:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Riposte))
    checkButton_Feint:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Feint))

    checkButton_Target:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Target))
    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].TBBoss))
    checkButton_UnitXP:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].UnitXP))

    checkButton_Interrupt:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Interrupt))
    checkButton_RacialTraits:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].SoulspeedBoss))

    checkButton_Protect:SetChecked(MPRogueCombatSaved[ConfigCurrent].Protect)
    checkButton_Impulse:SetChecked(MPRogueCombatSaved[ConfigCurrent].Impulse)
    checkButton_ImpulseBoss:SetChecked(MPRogueCombatSaved[ConfigCurrent].ImpulseBoss)
    checkButton_SinisterStrike:SetChecked(MPRogueCombatSaved[ConfigCurrent].SinisterStrike)

    checkButton_LeaveFight:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].LeaveFight))
    checkButton_Cover:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Cover))

    checkButton_Power:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].Pick))
end

function MPInitRogueCombatSettings()
    if not MPRogueCombatSaved then
        MPRogueCombatSaved = {}

        -- 第一套配置
        if not MPRogueCombatSaved[1] then
            MPRogueCombatSaved[1] = {}
            MPResetRogueCombatSettings(1)
        end

        -- 第二套配置
        if not MPRogueCombatSaved[2] then
            MPRogueCombatSaved[2] = {}
            MPResetRogueCombatSettings(2)
        end

        -- 第三套配置
        if not MPRogueCombatSaved[3] then
            MPRogueCombatSaved[3] = {}
            MPResetRogueCombatSettings(3)
        end
    end

    if MPRogueCombatSaved.Version ~= RogueCombatSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[战斗贼宏]当前配置，这是新版插件正常数据更新！|r")
        MPRogueCombatSaved[1] = {}
        MPRogueCombatSaved[2] = {}
        MPRogueCombatSaved[3] = {}
        MPResetRogueCombatSettings(1)
        MPResetRogueCombatSettings(2)
        MPResetRogueCombatSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitRogueCombatSettingsPart1()



    checkButton_HealthStone:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPRogueCombatSaved[ConfigCurrent].HealthStone_Value)
    if MPRogueCombatSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueCombatSaved[ConfigCurrent].HealthStone_Value .."%|r")


    checkButton_HerbalTea:SetChecked(MPRogueCombatSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPRogueCombatSaved[ConfigCurrent].HerbalTea_Value)
    if MPRogueCombatSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueCombatSaved[ConfigCurrent].HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPRogueCombatSaved[ConfigCurrent].Carrot)
    slider_Carrot:SetValue(MPRogueCombatSaved[ConfigCurrent].Carrot_Value)
    if MPRogueCombatSaved[ConfigCurrent].Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueCombatSaved[ConfigCurrent].Carrot_Value .."%|r")

    checkButton_BladeFlurry:SetChecked(MPRogueCombatSaved[ConfigCurrent].BladeFlurry)
    slider_BladeFlurry_Value:SetValue(MPRogueCombatSaved[ConfigCurrent].BladeFlurry_Value)
    if MPRogueCombatSaved[ConfigCurrent].BladeFlurry==1 then
        color_BladeFlurry = "|cFFFFD100"
    else
        color_BladeFlurry = "|cFF888888"
    end
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueCombatSaved[ConfigCurrent].BladeFlurry_Value .."码|r")



    checkButton_MainHand:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].MainHand))
    for idx_MainHand, data_MainHand in pairs(modes_MainHand) do
        if string.find(data_MainHand.text, MPRogueCombatSaved[ConfigCurrent].MainHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_MainHand, data_MainHand.value)
            _G[dropdown_MainHand:GetName().."Text"]:SetText(data_MainHand.text)
        end
    end

    checkButton_OffHand:SetChecked(MPToBoolean(MPRogueCombatSaved[ConfigCurrent].OffHand))
    for idx_OffHand, data_OffHand in pairs(modes_OffHand) do
        if string.find(data_OffHand.text, MPRogueCombatSaved[ConfigCurrent].OffHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_OffHand, data_OffHand.value)
            _G[dropdown_OffHand:GetName().."Text"]:SetText(data_OffHand.text)
        end
    end

    slider_MainHandCount:SetValue(MPRogueCombatSaved[ConfigCurrent].MainHandCount)
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..MPRogueCombatSaved[ConfigCurrent].MainHandCount.." 补充")
    slider_OffHandCount:SetValue(MPRogueCombatSaved[ConfigCurrent].OffHandCount)
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..MPRogueCombatSaved[ConfigCurrent].OffHandCount.." 补充")

end

