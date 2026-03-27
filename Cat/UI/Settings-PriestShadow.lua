
-- 定义插件名称
local ADDON_NAME = "Settings-PriestShadow"



-- 创建主框架
CatUISettingsPriestShadow = MPCreateFrame(ADDON_NAME.."Frame", 520, 540, "|cFFFFFFFF设置 - 暗牧|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPriestShadow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")






local postion_y = postion_y-40

-- 创建单选框 - 保持暗影形态
local checkButton_Shadowform = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 暗影形态")
checkButton_Shadowform:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Shadowform = 1
    else
        MPPriestShadowSaved.Shadowform = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Trinket_Upper = 1
    else
        MPPriestShadowSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.TUBoss = 1
    else
        MPPriestShadowSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 保持 心灵之火
local checkButton_InnerFire = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 心灵之火")
checkButton_InnerFire:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.InnerFire = 1
    else
        MPPriestShadowSaved.InnerFire = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Trinket_Below = 1
    else
        MPPriestShadowSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.TBBoss = 1
    else
        MPPriestShadowSaved.TBBoss = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 保持 暗言术：痛
local checkButton_Pain = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "保持 暗言术：痛")
checkButton_Pain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Pain = 1
    else
        MPPriestShadowSaved.Pain = 0
    end
end)



-- 创建单选框 - 自动锁敌
local checkButton_Target = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, postion_y, "自动锁敌 (攻击最近的敌人)")
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Target = 1
    else
        MPPriestShadowSaved.Target = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 心灵震爆
local checkButton_MindBlast = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 心灵震爆")
checkButton_MindBlast:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.MindBlast = 1
    else
        MPPriestShadowSaved.MindBlast = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 精神鞭笞
local checkButton_MindFlay = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 精神鞭笞")
checkButton_MindFlay:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.MindFlay = 1
    else
        MPPriestShadowSaved.MindFlay = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 痛苦尖刺
local checkButton_MindSpike = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 痛苦尖刺")
checkButton_MindSpike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.MindSpike = 1
    else
        MPPriestShadowSaved.MindSpike = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 吸血鬼的拥抱
local checkButton_Vampiric = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 吸血鬼的拥抱")
checkButton_Vampiric:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Vampiric = 1
    else
        MPPriestShadowSaved.Vampiric = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 渐隐术
local checkButton_Fade = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, postion_y, "开启 渐隐术")
checkButton_Fade:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Fade = 1
    else
        MPPriestShadowSaved.Fade = 0
    end
end)




-- 高级



postion_y = postion_y+20

-- 添加提示内容区域
local TipText1 = CatUISettingsPriestShadow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-100


-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsPriestShadow, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y)
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
        MPPriestShadowSaved.RacialTraits = 1
    else
        MPPriestShadowSaved.RacialTraits = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsPriestShadow, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 340, postion_y)
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
    MPPriestShadowSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestShadowSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestShadowSaved.HealthStone_Value .."%|r")
    else
        MPPriestShadowSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestShadowSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40



-- 创建单选框 - 二段鞭笞
local checkButton_SecondMindFlay = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsPriestShadow, "UICheckButtonTemplate")
checkButton_SecondMindFlay:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y)
checkButton_SecondMindFlay:SetScale(0.8)

-- 添加文字标签
local checkText_SecondMindFlay = checkButton_SecondMindFlay:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SecondMindFlay:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SecondMindFlay:SetTextColor(1, 1, 1)
checkText_SecondMindFlay:SetPoint("LEFT", checkButton_SecondMindFlay, "LEFT", 34, 1)
checkText_SecondMindFlay:SetText("开启 二段鞭笞 (5层易伤前)")

-- 设置点击事件
checkButton_SecondMindFlay:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.SecondMindFlay = 1
    else
        MPPriestShadowSaved.SecondMindFlay = 0
    end
end)




-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsPriestShadow, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 340, postion_y)
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
    MPPriestShadowSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved.HerbalTea_Value .."%|r")
    else
        MPPriestShadowSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved.HerbalTea_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 吸血鬼 BOSS
local checkButton_VampiricBOSS = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonUnitXP", CatUISettingsPriestShadow, "UICheckButtonTemplate")
checkButton_VampiricBOSS:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y)
checkButton_VampiricBOSS:SetScale(0.8)

-- 添加文字标签
local checkText_VampiricBOSS = checkButton_VampiricBOSS:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_VampiricBOSS:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_VampiricBOSS:SetTextColor(1, 1, 1)
checkText_VampiricBOSS:SetPoint("LEFT", checkButton_VampiricBOSS, "LEFT", 34, 1)
checkText_VampiricBOSS:SetText("非BOSS忽略 吸血鬼的拥抱")

-- 设置点击事件
checkButton_VampiricBOSS:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.VampiricBOSS = 1
    else
        MPPriestShadowSaved.VampiricBOSS = 0
    end
end)


-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsPriestShadow, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 340, postion_y)
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
    MPPriestShadowSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestShadowSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestShadowSaved.HerbalTeaMana_Value .."%|r")
    else
        MPPriestShadowSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestShadowSaved.HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Soulspeed = 1
    else
        MPPriestShadowSaved.Soulspeed = 0
    end
end)


-- 渐隐术 等级
local slider_Fade_Value = CreateFrame("Slider", ADDON_NAME.."SliderFade_Value", CatUISettingsPriestShadow, "OptionsSliderTemplate")
slider_Fade_Value:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 20, postion_y+80)
slider_Fade_Value:SetWidth(220) -- 拖动条长度
slider_Fade_Value:SetHeight(16) -- 拖动条高度

slider_Fade_Value:SetMinMaxValues(1, 6)
slider_Fade_Value:SetValueStep(1)
slider_Fade_Value:SetValue(6) -- 默认值
MPCatUISliderRegionHide(slider_Fade_Value)

_G[slider_Fade_Value:GetName().."Text"]:SetText("渐隐术 等级：6")

-- 值变化时的回调函数
slider_Fade_Value:SetScript("OnValueChanged", function()
    _G[slider_Fade_Value:GetName().."Text"]:SetText("渐隐术 等级："..arg1)
    MPPriestShadowSaved.Fade_Value = arg1
end)






-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPriestShadow, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 120, -44)
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
    MPResetPriestShadowSettings()
    MPInitPriestShadowSettings()
end)


local MLDButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPriestShadow, "UIPanelButtonTemplate")
MLDButton:SetPoint("TOPLEFT", CatUISettingsPriestShadow, "TOPLEFT", 340, postion_y+60)
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
MPBottomLine(CatUISettingsPriestShadow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Power = 1
    else
        MPPriestShadowSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPriestShadowSaved.Pick = 1
    else
        MPPriestShadowSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPriestShadow, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)

-- 添加提示内容区域
local TipText = CatUISettingsPriestShadow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPriestShadow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFFFFFFFF/amdps|r ]  [ 多线Dot |cFFFFFFFF/MDot|r (需SuperWoW) ]")



-- 配置文件版本号
local PriestShadowSettingsUIVersion = 8

function MPResetPriestShadowSettings()

    MPPriestShadowSaved.Version = PriestShadowSettingsUIVersion

    -- 基本配置

    MPPriestShadowSaved.Shadowform = 1
    MPPriestShadowSaved.InnerFire = 1

    MPPriestShadowSaved.MindBlast = 1
    MPPriestShadowSaved.Pain = 1
    MPPriestShadowSaved.MindFlay = 1
    MPPriestShadowSaved.MindSpike = 0
    MPPriestShadowSaved.Vampiric = 0
    MPPriestShadowSaved.Fade = 0

    MPPriestShadowSaved.Trinket_Upper = 1
    MPPriestShadowSaved.TUBoss = 0
    MPPriestShadowSaved.Trinket_Below = 1
    MPPriestShadowSaved.TBBoss = 0
    MPPriestShadowSaved.Target = 0

    MPPriestShadowSaved.RacialTraits = 0


    -- 高级配置

    -- 治疗石、糖水茶
    MPPriestShadowSaved.HealthStone = 1
    MPPriestShadowSaved.HealthStone_Value = 30
    MPPriestShadowSaved.HerbalTea = 1
    MPPriestShadowSaved.HerbalTea_Value = 20
    MPPriestShadowSaved.HerbalTeaMana = 0
    MPPriestShadowSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPPriestShadowSaved.SuperWoW = 1
    MPPriestShadowSaved.UnitXP = 1

    MPPriestShadowSaved.SecondMindFlay = 0
    MPPriestShadowSaved.VampiricBOSS = 0

    MPPriestShadowSaved.Fade_Value = 6
    MPPriestShadowSaved.Soulspeed = 0

    -- 通用
    MPPriestShadowSaved.Power = 0
    MPPriestShadowSaved.Pick = 0

end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end


function MPInitPriestShadowSettings()
    if not MPPriestShadowSaved then
        MPPriestShadowSaved = {}
        MPResetPriestShadowSettings()
    end

    if MPPriestShadowSaved.Version ~= PriestShadowSettingsUIVersion then
        MPResetPriestShadowSettings()
    end

    checkButton_Shadowform:SetChecked(ToBoolean(MPPriestShadowSaved.Shadowform))
    checkButton_InnerFire:SetChecked( ToBoolean(MPPriestShadowSaved.InnerFire) )
    checkButton_MindBlast:SetChecked( ToBoolean(MPPriestShadowSaved.MindBlast) )
    checkButton_Pain:SetChecked(ToBoolean(MPPriestShadowSaved.Pain))
    checkButton_MindFlay:SetChecked(ToBoolean(MPPriestShadowSaved.MindFlay))
    checkButton_MindSpike:SetChecked(ToBoolean(MPPriestShadowSaved.MindSpike))
    checkButton_Vampiric:SetChecked(ToBoolean(MPPriestShadowSaved.Vampiric))
    checkButton_Fade:SetChecked(ToBoolean(MPPriestShadowSaved.Fade))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPPriestShadowSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPPriestShadowSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPPriestShadowSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPPriestShadowSaved.TBBoss))
    checkButton_Target:SetChecked(ToBoolean(MPPriestShadowSaved.Target))

    checkButton_RacialTraits:SetChecked(ToBoolean(MPPriestShadowSaved.RacialTraits))
    checkButton_SecondMindFlay:SetChecked(ToBoolean(MPPriestShadowSaved.SecondMindFlay))
    checkButton_VampiricBOSS:SetChecked(ToBoolean(MPPriestShadowSaved.VampiricBOSS))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPPriestShadowSaved.Soulspeed))

    checkButton_HealthStone:SetChecked(ToBoolean(MPPriestShadowSaved.HealthStone))
    slider_HealthStone:SetValue(MPPriestShadowSaved.HealthStone_Value)
    if MPPriestShadowSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPriestShadowSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestShadowSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPriestShadowSaved.HerbalTea_Value)
    if MPPriestShadowSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPriestShadowSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPriestShadowSaved.HerbalTea_Value)
    if MPPriestShadowSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPriestShadowSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPriestShadowSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPriestShadowSaved.HerbalTeaMana_Value)
    if MPPriestShadowSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPriestShadowSaved.HerbalTeaMana_Value .."%|r")

    slider_Fade_Value:SetValue(MPPriestShadowSaved.Fade_Value)

    checkButton_Power:SetChecked(ToBoolean(MPPriestShadowSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPPriestShadowSaved.Pick))

end

