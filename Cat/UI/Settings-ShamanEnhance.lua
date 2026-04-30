
-- 定义插件名称
local ADDON_NAME = "Settings-ShamanEnhance"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsShamanEnhanceWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 690, "|cFF0070DE设置 - 增强萨|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsShamanEnhanceWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 大地震击
local checkButton_EarthShock = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 大地震击")
-- 大地震击设置点击事件
checkButton_EarthShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].EarthShock = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].EarthShock = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].TUBoss = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 冰霜震击
local checkButton_FrostShock = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 冰霜震击")
-- 大地震击设置点击事件
checkButton_FrostShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].FrostShock = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].FrostShock = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].Trinket_Below = 0
    end
end)

local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].TBBoss = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].TBBoss = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 烈焰震击
local checkButton_FlameShock = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 烈焰震击")
-- 设置点击事件
checkButton_FlameShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].FlameShock = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].FlameShock = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].Target = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].Target = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 闪电之盾
local checkButton_LightningShield = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 闪电之盾 (单选)")


-- 创建单选框 - 武器强化
local checkButton_WEnhance = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "武器强化")
-- 设置点击事件
checkButton_WEnhance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].WEnhance = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].WEnhance = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_WEnhance = {
    [1] = {text = "冰封武器", value = 1},
    [2] = {text = "火舌武器", value = 2},
    [3] = {text = "石化武器", value = 3},
    [4] = {text = "风怒武器",   value = 4},
}

-- 创建下拉菜单
local dropdown_WEnhance = CreateFrame("Button", ADDON_NAME.."Dropdown_WEnhance", checkButton_WEnhance, "UIDropDownMenuTemplate")
dropdown_WEnhance:SetPoint("TOPLEFT", checkButton_WEnhance, "TOPLEFT", 100, -3)

-- 菜单初始化
local function Dropdown_Init_WEnhance()
    for idx, data in pairs(modes_WEnhance) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_WEnhance, index)
                MPShamanEnhanceSaved[ConfigCurrent].WEnhance_Value = modes_WEnhance[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_WEnhance, Dropdown_Init_WEnhance)
UIDropDownMenu_SetSelectedID(dropdown_WEnhance, 1) -- 默认选中第一项




postion_y = postion_y-30

-- 创建单选框 - 水之护盾
local checkButton_WaterShield = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 水之护盾 (单选)")


postion_y = postion_y-30

-- 创建单选框 - 大地之盾
local checkButton_EarthShield = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 大地之盾 (单选)")


-- 设置点击事件
checkButton_LightningShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].EarthShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].WaterShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].LightningShield = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].EarthShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].LightningShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].WaterShield = 0
    end
    checkButton_EarthShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].EarthShield) )
    checkButton_LightningShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].LightningShield) )
    checkButton_WaterShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].WaterShield) )
end)

-- 设置点击事件
checkButton_WaterShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].EarthShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].WaterShield = 1
        MPShamanEnhanceSaved[ConfigCurrent].LightningShield = 0
    else
        MPShamanEnhanceSaved[ConfigCurrent].EarthShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].WaterShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].LightningShield = 0
    end
    checkButton_EarthShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].EarthShield) )
    checkButton_LightningShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].LightningShield) )
    checkButton_WaterShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].WaterShield) )
end)

-- 设置点击事件
checkButton_EarthShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].EarthShield = 1
        MPShamanEnhanceSaved[ConfigCurrent].WaterShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].LightningShield = 0
    else
        MPShamanEnhanceSaved[ConfigCurrent].EarthShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].WaterShield = 0
        MPShamanEnhanceSaved[ConfigCurrent].LightningShield = 0
    end
    checkButton_EarthShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].EarthShield) )
    checkButton_LightningShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].LightningShield) )
    checkButton_WaterShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].WaterShield) )
end)









-- 图腾

postion_y = postion_y+5

-- 添加提示内容区域
local TipText2 = CatUISettingsShamanEnhanceWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText2:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
TipText2:SetWidth(250)
TipText2:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText2:SetTextColor(1, 0.8, 0)
TipText2:SetJustifyH("LEFT")
TipText2:SetText("图腾配置")

postion_y = postion_y-85



-- 大地图腾
local checkButton_EarthTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "大地图腾")
-- 设置点击事件
checkButton_EarthTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].EarthTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].EarthTotem = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_EarthTotem = {
    [1] = {text = "大地之力图腾", value = 1},
    [2] = {text = "石肤图腾", value = 2},
    [3] = {text = "石爪图腾", value = 3},
    [4] = {text = "战栗图腾",   value = 4},
    [5] = {text = "地缚图腾",   value = 5},
}

-- 创建下拉菜单
local dropdown_EarthTotem = CreateFrame("Button", ADDON_NAME.."Dropdown_EarthTotem", checkButton_EarthTotem, "UIDropDownMenuTemplate")
dropdown_EarthTotem:SetPoint("TOPLEFT", checkButton_EarthTotem, "TOPLEFT", -12, -35)

-- 菜单初始化
local function Dropdown_Init_EarthTotem()
    for idx, data in pairs(modes_EarthTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].EarthTotem_Value = modes_EarthTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_EarthTotem, Dropdown_Init_EarthTotem)
UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, 1) -- 默认选中第一项








-- 火焰图腾
local checkButton_FireTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 175, postion_y, "火焰图腾")
-- 设置点击事件
checkButton_FireTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].FireTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].FireTotem = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_FireTotem = {
    [1] = {text = "火焰新星图腾", value = 1},
    [2] = {text = "灼热图腾", value = 2},
    [3] = {text = "熔岩图腾", value = 3},
    [4] = {text = "抗寒图腾",   value = 4},
    [5] = {text = "火舌图腾",   value = 5},
}

-- 创建下拉菜单
local dropdown_FireTotem = CreateFrame("Button", ADDON_NAME.."Dropdown_FireTotem", checkButton_FireTotem, "UIDropDownMenuTemplate")
dropdown_FireTotem:SetPoint("TOPLEFT", checkButton_FireTotem, "TOPLEFT", -12, -35)

-- 菜单初始化
local function Dropdown_Init_FireTotem()
    for idx, data in pairs(modes_FireTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_FireTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].FireTotem_Value = modes_FireTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_FireTotem, Dropdown_Init_FireTotem)
UIDropDownMenu_SetSelectedID(dropdown_FireTotem, 1) -- 默认选中第一项







-- 水之图腾
local checkButton_WaterTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 330, postion_y, "水之图腾")
-- 设置点击事件
checkButton_WaterTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].WaterTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].WaterTotem = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_WaterTotem = {
    [1] = {text = "抗火图腾", value = 1},
    [2] = {text = "治疗之泉图腾", value = 2},
    [3] = {text = "法力之泉图腾", value = 3},
    [4] = {text = "清毒图腾",   value = 4},
    [5] = {text = "祛病图腾",   value = 5},
}

-- 创建下拉菜单
local dropdown_WaterTotem = CreateFrame("Button", ADDON_NAME.."Dropdown_WaterTotem", checkButton_WaterTotem, "UIDropDownMenuTemplate")
dropdown_WaterTotem:SetPoint("TOPLEFT", checkButton_WaterTotem, "TOPLEFT", -12, -35)

-- 菜单初始化
local function Dropdown_Init_WaterTotem()
    for idx, data in pairs(modes_WaterTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].WaterTotem_Value = modes_WaterTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_WaterTotem, Dropdown_Init_WaterTotem)
UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, 1) -- 默认选中第一项





-- 空气图腾
local checkButton_AirTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 485, postion_y, "空气图腾")
-- 设置点击事件
checkButton_AirTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].AirTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].AirTotem = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_AirTotem = {
    [1] = {text = "根基图腾", value = 1},
    [2] = {text = "自然抗性图腾", value = 2},
    [3] = {text = "风之优雅图腾", value = 3},
    [4] = {text = "风墙图腾",   value = 4},
    [5] = {text = "风怒图腾",   value = 5},
    [6] = {text = "宁静之风图腾",   value = 6},
    -- 这里剔除了 岗哨图腾
}

-- 创建下拉菜单
local dropdown_AirTotem = CreateFrame("Button", ADDON_NAME.."Dropdown_AirTotem", checkButton_AirTotem, "UIDropDownMenuTemplate")
dropdown_AirTotem:SetPoint("TOPLEFT", checkButton_AirTotem, "TOPLEFT", -12, -35)

-- 菜单初始化
local function Dropdown_Init_AirTotem()
    for idx, data in pairs(modes_AirTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_AirTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].AirTotem_Value = modes_AirTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_AirTotem, Dropdown_Init_AirTotem)
UIDropDownMenu_SetSelectedID(dropdown_AirTotem, 1) -- 默认选中第一项




postion_y = postion_y-90

--[[
-- 创建单选框 - 图腾召回
local checkButton_RecallTotems = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_RecallTotems", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_RecallTotems:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_RecallTotems:SetScale(0.8)

-- 添加文字标签
local checkText_RecallTotems = checkButton_RecallTotems:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_RecallTotems:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_RecallTotems:SetTextColor(1, 1, 1)
checkText_RecallTotems:SetPoint("LEFT", checkButton_RecallTotems, "LEFT", 34, 1)
checkText_RecallTotems:SetText("自动 图腾召回")


local slider_RecallTotems = CreateFrame("Slider", ADDON_NAME.."Slider_RecallTotems", checkButton_RecallTotems, "OptionsSliderTemplate")
slider_RecallTotems:SetPoint("RIGHT", checkButton_RecallTotems, "RIGHT", 260, -2)
slider_RecallTotems:SetWidth(150) -- 拖动条长度
slider_RecallTotems:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_RecallTotems:SetMinMaxValues(15, 100)
slider_RecallTotems:SetValueStep(1)
slider_RecallTotems:SetValue(30) -- 默认值
MPCatUISliderRegionHide(slider_RecallTotems)

local color_RecallTotems = "|cFFFFD100"

-- 值变化时的回调函数
slider_RecallTotems:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPShamanEnhanceSaved[ConfigCurrent].RecallTotems_Value = arg1
    _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanEnhanceSaved[ConfigCurrent].RecallTotems_Value .." 码距离|r")
end)

-- 设置点击事件
checkButton_RecallTotems:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].RecallTotems = 1
        color_RecallTotems = "|cFFFFD100"
        _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanEnhanceSaved[ConfigCurrent].RecallTotems_Value .." 码距离|r")
    else
        MPShamanEnhanceSaved[ConfigCurrent].RecallTotems = 0
        color_RecallTotems = "|cFF888888"
        _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanEnhanceSaved[ConfigCurrent].RecallTotems_Value .." 码距离|r")
    end
end)

]]

-- 创建单选框 - 强制图腾
local checkButton_ForceTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "开启 强制图腾配置")
-- 设置点击事件
checkButton_ForceTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].ForceTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].ForceTotem = 0
    end
end)






-- 高级



postion_y = postion_y+40

-- 添加提示内容区域
local TipText1 = CatUISettingsShamanEnhanceWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-120

-- 创建单选框 - 6T3
local checkButton_SixT3 = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "适配 6件T3特效")
-- 设置点击事件
checkButton_SixT3:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].SixT3 = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].SixT3 = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPShamanEnhanceSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanEnhanceSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanEnhanceSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPShamanEnhanceSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanEnhanceSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40

-- 创建单选框 - 自动 水之护盾 蓝量<x
local checkButton_AutoWaterShield = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "自动 水之护盾")

local slider_AutoWaterShield = CreateFrame("Slider", ADDON_NAME.."Slider_AutoWaterShield", checkButton_AutoWaterShield, "OptionsSliderTemplate")
slider_AutoWaterShield:SetPoint("RIGHT", checkButton_AutoWaterShield, "RIGHT", 260, -2)
slider_AutoWaterShield:SetWidth(150) -- 拖动条长度
slider_AutoWaterShield:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_AutoWaterShield:SetMinMaxValues(100, 3000)
slider_AutoWaterShield:SetValueStep(100)
slider_AutoWaterShield:SetValue(1000) -- 默认值
MPCatUISliderRegionHide(slider_AutoWaterShield)

local color_AutoWaterShield = "|cFFFFD100"

-- 值变化时的回调函数
slider_AutoWaterShield:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield_Value = arg1
    _G[slider_AutoWaterShield:GetName().."Text"]:SetText(color_AutoWaterShield.."蓝量 < ".. MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield_Value .."|r")
end)
-- 设置点击事件
checkButton_AutoWaterShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield = 1
        color_AutoWaterShield = "|cFFFFD100"
        _G[slider_AutoWaterShield:GetName().."Text"]:SetText(color_AutoWaterShield.."蓝量 < ".. MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield_Value .."|r")
    else
        MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield = 0
        color_AutoWaterShield = "|cFF888888"
        _G[slider_AutoWaterShield:GetName().."Text"]:SetText(color_AutoWaterShield.."蓝量 < ".. MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield_Value .."|r")
    end
end)




-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPShamanEnhanceSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanEnhanceSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanEnhanceSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPShamanEnhanceSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanEnhanceSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 默认图腾
local checkButton_DefaultTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "脱战默认图腾 切")
-- 设置点击事件
checkButton_DefaultTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].DefaultTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].DefaultTotem = 0
    end
end)

-- 创建下拉菜单
local dropdown_DefaultTotem = CreateFrame("Button", ADDON_NAME.."dropdown_DefaultTotem", checkButton_DefaultTotem, "UIDropDownMenuTemplate")
dropdown_DefaultTotem:SetPoint("TOPLEFT", checkButton_DefaultTotem, "TOPLEFT", 155, 0)
local modes_DefaultTotem = {
    [1] = {text = "|cFF9D38C8裂雷图腾|r", item="裂雷图腾", value = 1},
    [2] = {text = "|cFF9D38C8破碎大地图腾|r", item="破碎大地图腾", value = 2},
    [3] = {text = "|cFF9D38C8裂石图腾|r", item="裂石图腾", value = 3},
    [4] = {text = "|cFF9D38C8召雷图腾|r", item="召雷图腾", value = 4},
    [5] = {text = "|cFF9D38C8余震图腾|r", item="余震图腾", value = 5},
    [6] = {text = "|cFF0070DD怒气图腾|r", item="怒气图腾", value = 6},
    [7] = {text = "|cFF0070DD星火图腾|r", item="星火图腾", value = 7},
    [8] = {text = "|cFF0070DD腐根图腾|r", item="腐根图腾", value = 8},
}
local function Dropdown_DefaultT()
    for idx, data in pairs(modes_DefaultTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_DefaultTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].DefaultTotem_Value = modes_DefaultTotem[index].item
            end
        end)(idx)
        UIDropDownMenu_AddButton(info)
    end
end
UIDropDownMenu_Initialize(dropdown_DefaultTotem, Dropdown_DefaultT)
UIDropDownMenu_SetSelectedID(dropdown_DefaultTotem, 1) -- 默认选中第一项




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y-40



-- 创建单选框 - 闪电打击附属图腾
local checkButton_LightningStrikeTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "启用 闪电打击 切")
-- 设置点击事件
checkButton_LightningStrikeTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].LightningStrikeTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].LightningStrikeTotem = 0
    end
end)

-- 创建下拉菜单
local dropdown_LightningStrikeTotem = CreateFrame("Button", ADDON_NAME.."dropdown_LightningStrikeTotem", checkButton_LightningStrikeTotem, "UIDropDownMenuTemplate")
dropdown_LightningStrikeTotem:SetPoint("TOPLEFT", checkButton_LightningStrikeTotem, "TOPLEFT", 155, 0)
local modes_LightningStrikeTotem = {
    [1] = {text = "|cFF9D38C8裂雷图腾|r", item="裂雷图腾", value = 1},
}
local function Dropdown_LST()
    for idx, data in pairs(modes_LightningStrikeTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_LightningStrikeTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].LightningStrikeTotem_Value = modes_LightningStrikeTotem[index].item
            end
        end)(idx)
        UIDropDownMenu_AddButton(info)
    end
end
UIDropDownMenu_Initialize(dropdown_LightningStrikeTotem, Dropdown_LST)
UIDropDownMenu_SetSelectedID(dropdown_LightningStrikeTotem, 1) -- 默认选中第一项



-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].Soulspeed = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)




postion_y = postion_y-40




-- 创建单选框 - 大地震击附属图腾
local checkButton_EarthShockTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "启用 大地震击 切")
-- 设置点击事件
checkButton_EarthShockTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].EarthShockTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].EarthShockTotem = 0
    end
end)
-- 创建下拉菜单
local dropdown_EarthShockTotem = CreateFrame("Button", ADDON_NAME.."dropdown_EarthShockTotem", checkButton_EarthShockTotem, "UIDropDownMenuTemplate")
dropdown_EarthShockTotem:SetPoint("TOPLEFT", checkButton_EarthShockTotem, "TOPLEFT", 155, 0)
local modes_EarthShockTotem = {
    [1] = {text = "|cFF9D38C8破碎大地图腾|r", item="破碎大地图腾", value = 1},
}
local function Dropdown_EST()
    for idx, data in pairs(modes_EarthShockTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_EarthShockTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].EarthShockTotem_Value = modes_EarthShockTotem[index].item
            end
        end)(idx)
        UIDropDownMenu_AddButton(info)
    end
end
UIDropDownMenu_Initialize(dropdown_EarthShockTotem, Dropdown_EST)
UIDropDownMenu_SetSelectedID(dropdown_EarthShockTotem, 1) -- 默认选中第一项


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].RacialTraits = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)




postion_y = postion_y-40



-- 创建单选框 - 震击附属图腾
local checkButton_ShockTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "启用 震击 切")
-- 设置点击事件
checkButton_ShockTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].ShockTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].ShockTotem = 0
    end
end)
-- 创建下拉菜单
local dropdown_ShockTotem = CreateFrame("Button", ADDON_NAME.."dropdown_ShockTotem", checkButton_ShockTotem, "UIDropDownMenuTemplate")
dropdown_ShockTotem:SetPoint("TOPLEFT", checkButton_ShockTotem, "TOPLEFT", 155, 0)
local modes_ShockTotem = {
    [1] = {text = "|cFF9D38C8裂石图腾|r", item="裂石图腾", value = 1},
}
local function Dropdown_ShockT()
    for idx, data in pairs(modes_ShockTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_ShockTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].ShockTotem_Value = modes_ShockTotem[index].item
            end
        end)(idx)
        UIDropDownMenu_AddButton(info)
    end
end
UIDropDownMenu_Initialize(dropdown_ShockTotem, Dropdown_ShockT)
UIDropDownMenu_SetSelectedID(dropdown_ShockTotem, 1) -- 默认选中第一项



postion_y = postion_y-40


-- 创建单选框 - 风暴打击附属图腾
local checkButton_StormstrikeTotem = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, postion_y, "启用 风暴打击 切")
-- 设置点击事件
checkButton_StormstrikeTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].StormstrikeTotem = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].StormstrikeTotem = 0
    end
end)

-- 创建下拉菜单
local dropdown_StormstrikeTotem = CreateFrame("Button", ADDON_NAME.."dropdown_StormstrikeTotem", checkButton_StormstrikeTotem, "UIDropDownMenuTemplate")
dropdown_StormstrikeTotem:SetPoint("TOPLEFT", checkButton_StormstrikeTotem, "TOPLEFT", 155, 0)
local modes_StormstrikeTotem = {
    [1] = {text = "|cFF9D38C8召雷图腾|r", item="召雷图腾", value = 1},
}
local function Dropdown_ST()
    for idx, data in pairs(modes_StormstrikeTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_StormstrikeTotem, index)
                MPShamanEnhanceSaved[ConfigCurrent].StormstrikeTotem_Value = modes_StormstrikeTotem[index].item
            end
        end)(idx)
        UIDropDownMenu_AddButton(info)
    end
end
UIDropDownMenu_Initialize(dropdown_StormstrikeTotem, Dropdown_ST)
UIDropDownMenu_SetSelectedID(dropdown_StormstrikeTotem, 1) -- 默认选中第一项









-- 创建按钮
local myButton = MPCreateButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetShamanEnhanceSettings(ConfigCurrent)
    MPInitShamanEnhanceSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsShamanEnhanceWindow, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsShamanEnhanceWindow, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsShamanEnhanceWindow, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 440, -44)
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
    MPInitShamanEnhanceSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitShamanEnhanceSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitShamanEnhanceSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsShamanEnhanceWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].Power = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved[ConfigCurrent].Pick = 1
    else
        MPShamanEnhanceSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsShamanEnhanceWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsShamanEnhanceWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFF0070DE/swdps|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local ShamanEnhanceSettingsUIVersion = 18

function MPResetShamanEnhanceSettings(config)

    MPShamanEnhanceSaved.Version = ShamanEnhanceSettingsUIVersion

    -- 基本配置

    MPShamanEnhanceSaved[config].EarthShock = 1
    MPShamanEnhanceSaved[config].FrostShock = 0
    MPShamanEnhanceSaved[config].FlameShock = 1
    MPShamanEnhanceSaved[config].LightningShield = 1
    MPShamanEnhanceSaved[config].WaterShield = 0
    MPShamanEnhanceSaved[config].EarthShield = 0

    MPShamanEnhanceSaved[config].Trinket_Upper = 1
    MPShamanEnhanceSaved[config].TUBoss = 0
    MPShamanEnhanceSaved[config].Trinket_Below = 1
    MPShamanEnhanceSaved[config].TBBoss = 0
    MPShamanEnhanceSaved[config].Target = 0
    MPShamanEnhanceSaved[config].WEnhance = 1
    MPShamanEnhanceSaved[config].WEnhance_Value = "风怒武器"


    MPShamanEnhanceSaved[config].EarthTotem = 1
    MPShamanEnhanceSaved[config].EarthTotem_Value = "大地之力图腾"
    MPShamanEnhanceSaved[config].FireTotem = 1
    MPShamanEnhanceSaved[config].FireTotem_Value = "火舌图腾"
    MPShamanEnhanceSaved[config].WaterTotem = 1
    MPShamanEnhanceSaved[config].WaterTotem_Value = "法力之泉图腾"
    MPShamanEnhanceSaved[config].AirTotem = 1
    MPShamanEnhanceSaved[config].AirTotem_Value = "风怒图腾"

    MPShamanEnhanceSaved[config].RecallTotems = 1
    MPShamanEnhanceSaved[config].RecallTotems_Value = 40

    MPShamanEnhanceSaved[config].ForceTotem = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPShamanEnhanceSaved[config].HealthStone = 1
    MPShamanEnhanceSaved[config].HealthStone_Value = 30
    MPShamanEnhanceSaved[config].HerbalTea = 1
    MPShamanEnhanceSaved[config].HerbalTea_Value = 20
    MPShamanEnhanceSaved[config].HerbalTeaMana = 0
    MPShamanEnhanceSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPShamanEnhanceSaved[config].SuperWoW = 1
    MPShamanEnhanceSaved[config].UnitXP = 1

    MPShamanEnhanceSaved[config].SixT3 = 0
    MPShamanEnhanceSaved[config].RacialTraits = 0
    MPShamanEnhanceSaved[config].RacialTraitsBoss = 1
    MPShamanEnhanceSaved[config].Soulspeed = 0
    MPShamanEnhanceSaved[config].SoulspeedBoss = 1

    MPShamanEnhanceSaved[config].DefaultTotem = 0
    MPShamanEnhanceSaved[config].DefaultTotem_Value = "裂雷图腾"
    MPShamanEnhanceSaved[config].LightningStrikeTotem = 0
    MPShamanEnhanceSaved[config].LightningStrikeTotem_Value = "裂雷图腾"
    MPShamanEnhanceSaved[config].StormstrikeTotem = 0
    MPShamanEnhanceSaved[config].StormstrikeTotem_Value = "召雷图腾"
    MPShamanEnhanceSaved[config].EarthShockTotem = 0
    MPShamanEnhanceSaved[config].EarthShockTotem_Value = "破碎大地图腾"
    MPShamanEnhanceSaved[config].ShockTotem = 0
    MPShamanEnhanceSaved[config].ShockTotem_Value = "裂石图腾"

    --MPShamanEnhanceSaved[config].Force = 0

    --MPShamanEnhanceSaved[config].Wave_Value = 60
    --MPShamanEnhanceSaved[config].SecondaryWave_Value = 99
    --MPShamanEnhanceSaved[config].Chain_Value = 3
    --MPShamanEnhanceSaved[config].WaterShieldLevel = 0

    MPShamanEnhanceSaved[config].AutoWaterShield = 0
    MPShamanEnhanceSaved[config].AutoWaterShield_Value = 1000

    -- 通用
    MPShamanEnhanceSaved[config].Power = 0
    MPShamanEnhanceSaved[config].Pick = 0

end


function InitShamanEnhanceSettingsPart1()

    checkButton_EarthShock:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].EarthShock))
    checkButton_FrostShock:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].FrostShock) )
    checkButton_FlameShock:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].FlameShock) )
    checkButton_LightningShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].LightningShield) )
    checkButton_WaterShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].WaterShield) )
    checkButton_EarthShield:SetChecked( MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].EarthShield) )

    checkButton_Target:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].Target))
    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].TBBoss))
    checkButton_WEnhance:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].WEnhance))

    checkButton_SixT3:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].SixT3))

    checkButton_RacialTraits:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].SoulspeedBoss))

    checkButton_DefaultTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].DefaultTotem))
    for idx_Low, data_Low in pairs(modes_DefaultTotem) do
        if string.find(data_Low.text,MPShamanEnhanceSaved[ConfigCurrent].DefaultTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_DefaultTotem, data_Low.value)
            _G[dropdown_DefaultTotem:GetName().."Text"]:SetText(data_Low.text)
        end
    end

    checkButton_StormstrikeTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].StormstrikeTotem))
    for idx_Low, data_Low in pairs(modes_StormstrikeTotem) do
        if string.find(data_Low.text,MPShamanEnhanceSaved[ConfigCurrent].StormstrikeTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_StormstrikeTotem, data_Low.value)
            _G[dropdown_StormstrikeTotem:GetName().."Text"]:SetText(data_Low.text)
        end
    end

    checkButton_LightningStrikeTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].LightningStrikeTotem))
    for idx_Low, data_Low in pairs(modes_LightningStrikeTotem) do
        if string.find(data_Low.text,MPShamanEnhanceSaved[ConfigCurrent].LightningStrikeTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_LightningStrikeTotem, data_Low.value)
            _G[dropdown_LightningStrikeTotem:GetName().."Text"]:SetText(data_Low.text)
        end
    end

    checkButton_EarthShockTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].EarthShockTotem))
    checkButton_ShockTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].ShockTotem))

    checkButton_Power:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].Pick))
end

function MPInitShamanEnhanceSettings()
    if not MPShamanEnhanceSaved then
        MPShamanEnhanceSaved = {}

        -- 第一套配置
        if not MPShamanEnhanceSaved[1] then
            MPShamanEnhanceSaved[1] = {}
            MPResetShamanEnhanceSettings(1)
        end

        -- 第二套配置
        if not MPShamanEnhanceSaved[2] then
            MPShamanEnhanceSaved[2] = {}
            MPResetShamanEnhanceSettings(2)
        end

        -- 第三套配置
        if not MPShamanEnhanceSaved[3] then
            MPShamanEnhanceSaved[3] = {}
            MPResetShamanEnhanceSettings(3)
        end
    end

    if MPShamanEnhanceSaved.Version ~= ShamanEnhanceSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[增强萨宏]当前配置，这是新版插件正常数据更新！|r")
        MPShamanEnhanceSaved[1] = {}
        MPShamanEnhanceSaved[2] = {}
        MPShamanEnhanceSaved[3] = {}
        MPResetShamanEnhanceSettings(1)
        MPResetShamanEnhanceSettings(2)
        MPResetShamanEnhanceSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitShamanEnhanceSettingsPart1()

    checkButton_HealthStone:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPShamanEnhanceSaved[ConfigCurrent].HealthStone_Value)
    if MPShamanEnhanceSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanEnhanceSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPShamanEnhanceSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPShamanEnhanceSaved[ConfigCurrent].HerbalTea_Value)
    if MPShamanEnhanceSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanEnhanceSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanEnhanceSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")

    checkButton_AutoWaterShield:SetChecked(MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield)
    slider_AutoWaterShield:SetValue(MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield_Value)
    if MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield==1 then
        color_AutoWaterShield = "|cFFFFD100"
    else
        color_AutoWaterShield = "|cFF888888"
    end
    _G[slider_AutoWaterShield:GetName().."Text"]:SetText(color_AutoWaterShield.."蓝量 < ".. MPShamanEnhanceSaved[ConfigCurrent].AutoWaterShield_Value .."|r")



    --slider_Wave_Value:SetValue(MPShamanEnhanceSaved[ConfigCurrent].Wave_Value)
    --slider_SecondaryWave_Value:SetValue(MPShamanEnhanceSaved[ConfigCurrent].SecondaryWave_Value)
    --slider_Chain_Value:SetValue(MPShamanEnhanceSaved[ConfigCurrent].Chain_Value)

    -- 强化武器
    checkButton_WEnhance:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].WEnhance))
    for idx_WEnhance, data_WEnhance in pairs(modes_WEnhance) do
        if string.find(data_WEnhance.text, MPShamanEnhanceSaved[ConfigCurrent].WEnhance_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_WEnhance, data_WEnhance.value)
            _G[dropdown_WEnhance:GetName().."Text"]:SetText(data_WEnhance.text)
        end
    end

    checkButton_EarthTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].EarthTotem))
    for idx_EarthTotem, data_EarthTotem in pairs(modes_EarthTotem) do
        if string.find(data_EarthTotem.text, MPShamanEnhanceSaved[ConfigCurrent].EarthTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, data_EarthTotem.value)
            _G[dropdown_EarthTotem:GetName().."Text"]:SetText(data_EarthTotem.text)
        end
    end

    checkButton_FireTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].FireTotem))
    for idx_FireTotem, data_FireTotem in pairs(modes_FireTotem) do
        if string.find(data_FireTotem.text, MPShamanEnhanceSaved[ConfigCurrent].FireTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_FireTotem, data_FireTotem.value)
            _G[dropdown_FireTotem:GetName().."Text"]:SetText(data_FireTotem.text)
        end
    end

    checkButton_WaterTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].WaterTotem))
    for idx_WaterTotem, data_WaterTotem in pairs(modes_WaterTotem) do
        if string.find(data_WaterTotem.text, MPShamanEnhanceSaved[ConfigCurrent].WaterTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, data_WaterTotem.value)
            _G[dropdown_WaterTotem:GetName().."Text"]:SetText(data_WaterTotem.text)
        end
    end

    checkButton_AirTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].AirTotem))
    for idx_AirTotem, data_AirTotem in pairs(modes_AirTotem) do
        if string.find(data_AirTotem.text, MPShamanEnhanceSaved[ConfigCurrent].AirTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_AirTotem, data_AirTotem.value)
            _G[dropdown_AirTotem:GetName().."Text"]:SetText(data_AirTotem.text)
        end
    end

    --[[
    checkButton_RecallTotems:SetChecked(MPShamanEnhanceSaved[ConfigCurrent].RecallTotems)
    slider_RecallTotems:SetValue(MPShamanEnhanceSaved[ConfigCurrent].RecallTotems_Value)
    if MPShamanEnhanceSaved[ConfigCurrent].RecallTotems==1 then
        color_RecallTotems = "|cFFFFD100"
    else
        color_RecallTotems = "|cFF888888"
    end
    _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." ".. MPShamanEnhanceSaved[ConfigCurrent].RecallTotems_Value .." 码距离|r")
    ]]

    checkButton_ForceTotem:SetChecked(MPToBoolean(MPShamanEnhanceSaved[ConfigCurrent].ForceTotem))

end

