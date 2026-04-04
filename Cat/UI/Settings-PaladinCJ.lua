
-- 定义插件名称
local ADDON_NAME = "Settings-PaladinCJ"


-- 创建主框架
CatUISettingsPaladinCJ = MPCreateFrame(ADDON_NAME.."Frame", 520, 570, "|cFFF58CBA设置 - 惩戒骑|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPaladinCJ:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)






local postion_y = postion_y-40

-- 创建单选框 - 圣洁光环
local checkButton_HolinessAura = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_HolinessAura:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
checkButton_HolinessAura:SetScale(0.8)

-- 添加文字标签
local checkText_HolinessAura = checkButton_HolinessAura:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HolinessAura:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HolinessAura:SetTextColor(1, 1, 1)
checkText_HolinessAura:SetPoint("LEFT", checkButton_HolinessAura, "LEFT", 34, 1)
checkText_HolinessAura:SetText("保持 圣洁光环")

-- 设置点击事件
checkButton_HolinessAura:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.HolinessAura = 1
    else
        MPPaladinCJSaved.HolinessAura = 0
    end
end)


-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Trinket_Upper:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
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
        MPPaladinCJSaved.Trinket_Upper = 1
    else
        MPPaladinCJSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.TUBoss = 1
    else
        MPPaladinCJSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 奉献
local checkButton_Consecration = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Consecration:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
checkButton_Consecration:SetScale(0.8)

-- 添加文字标签
local checkText_Consecration = checkButton_Consecration:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Consecration:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Consecration:SetTextColor(1, 1, 1)
checkText_Consecration:SetPoint("LEFT", checkButton_Consecration, "LEFT", 34, 1)
checkText_Consecration:SetText("开启 奉献")

-- 设置点击事件
checkButton_Consecration:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Consecration=1
        MPPaladinTankSaved.Consecration = 1
    else
        MPPaladinCJSaved.Consecration=0
        MPPaladinTankSaved.Consecration = 0
    end
    MPCatPaladinSealInit()
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Trinket_Below:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
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
        MPPaladinCJSaved.Trinket_Below = 1
    else
        MPPaladinCJSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 520, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.TBBoss = 1
    else
        MPPaladinCJSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 忏悔
local checkButton_Repentance = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Repentance:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
checkButton_Repentance:SetScale(0.8)

-- 添加文字标签
local checkText_Repentance = checkButton_Repentance:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Repentance:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Repentance:SetTextColor(1, 1, 1)
checkText_Repentance:SetPoint("LEFT", checkButton_Repentance, "LEFT", 34, 1)
checkText_Repentance:SetText("开启 忏悔 (BOSS,精英)")

-- 设置点击事件
checkButton_Repentance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Repentance = 1
    else
        MPPaladinCJSaved.Repentance = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
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
        MPPaladinCJSaved.Target = 1
    else
        MPPaladinCJSaved.Target = 0
    end
end)

postion_y = postion_y-30


-- 创建单选框 - 驱邪术
local checkButton_Exorcism = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Exorcism:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
checkButton_Exorcism:SetScale(0.8)

-- 添加文字标签
local checkText_Exorcism = checkButton_Exorcism:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Exorcism:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Exorcism:SetTextColor(1, 1, 1)
checkText_Exorcism:SetPoint("LEFT", checkButton_Exorcism, "LEFT", 34, 1)
checkText_Exorcism:SetText("开启 驱邪术 (亡灵,恶魔)")

-- 设置点击事件
checkButton_Exorcism:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Exorcism = 1
    else
        MPPaladinCJSaved.Exorcism = 0
    end
end)


postion_y = postion_y-30


-- 创建单选框 - 愤怒之锤
local checkButton_HammerWrath = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_HammerWrath:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
checkButton_HammerWrath:SetScale(0.8)

-- 添加文字标签
local checkText_HammerWrath = checkButton_HammerWrath:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HammerWrath:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HammerWrath:SetTextColor(1, 1, 1)
checkText_HammerWrath:SetPoint("LEFT", checkButton_HammerWrath, "LEFT", 34, 1)
checkText_HammerWrath:SetText("开启 愤怒之锤 (仅BOSS)")

-- 设置点击事件
checkButton_HammerWrath:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.HammerWrath = 1
    else
        MPPaladinCJSaved.HammerWrath = 0
    end
end)







-- 高级


postion_y = postion_y

-- 添加提示内容区域
local TipText1 = CatUISettingsPaladinCJ:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText(MPLanguage.UI_Set_AdvancedConfig)


postion_y = postion_y-80


-- 创建单选框 - 使用 圣印
local checkButton_Seal = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Seal:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
checkButton_Seal:SetScale(0.8)
checkButton_Seal:Disable()

-- 添加文字标签
local checkText_Seal = checkButton_Seal:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Seal:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Seal:SetTextColor(1, 1, 1)
checkText_Seal:SetPoint("LEFT", checkButton_Seal, "LEFT", 34, 1)
checkText_Seal:SetText("输出圣印")


local slider_Seal = CreateFrame("Slider", ADDON_NAME.."Slider_Seal", checkButton_Seal, "OptionsSliderTemplate")
slider_Seal:SetPoint("RIGHT", checkButton_Seal, "RIGHT", 244, -2)
slider_Seal:SetWidth(160) -- 拖动条长度
slider_Seal:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Seal:SetMinMaxValues(1, 3)
slider_Seal:SetValueStep(1)
slider_Seal:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_Seal)

local color_Seal = "|cFFFFD100"

_G[slider_Seal:GetName().."Low"]:Hide()
_G[slider_Seal:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Seal:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved.Seal_Value = arg1
    if MPPaladinCJSaved.Seal_Value==1 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."自动识别")
    elseif MPPaladinCJSaved.Seal_Value==2 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."正义圣印")
    elseif MPPaladinCJSaved.Seal_Value==3 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."命令圣印")
    end
end)

-- 设置点击事件
checkButton_Seal:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Seal = 1
        color_Seal = "|cFFFFD100"
        if MPPaladinCJSaved.Seal_Value==1 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."自动识别")
        elseif MPPaladinCJSaved.Seal_Value==2 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."正义圣印")
        elseif MPPaladinCJSaved.Seal_Value==3 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."命令圣印")
        end
    else
        MPPaladinCJSaved.Seal = 0
        color_Seal = "|cFF888888"
        if MPPaladinCJSaved.Seal_Value==1 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."自动识别")
        elseif MPPaladinCJSaved.Seal_Value==2 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."正义圣印")
        elseif MPPaladinCJSaved.Seal_Value==3 then
            _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."命令圣印")
        end
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
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

_G[slider_HealthStone:GetName().."Low"]:Hide()
_G[slider_HealthStone:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPPaladinCJSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinCJSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinCJSaved.HealthStone_Value .."%|r")
    else
        MPPaladinCJSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinCJSaved.HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 使用 神打/十打
local checkButton_Strike = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Strike:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
checkButton_Strike:SetScale(0.8)
checkButton_Strike:Disable()

-- 添加文字标签
local checkText_Strike = checkButton_Strike:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Strike:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Strike:SetTextColor(1, 1, 1)
checkText_Strike:SetPoint("LEFT", checkButton_Strike, "LEFT", 34, 1)
checkText_Strike:SetText("输出技能")


local slider_Strike = CreateFrame("Slider", ADDON_NAME.."Slider_Strike", checkButton_Strike, "OptionsSliderTemplate")
slider_Strike:SetPoint("RIGHT", checkButton_Strike, "RIGHT", 244, -2)
slider_Strike:SetWidth(160) -- 拖动条长度
slider_Strike:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Strike:SetMinMaxValues(1, 4)
slider_Strike:SetValueStep(1)
slider_Strike:SetValue(2) -- 默认值
MPCatUISliderRegionHide(slider_Strike)

local color_Strike = "|cFFFFD100"

_G[slider_Strike:GetName().."Low"]:Hide()
_G[slider_Strike:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Strike:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved.Strike_Value = arg1
    if MPPaladinCJSaved.Strike_Value==1 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 神圣打击")
    elseif MPPaladinCJSaved.Strike_Value==2 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 神圣打击 (均衡)")
    elseif MPPaladinCJSaved.Strike_Value==3 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 十字军打击 (均衡)")
    elseif MPPaladinCJSaved.Strike_Value==4 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 十字军打击")
    end
end)

-- 设置点击事件
checkButton_Strike:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Strike = 1
        color_Strike = "|cFFFFD100"
        if MPPaladinCJSaved.Strike_Value==1 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 神圣打击")
        elseif MPPaladinCJSaved.Strike_Value==2 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 神圣打击 (均衡)")
        elseif MPPaladinCJSaved.Strike_Value==3 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 十字军打击 (均衡)")
        elseif MPPaladinCJSaved.Strike_Value==4 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 十字军打击")
        end
    else
        MPPaladinCJSaved.Strike = 0
        color_Strike = "|cFF888888"
        if MPPaladinCJSaved.Strike_Value==1 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 神圣打击")
        elseif MPPaladinCJSaved.Strike_Value==2 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 神圣打击 (均衡)")
        elseif MPPaladinCJSaved.Strike_Value==3 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 十字军打击 (均衡)")
        elseif MPPaladinCJSaved.Strike_Value==4 then
            _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 十字军打击")
        end
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
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

_G[slider_HerbalTea:GetName().."Low"]:Hide()
_G[slider_HerbalTea:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinCJSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinCJSaved.HerbalTea_Value .."%|r")
    else
        MPPaladinCJSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinCJSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y - 40

-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
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
    MPPaladinCJSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinCJSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinCJSaved.HerbalTeaMana_Value .."%|r")
    else
        MPPaladinCJSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinCJSaved.HerbalTeaMana_Value .."%|r")
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 保护之手
local checkButton_Protection = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_Protection:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
checkButton_Protection:SetScale(0.8)

-- 添加文字标签
local checkText_Protection = checkButton_Protection:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Protection:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Protection:SetTextColor(1, 1, 1)
checkText_Protection:SetPoint("LEFT", checkButton_Protection, "LEFT", 34, 1)
checkText_Protection:SetText("自动 保护之手")


local slider_Protection = CreateFrame("Slider", ADDON_NAME.."Slider_Protection", checkButton_Protection, "OptionsSliderTemplate")
slider_Protection:SetPoint("RIGHT", checkButton_Protection, "RIGHT", 250, -2)
slider_Protection:SetWidth(150) -- 拖动条长度
slider_Protection:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Protection:SetMinMaxValues(0, 100)
slider_Protection:SetValueStep(1)
slider_Protection:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_Protection)

local color_Protection = "|cFFFFD100"

_G[slider_Protection:GetName().."Low"]:Hide()
_G[slider_Protection:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Protection:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved.Protection_Value = arg1
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinCJSaved.Protection_Value .."%|r")
end)

-- 设置点击事件
checkButton_Protection:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Protection = 1
        color_Protection = "|cFFFFD100"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinCJSaved.Protection_Value .."%|r")
    else
        MPPaladinCJSaved.Protection = 0
        color_Protection = "|cFF888888"
        _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinCJSaved.Protection_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 圣盾术
local checkButton_DivineShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_DivineShield:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
checkButton_DivineShield:SetScale(0.8)

-- 添加文字标签
local checkText_DivineShield = checkButton_DivineShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_DivineShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_DivineShield:SetTextColor(1, 1, 1)
checkText_DivineShield:SetPoint("LEFT", checkButton_DivineShield, "LEFT", 34, 1)
checkText_DivineShield:SetText("自动 圣盾术")


local slider_DivineShield = CreateFrame("Slider", ADDON_NAME.."Slider_DivineShield", checkButton_DivineShield, "OptionsSliderTemplate")
slider_DivineShield:SetPoint("RIGHT", checkButton_DivineShield, "RIGHT", 250, -2)
slider_DivineShield:SetWidth(150) -- 拖动条长度
slider_DivineShield:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_DivineShield:SetMinMaxValues(0, 100)
slider_DivineShield:SetValueStep(1)
slider_DivineShield:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_DivineShield)

local color_DivineShield = "|cFFFFD100"

_G[slider_DivineShield:GetName().."Low"]:Hide()
_G[slider_DivineShield:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_DivineShield:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPPaladinCJSaved.DivineShield_Value = arg1
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinCJSaved.DivineShield_Value .."%|r")
end)

-- 设置点击事件
checkButton_DivineShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.DivineShield = 1
        color_DivineShield = "|cFFFFD100"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinCJSaved.DivineShield_Value .."%|r")
    else
        MPPaladinCJSaved.DivineShield = 0
        color_DivineShield = "|cFF888888"
        _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinCJSaved.DivineShield_Value .."%|r")
    end
end)


postion_y = postion_y - 40


-- 创建单选框 - 圣契
local checkButton_Relic = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButtonSoulspeed", 20, postion_y, "目标血量<35%切换圣契")
checkButton_Relic:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Relic = 1
    else
        MPPaladinCJSaved.Relic = 0
    end
end)
local checkButton_RelicBoss = MPCreateCheckButtonSmall(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 240, postion_y, MPLanguage.UI_Set_BossOnly)
checkButton_RelicBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.RelicBoss = 1
    else
        MPPaladinCJSaved.RelicBoss = 0
    end
end)



-- 获取纹理元素（兼容所有版本）
local function GetDownMenuTex(dropdownIn, part)
    return _G[dropdownIn:GetName()..part.."Texture"] or _G[dropdownIn:GetName()..part]
end

-- 创建下拉菜单
local dropdown_Relic_Low = CreateFrame("Button", ADDON_NAME.."Dropdown_Relic_Low", checkButton_Relic, "UIDropDownMenuTemplate")
dropdown_Relic_Low:SetPoint("TOPLEFT", checkButton_Relic, "TOPLEFT", -12, -30)

local middle_Relic_Low = GetDownMenuTex(dropdown_Relic_Low, "Middle")
middle_Relic_Low:SetWidth(110) -- 主宽度
middle_Relic_Low:SetHeight(60) -- 主宽度

-- 定义选项（带固定索引的表）
local modes_Relic_Low = {
    [1] = {text = "|cFF9D38C8最终审判圣契|r", item="最终审判圣契", value = 1}
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Relic_Low()
    for idx, data in pairs(modes_Relic_Low) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_Relic_Low, index)
                MPPaladinCJSaved.Relic_Low = modes_Relic_Low[index].item
            end
        end)(idx)
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Relic_Low, Dropdown_Init_Relic_Low)
UIDropDownMenu_SetSelectedID(dropdown_Relic_Low, 1) -- 默认选中第一项



-- 创建下拉菜单
local dropdown_Relic_Normal = CreateFrame("Button", ADDON_NAME.."CatModeDropdown_Relic_Normal", checkButton_Relic, "UIDropDownMenuTemplate")
dropdown_Relic_Normal:SetPoint("TOPLEFT", checkButton_Relic, "TOPLEFT", 130, -30)

local middle_Relic_Normal = GetDownMenuTex(dropdown_Relic_Normal, "Middle")
middle_Relic_Normal:SetWidth(110) -- 主宽度
middle_Relic_Normal:SetHeight(60) -- 主宽度



-- 定义选项（带固定索引的表）
local modes_Relic_Normal = {
    [1] = {text = "|cFF9D38C8永恒之塔圣契|r", item="永恒之塔圣契", value = 1},
    [2] = {text = "|cFF9D38C8热忱圣契|r", item="热忱圣契", value = 2},
    [3] = {text = "|cFF9D38C8神圣领域圣契|r", item="神圣领域圣契", value = 3},
    [4] = {text = "|cFF0070DD热情圣契|r", item="热情圣契", value = 4},
}

-- 菜单初始化（修复空索引问题）
local function Dropdown_Init_Relic_Normal()
    for idx, data in pairs(modes_Relic_Normal) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                UIDropDownMenu_SetSelectedID(dropdown_Relic_Normal, index)
                MPPaladinCJSaved.Relic_Normal = modes_Relic_Normal[index].item
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_Relic_Normal, Dropdown_Init_Relic_Normal)
UIDropDownMenu_SetSelectedID(dropdown_Relic_Normal, 1) -- 默认选中第一项












-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsPaladinCJ, "UICheckButtonTemplate")
checkButton_RacialTraits:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y)
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
        MPPaladinCJSaved.RacialTraits = 1
    else
        MPPaladinCJSaved.RacialTraits = 0
    end
end)



postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Soulspeed = 1
    else
        MPPaladinCJSaved.Soulspeed = 0
    end
end)





postion_y = postion_y+210

-- 前置审判界限
local slider_JudgementOutHP = CreateFrame("Slider", ADDON_NAME.."SliderJudgementOutHP", CatUISettingsPaladinCJ, "OptionsSliderTemplate")
slider_JudgementOutHP:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
slider_JudgementOutHP:SetWidth(220) -- 拖动条长度
slider_JudgementOutHP:SetHeight(16) -- 拖动条高度

slider_JudgementOutHP:SetMinMaxValues(0, 50000)
slider_JudgementOutHP:SetValueStep(1000)
slider_JudgementOutHP:SetValue(3000) -- 默认值
MPCatUISliderRegionHide(slider_JudgementOutHP)

_G[slider_JudgementOutHP:GetName().."Low"]:Hide()
_G[slider_JudgementOutHP:GetName().."High"]:Hide()
_G[slider_JudgementOutHP:GetName().."Text"]:SetFont("Fonts\\FRIZQT__.TTF", 12, "NONE")

-- 值变化时的回调函数
slider_JudgementOutHP:SetScript("OnValueChanged", function()
    --print("Rip当前值:", arg1)
    MPPaladinCJSaved.JudgementOutHP = arg1
    _G[slider_JudgementOutHP:GetName().."Text"]:SetText("目标生命 <".. MPPaladinCJSaved.JudgementOutHP .." 不审判")
end)



postion_y = postion_y -40

-- 奉献等级
local slider_Consecration_Level = CreateFrame("Slider", ADDON_NAME.."SliderConsecration_Level", CatUISettingsPaladinCJ, "OptionsSliderTemplate")
slider_Consecration_Level:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 20, postion_y)
slider_Consecration_Level:SetWidth(220) -- 拖动条长度
slider_Consecration_Level:SetHeight(16) -- 拖动条高度

slider_Consecration_Level:SetMinMaxValues(0, 5)
slider_Consecration_Level:SetValueStep(1)
slider_Consecration_Level:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Consecration_Level)

_G[slider_Consecration_Level:GetName().."Text"]:SetText("奉献等级: 自动|r")
_G[slider_Consecration_Level:GetName().."Low"]:Hide()
_G[slider_Consecration_Level:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Consecration_Level:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    if arg1==0 then
        _G[slider_Consecration_Level:GetName().."Text"]:SetText("奉献等级：自动")
    else
        _G[slider_Consecration_Level:GetName().."Text"]:SetText("奉献等级："..arg1)
    end
    MPPaladinCJSaved.Consecration_Level = arg1
end)



postion_y = postion_y - 120

-- 动态控制
local ButtonAutoSeal = CreateFrame("Button", ADDON_NAME.."ButtonAutoSeal", CatUISettingsPaladinCJ, "UIPanelButtonTemplate")
ButtonAutoSeal:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 340, postion_y+10)
ButtonAutoSeal:SetWidth(100)
ButtonAutoSeal:SetHeight(22)
ButtonAutoSeal:SetFont("Fonts\\FRIZQT__.TTF", 12)
ButtonAutoSeal:SetText("审判控制")

ButtonAutoSeal:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
ButtonAutoSeal:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
ButtonAutoSeal:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
ButtonAutoSeal:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
ButtonAutoSeal:SetScript("OnClick", function()
    MPCatPaladinSealInit()
    if CatPaladinSeal:IsVisible() then
        CatPaladinSeal:Hide()
        MPPublicSaved.PaladinSealDisplay = 0
    else
        CatPaladinSeal:Show()
        MPPublicSaved.PaladinSealDisplay = 1
    end
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPaladinCJ, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsPaladinCJ, "TOPLEFT", 120, -44)
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
    MPResetPaladinCJSettings()
    MPInitPaladinCJSettings()

    MPCatPaladinSealReset()

    CatPaladinSeal:Hide()
    CatPaladinSeal:ClearAllPoints()
    CatPaladinSeal:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

end)



-- 添加分隔线
MPBottomLine(CatUISettingsPaladinCJ)

local checkButton_Power = MPPublicCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 20, 40, MPLanguage.UI_Set_EnablePowerPotion)
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Power = 1
    else
        MPPaladinCJSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", 340, 40, MPLanguage.UI_Set_EnableAutoLoot)
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPaladinCJSaved.Pick = 1
    else
        MPPaladinCJSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsPaladinCJ, ADDON_NAME.."CheckButton", MPLanguage.UI_Set_Settings, 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsPaladinCJ:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPaladinCJ, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFFF58CBA/pdps|r ]")



-- 配置文件版本号
local PaladinCJSettingsUIVersion = 14

function MPResetPaladinCJSettings()

    MPPaladinCJSaved.Version = PaladinCJSettingsUIVersion

    -- 基本配置
    MPPaladinCJSaved.HolinessAura = 1
    MPPaladinCJSaved.Consecration = 1
    MPPaladinCJSaved.Consecration_Level = 0
    MPPaladinCJSaved.Repentance = 1
    MPPaladinCJSaved.Exorcism = 1
    MPPaladinCJSaved.HammerWrath = 0

    MPPaladinCJSaved.Trinket_Upper = 1
    MPPaladinCJSaved.TUBoss = 0
    MPPaladinCJSaved.Trinket_Below = 1
    MPPaladinCJSaved.TBBoss = 0
    MPPaladinCJSaved.Target = 0

    -- 高级配置
    MPPaladinCJSaved.JudgementOutHP = 5000
    MPPaladinCJSaved.Seal = 1
    MPPaladinCJSaved.Seal_Value = 1

    MPPaladinCJSaved.Strike = 1
    MPPaladinCJSaved.Strike_Value = 3

    MPPaladinCJSaved.RacialTraits = 0
    
    -- 圣契
    MPPaladinCJSaved.Relic = 0
    MPPaladinCJSaved.Relic_Low = "最终审判圣契"
    MPPaladinCJSaved.Relic_Normal = "永恒之塔圣契"
    MPPaladinCJSaved.RelicBoss = 0

    -- 治疗石、糖水茶
    MPPaladinCJSaved.HealthStone = 1
    MPPaladinCJSaved.HealthStone_Value = 30
    MPPaladinCJSaved.HerbalTea = 1
    MPPaladinCJSaved.HerbalTea_Value = 20
    MPPaladinCJSaved.HerbalTeaMana = 0
    MPPaladinCJSaved.HerbalTeaMana_Value = 20

    MPPaladinCJSaved.Protection = 0
    MPPaladinCJSaved.Protection_Value = 10
    MPPaladinCJSaved.DivineShield = 0
    MPPaladinCJSaved.DivineShield_Value = 10

    -- SuperWoW,UnitXP
    MPPaladinCJSaved.SuperWoW = 1
    MPPaladinCJSaved.UnitXP = 1

    MPPaladinCJSaved.Soulspeed = 0

    -- 通用
    MPPaladinCJSaved.Power = 0
    MPPaladinCJSaved.Pick = 0

end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end


function InitPaladinCJSetPart1()
    checkButton_HolinessAura:SetChecked(ToBoolean(MPPaladinCJSaved.HolinessAura))

    checkButton_Consecration:SetChecked( ToBoolean(MPPaladinCJSaved.Consecration) )
    checkButton_Repentance:SetChecked( ToBoolean(MPPaladinCJSaved.Repentance) )

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPPaladinCJSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPPaladinCJSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPPaladinCJSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPPaladinCJSaved.TBBoss))

    checkButton_Target:SetChecked(ToBoolean(MPPaladinCJSaved.Target))
    checkButton_Exorcism:SetChecked(ToBoolean(MPPaladinCJSaved.Exorcism))
    checkButton_HammerWrath:SetChecked(ToBoolean(MPPaladinCJSaved.HammerWrath))

    checkButton_Soulspeed:SetChecked(ToBoolean(MPPaladinCJSaved.Soulspeed))

    checkButton_HealthStone:SetChecked(ToBoolean(MPPaladinCJSaved.HealthStone))
    slider_HealthStone:SetValue(MPPaladinCJSaved.HealthStone_Value)
    if MPPaladinCJSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPPaladinCJSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPPaladinCJSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPPaladinCJSaved.HerbalTea_Value)
    if MPPaladinCJSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPPaladinCJSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPPaladinCJSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPPaladinCJSaved.HerbalTeaMana_Value)
    if MPPaladinCJSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPPaladinCJSaved.HerbalTeaMana_Value .."%|r")



    checkButton_Protection:SetChecked(MPPaladinCJSaved.Protection)
    slider_Protection:SetValue(MPPaladinCJSaved.Protection_Value)
    if MPPaladinCJSaved.Protection==1 then
        color_Protection = "|cFFFFD100"
    else
        color_Protection = "|cFF888888"
    end
    _G[slider_Protection:GetName().."Text"]:SetText(color_Protection.."血线: ".. MPPaladinCJSaved.Protection_Value .."%|r")


    checkButton_DivineShield:SetChecked(MPPaladinCJSaved.DivineShield)
    slider_DivineShield:SetValue(MPPaladinCJSaved.DivineShield_Value)
    if MPPaladinCJSaved.DivineShield==1 then
        color_DivineShield = "|cFFFFD100"
    else
        color_DivineShield = "|cFF888888"
    end
    _G[slider_DivineShield:GetName().."Text"]:SetText(color_DivineShield.."血线: ".. MPPaladinCJSaved.DivineShield_Value .."%|r")
end

function MPInitPaladinCJSettings()
    if not MPPaladinCJSaved then
        MPPaladinCJSaved = {}
        MPResetPaladinCJSettings()
    end

    if MPPaladinCJSaved.Version ~= PaladinCJSettingsUIVersion then
        MPResetPaladinCJSettings()
    end

    InitPaladinCJSetPart1()


    checkButton_Seal:SetChecked(MPPaladinCJSaved.Seal)
    slider_Seal:SetValue(MPPaladinCJSaved.Seal_Value)
    if MPPaladinCJSaved.Seal==1 then
        color_Seal = "|cFFFFD100"
    else
        color_Seal = "|cFF888888"
    end
    if MPPaladinCJSaved.Seal_Value==1 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."自动识别")
    elseif MPPaladinCJSaved.Seal_Value==2 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."正义圣印")
    elseif MPPaladinCJSaved.Seal_Value==3 then
        _G[slider_Seal:GetName().."Text"]:SetText(color_Seal.."命令圣印")
    end

    checkButton_Strike:SetChecked(MPPaladinCJSaved.Strike)
    slider_Strike:SetValue(MPPaladinCJSaved.Strike_Value)
    if MPPaladinCJSaved.Strike==1 then
        color_Strike = "|cFFFFD100"
    else
        color_Strike = "|cFF888888"
    end
    if MPPaladinCJSaved.Strike_Value==1 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 神圣打击")
    elseif MPPaladinCJSaved.Strike_Value==2 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 神圣打击 (均衡)")
    elseif MPPaladinCJSaved.Strike_Value==3 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."主用 十字军打击 (均衡)")
    elseif MPPaladinCJSaved.Strike_Value==4 then
        _G[slider_Strike:GetName().."Text"]:SetText(color_Strike.."只用 十字军打击")
    end


    checkButton_Relic:SetChecked(MPPaladinCJSaved.Relic)
    for idx_Relic_Low, data_Relic_Low in pairs(modes_Relic_Low) do
        if string.find(data_Relic_Low.text,MPPaladinCJSaved.Relic_Low) then
            UIDropDownMenu_SetSelectedID(dropdown_Relic_Low, data_Relic_Low.value)
            _G[dropdown_Relic_Low:GetName().."Text"]:SetText(data_Relic_Low.text)
        end
    end
    checkButton_RelicBoss:SetChecked(MPPaladinCJSaved.RelicBoss)

    for idx_Relic_Normal, data_Relic_Normal in pairs(modes_Relic_Normal) do
        if string.find(data_Relic_Normal.text,MPPaladinCJSaved.Relic_Normal) then
            UIDropDownMenu_SetSelectedID(dropdown_Relic_Normal, modes_Relic_Normal[idx_Relic_Normal].value)
            _G[dropdown_Relic_Normal:GetName().."Text"]:SetText(data_Relic_Normal.text)
        end
    end


    slider_JudgementOutHP:SetValue(MPPaladinCJSaved.JudgementOutHP)
    _G[slider_JudgementOutHP:GetName().."Text"]:SetText("目标生命 <".. MPPaladinCJSaved.JudgementOutHP .." 不审判")

    checkButton_RacialTraits:SetChecked(ToBoolean(MPPaladinCJSaved.RacialTraits))

    slider_Consecration_Level:SetValue(MPPaladinCJSaved.Consecration_Level)

    checkButton_Power:SetChecked(ToBoolean(MPPaladinCJSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPPaladinCJSaved.Pick))
end

