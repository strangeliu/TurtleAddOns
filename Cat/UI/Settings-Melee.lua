
-- 定义插件名称
local ADDON_NAME = "Settings-Melee"


-- 创建主框架
CatUISettingMelee = MPCreateFrame(ADDON_NAME.."Frame", 520, 220, "|cFF007582".."近战指示器".."|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingMelee:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingMelee, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText(MPLanguage.UI_Set_BasicConfig)


postion_y = postion_y-40

-- 创建单选框 - 显示距离
local checkButton_Distance = MPCreateCheckButton(CatUISettingMelee, ADDON_NAME.."CheckButton", 20, postion_y, "显示 距离数字")
checkButton_Distance:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMeleeSaved.Distance = 1
    else
        MPMeleeSaved.Distance = 0
    end
end)

-- 创建单选框 - 锁定拖动
local checkButton_Lock = MPCreateCheckButton(CatUISettingMelee, ADDON_NAME.."CheckButton", 340, postion_y, "锁定 图标拖动")
checkButton_Lock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMeleeSaved.Lock = 1
    else
        MPMeleeSaved.Lock = 0
    end
end)


local postion_y = postion_y-30

-- 创建单选框 - 显示仇恨
local checkButton_Hatred = MPCreateCheckButton(CatUISettingMelee, ADDON_NAME.."CheckButton", 20, postion_y, "显示 仇恨数字 (需TWT插件)")
checkButton_Hatred:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPMeleeSaved.Hatred = 1
    else
        MPMeleeSaved.Hatred = 0
    end
end)


local postion_y = postion_y-40

local slider_WindowSize = CreateFrame("Slider", ADDON_NAME.."Scale", CatUISettingMelee, "OptionsSliderTemplate")
slider_WindowSize:SetPoint("TOPLEFT", CatUISettingMelee, "TOPLEFT", 20, postion_y)
slider_WindowSize:SetWidth(160) -- 拖动条长度
slider_WindowSize:SetHeight(16) -- 拖动条高度

slider_WindowSize:SetMinMaxValues(0.3, 5.0)
slider_WindowSize:SetValueStep(0.1)
slider_WindowSize:SetValue(10.0) -- 默认值
MPCatUISliderRegionHide(slider_WindowSize)

-- 值变化时的回调函数
slider_WindowSize:SetScript("OnValueChanged", function()

    if MPMeleeSaved.Scale ~= arg1 then
        CatUIMelee:ClearAllPoints()
        CatUIMelee:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    end

    MPMeleeSaved.Scale = arg1
    _G[slider_WindowSize:GetName().."Text"]:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    _G[slider_WindowSize:GetName().."Text"]:SetText("图标大小 "..string.format("%.1f", MPMeleeSaved.Scale))
    CatUIMelee:SetScale(MPMeleeSaved.Scale)
end)



local slider_Alpha = CreateFrame("Slider", ADDON_NAME.."Alpha", CatUISettingMelee, "OptionsSliderTemplate")
slider_Alpha:SetPoint("TOPLEFT", CatUISettingMelee, "TOPLEFT", 280, postion_y)
slider_Alpha:SetWidth(160) -- 拖动条长度
slider_Alpha:SetHeight(16) -- 拖动条高度

slider_Alpha:SetMinMaxValues(0.1, 1.0)
slider_Alpha:SetValueStep(0.1)
slider_Alpha:SetValue(10.0) -- 默认值
MPCatUISliderRegionHide(slider_Alpha)

-- 值变化时的回调函数
slider_Alpha:SetScript("OnValueChanged", function()

    MPMeleeSaved.Alpha = arg1
    _G[slider_Alpha:GetName().."Text"]:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    _G[slider_Alpha:GetName().."Text"]:SetText("图标透明度 "..string.format("%.1f", MPMeleeSaved.Alpha))

end)



local myButton = MPCreateButton(CatUISettingMelee, ADDON_NAME.."ButtonReset", MPLanguage.UI_Set_ResetDefaults, 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetMeleeSettings()
    MPInitMeleeSettings()
end)


-- 添加提示内容区域
local TipText = CatUISettingMelee:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingMelee, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏指令 - 无，纯视觉效果")



-- 配置文件版本号
local MeleeSettingsUIVersion = 5



function MPResetMeleeSettings()

    MPMeleeSaved.Version = MeleeSettingsUIVersion

    MPMeleeSaved.Distance = 1
    MPMeleeSaved.Hatred = 1
    MPMeleeSaved.Lock = 0

    MPMeleeSaved.Scale = 0.5
    MPMeleeSaved.Alpha = 0.5

    -- 无目标时图标
    MPMeleeSaved.EmpytTexture = "Interface\\Icons\\Spell_Shadow_Teleport"

    -- 在目标背后
    MPMeleeSaved.BackTexture = "Interface\\Icons\\spell_cloaked_in_shadows_2"

    -- 在目标前面
    MPMeleeSaved.FrontTexture = "Interface\\Icons\\Ability_Parry"

end

function MPInitMeleeSettings()

    if not MPMeleeSaved then
        MPMeleeSaved = {}
        MPResetMeleeSettings()
    end

    if MPMeleeSaved.Version ~= MeleeSettingsUIVersion then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."重置[近战指示器]当前配置，这是新版插件正常数据更新！|r")
        MPResetMeleeSettings()
    end

    checkButton_Distance:SetChecked(MPToBoolean(MPMeleeSaved.Distance))
    checkButton_Hatred:SetChecked(MPToBoolean(MPMeleeSaved.Hatred))
    checkButton_Lock:SetChecked(MPToBoolean(MPMeleeSaved.Lock))
    slider_WindowSize:SetValue(MPMeleeSaved.Scale)
    slider_Alpha:SetValue(MPMeleeSaved.Alpha)
end

