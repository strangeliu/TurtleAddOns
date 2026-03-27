
-- 定义插件名称
local ADDON_NAME = "Settings-AutoLoot"


-- 创建主框架
CatUISettingAutoLoot = MPCreateFrame(ADDON_NAME.."Frame", 520, 180, "|cFFDD4080通用 - 自动拾取|r")


local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingAutoLoot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingAutoLoot, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")


local postion_y = postion_y-50

-- 创建单选框 - 自动拾取

local checkButton_AutoLoot = nil

if MP_Interact then
    checkButton_AutoLoot = MPCreateCheckButton(CatUISettingAutoLoot, ADDON_NAME.."CheckButton", 20, postion_y, "启用 自动拾取、采集、交互 (依赖Interact模组)")
else
    checkButton_AutoLoot = MPCreateCheckButton(CatUISettingAutoLoot, ADDON_NAME.."CheckButton", 20, postion_y, "启用 自动拾取、采集、交互 (|cFFFF2020需Interact模组|r)")
end
checkButton_AutoLoot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPPublicSaved.AutoLoot = 1
        if not MP_Interact then
            -- 开启提示
            DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."未加载Interact模组，自动拾取功能无效。|r")
        end
    else
        MPPublicSaved.AutoLoot = 0
    end
end)

postion_y = postion_y-20

-- 添加文字标签
local checkText_Help = CatUISettingAutoLoot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Help:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
checkText_Help:SetTextColor(1, 1, 1)
checkText_Help:SetPoint("TOPLEFT", CatUISettingAutoLoot, "TOPLEFT", 20, postion_y)
checkText_Help:SetText("|cFFDD4080说明：|r测试期间，仅对近战DPS宏生效，如：猫德、狂暴战士等。")


local myButton = MPCreateButton(CatUISettingAutoLoot, ADDON_NAME.."ButtonReset", "恢复默认值", 120, -44, 100, 22)
myButton:SetScript("OnClick", function()
    MPResetAutoLootSettings()
    MPInitAutoLootSettings()
end)


-- 添加提示内容区域
local TipText = CatUISettingAutoLoot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingAutoLoot, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ 独立使用 |cFFDD4080/catpick|r ]")



-- 配置文件版本号
local AutoLootSettingsUIVersion = 2


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

function MPResetAutoLootSettings()
    MPPublicSaved.AutoLoot = 1
end

function MPInitAutoLootSettings()

    if not MPPublicSaved.AutoLoot then
        MPPublicSaved.AutoLoot = 0
    end
    checkButton_AutoLoot:SetChecked(ToBoolean(MPPublicSaved.AutoLoot))

end

