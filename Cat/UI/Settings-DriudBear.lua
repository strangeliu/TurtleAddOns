
-- 定义插件名称
local ADDON_NAME = "Settings-DriudBear"


CatUISettingsBearWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 500, "|cFFFF7D0A设置 - 熊德|r")



local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsBearWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsBearWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")






local postion_y = postion_y-40

-- 创建单选框 - 熊形态
local checkButton_Bear = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 巨熊形态")
checkButton_Bear:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Bear = 1
    else
        MPDriudBearSaved.Bear = 0
    end
end)

-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Trinket_Upper = 1
    else
        MPDriudBearSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.TUBoss = 1
    else
        MPDriudBearSaved.TUBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 挫志咆哮
local checkButton_Demoralizing = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 挫志咆哮")
checkButton_Demoralizing:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Demoralizing = 1
    else
        MPDriudBearSaved.Demoralizing = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Trinket_Below = 1
    else
        MPDriudBearSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.TBBoss = 1
    else
        MPDriudBearSaved.TBBoss = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 狂怒
local checkButton_Fury = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 狂怒")
checkButton_Fury:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Fury = 1
    else
        MPDriudBearSaved.Fury = 0
    end
end)




-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Target = 1
    else
        MPDriudBearSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 挥击
local checkButton_Swipe = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 挥击")
checkButton_Swipe:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Swipe = 1
    else
        MPDriudBearSaved.Swipe = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 精灵之火
local checkButton_FaerieFire = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 精灵之火 (主动保持)")
checkButton_FaerieFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.FaerieFire = 1
    else
        MPDriudBearSaved.FaerieFire = 0
    end
end)







-- 高级



postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsBearWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsBearWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-80


-- 创建单选框 - 群体优先挥击
local checkButton_SwipeFirst = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonSwipeFirst", 20, postion_y, "群体策略 优先挥击 (SuperWow)")
checkButton_SwipeFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.SwipeFirst = 1
    else
        MPDriudBearSaved.SwipeFirst = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonSuperWow", 340, postion_y, "自动 治疗石")

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
    MPDriudBearSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudBearSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudBearSaved.HealthStone_Value .."%|r")
    else
        MPDriudBearSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudBearSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 优先槌击
local checkButton_MangleFirst = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonMangleFirst", 20, postion_y, "单体策略 槌击优先")
checkButton_MangleFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.MangleFirst = 1
    else
        MPDriudBearSaved.MangleFirst = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton_HerbalTea", 340, postion_y, "自动 草药茶")

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
    MPDriudBearSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudBearSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudBearSaved.HerbalTea_Value .."%|r")
    else
        MPDriudBearSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudBearSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- boss再开爆发
local checkButton_Burst = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonBurst", 20, postion_y, "爆发保留BOSS阶段 狂怒")
checkButton_Burst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Burst = 1
    else
        MPDriudBearSaved.Burst = 0
    end
end)


-- 创建单选框 - 狂暴回复
local checkButton_Frenzied = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton_Frenzied", 340, postion_y, "自动 狂暴回复")

local slider_Frenzied = CreateFrame("Slider", ADDON_NAME.."Slider_Frenzied", checkButton_Frenzied, "OptionsSliderTemplate")
slider_Frenzied:SetPoint("RIGHT", checkButton_Frenzied, "RIGHT", 250, -2)
slider_Frenzied:SetWidth(150) -- 拖动条长度
slider_Frenzied:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Frenzied:SetMinMaxValues(0, 100)
slider_Frenzied:SetValueStep(1)
slider_Frenzied:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Frenzied)

local color_Frenzied = "|cFFFFD100"

_G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: 20%|r")
-- 值变化时的回调函数
slider_Frenzied:SetScript("OnValueChanged", function()
    --print("Frenzied当前值:", arg1)
    MPDriudBearSaved.Frenzied_Value = arg1
    _G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Frenzied:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Frenzied = 1
        color_Frenzied = "|cFFFFD100"
        _G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: ".. MPDriudBearSaved.Frenzied_Value .."%|r")
    else
        MPDriudBearSaved.Frenzied = 0
        color_Frenzied = "|cFF888888"
        _G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: ".. MPDriudBearSaved.Frenzied_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 取消拯救
local checkButton_UnSalvation = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonUnSalvation", 20, postion_y, "自动取消 拯救祝福")
checkButton_UnSalvation:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.UnSalvation = 1
    else
        MPDriudBearSaved.UnSalvation = 0
    end
end)



-- 创建单选框 - 狂暴
local checkButton_Berserk = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton_Berserk", 340, postion_y, "自动 狂暴")

local slider_Berserk = CreateFrame("Slider", ADDON_NAME.."Slider_Berserk", checkButton_Berserk, "OptionsSliderTemplate")
slider_Berserk:SetPoint("RIGHT", checkButton_Berserk, "RIGHT", 250, -2)
slider_Berserk:SetWidth(150) -- 拖动条长度
slider_Berserk:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Berserk:SetMinMaxValues(0, 100)
slider_Berserk:SetValueStep(1)
slider_Berserk:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Berserk)

local color_Berserk = "|cFFFFD100"

_G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: 20%|r")
-- 值变化时的回调函数
slider_Berserk:SetScript("OnValueChanged", function()
    --print("Berserk当前值:", arg1)
    MPDriudBearSaved.Berserk_Value = arg1
    _G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Berserk:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Berserk = 1
        color_Berserk = "|cFFFFD100"
        _G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: ".. MPDriudBearSaved.Berserk_Value .."%|r")
    else
        MPDriudBearSaved.Berserk = 0
        color_Berserk = "|cFF888888"
        _G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: ".. MPDriudBearSaved.Berserk_Value .."%|r")
    end
end)





postion_y = postion_y-40





-- 创建单选框 - 树皮术
local checkButton_Barkskin = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton_Barkskin", 340, postion_y, "自动 树皮术")

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
    MPDriudBearSaved.Barkskin_Value = arg1
    _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. arg1 .."%|r")
end)

-- 设置点击事件
checkButton_Barkskin:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Barkskin = 1
        color_Barkskin = "|cFFFFD100"
        _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudBearSaved.Barkskin_Value .."%|r")
    else
        MPDriudBearSaved.Barkskin = 0
        color_Barkskin = "|cFF888888"
        _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudBearSaved.Barkskin_Value .."%|r")
    end
end)



postion_y = postion_y-40



-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Soulspeed = 1
    else
        MPDriudBearSaved.Soulspeed = 0
    end
end)





local myButton = MPCreateButton(CatUISettingsBearWindow, ADDON_NAME.."ButtonReset", "恢复默认值", 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetBearSettings()
    MPInitBearSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsBearWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Power = 1
    else
        MPDriudBearSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudBearSaved.Pick = 1
    else
        MPDriudBearSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsBearWindow, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsBearWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsBearWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFFFF7D0A/beardps|r ]  [ 纯单体(无AOE技能) |cFFFF7D0A/bearone|r ]")



-- 配置文件版本号
local BearSettingsUIVersion = 11

function MPResetBearSettings()

    MPDriudBearSaved.Version = BearSettingsUIVersion

    -- 基本配置

    MPDriudBearSaved.Bear = 1
    MPDriudBearSaved.Trinket_Upper = 1
    MPDriudBearSaved.TUBoss = 0
    MPDriudBearSaved.Trinket_Below = 1
    MPDriudBearSaved.TBBoss = 0
    MPDriudBearSaved.Fury = 1
    MPDriudBearSaved.Swipe = 1
    MPDriudBearSaved.FaerieFire = 1
    MPDriudBearSaved.Demoralizing = 1
    MPDriudBearSaved.Target = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPDriudBearSaved.HealthStone = 1
    MPDriudBearSaved.HealthStone_Value = 30
    MPDriudBearSaved.HerbalTea = 1
    MPDriudBearSaved.HerbalTea_Value = 20
    MPDriudBearSaved.Frenzied = 0
    MPDriudBearSaved.Frenzied_Value = 20
    MPDriudBearSaved.Berserk = 0
    MPDriudBearSaved.Berserk_Value = 20
    MPDriudBearSaved.Barkskin = 0
    MPDriudBearSaved.Barkskin_Value = 30

    -- SuperWoW,UnitXP
    MPDriudBearSaved.SuperWoW = 1
    MPDriudBearSaved.UnitXP = 1

    MPDriudBearSaved.SwipeFirst = 1
    MPDriudBearSaved.MangleFirst = 0
    MPDriudBearSaved.Burst = 0
    MPDriudBearSaved.UnSalvation = 0
    MPDriudBearSaved.Soulspeed = 0

    -- 通用
    MPDriudBearSaved.Power = 0
    MPDriudBearSaved.Pick = 0

end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function InitBearSettingsPart1()
    checkButton_Bear:SetChecked(ToBoolean(MPDriudBearSaved.Bear))
    checkButton_Frenzied:SetChecked(ToBoolean(MPDriudBearSaved.Frenzied))
    checkButton_Berserk:SetChecked( ToBoolean(MPDriudBearSaved.Berserk) )
    checkButton_FaerieFire:SetChecked( ToBoolean(MPDriudBearSaved.FaerieFire) )
    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPDriudBearSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPDriudBearSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPDriudBearSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPDriudBearSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPDriudBearSaved.Target))
    checkButton_Demoralizing:SetChecked(ToBoolean(MPDriudBearSaved.Demoralizing))
    checkButton_Fury:SetChecked(ToBoolean(MPDriudBearSaved.Fury))
    checkButton_Swipe:SetChecked(ToBoolean(MPDriudBearSaved.Swipe))

    --checkButton_SuperWoW:SetChecked(ToBoolean(MPDriudBearSaved.SuperWoW))
    --checkButton_UnitXP:SetChecked(ToBoolean(MPDriudBearSaved.UnitXP))
    checkButton_SwipeFirst:SetChecked(ToBoolean(MPDriudBearSaved.SwipeFirst))
    checkButton_MangleFirst:SetChecked(ToBoolean(MPDriudBearSaved.MangleFirst))
    checkButton_Burst:SetChecked(ToBoolean(MPDriudBearSaved.Burst))
    checkButton_UnSalvation:SetChecked(ToBoolean(MPDriudBearSaved.UnSalvation))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPDriudBearSaved.Soulspeed))

    checkButton_Power:SetChecked(ToBoolean(MPDriudBearSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPDriudBearSaved.Pick))

end

function MPInitBearSettings()
    if not MPDriudBearSaved then
        MPDriudBearSaved = {}
        MPResetBearSettings()
    end

    if MPDriudBearSaved.Version ~= BearSettingsUIVersion then
        MPResetBearSettings()
    end

    InitBearSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPDriudBearSaved.HealthStone))
    slider_HealthStone:SetValue(MPDriudBearSaved.HealthStone_Value)
    if MPDriudBearSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPDriudBearSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPDriudBearSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPDriudBearSaved.HerbalTea_Value)
    if MPDriudBearSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPDriudBearSaved.HerbalTea_Value .."%|r")

    checkButton_Frenzied:SetChecked(MPDriudBearSaved.Frenzied)
    slider_Frenzied:SetValue(MPDriudBearSaved.Frenzied_Value)
    if MPDriudBearSaved.Frenzied==1 then
        color_Frenzied = "|cFFFFD100"
    else
        color_Frenzied = "|cFF888888"
    end
    _G[slider_Frenzied:GetName().."Text"]:SetText(color_Frenzied.."血线: ".. MPDriudBearSaved.Frenzied_Value .."%|r")

    checkButton_Berserk:SetChecked(MPDriudBearSaved.Berserk)
    slider_Berserk:SetValue(MPDriudBearSaved.Berserk_Value)
    if MPDriudBearSaved.Berserk==1 then
        color_Berserk = "|cFFFFD100"
    else
        color_Berserk = "|cFF888888"
    end
    _G[slider_Berserk:GetName().."Text"]:SetText(color_Berserk.."血线: ".. MPDriudBearSaved.Berserk_Value .."%|r")

    checkButton_Barkskin:SetChecked(MPDriudBearSaved.Barkskin)
    slider_Barkskin:SetValue(MPDriudBearSaved.Barkskin_Value)
    if MPDriudBearSaved.Barkskin==1 then
        color_Barkskin = "|cFFFFD100"
    else
        color_Barkskin = "|cFF888888"
    end
    _G[slider_Barkskin:GetName().."Text"]:SetText(color_Barkskin.."血线: ".. MPDriudBearSaved.Barkskin_Value .."%|r")

end

