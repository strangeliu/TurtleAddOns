
-- 定义插件名称
local ADDON_NAME = "CatUI-Melee"



-- 近战指示器 窗口大小
local MELEE_WIDTH = 80
local MELEE_HEIGHT = 80




CatUIMelee = CreateFrame("Frame", ADDON_NAME.."Frame", UIParent)
CatUIMelee:Hide()

-- 设置窗口基本属性
CatUIMelee:SetWidth(MELEE_WIDTH)
CatUIMelee:SetHeight(MELEE_HEIGHT)
CatUIMelee:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
CatUIMelee:SetFrameLevel(1)
CatUIMelee:SetBackdropBorderColor(0.5, 0.5, 0.5, 0.1)
CatUIMelee:SetBackdropColor(0.1, 0.1, 0.2, 0.1)
CatUIMelee:SetScale(0.5)

-- 使窗口可移动
CatUIMelee:EnableMouse(true)
CatUIMelee:SetMovable(true)
CatUIMelee:RegisterForDrag("LeftButton")
CatUIMelee:SetScript("OnDragStart", function()
    CatUIMelee:StartMoving()
end)
CatUIMelee:SetScript("OnDragStop", function()
    CatUIMelee:StopMovingOrSizing()
end)


-- 添加标准关闭按钮（精确对齐标题行）
local closeButton = CreateFrame("Button", nil, CatUIMelee, "UIPanelCloseButton")
closeButton:SetWidth(32)
closeButton:SetHeight(32)
closeButton:SetPoint("TOPRIGHT", CatUIMelee, "TOPRIGHT", 2, 2)  -- Y坐标调整为-10，与标题完全对齐
-- 设置点击事件
closeButton:SetScript("OnClick", function(self)
    CatUIMelee:Hide()
    MPPublicSaved.MeleeWindowDisplay = 0
end)



-- 创建纹理（图片）
local texture = CatUIMelee:CreateTexture(nil, "BACKGROUND")
texture:SetTexture("Interface\\Icons\\Spell_Nature_WispSplode") -- 图片路径
texture:SetAllPoints() -- 铺满整个父Frame
texture:SetAlpha(1.0) 

local TipText = CatUIMelee:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUIMelee, "BOTTOM", 0, -34)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1.0, 1.0, 1.0)
TipText:SetJustifyH("CENTER")
TipText:SetText("")


-- 攻击条
local progressBar = CreateFrame("StatusBar", nil, CatUIMelee)
progressBar:SetPoint("BOTTOM", CatUIMelee, "BOTTOM", 0, -8)
progressBar:SetWidth(78)
progressBar:SetHeight(3)
progressBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8X8")
progressBar:SetStatusBarColor(1, 1, 1, 1)

progressBar:SetMinMaxValues(0, 100)
progressBar:SetValue(100)
progressBar:Hide()


local inMeleeRange = 0

function MPCatUIMeleeRun()

    if not CatUIMelee:IsVisible() then
        return
    end

    if not MP_UnitXP then
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor..MPLanguage.UI_NoUnitXPMelee)
        CatUIMelee:Hide()
        MPPublicSaved.MeleeWindowDisplay = 0
    end

    if UnitExists("target") and UnitCanAttack("player", "target") then
        if UnitName("player") == UnitName("target") then
            CatUIMelee:SetAlpha(0.2) 
            texture:SetTexture("Interface\\Icons\\Spell_ChargePositive")
            TipText:SetText("")
            progressBar:Hide()
        else
            inMeleeRange = UnitXP("distanceBetween", "player", "target", "meleeAutoAttack")
            if inMeleeRange then
                if inMeleeRange>0 then
                    TipText:SetText("|cFFFF0000"..MPLanguage.UI_Melee_Distance..string.format("%.1f",inMeleeRange))
                    CatUIMelee:SetAlpha(0.5) 
                else
                    if inMeleeRange>0 then
                        TipText:SetText("|cFFFF0000"..MPLanguage.UI_Melee_Distance..string.format("%.1f",inMeleeRange))
                        CatUIMelee:SetAlpha(0.5) 
                    else
                        TipText:SetText("|cFFAAFFAA"..MPLanguage.UI_Melee_Armor..string.format("%.0f",UnitArmor("target")))
                        CatUIMelee:SetAlpha(1.0) 
                    end
                end
            else
                CatUIMelee:SetAlpha(0.2) 
                TipText:SetText("")
            end

            local pb = MPGetMainHandTime()/UnitAttackSpeed("player")*100
            progressBar:SetValue(pb)
            if pb >= 100 then
                progressBar:Hide()
            else
                progressBar:Show()
            end

            if MPCheckBehind(1) then
                -- 正面
                texture:SetTexture("Interface\\Icons\\spell_cloaked_in_shadows_2") -- 图片路径
            else
                texture:SetTexture("Interface\\Icons\\Ability_Parry") -- 图片路径
            end
        end
    else
        CatUIMelee:SetAlpha(0.2) 
        texture:SetTexture("Interface\\Icons\\Spell_Shadow_Teleport")
        TipText:SetText("")
        progressBar:Hide()
    end


end



