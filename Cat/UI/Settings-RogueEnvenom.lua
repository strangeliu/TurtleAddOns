
-- 定义插件名称
local ADDON_NAME = "Settings-RogueEnvenom"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsRogueEnvenom = MPCreateFrame(ADDON_NAME.."Frame", 520, 690, "|cFFFFF569设置 - 毒伤贼|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsRogueEnvenom:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 切割
local checkButton_SliceDice = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "开启 切割 (终结技)")
-- 设置点击事件
checkButton_SliceDice:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].SliceDice = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].SliceDice = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].TUBoss = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 割裂
local checkButton_Bloody = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "开启 割裂 (终结技)")
-- 设置点击事件
checkButton_Bloody:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Bloody = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Bloody = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].TBBoss = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].TBBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 毒伤
local checkButton_Envenom = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "开启 毒伤 (终结技)")
-- 设置点击事件
checkButton_Envenom:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Envenom = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Envenom = 0
    end
end)




-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Target = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Target = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 剔骨
local checkButton_Eviscerate = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "开启 剔骨 (终结技)")
-- 设置点击事件
checkButton_Eviscerate:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Eviscerate = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Eviscerate = 0
    end
end)


-- 创建单选框 - 鬼魅攻击
local checkButton_GhostlyStrike = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "启用 鬼魅攻击")
-- 设置点击事件
checkButton_GhostlyStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].GhostlyStrike = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].GhostlyStrike = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 佯攻
local checkButton_Feint = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "启用 佯攻 (需要TWT插件)")
checkButton_Feint:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Feint = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Feint = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 双刃毒袭
local checkButton_Backstab = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "|cFF888888启用 双刃毒袭 (不可关闭)|r")
checkButton_Backstab:Disable()
-- 设置点击事件
checkButton_Backstab:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Backstab = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Backstab = 0
    end
end)





postion_y = postion_y-30

-- 创建单选框 - 潜行
local checkButton_Stealth = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "潜行时自动 伏击/绞喉")
-- 设置点击事件
checkButton_Stealth:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Stealth = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Stealth = 0
    end
end)


-- 创建单选框 - 突袭
local checkButton_SurpriseStrike = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "启用 突袭")
-- 设置点击事件
checkButton_SurpriseStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].SurpriseStrike = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].SurpriseStrike = 0
    end
end)






-- 毒药


postion_y = postion_y+10

-- 添加提示内容区域
local TipText1 = CatUISettingsRogueEnvenom:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(450)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("毒药配置")




postion_y = postion_y-90

-- 主手
local checkButton_MainHand = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "主手")
checkButton_MainHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].MainHand = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].MainHand = 0
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
                MPRogueEnvenomSaved[ConfigCurrent].MainHand_Value = modes_MainHand[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_MainHand, Dropdown_Init_MainHand)
UIDropDownMenu_SetSelectedID(dropdown_MainHand, 1) -- 默认选中第一项


-- 主手毒药次数
local slider_MainHandCount = CreateFrame("Slider", ADDON_NAME.."Slider_MainHandCount", CatUISettingsRogueEnvenom, "OptionsSliderTemplate")
slider_MainHandCount:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y+20)
slider_MainHandCount:SetWidth(220) -- 拖动条长度
slider_MainHandCount:SetHeight(16) -- 拖动条高度

slider_MainHandCount:SetMinMaxValues(1, 100)
slider_MainHandCount:SetValueStep(1)
slider_MainHandCount:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_MainHandCount)

-- 值变化时的回调函数
slider_MainHandCount:SetScript("OnValueChanged", function()
    MPRogueEnvenomSaved[ConfigCurrent].MainHandCount = arg1
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..arg1.." 补充")
end)



-- 副手
local checkButton_OffHand = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "副手")
checkButton_OffHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].OffHand = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].OffHand = 0
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
                MPRogueEnvenomSaved[ConfigCurrent].OffHand_Value = modes_OffHand[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_OffHand, Dropdown_Init_OffHand)
UIDropDownMenu_SetSelectedID(dropdown_OffHand, 1) -- 默认选中第一项

-- 副手毒药次数
local slider_OffHandCount = CreateFrame("Slider", ADDON_NAME.."Slider_OffHandCount", CatUISettingsRogueEnvenom, "OptionsSliderTemplate")
slider_OffHandCount:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 275, postion_y+20)
slider_OffHandCount:SetWidth(220) -- 拖动条长度
slider_OffHandCount:SetHeight(16) -- 拖动条高度

slider_OffHandCount:SetMinMaxValues(1, 100)
slider_OffHandCount:SetValueStep(1)
slider_OffHandCount:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_OffHandCount)

-- 值变化时的回调函数
slider_OffHandCount:SetScript("OnValueChanged", function()
    MPRogueEnvenomSaved[ConfigCurrent].OffHandCount = arg1
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..arg1.." 补充")
end)


postion_y = postion_y-100

-- 脱战上毒
local checkButton_LeaveFight = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "补毒药 仅在脱离战斗时")
checkButton_LeaveFight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].LeaveFight = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].LeaveFight = 0
    end
end)

-- 覆盖旧毒药
local checkButton_Cover = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "覆盖原武器上不同的毒药")
checkButton_Cover:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Cover = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Cover = 0
    end
end)








-- 高级

postion_y = postion_y+50

-- 添加提示内容区域
local TipText1 = CatUISettingsRogueEnvenom:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-130


-- 创建单选框 - UnitXP
local checkButton_UnitXP = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "启用UnitXP模组 (朝向判断)")
-- 设置点击事件
checkButton_UnitXP:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].UnitXP = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].UnitXP = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPRogueEnvenomSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPRogueEnvenomSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 剑刃乱舞
local checkButton_BladeFlurry = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "自动 剑刃乱舞")

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
    MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry_Value = arg1
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry_Value .."码|r")
end)

-- 设置点击事件
checkButton_BladeFlurry:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry = 1
        color_BladeFlurry = "|cFFFFD100"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry_Value .."码|r")
    else
        MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry = 0
        color_BladeFlurry = "|cFF888888"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry_Value .."码|r")
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPRogueEnvenomSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPRogueEnvenomSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 保护剑刃乱舞
local checkButton_Protect = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "保护剑刃乱舞 自动取消无用Buff")
checkButton_Protect:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Protect = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Protect = 0
    end
end)


-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "自动 鞭根块茎")

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
    MPRogueEnvenomSaved[ConfigCurrent].Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].Carrot_Value .."%|r")
    else
        MPRogueEnvenomSaved[ConfigCurrent].Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].Carrot_Value .."%|r")
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 自动打断
local checkButton_Interrupt = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "自动 打断读条 (SuperWoW)")
-- 设置点击事件
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Interrupt = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Interrupt = 0
    end
end)



postion_y = postion_y-40

-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].RacialTraits = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Soulspeed = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)





-- 创建按钮
local myButton = MPCreateButton(CatUISettingsRogueEnvenom, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetRogueEnvenomSettings(ConfigCurrent)
    MPInitRogueEnvenomSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsRogueEnvenom, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsRogueEnvenom, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsRogueEnvenom, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 440, -44)
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
    MPInitRogueEnvenomSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitRogueEnvenomSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitRogueEnvenomSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsRogueEnvenom)

local checkButton_Power = MPPublicCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Power = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved[ConfigCurrent].Pick = 1
    else
        MPRogueEnvenomSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsRogueEnvenom:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsRogueEnvenom, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFFF569/dsdps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local RogueEnvenomSettingsUIVersion = 9

function MPResetRogueEnvenomSettings(config)

    MPRogueEnvenomSaved.Version = RogueEnvenomSettingsUIVersion

    -- 基本配置

    MPRogueEnvenomSaved[config].Trinket_Upper = 1
    MPRogueEnvenomSaved[config].TUBoss = 0
    MPRogueEnvenomSaved[config].Trinket_Below = 1
    MPRogueEnvenomSaved[config].TBBoss = 0
    MPRogueEnvenomSaved[config].Target = 0

    MPRogueEnvenomSaved[config].SliceDice = 1
    MPRogueEnvenomSaved[config].Bloody = 1
    MPRogueEnvenomSaved[config].Eviscerate = 1
    MPRogueEnvenomSaved[config].SurpriseStrike = 1
    MPRogueEnvenomSaved[config].GhostlyStrike = 0
    MPRogueEnvenomSaved[config].Backstab = 1
    MPRogueEnvenomSaved[config].Envenom = 1
    MPRogueEnvenomSaved[config].ExposeArmor = 0
    MPRogueEnvenomSaved[config].Stealth = 1
    MPRogueEnvenomSaved[config].Hemorrhage = 0
    MPRogueEnvenomSaved[config].Riposte = 0
    MPRogueEnvenomSaved[config].Feint = 0

    -- 毒药
    MPRogueEnvenomSaved[config].MainHand = 0
    MPRogueEnvenomSaved[config].OffHand = 0
    MPRogueEnvenomSaved[config].MainHand_Value = "溶解毒药 II"
    MPRogueEnvenomSaved[config].OffHand_Value = "溶解毒药 II"
    MPRogueEnvenomSaved[config].MainHandCount = 50
    MPRogueEnvenomSaved[config].OffHandCount = 50
    MPRogueEnvenomSaved[config].LeaveFight = 0
    MPRogueEnvenomSaved[config].Cover = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPRogueEnvenomSaved[config].HealthStone = 1
    MPRogueEnvenomSaved[config].HealthStone_Value = 30
    MPRogueEnvenomSaved[config].HerbalTea = 1
    MPRogueEnvenomSaved[config].HerbalTea_Value = 20
    MPRogueEnvenomSaved[config].Carrot = 0
    MPRogueEnvenomSaved[config].Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPRogueEnvenomSaved[config].SuperWoW = 1
    MPRogueEnvenomSaved[config].UnitXP = 0

    MPRogueEnvenomSaved[config].EvisceratePoint = 5
    MPRogueEnvenomSaved[config].EviscerateEnergy = 30
    MPRogueEnvenomSaved[config].BloodyPoint = 5
    MPRogueEnvenomSaved[config].EnvenomPoint = 1
    MPRogueEnvenomSaved[config].SliceDicePoint = 1

    MPRogueEnvenomSaved[config].Interrupt = 0
    MPRogueEnvenomSaved[config].RacialTraits = 0
    MPRogueEnvenomSaved[config].RacialTraitsBoss = 1
    MPRogueEnvenomSaved[config].Soulspeed = 0
    MPRogueEnvenomSaved[config].SoulspeedBoss = 1

    MPRogueEnvenomSaved[config].LeftTime = 1
    MPRogueEnvenomSaved[config].LeftTime_Value = 2

    MPRogueEnvenomSaved[config].BladeFlurry = 0
    MPRogueEnvenomSaved[config].BladeFlurry_Value = 10
    MPRogueEnvenomSaved[config].Protect = 0

    -- 通用
    MPRogueEnvenomSaved[config].Power = 0
    MPRogueEnvenomSaved[config].Pick = 0


end


local function InitRogueEnvenomSettingsPart1()
    checkButton_SliceDice:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].SliceDice))
    checkButton_Bloody:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Bloody))
    checkButton_Eviscerate:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Eviscerate))
    checkButton_SurpriseStrike:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].SurpriseStrike))
    checkButton_GhostlyStrike:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].GhostlyStrike))
    checkButton_Backstab:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Backstab))
    checkButton_Envenom:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Envenom))
    checkButton_Stealth:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Stealth))
    checkButton_Feint:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Feint))

    checkButton_Target:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Target))
    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].TBBoss))
    checkButton_UnitXP:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].UnitXP))

    checkButton_Interrupt:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Interrupt))
    checkButton_RacialTraits:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].SoulspeedBoss))

    checkButton_Protect:SetChecked(MPRogueEnvenomSaved[ConfigCurrent].Protect)

    checkButton_LeaveFight:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].LeaveFight))
    checkButton_Cover:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Cover))

    checkButton_Power:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].Pick))
end

function MPInitRogueEnvenomSettings()
    if not MPRogueEnvenomSaved then
        MPRogueEnvenomSaved = {}

        -- 第一套配置
        if not MPRogueEnvenomSaved[1] then
            MPRogueEnvenomSaved[1] = {}
            MPResetRogueEnvenomSettings(1)
        end

        -- 第二套配置
        if not MPRogueEnvenomSaved[2] then
            MPRogueEnvenomSaved[2] = {}
            MPResetRogueEnvenomSettings(2)
        end

        -- 第三套配置
        if not MPRogueEnvenomSaved[3] then
            MPRogueEnvenomSaved[3] = {}
            MPResetRogueEnvenomSettings(3)
        end
    end

    if MPRogueEnvenomSaved.Version ~= RogueEnvenomSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[毒伤贼宏]当前配置，这是新版插件正常数据更新！|r")
        MPRogueEnvenomSaved[1] = {}
        MPRogueEnvenomSaved[2] = {}
        MPRogueEnvenomSaved[3] = {}
        MPResetRogueEnvenomSettings(1)
        MPResetRogueEnvenomSettings(2)
        MPResetRogueEnvenomSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitRogueEnvenomSettingsPart1()



    checkButton_HealthStone:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPRogueEnvenomSaved[ConfigCurrent].HealthStone_Value)
    if MPRogueEnvenomSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].HealthStone_Value .."%|r")



    checkButton_HerbalTea:SetChecked(MPRogueEnvenomSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPRogueEnvenomSaved[ConfigCurrent].HerbalTea_Value)
    if MPRogueEnvenomSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPRogueEnvenomSaved[ConfigCurrent].Carrot)
    slider_Carrot:SetValue(MPRogueEnvenomSaved[ConfigCurrent].Carrot_Value)
    if MPRogueEnvenomSaved[ConfigCurrent].Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueEnvenomSaved[ConfigCurrent].Carrot_Value .."%|r")


    checkButton_BladeFlurry:SetChecked(MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry)
    slider_BladeFlurry_Value:SetValue(MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry_Value)
    if MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry==1 then
        color_BladeFlurry = "|cFFFFD100"
    else
        color_BladeFlurry = "|cFF888888"
    end
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueEnvenomSaved[ConfigCurrent].BladeFlurry_Value .."码|r")






    checkButton_MainHand:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].MainHand))
    for idx_MainHand, data_MainHand in pairs(modes_MainHand) do
        if string.find(data_MainHand.text, MPRogueEnvenomSaved[ConfigCurrent].MainHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_MainHand, data_MainHand.value)
            _G[dropdown_MainHand:GetName().."Text"]:SetText(data_MainHand.text)
        end
    end

    checkButton_OffHand:SetChecked(MPToBoolean(MPRogueEnvenomSaved[ConfigCurrent].OffHand))
    for idx_OffHand, data_OffHand in pairs(modes_OffHand) do
        if string.find(data_OffHand.text, MPRogueEnvenomSaved[ConfigCurrent].OffHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_OffHand, data_OffHand.value)
            _G[dropdown_OffHand:GetName().."Text"]:SetText(data_OffHand.text)
        end
    end

    slider_MainHandCount:SetValue(MPRogueEnvenomSaved[ConfigCurrent].MainHandCount)
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..MPRogueEnvenomSaved[ConfigCurrent].MainHandCount.." 补充")
    slider_OffHandCount:SetValue(MPRogueEnvenomSaved[ConfigCurrent].OffHandCount)
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..MPRogueEnvenomSaved[ConfigCurrent].OffHandCount.." 补充")

end

