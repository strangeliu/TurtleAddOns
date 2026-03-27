
-- 定义插件名称
local ADDON_NAME = "Settings-ShamanElemental"


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

-- 创建主框架
CatUISettingsShamanElementalWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 630, "|cFF0070DE设置 - 元素萨|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsShamanElementalWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")






local postion_y = postion_y-40


-- 创建单选框 - 闪电箭
local checkButton_LightningBolt = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_LightningBolt:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
checkButton_LightningBolt:SetScale(0.8)

-- 添加文字标签
local checkText_LightningBolt = checkButton_LightningBolt:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LightningBolt:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LightningBolt:SetTextColor(1, 1, 1)
checkText_LightningBolt:SetPoint("LEFT", checkButton_LightningBolt, "LEFT", 34, 1)
checkText_LightningBolt:SetText("开启 闪电箭")

-- 闪电箭设置点击事件
checkButton_LightningBolt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.LightningBolt = 1
    else
        MPShamanElementalSaved.LightningBolt = 0
    end
end)






-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
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
        MPShamanElementalSaved.Trinket_Upper = 1
    else
        MPShamanElementalSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsShamanElementalWindow, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.TUBoss = 1
    else
        MPShamanElementalSaved.TUBoss = 0
    end
end)





postion_y = postion_y-30



-- 创建单选框 - 熔岩爆裂
local checkButton_LavaBurst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_LavaBurst:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
checkButton_LavaBurst:SetScale(0.8)

-- 添加文字标签
local checkText_LavaBurst = checkButton_LavaBurst:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LavaBurst:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LavaBurst:SetTextColor(1, 1, 1)
checkText_LavaBurst:SetPoint("LEFT", checkButton_LavaBurst, "LEFT", 34, 1)
checkText_LavaBurst:SetText("开启 熔岩爆裂+烈焰震击")

-- 熔岩爆裂设置点击事件
checkButton_LavaBurst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.LavaBurst = 1
    else
        MPShamanElementalSaved.LavaBurst = 0
    end
end)





-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
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
        MPShamanElementalSaved.Trinket_Below = 1
    else
        MPShamanElementalSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsShamanElementalWindow, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.TBBoss = 1
    else
        MPShamanElementalSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30



-- 创建单选框 - 保持 火舌图腾
local checkButton_WEnhance = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_WEnhance:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
checkButton_WEnhance:SetScale(0.8)

-- 添加文字标签
local checkText_WEnhance = checkButton_WEnhance:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WEnhance:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WEnhance:SetTextColor(1, 1, 1)
checkText_WEnhance:SetPoint("LEFT", checkButton_WEnhance, "LEFT", 34, 1)
checkText_WEnhance:SetText("保持 火舌武器")

-- 设置点击事件
checkButton_WEnhance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.WEnhance = 1
    else
        MPShamanElementalSaved.WEnhance = 0
    end
end)



-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
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
        MPShamanElementalSaved.Target = 1
    else
        MPShamanElementalSaved.Target = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 闪电链
local checkButton_ChainLightning = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_ChainLightning:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
checkButton_ChainLightning:SetScale(0.8)

-- 添加文字标签
local checkText_ChainLightning = checkButton_ChainLightning:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ChainLightning:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ChainLightning:SetTextColor(1, 1, 1)
checkText_ChainLightning:SetPoint("LEFT", checkButton_ChainLightning, "LEFT", 34, 1)
checkText_ChainLightning:SetText("开启 闪电链")

-- 设置点击事件
checkButton_ChainLightning:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.ChainLightning = 1
    else
        MPShamanElementalSaved.ChainLightning = 0
    end
end)








postion_y = postion_y-30



-- 创建单选框 - 地震术
local checkButton_EarthSpell = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_EarthSpell:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
checkButton_EarthSpell:SetScale(0.8)

-- 添加文字标签
local checkText_EarthSpell = checkButton_EarthSpell:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_EarthSpell:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_EarthSpell:SetTextColor(1, 1, 1)
checkText_EarthSpell:SetPoint("LEFT", checkButton_EarthSpell, "LEFT", 34, 1)
checkText_EarthSpell:SetText("开启 地震术")

-- 设置点击事件
checkButton_EarthSpell:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.EarthSpell = 1
    else
        MPShamanElementalSaved.EarthSpell = 0
    end
end)




-- 创建单选框 - 闪电之盾
local checkButton_LightningShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_LightningShield:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
checkButton_LightningShield:SetScale(0.8)

-- 添加文字标签
local checkText_LightningShield = checkButton_LightningShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LightningShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LightningShield:SetTextColor(1, 1, 1)
checkText_LightningShield:SetPoint("LEFT", checkButton_LightningShield, "LEFT", 34, 1)
checkText_LightningShield:SetText("保持 闪电之盾 (单选)")



postion_y = postion_y-30

--[[
-- 创建单选框 - 烈焰震击
local checkButton_FlameShock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_FlameShock:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
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
        MPShamanElementalSaved.FlameShock = 1
    else
        MPShamanElementalSaved.FlameShock = 0
    end
end)
]]


-- 创建单选框 - 大地震击
local checkButton_EarthShock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_EarthShock:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
checkButton_EarthShock:SetScale(0.8)

-- 添加文字标签
local checkText_EarthShock = checkButton_EarthShock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_EarthShock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_EarthShock:SetTextColor(1, 1, 1)
checkText_EarthShock:SetPoint("LEFT", checkButton_EarthShock, "LEFT", 34, 1)
checkText_EarthShock:SetText("开启 大地震击 (单选)")








-- 创建单选框 - 水之护盾
local checkButton_WaterShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_WaterShield:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
checkButton_WaterShield:SetScale(0.8)

-- 添加文字标签
local checkText_WaterShield = checkButton_WaterShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WaterShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WaterShield:SetTextColor(1, 1, 1)
checkText_WaterShield:SetPoint("LEFT", checkButton_WaterShield, "LEFT", 34, 1)
checkText_WaterShield:SetText("保持 水之护盾 (单选)")




postion_y = postion_y-30

-- 创建单选框 - 冰霜震击
local checkButton_FrostShock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_FrostShock:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
checkButton_FrostShock:SetScale(0.8)

-- 添加文字标签
local checkText_FrostShock = checkButton_FrostShock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FrostShock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FrostShock:SetTextColor(1, 1, 1)
checkText_FrostShock:SetPoint("LEFT", checkButton_FrostShock, "LEFT", 34, 1)
checkText_FrostShock:SetText("开启 冰霜震击 (单选)")


-- 大地震击设置点击事件
checkButton_EarthShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.EarthShock = 1
        MPShamanElementalSaved.FrostShock = 0
    else
        MPShamanElementalSaved.EarthShock = 0
        MPShamanElementalSaved.FrostShock = 0
    end
    checkButton_EarthShock:SetChecked(ToBoolean(MPShamanElementalSaved.EarthShock))
    checkButton_FrostShock:SetChecked( ToBoolean(MPShamanElementalSaved.FrostShock) )
end)

-- 冰霜震击设置点击事件
checkButton_FrostShock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.FrostShock = 1
        MPShamanElementalSaved.EarthShock = 0
    else
        MPShamanElementalSaved.FrostShock = 0
        MPShamanElementalSaved.EarthShock = 0
    end
    checkButton_EarthShock:SetChecked(ToBoolean(MPShamanElementalSaved.EarthShock))
    checkButton_FrostShock:SetChecked( ToBoolean(MPShamanElementalSaved.FrostShock) )
end)


-- 创建单选框 - 大地之盾
local checkButton_EarthShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_EarthShield:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
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
        MPShamanElementalSaved.EarthShield = 0
        MPShamanElementalSaved.WaterShield = 0
        MPShamanElementalSaved.LightningShield = 1
    else
        MPShamanElementalSaved.EarthShield = 0
        MPShamanElementalSaved.LightningShield = 0
        MPShamanElementalSaved.WaterShield = 0
    end
    checkButton_LightningShield:SetChecked( ToBoolean(MPShamanElementalSaved.LightningShield) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanElementalSaved.WaterShield) )
    checkButton_EarthShield:SetChecked( ToBoolean(MPShamanElementalSaved.EarthShield) )
end)

-- 设置点击事件
checkButton_WaterShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.EarthShield = 0
        MPShamanElementalSaved.WaterShield = 1
        MPShamanElementalSaved.LightningShield = 0
    else
        MPShamanElementalSaved.EarthShield = 0
        MPShamanElementalSaved.WaterShield = 0
        MPShamanElementalSaved.LightningShield = 0
    end
    checkButton_LightningShield:SetChecked( ToBoolean(MPShamanElementalSaved.LightningShield) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanElementalSaved.WaterShield) )
    checkButton_EarthShield:SetChecked( ToBoolean(MPShamanElementalSaved.EarthShield) )
end)

-- 设置点击事件
checkButton_EarthShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.EarthShield = 1
        MPShamanElementalSaved.WaterShield = 0
        MPShamanElementalSaved.LightningShield = 0
    else
        MPShamanElementalSaved.EarthShield = 0
        MPShamanElementalSaved.WaterShield = 0
        MPShamanElementalSaved.LightningShield = 0
    end
    checkButton_LightningShield:SetChecked( ToBoolean(MPShamanElementalSaved.LightningShield) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanElementalSaved.WaterShield) )
    checkButton_EarthShield:SetChecked( ToBoolean(MPShamanElementalSaved.EarthShield) )
end)






-- 图腾

postion_y = postion_y+10

-- 添加提示内容区域
local TipText2 = CatUISettingsShamanElementalWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText2:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
TipText2:SetWidth(250)
TipText2:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText2:SetTextColor(1, 0.8, 0)
TipText2:SetJustifyH("LEFT")
TipText2:SetText("图腾配置")

postion_y = postion_y-90



-- 大地图腾
local checkButton_EarthTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_EarthTotem:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
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
        MPShamanElementalSaved.EarthTotem = 1
    else
        MPShamanElementalSaved.EarthTotem = 0
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
                MPShamanElementalSaved.EarthTotem_Value = modes_EarthTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_EarthTotem, Dropdown_Init_EarthTotem)
UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, 1) -- 默认选中第一项








-- 火焰图腾
local checkButton_FireTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_FireTotem:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 175, postion_y)
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
        MPShamanElementalSaved.FireTotem = 1
    else
        MPShamanElementalSaved.FireTotem = 0
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
                MPShamanElementalSaved.FireTotem_Value = modes_FireTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_FireTotem, Dropdown_Init_FireTotem)
UIDropDownMenu_SetSelectedID(dropdown_FireTotem, 1) -- 默认选中第一项







-- 水之图腾
local checkButton_WaterTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_WaterTotem:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 330, postion_y)
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
        MPShamanElementalSaved.WaterTotem = 1
    else
        MPShamanElementalSaved.WaterTotem = 0
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
                MPShamanElementalSaved.WaterTotem_Value = modes_WaterTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_WaterTotem, Dropdown_Init_WaterTotem)
UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, 1) -- 默认选中第一项





-- 空气图腾
local checkButton_AirTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_AirTotem:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 485, postion_y)
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
        MPShamanElementalSaved.AirTotem = 1
    else
        MPShamanElementalSaved.AirTotem = 0
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
                MPShamanElementalSaved.AirTotem_Value = modes_AirTotem[index].text
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
local checkButton_RecallTotems = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_RecallTotems", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_RecallTotems:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
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
    MPShamanElementalSaved.RecallTotems_Value = arg1
    _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanElementalSaved.RecallTotems_Value .." 码距离|r")
end)

-- 设置点击事件
checkButton_RecallTotems:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.RecallTotems = 1
        color_RecallTotems = "|cFFFFD100"
        _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanElementalSaved.RecallTotems_Value .." 码距离|r")
    else
        MPShamanElementalSaved.RecallTotems = 0
        color_RecallTotems = "|cFF888888"
        _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanElementalSaved.RecallTotems_Value .." 码距离|r")
    end
end)

]]

-- 创建单选框 - 强制图腾
local checkButton_ForceTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForceTotem", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_ForceTotem:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
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
        MPShamanElementalSaved.ForceTotem = 1
    else
        MPShamanElementalSaved.ForceTotem = 0
    end
end)






-- 高级



postion_y = postion_y+40

-- 添加提示内容区域
local TipText1 = CatUISettingsShamanElementalWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-130


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 20, postion_y)
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
        MPShamanElementalSaved.RacialTraits = 1
    else
        MPShamanElementalSaved.RacialTraits = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
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
    MPShamanElementalSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanElementalSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanElementalSaved.HealthStone_Value .."%|r")
    else
        MPShamanElementalSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanElementalSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40





-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
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
    MPShamanElementalSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanElementalSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanElementalSaved.HerbalTea_Value .."%|r")
    else
        MPShamanElementalSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanElementalSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsShamanElementalWindow, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 340, postion_y)
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
    MPShamanElementalSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanElementalSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanElementalSaved.HerbalTeaMana_Value .."%|r")
    else
        MPShamanElementalSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanElementalSaved.HerbalTeaMana_Value .."%|r")
    end
end)



postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsShamanElementalWindow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.Soulspeed = 1
    else
        MPShamanElementalSaved.Soulspeed = 0
    end
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsShamanElementalWindow, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsShamanElementalWindow, "TOPLEFT", 120, -44)
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
    MPResetShamanElementalSettings()
    MPInitShamanElementalSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsShamanElementalWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsShamanElementalWindow, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.Power = 1
    else
        MPShamanElementalSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsShamanElementalWindow, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsShamanElementalWindow, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanElementalSaved.Pick = 1
    else
        MPShamanElementalSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsShamanElementalWindow, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)

-- 添加提示内容区域
local TipText = CatUISettingsShamanElementalWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsShamanElementalWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ 元素萨 |cFF0070DE/sedps|r ]  [ 火萨(忽略自然系) |cFF0070DE/fedps|r ]")



-- 配置文件版本号
local ShamanElementalSettingsUIVersion = 11

function MPResetShamanElementalSettings()

    MPShamanElementalSaved.Version = ShamanElementalSettingsUIVersion

    -- 基本配置

    MPShamanElementalSaved.LightningBolt = 1
    MPShamanElementalSaved.LavaBurst = 1
    MPShamanElementalSaved.ChainLightning = 0
    MPShamanElementalSaved.EarthSpell = 0
    MPShamanElementalSaved.EarthShock = 0
    MPShamanElementalSaved.FrostShock = 0
    MPShamanElementalSaved.FlameShock = 0

    MPShamanElementalSaved.LightningShield = 0
    MPShamanElementalSaved.WaterShield = 1
    MPShamanElementalSaved.EarthShield = 0

    MPShamanElementalSaved.Trinket_Upper = 1
    MPShamanElementalSaved.TUBoss = 0
    MPShamanElementalSaved.Trinket_Below = 1
    MPShamanElementalSaved.TBBoss = 0
    MPShamanElementalSaved.Target = 0
    MPShamanElementalSaved.WEnhance = 0
    MPShamanElementalSaved.WEnhance_Value = "火舌武器"


    MPShamanElementalSaved.EarthTotem = 1
    MPShamanElementalSaved.EarthTotem_Value = "大地之力图腾"
    MPShamanElementalSaved.FireTotem = 1
    MPShamanElementalSaved.FireTotem_Value = "灼热图腾"
    MPShamanElementalSaved.WaterTotem = 1
    MPShamanElementalSaved.WaterTotem_Value = "法力之泉图腾"
    MPShamanElementalSaved.AirTotem = 1
    MPShamanElementalSaved.AirTotem_Value = "风怒图腾"

    MPShamanElementalSaved.RecallTotems = 1
    MPShamanElementalSaved.RecallTotems_Value = 40

    MPShamanElementalSaved.ForceTotem = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPShamanElementalSaved.HealthStone = 1
    MPShamanElementalSaved.HealthStone_Value = 30
    MPShamanElementalSaved.HerbalTea = 1
    MPShamanElementalSaved.HerbalTea_Value = 20
    MPShamanElementalSaved.HerbalTeaMana = 0
    MPShamanElementalSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPShamanElementalSaved.SuperWoW = 1
    MPShamanElementalSaved.UnitXP = 1

    MPShamanElementalSaved.RacialTraits = 0
    MPShamanElementalSaved.Soulspeed = 0

    --MPShamanElementalSaved.Force = 0

    --MPShamanElementalSaved.Wave_Value = 60
    --MPShamanElementalSaved.SecondaryWave_Value = 99
    --MPShamanElementalSaved.Chain_Value = 3
    --MPShamanElementalSaved.WaterShieldLevel = 0

    -- 通用
    MPShamanElementalSaved.Power = 0
    MPShamanElementalSaved.Pick = 0

end


function InitShamanElementalSettingsPart1()

    checkButton_LightningBolt:SetChecked(ToBoolean(MPShamanElementalSaved.LightningBolt))
    checkButton_ChainLightning:SetChecked(ToBoolean(MPShamanElementalSaved.ChainLightning))
    checkButton_EarthSpell:SetChecked(ToBoolean(MPShamanElementalSaved.EarthSpell))
    checkButton_EarthShock:SetChecked(ToBoolean(MPShamanElementalSaved.EarthShock))
    checkButton_FrostShock:SetChecked( ToBoolean(MPShamanElementalSaved.FrostShock) )
    checkButton_LavaBurst:SetChecked( ToBoolean(MPShamanElementalSaved.LavaBurst) )

    checkButton_WEnhance:SetChecked( ToBoolean(MPShamanElementalSaved.WEnhance) )

    checkButton_LightningShield:SetChecked( ToBoolean(MPShamanElementalSaved.LightningShield) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanElementalSaved.WaterShield) )
    checkButton_EarthShield:SetChecked( ToBoolean(MPShamanElementalSaved.EarthShield) )

    checkButton_Target:SetChecked(ToBoolean(MPShamanElementalSaved.Target))
    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPShamanElementalSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPShamanElementalSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPShamanElementalSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPShamanElementalSaved.TBBoss))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPShamanElementalSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPShamanElementalSaved.Soulspeed))

    checkButton_Power:SetChecked(ToBoolean(MPShamanElementalSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPShamanElementalSaved.Pick))
end

function MPInitShamanElementalSettings()
    if not MPShamanElementalSaved then
        MPShamanElementalSaved = {}
        MPResetShamanElementalSettings()
    end

    if MPShamanElementalSaved.Version ~= ShamanElementalSettingsUIVersion then
        MPResetShamanElementalSettings()
    end

    InitShamanElementalSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPShamanElementalSaved.HealthStone))
    slider_HealthStone:SetValue(MPShamanElementalSaved.HealthStone_Value)
    if MPShamanElementalSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanElementalSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPShamanElementalSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPShamanElementalSaved.HerbalTea_Value)
    if MPShamanElementalSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanElementalSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPShamanElementalSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPShamanElementalSaved.HerbalTeaMana_Value)
    if MPShamanElementalSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanElementalSaved.HerbalTeaMana_Value .."%|r")




    checkButton_EarthTotem:SetChecked(ToBoolean(MPShamanElementalSaved.EarthTotem))
    for idx_EarthTotem, data_EarthTotem in pairs(modes_EarthTotem) do
        if string.find(data_EarthTotem.text, MPShamanElementalSaved.EarthTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, data_EarthTotem.value)
            _G[dropdown_EarthTotem:GetName().."Text"]:SetText(data_EarthTotem.text)
        end
    end

    checkButton_FireTotem:SetChecked(ToBoolean(MPShamanElementalSaved.FireTotem))
    for idx_FireTotem, data_FireTotem in pairs(modes_FireTotem) do
        if string.find(data_FireTotem.text, MPShamanElementalSaved.FireTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_FireTotem, data_FireTotem.value)
            _G[dropdown_FireTotem:GetName().."Text"]:SetText(data_FireTotem.text)
        end
    end

    checkButton_WaterTotem:SetChecked(ToBoolean(MPShamanElementalSaved.WaterTotem))
    for idx_WaterTotem, data_WaterTotem in pairs(modes_WaterTotem) do
        if string.find(data_WaterTotem.text, MPShamanElementalSaved.WaterTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, data_WaterTotem.value)
            _G[dropdown_WaterTotem:GetName().."Text"]:SetText(data_WaterTotem.text)
        end
    end

    checkButton_AirTotem:SetChecked(ToBoolean(MPShamanElementalSaved.AirTotem))
    for idx_AirTotem, data_AirTotem in pairs(modes_AirTotem) do
        if string.find(data_AirTotem.text, MPShamanElementalSaved.AirTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_AirTotem, data_AirTotem.value)
            _G[dropdown_AirTotem:GetName().."Text"]:SetText(data_AirTotem.text)
        end
    end


    --[[
    checkButton_RecallTotems:SetChecked(MPShamanElementalSaved.RecallTotems)
    slider_RecallTotems:SetValue(MPShamanElementalSaved.RecallTotems_Value)
    if MPShamanElementalSaved.RecallTotems==1 then
        color_RecallTotems = "|cFFFFD100"
    else
        color_RecallTotems = "|cFF888888"
    end
    _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." ".. MPShamanElementalSaved.RecallTotems_Value .." 码距离|r")
    ]]

    checkButton_ForceTotem:SetChecked(ToBoolean(MPShamanElementalSaved.ForceTotem))

end

