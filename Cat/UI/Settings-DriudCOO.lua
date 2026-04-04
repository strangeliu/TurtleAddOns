
-- 定义插件名称
local ADDON_NAME = "Settings-DriudCOO"



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
        MPDriudCOOSaved.Shapeshift = 1
    else
        MPDriudCOOSaved.Shapeshift = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.Trinket_Upper = 1
    else
        MPDriudCOOSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.TUBoss = 1
    else
        MPDriudCOOSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 月火术
local checkButton_Moonfire = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 月火术")
checkButton_Moonfire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.Moonfire = 1
    else
        MPDriudCOOSaved.Moonfire = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.Trinket_Below = 1
    else
        MPDriudCOOSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.TBBoss = 1
    else
        MPDriudCOOSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 虫群
local checkButton_InsectSwarm = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 虫群")
checkButton_InsectSwarm:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.InsectSwarm = 1
    else
        MPDriudCOOSaved.InsectSwarm = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.Target = 1
    else
        MPDriudCOOSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 精灵之火
local checkButton_FaerieFire = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 精灵之火")
checkButton_FaerieFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.FaerieFire = 1
    else
        MPDriudCOOSaved.FaerieFire = 0
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


-- 创建单选框 - BOSS
local checkButton_BOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsCOOWindow, "UICheckButtonTemplate")
checkButton_BOSS:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y)
checkButton_BOSS:SetScale(0.8)

-- 添加文字标签
local checkText_BOSS = checkButton_BOSS:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_BOSS:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_BOSS:SetTextColor(1, 1, 1)
checkText_BOSS:SetPoint("LEFT", checkButton_BOSS, "LEFT", 34, 1)
checkText_BOSS:SetText("非BOSS忽略 月火术/虫群")

-- 设置点击事件
checkButton_BOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.BOSS = 1
    else
        MPDriudCOOSaved.BOSS = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsCOOWindow, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 340, postion_y)
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
    MPDriudCOOSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCOOSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCOOSaved.HealthStone_Value .."%|r")
    else
        MPDriudCOOSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCOOSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 非boss不打精灵之火
local checkButton_FaerieFireBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonFaerieFireBOSS", CatUISettingsCOOWindow, "UICheckButtonTemplate")
checkButton_FaerieFireBOSS:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y)
checkButton_FaerieFireBOSS:SetScale(0.8)

-- 添加文字标签
local checkText_FaerieFireBOSS = checkButton_FaerieFireBOSS:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FaerieFireBOSS:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FaerieFireBOSS:SetTextColor(1, 1, 1)
checkText_FaerieFireBOSS:SetPoint("LEFT", checkButton_FaerieFireBOSS, "LEFT", 34, 1)
checkText_FaerieFireBOSS:SetText("非BOSS忽略 精灵之火")

-- 设置点击事件
checkButton_FaerieFireBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.FaerieFireBOSS = 1
    else
        MPDriudCOOSaved.FaerieFireBOSS = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsCOOWindow, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 340, postion_y)
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
    MPDriudCOOSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCOOSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCOOSaved.HerbalTea_Value .."%|r")
    else
        MPDriudCOOSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCOOSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40

--[[
-- 创建单选框 - 等日蚀
local checkButton_EclipseSun = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonEclipseSun", CatUISettingsCOOWindow, "UICheckButtonTemplate")
checkButton_EclipseSun:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y)
checkButton_EclipseSun:SetScale(0.8)

-- 添加文字标签
local checkText_EclipseSun = checkButton_EclipseSun:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_EclipseSun:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_EclipseSun:SetTextColor(1, 1, 1)
checkText_EclipseSun:SetPoint("LEFT", checkButton_EclipseSun, "LEFT", 34, 1)
checkText_EclipseSun:SetText("等待 日蚀")

-- 设置点击事件
checkButton_EclipseSun:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.EclipseSun = 1
    else
        MPDriudCOOSaved.EclipseSun = 0
    end
end)
]]
-- 创建单选框 - 预读星火术 FirstStarfire
local checkButton_FirstStarfire = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonFirstStarfire", CatUISettingsCOOWindow, "UICheckButtonTemplate")
checkButton_FirstStarfire:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 20, postion_y)
checkButton_FirstStarfire:SetScale(0.8)

-- 添加文字标签
local checkText_FirstStarfire = checkButton_FirstStarfire:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FirstStarfire:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FirstStarfire:SetTextColor(1, 1, 1)
checkText_FirstStarfire:SetPoint("LEFT", checkButton_FirstStarfire, "LEFT", 34, 1)
checkText_FirstStarfire:SetText("进战斗前预读 星火术")

-- 设置点击事件
checkButton_FirstStarfire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.FirstStarfire = 1
    else
        MPDriudCOOSaved.FirstStarfire = 0
    end
end)


-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsCOOWindow, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 340, postion_y)
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
    MPDriudCOOSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudCOOSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudCOOSaved.HerbalTeaMana_Value .."%|r")
    else
        MPDriudCOOSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudCOOSaved.HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y - 40




-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsCOOWindow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCOOSaved.Soulspeed = 1
    else
        MPDriudCOOSaved.Soulspeed = 0
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
slider_MoonfireInsectSwarm:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_MoonfireInsectSwarm)

_G[slider_MoonfireInsectSwarm:GetName().."Text"]:SetText("优先级：月火 -> 虫群")
_G[slider_MoonfireInsectSwarm:GetName().."Low"]:Hide()
_G[slider_MoonfireInsectSwarm:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_MoonfireInsectSwarm:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    if arg1==1 then
        _G[slider_MoonfireInsectSwarm:GetName().."Text"]:SetText("优先级：月火 -> 虫群")
        MPDriudCOOSaved.MoonfireInsectSwarm = 1
    elseif arg1==2 then
        _G[slider_MoonfireInsectSwarm:GetName().."Text"]:SetText("优先级：虫群 -> 月火")
        MPDriudCOOSaved.MoonfireInsectSwarm = 2
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
slider_MILevel:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_MILevel)

_G[slider_MILevel:GetName().."Text"]:SetText("月火/虫群等级：自动")
_G[slider_MILevel:GetName().."Low"]:Hide()
_G[slider_MILevel:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_MILevel:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)

    MPDriudCOOSaved.MILevel = arg1

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
                MPDriudCOOSaved.Idol_Dance_Normal = modes_Idol_Dance_Low[index].item
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
                MPDriudCOOSaved.Idol_Dance_Starfire = modes_Idol_Dance_High[index].item
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
        MPDriudCOOSaved.Idol_Dance = 1
    else
        MPDriudCOOSaved.Idol_Dance = 0
    end
end)

]]






postion_y = postion_y-60



-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsCOOWindow, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 120, -44)
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
    MPResetCOOSettings()
    MPInitCOOSettings()
end)


local MLDButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsCOOWindow, "UIPanelButtonTemplate")
MLDButton:SetPoint("TOPLEFT", CatUISettingsCOOWindow, "TOPLEFT", 340, postion_y+100)
MLDButton:SetWidth(100)
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
        MPDriudCOOSaved.Power = 1
    else
        MPDriudCOOSaved.Power = 0
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
        MPDriudCOOSaved.Pick = 1
    else
        MPDriudCOOSaved.Pick = 0
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
TipText:SetText("宏命令 -  [ |cFFFF7D0A/coodps|r ]  [ 多线Dot |cFFFF7D0A/MDot|r (需SuperWoW) ]")



-- 配置文件版本号
local COOSettingsUIVersion = 8

function MPResetCOOSettings()

    MPDriudCOOSaved.Version = COOSettingsUIVersion

    -- 基本配置

    MPDriudCOOSaved.Shapeshift = 1
    MPDriudCOOSaved.Moonfire = 1
    MPDriudCOOSaved.InsectSwarm = 1
    MPDriudCOOSaved.FaerieFire = 0
    MPDriudCOOSaved.Trinket_Upper = 1
    MPDriudCOOSaved.TUBoss = 0
    MPDriudCOOSaved.Trinket_Below = 1
    MPDriudCOOSaved.TBBoss = 0
    MPDriudCOOSaved.Target = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPDriudCOOSaved.HealthStone = 1
    MPDriudCOOSaved.HealthStone_Value = 30
    MPDriudCOOSaved.HerbalTea = 1
    MPDriudCOOSaved.HerbalTea_Value = 20
    MPDriudCOOSaved.HerbalTeaMana = 0
    MPDriudCOOSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPDriudCOOSaved.SuperWoW = 1
    MPDriudCOOSaved.UnitXP = 1

    MPDriudCOOSaved.BOSS = 0
    MPDriudCOOSaved.FaerieFireBOSS = 0
    MPDriudCOOSaved.EclipseSun = 0
    MPDriudCOOSaved.FirstStarfire = 0

    MPDriudCOOSaved.MILevel = 0
    MPDriudCOOSaved.MoonfireInsectSwarm = 1

    MPDriudCOOSaved.Soulspeed = 0

    -- 神像相关
    MPDriudCOOSaved.Idol_Dance = 0
    MPDriudCOOSaved.Idol_Dance_Normal = "月牙神像"
    MPDriudCOOSaved.Idol_Dance_Starfire = "潮汐神像"

    -- 通用
    MPDriudCOOSaved.Power = 0
    MPDriudCOOSaved.Pick = 0
end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function MPInitCOOSettingsPart1()
    checkButton_Shapeshift:SetChecked(ToBoolean(MPDriudCOOSaved.Shapeshift))
    checkButton_Moonfire:SetChecked( ToBoolean(MPDriudCOOSaved.Moonfire) )
    checkButton_InsectSwarm:SetChecked( ToBoolean(MPDriudCOOSaved.InsectSwarm) )
    checkButton_FaerieFire:SetChecked(ToBoolean(MPDriudCOOSaved.FaerieFire))
    checkButton_Target:SetChecked(ToBoolean(MPDriudCOOSaved.Target))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPDriudCOOSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPDriudCOOSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPDriudCOOSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPDriudCOOSaved.TBBoss))

    checkButton_BOSS:SetChecked(ToBoolean(MPDriudCOOSaved.BOSS))
    checkButton_FaerieFireBOSS:SetChecked(ToBoolean(MPDriudCOOSaved.FaerieFireBOSS))
    --checkButton_EclipseSun:SetChecked(ToBoolean(MPDriudCOOSaved.EclipseSun))
    checkButton_FirstStarfire:SetChecked(ToBoolean(MPDriudCOOSaved.FirstStarfire))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPDriudCOOSaved.Soulspeed))

    checkButton_Power:SetChecked(ToBoolean(MPDriudCOOSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPDriudCOOSaved.Pick))
end

function MPInitCOOSettings()
    if not MPDriudCOOSaved then
        MPDriudCOOSaved = {}
        MPResetCOOSettings()
    end

    if MPDriudCOOSaved.Version ~= COOSettingsUIVersion then
        MPResetCOOSettings()
    end

    MPInitCOOSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPDriudCOOSaved.HealthStone))
    slider_HealthStone:SetValue(MPDriudCOOSaved.HealthStone_Value)
    if MPDriudCOOSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCOOSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudCOOSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPDriudCOOSaved.HerbalTea_Value)
    if MPDriudCOOSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCOOSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPDriudCOOSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPDriudCOOSaved.HerbalTeaMana_Value)
    if MPDriudCOOSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPDriudCOOSaved.HerbalTeaMana_Value .."%|r")


    slider_MoonfireInsectSwarm:SetValue(MPDriudCOOSaved.MoonfireInsectSwarm)
    slider_MILevel:SetValue(MPDriudCOOSaved.MILevel)

    --[[
    -- 神像舞
    checkButton_Idol_Dance:SetChecked(ToBoolean(MPDriudCOOSaved.Idol_Dance))

    for idx_Idol_Dance_Low, data_Idol_Dance_Low in pairs(modes_Idol_Dance_Low) do
        if string.find(data_Idol_Dance_Low.text,MPDriudCOOSaved.Idol_Dance_Normal) then
            UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_Low, data_Idol_Dance_Low.value)
            _G[dropdown_Idol_Dance_Low:GetName().."Text"]:SetText(data_Idol_Dance_Low.text)
        end
    end

    for idx_Idol_Dance_High, data_Idol_Dance_High in pairs(modes_Idol_Dance_High) do
        if string.find(data_Idol_Dance_High.text,MPDriudCOOSaved.Idol_Dance_Starfire) then
            UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_High, modes_Idol_Dance_High[idx_Idol_Dance_High].value)
            _G[dropdown_Idol_Dance_High:GetName().."Text"]:SetText(data_Idol_Dance_High.text)
        end
    end
    ]]
end

