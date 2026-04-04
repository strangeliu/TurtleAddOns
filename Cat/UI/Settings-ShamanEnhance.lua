
-- 定义插件名称
local ADDON_NAME = "Settings-ShamanEnhance"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsShamanEnhanceWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 620, "|cFF0070DE设置 - 增强萨|r")

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
local checkButton_EarthShock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_EarthShock:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_EarthShock:SetScale(0.8)

-- 添加文字标签
local checkText_EarthShock = checkButton_EarthShock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_EarthShock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_EarthShock:SetTextColor(1, 1, 1)
checkText_EarthShock:SetPoint("LEFT", checkButton_EarthShock, "LEFT", 34, 1)
checkText_EarthShock:SetText("开启 大地震击")

-- 大地震击设置点击事件
checkButton_EarthShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.EarthShock = 1
    else
        MPShamanEnhanceSaved.EarthShock = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 340, postion_y)
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
        MPShamanEnhanceSaved.Trinket_Upper = 1
    else
        MPShamanEnhanceSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.TUBoss = 1
    else
        MPShamanEnhanceSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 冰霜震击
local checkButton_FrostShock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_FrostShock:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_FrostShock:SetScale(0.8)

-- 添加文字标签
local checkText_FrostShock = checkButton_FrostShock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FrostShock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FrostShock:SetTextColor(1, 1, 1)
checkText_FrostShock:SetPoint("LEFT", checkButton_FrostShock, "LEFT", 34, 1)
checkText_FrostShock:SetText("开启 冰霜震击")

-- 大地震击设置点击事件
checkButton_FrostShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.FrostShock = 1
    else
        MPShamanEnhanceSaved.FrostShock = 0
    end
end)



-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 340, postion_y)
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
        MPShamanEnhanceSaved.Trinket_Below = 1
    else
        MPShamanEnhanceSaved.Trinket_Below = 0
    end
end)

local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.TBBoss = 1
    else
        MPShamanEnhanceSaved.TBBoss = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 烈焰震击
local checkButton_FlameShock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_FlameShock:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_FlameShock:SetScale(0.8)

-- 添加文字标签
local checkText_FlameShock = checkButton_FlameShock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FlameShock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FlameShock:SetTextColor(1, 1, 1)
checkText_FlameShock:SetPoint("LEFT", checkButton_FlameShock, "LEFT", 34, 1)
checkText_FlameShock:SetText("保持 烈焰震击")

-- 设置点击事件
checkButton_FlameShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.FlameShock = 1
    else
        MPShamanEnhanceSaved.FlameShock = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 340, postion_y)
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
        MPShamanEnhanceSaved.Target = 1
    else
        MPShamanEnhanceSaved.Target = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 闪电之盾
local checkButton_LightningShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_LightningShield:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_LightningShield:SetScale(0.8)

-- 添加文字标签
local checkText_LightningShield = checkButton_LightningShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LightningShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LightningShield:SetTextColor(1, 1, 1)
checkText_LightningShield:SetPoint("LEFT", checkButton_LightningShield, "LEFT", 34, 1)
checkText_LightningShield:SetText("保持 闪电之盾 (单选)")


-- 创建单选框 - 武器强化
local checkButton_WEnhance = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_WEnhance:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 340, postion_y)
checkButton_WEnhance:SetScale(0.8)

-- 添加文字标签
local checkText_WEnhance = checkButton_WEnhance:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WEnhance:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WEnhance:SetTextColor(1, 1, 1)
checkText_WEnhance:SetPoint("LEFT", checkButton_WEnhance, "LEFT", 34, 1)
checkText_WEnhance:SetText("武器强化")

-- 设置点击事件
checkButton_WEnhance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.WEnhance = 1
    else
        MPShamanEnhanceSaved.WEnhance = 0
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
                MPShamanEnhanceSaved.WEnhance_Value = modes_WEnhance[index].text
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
local checkButton_WaterShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_WaterShield:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_WaterShield:SetScale(0.8)

-- 添加文字标签
local checkText_WaterShield = checkButton_WaterShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WaterShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WaterShield:SetTextColor(1, 1, 1)
checkText_WaterShield:SetPoint("LEFT", checkButton_WaterShield, "LEFT", 34, 1)
checkText_WaterShield:SetText("保持 水之护盾 (单选)")


postion_y = postion_y-30

-- 创建单选框 - 大地之盾
local checkButton_EarthShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_EarthShield:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_EarthShield:SetScale(0.8)

-- 添加文字标签
local checkText_EarthShield = checkButton_EarthShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_EarthShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_EarthShield:SetTextColor(1, 1, 1)
checkText_EarthShield:SetPoint("LEFT", checkButton_EarthShield, "LEFT", 34, 1)
checkText_EarthShield:SetText("保持 大地之盾 (单选)")



-- 设置点击事件
checkButton_LightningShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.EarthShield = 0
        MPShamanEnhanceSaved.WaterShield = 0
        MPShamanEnhanceSaved.LightningShield = 1
    else
        MPShamanEnhanceSaved.EarthShield = 0
        MPShamanEnhanceSaved.LightningShield = 0
        MPShamanEnhanceSaved.WaterShield = 0
    end
    checkButton_EarthShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.EarthShield) )
    checkButton_LightningShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.LightningShield) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.WaterShield) )
end)

-- 设置点击事件
checkButton_WaterShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.EarthShield = 0
        MPShamanEnhanceSaved.WaterShield = 1
        MPShamanEnhanceSaved.LightningShield = 0
    else
        MPShamanEnhanceSaved.EarthShield = 0
        MPShamanEnhanceSaved.WaterShield = 0
        MPShamanEnhanceSaved.LightningShield = 0
    end
    checkButton_EarthShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.EarthShield) )
    checkButton_LightningShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.LightningShield) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.WaterShield) )
end)

-- 设置点击事件
checkButton_EarthShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.EarthShield = 1
        MPShamanEnhanceSaved.WaterShield = 0
        MPShamanEnhanceSaved.LightningShield = 0
    else
        MPShamanEnhanceSaved.EarthShield = 0
        MPShamanEnhanceSaved.WaterShield = 0
        MPShamanEnhanceSaved.LightningShield = 0
    end
    checkButton_EarthShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.EarthShield) )
    checkButton_LightningShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.LightningShield) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.WaterShield) )
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
local checkButton_EarthTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_EarthTotem:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_EarthTotem:SetScale(0.8)

-- 添加文字标签
local checkText_EarthTotem = checkButton_EarthTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_EarthTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_EarthTotem:SetTextColor(1, 1, 1)
checkText_EarthTotem:SetPoint("LEFT", checkButton_EarthTotem, "LEFT", 34, 1)
checkText_EarthTotem:SetText("大地图腾")

-- 设置点击事件
checkButton_EarthTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.EarthTotem = 1
    else
        MPShamanEnhanceSaved.EarthTotem = 0
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
                MPShamanEnhanceSaved.EarthTotem_Value = modes_EarthTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_EarthTotem, Dropdown_Init_EarthTotem)
UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, 1) -- 默认选中第一项








-- 火焰图腾
local checkButton_FireTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_FireTotem:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 175, postion_y)
checkButton_FireTotem:SetScale(0.8)

-- 添加文字标签
local checkText_FireTotem = checkButton_FireTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FireTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FireTotem:SetTextColor(1, 1, 1)
checkText_FireTotem:SetPoint("LEFT", checkButton_FireTotem, "LEFT", 34, 1)
checkText_FireTotem:SetText("火焰图腾")

-- 设置点击事件
checkButton_FireTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.FireTotem = 1
    else
        MPShamanEnhanceSaved.FireTotem = 0
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
                MPShamanEnhanceSaved.FireTotem_Value = modes_FireTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_FireTotem, Dropdown_Init_FireTotem)
UIDropDownMenu_SetSelectedID(dropdown_FireTotem, 1) -- 默认选中第一项







-- 水之图腾
local checkButton_WaterTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_WaterTotem:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 330, postion_y)
checkButton_WaterTotem:SetScale(0.8)

-- 添加文字标签
local checkText_WaterTotem = checkButton_WaterTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WaterTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WaterTotem:SetTextColor(1, 1, 1)
checkText_WaterTotem:SetPoint("LEFT", checkButton_WaterTotem, "LEFT", 34, 1)
checkText_WaterTotem:SetText("水之图腾")

-- 设置点击事件
checkButton_WaterTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.WaterTotem = 1
    else
        MPShamanEnhanceSaved.WaterTotem = 0
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
                MPShamanEnhanceSaved.WaterTotem_Value = modes_WaterTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_WaterTotem, Dropdown_Init_WaterTotem)
UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, 1) -- 默认选中第一项





-- 空气图腾
local checkButton_AirTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_AirTotem:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 485, postion_y)
checkButton_AirTotem:SetScale(0.8)

-- 添加文字标签
local checkText_AirTotem = checkButton_AirTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_AirTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_AirTotem:SetTextColor(1, 1, 1)
checkText_AirTotem:SetPoint("LEFT", checkButton_AirTotem, "LEFT", 34, 1)
checkText_AirTotem:SetText("空气图腾")

-- 设置点击事件
checkButton_AirTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.AirTotem = 1
    else
        MPShamanEnhanceSaved.AirTotem = 0
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
                MPShamanEnhanceSaved.AirTotem_Value = modes_AirTotem[index].text
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

_G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.."30 码距离|r")
_G[slider_RecallTotems:GetName().."Low"]:Hide()
_G[slider_RecallTotems:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_RecallTotems:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPShamanEnhanceSaved.RecallTotems_Value = arg1
    _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanEnhanceSaved.RecallTotems_Value .." 码距离|r")
end)

-- 设置点击事件
checkButton_RecallTotems:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.RecallTotems = 1
        color_RecallTotems = "|cFFFFD100"
        _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanEnhanceSaved.RecallTotems_Value .." 码距离|r")
    else
        MPShamanEnhanceSaved.RecallTotems = 0
        color_RecallTotems = "|cFF888888"
        _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanEnhanceSaved.RecallTotems_Value .." 码距离|r")
    end
end)

]]

-- 创建单选框 - 强制图腾
local checkButton_ForceTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForceTotem", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_ForceTotem:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 340, postion_y)
checkButton_ForceTotem:SetScale(0.8)

-- 添加文字标签
local checkText_ForceTotem = checkButton_ForceTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ForceTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ForceTotem:SetTextColor(1, 1, 1)
checkText_ForceTotem:SetPoint("LEFT", checkButton_ForceTotem, "LEFT", 34, 1)
checkText_ForceTotem:SetText("开启 强制图腾配置")

-- 设置点击事件
checkButton_ForceTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.ForceTotem = 1
    else
        MPShamanEnhanceSaved.ForceTotem = 0
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


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
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
        MPShamanEnhanceSaved.RacialTraits = 1
    else
        MPShamanEnhanceSaved.RacialTraits = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 340, postion_y)
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
    MPShamanEnhanceSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanEnhanceSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanEnhanceSaved.HealthStone_Value .."%|r")
    else
        MPShamanEnhanceSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanEnhanceSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 6T3
local checkButton_SixT3 = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_SixT3:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_SixT3:SetScale(0.8)

-- 添加文字标签
local checkText_SixT3 = checkButton_SixT3:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SixT3:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SixT3:SetTextColor(1, 1, 1)
checkText_SixT3:SetPoint("LEFT", checkButton_SixT3, "LEFT", 34, 1)
checkText_SixT3:SetText("适配 6件T3特效")

-- 设置点击事件
checkButton_SixT3:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.SixT3 = 1
    else
        MPShamanEnhanceSaved.SixT3 = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 340, postion_y)
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
    MPShamanEnhanceSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanEnhanceSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanEnhanceSaved.HerbalTea_Value .."%|r")
    else
        MPShamanEnhanceSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanEnhanceSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y - 40


-- 创建单选框 - 闪电打击附属图腾
local checkButton_StormstrikeTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_StormstrikeTotem:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_StormstrikeTotem:SetScale(0.8)
checkButton_StormstrikeTotem:Hide()

-- 添加文字标签
local checkText_StormstrikeTotem = checkButton_StormstrikeTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_StormstrikeTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_StormstrikeTotem:SetTextColor(1, 1, 1)
checkText_StormstrikeTotem:SetPoint("LEFT", checkButton_StormstrikeTotem, "LEFT", 34, 1)
checkText_StormstrikeTotem:SetText("启用 闪电打击 切换 |cFF9D38C8裂雷图腾|r")

-- 设置点击事件
checkButton_StormstrikeTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.StormstrikeTotem = 1
    else
        MPShamanEnhanceSaved.StormstrikeTotem = 0
    end
end)



-- 创建单选框 - 自动 水之护盾 蓝量<x
local checkButton_AutoWaterShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_AutoWaterShield", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_AutoWaterShield:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_AutoWaterShield:SetScale(0.8)

-- 添加文字标签
local checkText_AutoWaterShield = checkButton_AutoWaterShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_AutoWaterShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_AutoWaterShield:SetTextColor(1, 1, 1)
checkText_AutoWaterShield:SetPoint("LEFT", checkButton_AutoWaterShield, "LEFT", 34, 1)
checkText_AutoWaterShield:SetText("自动 水之护盾")


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

_G[slider_AutoWaterShield:GetName().."Low"]:Hide()
_G[slider_AutoWaterShield:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_AutoWaterShield:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPShamanEnhanceSaved.AutoWaterShield_Value = arg1
    _G[slider_AutoWaterShield:GetName().."Text"]:SetText(color_AutoWaterShield.."蓝量 < ".. MPShamanEnhanceSaved.AutoWaterShield_Value .."|r")
end)
-- 设置点击事件
checkButton_AutoWaterShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.AutoWaterShield = 1
        color_AutoWaterShield = "|cFFFFD100"
        _G[slider_AutoWaterShield:GetName().."Text"]:SetText(color_AutoWaterShield.."蓝量 < ".. MPShamanEnhanceSaved.AutoWaterShield_Value .."|r")
    else
        MPShamanEnhanceSaved.AutoWaterShield = 0
        color_AutoWaterShield = "|cFF888888"
        _G[slider_AutoWaterShield:GetName().."Text"]:SetText(color_AutoWaterShield.."蓝量 < ".. MPShamanEnhanceSaved.AutoWaterShield_Value .."|r")
    end
end)






-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 340, postion_y)
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
    MPShamanEnhanceSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanEnhanceSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanEnhanceSaved.HerbalTeaMana_Value .."%|r")
    else
        MPShamanEnhanceSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanEnhanceSaved.HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y-40



-- 创建单选框 - 大地震击附属图腾
local checkButton_EarthShockTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_EarthShockTotem:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_EarthShockTotem:SetScale(0.8)
checkButton_EarthShockTotem:Hide()

-- 添加文字标签
local checkText_EarthShockTotem = checkButton_EarthShockTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_EarthShockTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_EarthShockTotem:SetTextColor(1, 1, 1)
checkText_EarthShockTotem:SetPoint("LEFT", checkButton_EarthShockTotem, "LEFT", 34, 1)
checkText_EarthShockTotem:SetText("启用 大地震击 切换 |cFF9D38C8破碎大地图腾|r")

-- 设置点击事件
checkButton_EarthShockTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.EarthShockTotem = 1
    else
        MPShamanEnhanceSaved.EarthShockTotem = 0
    end
end)

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.Soulspeed = 1
    else
        MPShamanEnhanceSaved.Soulspeed = 0
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 震击附属图腾
local checkButton_ShockTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanEnhanceWindow, "UICheckButtonTemplate")
checkButton_ShockTotem:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 20, postion_y)
checkButton_ShockTotem:SetScale(0.8)
checkButton_ShockTotem:Hide()

-- 添加文字标签
local checkText_ShockTotem = checkButton_ShockTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ShockTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ShockTotem:SetTextColor(1, 1, 1)
checkText_ShockTotem:SetPoint("LEFT", checkButton_ShockTotem, "LEFT", 34, 1)
checkText_ShockTotem:SetText("启用 震击 切换 |cFF9D38C8裂石图腾|r")

-- 设置点击事件
checkButton_ShockTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.ShockTotem = 1
    else
        MPShamanEnhanceSaved.ShockTotem = 0
    end
end)








-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsShamanEnhanceWindow, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsShamanEnhanceWindow, "TOPLEFT", 120, -44)
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
    MPResetShamanEnhanceSettings()
    MPInitShamanEnhanceSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsShamanEnhanceWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsShamanEnhanceWindow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanEnhanceSaved.Power = 1
    else
        MPShamanEnhanceSaved.Power = 0
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
        MPShamanEnhanceSaved.Pick = 1
    else
        MPShamanEnhanceSaved.Pick = 0
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
TipText:SetText("宏命令 -  [ |cFF0070DE/swdps|r ]")



-- 配置文件版本号
local ShamanEnhanceSettingsUIVersion = 11

function MPResetShamanEnhanceSettings()

    MPShamanEnhanceSaved.Version = ShamanEnhanceSettingsUIVersion

    -- 基本配置

    MPShamanEnhanceSaved.EarthShock = 1
    MPShamanEnhanceSaved.FrostShock = 0
    MPShamanEnhanceSaved.FlameShock = 1
    MPShamanEnhanceSaved.LightningShield = 1
    MPShamanEnhanceSaved.WaterShield = 0
    MPShamanEnhanceSaved.EarthShield = 0

    MPShamanEnhanceSaved.Trinket_Upper = 1
    MPShamanEnhanceSaved.TUBoss = 0
    MPShamanEnhanceSaved.Trinket_Below = 1
    MPShamanEnhanceSaved.TBBoss = 0
    MPShamanEnhanceSaved.Target = 0
    MPShamanEnhanceSaved.WEnhance = 1
    MPShamanEnhanceSaved.WEnhance_Value = "风怒武器"


    MPShamanEnhanceSaved.EarthTotem = 1
    MPShamanEnhanceSaved.EarthTotem_Value = "大地之力图腾"
    MPShamanEnhanceSaved.FireTotem = 1
    MPShamanEnhanceSaved.FireTotem_Value = "火舌图腾"
    MPShamanEnhanceSaved.WaterTotem = 1
    MPShamanEnhanceSaved.WaterTotem_Value = "法力之泉图腾"
    MPShamanEnhanceSaved.AirTotem = 1
    MPShamanEnhanceSaved.AirTotem_Value = "风怒图腾"

    MPShamanEnhanceSaved.RecallTotems = 1
    MPShamanEnhanceSaved.RecallTotems_Value = 40

    MPShamanEnhanceSaved.ForceTotem = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPShamanEnhanceSaved.HealthStone = 1
    MPShamanEnhanceSaved.HealthStone_Value = 30
    MPShamanEnhanceSaved.HerbalTea = 1
    MPShamanEnhanceSaved.HerbalTea_Value = 20
    MPShamanEnhanceSaved.HerbalTeaMana = 0
    MPShamanEnhanceSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPShamanEnhanceSaved.SuperWoW = 1
    MPShamanEnhanceSaved.UnitXP = 1

    MPShamanEnhanceSaved.RacialTraits = 0
    MPShamanEnhanceSaved.SixT3 = 0
    MPShamanEnhanceSaved.Soulspeed = 0

    MPShamanEnhanceSaved.StormstrikeTotem = 0
    MPShamanEnhanceSaved.EarthShockTotem = 0
    MPShamanEnhanceSaved.ShockTotem = 0

    --MPShamanEnhanceSaved.Force = 0

    --MPShamanEnhanceSaved.Wave_Value = 60
    --MPShamanEnhanceSaved.SecondaryWave_Value = 99
    --MPShamanEnhanceSaved.Chain_Value = 3
    --MPShamanEnhanceSaved.WaterShieldLevel = 0

    MPShamanEnhanceSaved.AutoWaterShield = 0
    MPShamanEnhanceSaved.AutoWaterShield_Value = 1000

    -- 通用
    MPShamanEnhanceSaved.Power = 0
    MPShamanEnhanceSaved.Pick = 0

end


function InitShamanEnhanceSettingsPart1()

    checkButton_EarthShock:SetChecked(ToBoolean(MPShamanEnhanceSaved.EarthShock))
    checkButton_FrostShock:SetChecked( ToBoolean(MPShamanEnhanceSaved.FrostShock) )
    checkButton_FlameShock:SetChecked( ToBoolean(MPShamanEnhanceSaved.FlameShock) )
    checkButton_LightningShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.LightningShield) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.WaterShield) )
    checkButton_EarthShield:SetChecked( ToBoolean(MPShamanEnhanceSaved.EarthShield) )

    checkButton_Target:SetChecked(ToBoolean(MPShamanEnhanceSaved.Target))
    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPShamanEnhanceSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPShamanEnhanceSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPShamanEnhanceSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPShamanEnhanceSaved.TBBoss))
    checkButton_WEnhance:SetChecked(ToBoolean(MPShamanEnhanceSaved.WEnhance))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPShamanEnhanceSaved.RacialTraits))
    checkButton_SixT3:SetChecked(ToBoolean(MPShamanEnhanceSaved.SixT3))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPShamanEnhanceSaved.Soulspeed))
    checkButton_StormstrikeTotem:SetChecked(ToBoolean(MPShamanEnhanceSaved.StormstrikeTotem))
    checkButton_EarthShockTotem:SetChecked(ToBoolean(MPShamanEnhanceSaved.EarthShockTotem))
    checkButton_ShockTotem:SetChecked(ToBoolean(MPShamanEnhanceSaved.ShockTotem))

    checkButton_Power:SetChecked(ToBoolean(MPShamanEnhanceSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPShamanEnhanceSaved.Pick))
end

function MPInitShamanEnhanceSettings()
    if not MPShamanEnhanceSaved then
        MPShamanEnhanceSaved = {}
        MPResetShamanEnhanceSettings()
    end

    if MPShamanEnhanceSaved.Version ~= ShamanEnhanceSettingsUIVersion then
        MPResetShamanEnhanceSettings()
    end

    InitShamanEnhanceSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPShamanEnhanceSaved.HealthStone))
    slider_HealthStone:SetValue(MPShamanEnhanceSaved.HealthStone_Value)
    if MPShamanEnhanceSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanEnhanceSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPShamanEnhanceSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPShamanEnhanceSaved.HerbalTea_Value)
    if MPShamanEnhanceSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanEnhanceSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPShamanEnhanceSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPShamanEnhanceSaved.HerbalTeaMana_Value)
    if MPShamanEnhanceSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanEnhanceSaved.HerbalTeaMana_Value .."%|r")

    checkButton_AutoWaterShield:SetChecked(MPShamanEnhanceSaved.AutoWaterShield)
    slider_AutoWaterShield:SetValue(MPShamanEnhanceSaved.AutoWaterShield_Value)
    if MPShamanEnhanceSaved.AutoWaterShield==1 then
        color_AutoWaterShield = "|cFFFFD100"
    else
        color_AutoWaterShield = "|cFF888888"
    end
    _G[slider_AutoWaterShield:GetName().."Text"]:SetText(color_AutoWaterShield.."蓝量 < ".. MPShamanEnhanceSaved.AutoWaterShield_Value .."|r")



    --slider_Wave_Value:SetValue(MPShamanEnhanceSaved.Wave_Value)
    --slider_SecondaryWave_Value:SetValue(MPShamanEnhanceSaved.SecondaryWave_Value)
    --slider_Chain_Value:SetValue(MPShamanEnhanceSaved.Chain_Value)

    -- 强化武器
    checkButton_WEnhance:SetChecked(ToBoolean(MPShamanEnhanceSaved.WEnhance))
    for idx_WEnhance, data_WEnhance in pairs(modes_WEnhance) do
        if string.find(data_WEnhance.text, MPShamanEnhanceSaved.WEnhance_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_WEnhance, data_WEnhance.value)
            _G[dropdown_WEnhance:GetName().."Text"]:SetText(data_WEnhance.text)
        end
    end

    checkButton_EarthTotem:SetChecked(ToBoolean(MPShamanEnhanceSaved.EarthTotem))
    for idx_EarthTotem, data_EarthTotem in pairs(modes_EarthTotem) do
        if string.find(data_EarthTotem.text, MPShamanEnhanceSaved.EarthTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, data_EarthTotem.value)
            _G[dropdown_EarthTotem:GetName().."Text"]:SetText(data_EarthTotem.text)
        end
    end

    checkButton_FireTotem:SetChecked(ToBoolean(MPShamanEnhanceSaved.FireTotem))
    for idx_FireTotem, data_FireTotem in pairs(modes_FireTotem) do
        if string.find(data_FireTotem.text, MPShamanEnhanceSaved.FireTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_FireTotem, data_FireTotem.value)
            _G[dropdown_FireTotem:GetName().."Text"]:SetText(data_FireTotem.text)
        end
    end

    checkButton_WaterTotem:SetChecked(ToBoolean(MPShamanEnhanceSaved.WaterTotem))
    for idx_WaterTotem, data_WaterTotem in pairs(modes_WaterTotem) do
        if string.find(data_WaterTotem.text, MPShamanEnhanceSaved.WaterTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, data_WaterTotem.value)
            _G[dropdown_WaterTotem:GetName().."Text"]:SetText(data_WaterTotem.text)
        end
    end

    checkButton_AirTotem:SetChecked(ToBoolean(MPShamanEnhanceSaved.AirTotem))
    for idx_AirTotem, data_AirTotem in pairs(modes_AirTotem) do
        if string.find(data_AirTotem.text, MPShamanEnhanceSaved.AirTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_AirTotem, data_AirTotem.value)
            _G[dropdown_AirTotem:GetName().."Text"]:SetText(data_AirTotem.text)
        end
    end

    --[[
    checkButton_RecallTotems:SetChecked(MPShamanEnhanceSaved.RecallTotems)
    slider_RecallTotems:SetValue(MPShamanEnhanceSaved.RecallTotems_Value)
    if MPShamanEnhanceSaved.RecallTotems==1 then
        color_RecallTotems = "|cFFFFD100"
    else
        color_RecallTotems = "|cFF888888"
    end
    _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." ".. MPShamanEnhanceSaved.RecallTotems_Value .." 码距离|r")
    ]]

    checkButton_ForceTotem:SetChecked(ToBoolean(MPShamanEnhanceSaved.ForceTotem))

end

