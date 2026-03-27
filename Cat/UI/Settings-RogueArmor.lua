
-- 定义插件名称
local ADDON_NAME = "Settings-RogueArmor"


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
TipText:SetText("基本配置")






local postion_y = postion_y-40

-- 创建单选框 - 切割
local checkButton_SliceDice = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_SliceDice:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
checkButton_SliceDice:SetScale(0.8)

-- 添加文字标签
local checkText_SliceDice = checkButton_SliceDice:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SliceDice:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SliceDice:SetTextColor(1, 1, 1)
checkText_SliceDice:SetPoint("LEFT", checkButton_SliceDice, "LEFT", 34, 1)
checkText_SliceDice:SetText("保持 切割")

-- 设置点击事件
checkButton_SliceDice:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.SliceDice = 1
    else
        MPRogueArmorSaved.SliceDice = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
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
        MPRogueArmorSaved.Trinket_Upper = 1
    else
        MPRogueArmorSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.TUBoss = 1
    else
        MPRogueArmorSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30


-- 创建单选框 - 破甲
local checkButton_ExposeArmor = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_ExposeArmor:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
checkButton_ExposeArmor:SetScale(0.8)

-- 添加文字标签
local checkText_ExposeArmor = checkButton_ExposeArmor:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ExposeArmor:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ExposeArmor:SetTextColor(1, 1, 1)
checkText_ExposeArmor:SetPoint("LEFT", checkButton_ExposeArmor, "LEFT", 34, 1)
checkText_ExposeArmor:SetText("保持 破甲 (五星破甲)")

-- 设置点击事件
checkButton_ExposeArmor:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.ExposeArmor = 1
    else
        MPRogueArmorSaved.ExposeArmor = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
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
        MPRogueArmorSaved.Trinket_Below = 1
    else
        MPRogueArmorSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.TBBoss = 1
    else
        MPRogueArmorSaved.TBBoss = 0
    end
end)


postion_y = postion_y-30



-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
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
        MPRogueArmorSaved.Target = 1
    else
        MPRogueArmorSaved.Target = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 鬼魅攻击
local checkButton_GhostlyStrike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_GhostlyStrike:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
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
        MPRogueArmorSaved.GhostlyStrike = 1
    else
        MPRogueArmorSaved.GhostlyStrike = 0
    end
end)



-- 创建单选框 - 还击
local checkButton_Riposte = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_Riposte:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
checkButton_Riposte:SetScale(0.8)

-- 添加文字标签
local checkText_Riposte = checkButton_Riposte:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Riposte:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Riposte:SetTextColor(1, 1, 1)
checkText_Riposte:SetPoint("LEFT", checkButton_Riposte, "LEFT", 34, 1)
checkText_Riposte:SetText("开启 还击")

-- 设置点击事件
checkButton_Riposte:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.Riposte = 1
    else
        MPRogueArmorSaved.Riposte = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 潜行
local checkButton_Stealth = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_Stealth:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
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
        MPRogueArmorSaved.Stealth = 1
    else
        MPRogueArmorSaved.Stealth = 0
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
        MPRogueArmorSaved.MainHand = 1
    else
        MPRogueArmorSaved.MainHand = 0
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
                MPRogueArmorSaved.MainHand_Value = modes_MainHand[index].text
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

_G[slider_MainHandCount:GetName().."Text"]:SetText("")
_G[slider_MainHandCount:GetName().."Low"]:Hide()
_G[slider_MainHandCount:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_MainHandCount:SetScript("OnValueChanged", function()
    MPRogueArmorSaved.MainHandCount = arg1
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..arg1.." 补充")
end)



-- 副手
local checkButton_OffHand = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "副手")
checkButton_OffHand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.OffHand = 1
    else
        MPRogueArmorSaved.OffHand = 0
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
                MPRogueArmorSaved.OffHand_Value = modes_OffHand[index].text
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
    MPRogueArmorSaved.OffHandCount = arg1
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..arg1.." 补充")
end)


postion_y = postion_y-100

-- 脱战上毒
local checkButton_LeaveFight = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, postion_y, "补毒药 仅在脱离战斗时")
checkButton_LeaveFight:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.LeaveFight = 1
    else
        MPRogueArmorSaved.LeaveFight = 0
    end
end)

-- 覆盖旧毒药
local checkButton_Cover = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, postion_y, "覆盖原武器上不同的毒药")
checkButton_Cover:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.Cover = 1
    else
        MPRogueArmorSaved.Cover = 0
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
TipText1:SetText("高级配置")


postion_y = postion_y-120


-- 创建单选框 - 死亡标记 Marked
local checkButton_Marked = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonMarked", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_Marked:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
checkButton_Marked:SetScale(0.8)

-- 添加文字标签
local checkText_Marked = checkButton_Marked:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Marked:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Marked:SetTextColor(1, 1, 1)
checkText_Marked:SetPoint("LEFT", checkButton_Marked, "LEFT", 34, 1)
checkText_Marked:SetText("启用 死亡标记 (BOSS时)")

-- 设置点击事件
checkButton_Marked:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.Marked = 1
    else
        MPRogueArmorSaved.Marked = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
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
    MPRogueArmorSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueArmorSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueArmorSaved.HealthStone_Value .."%|r")
    else
        MPRogueArmorSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueArmorSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 一星破甲
local checkButton_FirstStar = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonMarked", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_FirstStar:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
checkButton_FirstStar:SetScale(0.8)

-- 添加文字标签
local checkText_FirstStar = checkButton_FirstStar:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FirstStar:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FirstStar:SetTextColor(1, 1, 1)
checkText_FirstStar:SetPoint("LEFT", checkButton_FirstStar, "LEFT", 34, 1)
checkText_FirstStar:SetText("启用 1星破甲填补过渡期")

-- 设置点击事件
checkButton_FirstStar:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.FirstStar = 1
    else
        MPRogueArmorSaved.FirstStar = 0
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
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
    MPRogueArmorSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueArmorSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueArmorSaved.HerbalTea_Value .."%|r")
    else
        MPRogueArmorSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueArmorSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40




-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_Carrot:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
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
    MPRogueArmorSaved.Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueArmorSaved.Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueArmorSaved.Carrot_Value .."%|r")
    else
        MPRogueArmorSaved.Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueArmorSaved.Carrot_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 自动打断
local checkButton_Interrupt = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_Interrupt:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
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
        MPRogueArmorSaved.Interrupt = 1
    else
        MPRogueArmorSaved.Interrupt = 0
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsRogueArmor, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 340, postion_y)
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
        MPRogueArmorSaved.RacialTraits = 1
    else
        MPRogueArmorSaved.RacialTraits = 0
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.Soulspeed = 1
    else
        MPRogueArmorSaved.Soulspeed = 0
    end
end)


--[[
postion_y = postion_y+40+40


-- 剔骨能量
local slider_EviscerateEnergy = CreateFrame("Slider", ADDON_NAME.."SliderEviscerateEnergy", CatUISettingsRogueArmor, "OptionsSliderTemplate")
slider_EviscerateEnergy:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 20, postion_y)
slider_EviscerateEnergy:SetWidth(220) -- 拖动条长度
slider_EviscerateEnergy:SetHeight(16) -- 拖动条高度

slider_EviscerateEnergy:SetMinMaxValues(30, 100)
slider_EviscerateEnergy:SetValueStep(1)
slider_EviscerateEnergy:SetValue(30) -- 默认值
MPCatUISliderRegionHide(slider_EviscerateEnergy)

_G[slider_EviscerateEnergy:GetName().."Text"]:SetText("能量 >=30 剔骨")
_G[slider_EviscerateEnergy:GetName().."Low"]:Hide()
_G[slider_EviscerateEnergy:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_EviscerateEnergy:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    MPRogueArmorSaved.EviscerateEnergy = arg1
    _G[slider_EviscerateEnergy:GetName().."Text"]:SetText("能量 >=".. arg1 .." 剔骨")
end)

]]










-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsRogueArmor, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsRogueArmor, "TOPLEFT", 120, -44)
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
    MPResetRogueArmorSettings()
    MPInitRogueArmorSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsRogueArmor)

local checkButton_Power = MPPublicCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.Power = 1
    else
        MPRogueArmorSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPRogueArmorSaved.Pick = 1
    else
        MPRogueArmorSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsRogueArmor, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
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
TipText:SetText("宏命令 -  [ |cFFFFF569/pjz|r ]")



-- 配置文件版本号
local RogueArmorSettingsUIVersion = 10

function MPResetRogueArmorSettings()

    MPRogueArmorSaved.Version = RogueArmorSettingsUIVersion

    -- 基本配置

    MPRogueArmorSaved.Trinket_Upper = 1
    MPRogueArmorSaved.TUBoss = 0
    MPRogueArmorSaved.Trinket_Below = 1
    MPRogueArmorSaved.TBBoss = 0
    MPRogueArmorSaved.Target = 0
    MPRogueArmorSaved.Riposte = 0

    MPRogueArmorSaved.SliceDice = 1
    MPRogueArmorSaved.Eviscerate = 0
    MPRogueArmorSaved.GhostlyStrike = 0
    MPRogueArmorSaved.Backstab = 1
    MPRogueArmorSaved.ExposeArmor = 1
    MPRogueArmorSaved.Stealth = 1


    -- 毒药
    MPRogueArmorSaved.MainHand = 0
    MPRogueArmorSaved.OffHand = 0
    MPRogueArmorSaved.MainHand_Value = "溶解毒药 II"
    MPRogueArmorSaved.OffHand_Value = "溶解毒药 II"
    MPRogueArmorSaved.MainHandCount = 50
    MPRogueArmorSaved.OffHandCount = 50
    MPRogueArmorSaved.LeaveFight = 0
    MPRogueArmorSaved.Cover = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPRogueArmorSaved.HealthStone = 1
    MPRogueArmorSaved.HealthStone_Value = 30
    MPRogueArmorSaved.HerbalTea = 1
    MPRogueArmorSaved.HerbalTea_Value = 20
    MPRogueArmorSaved.Carrot = 0
    MPRogueArmorSaved.Carrot_Value = 20

    -- SuperWoW,UnitXP
    MPRogueArmorSaved.SuperWoW = 1
    MPRogueArmorSaved.UnitXP = 0

    MPRogueArmorSaved.Marked = 0

    MPRogueArmorSaved.EvisceratePoint = 5
    MPRogueArmorSaved.EviscerateEnergy = 30

    MPRogueArmorSaved.Interrupt = 0
    MPRogueArmorSaved.RacialTraits = 0
    MPRogueArmorSaved.Soulspeed = 0

    MPRogueArmorSaved.FirstStar = 0

    -- 通用
    MPRogueArmorSaved.Power = 0
    MPRogueArmorSaved.Pick = 0


end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function InitRogueArmorSettingsPart1()
    checkButton_SliceDice:SetChecked(ToBoolean(MPRogueArmorSaved.SliceDice))
    checkButton_GhostlyStrike:SetChecked(ToBoolean(MPRogueArmorSaved.GhostlyStrike))
    checkButton_ExposeArmor:SetChecked(ToBoolean(MPRogueArmorSaved.ExposeArmor))
    checkButton_Stealth:SetChecked(ToBoolean(MPRogueArmorSaved.Stealth))
    --checkButton_Eviscerate:SetChecked(ToBoolean(MPRogueArmorSaved.Eviscerate))
    checkButton_Riposte:SetChecked(ToBoolean(MPRogueArmorSaved.Riposte))

    checkButton_Target:SetChecked(ToBoolean(MPRogueArmorSaved.Target))
    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPRogueArmorSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPRogueArmorSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPRogueArmorSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPRogueArmorSaved.TBBoss))

    checkButton_Marked:SetChecked(ToBoolean(MPRogueArmorSaved.Marked))

    checkButton_Interrupt:SetChecked(ToBoolean(MPRogueArmorSaved.Interrupt))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPRogueArmorSaved.RacialTraits))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPRogueArmorSaved.Soulspeed))

    checkButton_LeaveFight:SetChecked(ToBoolean(MPRogueArmorSaved.LeaveFight))
    checkButton_Cover:SetChecked(ToBoolean(MPRogueArmorSaved.Cover))

    checkButton_FirstStar:SetChecked(ToBoolean(MPRogueArmorSaved.FirstStar))

    checkButton_Power:SetChecked(ToBoolean(MPRogueArmorSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPRogueArmorSaved.Pick))
end

function MPInitRogueArmorSettings()
    if not MPRogueArmorSaved then
        MPRogueArmorSaved = {}
        MPResetRogueArmorSettings()
    end

    if MPRogueArmorSaved.Version ~= RogueArmorSettingsUIVersion then
        MPResetRogueArmorSettings()
    end

    InitRogueArmorSettingsPart1()




    checkButton_HealthStone:SetChecked(ToBoolean(MPRogueArmorSaved.HealthStone))
    slider_HealthStone:SetValue(MPRogueArmorSaved.HealthStone_Value)
    if MPRogueArmorSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPRogueArmorSaved.HealthStone_Value .."%|r")



    checkButton_HerbalTea:SetChecked(MPRogueArmorSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPRogueArmorSaved.HerbalTea_Value)
    if MPRogueArmorSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPRogueArmorSaved.HerbalTea_Value .."%|r")


    checkButton_Carrot:SetChecked(MPRogueArmorSaved.Carrot)
    slider_Carrot:SetValue(MPRogueArmorSaved.Carrot_Value)
    if MPRogueArmorSaved.Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPRogueArmorSaved.Carrot_Value .."%|r")


    checkButton_MainHand:SetChecked(ToBoolean(MPRogueArmorSaved.MainHand))
    for idx_MainHand, data_MainHand in pairs(modes_MainHand) do
        if string.find(data_MainHand.text, MPRogueArmorSaved.MainHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_MainHand, data_MainHand.value)
            _G[dropdown_MainHand:GetName().."Text"]:SetText(data_MainHand.text)
        end
    end

    checkButton_OffHand:SetChecked(ToBoolean(MPRogueArmorSaved.OffHand))
    for idx_OffHand, data_OffHand in pairs(modes_OffHand) do
        if string.find(data_OffHand.text, MPRogueArmorSaved.OffHand_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_OffHand, data_OffHand.value)
            _G[dropdown_OffHand:GetName().."Text"]:SetText(data_OffHand.text)
        end
    end

    slider_MainHandCount:SetValue(MPRogueArmorSaved.MainHandCount)
    _G[slider_MainHandCount:GetName().."Text"]:SetText("主手毒药次数 <"..MPRogueArmorSaved.MainHandCount.." 补充")
    slider_OffHandCount:SetValue(MPRogueArmorSaved.OffHandCount)
    _G[slider_OffHandCount:GetName().."Text"]:SetText("副手毒药次数 <"..MPRogueArmorSaved.OffHandCount.." 补充")

end

