-- 定义插件名称
local ADDON_NAME = "Settings-Power"


-- 创建主框架
CatUISettingsPower = MPCreateFrame(ADDON_NAME.."Frame", 520, 520, "|cFFDD4080通用 - 功能药水|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsPower:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsPower, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")



local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end


local postion_y = postion_y-40

-- 创建单选框 - 使用
local checkButton_Use = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "开启功能药水")
checkButton_Use:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Use = 1
    else
        MPPowerSaved.Use = 0
    end
end)

-- 创建单选框 - 战斗中
local checkButton_Combat = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "仅在战斗中生效")
checkButton_Combat:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Combat = 1
    else
        MPPowerSaved.Combat = 0
    end
end)


postion_y = postion_y-20

-- 添加提示内容区域
local noCDTipText = CatUISettingsPower:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
noCDTipText:SetPoint("TOPLEFT", CatUISettingsPower, "TOPLEFT", 20, postion_y)
noCDTipText:SetWidth(250)
noCDTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
noCDTipText:SetTextColor(1, 0.8, 0)
noCDTipText:SetJustifyH("LEFT")
noCDTipText:SetText("防护配置")


postion_y = postion_y-55


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动 |cFF73B560草药茶|r")

local slider_HerbalTea = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTea", checkButton_HerbalTea, "OptionsSliderTemplate")
slider_HerbalTea:SetPoint("RIGHT", checkButton_HerbalTea, "RIGHT", 250, -2)
slider_HerbalTea:SetWidth(150) -- 拖动条长度
slider_HerbalTea:SetHeight(16) -- 拖动条高度

slider_HerbalTea:SetMinMaxValues(1, 100)
slider_HerbalTea:SetValueStep(1)
slider_HerbalTea:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTea)

slider_HerbalTea:SetScript("OnValueChanged", function()
    MPPowerSaved.HerbalTea_Value = arg1
    if MPPowerSaved.HerbalTea==1 then
        _G[slider_HerbalTea:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.HerbalTea_Value .."%|r")
    else
        _G[slider_HerbalTea:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.HerbalTea_Value .."%|r")
    end
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.HerbalTea = 1
        _G[slider_HerbalTea:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.HerbalTea_Value .."%|r")
    else
        MPPowerSaved.HerbalTea = 0
        _G[slider_HerbalTea:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.HerbalTea_Value .."%|r")
    end
end)


-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "自动 |cFF73B560草药茶|r")

local slider_HerbalTeaMana = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTeaMana", checkButton_HerbalTeaMana, "OptionsSliderTemplate")
slider_HerbalTeaMana:SetPoint("RIGHT", checkButton_HerbalTeaMana, "RIGHT", 250, -2)
slider_HerbalTeaMana:SetWidth(150) -- 拖动条长度
slider_HerbalTeaMana:SetHeight(16) -- 拖动条高度

slider_HerbalTeaMana:SetMinMaxValues(1, 100)
slider_HerbalTeaMana:SetValueStep(1)
slider_HerbalTeaMana:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTeaMana)

slider_HerbalTeaMana:SetScript("OnValueChanged", function()
    MPPowerSaved.HerbalTeaMana_Value = arg1
    if MPPowerSaved.HerbalTeaMana==1 then
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText("|cFFFFD100蓝量: ".. MPPowerSaved.HerbalTeaMana_Value .."%|r")
    else
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText("|cFF888888蓝量: ".. MPPowerSaved.HerbalTeaMana_Value .."%|r")
    end
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.HerbalTeaMana = 1
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText("|cFFFFD100蓝量: ".. MPPowerSaved.HerbalTeaMana_Value .."%|r")
    else
        MPPowerSaved.HerbalTeaMana = 0
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText("|cFF888888蓝量: ".. MPPowerSaved.HerbalTeaMana_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 活力
local checkButton_Rejuven = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动 |cFFE777FF特效活力|r")

local slider_Rejuven = CreateFrame("Slider", ADDON_NAME.."Slider_Rejuven", checkButton_Rejuven, "OptionsSliderTemplate")
slider_Rejuven:SetPoint("RIGHT", checkButton_Rejuven, "RIGHT", 250, -2)
slider_Rejuven:SetWidth(150) -- 拖动条长度
slider_Rejuven:SetHeight(16) -- 拖动条高度

slider_Rejuven:SetMinMaxValues(1, 100)
slider_Rejuven:SetValueStep(1)
slider_Rejuven:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Rejuven)

slider_Rejuven:SetScript("OnValueChanged", function()
    MPPowerSaved.Rejuven_Value = arg1
    if MPPowerSaved.Rejuven==1 then
        _G[slider_Rejuven:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.Rejuven_Value .."%|r")
    else
        _G[slider_Rejuven:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.Rejuven_Value .."%|r")
    end
end)

-- 设置点击事件
checkButton_Rejuven:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Rejuven = 1
        _G[slider_Rejuven:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.Rejuven_Value .."%|r")
    else
        MPPowerSaved.Rejuven = 0
        _G[slider_Rejuven:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.Rejuven_Value .."%|r")
    end
end)


-- 创建单选框 - 活力
local checkButton_RejuvenMana = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "自动 |cFFE777FF特效活力|r")

local slider_RejuvenMana = CreateFrame("Slider", ADDON_NAME.."Slider_RejuvenMana", checkButton_RejuvenMana, "OptionsSliderTemplate")
slider_RejuvenMana:SetPoint("RIGHT", checkButton_RejuvenMana, "RIGHT", 250, -2)
slider_RejuvenMana:SetWidth(150) -- 拖动条长度
slider_RejuvenMana:SetHeight(16) -- 拖动条高度

slider_RejuvenMana:SetMinMaxValues(1, 100)
slider_RejuvenMana:SetValueStep(1)
slider_RejuvenMana:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_RejuvenMana)

slider_RejuvenMana:SetScript("OnValueChanged", function()
    MPPowerSaved.RejuvenMana_Value = arg1
    if MPPowerSaved.RejuvenMana==1 then
        _G[slider_RejuvenMana:GetName().."Text"]:SetText("|cFFFFD100蓝量: ".. MPPowerSaved.RejuvenMana_Value .."%|r")
    else
        _G[slider_RejuvenMana:GetName().."Text"]:SetText("|cFF888888蓝量: ".. MPPowerSaved.RejuvenMana_Value .."%|r")
    end
end)

-- 设置点击事件
checkButton_RejuvenMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.RejuvenMana = 1
        _G[slider_RejuvenMana:GetName().."Text"]:SetText("|cFFFFD100蓝量: ".. MPPowerSaved.RejuvenMana_Value .."%|r")
    else
        MPPowerSaved.RejuvenMana = 0
        _G[slider_RejuvenMana:GetName().."Text"]:SetText("|cFF888888蓝量: ".. MPPowerSaved.RejuvenMana_Value .."%|r")
    end
end)






postion_y = postion_y-40


-- 创建单选框 - 大红
local checkButton_Healing = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动 |cFFD81811特效治疗|r")

local slider_Healing = CreateFrame("Slider", ADDON_NAME.."Slider_Heal", checkButton_Healing, "OptionsSliderTemplate")
slider_Healing:SetPoint("RIGHT", checkButton_Healing, "RIGHT", 250, -2)
slider_Healing:SetWidth(150) -- 拖动条长度
slider_Healing:SetHeight(16) -- 拖动条高度

slider_Healing:SetMinMaxValues(1, 100)
slider_Healing:SetValueStep(1)
slider_Healing:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Healing)

slider_Healing:SetScript("OnValueChanged", function()
    MPPowerSaved.Healing_Value = arg1
    if MPPowerSaved.Healing==1 then
        _G[slider_Healing:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.Healing_Value .."%|r")
    else
        _G[slider_Healing:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.Healing_Value .."%|r")
    end
end)

-- 设置点击事件
checkButton_Healing:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Healing = 1
        _G[slider_Healing:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.Healing_Value .."%|r")
    else
        MPPowerSaved.Healing = 0
        _G[slider_Healing:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.Healing_Value .."%|r")
    end
end)


-- 创建单选框 - 法力药水
local checkButton_Mana = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "自动 |cFF3E97E7特效法力|r")

local slider_Mana = CreateFrame("Slider", ADDON_NAME.."Slider_Mana", checkButton_Mana, "OptionsSliderTemplate")
slider_Mana:SetPoint("RIGHT", checkButton_Mana, "RIGHT", 250, -2)
slider_Mana:SetWidth(150) -- 拖动条长度
slider_Mana:SetHeight(16) -- 拖动条高度

slider_Mana:SetMinMaxValues(1, 100)
slider_Mana:SetValueStep(1)
slider_Mana:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Mana)

slider_Mana:SetScript("OnValueChanged", function()
    MPPowerSaved.Mana_Value = arg1
    if MPPowerSaved.Mana==1 then
        _G[slider_Mana:GetName().."Text"]:SetText("|cFFFFD100蓝量: ".. MPPowerSaved.Mana_Value .."%|r")
    else
        _G[slider_Mana:GetName().."Text"]:SetText("|cFF888888蓝量: ".. MPPowerSaved.Mana_Value .."%|r")
    end
end)

-- 设置点击事件
checkButton_Mana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Mana = 1
        _G[slider_Mana:GetName().."Text"]:SetText("|cFFFFD100蓝量: ".. MPPowerSaved.Mana_Value .."%|r")
    else
        MPPowerSaved.Mana = 0
        _G[slider_Mana:GetName().."Text"]:SetText("|cFF888888蓝量: ".. MPPowerSaved.Mana_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 治疗石
local checkButton_HealthStone = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动 |cFF42DE1F治疗石|r")

local slider_HealthStone = CreateFrame("Slider", ADDON_NAME.."Slider_HealthStone", checkButton_HealthStone, "OptionsSliderTemplate")
slider_HealthStone:SetPoint("RIGHT", checkButton_HealthStone, "RIGHT", 250, -2)
slider_HealthStone:SetWidth(150) -- 拖动条长度
slider_HealthStone:SetHeight(16) -- 拖动条高度

slider_HealthStone:SetMinMaxValues(1, 100)
slider_HealthStone:SetValueStep(1)
slider_HealthStone:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_HealthStone)

slider_HealthStone:SetScript("OnValueChanged", function()
    MPPowerSaved.HealthStone_Value = arg1
    if MPPowerSaved.HealthStone==1 then
        _G[slider_HealthStone:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.HealthStone_Value .."%|r")
    else
        _G[slider_HealthStone:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.HealthStone_Value .."%|r")
    end
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.HealthStone = 1
        _G[slider_HealthStone:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.HealthStone_Value .."%|r")
    else
        MPPowerSaved.HealthStone = 0
        _G[slider_HealthStone:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.HealthStone_Value .."%|r")
    end
end)


-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "自动 |cFFCEBA6B鞭根块茎|r")

local slider_Carrot = CreateFrame("Slider", ADDON_NAME.."Slider_Carrot", checkButton_Carrot, "OptionsSliderTemplate")
slider_Carrot:SetPoint("RIGHT", checkButton_Carrot, "RIGHT", 250, -2)
slider_Carrot:SetWidth(150) -- 拖动条长度
slider_Carrot:SetHeight(16) -- 拖动条高度

slider_Carrot:SetMinMaxValues(1, 100)
slider_Carrot:SetValueStep(1)
slider_Carrot:SetValue(0) -- 默认值
MPCatUISliderRegionHide(slider_Carrot)

slider_Carrot:SetScript("OnValueChanged", function()
    MPPowerSaved.Carrot_Value = arg1
    if MPPowerSaved.Carrot==1 then
        _G[slider_Carrot:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.Carrot_Value .."%|r")
    else
        _G[slider_Carrot:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.Carrot_Value .."%|r")
    end
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Carrot = 1
        _G[slider_Carrot:GetName().."Text"]:SetText("|cFFFFD100血线: ".. MPPowerSaved.Carrot_Value .."%|r")
    else
        MPPowerSaved.Carrot = 0
        _G[slider_Carrot:GetName().."Text"]:SetText("|cFF888888血线: ".. MPPowerSaved.Carrot_Value .."%|r")
    end
end)









postion_y = postion_y-40

-- 创建单选框 - 无敌
local checkButton_Invincible = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动 |cFFCBDB5F有限无敌|r")
checkButton_Invincible:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Invincible = 1
    else
        MPPowerSaved.Invincible = 0
    end
end)
local checkButton_InvincibleBoss = MPCreateCheckButtonSmall(CatUISettingsPower, ADDON_NAME.."CheckButton", 190, postion_y, "仅BOSS")
checkButton_InvincibleBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.InvincibleBoss = 1
    else
        MPPowerSaved.InvincibleBoss = 0
    end
end)


-- 创建单选框 - 解毒药剂
local checkButton_Detoxify = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "自动 |cFF63840E解毒药水/抗毒药剂|r")
checkButton_Detoxify:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Detoxify = 1
    else
        MPPowerSaved.Detoxify = 0
    end
end)





postion_y = postion_y+25

-- 添加提示内容区域
local attackTipText = CatUISettingsPower:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
attackTipText:SetPoint("TOPLEFT", CatUISettingsPower, "TOPLEFT", 20, postion_y)
attackTipText:SetWidth(250)
attackTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
attackTipText:SetTextColor(1, 0.8, 0)
attackTipText:SetJustifyH("LEFT")
attackTipText:SetText("进攻配置")


postion_y = postion_y-105

-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动爆发饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Trinket_Upper = 1
    else
        MPPowerSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsPower, ADDON_NAME.."CheckButton", 190, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.TUBoss = 1
    else
        MPPowerSaved.TUBoss = 0
    end
end)

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "自动爆发饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Trinket_Below = 1
    else
        MPPowerSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsPower, ADDON_NAME.."CheckButton", 510, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.TBBoss = 1
    else
        MPPowerSaved.TBBoss = 0
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 强怒
local checkButton_Powerful = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动 |cFFC61000强效怒气|r")
checkButton_Powerful:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Powerful = 1
    else
        MPPowerSaved.Powerful = 0
    end
end)
local checkButton_PowerfulBoss = MPCreateCheckButtonSmall(CatUISettingsPower, ADDON_NAME.."CheckButton", 190, postion_y, "仅BOSS")
checkButton_PowerfulBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.PowerfulBoss = 1
    else
        MPPowerSaved.PowerfulBoss = 0
    end
end)

-- 创建单选框 - 急速
local checkButton_Swiftness = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "自动 |cFFC54018加速药水|r")
checkButton_Swiftness:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Swiftness = 1
    else
        MPPowerSaved.Swiftness = 0
    end
end)
local checkButton_SwiftnessBoss = MPCreateCheckButtonSmall(CatUISettingsPower, ADDON_NAME.."CheckButton", 510, postion_y, "仅BOSS")
checkButton_SwiftnessBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.SwiftnessBoss = 1
    else
        MPPowerSaved.SwiftnessBoss = 0
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动 魂能之速")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Soulspeed = 1
    else
        MPPowerSaved.Soulspeed = 0
    end
end)
local checkButton_SoulspeedBoss = MPCreateCheckButtonSmall(CatUISettingsPower, ADDON_NAME.."CheckButton", 190, postion_y, "仅BOSS")
checkButton_SoulspeedBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.SoulspeedBoss = 1
    else
        MPPowerSaved.SoulspeedBoss = 0
    end
end)

-- 创建单选框 - 献祭之油
local checkButton_Sacrificial = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 340, postion_y, "自动 |cFFEB478D献祭之油|r (SW+UXP模组)")
checkButton_Sacrificial:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Sacrificial = 1
    else
        MPPowerSaved.Sacrificial = 0
    end
end)



postion_y = postion_y+60

-- 添加提示内容区域
local gongnengTipText = CatUISettingsPower:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
gongnengTipText:SetPoint("TOPLEFT", CatUISettingsPower, "TOPLEFT", 20, postion_y)
gongnengTipText:SetWidth(250)
gongnengTipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
gongnengTipText:SetTextColor(1, 0.8, 0)
gongnengTipText:SetJustifyH("LEFT")
gongnengTipText:SetText("特殊功能配置")


postion_y = postion_y-135

-- 创建单选框 - 屠魔药剂
local checkButton_Demon = MPCreateCheckButton(CatUISettingsPower, ADDON_NAME.."CheckButton", 20, postion_y, "自动 |cFF6A1681屠魔药剂|r")
checkButton_Demon:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.Demon = 1
    else
        MPPowerSaved.Demon = 0
    end
end)
local checkButton_DemonBoss = MPCreateCheckButtonSmall(CatUISettingsPower, ADDON_NAME.."CheckButton", 190, postion_y, "仅BOSS")
checkButton_DemonBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPowerSaved.DemonBoss = 1
    else
        MPPowerSaved.DemonBoss = 0
    end
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsPower, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsPower, "TOPLEFT", 120, -44)
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
    MPResetPowerSettings()
    MPInitPowerSettings()
end)


-- 添加提示内容区域
local TipText = CatUISettingsPower:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsPower, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ 独立使用 |cFFDD4080/catp|r ]")



-- 配置文件版本号
local PowerSettingsUIVersion = 3

function MPResetPowerSettings()

    MPPowerSaved.Version = PowerSettingsUIVersion

    -- 基本配置
    MPPowerSaved.Use = 1
    MPPowerSaved.Combat = 1


    MPPowerSaved.HerbalTea = 1
    MPPowerSaved.HerbalTea_Value = 20
    MPPowerSaved.HerbalTeaMana = 0
    MPPowerSaved.HerbalTeaMana_Value = 20

    MPPowerSaved.HealthStone = 1
    MPPowerSaved.HealthStone_Value = 30
    MPPowerSaved.Carrot = 0
    MPPowerSaved.Carrot_Value = 20

    MPPowerSaved.Healing = 0
    MPPowerSaved.Healing_Value = 20
    MPPowerSaved.Mana = 0
    MPPowerSaved.Mana_Value = 20

    MPPowerSaved.Rejuven = 0
    MPPowerSaved.Rejuven_Value = 20
    MPPowerSaved.RejuvenMana = 0
    MPPowerSaved.RejuvenMana_Value = 20

    MPPowerSaved.Invincible = 0
    MPPowerSaved.InvincibleBoss = 0
    MPPowerSaved.Detoxify = 0

    MPPowerSaved.Trinket_Upper = 0
    MPPowerSaved.TUBoss = 0
    MPPowerSaved.Trinket_Below = 0
    MPPowerSaved.TBBoss = 0

    MPPowerSaved.Powerful = 0
    MPPowerSaved.PowerfulBoss = 1
    MPPowerSaved.Swiftness = 0
    MPPowerSaved.SwiftnessBoss = 1
    MPPowerSaved.Soulspeed = 1
    MPPowerSaved.SoulspeedBoss = 1
    MPPowerSaved.Sacrificial = 0

    MPPowerSaved.Demon = 0
    MPPowerSaved.DemonBoss = 1

end


function MPInitPowerSettingsPart1()
    checkButton_Use:SetChecked(ToBoolean(MPPowerSaved.Use))
    checkButton_Combat:SetChecked(ToBoolean(MPPowerSaved.Combat))

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPPowerSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPPowerSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPPowerSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPPowerSaved.TBBoss))


    checkButton_HerbalTea:SetChecked(ToBoolean(MPPowerSaved.HerbalTea))
    slider_HerbalTea:SetValue(MPPowerSaved.HerbalTea_Value)
    checkButton_HerbalTeaMana:SetChecked(ToBoolean(MPPowerSaved.HerbalTeaMana))
    slider_HerbalTeaMana:SetValue(MPPowerSaved.HerbalTeaMana_Value)

    checkButton_Rejuven:SetChecked(ToBoolean(MPPowerSaved.Rejuven))
    slider_Rejuven:SetValue(MPPowerSaved.Rejuven_Value)
    checkButton_RejuvenMana:SetChecked(ToBoolean(MPPowerSaved.RejuvenMana))
    slider_RejuvenMana:SetValue(MPPowerSaved.RejuvenMana_Value)

    checkButton_HealthStone:SetChecked(ToBoolean(MPPowerSaved.HealthStone))
    slider_HealthStone:SetValue(MPPowerSaved.HealthStone_Value)
    checkButton_Carrot:SetChecked(ToBoolean(MPPowerSaved.Carrot))
    slider_Carrot:SetValue(MPPowerSaved.Carrot_Value)
    checkButton_Healing:SetChecked(ToBoolean(MPPowerSaved.Healing))
    slider_Healing:SetValue(MPPowerSaved.Healing_Value)
    checkButton_Mana:SetChecked(ToBoolean(MPPowerSaved.Mana))
    slider_Mana:SetValue(MPPowerSaved.Mana_Value)

end

function MPInitPowerSettings()

    if not MPPowerSaved then
        MPPowerSaved = {}
        MPResetPowerSettings()
    end

    if MPPowerSaved.Version ~= PowerSettingsUIVersion then
        MPResetPowerSettings()
    end

    MPInitPowerSettingsPart1()


    checkButton_Powerful:SetChecked(ToBoolean(MPPowerSaved.Powerful))
    checkButton_PowerfulBoss:SetChecked(ToBoolean(MPPowerSaved.PowerfulBoss))
    checkButton_Swiftness:SetChecked(ToBoolean(MPPowerSaved.Swiftness))
    checkButton_SwiftnessBoss:SetChecked(ToBoolean(MPPowerSaved.SwiftnessBoss))
    checkButton_Soulspeed:SetChecked(ToBoolean(MPPowerSaved.Soulspeed))
    checkButton_SoulspeedBoss:SetChecked(ToBoolean(MPPowerSaved.SoulspeedBoss))
    checkButton_Sacrificial:SetChecked(ToBoolean(MPPowerSaved.Sacrificial))

    checkButton_Demon:SetChecked(ToBoolean(MPPowerSaved.Demon))
    checkButton_DemonBoss:SetChecked(ToBoolean(MPPowerSaved.DemonBoss))

    checkButton_Invincible:SetChecked(ToBoolean(MPPowerSaved.Invincible))
    checkButton_InvincibleBoss:SetChecked(ToBoolean(MPPowerSaved.InvincibleBoss))
    checkButton_Detoxify:SetChecked(ToBoolean(MPPowerSaved.Detoxify))


end

