
-- 定义插件名称
local ADDON_NAME = "Settings-RogueArmor"

local ConfigCurrent = 1

-- 创建主框架
CatUISettingsRogueArmor = MPCreateFrame(ADDON_NAME.."Frame", 520, 650, "|cFFFFF569设置 - 破甲贼|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsRogueArmor:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 切割
local checkButton_SliceDice = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "保持 切割")
-- 设置点击事件
checkButton_SliceDice:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].SliceDice = 1
    else
        MPRogueArmorSaved[ConfigCurrent].SliceDice = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
-- 设置点击事件
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].TUBoss = 1
    else
        MPRogueArmorSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 破甲
local checkButton_ExposeArmor = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "保持 破甲 (五星破甲)")
-- 设置点击事件
checkButton_ExposeArmor:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].ExposeArmor = 1
    else
        MPRogueArmorSaved[ConfigCurrent].ExposeArmor = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
-- 设置点击事件
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].TBBoss = 1
    else
        MPRogueArmorSaved[ConfigCurrent].TBBoss = 0
    end
end)


postion_y = postion_y-30



-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Target = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Target = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 鬼魅攻击
local checkButton_GhostlyStrike = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "启用 鬼魅攻击")
-- 设置点击事件
checkButton_GhostlyStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].GhostlyStrike = 1
    else
        MPRogueArmorSaved[ConfigCurrent].GhostlyStrike = 0
    end
end)



-- 创建单选框 - 还击
local checkButton_Riposte = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "开启 还击")
-- 设置点击事件
checkButton_Riposte:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Riposte = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Riposte = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 潜行
local checkButton_Stealth = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "潜行时自动 伏击/绞喉")
-- 设置点击事件
checkButton_Stealth:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Stealth = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Stealth = 0
    end
end)






-- 毒药


postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsRogueArmor:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(450)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("毒药配置")




postion_y = postion_y-80

-- 主手
local checkButton_MainHand = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "主手")
checkButton_MainHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].MainHand = 1
    else
        MPRogueArmorSaved[ConfigCurrent].MainHand = 0
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
                MPRogueArmorSaved[ConfigCurrent].MainHand_Value = modes_MainHand[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_MainHand, Dropdown_Init_MainHand)
UIDropDownMenu_SetSelectedID(dropdown_MainHand, 1) -- 默认选中第一项


-- 主手毒药次数
local slider_MainHandCount = CreateFrame("Slider", ADDON_NAME.."Slider_MainHandCount", CatUISettingsRogueArmor, "OptionsSliderTemplate")
slider_MainHandCount:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y+10)
slider_MainHandCount:SetWidth(220) -- 拖动条长度
slider_MainHandCount:SetHeight(16) -- 拖动条高度

slider_MainHandCount:SetMinMaxValues(1, 100)
slider_MainHandCount:SetValueStep(1)
slider_MainHandCount:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_MainHandCount)

-- 值变化时的回调函数
slider_MainHandCount:SetScript("OnValueChanged", function()
    MPRogueArmorSaved[ConfigCurrent].MainHandCount = arg1
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..arg1.." 补充")
end)



-- 副手
local checkButton_OffHand = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "副手")
checkButton_OffHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].OffHand = 1
    else
        MPRogueArmorSaved[ConfigCurrent].OffHand = 0
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
                MPRogueArmorSaved[ConfigCurrent].OffHand_Value = modes_OffHand[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_OffHand, Dropdown_Init_OffHand)
UIDropDownMenu_SetSelectedID(dropdown_OffHand, 1) -- 默认选中第一项

-- 副手毒药次数
local slider_OffHandCount = CreateFrame("Slider", ADDON_NAME.."Slider_OffHandCount", CatUISettingsRogueArmor, "OptionsSliderTemplate")
slider_OffHandCount:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 275, postion_y+10)
slider_OffHandCount:SetWidth(220) -- 拖动条长度
slider_OffHandCount:SetHeight(16) -- 拖动条高度

slider_OffHandCount:SetMinMaxValues(1, 100)
slider_OffHandCount:SetValueStep(1)
slider_OffHandCount:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_OffHandCount)

-- 值变化时的回调函数
slider_OffHandCount:SetScript("OnValueChanged", function()
    MPRogueArmorSaved[ConfigCurrent].OffHandCount = arg1
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..arg1.." 补充")
end)


postion_y = postion_y-100

-- 脱战上毒
local checkButton_LeaveFight = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "补毒药 仅在脱离战斗时")
checkButton_LeaveFight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].LeaveFight = 1
    else
        MPRogueArmorSaved[ConfigCurrent].LeaveFight = 0
    end
end)

-- 覆盖旧毒药
local checkButton_Cover = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "覆盖原武器上不同的毒药")
checkButton_Cover:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Cover = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Cover = 0
    end
end)







-- 高级



postion_y = postion_y+30

-- 添加提示内容区域
local TipText1 = CatUISettingsRogueArmor:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-120


-- 创建单选框 - 死亡标记 Marked
local checkButton_Marked = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "启用 死亡标记")
-- 设置点击事件
checkButton_Marked:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Marked = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Marked = 0
    end
end)
local checkButton_MarkedBoss = MPCreateCheckButtonSmall(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_MarkedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].MarkedBoss = 1
    else
        MPRogueArmorSaved[ConfigCurrent].MarkedBoss = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPRogueArmorSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueArmorSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueArmorSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPRogueArmorSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueArmorSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 一星破甲
local checkButton_FirstStar = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "启用 1星破甲填补过渡期")
-- 设置点击事件
checkButton_FirstStar:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].FirstStar = 1
    else
        MPRogueArmorSaved[ConfigCurrent].FirstStar = 0
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPRogueArmorSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueArmorSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueArmorSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPRogueArmorSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueArmorSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40




-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "自动 鞭根块茎")

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
    MPRogueArmorSaved[ConfigCurrent].Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueArmorSaved[ConfigCurrent].Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueArmorSaved[ConfigCurrent].Carrot_Value .."%|r")
    else
        MPRogueArmorSaved[ConfigCurrent].Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueArmorSaved[ConfigCurrent].Carrot_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 自动打断
local checkButton_Interrupt = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "自动 打断读条 (SuperWoW)")
-- 设置点击事件
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Interrupt = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Interrupt = 0
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋")
-- 设置点击事件
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].RacialTraits = 1
    else
        MPRogueArmorSaved[ConfigCurrent].RacialTraits = 0
    end
end)
local checkButton_RacialTraitsBoss = MPCreateCheckButtonSmall(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RacialTraitsBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].RacialTraitsBoss = 1
    else
        MPRogueArmorSaved[ConfigCurrent].RacialTraitsBoss = 0
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Soulspeed = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPRogueArmorSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)





-- 创建按钮
local myButton = MPCreateButton(CatUISettingsRogueArmor, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetRogueArmorSettings(ConfigCurrent)
    MPInitRogueArmorSettings()
end)

local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsRogueArmor, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsRogueArmor, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsRogueArmor, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 440, -44)
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
    MPInitRogueArmorSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitRogueArmorSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitRogueArmorSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsRogueArmor)

local checkButton_Power = MPPublicCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Power = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved[ConfigCurrent].Pick = 1
    else
        MPRogueArmorSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsRogueArmor:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsRogueArmor, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFFF569/pjz|r [ 1 | 2 | 3 ]")



-- 配置文件版本号
local RogueArmorSettingsUIVersion = 12

function MPResetRogueArmorSettings(config)

    MPRogueArmorSaved.Version = RogueArmorSettingsUIVersion

    -- 基本配置

    MPRogueArmorSaved[config].Trinket_Upper = 1
    MPRogueArmorSaved[config].TUBoss = 0
    MPRogueArmorSaved[config].Trinket_Below = 1
    MPRogueArmorSaved[config].TBBoss = 0
    MPRogueArmorSaved[config].Target = 0
    MPRogueArmorSaved[config].Riposte = 0

    MPRogueArmorSaved[config].SliceDice = 1
    MPRogueArmorSaved[config].Eviscerate = 0
    MPRogueArmorSaved[config].GhostlyStrike = 0
    MPRogueArmorSaved[config].Backstab = 1
    MPRogueArmorSaved[config].ExposeArmor = 1
    MPRogueArmorSaved[config].Stealth = 1


    -- 毒药
    MPRogueArmorSaved[config].MainHand = 0
    MPRogueArmorSaved[config].OffHand = 0
    MPRogueArmorSaved[config].MainHand_Value = "溶解毒药 II"
    MPRogueArmorSaved[config].OffHand_Value = "溶解毒药 II"
    MPRogueArmorSaved[config].MainHandCount = 50
    MPRogueArmorSaved[config].OffHandCount = 50
    MPRogueArmorSaved[config].LeaveFight = 0
    MPRogueArmorSaved[config].Cover = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPRogueArmorSaved[config].HealthStone = 1
    MPRogueArmorSaved[config].HealthStone_Value = 30
    MPRogueArmorSaved[config].HerbalTea = 1
    MPRogueArmorSaved[config].HerbalTea_Value = 20
    MPRogueArmorSaved[config].Carrot = 0
    MPRogueArmorSaved[config].Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPRogueArmorSaved[config].SuperWoW = 1
    MPRogueArmorSaved[config].UnitXP = 0

    MPRogueArmorSaved[config].Marked = 0
    MPRogueArmorSaved[config].MarkedBoss = 1

    MPRogueArmorSaved[config].EvisceratePoint = 5
    MPRogueArmorSaved[config].EviscerateEnergy = 30

    MPRogueArmorSaved[config].Interrupt = 0
    MPRogueArmorSaved[config].RacialTraits = 0
    MPRogueArmorSaved[config].RacialTraitsBoss = 1
    MPRogueArmorSaved[config].Soulspeed = 0
    MPRogueArmorSaved[config].SoulspeedBoss = 1

    MPRogueArmorSaved[config].FirstStar = 0

    -- 通用
    MPRogueArmorSaved[config].Power = 0
    MPRogueArmorSaved[config].Pick = 0


end


local function InitRogueArmorSettingsPart1()
    checkButton_SliceDice:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].SliceDice))
    checkButton_GhostlyStrike:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].GhostlyStrike))
    checkButton_ExposeArmor:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].ExposeArmor))
    checkButton_Stealth:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Stealth))
    --checkButton_Eviscerate:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Eviscerate))
    checkButton_Riposte:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Riposte))

    checkButton_Target:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Target))
    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].TBBoss))

    checkButton_Marked:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Marked))
    checkButton_MarkedBoss:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].MarkedBoss))

    checkButton_Interrupt:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Interrupt))
    checkButton_RacialTraits:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].RacialTraits))
    checkButton_RacialTraitsBoss:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].RacialTraitsBoss))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].SoulspeedBoss))

    checkButton_LeaveFight:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].LeaveFight))
    checkButton_Cover:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Cover))

    checkButton_FirstStar:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].FirstStar))

    checkButton_Power:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].Pick))
end

function MPInitRogueArmorSettings()
    if not MPRogueArmorSaved then
        MPRogueArmorSaved = {}

        -- 第一套配置
        if not MPRogueArmorSaved[1] then
            MPRogueArmorSaved[1] = {}
            MPResetRogueArmorSettings(1)
        end

        -- 第二套配置
        if not MPRogueArmorSaved[2] then
            MPRogueArmorSaved[2] = {}
            MPResetRogueArmorSettings(2)
        end

        -- 第三套配置
        if not MPRogueArmorSaved[3] then
            MPRogueArmorSaved[3] = {}
            MPResetRogueArmorSettings(3)
        end
    end

    if MPRogueArmorSaved.Version ~= RogueArmorSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[破甲贼宏]当前配置，这是新版插件正常数据更新！|r")
        MPRogueArmorSaved[1] = {}
        MPRogueArmorSaved[2] = {}
        MPRogueArmorSaved[3] = {}
        MPResetRogueArmorSettings(1)
        MPResetRogueArmorSettings(2)
        MPResetRogueArmorSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    InitRogueArmorSettingsPart1()




    checkButton_HealthStone:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPRogueArmorSaved[ConfigCurrent].HealthStone_Value)
    if MPRogueArmorSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueArmorSaved[ConfigCurrent].HealthStone_Value .."%|r")



    checkButton_HerbalTea:SetChecked(MPRogueArmorSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPRogueArmorSaved[ConfigCurrent].HerbalTea_Value)
    if MPRogueArmorSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueArmorSaved[ConfigCurrent].HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPRogueArmorSaved[ConfigCurrent].Carrot)
    slider_Carrot:SetValue(MPRogueArmorSaved[ConfigCurrent].Carrot_Value)
    if MPRogueArmorSaved[ConfigCurrent].Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueArmorSaved[ConfigCurrent].Carrot_Value .."%|r")


    checkButton_MainHand:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].MainHand))
    for idx_MainHand, data_MainHand in pairs(modes_MainHand) do
        if string.find(data_MainHand.text, MPRogueArmorSaved[ConfigCurrent].MainHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_MainHand, data_MainHand.value)
            _G[dropdown_MainHand:GetName().."Text"]:SetText(data_MainHand.text)
        end
    end

    checkButton_OffHand:SetChecked(MPToBoolean(MPRogueArmorSaved[ConfigCurrent].OffHand))
    for idx_OffHand, data_OffHand in pairs(modes_OffHand) do
        if string.find(data_OffHand.text, MPRogueArmorSaved[ConfigCurrent].OffHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_OffHand, data_OffHand.value)
            _G[dropdown_OffHand:GetName().."Text"]:SetText(data_OffHand.text)
        end
    end

    slider_MainHandCount:SetValue(MPRogueArmorSaved[ConfigCurrent].MainHandCount)
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..MPRogueArmorSaved[ConfigCurrent].MainHandCount.." 补充")
    slider_OffHandCount:SetValue(MPRogueArmorSaved[ConfigCurrent].OffHandCount)
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..MPRogueArmorSaved[ConfigCurrent].OffHandCount.." 补充")

end

