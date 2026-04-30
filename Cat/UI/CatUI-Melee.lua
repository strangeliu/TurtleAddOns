
-- 定义插件名称
local ADDON_NAME = "CatUI-Melee"



-- 近战指示器 窗口大小
local MELEE_WIDTH = 100
local MELEE_HEIGHT = 100




CatUIMelee = CreateFrame("Frame", ADDON_NAME.."Frame", UIParent)
CatUIMelee:Hide()

-- 设置窗口基本属性
CatUIMelee:SetWidth(MELEE_WIDTH)
CatUIMelee:SetHeight(MELEE_HEIGHT)
CatUIMelee:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
CatUIMelee:SetFrameLevel(1)
CatUIMelee:SetBackdropBorderColor(0.5, 0.5, 0.5, 0.1)
CatUIMelee:SetBackdropColor(0.1, 0.1, 0.2, 0.1)
if not MPMeleeSaved then
    CatUIMelee:SetScale(0.5)
else
    CatUIMelee:SetScale(MPMeleeSaved.Scale)
end

-- 使窗口可移动
CatUIMelee:EnableMouse(true)
CatUIMelee:SetMovable(true)
CatUIMelee:RegisterForDrag("LeftButton")
CatUIMelee:SetScript("OnDragStart", function()
    if MPMeleeSaved.Lock==0 then
        CatUIMelee:StartMoving()
    end
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

local ArmorText = CatUIMelee:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
ArmorText:SetPoint("BOTTOM", CatUIMelee, "BOTTOM", 0, -36)
ArmorText:SetWidth(250)
ArmorText:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE") -- 使用OUTLINE参数
ArmorText:SetTextColor(1.0, 1.0, 1.0)
ArmorText:SetJustifyH("CENTER")
ArmorText:SetText("")

local TWTText = CatUIMelee:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TWTText:SetPoint("BOTTOM", CatUIMelee, "BOTTOM", 0, 105)
TWTText:SetWidth(250)
TWTText:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE") -- 使用OUTLINE参数
TWTText:SetTextColor(1.0, 1.0, 1.0)
TWTText:SetJustifyH("CENTER")
TWTText:SetText("")


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
            CatUIMelee:SetAlpha(0.2+(MPMeleeSaved.Alpha/2)) 
            texture:SetTexture(MPMeleeSaved.EmpytTexture)
            ArmorText:SetText("")
            TWTText:SetText("")
            progressBar:Hide()
        else
            inMeleeRange = UnitXP("distanceBetween", "player", "target", "meleeAutoAttack")
            if inMeleeRange then
                if inMeleeRange>0 then
                    if MPMeleeSaved.Distance==1 then ArmorText:SetText("|cFFFF0000"..MPLanguage.UI_Melee_Distance..string.format("%.1f",inMeleeRange)) end
                    CatUIMelee:SetAlpha(0.5+(MPMeleeSaved.Alpha/2)) 
                else
                    if inMeleeRange>0 then
                        if MPMeleeSaved.Distance==1 then ArmorText:SetText("|cFFFF0000"..MPLanguage.UI_Melee_Distance..string.format("%.1f",inMeleeRange)) end
                        CatUIMelee:SetAlpha(0.5+(MPMeleeSaved.Alpha/2)) 
                    else
                        if MPMeleeSaved.Distance==1 then ArmorText:SetText("|cFFAAFFAA"..MPLanguage.UI_Melee_Armor..string.format("%.0f",UnitArmor("target"))) end
                        CatUIMelee:SetAlpha(1.0) 
                    end
                end
            else
                CatUIMelee:SetAlpha(0.2+(MPMeleeSaved.Alpha/2)) 
                ArmorText:SetText("")
            end

            local pb = MPGetMainHandTime()/UnitAttackSpeed("player")*100
            progressBar:SetValue(pb)
            if pb >= 100 then
                progressBar:Hide()
            else
                progressBar:Show()
            end

            if MPCheckBehind(1) then
                -- 背对敌人
                texture:SetTexture(MPMeleeSaved.BackTexture) -- 图片路径
            else
                -- 面朝敌人
                texture:SetTexture(MPMeleeSaved.FrontTexture) -- 图片路径
            end

            if MPInCombat and MPMeleeSaved.Hatred==1 then
                local TWT = MPGetHatredFromTWT()
                if TWT>80 then
                    TWTText:SetText("|cFFFF0000仇恨 "..TWT)
                elseif TWT>60 then
                    TWTText:SetText("|cFFFF7D0A仇恨 "..TWT)
                elseif TWT>0 then
                    TWTText:SetText("|cFFABD473仇恨 "..TWT)
                else
                    TWTText:SetText("")
                end
            else
                TWTText:SetText("")
            end
        end
    else
        CatUIMelee:SetAlpha(0.2+(MPMeleeSaved.Alpha/2)) 
        texture:SetTexture(MPMeleeSaved.EmpytTexture)
        ArmorText:SetText("")
        progressBar:Hide()
    end


end



