
-- 定义插件名称
local ADDON_NAME = "Settings-DriudCOO"

local ConfigCurrent = 1


-- 创建主框架
CatUISettingsCOOWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 480, "|cFFFF7D0A设置 - 鸟德|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsCOOWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 枭兽形态
local checkButton_Shapeshift = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 枭兽形态")
checkButton_Shapeshift:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Shapeshift = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Shapeshift = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Trinket_Upper = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].TUBoss = 1
    else
        MPDriudCOOSaved[ConfigCurrent].TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 月火术
local checkButton_Moonfire = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 月火术")
checkButton_Moonfire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Moonfire = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Moonfire = 0
    end
end)
local checkButton_MoonfireBoss = MPCreateCheckButtonSmall(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_MoonfireBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].MoonfireBoss = 1
    else
        MPDriudCOOSaved[ConfigCurrent].MoonfireBoss = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Trinket_Below = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].TBBoss = 1
    else
        MPDriudCOOSaved[ConfigCurrent].TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 虫群
local checkButton_InsectSwarm = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 虫群")
checkButton_InsectSwarm:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].InsectSwarm = 1
    else
        MPDriudCOOSaved[ConfigCurrent].InsectSwarm = 0
    end
end)
local checkButton_InsectSwarmBoss = MPCreateCheckButtonSmall(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_InsectSwarmBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].InsectSwarmBoss = 1
    else
        MPDriudCOOSaved[ConfigCurrent].InsectSwarmBoss = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Target = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 精灵之火
local checkButton_FaerieFire = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 精灵之火")
checkButton_FaerieFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].FaerieFire = 1
    else
        MPDriudCOOSaved[ConfigCurrent].FaerieFire = 0
    end
end)
local checkButton_FaerieFireBOSS = MPCreateCheckButtonSmall(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 200, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_FaerieFireBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].FaerieFireBOSS = 1
    else
        MPDriudCOOSaved[ConfigCurrent].FaerieFireBOSS = 0
    end
end)









-- 高级

postion_y = postion_y-10

-- 添加提示内容区域
local TipText1 = CatUISettingsCOOWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-80


-- 创建单选框 - 预读星火术 FirstStarfire
local checkButton_FirstStarfire = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, postion_y, "进战斗前预读 星火术")
-- 设置点击事件
checkButton_FirstStarfire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].FirstStarfire = 1
    else
        MPDriudCOOSaved[ConfigCurrent].FirstStarfire = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPDriudCOOSaved[ConfigCurrent].HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCOOSaved[ConfigCurrent].HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCOOSaved[ConfigCurrent].HealthStone_Value .."%|r")
    else
        MPDriudCOOSaved[ConfigCurrent].HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCOOSaved[ConfigCurrent].HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 添加提示内容区域
local StrategyText = CatUISettingsCOOWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
StrategyText:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y+56)
StrategyText:SetWidth(60)
StrategyText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
StrategyText:SetJustifyH("LEFT")
StrategyText:SetTextColor(1, 1, 1)
StrategyText:SetText("策略")

-- 创建单选框 - 策略选择
local checkButton_Strategy1 = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 80, postion_y, "日月交替")
local checkButton_Strategy2 = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 200, postion_y, "愤怒偏向")
-- 设置点击事件
checkButton_Strategy1:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Strategy = 1
    end
    checkButton_Strategy1:SetChecked(true)
    checkButton_Strategy2:SetChecked(false)
end)
checkButton_Strategy2:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Strategy = 2
    end
    checkButton_Strategy1:SetChecked(false)
    checkButton_Strategy2:SetChecked(true)
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPDriudCOOSaved[ConfigCurrent].HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCOOSaved[ConfigCurrent].HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCOOSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    else
        MPDriudCOOSaved[ConfigCurrent].HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCOOSaved[ConfigCurrent].HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    else
        MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Soulspeed = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].SoulspeedBoss = 1
    else
        MPDriudCOOSaved[ConfigCurrent].SoulspeedBoss = 0
    end
end)





postion_y = postion_y + 20


-- 月火<->虫群
local slider_MoonfireInsectSwarm = CreateFrame("Slider", ADDON_NAME.."SliderMoonfireInsectSwarm", CatUISettingsCOOWindow, "OptionsSliderTemplate")
slider_MoonfireInsectSwarm:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y+40)
slider_MoonfireInsectSwarm:SetWidth(220) -- 拖动条长度
slider_MoonfireInsectSwarm:SetHeight(16) -- 拖动条高度
slider_MoonfireInsectSwarm:Hide()

slider_MoonfireInsectSwarm:SetMinMaxValues(1, 2)
slider_MoonfireInsectSwarm:SetValueStep(1)
slider_MoonfireInsectSwarm:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_MoonfireInsectSwarm)

-- 值变化时的回调函数
slider_MoonfireInsectSwarm:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    if arg1==1 then
        _G[slider_MoonfireInsectSwarm:GetName().."Text"]:SetText("优先级：月火 -> 虫群")
        MPDriudCOOSaved[ConfigCurrent].MoonfireInsectSwarm = 1
    elseif arg1==2 then
        _G[slider_MoonfireInsectSwarm:GetName().."Text"]:SetText("优先级：虫群 -> 月火")
        MPDriudCOOSaved[ConfigCurrent].MoonfireInsectSwarm = 2
    end
end)



postion_y = postion_y - 50


-- 月火、虫群 等级
local slider_MILevel = CreateFrame("Slider", ADDON_NAME.."SliderMILevel", CatUISettingsCOOWindow, "OptionsSliderTemplate")
slider_MILevel:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y+40)
slider_MILevel:SetWidth(220) -- 拖动条长度
slider_MILevel:SetHeight(16) -- 拖动条高度

slider_MILevel:SetMinMaxValues(0, 3)
slider_MILevel:SetValueStep(1)
slider_MILevel:SetValue(5) -- 默认值
MPCatUISliderRegionHide(slider_MILevel)

-- 值变化时的回调函数
slider_MILevel:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)

    MPDriudCOOSaved[ConfigCurrent].MILevel = arg1

    if arg1==0 then
        _G[slider_MILevel:GetName().."Text"]:SetText("月火/虫群等级：自动")
    elseif arg1==1 then
        _G[slider_MILevel:GetName().."Text"]:SetText("月火/虫群等级：低")
    elseif arg1==2 then
        _G[slider_MILevel:GetName().."Text"]:SetText("月火/虫群等级：中")
    elseif arg1==3 then
        _G[slider_MILevel:GetName().."Text"]:SetText("月火/虫群等级：高")
    end
end)







--[[
postion_y = postion_y+30

-- 创建单选框 - 神像舞
local checkButton_Idol_Dance = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsCOOWindow, "UICheckButtonTemplate")
checkButton_Idol_Dance:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 340, postion_y)
checkButton_Idol_Dance:SetScale(0.8)

-- 添加文字标签
local checkText_Idol_Dance = checkButton_Idol_Dance:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Idol_Dance:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Idol_Dance:SetTextColor(1, 1, 1)
checkText_Idol_Dance:SetPoint("LEFT", checkButton_Idol_Dance, "LEFT", 34, 1)
checkText_Idol_Dance:SetText("神像舞 (月蚀 切换)")



-- 获取纹理元素（兼容所有版本）
local function GetDownMenuTex(dropdownIn, part)
    return _G[dropdownIn:GetName()..part.."Texture"] or _G[dropdownIn:GetName()..part]
end


-- 创建下拉菜单
local dropdown_Idol_Dance_Low = CreateFrame("Button", ADDON_NAME.."Dropdown_Idol_Dance_Low", checkButton_Idol_Dance, "UIDropDownMenuTemplate")
dropdown_Idol_Dance_Low:SetPoint("TOPLEFT", checkButton_Idol_Dance, "TOPLEFT", -12, -30)

local middle_Idol_Dance_Low = GetDownMenuTex(dropdown_Idol_Dance_Low, "Middle")
middle_Idol_Dance_Low:SetWidth(110) -- 主宽度
middle_Idol_Dance_Low:SetHeight(60) -- 主宽度

-- 定义选项（带固定索引的表）
local modes_Idol_Dance_Low = {
    [1] = {text = "|cFF9D38C8月牙神像|r", item="月牙神像", value = 1},
    [2] = {text = "|cFF0070DD月亮神像|r", item="月亮神像", value = 2},
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Idol_Dance_Low()
    for idx, data in pairs(modes_Idol_Dance_Low) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_Low, index)
                MPDriudCOOSaved[ConfigCurrent].Idol_Dance_Normal = modes_Idol_Dance_Low[index].item
                --message("选择："..modes_Idol_Dance_Low[index].text)
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Idol_Dance_Low, Dropdown_Init_Idol_Dance_Low)
UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_Low, 1) -- 默认选中第一项



-- 创建下拉菜单
local dropdown_Idol_Dance_High = CreateFrame("Button", ADDON_NAME.."CatModeDropdown_Idol_Dance_High", checkButton_Idol_Dance, "UIDropDownMenuTemplate")
dropdown_Idol_Dance_High:SetPoint("TOPLEFT", checkButton_Idol_Dance, "TOPLEFT", 130, -30)

local middle_Idol_Dance_High = GetDownMenuTex(dropdown_Idol_Dance_High, "Middle")
middle_Idol_Dance_High:SetWidth(110) -- 主宽度
middle_Idol_Dance_High:SetHeight(60) -- 主宽度



-- 定义选项（带固定索引的表）
local modes_Idol_Dance_High = {
    [1] = {text = "|cFF9D38C8潮汐神像|r", item="潮汐神像", value = 1},
--    [2] = {text = "|cFF9D38C8撕裂神像|r", value = 2},
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Idol_Dance_High()
    for idx, data in pairs(modes_Idol_Dance_High) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_High, index)
                MPDriudCOOSaved[ConfigCurrent].Idol_Dance_Starfire = modes_Idol_Dance_High[index].item
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Idol_Dance_High, Dropdown_Init_Idol_Dance_High)
UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_High, 1) -- 默认选中第一项

-- 设置点击事件
checkButton_Idol_Dance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Idol_Dance = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Idol_Dance = 0
    end
end)

]]






postion_y = postion_y-60


local myButton = MPCreateButton(CatUISettingsCOOWindow, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetCOOSettings(ConfigCurrent)
    MPInitCOOSettings()
end)


local ConfigButton = {}

-- 创建单选按钮
ConfigButton[1] = CreateFrame("CheckButton", ADDON_NAME.."radio1", CatUISettingsCOOWindow, "UIRadioButtonTemplate")
ConfigButton[1]:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 300, -44)
ConfigButton[1].text = ConfigButton[1]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[1].text:SetPoint("LEFT", ConfigButton[1], "RIGHT", 0, 0)
ConfigButton[1].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[1].text:SetText(" 配置 1")

ConfigButton[2] = CreateFrame("CheckButton", ADDON_NAME.."radio2", CatUISettingsCOOWindow, "UIRadioButtonTemplate")
ConfigButton[2]:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 370, -44)
ConfigButton[2].text = ConfigButton[2]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigButton[2].text:SetPoint("LEFT", ConfigButton[2], "RIGHT", 0, 0)
ConfigButton[2].text:SetFont("Fonts\\FRIZQT__.TTF", 12)
ConfigButton[2].text:SetText(" 配置 2")

ConfigButton[3] = CreateFrame("CheckButton", ADDON_NAME.."radio3", CatUISettingsCOOWindow, "UIRadioButtonTemplate")
ConfigButton[3]:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 440, -44)
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
    MPInitCOOSettings()
end)
ConfigButton[2]:SetScript("OnClick", function()
    ConfigButton[2]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 2]|r")
    ConfigCurrent = 2
    MPInitCOOSettings()
end)
ConfigButton[3]:SetScript("OnClick", function()
    ConfigButton[3]:SetChecked(true)
    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."切换到 [配置 3]|r")
    ConfigCurrent = 3
    MPInitCOOSettings()
end)




local MLDButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsCOOWindow, "UIPanelButtonTemplate")
MLDButton:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 340, postion_y+100)
MLDButton:SetWidth(120)
MLDButton:SetHeight(22)
MLDButton:SetFont("Fonts\\FRIZQT__.TTF", 12)
MLDButton:SetText("多线DOT设置")

-- 调整按钮纹理
MLDButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
MLDButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
MLDButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
MLDButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
-- 按钮点击事件
MLDButton:SetScript("OnClick", function()
    MPCatSettingsCloseAll() 
    CatUISettingsMultilineDot:Show()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsCOOWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Power = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved[ConfigCurrent].Pick = 1
    else
        MPDriudCOOSaved[ConfigCurrent].Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsCOOWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsCOOWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 |cFFFF7D0A/coodps|r [ 1 | 2 | 3 ]    多线Dot |cFFFF7D0A/MDot|r")



-- 配置文件版本号
local COOSettingsUIVersion = 14

function MPResetCOOSettings(config)

    MPDriudCOOSaved.Version = COOSettingsUIVersion

    -- 基本配置

    MPDriudCOOSaved[config].Shapeshift = 1
    MPDriudCOOSaved[config].Moonfire = 1
    MPDriudCOOSaved[config].MoonfireBoss = 0
    MPDriudCOOSaved[config].InsectSwarm = 1
    MPDriudCOOSaved[config].InsectSwarmBoss = 0
    MPDriudCOOSaved[config].FaerieFire = 0
    MPDriudCOOSaved[config].FaerieFireBOSS = 0
    MPDriudCOOSaved[config].Trinket_Upper = 1
    MPDriudCOOSaved[config].TUBoss = 0
    MPDriudCOOSaved[config].Trinket_Below = 1
    MPDriudCOOSaved[config].TBBoss = 0
    MPDriudCOOSaved[config].Target = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPDriudCOOSaved[config].HealthStone = 1
    MPDriudCOOSaved[config].HealthStone_Value = 30
    MPDriudCOOSaved[config].HerbalTea = 1
    MPDriudCOOSaved[config].HerbalTea_Value = 20
    MPDriudCOOSaved[config].HerbalTeaMana = 0
    MPDriudCOOSaved[config].HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPDriudCOOSaved[config].SuperWoW = 1
    MPDriudCOOSaved[config].UnitXP = 1

    MPDriudCOOSaved[config].Strategy = 1

    --MPDriudCOOSaved[config].BOSS = 0
    MPDriudCOOSaved[config].EclipseSun = 0
    MPDriudCOOSaved[config].FirstStarfire = 0

    MPDriudCOOSaved[config].MILevel = 0
    MPDriudCOOSaved[config].MoonfireInsectSwarm = 1

    MPDriudCOOSaved[config].Soulspeed = 0
    MPDriudCOOSaved[config].SoulspeedBoss = 1

    -- 神像相关
    MPDriudCOOSaved[config].Idol_Dance = 0
    MPDriudCOOSaved[config].Idol_Dance_Normal = "月牙神像"
    MPDriudCOOSaved[config].Idol_Dance_Starfire = "潮汐神像"

    -- 通用
    MPDriudCOOSaved[config].Power = 0
    MPDriudCOOSaved[config].Pick = 0
end


local function MPInitCOOSettingsPart1()
    checkButton_Shapeshift:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Shapeshift))
    checkButton_Moonfire:SetChecked( MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Moonfire) )
    checkButton_MoonfireBoss:SetChecked( MPToBoolean(MPDriudCOOSaved[ConfigCurrent].MoonfireBoss) )
    checkButton_InsectSwarm:SetChecked( MPToBoolean(MPDriudCOOSaved[ConfigCurrent].InsectSwarm) )
    checkButton_InsectSwarmBoss:SetChecked( MPToBoolean(MPDriudCOOSaved[ConfigCurrent].InsectSwarmBoss) )
    checkButton_FaerieFire:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].FaerieFire))
    checkButton_FaerieFireBOSS:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].FaerieFireBOSS))
    checkButton_Target:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Target))

    checkButton_Trinket_Upper:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Trinket_Upper))
    checkButton_TUBoss:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].TUBoss))
    checkButton_Trinket_Below:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Trinket_Below))
    checkButton_TBBoss:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].TBBoss))

    if MPDriudCOOSaved[ConfigCurrent].Strategy==1 then
        checkButton_Strategy1:SetChecked(true)
        checkButton_Strategy2:SetChecked(false)
    elseif MPDriudCOOSaved[ConfigCurrent].Strategy==2 then
        checkButton_Strategy1:SetChecked(false)
        checkButton_Strategy2:SetChecked(true)
    end

    checkButton_FirstStarfire:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].FirstStarfire))
    checkButton_Soulspeed:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].SoulspeedBoss))

    checkButton_Power:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Power))
    checkButton_Pick:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Pick))
end

function MPInitCOOSettings()

    if not MPDriudCOOSaved then
        MPDriudCOOSaved = {}
        -- 第一套配置
        if not MPDriudCOOSaved[1] then
            MPDriudCOOSaved[1] = {}
            MPResetCOOSettings(1)
        end

        -- 第二套配置
        if not MPDriudCOOSaved[2] then
            MPDriudCOOSaved[2] = {}
            MPResetCOOSettings(2)
        end

        -- 第三套配置
        if not MPDriudCOOSaved[3] then
            MPDriudCOOSaved[3] = {}
            MPResetCOOSettings(3)
        end
    end

    if MPDriudCOOSaved.Version ~= COOSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[鸟德宏]当前配置，这是新版插件正常数据更新！|r")
        MPDriudCOOSaved[1] = {}
        MPDriudCOOSaved[2] = {}
        MPDriudCOOSaved[3] = {}
        MPResetCOOSettings(1)
        MPResetCOOSettings(2)
        MPResetCOOSettings(3)
    end

    ConfigButton[1]:SetChecked(false)
    ConfigButton[2]:SetChecked(false)
    ConfigButton[3]:SetChecked(false)
    ConfigButton[ConfigCurrent]:SetChecked(true)

    MPInitCOOSettingsPart1()

    checkButton_HealthStone:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].HealthStone))
    slider_HealthStone:SetValue(MPDriudCOOSaved[ConfigCurrent].HealthStone_Value)
    if MPDriudCOOSaved[ConfigCurrent].HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCOOSaved[ConfigCurrent].HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudCOOSaved[ConfigCurrent].HerbalTea)
    slider_HerbalTea:SetValue(MPDriudCOOSaved[ConfigCurrent].HerbalTea_Value)
    if MPDriudCOOSaved[ConfigCurrent].HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCOOSaved[ConfigCurrent].HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana_Value)
    if MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudCOOSaved[ConfigCurrent].HerbalTeaMana_Value .."%|r")


    slider_MoonfireInsectSwarm:SetValue(MPDriudCOOSaved[ConfigCurrent].MoonfireInsectSwarm)
    slider_MILevel:SetValue(MPDriudCOOSaved[ConfigCurrent].MILevel)

    --[[
    -- 神像舞
    checkButton_Idol_Dance:SetChecked(MPToBoolean(MPDriudCOOSaved[ConfigCurrent].Idol_Dance))

    for idx_Idol_Dance_Low, data_Idol_Dance_Low in pairs(modes_Idol_Dance_Low) do
        if string.find(data_Idol_Dance_Low.text,MPDriudCOOSaved[ConfigCurrent].Idol_Dance_Normal) then
            UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_Low, data_Idol_Dance_Low.value)
            _G[dropdown_Idol_Dance_Low:GetName().."Text"]:SetText(data_Idol_Dance_Low.text)
        end
    end

    for idx_Idol_Dance_High, data_Idol_Dance_High in pairs(modes_Idol_Dance_High) do
        if string.find(data_Idol_Dance_High.text,MPDriudCOOSaved[ConfigCurrent].Idol_Dance_Starfire) then
            UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_High, modes_Idol_Dance_High[idx_Idol_Dance_High].value)
            _G[dropdown_Idol_Dance_High:GetName().."Text"]:SetText(data_Idol_Dance_High.text)
        end
    end
    ]]
end

