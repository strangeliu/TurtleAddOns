local L = AceLibrary("AceLocale-2.2"):new("SilverDragon")
local ZAOMAODG = {}

ZAOMAODG.scanRadius = (SilverDragon_RaresData and SilverDragon_RaresData.scan_radius) or 12
ZAOMAODG.tempTargetLookup = {}

if not Screenshotoi then Screenshotoi=0 end

ZAOMAODG.globalTimeElapsed = 0
ZAOMAODG.lastUpdateTime = 0
ZAOMAODG.isActive = true
ZAOMAODG.forceTarget = true
ZAOMAODG.SFX_ALIVE = "Interface\\AddOns\\SilverDragon\\Music\\Item.mp3"
ZAOMAODG.pendingRestart = false

ZAOMAODG.deadTargetCounts = {}
ZAOMAODG.deadTargetMaxAlerts = 3
ZAOMAODG.deadTargetExcludeList = {}
ZAOMAODG.deadTargetExcludeTime = 1800
ZAOMAODG.forceTargetedRareWindow = 600
ZAOMAODG.forceTargetedRares = {}
ZAOMAODG.recentRareName = nil
ZAOMAODG.manualSelectedRareName = nil
ZAOMAODG.statusMessageText = nil
ZAOMAODG.statusMessageColor = nil
ZAOMAODG.statusMessageTimer = nil

ZAOMAODG.cityZones = L["City zones"] or {}
ZAOMAODG.battlegroundZones = L["Battleground zones"] or {}

local function GetRadarToggleText()
    if ZAOMAODG.isActive then
        return L["Radar enabled button text"]
    end
    return L["Radar disabled button text"]
end

local function GetForceTargetButtonText()
    if ZAOMAODG.forceTarget then
        return L["Force target enabled button text"]
    end
    return L["Force target disabled button text"]
end

local function CleanupForceTargetedRares()
    local currentTime = time()

    for name, expireTime in pairs(ZAOMAODG.forceTargetedRares) do
        if currentTime >= expireTime then
            ZAOMAODG.forceTargetedRares[name] = nil
        end
    end
end

local function GetRadarStatusText()
    if ZAOMAODG.pendingRestart then
        return L["Radar status pending combat"]
    end

    if ZAOMAODG.autoRestartTimer and not ZAOMAODG.isActive then
        return L["Radar status restarting"]
    end

    if ZAOMAODG.isInCityOrBattleground() then
        return L["Radar status city"]
    end

    if UnitAffectingCombat("player") then
        return L["Radar status combat"]
    end

    if ZAOMAODG.isActive then
        return L["Radar status active"]
    end

    return L["Radar status paused"]
end

local function GetRadarStatusColor()
    if ZAOMAODG.pendingRestart then
        return 1, 0.82, 0.2
    end

    if ZAOMAODG.autoRestartTimer and not ZAOMAODG.isActive then
        return 1, 0.82, 0.2
    end

    if ZAOMAODG.isInCityOrBattleground() then
        return 0.72, 0.72, 0.72
    end

    if UnitAffectingCombat("player") then
        return 1, 0.55, 0.25
    end

    if ZAOMAODG.isActive then
        return 0.4, 1, 0.4
    end

    return 0.82, 0.82, 0.82
end

function ZAOMAODG:UpdateToggleButtonText()
    if ZAOMAODG.toggleButton then
        ZAOMAODG.toggleButton:SetText(GetRadarToggleText())
    end
    if ZAOMAODG.forceButton then
        ZAOMAODG.forceButton:SetText(GetForceTargetButtonText())
    end
    if ZAOMAODG.statusText then
        local r, g, b
        local statusText

        if ZAOMAODG.statusMessageText then
            statusText = ZAOMAODG.statusMessageText
            if ZAOMAODG.statusMessageColor then
                r = ZAOMAODG.statusMessageColor[1]
                g = ZAOMAODG.statusMessageColor[2]
                b = ZAOMAODG.statusMessageColor[3]
            else
                r, g, b = 0.82, 0.82, 0.82
            end
        else
            r, g, b = GetRadarStatusColor()
            statusText = GetRadarStatusText()
        end

        ZAOMAODG.statusText:SetText(statusText)
        ZAOMAODG.statusText:SetTextColor(r, g, b)
    end
    if ZAOMAODG.UpdateSelectButtonState then
        ZAOMAODG:UpdateSelectButtonState()
    end
end

function ZAOMAODG:ShowStatusMessage(message, r, g, b, duration)
    if ZAOMAODG.statusMessageTimer then
        ZAOMAODG.statusMessageTimer:Cancel()
        ZAOMAODG.statusMessageTimer = nil
    end

    ZAOMAODG.statusMessageText = message
    ZAOMAODG.statusMessageColor = { r or 0.82, g or 0.82, b or 0.82 }
    ZAOMAODG:UpdateToggleButtonText()

    duration = duration or 2
    ZAOMAODG.statusMessageTimer = C_Timer.NewTimer(duration, function()
        ZAOMAODG.statusMessageText = nil
        ZAOMAODG.statusMessageColor = nil
        ZAOMAODG.statusMessageTimer = nil
        ZAOMAODG:UpdateToggleButtonText()
    end)
end

function ZAOMAODG:HasRecentRare(name)
    if not ZAOMAODG.recentRareName or ZAOMAODG.recentRareName == "" then
        return false
    end

    if name and ZAOMAODG.recentRareName ~= name then
        return false
    end

    return true
end

function ZAOMAODG:RememberRecentRare(name)
    if not name or name == "" then
        return
    end

    ZAOMAODG.recentRareName = name
    ZAOMAODG:UpdateSelectButtonState()
end

function ZAOMAODG:ClearRecentRare(name)
    if name and ZAOMAODG.recentRareName and ZAOMAODG.recentRareName ~= name then
        return
    end

    ZAOMAODG.recentRareName = nil
    ZAOMAODG:UpdateSelectButtonState()
end

function ZAOMAODG:CanAutoTargetRare(name)
    CleanupForceTargetedRares()

    if not ZAOMAODG.forceTarget then
        return false
    end

    return not ZAOMAODG.forceTargetedRares[name]
end

function ZAOMAODG:MarkAutoTargetRare(name)
    if not name or name == "" then
        return
    end

    ZAOMAODG.forceTargetedRares[name] = time() + ZAOMAODG.forceTargetedRareWindow
end

function ZAOMAODG:ShouldSkipAutoTargetRare(name)
    CleanupForceTargetedRares()

    if not ZAOMAODG.forceTarget then
        return false
    end

    return ZAOMAODG.forceTargetedRares[name] and true or false
end

function ZAOMAODG:SetManualSelectedRare(name)
    if not name or name == "" then
        return
    end

    ZAOMAODG.manualSelectedRareName = name
end

function ZAOMAODG:ClearManualSelectedRare(name)
    if name and ZAOMAODG.manualSelectedRareName and ZAOMAODG.manualSelectedRareName ~= name then
        return
    end

    ZAOMAODG.manualSelectedRareName = nil
end

function ZAOMAODG:IsProtectedManualTarget(unit)
    local classification
    local name

    if not ZAOMAODG.manualSelectedRareName then
        return false
    end

    if not unit or not UnitExists(unit) or UnitIsPlayer(unit) then
        if unit == "target" then
            ZAOMAODG:ClearManualSelectedRare()
        end
        return false
    end

    name = UnitName(unit)
    if not name or name ~= ZAOMAODG.manualSelectedRareName then
        if unit == "target" then
            ZAOMAODG:ClearManualSelectedRare()
        end
        return false
    end

    classification = UnitClassification(unit)
    if classification == "rare" or classification == "rareelite" then
        return true
    end

    if ZAOMAODG:HasManagedRare(name) then
        return true
    end

    if unit == "target" then
        ZAOMAODG:ClearManualSelectedRare()
    end

    return false
end

function ZAOMAODG:UpdateSelectButtonState()
    local hasRecentRare

    if not ZAOMAODG.selectButton then
        return
    end

    hasRecentRare = ZAOMAODG:HasRecentRare()
    if ZAOMAODG.selectButtonActiveBackground then
        if hasRecentRare then
            ZAOMAODG.selectButtonActiveBackground:Show()
        else
            ZAOMAODG.selectButtonActiveBackground:Hide()
        end
    end
    if ZAOMAODG.selectButtonHighlight then
        if hasRecentRare then
            ZAOMAODG.selectButtonHighlight:Show()
        else
            ZAOMAODG.selectButtonHighlight:Hide()
        end
    end
end

function ZAOMAODG:SelectRecentRare()
    local targetName

    if not ZAOMAODG:HasRecentRare() then
        print(L["No nearby rare elite has been detected yet."])
        return
    end

    targetName = ZAOMAODG.recentRareName
    if ZAOMAODG.selectTargetByName(targetName, true) and UnitExists("target") and UnitName("target") == targetName then
        ZAOMAODG:SetManualSelectedRare(targetName)
        return
    end

    ZAOMAODG:ClearManualSelectedRare(targetName)
    ZAOMAODG:ClearRecentRare(targetName)
    print(L["No nearby rare elite has been detected yet."])
end

function ZAOMAODG.isInCityOrBattleground()
    local zoneName = GetRealZoneText() or GetZoneText() or ""
    local subZoneName = GetSubZoneText() or ""
    
    if zoneName == "" then
        return false
    end
    
    for _, city in ipairs(ZAOMAODG.cityZones) do
        if strfind(strlower(zoneName), strlower(city)) or strfind(strlower(subZoneName), strlower(city)) then
            return true
        end
    end
    
    for _, bg in ipairs(ZAOMAODG.battlegroundZones) do
        if strfind(strlower(zoneName), strlower(bg)) or strfind(strlower(subZoneName), strlower(bg)) then
            return true
        end
    end
    
    local playerInInstance, instanceType = IsInInstance()
    if playerInInstance and instanceType == "pvp" then
        return true
    end
    
    return false
end

-- Limit repeated alerts for the same target.
ZAOMAODG.alertCounts = {}
ZAOMAODG.maxAlerts = 3
ZAOMAODG.musicTimers = {}
ZAOMAODG.autoRestartTimer = nil

ZAOMAODG.alertFrame = CreateFrame("Frame", "ZAOMAODG_AlertFrame", UIParent)
ZAOMAODG.alertFrame:SetWidth(10)
ZAOMAODG.alertFrame:SetHeight(10)
ZAOMAODG.alertFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -10, -10)  
ZAOMAODG.alertFrame:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
    edgeSize = 1,
})
ZAOMAODG.alertFrame:SetBackdropColor(0, 1, 0, 1)
ZAOMAODG.alertFrame:SetBackdropBorderColor(0, 0, 0, 1)
ZAOMAODG.alertFrame:Hide()

function ZAOMAODG.toggleAlert(show)
    if show then
        ZAOMAODG.alertFrame:Show()
    else
        ZAOMAODG.alertFrame:Hide()
    end
end

-- Skip repeated dead-target alerts for a short window.
function ZAOMAODG:IsExcludedFromScan(name)
    if ZAOMAODG.deadTargetExcludeList[name] then
        local currentTime = time()
        if currentTime < ZAOMAODG.deadTargetExcludeList[name] then
            return true
        else
            ZAOMAODG.deadTargetExcludeList[name] = nil
            ZAOMAODG.deadTargetCounts[name] = nil
            return false
        end
    end
    return false
end

function ZAOMAODG:IsProtectedExcludedTarget(unit)
    local classification
    local name

    if not unit or not UnitExists(unit) or UnitIsPlayer(unit) then
        return false
    end

    name = UnitName(unit)
    if not name or not ZAOMAODG:IsExcludedFromScan(name) then
        return false
    end

    classification = UnitClassification(unit)
    if classification == "rare" or classification == "rareelite" then
        return true
    end

    if ZAOMAODG:HasManagedRare(name) then
        return true
    end

    return false
end

-- Add a temporary exclusion entry after repeated corpse detections.
function ZAOMAODG:AddToExcludeList(name)
    local currentTime = time()
    ZAOMAODG.deadTargetExcludeList[name] = currentTime + ZAOMAODG.deadTargetExcludeTime
    print(string.format(L["Target %s added to the temporary exclusion list for 30 minutes."], name))
end

function ZAOMAODG:CloseRadarTemporarily(reason)
    ZAOMAODG.isActive = false
    ZAOMAODG:UpdateToggleButtonText()
    print(string.format(L["Radar paused for 30 seconds: %s"], reason))
    PlayMusic("")
    ZAOMAODG.toggleAlert(false)
    ZAOMAODG.pendingRestart = false
    
    if ZAOMAODG.autoRestartTimer then
        ZAOMAODG.autoRestartTimer:Cancel()
    end
    ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(30, function()
        if not ZAOMAODG.isActive then
            if UnitAffectingCombat("player") then
                ZAOMAODG.pendingRestart = true
                print(L["Radar will restart after combat ends."])
                ZAOMAODG.autoRestartTimer = nil
                return
            end
            
            if not ZAOMAODG.isInCityOrBattleground() then
                ZAOMAODG.isActive = true
                ZAOMAODG.alertCounts = {}
                ZAOMAODG:UpdateToggleButtonText()
                print(L["Radar restarted automatically."])
                ZAOMAODG.globalTimeElapsed = 0
                ZAOMAODG.lastUpdateTime = GetTime()
                ZAOMAODG.selectFromList()
                Screenshotoi=0
            else
                ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(60, function()
                    ZAOMAODG:OnZoneChanged()
                end)
            end
            ZAOMAODG.autoRestartTimer = nil
        end
    end)
end

function ZAOMAODG.selectTargetByName(targetName, allowExcluded)
    if not allowExcluded and ZAOMAODG:IsExcludedFromScan(targetName) then
        return false
    end

    TargetByName(targetName, true)
    if allowExcluded and (not UnitExists("target") or UnitName("target") ~= targetName) then
        TargetByName(targetName)
    end
    
    if UnitExists("target") then
        local currentTargetName = UnitName("target")
        
        if currentTargetName ~= targetName then
            return false
        end
        
        if UnitIsPlayer("target") then
            ZAOMAODG:CloseRadarTemporarily(L["Target is a player."])
            return false
        end
        
        local isPet = false
        if UnitPlayerControlled("target") and not UnitIsPlayer("target") then
            isPet = true
        end
        
        if isPet then
            ClearTarget()
            return false
        end
        
        return true
    end
    
    return false
end

function ZAOMAODG:HasManagedRare(name)
    local locale
    local zones

    if not SilverDragon or type(SilverDragon.GetLocaleKey) ~= "function" then
        return false
    end

    if not SilverDragon_RaresData or not SilverDragon_RaresData.zones then
        return false
    end

    locale = SilverDragon:GetLocaleKey()
    zones = SilverDragon_RaresData.zones[locale]
    if not zones then
        return false
    end

    for _, mobs in pairs(zones) do
        if mobs[name] then
            return true
        end
    end

    return false
end

function ZAOMAODG:RebuildTempTargetLookup()
    ZAOMAODG.tempTargetLookup = {}

    if not ZAOMAODGDB or not ZAOMAODGDB.tempTargetList then
        return
    end

    for _, name in ipairs(ZAOMAODGDB.tempTargetList) do
        if name and name ~= "" then
            ZAOMAODG.tempTargetLookup[name] = true
        end
    end
end

function ZAOMAODG:GetNearbyTargetList()
    local names = {}
    local records

    if not SilverDragon or type(SilverDragon.GetNearbyRareRecords) ~= "function" then
        return names
    end

    records = SilverDragon:GetNearbyRareRecords(GetRealZoneText(), ZAOMAODG.scanRadius)
    table.sort(records, function(a, b)
        local aPriority = ZAOMAODG.tempTargetLookup[a.name] and 0 or 1
        local bPriority = ZAOMAODG.tempTargetLookup[b.name] and 0 or 1

        if aPriority ~= bPriority then
            return aPriority < bPriority
        end
        if a.distance == b.distance then
            return a.name < b.name
        end
        return a.distance < b.distance
    end)

    for _, record in ipairs(records) do
        table.insert(names, record.name)
    end

    return names
end

function ZAOMAODG.selectFromList()
    if UnitAffectingCombat("player") then
        return
    end
    
    if ZAOMAODG:IsProtectedManualTarget("target") then
        ZAOMAODG.toggleAlert(false)
        return
    end

    CleanupForceTargetedRares()

    local currentTime = time()
    for name, expireTime in pairs(ZAOMAODG.deadTargetExcludeList) do
        if currentTime >= expireTime then
            ZAOMAODG.deadTargetExcludeList[name] = nil
            ZAOMAODG.deadTargetCounts[name] = nil
        end
    end
    
    if ZAOMAODG.pendingRestart then
        ZAOMAODG.pendingRestart = false
        if not ZAOMAODG.isActive and not ZAOMAODG.isInCityOrBattleground() then
            ZAOMAODG.isActive = true
            ZAOMAODG.alertCounts = {}
            ZAOMAODG:UpdateToggleButtonText()
            print(L["Combat ended. Radar restarted automatically."])
            ZAOMAODG.globalTimeElapsed = 0
            ZAOMAODG.lastUpdateTime = GetTime()
            ZAOMAODG.selectFromList()
            Screenshotoi=0
        end
        return
    end
    
    if ZAOMAODG.isInCityOrBattleground() then
        ZAOMAODG.isActive = false
        ZAOMAODG:UpdateToggleButtonText()
        print(L["Current area is a city or battleground. Radar disabled automatically."])
        PlayMusic("")
        ZAOMAODG.toggleAlert(false)
        
        if ZAOMAODG.autoRestartTimer then
            ZAOMAODG.autoRestartTimer:Cancel()
        end
        ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(30, function()
            if not ZAOMAODG.isActive then
                if UnitAffectingCombat("player") then
                    ZAOMAODG.pendingRestart = true
                    ZAOMAODG.autoRestartTimer = nil
                    return
                end
                
                if not ZAOMAODG.isInCityOrBattleground() then
                    ZAOMAODG.isActive = true
                    ZAOMAODG.alertCounts = {}
                    ZAOMAODG:UpdateToggleButtonText()
                    print(L["Radar restarted automatically."])
                    ZAOMAODG.globalTimeElapsed = 0
                    ZAOMAODG.lastUpdateTime = GetTime()
                    ZAOMAODG.selectFromList()
                    Screenshotoi=0
                else
                    ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(60, function()
                        ZAOMAODG:OnZoneChanged()
                    end)
                end
                ZAOMAODG.autoRestartTimer = nil
            end
        end)
        return
    end
    
    if not ZAOMAODG.isActive then return end
    
    if ZAOMAODG.isInCityOrBattleground() then
        return
    end

    local candidateList = ZAOMAODG:GetNearbyTargetList()
    if table.getn(candidateList) == 0 then
        ZAOMAODG.toggleAlert(false)
        return
    end

    local targetFound = false
    for _, name in ipairs(candidateList) do
        if ZAOMAODG:ShouldSkipAutoTargetRare(name) then
            if ZAOMAODG:HasRecentRare(name) then
                targetFound = true
            end
        elseif ZAOMAODG.selectTargetByName(name) then 
            local targetName = UnitName("target")
            
            local isPet = false
            if UnitPlayerControlled("target") and not UnitIsPlayer("target") then
                isPet = true
            end
            
            if isPet then
                ClearTarget()
                return
            end
            
            if ZAOMAODG:IsExcludedFromScan(targetName) then
                return
            end
            
            if not ZAOMAODG.alertCounts[targetName] then
                ZAOMAODG.alertCounts[targetName] = 0
            end
            
            if ZAOMAODG.alertCounts[targetName] < ZAOMAODG.maxAlerts then
                if ZAOMAODG.isInCityOrBattleground() then
                    ZAOMAODG.isActive = false
                    ZAOMAODG:UpdateToggleButtonText()
                    print(L["Current area is a city or battleground. Radar disabled automatically."])
                    PlayMusic("")
                    ZAOMAODG.toggleAlert(false)
                    
                    if ZAOMAODG.autoRestartTimer then
                        ZAOMAODG.autoRestartTimer:Cancel()
                    end
                    ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(30, function()
                        if not ZAOMAODG.isActive then
                            if UnitAffectingCombat("player") then
                                ZAOMAODG.pendingRestart = true
                                print(L["Radar will restart after combat ends."])
                                ZAOMAODG.autoRestartTimer = nil
                                return
                            end
                            
                            if not ZAOMAODG.isInCityOrBattleground() then
                                ZAOMAODG.isActive = true
                                ZAOMAODG.alertCounts = {}
                                ZAOMAODG:UpdateToggleButtonText()
                                print(L["Radar restarted automatically."])
                                ZAOMAODG.globalTimeElapsed = 0
                                ZAOMAODG.lastUpdateTime = GetTime()
                                ZAOMAODG.selectFromList()
                                Screenshotoi=0
                            else
                                ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(60, function()
                                    ZAOMAODG:OnZoneChanged()
                                end)
                            end
                            ZAOMAODG.autoRestartTimer = nil
                        end
                    end)
                    return
                end
                
                if not UnitIsDead("target") then
                    local channelName
                    local channelId

                    print(string.format(L["Found target: %s"], targetName))
                    channelName = L["Boss report channel"]
                    channelId = GetChannelName(channelName)
                    if channelId and channelId > 0 then
                        SendChatMessage(string.format(L["Found target: %s"], targetName), "CHANNEL", nil, channelId)
                    end
                    ZAOMAODG:RememberRecentRare(targetName)
                    ZAOMAODG:RecordToHistory(targetName, false)
                    if ZAOMAODG.forceTarget then
                        ZAOMAODG:MarkAutoTargetRare(targetName)
                    end
                    
                    if not ZAOMAODG.musicTimers then
                        ZAOMAODG.musicTimers = {}
                    end
                    
                    PlayMusic("Interface\\AddOns\\SilverDragon\\Music\\Item.mp3")
                    
                    if ZAOMAODG.musicTimers[targetName] then
                        ZAOMAODG.musicTimers[targetName]:Cancel()
                    end
                    ZAOMAODG.musicTimers[targetName] = C_Timer.NewTimer(3, function()
                        PlayMusic("")
                    end)
                    
                    ZAOMAODG.alertCounts[targetName] = ZAOMAODG.alertCounts[targetName] + 1
                    targetFound = true
                else
                    if ZAOMAODG:IsExcludedFromScan(targetName) then
                        return
                    end

                    ZAOMAODG:RememberRecentRare(targetName)
                    
                    if not ZAOMAODG.deadTargetCounts[targetName] then
                        ZAOMAODG.deadTargetCounts[targetName] = 0
                    end
                    
                    if ZAOMAODG.deadTargetCounts[targetName] < ZAOMAODG.deadTargetMaxAlerts then
                        print(string.format(L["Found rare boss: %s. Too late..."], targetName))
                        ZAOMAODG:RecordToHistory(targetName, true)
                        
                        ZAOMAODG.deadTargetCounts[targetName] = ZAOMAODG.deadTargetCounts[targetName] + 1
                        targetFound = true
                        
                        if ZAOMAODG.deadTargetCounts[targetName] >= ZAOMAODG.deadTargetMaxAlerts then
                            ZAOMAODG:AddToExcludeList(targetName)
                        end
                    end
                end
                
                if not UnitIsDead("target") and ZAOMAODG.alertCounts[targetName] >= ZAOMAODG.maxAlerts then
                    ZAOMAODG.isActive = false
                    ZAOMAODG:UpdateToggleButtonText()
                    print(L["Radar temporarily disabled. It will restart in 30 seconds."])
                    PlayMusic("")
                    ZAOMAODG.toggleAlert(false)
                    
                    if ZAOMAODG.autoRestartTimer then
                        ZAOMAODG.autoRestartTimer:Cancel()
                    end
                    ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(30, function()
                        if not ZAOMAODG.isActive then
                            if UnitAffectingCombat("player") then
                                ZAOMAODG.pendingRestart = true
                                print(L["Radar will restart after combat ends."])
                                ZAOMAODG.autoRestartTimer = nil
                                return
                            end
                            
                            ZAOMAODG.isActive = true
                            ZAOMAODG.alertCounts = {}
                            ZAOMAODG:UpdateToggleButtonText()
                            print(L["Radar restarted automatically."])
                            ZAOMAODG.globalTimeElapsed = 0
                            ZAOMAODG.lastUpdateTime = GetTime()
                            ZAOMAODG.selectFromList()
                            Screenshotoi=0
                            ZAOMAODG.autoRestartTimer = nil
                        end
                    end)
                end

                if not UnitIsDead("target") then
                    if ZAOMAODG.alertTimers and ZAOMAODG.alertTimers[targetName] then
                        ZAOMAODG.alertTimers[targetName]:Cancel()
                    end
                    
                    if not ZAOMAODG.alertTimers then ZAOMAODG.alertTimers = {} end
                    ZAOMAODG.alertTimers[targetName] = C_Timer.NewTimer(30, function()
                        ZAOMAODG.alertCounts[targetName] = nil
                    end)
                end

                if not ZAOMAODG.forceTarget and UnitExists("target") and UnitName("target") == targetName and not ZAOMAODG:IsProtectedManualTarget("target") then
                    ClearTarget()
                end
                
                break
            end
        end
    end
    ZAOMAODG.toggleAlert(targetFound)
end

ZAOMAODG.timerFrame = CreateFrame("Frame", "ZAOMAODG_TimerFrame")
ZAOMAODG.timerFrame:SetScript("OnUpdate", function()
    if not ZAOMAODG.isActive then 
        if ZAOMAODG.pendingRestart and not UnitAffectingCombat("player") and not ZAOMAODG.isInCityOrBattleground() then
            ZAOMAODG.pendingRestart = false
            ZAOMAODG.isActive = true
            ZAOMAODG.alertCounts = {}
            ZAOMAODG:UpdateToggleButtonText()
            ZAOMAODG.globalTimeElapsed = 0
            ZAOMAODG.lastUpdateTime = GetTime()
            ZAOMAODG.selectFromList()
            Screenshotoi=0
        end
        return
    end
    
    if ZAOMAODG:IsProtectedExcludedTarget("target") then
        return
    end

    if ZAOMAODG:IsProtectedManualTarget("target") then
        return
    end
    
    if UnitExists("target") then
        local isPet = false
        if UnitPlayerControlled("target") and not UnitIsPlayer("target") then
            isPet = true
        end
        if isPet then
            ClearTarget()
        end
    end
    
    if UnitAffectingCombat("player") then
        return
    end
    
    if ZAOMAODG.isInCityOrBattleground() then
        return
    end
    
    local currentTime = GetTime()
    ZAOMAODG.globalTimeElapsed = ZAOMAODG.globalTimeElapsed + (currentTime - ZAOMAODG.lastUpdateTime)
    ZAOMAODG.lastUpdateTime = currentTime
    if ZAOMAODG.globalTimeElapsed >= 3 then
        ZAOMAODG.selectFromList()
        ZAOMAODG.globalTimeElapsed = ZAOMAODG.globalTimeElapsed - 3
    end
end)

-- Initialize saved radar state.
ZAOMAODGDB = ZAOMAODGDB or {}
-- Show the control window by default for fresh installs.
if ZAOMAODGDB.mainFrameShown == nil then
    ZAOMAODGDB.mainFrameShown = true
end

-- Initialize the temporary priority target list.
if not ZAOMAODGDB.tempTargetList then
    ZAOMAODGDB.tempTargetList = {}
end

local function MergeTempTargetsFromDB()
    ZAOMAODG:RebuildTempTargetLookup()
end

function ZAOMAODG:InitializeSavedVariables()
    ZAOMAODGDB = ZAOMAODGDB or {}

    if ZAOMAODGDB.mainFrameShown == nil then
        ZAOMAODGDB.mainFrameShown = true
    end

    ZAOMAODGDB.tempTargetList = ZAOMAODGDB.tempTargetList or {}
    ZAOMAODGDB.history = ZAOMAODGDB.history or {}
    ZAOMAODGDB.lastRecorded = ZAOMAODGDB.lastRecorded or {}
    if ZAOMAODGDB.forceTarget == nil then
        ZAOMAODGDB.forceTarget = true
    end

    ZAOMAODG.forceTarget = ZAOMAODGDB.forceTarget and true or false
    ZAOMAODGDB.disabled = nil

    MergeTempTargetsFromDB()
end

function ZAOMAODG:SaveMainFrameState(isShown)
    ZAOMAODGDB = ZAOMAODGDB or {}
    ZAOMAODGDB.mainFrameShown = isShown and true or false
end

function ZAOMAODG:ShowMainFrame()
    if not ZAOMAODG.mainFrame:IsShown() then
        ZAOMAODG.mainFrame:Show()
    else
        ZAOMAODG:SaveMainFrameState(true)
    end
end

function ZAOMAODG:HideMainFrame()
    if ZAOMAODG.mainFrame:IsShown() then
        ZAOMAODG.mainFrame:Hide()
    else
        ZAOMAODG:SaveMainFrameState(false)
    end
end

function ZAOMAODG:ApplyMainFrameState()
    if ZAOMAODGDB and ZAOMAODGDB.mainFrameShown then
        ZAOMAODG:ShowMainFrame()
    else
        ZAOMAODG:HideMainFrame()
    end
end

-- Build the radar control window.
ZAOMAODG.mainFrame = CreateFrame("Frame", "ZAOMAODG_MainFrame", UIParent)
ZAOMAODG.mainFrame:SetWidth(205)
ZAOMAODG.mainFrame:SetHeight(70)
ZAOMAODG.mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
ZAOMAODG.mainFrame:Hide()
ZAOMAODG.mainFrame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
ZAOMAODG.mainFrame:SetBackdropColor(0.03, 0.03, 0.03, 0.32)
ZAOMAODG.mainFrame:SetBackdropBorderColor(0.50, 0.43, 0.18, 0.34)
ZAOMAODG.mainFrame:SetScript("OnShow", function()
    ZAOMAODG:SaveMainFrameState(true)
end)
ZAOMAODG.mainFrame:SetScript("OnHide", function()
    ZAOMAODG:SaveMainFrameState(false)
end)
if not ZAOMAODGDB.mainFrameShown then
    ZAOMAODG.mainFrame:Hide()
end

ZAOMAODG.titleText = ZAOMAODG.mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
ZAOMAODG.titleText:SetPoint("TOPLEFT", ZAOMAODG.mainFrame, "TOPLEFT", 10, -9)
ZAOMAODG.titleText:SetText(L["Boss Radar"])

ZAOMAODG.hintText = ZAOMAODG.mainFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
ZAOMAODG.hintText:SetText("")
ZAOMAODG.hintText:Hide()

ZAOMAODG.mainDivider = ZAOMAODG.mainFrame:CreateTexture(nil, "ARTWORK")
ZAOMAODG.mainDivider:SetTexture("Interface\\Buttons\\WHITE8x8")
ZAOMAODG.mainDivider:SetVertexColor(0.50, 0.43, 0.18, 0.12)
ZAOMAODG.mainDivider:SetPoint("TOPLEFT", ZAOMAODG.mainFrame, "TOPLEFT", 8, -20)
ZAOMAODG.mainDivider:SetPoint("TOPRIGHT", ZAOMAODG.mainFrame, "TOPRIGHT", -8, -20)
ZAOMAODG.mainDivider:SetHeight(1)

ZAOMAODG.statusText = ZAOMAODG.mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
ZAOMAODG.statusText:SetWidth(190)
ZAOMAODG.statusText:SetHeight(12)
ZAOMAODG.statusText:SetJustifyH("RIGHT")
ZAOMAODG.statusText:SetPoint("TOPRIGHT", ZAOMAODG.mainFrame, "TOPRIGHT", -26, -9)
ZAOMAODG.statusText:SetText("")

ZAOMAODG.toggleButton = CreateFrame("Button", "ZAOMAODG_ToggleButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.toggleButton:SetWidth(30)
ZAOMAODG.toggleButton:SetHeight(20)
ZAOMAODG.toggleButton:SetText(GetRadarToggleText())
ZAOMAODG.toggleButton:SetPoint("BOTTOMLEFT", ZAOMAODG.mainFrame, "BOTTOMLEFT", 10, 8)

ZAOMAODG.forceButton = CreateFrame("Button", "ZAOMAODG_ForceButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.forceButton:SetWidth(30)
ZAOMAODG.forceButton:SetHeight(20)
ZAOMAODG.forceButton:SetText(GetForceTargetButtonText())
ZAOMAODG.forceButton:SetPoint("LEFT", ZAOMAODG.toggleButton, "RIGHT", 4, 0)

ZAOMAODG.selectButton = CreateFrame("Button", "ZAOMAODG_SelectButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.selectButton:SetWidth(34)
ZAOMAODG.selectButton:SetHeight(20)
ZAOMAODG.selectButton:SetText(L["Select button text"])
ZAOMAODG.selectButton:SetPoint("LEFT", ZAOMAODG.forceButton, "RIGHT", 4, 0)

ZAOMAODG.selectButtonActiveBackground = ZAOMAODG.selectButton:CreateTexture(nil, "ARTWORK")
ZAOMAODG.selectButtonActiveBackground:SetTexture("Interface\\Buttons\\WHITE8x8")
ZAOMAODG.selectButtonActiveBackground:SetPoint("TOPLEFT", ZAOMAODG.selectButton, "TOPLEFT", 1, -1)
ZAOMAODG.selectButtonActiveBackground:SetPoint("BOTTOMRIGHT", ZAOMAODG.selectButton, "BOTTOMRIGHT", -1, 1)
ZAOMAODG.selectButtonActiveBackground:SetVertexColor(0.10, 1.00, 0.10, 0.92)
ZAOMAODG.selectButtonActiveBackground:Hide()

ZAOMAODG.selectButtonHighlight = CreateFrame("Frame", nil, ZAOMAODG.mainFrame)
ZAOMAODG.selectButtonHighlight:SetPoint("TOPLEFT", ZAOMAODG.selectButton, "TOPLEFT", -2, 2)
ZAOMAODG.selectButtonHighlight:SetPoint("BOTTOMRIGHT", ZAOMAODG.selectButton, "BOTTOMRIGHT", 2, -2)
ZAOMAODG.selectButtonHighlight:SetFrameLevel(ZAOMAODG.selectButton:GetFrameLevel() + 2)
ZAOMAODG.selectButtonHighlight:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
    edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
})
ZAOMAODG.selectButtonHighlight:SetBackdropColor(0, 0, 0, 0)
ZAOMAODG.selectButtonHighlight:SetBackdropBorderColor(1, 0.82, 0.18, 1)
ZAOMAODG.selectButtonHighlight:Hide()

ZAOMAODG.addButton = CreateFrame("Button", "ZAOMAODG_AddButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.addButton:SetWidth(18)
ZAOMAODG.addButton:SetHeight(20)
ZAOMAODG.addButton:SetText(L["Add button text"])
ZAOMAODG.addButton:SetPoint("LEFT", ZAOMAODG.selectButton, "RIGHT", 8, 0)

ZAOMAODG.removeButton = CreateFrame("Button", "ZAOMAODG_RemoveButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.removeButton:SetWidth(18)
ZAOMAODG.removeButton:SetHeight(20)
ZAOMAODG.removeButton:SetText(L["Remove button text"])
ZAOMAODG.removeButton:SetPoint("LEFT", ZAOMAODG.addButton, "RIGHT", 2, 0)

ZAOMAODG.historyButton = CreateFrame("Button", "ZAOMAODG_HistoryButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.historyButton:SetWidth(30)
ZAOMAODG.historyButton:SetHeight(20)
ZAOMAODG.historyButton:SetText(L["History button text"])
ZAOMAODG.historyButton:SetPoint("LEFT", ZAOMAODG.removeButton, "RIGHT", 8, 0)

ZAOMAODG.scanLabel = ZAOMAODG.mainFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
ZAOMAODG.scanLabel:SetPoint("BOTTOM", ZAOMAODG.toggleButton, "TOP", 0, 2)
ZAOMAODG.scanLabel:SetText(L["Radar section scan"])

ZAOMAODG.forceLabel = ZAOMAODG.mainFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
ZAOMAODG.forceLabel:SetPoint("BOTTOM", ZAOMAODG.forceButton, "TOP", 0, 2)
ZAOMAODG.forceLabel:SetText(L["Radar section force"])

ZAOMAODG.selectLabel = ZAOMAODG.mainFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
ZAOMAODG.selectLabel:SetPoint("BOTTOM", ZAOMAODG.selectButton, "TOP", 0, 2)
ZAOMAODG.selectLabel:SetText(L["Radar section select"])

ZAOMAODG.priorityLabel = ZAOMAODG.mainFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
ZAOMAODG.priorityLabel:SetWidth(40)
ZAOMAODG.priorityLabel:SetJustifyH("CENTER")
ZAOMAODG.priorityLabel:SetPoint("BOTTOMLEFT", ZAOMAODG.addButton, "TOPLEFT", -2, 2)
ZAOMAODG.priorityLabel:SetText(L["Radar section priority"])

ZAOMAODG.historyLabel = ZAOMAODG.mainFrame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
ZAOMAODG.historyLabel:SetPoint("BOTTOM", ZAOMAODG.historyButton, "TOP", 0, 2)
ZAOMAODG.historyLabel:SetText(L["Radar section history"])

ZAOMAODG.priorityDivider = ZAOMAODG.mainFrame:CreateTexture(nil, "ARTWORK")
ZAOMAODG.priorityDivider:SetTexture("Interface\\Buttons\\WHITE8x8")
ZAOMAODG.priorityDivider:Hide()

ZAOMAODG.historyDivider = ZAOMAODG.mainFrame:CreateTexture(nil, "ARTWORK")
ZAOMAODG.historyDivider:SetTexture("Interface\\Buttons\\WHITE8x8")
ZAOMAODG.historyDivider:Hide()

ZAOMAODG.closeButton = CreateFrame("Button", "ZAOMAODG_CloseButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.closeButton:SetWidth(16)
ZAOMAODG.closeButton:SetHeight(16)
ZAOMAODG.closeButton:SetText("X")
ZAOMAODG.closeButton:SetPoint("TOPRIGHT", ZAOMAODG.mainFrame, "TOPRIGHT", -6, -6)
ZAOMAODG.closeButton:SetScript("OnClick", function()
    ZAOMAODG:HideMainFrame()
end)

local function SaveMainFramePosition()
    local centerX, centerY = ZAOMAODG.mainFrame:GetCenter()
    local screenWidth = UIParent:GetWidth()
    local screenHeight = UIParent:GetHeight()

    ZAOMAODGDB = ZAOMAODGDB or {}
    ZAOMAODGDB.x = (centerX - screenWidth/2) / screenWidth
    ZAOMAODGDB.y = (centerY - screenHeight/2) / screenHeight
end

local function AddTooltip(button, text, extraText)
    button:SetScript("OnEnter", function()
        GameTooltip:SetOwner(button, "ANCHOR_TOP")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(text, 1, 1, 1, 1)
        if extraText and extraText ~= "" then
            GameTooltip:AddLine(extraText, 0.8, 0.8, 0.8, 1)
        end
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
end

local function RegisterBarButton(button, tooltipText)
    AddTooltip(button, tooltipText, L["Drag to move"])
    button:EnableMouse(true)
    button:RegisterForDrag("LeftButton")
    button:SetScript("OnDragStart", function()
        ZAOMAODG.mainFrame:StartMoving()
    end)
    button:SetScript("OnDragStop", function()
        ZAOMAODG.mainFrame:StopMovingOrSizing()
        SaveMainFramePosition()
    end)
end

RegisterBarButton(ZAOMAODG.toggleButton, L["Enable or disable the radar"])
RegisterBarButton(ZAOMAODG.selectButton, L["Target the most recently detected rare"])
RegisterBarButton(ZAOMAODG.addButton, L["Add a temporary priority target"])
RegisterBarButton(ZAOMAODG.removeButton, L["Remove a temporary priority target"])
RegisterBarButton(ZAOMAODG.forceButton, L["Enable or disable forced target selection after a rare is found"])
RegisterBarButton(ZAOMAODG.historyButton, L["Show radar history"])
RegisterBarButton(ZAOMAODG.closeButton, L["Hide window"])
ZAOMAODG:UpdateSelectButtonState()

ZAOMAODG.mainFrame:SetMovable(true)
ZAOMAODG.mainFrame:EnableMouse(true)
ZAOMAODG.mainFrame:RegisterForDrag("LeftButton")
ZAOMAODG.mainFrame:SetScript("OnDragStart", function()
    ZAOMAODG.mainFrame:StartMoving()
end)
ZAOMAODG.mainFrame:SetScript("OnDragStop", function()
    ZAOMAODG.mainFrame:StopMovingOrSizing()
    SaveMainFramePosition()
end)

function ZAOMAODG.InitializePosition()
    ZAOMAODGDB = ZAOMAODGDB or {}
    if ZAOMAODGDB.x and ZAOMAODGDB.y then
        local screenWidth = UIParent:GetWidth()
        local screenHeight = UIParent:GetHeight()
        local x = ZAOMAODGDB.x * screenWidth + screenWidth/2
        local y = ZAOMAODGDB.y * screenHeight + screenHeight/2
        ZAOMAODG.mainFrame:ClearAllPoints()
        ZAOMAODG.mainFrame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x, y)
    else
        ZAOMAODG.mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    end
end

ZAOMAODG.toggleButton:SetScript("OnClick", function()
    ZAOMAODG.isActive = not ZAOMAODG.isActive
    if ZAOMAODG.isActive then
        if ZAOMAODG.autoRestartTimer then
            ZAOMAODG.autoRestartTimer:Cancel()
            ZAOMAODG.autoRestartTimer = nil
        end
        ZAOMAODG.pendingRestart = false
        
        ZAOMAODG.alertCounts = {}
        ZAOMAODG:UpdateToggleButtonText()
        print(L["Radar enabled."])
        ZAOMAODG.globalTimeElapsed = 0
        ZAOMAODG.lastUpdateTime = GetTime()
        
        if not ZAOMAODG.isInCityOrBattleground() and not UnitAffectingCombat("player") then
            ZAOMAODG.selectFromList()
        else
            print(L["Radar paused in city, battleground, or combat."])
        end
        Screenshotoi=0
    else
        ZAOMAODG:UpdateToggleButtonText()
        print(L["Radar temporarily disabled. It will restart in 30 seconds."])
        Screenshotoi=1
        PlayMusic("")
        ZAOMAODG.toggleAlert(false)
        ZAOMAODG.pendingRestart = false
        
        if ZAOMAODG.autoRestartTimer then
            ZAOMAODG.autoRestartTimer:Cancel()
        end
        ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(30, function()
            if not ZAOMAODG.isActive then
                if UnitAffectingCombat("player") then
                    ZAOMAODG.pendingRestart = true
                    ZAOMAODG.autoRestartTimer = nil
                    return
                end
                
                ZAOMAODG.isActive = true
                ZAOMAODG.alertCounts = {}
                ZAOMAODG:UpdateToggleButtonText()
                print(L["Radar restarted automatically."])
                ZAOMAODG.globalTimeElapsed = 0
                ZAOMAODG.lastUpdateTime = GetTime()
                
                if not ZAOMAODG.isInCityOrBattleground() and not UnitAffectingCombat("player") then
                    ZAOMAODG.selectFromList()
                else
                    print(L["Radar is sleeping in city, battleground, or combat."])
                end
                Screenshotoi=0
                ZAOMAODG.autoRestartTimer = nil
            end
        end)
    end
end)

ZAOMAODG.addButton:SetScript("OnClick", function()
    StaticPopup_Show("ZAOMAODG_ADD_TARGET")
end)

ZAOMAODG.removeButton:SetScript("OnClick", function()
    StaticPopup_Show("ZAOMAODG_REMOVE_TARGET")
end)

ZAOMAODG.selectButton:SetScript("OnClick", function()
    ZAOMAODG:SelectRecentRare()
end)

ZAOMAODG.forceButton:SetScript("OnClick", function()
    ZAOMAODG.forceTarget = not ZAOMAODG.forceTarget
    ZAOMAODGDB = ZAOMAODGDB or {}
    ZAOMAODGDB.forceTarget = ZAOMAODG.forceTarget
    if ZAOMAODG.forceTarget then
        print(L["Forced target enabled."])
        ZAOMAODG:ShowStatusMessage(L["Forced target enabled."], 0.40, 1, 0.40, 2)
    else
        print(L["Forced target disabled."])
        ZAOMAODG:ShowStatusMessage(L["Forced target disabled."], 0.82, 0.82, 0.82, 2)
        if UnitExists("target") and not UnitIsPlayer("target") and not ZAOMAODG:IsProtectedManualTarget("target") then
            local classification = UnitClassification("target")
            if classification == "rare" or classification == "rareelite" then
                ClearTarget()
            end
        end
    end
    ZAOMAODG:UpdateToggleButtonText()
end)

function ZAOMAODG.toggleWindow()
    if ZAOMAODG.mainFrame:IsShown() then
        ZAOMAODG:HideMainFrame()
    else
        ZAOMAODG:ShowMainFrame()
    end
end

function ZAOMAODG.toggle()
    ZAOMAODG.toggleWindow()
end

StaticPopupDialogs["ZAOMAODG_ADD_TARGET"] = {
    text = L["Enter the name of the rare to add to the temporary priority scan list:"],
    button1 = L["Add"],
    button2 = L["Cancel"],
    hasEditBox = true,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    OnShow = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            editBox:SetText("")
            editBox:SetFocus()
        end
    end,
    OnAccept = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            local targetName = editBox:GetText()
            if targetName and targetName ~= "" then
                if not ZAOMAODG:HasManagedRare(targetName) then
                    print(string.format(L["Target %s is not in RaresData.lua. Active scanning only uses coordinates from RaresData.lua."], targetName))
                    return
                end
                if ZAOMAODG.tempTargetLookup[targetName] then
                    print(string.format(L["Target is already in the temporary priority scan list: %s"], targetName))
                    return
                end

                table.insert(ZAOMAODGDB.tempTargetList, targetName)
                ZAOMAODG.tempTargetLookup[targetName] = true
                print(string.format(L["Added to the temporary priority scan list: %s"], targetName))
            end
        end
    end,
}

StaticPopupDialogs["ZAOMAODG_REMOVE_TARGET"] = {
    text = L["Enter the name of the rare to remove from the temporary priority scan list:"],
    button1 = L["Delete"],
    button2 = L["Cancel"],
    hasEditBox = true,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    OnShow = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            editBox:SetText("")
            editBox:SetFocus()
        end
    end,
    OnAccept = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            local targetName = editBox:GetText()
            if targetName and targetName ~= "" then
                local found = false
                
                for i, name in ipairs(ZAOMAODGDB.tempTargetList) do
                    if name == targetName then
                        table.remove(ZAOMAODGDB.tempTargetList, i)
                        found = true
                        break
                    end
                end
                
                if found then
                    ZAOMAODG.tempTargetLookup[targetName] = nil
                    print(string.format(L["Removed from the temporary priority scan list: %s"], targetName))
                else
                    print(string.format(L["Target not found in the temporary priority scan list: %s"], targetName))
                end
            end
        end
    end,
}

SLASH_ZAOMAODG1 = "/zmdg"
SlashCmdList["ZAOMAODG"] = function(msg)
    StaticPopup_Show("ZAOMAODG_ADD_TARGET")
end

SLASH_SILVERDRAGONZDG1 = "/sdz"
SlashCmdList["SILVERDRAGONZDG"] = function(msg)
    if msg == "show" then
        ZAOMAODG:ShowMainFrame()
    elseif msg == "hide" then
        ZAOMAODG:HideMainFrame()
    elseif msg == "toggle" then
        ZAOMAODG.toggle()
    else
        ZAOMAODG.toggleWindow()
    end
end

-- Publish the radar module on the main addon table.
if not SilverDragon then
    SilverDragon = {}
end
SilverDragon.ZAOMAODG = ZAOMAODG

function ZAOMAODG:OnZoneChanged()
    if ZAOMAODG.isInCityOrBattleground() then
        if ZAOMAODG.isActive then
            ZAOMAODG.isActive = false
            ZAOMAODG:UpdateToggleButtonText()
            print(L["Entered a city or battleground. Radar disabled automatically."])
            PlayMusic("")
            ZAOMAODG.toggleAlert(false)
            ZAOMAODG.pendingRestart = false
            
            if ZAOMAODG.autoRestartTimer then
                ZAOMAODG.autoRestartTimer:Cancel()
            end
            ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(30, function()
                if not ZAOMAODG.isActive then
                    if UnitAffectingCombat("player") then
                        ZAOMAODG.pendingRestart = true
                        print(L["Radar will restart after combat ends."])
                        ZAOMAODG.autoRestartTimer = nil
                        return
                    end
                    
                    if not ZAOMAODG.isInCityOrBattleground() then
                        ZAOMAODG.isActive = true
                        ZAOMAODG.alertCounts = {}
                        ZAOMAODG:UpdateToggleButtonText()
                        ZAOMAODG.globalTimeElapsed = 0
                        ZAOMAODG.lastUpdateTime = GetTime()
                        if not ZAOMAODG.musicTimers then
                            ZAOMAODG.musicTimers = {}
                        end
                        ZAOMAODG.selectFromList()
                        Screenshotoi=0
                    else
                        ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(60, function()
                            ZAOMAODG:OnZoneChanged()
                        end)
                    end
                    ZAOMAODG.autoRestartTimer = nil
                end
            end)
        end
    else
        if not ZAOMAODG.isActive and not ZAOMAODG.autoRestartTimer then
            if UnitAffectingCombat("player") then
                ZAOMAODG.pendingRestart = true
                print(L["Radar will start after combat ends."])
            else
                ZAOMAODG.isActive = true
                ZAOMAODG.alertCounts = {}
                ZAOMAODG:UpdateToggleButtonText()
                print(L["Left the city or battleground. Radar enabled automatically."])
                ZAOMAODG.globalTimeElapsed = 0
                ZAOMAODG.lastUpdateTime = GetTime()
                if not ZAOMAODG.musicTimers then
                    ZAOMAODG.musicTimers = {}
                end
                ZAOMAODG.selectFromList()
                Screenshotoi=0
            end
        end
    end
end

local function InitializeZAOMAODG()
    ZAOMAODG:InitializeSavedVariables()
    ZAOMAODG.InitializePosition()
    ZAOMAODG:ApplyMainFrameState()

    ZAOMAODG.isActive = true
    ZAOMAODG:UpdateToggleButtonText()
    ZAOMAODG.globalTimeElapsed = 0
    ZAOMAODG.lastUpdateTime = GetTime()
    ZAOMAODG.pendingRestart = false
    
    ZAOMAODG.timerFrame:RegisterEvent("ZONE_CHANGED")
    ZAOMAODG.timerFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    ZAOMAODG.timerFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
    
    ZAOMAODG.timerFrame:SetScript("OnEvent", function(self, event, ...)
        if event == "ZONE_CHANGED" or event == "ZONE_CHANGED_NEW_AREA" or event == "ZONE_CHANGED_INDOORS" then
            ZAOMAODG:OnZoneChanged()
        end
    end)
    
    if not ZAOMAODG.isInCityOrBattleground() and ZAOMAODG.isActive and not UnitAffectingCombat("player") then
        ZAOMAODG.selectFromList()
    end
    Screenshotoi=0
end

ZAOMAODG.initFrame = CreateFrame("Frame", "ZAOMAODG_InitFrame")
ZAOMAODG.initFrame:RegisterEvent("VARIABLES_LOADED")
ZAOMAODG.initFrame:SetScript("OnEvent", function()
    ZAOMAODG.initFrame:UnregisterEvent("VARIABLES_LOADED")
    C_Timer.After(1, InitializeZAOMAODG)
end)

-- Initialize history storage.
ZAOMAODGDB = ZAOMAODGDB or {}
ZAOMAODGDB.history = ZAOMAODGDB.history or {}
ZAOMAODGDB.lastRecorded = ZAOMAODGDB.lastRecorded or {}

-- Build the radar history window.
ZAOMAODG.historyFrame = CreateFrame("Frame", "ZAOMAODG_HistoryFrame", UIParent)
ZAOMAODG.historyFrame:SetWidth(500)
ZAOMAODG.historyFrame:SetHeight(500)
ZAOMAODG.historyFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
ZAOMAODG.historyFrame:Hide()
ZAOMAODG.historyFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 9, right = 9, top = 9, bottom = 9 }
})

ZAOMAODG.historyTitle = ZAOMAODG.historyFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
ZAOMAODG.historyTitle:SetText(L["Radar History"])
ZAOMAODG.historyTitle:SetPoint("TOP", ZAOMAODG.historyFrame, "TOP", 0, -20)

ZAOMAODG.historyScrollFrame = CreateFrame("ScrollFrame", "ZAOMAODG_HistoryScrollFrame", ZAOMAODG.historyFrame, "UIPanelScrollFrameTemplate")
ZAOMAODG.historyScrollFrame:SetWidth(450)
ZAOMAODG.historyScrollFrame:SetHeight(400)
ZAOMAODG.historyScrollFrame:SetPoint("TOPLEFT", ZAOMAODG.historyFrame, "TOPLEFT", 25, -50)

ZAOMAODG.historyScrollChild = CreateFrame("Frame", "ZAOMAODG_HistoryScrollChild", ZAOMAODG.historyScrollFrame)
ZAOMAODG.historyScrollChild:SetWidth(430)
ZAOMAODG.historyScrollChild:SetHeight(1)
ZAOMAODG.historyScrollFrame:SetScrollChild(ZAOMAODG.historyScrollChild)

ZAOMAODG.historyCloseButton = CreateFrame("Button", "ZAOMAODG_HistoryCloseButton", ZAOMAODG.historyFrame, "UIPanelButtonTemplate")
ZAOMAODG.historyCloseButton:SetWidth(27)
ZAOMAODG.historyCloseButton:SetHeight(27)
ZAOMAODG.historyCloseButton:SetText("X")
ZAOMAODG.historyCloseButton:SetPoint("TOPRIGHT", ZAOMAODG.historyFrame, "TOPRIGHT", -10, -10)
ZAOMAODG.historyCloseButton:SetScript("OnClick", function()
    ZAOMAODG.historyFrame:Hide()
end)

ZAOMAODG.clearHistoryButton = CreateFrame("Button", "ZAOMAODG_ClearHistoryButton", ZAOMAODG.historyFrame, "UIPanelButtonTemplate")
ZAOMAODG.clearHistoryButton:SetWidth(120)
ZAOMAODG.clearHistoryButton:SetHeight(30)
ZAOMAODG.clearHistoryButton:SetText(L["Clear History"])
ZAOMAODG.clearHistoryButton:SetPoint("BOTTOM", ZAOMAODG.historyFrame, "BOTTOM", 0, 20)
ZAOMAODG.clearHistoryButton:SetScript("OnClick", function()
    ZAOMAODGDB = ZAOMAODGDB or {}
    ZAOMAODGDB.history = {}
    ZAOMAODGDB.lastRecorded = {}
    
    if ZAOMAODG.historyScrollChild then
        local children = {ZAOMAODG.historyScrollChild:GetChildren()}
        for _, child in ipairs(children) do
            if child:GetObjectType() == "Frame" and child.text then
                child:Hide()
            end
        end
        ZAOMAODG.historyScrollChild:SetHeight(1)
    end
    
    ZAOMAODG:UpdateHistoryDisplay()
    print(L["Radar history cleared."])
end)

AddTooltip(ZAOMAODG.clearHistoryButton, L["Clear all radar history."])

function ZAOMAODG:RecordToHistory(name, isDead)
    ZAOMAODGDB = ZAOMAODGDB or {}
    ZAOMAODGDB.history = ZAOMAODGDB.history or {}
    ZAOMAODGDB.lastRecorded = ZAOMAODGDB.lastRecorded or {}
    
    local currentTime = time()
    if ZAOMAODGDB.lastRecorded[name] and (currentTime - ZAOMAODGDB.lastRecorded[name]) < 3600 then
        return
    end
    ZAOMAODGDB.lastRecorded[name] = currentTime
    local timeStr = date("%Y-%m-%d %H:%M:%S", currentTime)
    local entry = {
        time = currentTime,
        timeStr = timeStr,
        name = name,
        dead = isDead
    }
    table.insert(ZAOMAODGDB.history, 1, entry)
    local historyLength = 0
    for i, _ in ipairs(ZAOMAODGDB.history) do
        historyLength = i
    end
    if historyLength > 100 then
        table.remove(ZAOMAODGDB.history, 101)
    end
end

function ZAOMAODG:UpdateHistoryDisplay()
    ZAOMAODGDB = ZAOMAODGDB or {}
    ZAOMAODGDB.history = ZAOMAODGDB.history or {}
    
    if not ZAOMAODG.historyScrollChild then
        return
    end
    
    local children = ZAOMAODG.historyScrollChild:GetChildren()
    if children then
        for i, child in ipairs(children) do
            child:Hide()
        end
    end
    
    for i, entry in ipairs(ZAOMAODGDB.history) do
        local line = CreateFrame("Frame", "ZAOMAODG_HistoryLine"..i, ZAOMAODG.historyScrollChild)
        line:SetWidth(430)
        line:SetHeight(20)
        line:SetPoint("TOPLEFT", ZAOMAODG.historyScrollChild, "TOPLEFT", 0, -20*(i-1))
        line.entry = entry
        
        local text = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetText(entry.timeStr .. ": " .. entry.name .. (entry.dead and L["History corpse suffix"] or ""))
        text:SetPoint("LEFT", line, "LEFT", 5, 0)
        text:SetWidth(350)
        text:SetJustifyH("LEFT")
        line.text = text
        
        local queryBtn = CreateFrame("Button", "ZAOMAODG_QueryButton"..i, line, "UIPanelButtonTemplate")
        queryBtn:SetWidth(60)
        queryBtn:SetHeight(18)
        queryBtn:SetText(L["Lookup"])
        queryBtn:SetPoint("RIGHT", line, "RIGHT", -5, 0)
        queryBtn.entry = entry
        queryBtn:SetScript("OnClick", function()
            if ChatFrameEditBox then
                ChatFrameEditBox:SetText("/DB " .. queryBtn.entry.name)
                ChatEdit_SendText(ChatFrameEditBox)
            else
                SendChatMessage("/DB " .. queryBtn.entry.name)
            end
        end)
        queryBtn:SetScript("OnEnter", function()
            GameTooltip:SetOwner(queryBtn, "ANCHOR_RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:AddLine(string.format(L["Lookup: %s"], queryBtn.entry.name), 1, 1, 1)
            GameTooltip:AddLine(L["Click to enter the /DB command automatically."], 0.8, 0.8, 0.8)
            GameTooltip:Show()
        end)
        queryBtn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        line.queryButton = queryBtn
        
        line:SetScript("OnEnter", function()
            GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:AddLine(entry.name, 1, 1, 1)
            GameTooltip:AddLine(string.format(L["Recorded at: %s"], entry.timeStr), 0.8, 0.8, 0.8)
            GameTooltip:AddLine(string.format(L["State: %s"], entry.dead and L["Dead"] or L["Alive"]), 0.8, 0.8, 0.8)
            GameTooltip:Show()
        end)
        line:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        line:Show()
    end
    
    local scrollHeight = 1
    for i, _ in ipairs(ZAOMAODGDB.history) do
        scrollHeight = i
    end
    ZAOMAODG.historyScrollChild:SetHeight(math.max(scrollHeight*20, 1))
end

ZAOMAODG.historyButton:SetScript("OnClick", function()
    ZAOMAODG:UpdateHistoryDisplay()
    ZAOMAODG.historyFrame:Show()
end)
