local tablet = AceLibrary("Tablet-2.0")
local L = AceLibrary("AceLocale-2.2"):new("SilverDragon")
local NOTES_DB_NAME = "SilverDragon"

local nameplatesShowing

SilverDragon = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0", "AceHook-2.1", "FuBarPlugin-2.0")

SilverDragon.version = "2.0." .. string.sub("$Revision: 38392 $", 12, -3)
SilverDragon.date = string.sub("$Date: 2007-06-03 23:41:27 -0400 (Sun, 03 Jun 2007) $", 8, 17)
SilverDragon.hasIcon = L["DefaultIcon"]

SilverDragon.ignoreList = {}
if type(L["Ignored rares"]) == "table" then
	SilverDragon.ignoreList = L["Ignored rares"]
end

function SilverDragon:OnInitialize()
	SilverDragon:RegisterDB("SilverDragonDB")
	SilverDragon:RegisterDefaults('profile', {
		mobs = {
			--zone
			["*"] = {},
		},
		notes = true,
		scan = true,
		announce = {
			chat = true,
			error = true,
		},
	})
	local optionsTable = {
		type="group",
		args={
			settings = {
				name=L["Settings"], desc=L["Configuration options"],
				type="group",
				args={
					scan = {
						name=L["Scan"], desc=L["Scan for nearby rares at a regular interval"],
						type="toggle",
						get=function() return self.db.profile.scan end,
						set=function(t)
							self.db.profile.scan = t
							if t then self:ScheduleRepeatingEvent('SilverDragon_Scan', self.CheckNearby, 50, self)
							else self:CancelScheduledEvent('SilverDragon_Scan') end
						end,
					},
					announce = {
						name=L["Announce"], desc=L["Display a message when a rare is detected nearby"],
						type="group", args={
							chat = {
								name=L["Chat"], desc=L["In the chatframe"],
								type="toggle",
								get=function() return self.db.profile.announce.chat end,
								set=function(t) self.db.profile.announce.chat = t end,
							},
							error = {
								name=L["Error"], desc=L["In the errorframe"],
								type="toggle",
								get=function() return self.db.profile.announce.error end,
								set=function(t) self.db.profile.announce.error = t end,
							},
						},
					},
					notes = {
						name=L["Notes"], desc=L["Make notes in Cartographer"],
						type="toggle",
						get = function() return self.db.profile.notes end,
						set = function(t)
							self.db.profile.notes = t
							self:ToggleCartographer(t)
						end,
						disabled = function()
							if Cartographer_Notes then return false
							else return true end
						end,
					}
				},
			},
			defaults = {
				name=L["Import defaults"], desc=L["Import a default database of rares"],
				type="execute", func = function() self:ImportDefaults() end,
				disabled = function() return type(self.ImportDefaults) ~= 'function' end,
			},
		},
	}
	self:RegisterChatCommand(L["ChatCommands"], optionsTable)
	self.OnMenuRequest = optionsTable
	self.lastseen = {}
	if type(self.ImportDefaults) == "function" then
		self:ImportDefaults()
	end
end

local errlist = {
    ERR_ITEM_COOLDOWN,
    ERR_ABILITY_COOLDOWN,
    ERR_SPELL_COOLDOWN,
    ERR_POTION_COOLDOWN,
    L["Can't do that while moving"],
    L["You can't do that yet"],
    L["Not enough rage"],
    SPELL_FAILED_MOVING,
    ERR_NOEMOTEWHILERUNNING,
    ERR_USE_TOO_FAR,
    ERR_UNIT_NOT_FOUND,
    ERR_VENDOR_TOO_FAR,
    ERR_SPELL_OUT_OF_RANGE,
    ERR_OUT_OF_ENERGY,
    ERR_GENERIC_NO_TARGET,
    SPELL_FAILED_NO_COMBO_POINTS,
    ERR_INVALID_ATTACK_TARGET,
    ERR_NO_ATTACK_TARGET,
    SPELL_FAILED_BAD_TARGETS,
    L["Unknown"],
    SPELL_FAILED_INTERRUPTED,
    SPELL_FAILED_SPELL_IN_PROGRESS,
    ERR_UNIT_NOT_FOUND,
    ERR_SPELL_FAILED_ANOTHER_IN_PROGRESS,
    SPELL_FAILED_TOO_CLOSE,
    ERR_BADATTACKPOS,
    ERR_OUT_OF_MANA,
}

function SilverDragon:AddMessage(f, message, a1, a2, a3, a4)
    for _, v in pairs(errlist) do
        if strfind(message, v) then
            return
        end
    end
    self.hooks[UIErrorsFrame].AddMessage(f, message, a1, a2, a3, a4)
end

function SilverDragon:OnEnable()
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
	if self.db.profile.scan then
		self:ScheduleRepeatingEvent('SilverDragon_Scan', self.CheckNearby, 300, self)
	end
	self:ToggleCartographer(self.db.profile.notes)
	
	self:SecureHook("ShowNameplates", function() nameplatesShowing = true; end)
	self:SecureHook("HideNameplates", function() nameplatesShowing = false; end)
	UpdateNameplates()
	
	self:Hook(UIErrorsFrame, "AddMessage")
end

function SilverDragon:OnDisable()
	self:ToggleCartographer(false)
end

local cartdb = {}
local cartdb_populated
function SilverDragon:ToggleCartographer(enable)
	if Cartographer_Notes then
		if enable then
			Cartographer_Notes:RegisterIcon("Rare", {text = L["Rare mob"], path = "Interface\\Icons\\INV_Misc_Head_Dragon_01", width=12, height=12})
			Cartographer_Notes:RegisterNotesDatabase(NOTES_DB_NAME, cartdb, SilverDragon)
			if not cartdb_populated then
				for zone in pairs(self:GetKnownZones()) do
					for name in pairs(self:GetZoneMobNames(zone)) do
						local x, y, level, elite = self:GetMobInfo(zone, name)
						if x > 0 and y > 0 then
							if elite == 1 then
								Cartographer_Notes:SetNote(zone, tonumber(x)/100, tonumber(y)/100, 'Rare', NOTES_DB_NAME, 'title', name .. " - |cFF00FF00Lv" .. level .. " |cFFFF0000" .. L["Rare elite"])
							else
								Cartographer_Notes:SetNote(zone, tonumber(x)/100, tonumber(y)/100, 'Rare', NOTES_DB_NAME, 'title', name .. " - |cFF00FF00Lv" .. level .. " |cffeda55f" .. L["Rare"])
							end
						end
					end
				end
				cartdb_populated = true
			end
		else
			Cartographer_Notes:UnregisterIcon("Rare")
			Cartographer_Notes:UnregisterNotesDatabase(NOTES_DB_NAME)
		end
	end
end

function SilverDragon:SetNoteHere(text)
	local x,y = GetPlayerMapPosition('player')
	Cartographer_Notes:SetNote(GetRealZoneText(), x, y, 'Rare', NOTES_DB_NAME, 'title', text)
end

function SilverDragon:PLAYER_TARGET_CHANGED()
	self:IsRare('target')
end

function SilverDragon:UPDATE_MOUSEOVER_UNIT()
	self:IsRare('mouseover')
end

function SilverDragon:SaveMob(zone, name, x, y, level, elite, ctype, subzone)
	self.db.profile.mobs[zone] = self.db.profile.mobs[zone] or {}
	self.db.profile.mobs[zone][name] = string.format("%s:%s:%d:%d:%s:%s:%d", math.floor(x * 1000)/10, math.floor(y * 1000)/10, level, elite, ctype, subzone, self.lastseen[name] or 0)
end

local function ParseMobInfoString(info)
	if info then
		local _, _, x,y,level,elite,ctype,csubzone,lastseen = string.find(info, "^(.*):(.*):(-?%d*):(%d*):(.*):(.*):(%d*)")
		if x then
			return tonumber(x), tonumber(y), tonumber(level), tonumber(elite), ctype, csubzone, tonumber(lastseen)
		end
	end
	return 0, 0, 0, 0, '', '', nil
end

function SilverDragon:GetMobInfo(zone, name)
	return ParseMobInfoString(self:GetMobInfoString(zone, name))
end

function SilverDragon:GetLocaleKey()
	local locale = GetLocale and GetLocale() or "enUS"
	if locale == "zhCN" then
		return "zhCN"
	end
	return "enUS"
end

function SilverDragon:ShouldForceTarget()
	if self.ZAOMAODG and self.ZAOMAODG.forceTarget ~= nil then
		return self.ZAOMAODG.forceTarget and true or false
	end
	return true
end

function SilverDragon:GetRaresZoneData(zone)
	if SilverDragon_RaresData and SilverDragon_RaresData.zones then
		local locale = self:GetLocaleKey()
		if SilverDragon_RaresData.zones[locale] then
			return SilverDragon_RaresData.zones[locale][zone]
		end
	end
end

function SilverDragon:GetRaresRecord(recordId)
	if SilverDragon_RaresData and SilverDragon_RaresData.records then
		return SilverDragon_RaresData.records[recordId]
	end
end

function SilverDragon:GetRaresEntryInfo(recordId)
	local record = self:GetRaresRecord(recordId)
	local locale = self:GetLocaleKey()
	if record and record.info and record.info[locale] then
		return record.info[locale]
	end
end

function SilverDragon:GetRaresEntrySpawns(recordId)
	local record = self:GetRaresRecord(recordId)
	if record then
		return record.spawns
	end
end

function SilverDragon:GetStoredMobInfoString(zone, name)
	if self.db.profile.mobs[zone] then
		return self.db.profile.mobs[zone][name]
	end
end

function SilverDragon:GetDefaultMobInfoString(zone, name)
	local zoneData = self:GetRaresZoneData(zone)
	if zoneData and zoneData[name] then
		return self:GetRaresEntryInfo(zoneData[name])
	end
end

function SilverDragon:GetMobInfoString(zone, name)
	return self:GetStoredMobInfoString(zone, name) or self:GetDefaultMobInfoString(zone, name)
end

function SilverDragon:HasKnownMob(zone, name)
	return self:GetMobInfoString(zone, name) and true or false
end

function SilverDragon:GetKnownZones()
	local zones = {}
	local locale = self:GetLocaleKey()

	if SilverDragon_RaresData and SilverDragon_RaresData.zones and SilverDragon_RaresData.zones[locale] then
		for zone in pairs(SilverDragon_RaresData.zones[locale]) do
			zones[zone] = true
		end
	end

	for zone in pairs(self.db.profile.mobs) do
		if zone ~= "*" then
			zones[zone] = true
		end
	end

	return zones
end

function SilverDragon:GetZoneMobNames(zone)
	local names = {}
	local zoneData = self:GetRaresZoneData(zone)
	local savedZoneData = self.db.profile.mobs[zone]

	if zoneData then
		for name in pairs(zoneData) do
			names[name] = true
		end
	end

	if savedZoneData then
		for name in pairs(savedZoneData) do
			names[name] = true
		end
	end

	return names
end

function SilverDragon:GetNearbyRareRecords(zone, radius)
	local records = {}
	local zoneData
	local currentSubZone
	local hasCoords
	local playerX
	local playerY

	zone = zone or GetRealZoneText()
	zoneData = self:GetRaresZoneData(zone)
	if not zoneData then
		return records
	end

	if (not radius) and SilverDragon_RaresData and SilverDragon_RaresData.scan_radius then
		radius = SilverDragon_RaresData.scan_radius
	end
	radius = radius or 12

	playerX, playerY = GetPlayerMapPosition("player")
	hasCoords = not (playerX == 0 and playerY == 0)
	playerX = playerX * 100
	playerY = playerY * 100
	currentSubZone = GetSubZoneText() or ""

	for name, entry in pairs(zoneData) do
		local bestDistance
		local csubzone
		local hasLocationCoords
		local info
		local isNearby
		local spawns
		local x, y

		if not self:IsIgnored(name) then
			info = self:GetRaresEntryInfo(entry)
			spawns = self:GetRaresEntrySpawns(entry)
			x, y, _, _, _, csubzone = ParseMobInfoString(info)
			isNearby = false

			if not isNearby and hasCoords and spawns then
				for _, spawn in ipairs(spawns) do
					local sx = spawn[1] or spawn.x
					local sy = spawn[2] or spawn.y
					if sx and sy then
						hasLocationCoords = true
						local dx = playerX - sx
						local dy = playerY - sy
						local distance = math.sqrt((dx * dx) + (dy * dy))
						if (not bestDistance) or distance < bestDistance then
							bestDistance = distance
						end
						if distance <= radius then
							isNearby = true
						end
					end
				end
			end

			if not isNearby and hasCoords and x and y and not (x == 0 and y == 0) then
				hasLocationCoords = true
				local dx = playerX - x
				local dy = playerY - y
				local distance = math.sqrt((dx * dx) + (dy * dy))
				if (not bestDistance) or distance < bestDistance then
					bestDistance = distance
				end
				if distance <= radius then
					isNearby = true
				end
			end

			if not isNearby and (not hasCoords or not hasLocationCoords) and csubzone and csubzone ~= "" and currentSubZone ~= "" and csubzone == currentSubZone then
				isNearby = true
				bestDistance = 0
			end

			if isNearby then
				table.insert(records, {
					name = name,
					distance = bestDistance or 0,
				})
			end
		end
	end

	table.sort(records, function(a, b)
		if a.distance == b.distance then
			return a.name < b.name
		end
		return a.distance < b.distance
	end)

	return records
end

-- Ignore entries that should never trigger detection.
function SilverDragon:IsIgnored(name)
	for _, ignoreName in ipairs(SilverDragon.ignoreList) do
		if name == ignoreName then
			return true
		end
	end
	return false
end

do
	local distanceCache = {}
	function SilverDragon:IsRare(unit)
		local c12n = UnitClassification(unit)
		if c12n == 'rare' or c12n == 'rareelite' then
			local name = UnitName(unit)
			
			-- Skip rare processing for ignored entries.
			if self:IsIgnored(name) then
				return
			end
			
			local distance = 1000
			if CheckInteractDistance(unit, 3) then
				distance = 10
			elseif CheckInteractDistance(unit, 4) then
				distance = 30
			end
			self:Announce(name, UnitIsDead(unit))
			if UnitIsVisible(unit) and distance < (distanceCache[name] or 100) then
				distanceCache[name] = distance
				local x, y = GetPlayerMapPosition("player")
				self:SaveMob(GetRealZoneText(), name, x, y, UnitLevel(unit), c12n=='rareelite' and 1 or 0, UnitCreatureType(unit), GetSubZoneText())
				
				self:Update()
				if self.db.profile.notes and Cartographer_Notes and not (x == 0 and y == 0) then
					self:SetNoteHere(name)
				end
			end
		end
	end
end

function SilverDragon:Announce(name, dead)
	-- Re-check the ignore list before notifying the player.
	if self:IsIgnored(name) then
		return
	end

	if self.ZAOMAODG then
		if type(self.ZAOMAODG.RememberRecentRare) == "function" then
			self.ZAOMAODG:RememberRecentRare(name)
		end
	end
	
	if (not self.lastseen[name]) or (self.lastseen[name] < (time() - 600)) then
		if self.db.profile.announce.error then
			UIErrorsFrame:AddMessage(string.format(L["%s seen!"], name), 1, 0, 0, 1, UIERRORS_HOLD_TIME)
			if dead then
				UIErrorsFrame:AddMessage(L["(it's dead)"], 1, 0, 0, 1, UIERRORS_HOLD_TIME)
			end
		end
		if self.db.profile.announce.chat then
			self:Print(string.format(L["%s seen!"], name), dead and L["(it's dead)"] or '')
		end
		PlaySound("AuctionWindowClose")
		PlaySound("LevelUp")
		if self:ShouldForceTarget() and (not self.ZAOMAODG or type(self.ZAOMAODG.CanAutoTargetRare) ~= "function" or self.ZAOMAODG:CanAutoTargetRare(name)) then
			TargetByName(name)
			if self.ZAOMAODG and type(self.ZAOMAODG.MarkAutoTargetRare) == "function" and UnitExists("target") and UnitName("target") == name then
				self.ZAOMAODG:MarkAutoTargetRare(name)
			end
		end
		self.lastseen[name] = time()
		return true
	end
end

function SilverDragon:CheckNearby()
    if nameplatesShowing then
        self:NameplateScan()
    end
    
    self:TargetScan()
    self:ActiveTargetScan()
end

function SilverDragon:ActiveTargetScan()
    local zone = GetRealZoneText()

    if self.ZAOMAODG and type(self.ZAOMAODG.IsProtectedExcludedTarget) == "function" then
        if self.ZAOMAODG:IsProtectedExcludedTarget("target") then
            return
        end
    end

    if self.ZAOMAODG and type(self.ZAOMAODG.IsProtectedManualTarget) == "function" then
        if self.ZAOMAODG:IsProtectedManualTarget("target") then
            return
        end
    end

    for _, record in ipairs(self:GetNearbyRareRecords(zone)) do
        if not (self.ZAOMAODG and type(self.ZAOMAODG.IsExcludedFromScan) == "function" and self.ZAOMAODG:IsExcludedFromScan(record.name)) then
            local shouldSkipRepeatedTarget = self.ZAOMAODG and type(self.ZAOMAODG.ShouldSkipAutoTargetRare) == "function" and self.ZAOMAODG:ShouldSkipAutoTargetRare(record.name)

            if not shouldSkipRepeatedTarget then
                TargetByName(record.name, true)
                
                if UnitExists("target") and UnitName("target") == record.name then
                    local classification = UnitClassification("target")
                    if (classification == 'rare' or classification == 'rareelite') and not UnitIsPlayer("target") then
                        self:IsRare('target')
                        if not self:ShouldForceTarget() and UnitExists("target") and UnitName("target") == record.name then
                            ClearTarget()
                        end
                        break
                    end
                end
            end
        end
    end
end

-- Forward left-clicks from broker displays to the radar window.
if SilverDragonDataBroker and SilverDragonDataBroker.OnClick then
    local originalOnClick = SilverDragonDataBroker.OnClick
    SilverDragonDataBroker.OnClick = function(_, button)
        if button == "LeftButton" then
            if SilverDragon.ZAOMAODG and SilverDragon.ZAOMAODG.toggleWindow then
                SilverDragon.ZAOMAODG.toggleWindow()
            end
        else
            if originalOnClick then
                originalOnClick(_, button)
            end
        end
    end
end

function SilverDragon:OnTooltipUpdate()
    local zone, subzone = GetRealZoneText(), GetSubZoneText()
    cat = tablet:AddCategory('text', zone, 'columns', 5)
    for name in pairs(self:GetZoneMobNames(zone)) do
        if not self:IsIgnored(name) then
            local x,y,level,elite,ctype,csubzone,lastseen = self:GetMobInfo(zone, name)
            cat:AddLine(
                'text', name, 'textR', subzone == csubzone and 0 or nil, 'textG', subzone == csubzone and 1 or nil, 'textB', subzone == csubzone and 0 or nil,
                'text2', string.format(L["Level %s%s %s"], (level and tonumber(level) > 1) and level or '?', elite==1 and '+' or '', ctype and ctype or '?'),
                'text3', csubzone,
                'text4', self:LastSeen(lastseen),
                'text5', string.format("%s, %s", x, y)
            )
        end
    end
    
    if SilverDragon.ZAOMAODG then
        local zdgCat = tablet:AddCategory('text', L["Boss Radar"], 'columns', 1)
        local statusText = SilverDragon.ZAOMAODG.isActive and ("|cFF00FF00" .. L["Enabled"]) or ("|cFFFF0000" .. L["Disabled"])
        zdgCat:AddLine('text', string.format(L["Status: %s"], statusText))
        zdgCat:AddLine('text', L["Left-click the icon to open the radar window"])
    end
end

function SilverDragon:OnClick(button)
    if button == "LeftButton" then
        if SilverDragon.ZAOMAODG and SilverDragon.ZAOMAODG.toggleWindow then
            SilverDragon.ZAOMAODG.toggleWindow()
        end
    end
end

function SilverDragon:LastSeen(t)
	if t == 0 then return L['Never'] end
	local lastseen
	local currentTime = time()
	local minutes = math.ceil((currentTime - t) / 60)
	if minutes > 59 then
		local hours = math.ceil((currentTime - t) / 3600)
		if hours > 23 then
			lastseen = math.ceil((currentTime - t) / 86400)..L[" day(s)"]
		else
			lastseen = hours..L[" hour(s)"]
		end
	else
		lastseen = minutes..L[" minute(s)"]
	end
	return lastseen
end

function SilverDragon:OnTextUpdate()
	self:SetText(L["Rares"])
end

----------------------------
-- Cartographer Overrides --
----------------------------

function SilverDragon:OnNoteTooltipRequest(zone, id, data, inMinimap)
	local x,y,level,elite,ctype,csubzone,lastseen = self:GetMobInfo(zone, data.title)
	local cat = tablet:AddCategory('text', data.title, 'justify', 'CENTER')
	cat:AddLine('text', string.format(L["Level %s%s %s"], (level and tonumber(level) > 1) and level or '?', elite==1 and '+' or '', ctype and ctype or '?'))
	cat:AddLine('text', self:LastSeen(lastseen))
end

function SilverDragon:OnNoteTooltipLineRequest(zone, id, data, inMinimap)
	local x,y,level,elite,ctype,csubzone,lastseen = self:GetMobInfo(zone, data.title)
	return 'text', string.format("%s: " .. L["Level %s%s %s"], data.title, (level and tonumber(level) > 1) and level or '?', elite==1 and '+' or '', ctype and ctype or '?')
end

------------------------
-- Nameplate Scanning --
------------------------

local worldchildren
local nameplates = {}

local function CheckForNameplate(frame)
	return
end

function SilverDragon:NameplateScan(hideNameplates)
	if worldchildren ~= WorldFrame:GetNumChildren() then
		for i=1,WorldFrame:GetNumChildren(),1 do
			CheckForNameplate(WorldFrame:GetChildren()[i])
		end
		worldchildren = WorldFrame:GetNumChildren()
	end
	local zone = GetRealZoneText()
	for nameplate, regions in pairs(nameplates) do
		if nameplate:IsVisible() and self:HasKnownMob(zone, regions.name:GetText()) then
			local name = regions.name:GetText()
			if not self:IsIgnored(name) then
				self:Announce(name)
			end
			break
		end
	end
end

---------------------
-- Target Scanning --
---------------------

function SilverDragon:TargetScan()
	for i=1, GetNumPartyMembers(), 1 do
		PartyTarget = "party" .. i .. "target"
		PartyPetTarget = "partypet" .. i .. "target"
		self:IsRare(PartyTarget)
		self:IsRare(PartyPetTarget)
	end
end

-------------
-- Imports --
-------------

function SilverDragon:RaretrackerImport()
	if RT_Database then
		for zone, mobs in pairs(RT_Database) do
			for name, info in pairs(mobs) do
				if not self:HasKnownMob(zone, name) then
					self:SaveMob(zone, name, info.locX or 0, info.locY or 0, info.level, info.elite or 0, info.creatureType or '', info.subZone or '')
				end
			end
		end
	else
		self:Print(L["Raretracker needs to be loaded for this to work."])
	end
end
