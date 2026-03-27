local module = ShaguTweaks:register({
    title = "经验条增强",
    description = "[actionbar-improved-expbar]\n改进了鼠标悬停时的经验条信息。在休息时显示休息百分比，并在完全休息时更改颜色。",
    expansions = { ["vanilla"] = true, ["tbc"] = nil },
    category = "常规",
    enabled = true,
})

module.enable = function(self)
    local expFrame = CreateFrame("Frame", "ShaguTweaks_ExpFrame", UIParent)
    expFrame:SetFrameStrata("HIGH")

    local font, size, outline = "Fonts\\frizqt__.TTF", 12, "OUTLINE"

    expFrame.expstring = expFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
    expFrame.expstring:SetFont(font, size, outline)
    expFrame.expstring:ClearAllPoints()
    expFrame.expstring:SetPoint("CENTER", MainMenuExpBar, "CENTER", 150, 1)
    expFrame.expstring:SetJustifyH("CENTER")
    expFrame.expstring:SetTextColor(1,1,1,1)

    expFrame.repstring = expFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
    expFrame.repstring:SetFont(font, size, outline)
    expFrame.repstring:ClearAllPoints()
    expFrame.repstring:SetPoint("CENTER", ReputationWatchBar, "CENTER", 0, 12)
    expFrame.repstring:SetJustifyH("CENTER")
    expFrame.repstring:SetTextColor(1,1,1)

    local isMousing = nil

    local function updateExp(mouseover)
        local playerlevel = UnitLevel("player")
        local xp, xpmax = UnitXP("player"), UnitXPMax("player")
        xpmax = xpmax or 1
        local exh_num = GetXPExhaustion() or 0

        local xp_perc = ShaguTweaks.round((xp / xpmax) * 100)
        local exh_perc = ShaguTweaks.round((exh_num / xpmax) * 100)
        local remaining = xpmax - xp
        local remaining_perc = ShaguTweaks.round((remaining / xpmax) * 100)

        local exh_str = ShaguTweaks.Abbreviate(exh_num, 1)
        local remaining_str = ShaguTweaks.Abbreviate(remaining, 1)

        if playerlevel < 60 then
            if not mouseover then
				if exh_num > 0 then
					expFrame.expstring:SetText(exh_str .. " (" .. exh_perc .. "%) 精力充沛")
				else
					expFrame.expstring:SetText("")
				end
            else
                if exh_num == 0 then
                    expFrame.expstring:SetText("等级 " .. playerlevel .. " - " .. remaining_str .. " (" .. remaining_perc .. "%) 剩余")
                else
                    expFrame.expstring:SetText("等级 " .. playerlevel .. " - " .. remaining_str .. " (" .. remaining_perc .. "%) 剩余 - " .. exh_str .. " (" .. exh_perc .. "%) 精力充沛")
                end
            end
        else
            expFrame.expstring:SetText("")
        end

        local rested = GetRestState()
        if rested == 1 then
            if exh_perc >= 150 then
                MainMenuExpBar:SetStatusBarColor(0, 1, 0.6, 1)
            else
                MainMenuExpBar:SetStatusBarColor(0.0, 0.39, 0.88, 1.0)
            end
        elseif rested == 2 then
            MainMenuExpBar:SetStatusBarColor(0.58, 0.0, 0.55, 1.0)
        else
            MainMenuExpBar:SetStatusBarColor(0.0, 0.39, 0.88, 1.0)
        end
    end

    local function updateRep()
        local name, standing, min, max, value = GetWatchedFactionInfo()
        if not name then
            expFrame.repstring:SetText("")
            return
        end

        local range = (max or 0) - (min or 0)
        if range <= 0 then
            expFrame.repstring:SetText("")
            return
        end

        local val = (value or 0) - (min or 0)
        local remaining = range - val
        local percent = (val / range) * 100
        local percentFloor = math.floor(percent + 0.5)
        local repvalues = { "Hated", "Hostile", "Unfriendly", "Neutral", "Friendly", "Honored", "Revered", "Exalted" }

        local remaining_str = ShaguTweaks.Abbreviate(remaining, 1)

        expFrame.repstring:SetText(name .. " (" .. (repvalues[standing] or standing) .. ") " .. percentFloor .. "% - " .. remaining_str .. " 剩余")
    end

    local function expShow()
        isMousing = true
        updateExp(isMousing)
        expFrame.expstring:Show()
    end

    local function expHide()
        isMousing = nil
        if not IsResting() then
            expFrame.expstring:Hide()
        else
            updateExp(isMousing)
        end
    end

    local function mouseoverExp()
        if MainMenuExpBar then
            local expMouse = CreateFrame("Frame", nil, MainMenuExpBar)
            expMouse:SetAllPoints(MainMenuExpBar)
            expMouse:SetFrameStrata("MEDIUM")
            expMouse:EnableMouse(true)
            expMouse:SetScript("OnEnter", expShow)
            expMouse:SetScript("OnLeave", expHide)
        end
    end

    local function repShow()
        isMousing = true
        updateRep()
        expFrame.repstring:Show()
    end

    local function repHide()
        isMousing = nil
        expFrame.repstring:Hide()
    end

    local function mouseoverRep()
        if ReputationWatchBar then
            local repMouse = CreateFrame("Frame", nil, ReputationWatchBar)
            repMouse:SetAllPoints(ReputationWatchBar)
            repMouse:SetFrameStrata("MEDIUM")
            repMouse:EnableMouse(true)
            repMouse:SetScript("OnEnter", repShow)
            repMouse:SetScript("OnLeave", repHide)
        end
    end

    local function updateResting()
        if IsResting() then
            updateExp(isMousing)
            expFrame.expstring:Show()
        else
            expHide()
        end
    end

    local events = CreateFrame("Frame", nil, UIParent)
    events:RegisterEvent("PLAYER_ENTERING_WORLD")
    events:RegisterEvent("PLAYER_UPDATE_RESTING")
    events:RegisterEvent("UPDATE_EXHAUSTION")
    events:RegisterEvent("PLAYER_XP_UPDATE")
    events:RegisterEvent("UPDATE_FACTION")

    events:SetScript("OnEvent", function(self, event, ...)
        if event == "PLAYER_ENTERING_WORLD" then
            if not self.loaded then
                self.loaded = true
                mouseoverExp()
                mouseoverRep()
                updateExp(isMousing)
                updateRep()
                expHide()
                repHide()
            end
        elseif event == "PLAYER_UPDATE_RESTING" then
            updateResting()
        elseif event == "UPDATE_FACTION" then
            updateRep()
        else
            updateExp(isMousing)
        end
    end)
end
