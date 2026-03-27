-- 创建施法条的通用函数
local function CreateCastBar(parent, barName, barWidth, barHeight, barPoint, barRelativePoint, barX, barY)
    local bar = CreateFrame("StatusBar", barName, parent)
    bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    bar:SetStatusBarColor(0.4, 1, 0)
    bar:SetHeight(barHeight)
    bar:SetWidth(barWidth)
    bar:SetPoint(barPoint, parent, barRelativePoint, barX, barY)
    bar:SetValue(0)
    bar:Hide()

    -- 创建火花
    bar.spark = bar:CreateTexture(nil, "OVERLAY")
    bar.spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
    bar.spark:SetHeight(26)
    bar.spark:SetWidth(26)
    bar.spark:SetBlendMode("ADD")

    -- 创建边框
    bar.border = bar:CreateTexture(nil, "OVERLAY")
    bar.border:SetPoint("TOPLEFT", -23, 20)
    bar.border:SetPoint("TOPRIGHT", 23, 20)
    bar.border:SetHeight(50)
    bar.border:SetTexture("Interface\\AddOns\\FocusFrame\\Media\\UI-CastingBar-Border-Small.blp")

    -- 创建文本
    bar.text = bar:CreateFontString(nil, "OVERLAY")
    bar.text:SetTextColor(1, 1, 1)
    bar.text:SetFont(STANDARD_TEXT_FONT, 10, 'OUTLINE')
    bar.text:SetShadowColor(0, 0, 0)
    bar.text:SetPoint("CENTER", bar, 0, 2)
    bar.text:SetText("Drain Life")

    -- 创建计时器文本
    bar.timer = bar:CreateFontString(nil, "OVERLAY")
    bar.timer:SetTextColor(1, 1, 1)
    bar.timer:SetFont(STANDARD_TEXT_FONT, 10, 'OUTLINE')
    bar.timer:SetShadowColor(0, 0, 0)
    bar.timer:SetPoint("LEFT", bar, "RIGHT", 3, 0)
    bar.timer:SetText("2.0")

    -- 创建图标
    bar.icon = bar:CreateTexture(nil, "OVERLAY")
    bar.icon:SetWidth(20)
    bar.icon:SetHeight(20)
    bar.icon:SetPoint("LEFT", bar, -23, 1)
    bar.icon:SetTexture("Interface\\Icons\\Spell_shadow_lifedrain02")

    -- 创建护盾
    bar.shield = bar:CreateTexture(nil, "OVERLAY")
    bar.shield:SetPoint("TOPLEFT", -28, 20)
    bar.shield:SetPoint("TOPRIGHT", 18, 20)
    bar.shield:SetHeight(50)
    bar.shield:SetTexture("Interface\\AddOns\\FocusFrame\\Media\\UI-CastingBar-Small-Shield.blp")
    bar.shield:Hide()

    -- 添加移动功能
    bar:SetMovable(true)
    bar:EnableMouse(true)
    bar:RegisterForDrag("LeftButton")

    bar:SetScript("OnDragStart", function()
        if IsShiftKeyDown() and arg1=="LeftButton" then
            this:StartMoving()
        end
    end)

    bar:SetScript("OnDragStop", function()
        this:StopMovingOrSizing()
    end)

    return bar
end

-- 创建目标施法条
local castbar = CreateCastBar(TargetFrame, "Target_CastingBar", 151, 13, "BOTTOMLEFT", "BOTTOMLEFT", 15, -60)

-- 创建焦点施法条
local Focuscastbar = CreateCastBar(FocusFrame, "Focus_CastingBar", 151, 13, "BOTTOMLEFT", "BOTTOMLEFT", 15, -60)

if FocusFrameDB.strictAuras then
    DEFAULT_CHAT_FRAME:AddMessage("Warn: TargetCastbar doesn't work with strict auras enabled.")
end
