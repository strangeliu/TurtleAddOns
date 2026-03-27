local _G = getfenv(0)

-- Check if using incompatible FocusFrame version
local version = string.gsub(GetAddOnMetadata("FocusFrame", "version"), "%W", "")
if tonumber(version) <= 122 then
    return DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000TargetCastbar requires FocusFrame v1.2.3+ to work.|r")
end

local Focus = assert(_G.FocusCore, "FocusCore not loaded.")

if not FocusCastbarShow then
    FocusCastbarShow = true
end
if not TargetCastbarShow then
    TargetCastbarShow = true
end

-- If you want to disable this module's nameplate castbars, type in chat " /run TargetCastbarShow = false "

if not SetAutoloot then
    local function CastingBarOnUpdate()
        local castbar = _G.Target_CastingBar
        if not UnitExists("target") then return end
        local cast, value, maxValue, sparkPosition, timer = Focus:GetCast(UnitName("target"))
        if cast then
            castbar:SetMinMaxValues(0, maxValue)
            castbar:SetValue(value)
            castbar.spark:SetPoint("CENTER", castbar, "LEFT", sparkPosition * castbar:GetWidth(), 0)
            castbar.timer:SetText(timer) -- (string.format("%0.1f",timer))

            if cast.immune then
                castbar.shield:Show()
            else
                castbar.shield:Hide()
            end

            if not castbar:IsVisible() or castbar.text:GetText() ~= cast.spell then
                castbar.text:SetText(cast.spell)
                castbar.icon:SetTexture(cast.icon)
                castbar:SetAlpha(castbar:GetAlpha())
                castbar:Show()
            end
        else
            castbar:Hide()
        end
    end

    local shouldRegister = true
    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_TARGET_CHANGED")
    f:SetScript("OnEvent", function()
        -- Ensure OnUpdate is only registered once when we have a target
        if TargetFrame:IsVisible() then
            if shouldRegister then
                f:SetScript("OnUpdate", CastingBarOnUpdate)
                shouldRegister = false
            end
        else
            f:SetScript("OnUpdate", nil)
            shouldRegister = true
        end
    end)
else
    TargetCastBar_SpellEvents = {}

    local shouldRegister = true
    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_TARGET_CHANGED")
    f:RegisterEvent("UNIT_CASTEVENT")
    f:SetScript("OnEvent", function()
        -- Ensure OnUpdate is only registered once when we have a target
        if event == "PLAYER_TARGET_CHANGED" then
            if TargetFrame:IsVisible() or FocusFrame:IsVisible() then
                if shouldRegister then
                    f:SetScript("OnUpdate", function()
                        CastBar_SpellCastsUpdate()
                        if TargetFrame:IsVisible() then
                            TargetCastBar_Update()
                        end
                        
                        if FocusFrame:IsVisible() then
                            FocusCastBar_Update()
                        end
                    end)
                    shouldRegister = false
                end
            else
                f:SetScript("OnUpdate", nil)
                shouldRegister = true
            end
        elseif event == "UNIT_CASTEVENT" then
            --		if UnitIsUnit(arg1, "player") then return end
            if arg3 == "MAINHAND" or arg3 == "OFFHAND" then
                return
            end
            if arg3 == "CAST" then
                local currentCastInfo = TargetCastBar_SpellEvents[arg1]
                if not currentCastInfo or arg4 ~= currentCastInfo.spell then
                    return
                end
            end
            arg5 = arg5 / 1000
            TargetCastBar_SpellEvents[arg1] = nil
            TargetCastBar_SpellEvents[arg1] = { target = arg2, spell = arg4, event = arg3, timer = arg5, start = GetTime() }
        end
    end)


    function CastBar_SpellCastsUpdate()
        for unit, castinfo in pairs(TargetCastBar_SpellEvents) do
            if castinfo.start + castinfo.timer + 1.5 < GetTime() then
                TargetCastBar_SpellEvents[unit] = nil
            elseif (castinfo.event == "CAST" or castinfo.event == "FAIL") and castinfo.start + castinfo.timer + 1 < GetTime() then
                TargetCastBar_SpellEvents[unit] = nil
            end
        end
    end

    -- 通用的施法条更新函数
    function UpdateCastBar(castbar, unitCastInfo, CastbarShow, isDead)
        if not unitCastInfo or not CastbarShow or isDead then
            castbar:Hide()
            return
        end

        castbar:SetMinMaxValues(unitCastInfo.start, unitCastInfo.start + unitCastInfo.timer)
        castbar:SetValue(GetTime())

        local sparkPosition = min(max((GetTime() - unitCastInfo.start) / unitCastInfo.timer * castbar:GetWidth(), 0),
            castbar:GetWidth())
        castbar.spark:SetPoint("CENTER", castbar, "LEFT", sparkPosition, 0)

        local spellname, _, spellicon = SpellInfo(unitCastInfo.spell)
        spellname = spellname or "UNKNOWN SPELL"
        spellicon = spellicon or "Interface\\Icons\\INV_Misc_QuestionMark"

        castbar.text:SetText(spellname)
        castbar.icon:SetTexture(spellicon)

        castbar:SetAlpha(1 - (GetTime() - unitCastInfo.start - unitCastInfo.timer))

        if unitCastInfo.event == "START" then   -- 开始读条
            castbar:SetStatusBarColor(1.0, 0.7, 0.0)
            castbar.timer:SetText(string.format("%0.1f", math.max((GetTime() - unitCastInfo.start), 0)) .. "/" .. string.format("%0.1f", unitCastInfo.timer))
        elseif unitCastInfo.event == "CAST" then    -- 结束读条
            castbar:SetStatusBarColor(0.0, 1.0, 0.0)
            castbar:SetMinMaxValues(unitCastInfo.start - 1, unitCastInfo.start)
        elseif unitCastInfo.event == "FAIL" then    -- 被打断
            castbar:SetStatusBarColor(1.0, 0.0, 0.0)
            castbar.text:SetText("已中断")
            castbar:SetMinMaxValues(unitCastInfo.start - 1, unitCastInfo.start)
        elseif unitCastInfo.event == "CHANNEL" then     -- 引导
            castbar:SetStatusBarColor(0.5, 0.7, 1.0)
            castbar:SetMinMaxValues(unitCastInfo.start, unitCastInfo.start + unitCastInfo.timer)
            castbar:SetValue(unitCastInfo.start + unitCastInfo.timer - GetTime() + unitCastInfo.start)
            castbar:SetAlpha(1 + unitCastInfo.start + unitCastInfo.timer - GetTime())

            castbar.spark:SetPoint("CENTER", castbar, "RIGHT", sparkPosition * (-1), 0)
        end
        castbar:Show()
    end
    
    
    -- 目标施法条更新
    function TargetCastBar_Update()
        local castbar = _G.Target_CastingBar
        local _, unitGUID = UnitExists("target")
        if unitGUID then
            local isDead = UnitIsDead(unitGUID)
            local unitCastInfo = TargetCastBar_SpellEvents[unitGUID]
            UpdateCastBar(castbar, unitCastInfo, TargetCastbarShow, isDead)
        end
    end

    -- 焦点施法条更新
    function FocusCastBar_Update()
        local Focuscastbar = _G.Focus_CastingBar
        local unitGUID = Focus:GetName()
        local focusIsDead = Focus:IsDead()
        local unitCastInfo = TargetCastBar_SpellEvents[unitGUID]
        UpdateCastBar(Focuscastbar, unitCastInfo, FocusCastbarShow, focusIsDead)
    end
end
