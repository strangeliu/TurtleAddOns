
-- 定义插件名称
local ADDON_NAME = "Settings-RogueCombat"


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
local checkButton_SliceDice = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_SliceDice:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_SliceDice:SetScale(0.8)

-- 添加文字标签
local checkText_SliceDice = checkButton_SliceDice:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SliceDice:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SliceDice:SetTextColor(1, 1, 1)
checkText_SliceDice:SetPoint("LEFT", checkButton_SliceDice, "LEFT", 34, 1)
checkText_SliceDice:SetText("开启 切割 (终结技)")

-- 设置点击事件
checkButton_SliceDice:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.SliceDice = 1
    else
        MPRogueCombatSaved.SliceDice = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
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
        MPRogueCombatSaved.Trinket_Upper = 1
    else
        MPRogueCombatSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.TUBoss = 1
    else
        MPRogueCombatSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 割裂
local checkButton_Bloody = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Bloody:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_Bloody:SetScale(0.8)

-- 添加文字标签
local checkText_Bloody = checkButton_Bloody:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Bloody:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Bloody:SetTextColor(1, 1, 1)
checkText_Bloody:SetPoint("LEFT", checkButton_Bloody, "LEFT", 34, 1)
checkText_Bloody:SetText("开启 割裂 (终结技)")

-- 设置点击事件
checkButton_Bloody:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Bloody = 1
    else
        MPRogueCombatSaved.Bloody = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
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
        MPRogueCombatSaved.Trinket_Below = 1
    else
        MPRogueCombatSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.TBBoss = 1
    else
        MPRogueCombatSaved.TBBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 毒伤
local checkButton_Envenom = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Envenom:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_Envenom:SetScale(0.8)

-- 添加文字标签
local checkText_Envenom = checkButton_Envenom:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Envenom:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Envenom:SetTextColor(1, 1, 1)
checkText_Envenom:SetPoint("LEFT", checkButton_Envenom, "LEFT", 34, 1)
checkText_Envenom:SetText("开启 毒伤 (终结技)")

-- 设置点击事件
checkButton_Envenom:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Envenom = 1
    else
        MPRogueCombatSaved.Envenom = 0
    end
end)




-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
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
        MPRogueCombatSaved.Target = 1
    else
        MPRogueCombatSaved.Target = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 剔骨
local checkButton_Eviscerate = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Eviscerate:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_Eviscerate:SetScale(0.8)

-- 添加文字标签
local checkText_Eviscerate = checkButton_Eviscerate:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Eviscerate:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Eviscerate:SetTextColor(1, 1, 1)
checkText_Eviscerate:SetPoint("LEFT", checkButton_Eviscerate, "LEFT", 34, 1)
checkText_Eviscerate:SetText("开启 剔骨 (终结技)")

-- 设置点击事件
checkButton_Eviscerate:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Eviscerate = 1
    else
        MPRogueCombatSaved.Eviscerate = 0
    end
end)



-- 创建单选框 - 鬼魅攻击
local checkButton_GhostlyStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_GhostlyStrike:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
checkButton_GhostlyStrike:SetScale(0.8)

-- 添加文字标签
local checkText_GhostlyStrike = checkButton_GhostlyStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_GhostlyStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_GhostlyStrike:SetTextColor(1, 1, 1)
checkText_GhostlyStrike:SetPoint("LEFT", checkButton_GhostlyStrike, "LEFT", 34, 1)
checkText_GhostlyStrike:SetText("启用 鬼魅攻击")

-- 设置点击事件
checkButton_GhostlyStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.GhostlyStrike = 1
    else
        MPRogueCombatSaved.GhostlyStrike = 0
    end
end)





postion_y = postion_y-30



-- 创建单选框 - 还击
local checkButton_Riposte = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Riposte:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
checkButton_Riposte:SetScale(0.8)

-- 添加文字标签
local checkText_Riposte = checkButton_Riposte:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Riposte:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Riposte:SetTextColor(1, 1, 1)
checkText_Riposte:SetPoint("LEFT", checkButton_Riposte, "LEFT", 34, 1)
checkText_Riposte:SetText("启用 还击")

-- 设置点击事件
checkButton_Riposte:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Riposte = 1
    else
        MPRogueCombatSaved.Riposte = 0
    end
end)



postion_y = postion_y-30




-- 创建单选框 - 背刺攻击
local checkButton_Backstab = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Backstab:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_Backstab:SetScale(0.8)

-- 添加文字标签
local checkText_Backstab = checkButton_Backstab:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Backstab:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Backstab:SetTextColor(1, 1, 1)
checkText_Backstab:SetPoint("LEFT", checkButton_Backstab, "LEFT", 34, 1)
checkText_Backstab:SetText("启用 背刺 (自动识别匕首)")

-- 设置点击事件
checkButton_Backstab:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Backstab = 1
    else
        MPRogueCombatSaved.Backstab = 0
    end
end)



-- 创建单选框 - 突袭
local checkButton_SurpriseStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_SurpriseStrike:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
checkButton_SurpriseStrike:SetScale(0.8)

-- 添加文字标签
local checkText_SurpriseStrike = checkButton_SurpriseStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SurpriseStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SurpriseStrike:SetTextColor(1, 1, 1)
checkText_SurpriseStrike:SetPoint("LEFT", checkButton_SurpriseStrike, "LEFT", 34, 1)
checkText_SurpriseStrike:SetText("启用 突袭")

-- 设置点击事件
checkButton_SurpriseStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.SurpriseStrike = 1
    else
        MPRogueCombatSaved.SurpriseStrike = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 潜行
local checkButton_Stealth = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Stealth:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_Stealth:SetScale(0.8)

-- 添加文字标签
local checkText_Stealth = checkButton_Stealth:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Stealth:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Stealth:SetTextColor(1, 1, 1)
checkText_Stealth:SetPoint("LEFT", checkButton_Stealth, "LEFT", 34, 1)
checkText_Stealth:SetText("潜行时自动 伏击/绞喉")

-- 设置点击事件
checkButton_Stealth:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Stealth = 1
    else
        MPRogueCombatSaved.Stealth = 0
    end
end)

-- 创建单选框 - 佯攻
local checkButton_Feint = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "启用 佯攻 (需要TWT插件)")
checkButton_Feint:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Feint = 1
    else
        MPRogueCombatSaved.Feint = 0
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
        MPRogueCombatSaved.MainHand = 1
    else
        MPRogueCombatSaved.MainHand = 0
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
                MPRogueCombatSaved.MainHand_Value = modes_MainHand[index].text
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

_G[slider_MainHandCount:GetName().."Text"]:SetText("")
_G[slider_MainHandCount:GetName().."Low"]:Hide()
_G[slider_MainHandCount:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_MainHandCount:SetScript("OnValueChanged", function()
    MPRogueCombatSaved.MainHandCount = arg1
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..arg1.." 补充")
end)



-- 副手
local checkButton_OffHand = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "副手")
checkButton_OffHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.OffHand = 1
    else
        MPRogueCombatSaved.OffHand = 0
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
                MPRogueCombatSaved.OffHand_Value = modes_OffHand[index].text
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
    MPRogueCombatSaved.OffHandCount = arg1
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..arg1.." 补充")
end)


postion_y = postion_y-100

-- 脱战上毒
local checkButton_LeaveFight = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, postion_y, "补毒药 仅在脱离战斗时")
checkButton_LeaveFight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.LeaveFight = 1
    else
        MPRogueCombatSaved.LeaveFight = 0
    end
end)

-- 覆盖旧毒药
local checkButton_Cover = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 340, postion_y, "覆盖原武器上不同的毒药")
checkButton_Cover:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Cover = 1
    else
        MPRogueCombatSaved.Cover = 0
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
local checkButton_UnitXP = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_UnitXP:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_UnitXP:SetScale(0.8)

-- 添加文字标签
local checkText_UnitXP = checkButton_UnitXP:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_UnitXP:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_UnitXP:SetTextColor(1, 1, 1)
checkText_UnitXP:SetPoint("LEFT", checkButton_UnitXP, "LEFT", 34, 1)
checkText_UnitXP:SetText("启用UnitXP模组 (朝向判断)")

-- 设置点击事件
checkButton_UnitXP:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.UnitXP = 1
    else
        MPRogueCombatSaved.UnitXP = 0
    end
end)




-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
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

-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPRogueCombatSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueCombatSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueCombatSaved.HealthStone_Value .."%|r")
    else
        MPRogueCombatSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueCombatSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 剑刃乱舞
local checkButton_BladeFlurry = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_BladeFlurry:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_BladeFlurry:SetScale(0.8)

-- 添加文字标签
local checkText_BladeFlurry = checkButton_BladeFlurry:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_BladeFlurry:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_BladeFlurry:SetTextColor(1, 1, 1)
checkText_BladeFlurry:SetPoint("LEFT", checkButton_BladeFlurry, "LEFT", 34, 1)
checkText_BladeFlurry:SetText("自动 剑刃乱舞")


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

_G[slider_BladeFlurry_Value:GetName().."Low"]:Hide()
_G[slider_BladeFlurry_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_BladeFlurry_Value:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPRogueCombatSaved.BladeFlurry_Value = arg1
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueCombatSaved.BladeFlurry_Value .."码|r")
end)

-- 设置点击事件
checkButton_BladeFlurry:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.BladeFlurry = 1
        color_BladeFlurry = "|cFFFFD100"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueCombatSaved.BladeFlurry_Value .."码|r")
    else
        MPRogueCombatSaved.BladeFlurry = 0
        color_BladeFlurry = "|cFF888888"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueCombatSaved.BladeFlurry_Value .."码|r")
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
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

-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPRogueCombatSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueCombatSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueCombatSaved.HerbalTea_Value .."%|r")
    else
        MPRogueCombatSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueCombatSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40



-- 创建单选框 - 背刺 改 邪恶
local checkButton_SinisterStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_SinisterStrike:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_SinisterStrike:SetScale(0.8)

-- 添加文字标签
local checkText_SinisterStrike = checkButton_SinisterStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SinisterStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SinisterStrike:SetTextColor(1, 1, 1)
checkText_SinisterStrike:SetPoint("LEFT", checkButton_SinisterStrike, "LEFT", 34, 1)
checkText_SinisterStrike:SetText("背刺 不可用时启用 邪恶攻击")

-- 设置点击事件
checkButton_SinisterStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.SinisterStrike = 1
    else
        MPRogueCombatSaved.SinisterStrike = 0
    end
end)





-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Carrot:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
checkButton_Carrot:SetScale(0.8)

-- 添加文字标签
local checkText_Carrot = checkButton_Carrot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Carrot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Carrot:SetTextColor(1, 1, 1)
checkText_Carrot:SetPoint("LEFT", checkButton_Carrot, "LEFT", 34, 1)
checkText_Carrot:SetText("自动 鞭根块茎")


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
    MPRogueCombatSaved.Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueCombatSaved.Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueCombatSaved.Carrot_Value .."%|r")
    else
        MPRogueCombatSaved.Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueCombatSaved.Carrot_Value .."%|r")
    end
end)





postion_y = postion_y-40



-- 创建单选框 - 保护剑刃乱舞
local checkButton_Protect = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Protect:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 20, postion_y)
checkButton_Protect:SetScale(0.8)

-- 添加文字标签
local checkText_Protect = checkButton_Protect:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Protect:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Protect:SetTextColor(1, 1, 1)
checkText_Protect:SetPoint("LEFT", checkButton_Protect, "LEFT", 34, 1)
checkText_Protect:SetText("保护剑刃乱舞 自动取消无用Buff")

-- 设置点击事件
checkButton_Protect:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Protect = 1
    else
        MPRogueCombatSaved.Protect = 0
    end
end)


-- 创建单选框 - 自动打断
local checkButton_Interrupt = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_Interrupt:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
checkButton_Interrupt:SetScale(0.8)

-- 添加文字标签
local checkText_Interrupt = checkButton_Interrupt:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Interrupt:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Interrupt:SetTextColor(1, 1, 1)
checkText_Interrupt:SetPoint("LEFT", checkButton_Interrupt, "LEFT", 34, 1)
checkText_Interrupt:SetText("自动 打断读条 (SuperWoW)")

-- 设置点击事件
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Interrupt = 1
    else
        MPRogueCombatSaved.Interrupt = 0
    end
end)



postion_y = postion_y-40

-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueCombat, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 340, postion_y)
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
        MPRogueCombatSaved.RacialTraits = 1
    else
        MPRogueCombatSaved.RacialTraits = 0
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Soulspeed = 1
    else
        MPRogueCombatSaved.Soulspeed = 0
    end
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsRogueCombat, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsRogueCombat, "TOPLEFT", 120, -44)
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
    MPResetRogueCombatSettings()
    MPInitRogueCombatSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsRogueCombat)

local checkButton_Power = MPPublicCheckButton(CatUISettingsRogueCombat, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueCombatSaved.Power = 1
    else
        MPRogueCombatSaved.Power = 0
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
        MPRogueCombatSaved.Pick = 1
    else
        MPRogueCombatSaved.Pick = 0
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
TipText:SetText("宏命令 -  [ 自动战斗宏 |cFFFFF569/zddps|r ]")



-- 配置文件版本号
local RogueCombatSettingsUIVersion = 11

function MPResetRogueCombatSettings()

    MPRogueCombatSaved.Version = RogueCombatSettingsUIVersion

    -- 基本配置

    MPRogueCombatSaved.Trinket_Upper = 1
    MPRogueCombatSaved.TUBoss = 0
    MPRogueCombatSaved.Trinket_Below = 1
    MPRogueCombatSaved.TBBoss = 0
    MPRogueCombatSaved.Target = 0

    MPRogueCombatSaved.SliceDice = 1
    MPRogueCombatSaved.Bloody = 1
    MPRogueCombatSaved.Eviscerate = 1
    MPRogueCombatSaved.SurpriseStrike = 0
    MPRogueCombatSaved.GhostlyStrike = 0
    MPRogueCombatSaved.Backstab = 1
    MPRogueCombatSaved.Envenom = 1
    MPRogueCombatSaved.ExposeArmor = 0
    MPRogueCombatSaved.Stealth = 1
    MPRogueCombatSaved.Hemorrhage = 0
    MPRogueCombatSaved.Riposte = 0
    MPRogueCombatSaved.Feint = 0

    -- 毒药
    MPRogueCombatSaved.MainHand = 0
    MPRogueCombatSaved.OffHand = 0
    MPRogueCombatSaved.MainHand_Value = "溶解毒药 II"
    MPRogueCombatSaved.OffHand_Value = "溶解毒药 II"
    MPRogueCombatSaved.MainHandCount = 50
    MPRogueCombatSaved.OffHandCount = 50
    MPRogueCombatSaved.LeaveFight = 0
    MPRogueCombatSaved.Cover = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPRogueCombatSaved.HealthStone = 1
    MPRogueCombatSaved.HealthStone_Value = 30
    MPRogueCombatSaved.HerbalTea = 1
    MPRogueCombatSaved.HerbalTea_Value = 20
    MPRogueCombatSaved.Carrot = 0
    MPRogueCombatSaved.Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPRogueCombatSaved.SuperWoW = 1
    MPRogueCombatSaved.UnitXP = 0

    MPRogueCombatSaved.EvisceratePoint = 5
    MPRogueCombatSaved.EviscerateEnergy = 30
    MPRogueCombatSaved.BloodyPoint = 5
    MPRogueCombatSaved.EnvenomPoint = 1
    MPRogueCombatSaved.SliceDicePoint = 1

    MPRogueCombatSaved.Interrupt = 0
    MPRogueCombatSaved.RacialTraits = 0
    MPRogueCombatSaved.Soulspeed = 0

    MPRogueCombatSaved.LeftTime = 1
    MPRogueCombatSaved.LeftTime_Value = 2

    MPRogueCombatSaved.BladeFlurry = 0
    MPRogueCombatSaved.BladeFlurry_Value = 10
    MPRogueCombatSaved.Protect = 0
    MPRogueCombatSaved.SinisterStrike = 1

    -- 通用
    MPRogueCombatSaved.Power = 0
    MPRogueCombatSaved.Pick = 0


end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function InitRogueCombatSettingsPart1()
    checkButton_SliceDice:SetChecked(ToBoolean(MPRogueCombatSaved.SliceDice))
    checkButton_Bloody:SetChecked(ToBoolean(MPRogueCombatSaved.Bloody))
    checkButton_Eviscerate:SetChecked(ToBoolean(MPRogueCombatSaved.Eviscerate))
    checkButton_SurpriseStrike:SetChecked(ToBoolean(MPRogueCombatSaved.SurpriseStrike))
    checkButton_GhostlyStrike:SetChecked(ToBoolean(MPRogueCombatSaved.GhostlyStrike))
    checkButton_Backstab:SetChecked(ToBoolean(MPRogueCombatSaved.Backstab))
    checkButton_Envenom:SetChecked(ToBoolean(MPRogueCombatSaved.Envenom))
    checkButton_Stealth:SetChecked(ToBoolean(MPRogueCombatSaved.Stealth))
    checkButton_Riposte:SetChecked(ToBoolean(MPRogueCombatSaved.Riposte))
    checkButton_Feint:SetChecked(ToBoolean(MPRogueCombatSaved.Feint))

    checkButton_Target:SetChecked(ToBoolean(MPRogueCombatSaved.Target))
    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPRogueCombatSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPRogueCombatSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPRogueCombatSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPRogueCombatSaved.TBBoss))
    checkButton_UnitXP:SetChecked(ToBoolean(MPRogueCombatSaved.UnitXP))

    checkButton_Interrupt:SetChecked(ToBoolean(MPRogueCombatSaved.Interrupt))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPRogueCombatSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPRogueCombatSaved.Soulspeed))

    checkButton_Protect:SetChecked(MPRogueCombatSaved.Protect)
    checkButton_SinisterStrike:SetChecked(MPRogueCombatSaved.SinisterStrike)

    checkButton_LeaveFight:SetChecked(ToBoolean(MPRogueCombatSaved.LeaveFight))
    checkButton_Cover:SetChecked(ToBoolean(MPRogueCombatSaved.Cover))

    checkButton_Power:SetChecked(ToBoolean(MPRogueCombatSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPRogueCombatSaved.Pick))
end

function MPInitRogueCombatSettings()
    if not MPRogueCombatSaved then
        MPRogueCombatSaved = {}
        MPResetRogueCombatSettings()
    end

    if MPRogueCombatSaved.Version ~= RogueCombatSettingsUIVersion then
        MPResetRogueCombatSettings()
    end

    InitRogueCombatSettingsPart1()



    checkButton_HealthStone:SetChecked(ToBoolean(MPRogueCombatSaved.HealthStone))
    slider_HealthStone:SetValue(MPRogueCombatSaved.HealthStone_Value)
    if MPRogueCombatSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueCombatSaved.HealthStone_Value .."%|r")


    checkButton_HerbalTea:SetChecked(MPRogueCombatSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPRogueCombatSaved.HerbalTea_Value)
    if MPRogueCombatSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueCombatSaved.HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPRogueCombatSaved.Carrot)
    slider_Carrot:SetValue(MPRogueCombatSaved.Carrot_Value)
    if MPRogueCombatSaved.Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueCombatSaved.Carrot_Value .."%|r")

    checkButton_BladeFlurry:SetChecked(MPRogueCombatSaved.BladeFlurry)
    slider_BladeFlurry_Value:SetValue(MPRogueCombatSaved.BladeFlurry_Value)
    if MPRogueCombatSaved.BladeFlurry==1 then
        color_BladeFlurry = "|cFFFFD100"
    else
        color_BladeFlurry = "|cFF888888"
    end
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueCombatSaved.BladeFlurry_Value .."码|r")



    checkButton_MainHand:SetChecked(ToBoolean(MPRogueCombatSaved.MainHand))
    for idx_MainHand, data_MainHand in pairs(modes_MainHand) do
        if string.find(data_MainHand.text, MPRogueCombatSaved.MainHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_MainHand, data_MainHand.value)
            _G[dropdown_MainHand:GetName().."Text"]:SetText(data_MainHand.text)
        end
    end

    checkButton_OffHand:SetChecked(ToBoolean(MPRogueCombatSaved.OffHand))
    for idx_OffHand, data_OffHand in pairs(modes_OffHand) do
        if string.find(data_OffHand.text, MPRogueCombatSaved.OffHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_OffHand, data_OffHand.value)
            _G[dropdown_OffHand:GetName().."Text"]:SetText(data_OffHand.text)
        end
    end

    slider_MainHandCount:SetValue(MPRogueCombatSaved.MainHandCount)
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..MPRogueCombatSaved.MainHandCount.." 补充")
    slider_OffHandCount:SetValue(MPRogueCombatSaved.OffHandCount)
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..MPRogueCombatSaved.OffHandCount.." 补充")

end

