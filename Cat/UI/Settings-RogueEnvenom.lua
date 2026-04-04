
-- 定义插件名称
local ADDON_NAME = "Settings-RogueEnvenom"


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
local checkButton_SliceDice = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_SliceDice:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
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
        MPRogueEnvenomSaved.SliceDice = 1
    else
        MPRogueEnvenomSaved.SliceDice = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
        MPRogueEnvenomSaved.Trinket_Upper = 1
    else
        MPRogueEnvenomSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.TUBoss = 1
    else
        MPRogueEnvenomSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 割裂
local checkButton_Bloody = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Bloody:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
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
        MPRogueEnvenomSaved.Bloody = 1
    else
        MPRogueEnvenomSaved.Bloody = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
        MPRogueEnvenomSaved.Trinket_Below = 1
    else
        MPRogueEnvenomSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.TBBoss = 1
    else
        MPRogueEnvenomSaved.TBBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 毒伤
local checkButton_Envenom = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Envenom:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
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
        MPRogueEnvenomSaved.Envenom = 1
    else
        MPRogueEnvenomSaved.Envenom = 0
    end
end)




-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
        MPRogueEnvenomSaved.Target = 1
    else
        MPRogueEnvenomSaved.Target = 0
    end
end)



postion_y = postion_y-30


-- 创建单选框 - 剔骨
local checkButton_Eviscerate = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Eviscerate:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
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
        MPRogueEnvenomSaved.Eviscerate = 1
    else
        MPRogueEnvenomSaved.Eviscerate = 0
    end
end)


-- 创建单选框 - 鬼魅攻击
local checkButton_GhostlyStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_GhostlyStrike:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
        MPRogueEnvenomSaved.GhostlyStrike = 1
    else
        MPRogueEnvenomSaved.GhostlyStrike = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 佯攻
local checkButton_Feint = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "启用 佯攻 (需要TWT插件)")
checkButton_Feint:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.Feint = 1
    else
        MPRogueEnvenomSaved.Feint = 0
    end
end)




postion_y = postion_y-30




-- 创建单选框 - 双刃毒袭
local checkButton_Backstab = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Backstab:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
checkButton_Backstab:SetScale(0.8)
checkButton_Backstab:Disable()

-- 添加文字标签
local checkText_Backstab = checkButton_Backstab:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Backstab:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Backstab:SetTextColor(1, 1, 1)
checkText_Backstab:SetPoint("LEFT", checkButton_Backstab, "LEFT", 34, 1)
checkText_Backstab:SetText("|cFF888888启用 双刃毒袭 (不可关闭)|r")

-- 设置点击事件
checkButton_Backstab:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.Backstab = 1
    else
        MPRogueEnvenomSaved.Backstab = 0
    end
end)





postion_y = postion_y-30

-- 创建单选框 - 潜行
local checkButton_Stealth = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Stealth:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
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
        MPRogueEnvenomSaved.Stealth = 1
    else
        MPRogueEnvenomSaved.Stealth = 0
    end
end)


-- 创建单选框 - 突袭
local checkButton_SurpriseStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_SurpriseStrike:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
checkButton_SurpriseStrike:SetScale(0.8)
checkButton_SurpriseStrike:Hide()

-- 添加文字标签
local checkText_SurpriseStrike = checkButton_SurpriseStrike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SurpriseStrike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SurpriseStrike:SetTextColor(1, 1, 1)
checkText_SurpriseStrike:SetPoint("LEFT", checkButton_SurpriseStrike, "LEFT", 34, 1)
checkText_SurpriseStrike:SetText("启用 突袭")

-- 设置点击事件
checkButton_SurpriseStrike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.SurpriseStrike = 1
    else
        MPRogueEnvenomSaved.SurpriseStrike = 0
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
        MPRogueEnvenomSaved.MainHand = 1
    else
        MPRogueEnvenomSaved.MainHand = 0
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
                MPRogueEnvenomSaved.MainHand_Value = modes_MainHand[index].text
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

_G[slider_MainHandCount:GetName().."Text"]:SetText("")
_G[slider_MainHandCount:GetName().."Low"]:Hide()
_G[slider_MainHandCount:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_MainHandCount:SetScript("OnValueChanged", function()
    MPRogueEnvenomSaved.MainHandCount = arg1
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..arg1.." 补充")
end)



-- 副手
local checkButton_OffHand = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "副手")
checkButton_OffHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.OffHand = 1
    else
        MPRogueEnvenomSaved.OffHand = 0
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
                MPRogueEnvenomSaved.OffHand_Value = modes_OffHand[index].text
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
    MPRogueEnvenomSaved.OffHandCount = arg1
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..arg1.." 补充")
end)


postion_y = postion_y-100

-- 脱战上毒
local checkButton_LeaveFight = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "补毒药 仅在脱离战斗时")
checkButton_LeaveFight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.LeaveFight = 1
    else
        MPRogueEnvenomSaved.LeaveFight = 0
    end
end)

-- 覆盖旧毒药
local checkButton_Cover = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 340, postion_y, "覆盖原武器上不同的毒药")
checkButton_Cover:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.Cover = 1
    else
        MPRogueEnvenomSaved.Cover = 0
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
local checkButton_UnitXP = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_UnitXP:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
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
        MPRogueEnvenomSaved.UnitXP = 1
    else
        MPRogueEnvenomSaved.UnitXP = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
    MPRogueEnvenomSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueEnvenomSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueEnvenomSaved.HealthStone_Value .."%|r")
    else
        MPRogueEnvenomSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueEnvenomSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 剑刃乱舞
local checkButton_BladeFlurry = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_BladeFlurry:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 20, postion_y)
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
    MPRogueEnvenomSaved.BladeFlurry_Value = arg1
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueEnvenomSaved.BladeFlurry_Value .."码|r")
end)

-- 设置点击事件
checkButton_BladeFlurry:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.BladeFlurry = 1
        color_BladeFlurry = "|cFFFFD100"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueEnvenomSaved.BladeFlurry_Value .."码|r")
    else
        MPRogueEnvenomSaved.BladeFlurry = 0
        color_BladeFlurry = "|cFF888888"
        _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueEnvenomSaved.BladeFlurry_Value .."码|r")
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
    MPRogueEnvenomSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueEnvenomSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueEnvenomSaved.HerbalTea_Value .."%|r")
    else
        MPRogueEnvenomSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueEnvenomSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 保护剑刃乱舞
local checkButton_Protect = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, postion_y, "保护剑刃乱舞 自动取消无用Buff")
checkButton_Protect:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.Protect = 1
    else
        MPRogueEnvenomSaved.Protect = 0
    end
end)







-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Carrot:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
_G[slider_Carrot:GetName().."Low"]:Hide()
_G[slider_Carrot:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_Carrot:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPRogueEnvenomSaved.Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueEnvenomSaved.Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueEnvenomSaved.Carrot_Value .."%|r")
    else
        MPRogueEnvenomSaved.Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueEnvenomSaved.Carrot_Value .."%|r")
    end
end)





postion_y = postion_y-40




-- 创建单选框 - 自动打断
local checkButton_Interrupt = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_Interrupt:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
        MPRogueEnvenomSaved.Interrupt = 1
    else
        MPRogueEnvenomSaved.Interrupt = 0
    end
end)



postion_y = postion_y-40

-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueEnvenom, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 340, postion_y)
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
        MPRogueEnvenomSaved.RacialTraits = 1
    else
        MPRogueEnvenomSaved.RacialTraits = 0
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.Soulspeed = 1
    else
        MPRogueEnvenomSaved.Soulspeed = 0
    end
end)





-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsRogueEnvenom, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsRogueEnvenom, "TOPLEFT", 120, -44)
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
    MPResetRogueEnvenomSettings()
    MPInitRogueEnvenomSettings()
end)


-- 添加分隔线
MPBottomLine(CatUISettingsRogueEnvenom)

local checkButton_Power = MPPublicCheckButton(CatUISettingsRogueEnvenom, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueEnvenomSaved.Power = 1
    else
        MPRogueEnvenomSaved.Power = 0
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
        MPRogueEnvenomSaved.Pick = 1
    else
        MPRogueEnvenomSaved.Pick = 0
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
TipText:SetText("宏命令 -  [ 自动毒伤宏 |cFFFFF569/dsdps|r ]")



-- 配置文件版本号
local RogueEnvenomSettingsUIVersion = 7

function MPResetRogueEnvenomSettings()

    MPRogueEnvenomSaved.Version = RogueEnvenomSettingsUIVersion

    -- 基本配置

    MPRogueEnvenomSaved.Trinket_Upper = 1
    MPRogueEnvenomSaved.TUBoss = 0
    MPRogueEnvenomSaved.Trinket_Below = 1
    MPRogueEnvenomSaved.TBBoss = 0
    MPRogueEnvenomSaved.Target = 0

    MPRogueEnvenomSaved.SliceDice = 1
    MPRogueEnvenomSaved.Bloody = 1
    MPRogueEnvenomSaved.Eviscerate = 1
    MPRogueEnvenomSaved.SurpriseStrike = 1
    MPRogueEnvenomSaved.GhostlyStrike = 0
    MPRogueEnvenomSaved.Backstab = 1
    MPRogueEnvenomSaved.Envenom = 1
    MPRogueEnvenomSaved.ExposeArmor = 0
    MPRogueEnvenomSaved.Stealth = 1
    MPRogueEnvenomSaved.Hemorrhage = 0
    MPRogueEnvenomSaved.Riposte = 0
    MPRogueEnvenomSaved.Feint = 0

    -- 毒药
    MPRogueEnvenomSaved.MainHand = 0
    MPRogueEnvenomSaved.OffHand = 0
    MPRogueEnvenomSaved.MainHand_Value = "溶解毒药 II"
    MPRogueEnvenomSaved.OffHand_Value = "溶解毒药 II"
    MPRogueEnvenomSaved.MainHandCount = 50
    MPRogueEnvenomSaved.OffHandCount = 50
    MPRogueEnvenomSaved.LeaveFight = 0
    MPRogueEnvenomSaved.Cover = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPRogueEnvenomSaved.HealthStone = 1
    MPRogueEnvenomSaved.HealthStone_Value = 30
    MPRogueEnvenomSaved.HerbalTea = 1
    MPRogueEnvenomSaved.HerbalTea_Value = 20
    MPRogueEnvenomSaved.Carrot = 0
    MPRogueEnvenomSaved.Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPRogueEnvenomSaved.SuperWoW = 1
    MPRogueEnvenomSaved.UnitXP = 0

    MPRogueEnvenomSaved.EvisceratePoint = 5
    MPRogueEnvenomSaved.EviscerateEnergy = 30
    MPRogueEnvenomSaved.BloodyPoint = 5
    MPRogueEnvenomSaved.EnvenomPoint = 1
    MPRogueEnvenomSaved.SliceDicePoint = 1

    MPRogueEnvenomSaved.Interrupt = 0
    MPRogueEnvenomSaved.RacialTraits = 0
    MPRogueEnvenomSaved.Soulspeed = 0

    MPRogueEnvenomSaved.LeftTime = 1
    MPRogueEnvenomSaved.LeftTime_Value = 2

    MPRogueEnvenomSaved.BladeFlurry = 0
    MPRogueEnvenomSaved.BladeFlurry_Value = 10
    MPRogueEnvenomSaved.Protect = 0

    -- 通用
    MPRogueEnvenomSaved.Power = 0
    MPRogueEnvenomSaved.Pick = 0


end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function InitRogueEnvenomSettingsPart1()
    checkButton_SliceDice:SetChecked(ToBoolean(MPRogueEnvenomSaved.SliceDice))
    checkButton_Bloody:SetChecked(ToBoolean(MPRogueEnvenomSaved.Bloody))
    checkButton_Eviscerate:SetChecked(ToBoolean(MPRogueEnvenomSaved.Eviscerate))
    checkButton_SurpriseStrike:SetChecked(ToBoolean(MPRogueEnvenomSaved.SurpriseStrike))
    checkButton_GhostlyStrike:SetChecked(ToBoolean(MPRogueEnvenomSaved.GhostlyStrike))
    checkButton_Backstab:SetChecked(ToBoolean(MPRogueEnvenomSaved.Backstab))
    checkButton_Envenom:SetChecked(ToBoolean(MPRogueEnvenomSaved.Envenom))
    checkButton_Stealth:SetChecked(ToBoolean(MPRogueEnvenomSaved.Stealth))
    checkButton_Feint:SetChecked(ToBoolean(MPRogueEnvenomSaved.Feint))

    checkButton_Target:SetChecked(ToBoolean(MPRogueEnvenomSaved.Target))
    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPRogueEnvenomSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPRogueEnvenomSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPRogueEnvenomSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPRogueEnvenomSaved.TBBoss))
    checkButton_UnitXP:SetChecked(ToBoolean(MPRogueEnvenomSaved.UnitXP))

    checkButton_Interrupt:SetChecked(ToBoolean(MPRogueEnvenomSaved.Interrupt))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPRogueEnvenomSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPRogueEnvenomSaved.Soulspeed))

    checkButton_Protect:SetChecked(MPRogueEnvenomSaved.Protect)

    checkButton_LeaveFight:SetChecked(ToBoolean(MPRogueEnvenomSaved.LeaveFight))
    checkButton_Cover:SetChecked(ToBoolean(MPRogueEnvenomSaved.Cover))

    checkButton_Power:SetChecked(ToBoolean(MPRogueEnvenomSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPRogueEnvenomSaved.Pick))
end

function MPInitRogueEnvenomSettings()
    if not MPRogueEnvenomSaved then
        MPRogueEnvenomSaved = {}
        MPResetRogueEnvenomSettings()
    end

    if MPRogueEnvenomSaved.Version ~= RogueEnvenomSettingsUIVersion then
        MPResetRogueEnvenomSettings()
    end

    InitRogueEnvenomSettingsPart1()



    checkButton_HealthStone:SetChecked(ToBoolean(MPRogueEnvenomSaved.HealthStone))
    slider_HealthStone:SetValue(MPRogueEnvenomSaved.HealthStone_Value)
    if MPRogueEnvenomSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueEnvenomSaved.HealthStone_Value .."%|r")



    checkButton_HerbalTea:SetChecked(MPRogueEnvenomSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPRogueEnvenomSaved.HerbalTea_Value)
    if MPRogueEnvenomSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueEnvenomSaved.HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPRogueEnvenomSaved.Carrot)
    slider_Carrot:SetValue(MPRogueEnvenomSaved.Carrot_Value)
    if MPRogueEnvenomSaved.Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueEnvenomSaved.Carrot_Value .."%|r")


    checkButton_BladeFlurry:SetChecked(MPRogueEnvenomSaved.BladeFlurry)
    slider_BladeFlurry_Value:SetValue(MPRogueEnvenomSaved.BladeFlurry_Value)
    if MPRogueEnvenomSaved.BladeFlurry==1 then
        color_BladeFlurry = "|cFFFFD100"
    else
        color_BladeFlurry = "|cFF888888"
    end
    _G[slider_BladeFlurry_Value:GetName().."Text"]:SetText(color_BladeFlurry.."感应范围".. MPRogueEnvenomSaved.BladeFlurry_Value .."码|r")






    checkButton_MainHand:SetChecked(ToBoolean(MPRogueEnvenomSaved.MainHand))
    for idx_MainHand, data_MainHand in pairs(modes_MainHand) do
        if string.find(data_MainHand.text, MPRogueEnvenomSaved.MainHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_MainHand, data_MainHand.value)
            _G[dropdown_MainHand:GetName().."Text"]:SetText(data_MainHand.text)
        end
    end

    checkButton_OffHand:SetChecked(ToBoolean(MPRogueEnvenomSaved.OffHand))
    for idx_OffHand, data_OffHand in pairs(modes_OffHand) do
        if string.find(data_OffHand.text, MPRogueEnvenomSaved.OffHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_OffHand, data_OffHand.value)
            _G[dropdown_OffHand:GetName().."Text"]:SetText(data_OffHand.text)
        end
    end

    slider_MainHandCount:SetValue(MPRogueEnvenomSaved.MainHandCount)
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..MPRogueEnvenomSaved.MainHandCount.." 补充")
    slider_OffHandCount:SetValue(MPRogueEnvenomSaved.OffHandCount)
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..MPRogueEnvenomSaved.OffHandCount.." 补充")

end

