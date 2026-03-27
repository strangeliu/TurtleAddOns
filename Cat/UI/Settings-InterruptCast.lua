-- 定义插件名称
local ADDON_NAME = "Settings-Interrupt"


-- 创建主框架
CatUISettingsInterrupt = MPCreateFrame(ADDON_NAME.."Frame", 520, 280, "|cFFDD4080通用 - 读条打断|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsInterrupt:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")




local postion_y = postion_y-40

-- 创建单选框 - 战士
local checkButton_Warrior = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsInterrupt, "UICheckButtonTemplate")
checkButton_Warrior:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 20, postion_y)
checkButton_Warrior:SetScale(0.8)
checkButton_Warrior:Disable()

-- 添加文字标签
local checkText_Warrior = checkButton_Warrior:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Warrior:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Warrior:SetTextColor(1, 1, 1)
checkText_Warrior:SetPoint("LEFT", checkButton_Warrior, "LEFT", 34, 1)
checkText_Warrior:SetText("启用 |cFFC79C6E战士 (拳击、盾击)|r")

-- 设置点击事件
checkButton_Warrior:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPInterruptCastSaved.Warrior = 1
    else
        MPInterruptCastSaved.Warrior = 0
    end
end)


-- 创建单选框 - 法师

--[[
-- 创建单选框 - 法术反制
local checkButton_Mage = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_Mage", CatUISettingsInterrupt, "UICheckButtonTemplate")
checkButton_Mage:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 340, postion_y)
checkButton_Mage:SetScale(0.8)

-- 添加文字标签
local checkText_Mage = checkButton_Mage:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Mage:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Mage:SetTextColor(1, 1, 1)
checkText_Mage:SetPoint("LEFT", checkButton_Mage, "LEFT", 34, 1)
checkText_Mage:SetText("启用 |cFF69CCF0法师 (法术反制)|r")


local slider_Mage = CreateFrame("Slider", ADDON_NAME.."Slider_Mage", checkButton_Mage, "OptionsSliderTemplate")
slider_Mage:SetPoint("RIGHT", checkButton_Mage, "RIGHT", 265, -2)
slider_Mage:SetWidth(100) -- 拖动条长度
slider_Mage:SetHeight(16) -- 拖动条高度

slider_Mage:SetMinMaxValues(1, 7)
slider_Mage:SetValueStep(1)
slider_Mage:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_Mage)

local color_Mage = "|cFFFFD100"

_G[slider_Mage:GetName().."Text"]:SetText(color_Mage.."蓝量: 20%|r")
_G[slider_Mage:GetName().."Low"]:Hide()
_G[slider_Mage:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_Mage:SetScript("OnValueChanged", function()
    MPInterruptCastSaved.Mage_Value = arg1
    _G[slider_Mage:GetName().."Text"]:SetText(color_Mage.."等级: ".. MPInterruptCastSaved.Mage_Value .."|r")
end)

-- 设置点击事件
checkButton_Mage:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPInterruptCastSaved.Mage = 1
        color_Mage = "|cFFFFD100"
        _G[slider_Mage:GetName().."Text"]:SetText(color_Mage.."等级: ".. MPInterruptCastSaved.Mage_Value .."|r")
    else
        MPInterruptCastSaved.Mage = 0
        color_Mage = "|cFF888888"
        _G[slider_Mage:GetName().."Text"]:SetText(color_Mage.."等级: ".. MPInterruptCastSaved.Mage_Value .."|r")
    end
end)
]]


local checkButton_Mage = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsInterrupt, "UICheckButtonTemplate")
checkButton_Mage:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 340, postion_y)
checkButton_Mage:SetScale(0.8)
checkButton_Mage:Disable()

-- 添加文字标签
local checkText_Mage = checkButton_Mage:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Mage:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Mage:SetTextColor(1, 1, 1)
checkText_Mage:SetPoint("LEFT", checkButton_Mage, "LEFT", 34, 1)
checkText_Mage:SetText("启用 |cFF69CCF0法师 (法术反制)|r")

-- 设置点击事件
checkButton_Mage:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPInterruptCastSaved.Mage = 1
    else
        MPInterruptCastSaved.Mage = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 盗贼
local checkButton_Rogue = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsInterrupt, "UICheckButtonTemplate")
checkButton_Rogue:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 20, postion_y)
checkButton_Rogue:SetScale(0.8)
checkButton_Rogue:Disable()

-- 添加文字标签
local checkText_Rogue = checkButton_Rogue:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Rogue:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Rogue:SetTextColor(1, 1, 1)
checkText_Rogue:SetPoint("LEFT", checkButton_Rogue, "LEFT", 34, 1)
checkText_Rogue:SetText("启用 |cFFFFF569盗贼 (脚踢、致命投掷)|r")

-- 设置点击事件
checkButton_Rogue:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPInterruptCastSaved.Rogue = 1
    else
        MPInterruptCastSaved.Rogue = 0
    end
end)



-- 创建单选框 - 萨满
local checkButton_Shaman = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_Shaman", CatUISettingsInterrupt, "UICheckButtonTemplate")
checkButton_Shaman:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 340, postion_y)
checkButton_Shaman:SetScale(0.8)
checkButton_Shaman:Disable()

-- 添加文字标签
local checkText_Shaman = checkButton_Shaman:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Shaman:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Shaman:SetTextColor(1, 1, 1)
checkText_Shaman:SetPoint("LEFT", checkButton_Shaman, "LEFT", 34, 1)
checkText_Shaman:SetText("启用 |cFF0070DE萨满 (大地震击)|r")


local slider_Shaman = CreateFrame("Slider", ADDON_NAME.."Slider_Shaman", checkButton_Shaman, "OptionsSliderTemplate")
slider_Shaman:SetPoint("RIGHT", checkButton_Shaman, "RIGHT", 265, -2)
slider_Shaman:SetWidth(100) -- 拖动条长度
slider_Shaman:SetHeight(16) -- 拖动条高度

slider_Shaman:SetMinMaxValues(1, 7)
slider_Shaman:SetValueStep(1)
slider_Shaman:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_Shaman)

local color_Shaman = "|cFFFFD100"

_G[slider_Shaman:GetName().."Text"]:SetText(color_Shaman.."等级: 1|r")
_G[slider_Shaman:GetName().."Low"]:Hide()
_G[slider_Shaman:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_Shaman:SetScript("OnValueChanged", function()
    MPInterruptCastSaved.Shaman_Value = arg1
    _G[slider_Shaman:GetName().."Text"]:SetText(color_Shaman.."等级: ".. MPInterruptCastSaved.Shaman_Value .."|r")
end)

-- 设置点击事件
checkButton_Shaman:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPInterruptCastSaved.Shaman = 1
        color_Shaman = "|cFFFFD100"
        _G[slider_Shaman:GetName().."Text"]:SetText(color_Shaman.."等级: ".. MPInterruptCastSaved.Shaman_Value .."|r")
    else
        MPInterruptCastSaved.Shaman = 0
        color_Shaman = "|cFF888888"
        _G[slider_Shaman:GetName().."Text"]:SetText(color_Shaman.."等级: ".. MPInterruptCastSaved.Shaman_Value .."|r")
    end
end)


postion_y = postion_y-30



-- 创建单选框 - 术士
local checkButton_Warlock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsInterrupt, "UICheckButtonTemplate")
checkButton_Warlock:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 20, postion_y)
checkButton_Warlock:SetScale(0.8)
checkButton_Warlock:Disable()

-- 添加文字标签
local checkText_Warlock = checkButton_Warlock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Warlock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Warlock:SetTextColor(1, 1, 1)
checkText_Warlock:SetPoint("LEFT", checkButton_Warlock, "LEFT", 34, 1)
checkText_Warlock:SetText("启用 |cFF9482C9术士 (法术封锁)|r")

-- 设置点击事件
checkButton_Warlock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPInterruptCastSaved.Warlock = 1
    else
        MPInterruptCastSaved.Warlock = 0
    end
end)



-- 创建单选框 - 牧师
local checkButton_Priest = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsInterrupt, "UICheckButtonTemplate")
checkButton_Priest:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 340, postion_y)
checkButton_Priest:SetScale(0.8)
checkButton_Priest:Disable()

-- 添加文字标签
local checkText_Priest = checkButton_Priest:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Priest:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Priest:SetTextColor(1, 1, 1)
checkText_Priest:SetPoint("LEFT", checkButton_Priest, "LEFT", 34, 1)
checkText_Priest:SetText("启用 |cFFFFFFFF牧师 (沉默)|r")

-- 设置点击事件
checkButton_Priest:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPInterruptCastSaved.Priest = 1
    else
        MPInterruptCastSaved.Priest = 0
    end
end)



postion_y = postion_y-60



-- 创建单选框 - 断条
local checkButton_StopCasting = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsInterrupt, "UICheckButtonTemplate")
checkButton_StopCasting:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 20, postion_y)
checkButton_StopCasting:SetScale(0.8)

-- 添加文字标签
local checkText_StopCasting = checkButton_StopCasting:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_StopCasting:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_StopCasting:SetTextColor(1, 1, 1)
checkText_StopCasting:SetPoint("LEFT", checkButton_StopCasting, "LEFT", 34, 1)
checkText_StopCasting:SetText("启用 中断自己施法")

-- 设置点击事件
checkButton_StopCasting:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPInterruptCastSaved.StopCasting = 1
    else
        MPInterruptCastSaved.StopCasting = 0
    end
end)


-- 添加文字标签
local checkText_SuperWoW = CatUISettingsInterrupt:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SuperWoW:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_SuperWoW:SetTextColor(1, 1, 1)
checkText_SuperWoW:SetPoint("LEFT", CatUISettingsInterrupt, "LEFT", 20, postion_y+120)
checkText_SuperWoW:SetText("说明：目标在读条时才会进行打断，必须SuperWoW模组支持 (自动识别)")



-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsInterrupt, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsInterrupt, "TOPLEFT", 120, -44)
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
    MPResetInterruptSettings()
    MPInitInterruptSettings()
end)


-- 添加提示内容区域
local TipText = CatUISettingsInterrupt:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsInterrupt, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ 通用 |cFFDD4080/INTCast|r    针对技能打断 |cFFDD4080/INTCast 暗影箭|r ]")



-- 配置文件版本号
local InterruptSettingsUIVersion = 4

function MPResetInterruptSettings()

    MPInterruptCastSaved.Version = InterruptSettingsUIVersion

    -- 基本配置

    MPInterruptCastSaved.Warrior = 1
    MPInterruptCastSaved.Rogue = 1
    MPInterruptCastSaved.Mage = 1
    MPInterruptCastSaved.Mage_Value = 1
    MPInterruptCastSaved.Shaman = 1
    MPInterruptCastSaved.Shaman_Value = 1
    MPInterruptCastSaved.Warlock = 1
    MPInterruptCastSaved.Priest = 1
    MPInterruptCastSaved.StopCasting = 1


end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end



function MPInitInterruptSettings()

    if not MPInterruptCastSaved then
        MPInterruptCastSaved = {}
        MPResetInterruptSettings()
    end

    if MPInterruptCastSaved.Version ~= InterruptSettingsUIVersion then
        MPResetInterruptSettings()
    end

    checkButton_Warrior:SetChecked(ToBoolean(MPInterruptCastSaved.Warrior))
    checkButton_Rogue:SetChecked(ToBoolean(MPInterruptCastSaved.Rogue))
    checkButton_Mage:SetChecked(ToBoolean(MPInterruptCastSaved.Mage))
    checkButton_Warlock:SetChecked(ToBoolean(MPInterruptCastSaved.Warlock))
    checkButton_Priest:SetChecked(ToBoolean(MPInterruptCastSaved.Priest))
    checkButton_StopCasting:SetChecked(ToBoolean(MPInterruptCastSaved.StopCasting))

    --[[
    checkButton_Mage:SetChecked(ToBoolean(MPInterruptCastSaved.Mage))
    slider_Mage:SetValue(MPInterruptCastSaved.Mage_Value)
    if MPInterruptCastSaved.Mage==1 then
        color_Mage = "|cFFFFD100"
    else
        color_Mage = "|cFF888888"
    end
    _G[slider_Mage:GetName().."Text"]:SetText(color_Mage.."等级: ".. MPInterruptCastSaved.Mage_Value .."|r")
    ]]

    checkButton_Shaman:SetChecked(ToBoolean(MPInterruptCastSaved.Shaman))
    slider_Shaman:SetValue(MPInterruptCastSaved.Shaman_Value)
    if MPInterruptCastSaved.Shaman==1 then
        color_Shaman = "|cFFFFD100"
    else
        color_Shaman = "|cFF888888"
    end
    _G[slider_Shaman:GetName().."Text"]:SetText(color_Shaman.."等级: ".. MPInterruptCastSaved.Shaman_Value .."|r")

end

