
-- 定义插件名称
local ADDON_NAME = "Settings-DriudCat"


-- 创建主框架
CatUISettingsCatWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 660, "|cFFFF7D0A设置 - 猫德|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsCatWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)


local postion_y = postion_y-40

-- 创建单选框 - 变身回能
local checkButton_Shapeshift = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 20, postion_y, "启用 重整 (变身回能)")
checkButton_Shapeshift:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Shapeshift = 1
    else
        MPDriudCatSaved.Shapeshift = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Trinket_Upper = 1
    else
        MPDriudCatSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.TUBoss = 1
    else
        MPDriudCatSaved.TUBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 猛虎之怒
local checkButton_TigerFury = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 猛虎之怒")
checkButton_TigerFury:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.TigerFury = 1
    else
        MPDriudCatSaved.TigerFury = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Trinket_Below = 1
    else
        MPDriudCatSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.TBBoss = 1
    else
        MPDriudCatSaved.TBBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 精灵之火
local checkButton_FaerieFire = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 精灵之火")
checkButton_FaerieFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.FaerieFire = 1
    else
        MPDriudCatSaved.FaerieFire = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Target = 1
    else
        MPDriudCatSaved.Target = 0
    end
end)

postion_y = postion_y-30


-- 创建单选框 - 潜行
local checkButton_Prowl = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 20, postion_y, "潜行时自动 突袭/毁灭")
checkButton_Prowl:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Prowl = 1
    else
        MPDriudCatSaved.Prowl = 0
    end
end)


-- 创建单选框 - 畏缩
local checkButton_Cower = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 畏缩 (需要TWT插件)")
checkButton_Cower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Cower = 1
    else
        MPDriudCatSaved.Cower = 0
    end
end)





-- 高级


postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsCatWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-70


-- 创建单选框 - UnitXP
local checkButton_UnitXP = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 20, postion_y, "启用UnitXP模组 (朝向判断)")
checkButton_UnitXP:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.UnitXP = 1
    else
        MPDriudCatSaved.UnitXP = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 治疗石")

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
    MPDriudCatSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCatSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCatSaved.HealthStone_Value .."%|r")
    else
        MPDriudCatSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCatSaved.HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 阿莎曼之怒
local checkButton_Ashamane = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsCatWindow, "UICheckButtonTemplate")
checkButton_Ashamane:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 20, postion_y)
checkButton_Ashamane:SetScale(0.8)

-- 添加文字标签
local checkText_Ashamane = checkButton_Ashamane:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Ashamane:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Ashamane:SetTextColor(1, 1, 1)
checkText_Ashamane:SetPoint("LEFT", checkButton_Ashamane, "LEFT", 34, 1)
checkText_Ashamane:SetText("阿莎曼之怒 (T3.5特性倾斜)")

-- 设置点击事件
checkButton_Ashamane:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Ashamane = 1
    else
        MPDriudCatSaved.Ashamane = 0
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 草药茶")

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
    MPDriudCatSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCatSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCatSaved.HerbalTea_Value .."%|r")
    else
        MPDriudCatSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCatSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 树皮术
local checkButton_Barkskin = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动 树皮术")

local slider_Barkskin = CreateFrame("Slider", ADDON_NAME.."Slider_Barkskin", checkButton_Barkskin, "OptionsSliderTemplate")
slider_Barkskin:SetPoint("RIGHT", checkButton_Barkskin, "RIGHT", 250, -2)
slider_Barkskin:SetWidth(150) -- 拖动条长度
slider_Barkskin:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Barkskin:SetMinMaxValues(0, 100)
slider_Barkskin:SetValueStep(1)
slider_Barkskin:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Barkskin)

local color_Barkskin = "|cFFFFD100"

_G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: 20%|r")
-- 值变化时的回调函数
slider_Barkskin:SetScript("OnValueChanged", function()
    --print("Berserk当前值:", arg1)
    MPDriudCatSaved.Barkskin_Value = arg1
    _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Barkskin:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Barkskin = 1
        color_Barkskin = "|cFFFFD100"
        _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudCatSaved.Barkskin_Value .."%|r")
    else
        MPDriudCatSaved.Barkskin = 0
        color_Barkskin = "|cFF888888"
        _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudCatSaved.Barkskin_Value .."%|r")
    end
end)




-- 双流血

local ripBack = CreateFrame("Frame", nil, CatUISettingsCatWindow)
ripBack:SetWidth(240)
ripBack:SetHeight(130)
ripBack:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 10, postion_y+50)
ripBack:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 8,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
ripBack:SetBackdropColor(0.1, 0.1, 0.2, 0.45)

local ripBackText = ripBack:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
ripBackText:SetPoint("TOPLEFT", ripBack, "TOPLEFT", 0, 8)
ripBackText:SetWidth(250)
ripBackText:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
ripBackText:SetTextColor(1, 1, 1)
ripBackText:SetJustifyH("CENTER")
ripBackText:SetText("双流血")


postion_y = postion_y+20

-- 撕咬星
local slider_Ferocious = CreateFrame("Slider", ADDON_NAME.."SliderFerocious", CatUISettingsCatWindow, "OptionsSliderTemplate")
slider_Ferocious:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 15, postion_y)
slider_Ferocious:SetWidth(110) -- 拖动条长度
slider_Ferocious:SetHeight(16) -- 拖动条高度

slider_Ferocious:SetMinMaxValues(1, 5)
slider_Ferocious:SetValueStep(1)
slider_Ferocious:SetValue(3) -- 默认值
MPCatUISliderRegionHide(slider_Ferocious)


-- 值变化时的回调函数
slider_Ferocious:SetScript("OnValueChanged", function()
    MPDriudCatSaved.Ferocious_Bite = arg1
    _G[slider_Ferocious:GetName().."Text"]:SetText("撕咬: ".. arg1 .."星")
end)


-- 撕咬 能量
local slider_Ferocious_Value = CreateFrame("Slider", ADDON_NAME.."SliderFerocious_Value", CatUISettingsCatWindow, "OptionsSliderTemplate")
slider_Ferocious_Value:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 135, postion_y)
slider_Ferocious_Value:SetWidth(110) -- 拖动条长度
slider_Ferocious_Value:SetHeight(16) -- 拖动条高度

slider_Ferocious_Value:SetMinMaxValues(36, 100)
slider_Ferocious_Value:SetValueStep(1)
slider_Ferocious_Value:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_Ferocious_Value)


-- 值变化时的回调函数
slider_Ferocious_Value:SetScript("OnValueChanged", function()
    MPDriudCatSaved.Ferocious_Value = arg1

    _G[slider_Ferocious_Value:GetName().."Text"]:SetText("撕咬<"..arg1.."能量")
end)




postion_y = postion_y-40

-- 变身 双流血
local slider_BleedModeShapeshift = CreateFrame("Slider", ADDON_NAME.."SliderBleedModeShapeshift", CatUISettingsCatWindow, "OptionsSliderTemplate")
slider_BleedModeShapeshift:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 15, postion_y)
slider_BleedModeShapeshift:SetWidth(110) -- 拖动条长度
slider_BleedModeShapeshift:SetHeight(16) -- 拖动条高度

slider_BleedModeShapeshift:SetMinMaxValues(10, 50)
slider_BleedModeShapeshift:SetValueStep(1)
slider_BleedModeShapeshift:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_BleedModeShapeshift)

-- 值变化时的回调函数
slider_BleedModeShapeshift:SetScript("OnValueChanged", function()
    MPDriudCatSaved.BleedModeShapeshift = arg1

    _G[slider_BleedModeShapeshift:GetName().."Text"]:SetText("变身<"..arg1.."能量")
end)


-- 撕扯界限
local slider_Rip = CreateFrame("Slider", ADDON_NAME.."SliderRip", CatUISettingsCatWindow, "OptionsSliderTemplate")
slider_Rip:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 135, postion_y)
slider_Rip:SetWidth(110) -- 拖动条长度
slider_Rip:SetHeight(16) -- 拖动条高度

slider_Rip:SetMinMaxValues(0, 20000)
slider_Rip:SetValueStep(1000)
slider_Rip:SetValue(3000) -- 默认值
MPCatUISliderRegionHide(slider_Rip)


-- 值变化时的回调函数
slider_Rip:SetScript("OnValueChanged", function()
    --print("Rip当前值:", arg1)
    MPDriudCatSaved.OutHPRip = arg1
    _G[slider_Rip:GetName().."Text"]:SetText("<".. arg1/1000 .."k不撕扯")
end)

-- 设置悬停提示
slider_Rip:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
    GameTooltip:AddLine("目标血量过低，不足撕扯跳伤害时间，提前凶猛撕咬", 0.8, 0.8, 0.8)
    GameTooltip:Show()
end)

slider_Rip:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)


postion_y = postion_y-150




-- BOSS
local checkButton_BOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsCatWindow, "UICheckButtonTemplate")
checkButton_BOSS:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 20, postion_y+30)
checkButton_BOSS:SetScale(0.8)

-- 添加文字标签
local checkText_BOSS = checkButton_BOSS:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_BOSS:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_BOSS:SetTextColor(1, 1, 1)
checkText_BOSS:SetPoint("LEFT", checkButton_BOSS, "LEFT", 34, 1)
checkText_BOSS:SetText("非BOSS级 禁用撕扯")

-- 设置点击事件
checkButton_BOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.BOSS = 1
    else
        MPDriudCatSaved.BOSS = 0
    end
end)


-- 背刺流

postion_y = postion_y+75

local ShredBack = CreateFrame("Frame", nil, CatUISettingsCatWindow)
ShredBack:SetWidth(240)
ShredBack:SetHeight(100)
ShredBack:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 10, postion_y)
ShredBack:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 8,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
ShredBack:SetBackdropColor(0.1, 0.1, 0.2, 0.45)

local ShredBackText = ShredBack:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
ShredBackText:SetPoint("TOPLEFT", ShredBack, "TOPLEFT", 0, 8)
ShredBackText:SetWidth(250)
ShredBackText:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE") -- 使用OUTLINE参数
ShredBackText:SetTextColor(1, 1, 1)
ShredBackText:SetJustifyH("CENTER")
ShredBackText:SetText("背刺流")

postion_y = postion_y-30

-- 背刺撕咬星
local slider_ShredFerocious = CreateFrame("Slider", ADDON_NAME.."SliderShredFerocious", CatUISettingsCatWindow, "OptionsSliderTemplate")
slider_ShredFerocious:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 15, postion_y)
slider_ShredFerocious:SetWidth(110) -- 拖动条长度
slider_ShredFerocious:SetHeight(16) -- 拖动条高度

slider_ShredFerocious:SetMinMaxValues(1, 5)
slider_ShredFerocious:SetValueStep(1)
slider_ShredFerocious:SetValue(3) -- 默认值
MPCatUISliderRegionHide(slider_ShredFerocious)

-- 值变化时的回调函数
slider_ShredFerocious:SetScript("OnValueChanged", function()
    MPDriudCatSaved.ShredFerocious_Bite = arg1
    _G[slider_ShredFerocious:GetName().."Text"]:SetText("撕咬: ".. arg1 .."星")
end)


-- 背刺撕咬 能量
local slider_ShredFerocious_Value = CreateFrame("Slider", ADDON_NAME.."SliderShredFerocious_Value", CatUISettingsCatWindow, "OptionsSliderTemplate")
slider_ShredFerocious_Value:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 135, postion_y)
slider_ShredFerocious_Value:SetWidth(110) -- 拖动条长度
slider_ShredFerocious_Value:SetHeight(16) -- 拖动条高度

slider_ShredFerocious_Value:SetMinMaxValues(36, 100)
slider_ShredFerocious_Value:SetValueStep(1)
slider_ShredFerocious_Value:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_ShredFerocious_Value)

-- 值变化时的回调函数
slider_ShredFerocious_Value:SetScript("OnValueChanged", function()
    MPDriudCatSaved.ShredFerocious_Value = arg1

    _G[slider_ShredFerocious_Value:GetName().."Text"]:SetText("撕咬<"..arg1.."能量")
end)

postion_y = postion_y-40

-- 变身 背刺流
local slider_ShredModeShapeshift = CreateFrame("Slider", ADDON_NAME.."SliderShredModeShapeshift", CatUISettingsCatWindow, "OptionsSliderTemplate")
slider_ShredModeShapeshift:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 15, postion_y)
slider_ShredModeShapeshift:SetWidth(110) -- 拖动条长度
slider_ShredModeShapeshift:SetHeight(16) -- 拖动条高度

slider_ShredModeShapeshift:SetMinMaxValues(10, 50)
slider_ShredModeShapeshift:SetValueStep(1)
slider_ShredModeShapeshift:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_ShredModeShapeshift)

-- 值变化时的回调函数
slider_ShredModeShapeshift:SetScript("OnValueChanged", function()
    MPDriudCatSaved.ShredModeShapeshift = arg1

    _G[slider_ShredModeShapeshift:GetName().."Text"]:SetText("变身<"..arg1 .."能量")
end)


postion_y = postion_y-170

local checkButton_Style1 = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 20, postion_y, "仅爪击")
local checkButton_Style2 = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 140, postion_y, "均衡 朝向自动")
postion_y = postion_y-30
local checkButton_Style4 = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 20, postion_y, "仅撕碎")
local checkButton_Style3 = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 140, postion_y, "均衡 偏向撕碎")
checkButton_Style1:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Style = 1
    end
    checkButton_Style1:SetChecked(MPDriudCatSaved.Style)
    checkButton_Style2:SetChecked(false)
    checkButton_Style3:SetChecked(false)
    checkButton_Style4:SetChecked(false)
end)
checkButton_Style2:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Style = 2
    end
    checkButton_Style1:SetChecked(false)
    checkButton_Style2:SetChecked(MPDriudCatSaved.Style)
    checkButton_Style3:SetChecked(false)
    checkButton_Style4:SetChecked(false)
end)
checkButton_Style3:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Style = 3
    end
    checkButton_Style1:SetChecked(false)
    checkButton_Style2:SetChecked(false)
    checkButton_Style3:SetChecked(MPDriudCatSaved.Style)
    checkButton_Style4:SetChecked(false)
end)
checkButton_Style4:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Style = 4
    end
    checkButton_Style1:SetChecked(false)
    checkButton_Style2:SetChecked(false)
    checkButton_Style3:SetChecked(false)
    checkButton_Style4:SetChecked(MPDriudCatSaved.Style)
end)




postion_y = postion_y+325


-- 魂能之速
local checkButton_Soulspeed = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsCatWindow, "UICheckButtonTemplate")
checkButton_Soulspeed:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 340, postion_y)
checkButton_Soulspeed:SetScale(0.8)

-- 添加文字标签
local checkText_Soulspeed = checkButton_Soulspeed:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Soulspeed:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Soulspeed:SetTextColor(1, 1, 1)
checkText_Soulspeed:SetPoint("LEFT", checkButton_Soulspeed, "LEFT", 34, 1)
checkText_Soulspeed:SetText("自动 魂能之速 (BOSS时)")

-- 设置点击事件
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Soulspeed = 1
    else
        MPDriudCatSaved.Soulspeed = 0
    end
end)


postion_y = postion_y-40

-- 献祭之油
local checkButton_Sacrificial = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsCatWindow, "UICheckButtonTemplate")
checkButton_Sacrificial:SetPoint("TOPLEFT", CatUISettingsCatWindow, "TOPLEFT", 340, postion_y)
checkButton_Sacrificial:SetScale(0.8)
checkButton_Sacrificial:Hide()

-- 添加文字标签
local checkText_Sacrificial = checkButton_Sacrificial:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Sacrificial:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Sacrificial:SetTextColor(1, 1, 1)
checkText_Sacrificial:SetPoint("LEFT", checkButton_Sacrificial, "LEFT", 34, 1)
checkText_Sacrificial:SetText("自动 献祭之油 (SuperWoW)")

-- 设置点击事件
checkButton_Sacrificial:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Sacrificial = 1
    else
        MPDriudCatSaved.Sacrificial = 0
    end
end)


-- 获取纹理元素（兼容所有版本）
local function GetDownMenuTex(dropdownIn, part)
    return _G[dropdownIn:GetName()..part.."Texture"] or _G[dropdownIn:GetName()..part]
end


postion_y = postion_y-60

-- 创建单选框 - 神像舞
local checkButton_Idol_Dance = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButtonUnSalvation", 340, postion_y, "神像舞 (正常 <-> 终结技)")
checkButton_Idol_Dance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Idol_Dance = 1
    else
        MPDriudCatSaved.Idol_Dance = 0
    end
end)


-- 创建下拉菜单
local dropdown_Idol_Dance_Low = CreateFrame("Button", ADDON_NAME.."Dropdown_Idol_Dance_Low", checkButton_Idol_Dance, "UIDropDownMenuTemplate")
dropdown_Idol_Dance_Low:SetPoint("TOPLEFT", checkButton_Idol_Dance, "TOPLEFT", -12, -30)

local middle_Idol_Dance_Low = GetDownMenuTex(dropdown_Idol_Dance_Low, "Middle")
middle_Idol_Dance_Low:SetWidth(110) -- 主宽度
middle_Idol_Dance_Low:SetHeight(60) -- 主宽度

-- 定义选项（带固定索引的表）
local modes_Idol_Dance_Low = {
    [1] = {text = "|cFF0070DD凶猛神像|r", item="凶猛神像", value = 1},
    [2] = {text = "|cFF0070DD野蛮神像|r", item="野蛮神像", value = 2},
    [3] = {text = "|cFF9D38C8月牙神像|r", item="月牙神像", value = 3},
    [4] = {text = "|cFF9D38C8狂野变形者神像|r", item="狂野变形者神像", value = 4},
    [5] = {text = "|cFF9D38C8酸蚀神像|r", item="酸蚀神像", value = 5},
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
                MPDriudCatSaved.Idol_Dance_Low = modes_Idol_Dance_Low[index].item
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
    [1] = {text = "|cFF9D38C8腐败翡翠神像|r", item="腐败翡翠神像", value = 1},
    [2] = {text = "|cFF9D38C8撕裂神像|r", item="撕裂神像", value = 2},
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
                MPDriudCatSaved.Idol_Dance_High = modes_Idol_Dance_High[index].item
                --message("选择："..modes_Idol_Dance_High[index].text)
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Idol_Dance_High, Dropdown_Init_Idol_Dance_High)
UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_High, 1) -- 默认选中第一项






postion_y = postion_y-80

-- 创建单选框 - 随目标神像
local checkButton_Swap_Idol = MPCreateCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButtonUnSalvation", 340, postion_y, "随目标神像 (是否吃流血)")
checkButton_Swap_Idol:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Target_Swap_Idol = 1
    else
        MPDriudCatSaved.Target_Swap_Idol = 0
    end
end)



-- 创建下拉菜单
local dropdown_Target_Swap_Idol_Bleed = CreateFrame("Button", ADDON_NAME.."Dropdown_Swap_Idol_Bleed", checkButton_Swap_Idol, "UIDropDownMenuTemplate")
dropdown_Target_Swap_Idol_Bleed:SetPoint("TOPLEFT", checkButton_Swap_Idol, "TOPLEFT", 130, -30)

local middle_Target_Swap_Idol_Bleed = GetDownMenuTex(dropdown_Target_Swap_Idol_Bleed, "Middle")
middle_Target_Swap_Idol_Bleed:SetWidth(110) -- 主宽度
middle_Target_Swap_Idol_Bleed:SetHeight(60) -- 主宽度



-- 定义选项（带固定索引的表）
local modes_Target_Swap_Idol_Bleed = {
    [1] = {text = "|cFF0070DD凶猛神像|r", item="凶猛神像", value = 1},
    [2] = {text = "|cFF0070DD野蛮神像|r", item="野蛮神像", value = 2},
    [3] = {text = "|cFF0070DD常青神像|r",  item="常青神像", value = 3},
    [4] = {text = "|cFF9D38C8月牙神像|r", item="月牙神像", value = 4},
    [5] = {text = "|cFF9D38C8撕裂神像|r", item="撕裂神像", value = 5},
    [6] = {text = "|cFF9D38C8腐败翡翠神像|r", item="腐败翡翠神像", value = 6},
    [7] = {text = "|cFF9D38C8狂野变形者神像|r", item="狂野变形者神像", value = 7},
    [8] = {text = "|cFF9D38C8酸蚀神像|r", item="酸蚀神像", value = 8},
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Target_Swap_Idol_Bleed()
    for idx, data in pairs(modes_Target_Swap_Idol_Bleed) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Bleed, index)
                MPDriudCatSaved.Target_Swap_Idol_Bleed = modes_Target_Swap_Idol_Bleed[index].item
                --message("选择："..modes_Target_Swap_Idol_Bleed[index].text)
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Target_Swap_Idol_Bleed, Dropdown_Init_Target_Swap_Idol_Bleed)
UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Bleed, 1) -- 默认选中第一项

local Text_Swap_Idol_Bleed = checkButton_Swap_Idol:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Text_Swap_Idol_Bleed:SetPoint("TOPLEFT", checkButton_Swap_Idol, "TOPLEFT", 90, -35)
Text_Swap_Idol_Bleed:SetFont("Fonts\\FRIZQT__.TTF", 14)
Text_Swap_Idol_Bleed:SetText("|cFFFFFFFF吃流血|r")



-- 创建下拉菜单
local dropdown_Target_Swap_Idol_Shred = CreateFrame("Button", ADDON_NAME.."Dropdown_Swap_Idol_Shred", checkButton_Swap_Idol, "UIDropDownMenuTemplate")
dropdown_Target_Swap_Idol_Shred:SetPoint("TOPLEFT", checkButton_Swap_Idol, "TOPLEFT", 130, -60)

local middle_Target_Swap_Idol_Shred = GetDownMenuTex(dropdown_Target_Swap_Idol_Shred, "Middle")
middle_Target_Swap_Idol_Shred:SetWidth(110) -- 主宽度
middle_Target_Swap_Idol_Shred:SetHeight(60) -- 主宽度



-- 定义选项（带固定索引的表）
local modes_Target_Swap_Idol_Shred = {
    [1] = {text = "|cFF0070DD凶猛神像|r", item="凶猛神像", value = 1},
    [2] = {text = "|cFF0070DD野蛮神像|r", item="野蛮神像", value = 2},
    [3] = {text = "|cFF0070DD常青神像|r",  item="常青神像", value = 3},
    [4] = {text = "|cFF9D38C8月牙神像|r", item="月牙神像", value = 4},
    [5] = {text = "|cFF9D38C8撕裂神像|r", item="撕裂神像", value = 5},
    [6] = {text = "|cFF9D38C8腐败翡翠神像|r", item="腐败翡翠神像", value = 6},
    [7] = {text = "|cFF9D38C8狂野变形者神像|r", item="狂野变形者神像", value = 7},
    [8] = {text = "|cFF9D38C8酸蚀神像|r", item="酸蚀神像", value = 8},
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Target_Swap_Idol_Shred()
    for idx, data in pairs(modes_Target_Swap_Idol_Shred) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Shred, index)
                MPDriudCatSaved.Target_Swap_Idol_Shred = modes_Target_Swap_Idol_Shred[index].item
                --message("选择："..modes_Target_Swap_Idol_Shred[index].text)
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Target_Swap_Idol_Shred, Dropdown_Init_Target_Swap_Idol_Shred)
UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Shred, 4) -- 默认选中第一项

local Text_Swap_Idol_Shred = checkButton_Swap_Idol:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Text_Swap_Idol_Shred:SetPoint("TOPLEFT", checkButton_Swap_Idol, "TOPLEFT", 90, -65)
Text_Swap_Idol_Shred:SetFont("Fonts\\FRIZQT__.TTF", 14)
Text_Swap_Idol_Shred:SetText("|cFFFFFFFF不吃流血|r")





-- 创建下拉菜单
local dropdown_Target_Swap_Idol_Bear = CreateFrame("Button", ADDON_NAME.."Dropdown_Swap_Idol_Bear", checkButton_Swap_Idol, "UIDropDownMenuTemplate")
dropdown_Target_Swap_Idol_Bear:SetPoint("TOPLEFT", checkButton_Swap_Idol, "TOPLEFT", 130, -90)

local middle_Target_Swap_Idol_Bear = GetDownMenuTex(dropdown_Target_Swap_Idol_Bear, "Middle")
middle_Target_Swap_Idol_Bear:SetWidth(110) -- 主宽度
middle_Target_Swap_Idol_Bear:SetHeight(60) -- 主宽度



-- 定义选项（带固定索引的表）
local modes_Target_Swap_Idol_Bear = {
    [1] = {text = "|cFF0070DD蛮兽神像|r", item="野蛮神像", value = 1},
    [2] = {text = "|cFF0070DD常青神像|r",  item="常青神像", value = 2},
    [3] = {text = "|cFF9D38C8月牙神像|r", item="月牙神像", value = 3},
    [4] = {text = "|cFF9D38C8狂野变形者神像|r", item="狂野变形者神像", value = 4},
    [5] = {text = "|cFF9D38C8酸蚀神像|r", item="酸蚀神像", value = 5},
--    [6] = {text = "狂野变形者神像",   value = 6}
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Target_Swap_Idol_Bear()
    for idx, data in pairs(modes_Target_Swap_Idol_Bear) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Bear, index)
                MPDriudCatSaved.Target_Swap_Idol_Bear = modes_Target_Swap_Idol_Bear[index].item
                --message("选择："..modes_Target_Swap_Idol_Bear[index].text)
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Target_Swap_Idol_Bear, Dropdown_Init_Target_Swap_Idol_Bear)
UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Bear, 4) -- 默认选中第一项

local Text_Swap_Idol_Bear = checkButton_Swap_Idol:CreateFontString(nil, "OVERLAY", "GameFontNormal")
Text_Swap_Idol_Bear:SetPoint("TOPLEFT", checkButton_Swap_Idol, "TOPLEFT", 90, -95)
Text_Swap_Idol_Bear:SetFont("Fonts\\FRIZQT__.TTF", 14)
Text_Swap_Idol_Bear:SetText("|cFFFFFFFF熊形态|r")





local myButton = MPCreateButton(CatUISettingsCatWindow, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetCatSettings()
    MPInitCatSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsCatWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Power = 1
    else
        MPDriudCatSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Pick = 1
    else
        MPDriudCatSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsCatWindow, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)




-- 添加提示内容区域
local TipText = CatUISettingsCatWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsCatWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ 全自动 |cFFFF7D0A/catdps|r ]  [ 背刺流 |cFFFF7D0A/catshred|r ]")



-- 通用部分
--local public = MPSettingPublic(CatUISettingsCatWindow)


-- 配置文件版本号
local CatSettingsUIVersion = 27

function MPResetCatSettings()

    MPDriudCatSaved.Version = CatSettingsUIVersion

    -- 基本配置
    MPDriudCatSaved.Shapeshift = 1
    MPDriudCatSaved.TigerFury = 1
    MPDriudCatSaved.FaerieFire = 1
    MPDriudCatSaved.Prowl = 1
    MPDriudCatSaved.Trinket_Upper = 1
    MPDriudCatSaved.TUBoss = 0
    MPDriudCatSaved.Trinket_Below = 1
    MPDriudCatSaved.TBBoss = 0
    MPDriudCatSaved.Target = 0
    MPDriudCatSaved.Cower = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPDriudCatSaved.HealthStone = 1
    MPDriudCatSaved.HealthStone_Value = 30
    MPDriudCatSaved.HerbalTea = 1
    MPDriudCatSaved.HerbalTea_Value = 20
    MPDriudCatSaved.Barkskin = 0
    MPDriudCatSaved.Barkskin_Value = 30

    -- SuperWoW,UnitXP
    MPDriudCatSaved.SuperWoW = 1
    MPDriudCatSaved.UnitXP = 0

    -- 参数
    MPDriudCatSaved.Ferocious_Bite = 5
    MPDriudCatSaved.Ferocious_Value = 53
    MPDriudCatSaved.BleedModeShapeshift = 20
    MPDriudCatSaved.OutHPRip = 3000
    MPDriudCatSaved.HighShred = 1
    MPDriudCatSaved.HighShred_Value = 68
    MPDriudCatSaved.Style = 2

    MPDriudCatSaved.ShredFerocious_Bite = 3
    MPDriudCatSaved.ShredFerocious_Value = 55
    MPDriudCatSaved.ShredModeShapeshift = 25

    MPDriudCatSaved.Ashamane = 0
    MPDriudCatSaved.Soulspeed = 0
    MPDriudCatSaved.Sacrificial = 0

    MPDriudCatSaved.BOSS = 0

    -- 神像相关
    MPDriudCatSaved.Idol_Dance = 0
    MPDriudCatSaved.Idol_Dance_Point = 4
    MPDriudCatSaved.Idol_Dance_Low = "凶猛神像"
    MPDriudCatSaved.Idol_Dance_High = "撕裂神像"
    color_Idol_Dance = "|cFF888888"

    MPDriudCatSaved.Target_Swap_Idol = 0
    MPDriudCatSaved.Target_Swap_Idol_Bleed = "凶猛神像"
    MPDriudCatSaved.Target_Swap_Idol_Shred = "撕裂神像"
    MPDriudCatSaved.Target_Swap_Idol_Bear = "蛮兽神像"


    -- 通用
    MPDriudCatSaved.Power = 0
    MPDriudCatSaved.Pick = 0

end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function CatSettingsPart1()
    checkButton_Shapeshift:SetChecked(ToBoolean(MPDriudCatSaved.Shapeshift))
    checkButton_TigerFury:SetChecked( ToBoolean(MPDriudCatSaved.TigerFury) )
    checkButton_FaerieFire:SetChecked( ToBoolean(MPDriudCatSaved.FaerieFire) )

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPDriudCatSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPDriudCatSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPDriudCatSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPDriudCatSaved.TBBoss))

    checkButton_Target:SetChecked(ToBoolean(MPDriudCatSaved.Target))
    checkButton_Prowl:SetChecked(ToBoolean(MPDriudCatSaved.Prowl))
    checkButton_Cower:SetChecked(ToBoolean(MPDriudCatSaved.Cower))

    checkButton_UnitXP:SetChecked(ToBoolean(MPDriudCatSaved.UnitXP))

    checkButton_HealthStone:SetChecked(ToBoolean(MPDriudCatSaved.HealthStone))
    slider_HealthStone:SetValue(MPDriudCatSaved.HealthStone_Value)
    if MPDriudCatSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudCatSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudCatSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPDriudCatSaved.HerbalTea_Value)
    if MPDriudCatSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudCatSaved.HerbalTea_Value .."%|r")

    checkButton_Barkskin:SetChecked(MPDriudCatSaved.Barkskin)
    slider_Barkskin:SetValue(MPDriudCatSaved.Barkskin_Value)
    if MPDriudCatSaved.Barkskin==1 then
        color_Barkskin = "|cFFFFD100"
    else
        color_Barkskin = "|cFF888888"
    end
    _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudCatSaved.Barkskin_Value .."%|r")

end

local function CatSettingsPart2()
    slider_Ferocious:SetValue(MPDriudCatSaved.Ferocious_Bite)
    _G[slider_Ferocious:GetName().."Text"]:SetText("撕咬: ".. MPDriudCatSaved.Ferocious_Bite .."星")
    slider_Ferocious_Value:SetValue(MPDriudCatSaved.Ferocious_Value)
    _G[slider_Ferocious_Value:GetName().."Text"]:SetText("撕咬<"..MPDriudCatSaved.Ferocious_Value.."能量")
    slider_BleedModeShapeshift:SetValue(MPDriudCatSaved.BleedModeShapeshift)
    _G[slider_BleedModeShapeshift:GetName().."Text"]:SetText("变身<"..MPDriudCatSaved.BleedModeShapeshift.."能量")
    slider_Rip:SetValue(MPDriudCatSaved.OutHPRip)
    _G[slider_Rip:GetName().."Text"]:SetText("<".. MPDriudCatSaved.OutHPRip/1000 .."k不撕扯")

    slider_ShredFerocious:SetValue(MPDriudCatSaved.ShredFerocious_Bite)
    _G[slider_ShredFerocious:GetName().."Text"]:SetText("撕咬: ".. MPDriudCatSaved.ShredFerocious_Bite .."星")
    slider_ShredFerocious_Value:SetValue(MPDriudCatSaved.ShredFerocious_Value)
    _G[slider_ShredFerocious_Value:GetName().."Text"]:SetText("撕咬<"..MPDriudCatSaved.ShredFerocious_Value.."能量")
    slider_ShredModeShapeshift:SetValue(MPDriudCatSaved.ShredModeShapeshift)
    _G[slider_ShredModeShapeshift:GetName().."Text"]:SetText("变身<"..MPDriudCatSaved.ShredModeShapeshift.."能量")


    if MPDriudCatSaved.Style==1 then
        checkButton_Style1:SetChecked(true)
    else
        checkButton_Style1:SetChecked(false)
    end
    if MPDriudCatSaved.Style==2 then
        checkButton_Style2:SetChecked(true)
    else
        checkButton_Style2:SetChecked(false)
    end
    if MPDriudCatSaved.Style==3 then
        checkButton_Style3:SetChecked(true)
    else
        checkButton_Style3:SetChecked(false)
    end
    if MPDriudCatSaved.Style==4 then
        checkButton_Style4:SetChecked(true)
    else
        checkButton_Style4:SetChecked(false)
    end



    checkButton_Idol_Dance:SetChecked(ToBoolean(MPDriudCatSaved.Idol_Dance))

    for idx_Idol_Dance_Low, data_Idol_Dance_Low in pairs(modes_Idol_Dance_Low) do
        if string.find(data_Idol_Dance_Low.text,MPDriudCatSaved.Idol_Dance_Low) then
            UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_Low, data_Idol_Dance_Low.value)
            _G[dropdown_Idol_Dance_Low:GetName().."Text"]:SetText(data_Idol_Dance_Low.text)
        end
    end

    for idx_Idol_Dance_High, data_Idol_Dance_High in pairs(modes_Idol_Dance_High) do
        if string.find(data_Idol_Dance_High.text,MPDriudCatSaved.Idol_Dance_High) then
            UIDropDownMenu_SetSelectedID(dropdown_Idol_Dance_High, modes_Idol_Dance_High[idx_Idol_Dance_High].value)
            _G[dropdown_Idol_Dance_High:GetName().."Text"]:SetText(data_Idol_Dance_High.text)
        end
    end

    

    checkButton_Swap_Idol:SetChecked(ToBoolean(MPDriudCatSaved.Target_Swap_Idol))

    for idx_Target_Swap_Idol_Bleed, data_Target_Swap_Idol_Bleed in pairs(modes_Target_Swap_Idol_Bleed) do
        if string.find(data_Target_Swap_Idol_Bleed.text,MPDriudCatSaved.Target_Swap_Idol_Bleed) then
            UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Bleed, data_Target_Swap_Idol_Bleed.value)
            _G[dropdown_Target_Swap_Idol_Bleed:GetName().."Text"]:SetText(data_Target_Swap_Idol_Bleed.text)
        end
    end

    for idx_Target_Swap_Idol_Shred, data_Target_Swap_Idol_Shred in pairs(modes_Target_Swap_Idol_Shred) do
        if string.find(data_Target_Swap_Idol_Shred.text,MPDriudCatSaved.Target_Swap_Idol_Shred) then
            UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Shred, modes_Target_Swap_Idol_Shred[idx_Target_Swap_Idol_Shred].value)
            _G[dropdown_Target_Swap_Idol_Shred:GetName().."Text"]:SetText(data_Target_Swap_Idol_Shred.text)
        end
    end

    for idx_Target_Swap_Idol_Bear, data_Target_Swap_Idol_Bear in pairs(modes_Target_Swap_Idol_Bear) do
        if string.find(data_Target_Swap_Idol_Bear.text,MPDriudCatSaved.Target_Swap_Idol_Bear) then
            UIDropDownMenu_SetSelectedID(dropdown_Target_Swap_Idol_Bear, modes_Target_Swap_Idol_Bear[idx_Target_Swap_Idol_Bear].value)
            _G[dropdown_Target_Swap_Idol_Bear:GetName().."Text"]:SetText(data_Target_Swap_Idol_Bear.text)
        end
    end

    checkButton_Ashamane:SetChecked(ToBoolean(MPDriudCatSaved.Ashamane))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPDriudCatSaved.Soulspeed))
    checkButton_Sacrificial:SetChecked(ToBoolean(MPDriudCatSaved.Sacrificial))
    checkButton_BOSS:SetChecked(ToBoolean(MPDriudCatSaved.BOSS))

    checkButton_Power:SetChecked(ToBoolean(MPDriudCatSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPDriudCatSaved.Pick))

end

function MPInitCatSettings()
    if not MPDriudCatSaved then
        MPDriudCatSaved = {}
        MPResetCatSettings()
    end

    if MPDriudCatSaved.Version ~= CatSettingsUIVersion then
        MPResetCatSettings()
    end

    CatSettingsPart1()
    CatSettingsPart2()

end

