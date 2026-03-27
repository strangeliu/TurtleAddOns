local module, L = BigWigs:ModuleDeclaration("Anomalus", "Karazhan")

-- module variables
module.revision = 30000
module.enabletrigger = module.translatedName
module.toggleoptions = { "arcaneoverload", "arcaneprison", "manaboundstrike", "manaboundframe", "markdampenedplayers", -1, "custommonitor", "bosskill" }
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Tower of Karazhan"],
	AceLibrary("Babble-Zone-2.2")["Tower of Karazhan"],
}

-- module defaults
module.defaultDB = {
	arcaneoverload = true,
	arcaneprison = true,
	manaboundstrike = true,
	manaboundframe = true,
	manaboundframeposx = 100,
	manaboundframeposy = 300,
	monitorposx = 0,
	monitorposy = 0,
	markdampenedplayers = true,
	custommonitor = true,
}

-- localization
L:RegisterTranslations("enUS", function()
	return {
		cmd = "Anomalus",

		arcaneoverload_cmd = "arcaneoverload",
		arcaneoverload_name = "Arcane Overload Alert",
		arcaneoverload_desc = "Warns when players get affected by Arcane Overload",

		arcaneprison_cmd = "arcaneprison",
		arcaneprison_name = "Arcane Prison Alert",
		arcaneprison_desc = "Warns when players get affected by Arcane Prison",

		manaboundstrike_cmd = "manaboundstrike",
		manaboundstrike_name = "Manabound Strike Alert",
		manaboundstrike_desc = "Warns when players get affected by Manabound Strike stacks",

		manaboundframe_cmd = "manaboundframe",
		manaboundframe_name = "Manabound Strikes Frame",
		manaboundframe_desc = "Shows a frame with player stacks and timers for Manabound Strikes",

		markdampenedplayers_cmd = "markdampenedplayers",
		markdampenedplayers_name = "Mark Dampened Players",
		markdampenedplayers_desc = "Mark players affected by Arcane Dampening if there are unused raid icons (requires assistant or leader)",

		trigger_arcaneOverloadYou = "You are afflicted by Arcane Overload",
		trigger_arcaneOverloadOther = "(.+) is afflicted by Arcane Overload",
		msg_arcaneOverloadYou = "BOMB ON YOU - DPS HARD THEN RUN AWAY!",
		msg_arcaneOverloadOther = "BOMB on %s!",
		bar_arcaneOverload = "Next Bomb",
		bar_arcaneOverloadExplosion = "BOMB ON YOU Explosion",

		trigger_arcanePrison = "(.+) is afflicted by Arcane Prison",
		msg_arcanePrison = "Arcane Prison on %s!",

		trigger_manaboundStrike = "(.+) is afflicted by Manabound Strikes %((%d+)%)",
		trigger_manaboundFade = "Manabound Strikes fades from (.+)",

		trigger_arcaneDampening = "(.+) is afflicted by Arcane Dampening",
		trigger_arcaneDampening2 = "trigger_backup", -- Backup not needed for enUS
		trigger_arcaneDampeningFade = "Arcane Dampening fades from (.+)",

		trigger_arcaneOverloadOther2 = "trigger_backup", -- Backup not needed for enUS

		-- Unstable Magic (Damage Trigger)
		trigger_unstableMagicDamageYou = "Unstable Magic hits you for",
		trigger_unstableMagicDamageOther = "Unstable Magic hits (.+) for",

		bar_manaboundExpire = "Manabound stacks expire",

		custommonitor_cmd = "monitor",
		custommonitor_name = "Monitor Frame",
		custommonitor_desc = "Show a custom monitor for Unstable Magic, Arcane Dampening, and Arcane Overload.",
		
		monitor_header_unstable = "Unstable Magic",
		monitor_header_dampening = "Arcane Dampening",
		monitor_header_overload = "Arcane Overload",

		trigger_unstableMagic = "(.+) is afflicted by Unstable Magic",
		trigger_unstableMagicFade = "Unstable Magic fades from (.+)",
	}
end)

L:RegisterTranslations("zhCN", function()
    return {
        cmd = "Anomalus",

        arcaneoverload_cmd = "奥术过载",
        arcaneoverload_name = "奥术过载警报",
        arcaneoverload_desc = "当玩家受到奥术过载影响时发出警告",

        arcaneprison_cmd = "奥术牢笼",
        arcaneprison_name = "奥术牢笼警报",
        arcaneprison_desc = "当玩家受到奥术牢笼影响时发出警告",

        manaboundstrike_cmd = "法力束缚打击",
        manaboundstrike_name = "法力束缚打击警报",
        manaboundstrike_desc = "当玩家受到法力束缚打击层数影响时发出警告",

        manaboundframe_cmd = "法力束缚框架",
        manaboundframe_name = "法力束缚打击框架",
        manaboundframe_desc = "显示一个带有玩家法力束缚打击层数和计时的框架",

        markdampenedplayers_cmd = "标记减益玩家",
        markdampenedplayers_name = "标记受减益影响的玩家",
        markdampenedplayers_desc = "如果有未使用的团队标记，标记受到奥术减益影响的玩家（需要助手或团长权限）",

        trigger_arcaneOverloadYou = "你受到了奥术.*载",
        trigger_arcaneOverloadOther = "(.+)受到了奥术.*载效果的影响.*",
        trigger_arcaneOverloadOther2 = "(.+)受到了奥术.*载.*", -- Backup
        msg_arcaneOverloadYou = "你身上有炸弹 - 用力输出然后跑开！",
        msg_arcaneOverloadOther = "%s身上有炸弹！",
        bar_arcaneOverload = "下一个炸弹",
        bar_arcaneOverloadExplosion = "你的炸弹即将爆炸",

        trigger_arcanePrison = "(.+)受到奥术牢笼",
        msg_arcanePrison = "%s受到奥术牢笼影响！",

        trigger_manaboundStrike = "(.+)受到了法力束缚打击",
        trigger_manaboundFade = "法力束缚打击效果从(.+)身上消失",

        trigger_arcaneDampening = "(.+) is afflicted by 奥术抑制",
        trigger_arcaneDampening2 = "(.+)受到了奥术抑制", -- Backup
        trigger_arcaneDampeningFade = "奥术抑制效果从(.+)身上消失",

        bar_manaboundExpire = "法力束缚层数消失",

		custommonitor_cmd = "monitor",
		custommonitor_name = "开启监控面板",
		custommonitor_desc = "显示不稳定的魔法、奥术抑制和奥术过载的监控面板",
		
		monitor_header_unstable = "不稳定的魔法",
		monitor_header_dampening = "奥术抑制",
		monitor_header_overload = "奥术超载",

		-- Unstable Magic now triggers on damage
		trigger_unstableMagicDamageYou = "不稳定.*击中你造成",
		trigger_unstableMagicDamageOther = "不稳定.*击中(.+)造成",
    }
end)

-- timer and icon variables
local timer = {
	arcaneOverload = {
		7, 15, 13.5, 12.1, 10.9, 9.8, 8.8, 8, 7.2, 6.5, 5.8, 5.2, 4.5
	},
	minArcaneOverload = 4.5, -- minimum time between Arcane Overload casts
	manaboundDuration = 60,
	arcaneOverloadExplosion = 15,
	arcaneDampening = 45, -- duration of Arcane Dampening
}

local icon = {
	arcaneOverload = "INV_Misc_Bomb_04",
	arcanePrison = "Spell_Frost_Glacier",
	manaboundStrike = "Spell_Arcane_FocusedPower",
	manaboundExpire = "Spell_Holy_FlashHeal",
	arcaneDampening = "Spell_Nature_AbolishMagic", -- icon for Arcane Dampening
}

local syncName = {
	arcaneOverload = "AnomalusArcaneOverload" .. module.revision,
	arcanePrison = "AnomalusArcanePrison" .. module.revision,
	manaboundStrike = "AnomalusManaboundStrike" .. module.revision,
	manaboundStrikeFade = "AnomalusManaboundStrikeFade" .. module.revision,
	arcaneDampening = "AnomalusArcaneDampening" .. module.revision,
	arcaneDampeningFade = "AnomalusArcaneDampeningFade" .. module.revision,
}

local maxManaboundPlayers = 10
local arcaneOverloadCount = 0
local manaboundStrikesPlayers = {}
local manaboundStrikesPlayers = {}
local dampenedPlayers = {}
-- Monitor Data
local unstablePlayers = {}
local dampeningPlayers = {} -- reusing dampenedPlayers logic but storing time: [name] = expireTime
local overloadPlayers = {} -- [name] = expireTime
local monitorFrame = nil

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "AfflictionEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "AfflictionEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "AfflictionEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "AfflictionEvent") -- Add capture for direct casts/hits
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "AfflictionEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "AfflictionEvent") -- Capture direct damage to self
	self:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "AfflictionEvent") -- Fallback for strange units

	self:ThrottleSync(3, syncName.arcaneOverload)
	self:ThrottleSync(3, syncName.arcanePrison)
	self:ThrottleSync(3, syncName.manaboundStrike)
	self:ThrottleSync(3, syncName.manaboundStrikeFade)
	self:ThrottleSync(3, syncName.arcaneDampening)
	self:ThrottleSync(3, syncName.arcaneDampeningFade)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	arcaneOverloadCount = 0
	manaboundStrikesPlayers = {}
	dampenedPlayers = {}
	
	-- Monitor Init
	unstablePlayers = {}
	dampeningPlayers = {}
	overloadPlayers = {}
	if self.db.profile.custommonitor then
		self:CreateMonitorFrame()
		self:ToggleMonitor(true)
	end

	if self.db.profile.arcaneoverload then
		self:Bar(L["bar_arcaneOverload"], timer.arcaneOverload[arcaneOverloadCount], icon.arcaneOverload)
	end
    
    self:ScheduleRepeatingEvent("BigWigsAnomalusScan", self.ScanAuras, 0.5, self)
end

-- Tooltip Scanner
local scannerTooltip = CreateFrame("GameTooltip", "BigWigsAnomalusTooltip", nil, "GameTooltipTemplate")
scannerTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

function module:ScanAuras()
    if not self.db.profile.custommonitor then return end

    for i = 1, GetNumRaidMembers() do
        local unit = "raid" .. i
        local name = UnitName(unit)
        if name then
            for j = 1, 32 do
                local buffName, _, _, _, _, duration, expirationTime = UnitDebuff(unit, j)
                if not buffName then
                     -- UnitDebuff returns name as 1st arg in 2.0+, texture in 1.12
                     -- If 1.12, we must use Tooltip.
                     -- Let's check if buffName is a string (Name) or Texture path.
                     -- Typically texture paths start with "Interface\\"
                     local texture = UnitDebuff(unit, j)
                     if not texture then break end
                     
                     scannerTooltip:ClearLines()
                     scannerTooltip:SetUnitDebuff(unit, j)
                     buffName = BigWigsAnomalusTooltipTextLeft1:GetText()
                end

                if buffName then
                    -- Unstable Magic (Strict match: "不稳定的魔法") OR Arcane Explosion ("奥术爆炸")
                    if string.find(buffName, "不稳定的魔法") or (string.find(buffName, "奥术") and string.find(buffName, "爆炸")) then
                         -- Try to get duration from API if available (TBC+)
                         local expiry = GetTime() + 1.0
                         if expirationTime and expirationTime > 0 then
                             expiry = expirationTime
                         elseif duration and duration > 0 then 
                             -- backup
                             expiry = GetTime() + duration 
                         end
                         unstablePlayers[name] = expiry
                    end
                    -- Arcane Overload
                    if string.find(buffName, "奥术") and (string.find(buffName, "过载") or string.find(buffName, "超载")) then
                         if not overloadPlayers[name] or overloadPlayers[name] < GetTime() then
                             overloadPlayers[name] = GetTime() + 15 
                             if self.db.profile.arcaneoverload then
                                self:Sync(syncName.arcaneOverload .. " " .. name)
                             end
                         end
                    end
                    -- Arcane Dampening
                    if string.find(buffName, "奥术") and string.find(buffName, "抑制") then
                         dampeningPlayers[name] = GetTime() + 45 -- Keep it alive
                    end
                end
            end
        end
    end
end

function module:AfflictionEvent(msg)
	-- Arcane Overload
	if string.find(msg, L["trigger_arcaneOverloadYou"]) then
		self:Sync(syncName.arcaneOverload .. " " .. UnitName("player"))
		overloadPlayers[UnitName("player")] = GetTime() + 15
	elseif string.find(msg, L["trigger_arcaneOverloadOther"]) then
		local _, _, name = string.find(msg, L["trigger_arcaneOverloadOther"])
		if name then
			self:Sync(syncName.arcaneOverload .. " " .. name)
			overloadPlayers[name] = GetTime() + 15
		end
	elseif L["trigger_arcaneOverloadOther2"] and string.find(msg, L["trigger_arcaneOverloadOther2"]) then
		local _, _, name = string.find(msg, L["trigger_arcaneOverloadOther2"])
		if name then
			self:Sync(syncName.arcaneOverload .. " " .. name)
			overloadPlayers[name] = GetTime() + 15
		end
	end

	-- Arcane Prison
	local _, _, player = string.find(msg, L["trigger_arcanePrison"])
	if player then
		self:Sync(syncName.arcanePrison .. " " .. player)
	end

	-- Manabound Strikes
	local _, _, player, count = string.find(msg, L["trigger_manaboundStrike"])
	if player and count then
		self:Sync(syncName.manaboundStrike .. " " .. player .. " " .. count)
	end

	-- Arcane Dampening
	if string.find(msg, L["trigger_arcaneDampening"]) then
		local _, _, name = string.find(msg, L["trigger_arcaneDampening"])
		if name then
			self:Sync(syncName.arcaneDampening .. " " .. name)
			dampeningPlayers[name] = GetTime() + 45
		end
	elseif L["trigger_arcaneDampening2"] and string.find(msg, L["trigger_arcaneDampening2"]) then
		local _, _, name = string.find(msg, L["trigger_arcaneDampening2"])
		if name then
			self:Sync(syncName.arcaneDampening .. " " .. name)
			dampeningPlayers[name] = GetTime() + 45
		end
	end


end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	local _, _, player = string.find(msg, L["trigger_manaboundFade"])
	if player then
		self:Sync(syncName.manaboundStrikeFade .. " " .. player)
	end

	-- Arcane Dampening faded
	local _, _, player = string.find(msg, L["trigger_arcaneDampeningFade"])
	if player then
		self:Sync(syncName.arcaneDampeningFade .. " " .. player)
		-- Monitor Data
		dampeningPlayers[player] = nil
	end

	-- Unstable Magic faded
	local _, _, player = string.find(msg, L["trigger_unstableMagicFade"])
	if player then
		unstablePlayers[player] = nil
	end

	-- remove bar
	self:RemoveBar(L["bar_manaboundExpire"])
end

function module:CHAT_MSG_SPELL_AURA_GONE_PARTY(msg)
	local _, _, player = string.find(msg, L["trigger_manaboundFade"])
	if player then
		self:Sync(syncName.manaboundStrikeFade .. " " .. player)
	end

	-- Arcane Dampening faded
	local _, _, player = string.find(msg, L["trigger_arcaneDampeningFade"])
	if player then
		self:Sync(syncName.arcaneDampeningFade .. " " .. player)
		-- Monitor Data
		dampeningPlayers[player] = nil
	end
	
	-- Unstable Magic faded
	local _, _, player = string.find(msg, L["trigger_unstableMagicFade"])
	if player then
		unstablePlayers[player] = nil
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	local _, _, player = string.find(msg, L["trigger_manaboundFade"])
	if player then
		self:Sync(syncName.manaboundStrikeFade .. " " .. player)
	end

	-- Arcane Dampening faded
	local _, _, player = string.find(msg, L["trigger_arcaneDampeningFade"])
	if player then
		self:Sync(syncName.arcaneDampeningFade .. " " .. player)
		-- Monitor Data
		dampeningPlayers[player] = nil
	end
	
	-- Unstable Magic faded
	local _, _, player = string.find(msg, L["trigger_unstableMagicFade"])
	if player then
		unstablePlayers[player] = nil
	end
end

function module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
	-- Remove raid marker when a player dies
	local _, _, player = string.find(msg, "(.+)死亡了")
	if player and self.db.profile.markdampenedplayers and dampenedPlayers[player] then
		self:RemoveDampenedPlayerMark(player)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.arcaneOverload and rest then
		self:ArcaneOverload(rest)
	elseif sync == syncName.arcanePrison and rest then
		self:ArcanePrison(rest)
	elseif string.find(sync, syncName.manaboundStrike) and rest then
		local _, _, player, count = string.find(rest, "([^%s]+)(%d+)")
		if player and count then
			self:ManaboundStrike(player, count)
		end
	elseif sync == syncName.manaboundStrikeFade and rest then
		self:ManaboundStrikeFade(rest)
	elseif sync == syncName.arcaneDampening and rest then
		self:ArcaneDampening(rest)
	elseif sync == syncName.arcaneDampeningFade and rest then
		self:ArcaneDampeningFade(rest)
	end
end

function module:ArcaneOverload(player)
	arcaneOverloadCount = arcaneOverloadCount + 1

	-- Calculate next timer (minimum 7 seconds)
	local nextTimer = timer.arcaneOverload[arcaneOverloadCount] or timer.minArcaneOverload

	if self.db.profile.arcaneoverload then
		if player == UnitName("player") then
			self:Message(L["msg_arcaneOverloadYou"], "Important", true, "Alarm")
			self:WarningSign(icon.arcaneOverload, 5, true, "你是炸弹！")
			-- Add personal explosion bar with red color
			self:Bar(L["bar_arcaneOverloadExplosion"], timer.arcaneOverloadExplosion, icon.arcaneOverload, true, "red")
			-- Monitor Data
			overloadPlayers[player] = GetTime() + 15
		else
			self:Message(string.format(L["msg_arcaneOverloadOther"], player), "Important")

			if IsRaidLeader() or IsRaidOfficer() then
				for i = 1, GetNumRaidMembers() do
					if UnitName("raid" .. i) == player then
						SetRaidTarget("raid" .. i, 7)
					end
				end
			end
            -- Monitor Data (Sync Fallback)
            if not overloadPlayers[player] or overloadPlayers[player] < GetTime() then
                overloadPlayers[player] = GetTime() + 15
            end
		end

		self:RemoveBar(L["bar_arcaneOverload"])
		self:Bar(L["bar_arcaneOverload"], nextTimer, icon.arcaneOverload)
	end
end

function module:ArcanePrison(player)
	if self.db.profile.arcaneprison then
		self:Message(string.format(L["msg_arcanePrison"], player), "Attention")
	end
end

function module:ManaboundStrike(player, count)
	if tonumber(count) then
		-- Update or add player to tracking table
		manaboundStrikesPlayers[player] = {
			count = tonumber(count),
			expires = GetTime() + timer.manaboundDuration
		}

		-- Only show bar for the player's own debuff
		if player == UnitName("player") and self.db.profile.manaboundstrike then
			self:RemoveBar(L["bar_manaboundExpire"])
			self:Bar(L["bar_manaboundExpire"], timer.manaboundDuration, icon.manaboundExpire)
		end

	end
end

function module:ManaboundStrikeFade(player)
	-- Remove player from tracking table
	if manaboundStrikesPlayers[player] then
		manaboundStrikesPlayers[player] = nil

		-- Only remove the player's own bar
		if player == UnitName("player") then
			self:RemoveBar(L["bar_manaboundExpire"])
		end

	end
end

function module:ArcaneDampening(player)
	if self.db.profile.markdampenedplayers and (IsRaidLeader() or IsRaidOfficer()) then
		dampenedPlayers[player] = true
		self:MarkDampenedPlayer(player)
	end
	-- Add bar for the player with Arcane Dampening
	-- if player == UnitName("player") then
	-- 	self:Bar("Arcane Dampening - Can Soak", timer.arcaneDampening, icon.arcaneDampening)
	-- end
end

function module:ArcaneDampeningFade(player)
	if self.db.profile.markdampenedplayers and dampenedPlayers[player] then
		self:RemoveDampenedPlayerMark(player)
	end

	-- Remove the bar if it's the player
	-- if player == UnitName("player") then
	-- 	self:RemoveBar("Arcane Dampening - Can Soak")
	-- end
end

function module:MarkDampenedPlayer(player)
	if not (IsRaidLeader() or IsRaidOfficer()) then
		return
	end

	local playerUnit = nil
	for i = 1, GetNumRaidMembers() do
		if UnitName("raid" .. i) == player then
			playerUnit = "raid" .. i
			break
		end
	end

	if not playerUnit then
		return
	end

	-- Find next available raid mark (don't use skull/8)
	local usedMarks = {}
	for i = 1, GetNumRaidMembers() do
		local mark = GetRaidTargetIndex("raid" .. i)
		if mark then
			usedMarks[mark] = true
		end
	end

	for i = 1, 7 do
		if not usedMarks[i] then
			SetRaidTarget(playerUnit, i)
			dampenedPlayers[player] = i -- Store which mark was used
			break
		end
	end
end

function module:RemoveDampenedPlayerMark(player)
	if not (IsRaidLeader() or IsRaidOfficer()) then
		return
	end

	for i = 1, GetNumRaidMembers() do
		if UnitName("raid" .. i) == player then
			SetRaidTarget("raid" .. i, 0)
			break
		end
	end

	dampenedPlayers[player] = nil
end

function module:Test()
	-- Initialize module state
	self:OnSetup()
	self:OnEngage()

	local events = {
		-- Arcane Overload events
		{ time = 5, func = function()
			print("Test: Player gets Arcane Overload")
			module:AfflictionEvent("Player1 is afflicted by Arcane Overload")
		end },
		{ time = 15, func = function()
			print("Test: You get Arcane Overload")
			module:AfflictionEvent("You are afflicted by Arcane Overload")
		end },

		-- Arcane Prison event
		{ time = 10, func = function()
			print("Test: Player gets Arcane Prison")
			module:AfflictionEvent("Player3 is afflicted by Arcane Prison")
		end },

		-- Arcane Dampening events
		{ time = 12, func = function()
			print("Test: Tankeboy gets Arcane Dampening")
			module:AfflictionEvent("Tankeboy is afflicted by Arcane Dampening")
		end },
		{ time = 16, func = function()
			print("Test: Pepopo gets Arcane Dampening")
			module:AfflictionEvent("Pepopo is afflicted by Arcane Dampening")
		end },
		{ time = 22, func = function()
			print("Test: Arcane Dampening fades from Pepopo")
			module:CHAT_MSG_SPELL_AURA_GONE_PARTY("Arcane Dampening fades from Pepopo")
		end },
		{ time = 25, func = function()
			print("Test: Pepopo gets Arcane Dampening")
			module:AfflictionEvent("Pepopo is afflicted by Arcane Dampening")
		end },
		{ time = 28, func = function()
			print("Test: Pepopo dies")
			module:CHAT_MSG_COMBAT_FRIENDLY_DEATH("Pepopo dies")
		end },

		-- Manabound Strikes events
		{ time = 3, func = function()
			print("Test: Player1 gets Manabound Strikes (1)")
			module:AfflictionEvent("Player1 is afflicted by Manabound Strikes (1)")
		end },
		{ time = 8, func = function()
			print("Test: Player2 gets Manabound Strikes (1)")
			module:AfflictionEvent("Player2 is afflicted by Manabound Strikes (1)")
		end },
		{ time = 13, func = function()
			print("Test: Player1 gets Manabound Strikes (2)")
			module:AfflictionEvent("Player1 is afflicted by Manabound Strikes (2)")
		end },
		{ time = 18, func = function()
			print("Test: Player3 gets Manabound Strikes (1)")
			module:AfflictionEvent("Player3 is afflicted by Manabound Strikes (1)")
		end },
		{ time = 20, func = function()
			print("Test: Player2 gets Manabound Strikes (2)")
			module:AfflictionEvent("Player2 is afflicted by Manabound Strikes (2)")
		end },
		{ time = 25, func = function()
			print("Test: Player3 gets Manabound Strikes (2)")
			module:AfflictionEvent("Player3 is afflicted by Manabound Strikes (2)")
		end },
		{ time = 30, func = function()
			print("Test: Player1 gets Manabound Strikes (3)")
			module:AfflictionEvent("Player1 is afflicted by Manabound Strikes (3)")
		end },
		{ time = 35, func = function()
			print("Test: Player2 gets Manabound Strikes (3)")
			module:AfflictionEvent("Player2 is afflicted by Manabound Strikes (3)")
		end },
		{ time = 40, func = function()
			print("Test: Player3 gets Manabound Strikes (3)")
			module:AfflictionEvent("Player3 is afflicted by Manabound Strikes (3)")
		end },
		{ time = 45, func = function()
			print("Test: Player4 gets Manabound Strikes (1)")
			module:AfflictionEvent("Player4 is afflicted by Manabound Strikes (1)")
		end },
		{ time = 50, func = function()
			print("Test: Player1 gets Manabound Strikes (4)")
			module:AfflictionEvent("Player1 is afflicted by Manabound Strikes (4)")
		end },
		{ time = 53, func = function()
			print("Test: You get Manabound Strikes (7)")
			local playerName = UnitName("player")
			module:AfflictionEvent(playerName .. " is afflicted by Manabound Strikes (7)")
		end },
		{ time = 70, func = function()
			print("Test: Manabound Strikes fades from Player2")
			module:CHAT_MSG_SPELL_AURA_GONE_PARTY("Manabound Strikes fades from Player2")
		end },
		{ time = 75, func = function()
			print("Test: Manabound Strikes fades from Pepopo")
			module:CHAT_MSG_SPELL_AURA_GONE_PARTY("Manabound Strikes fades from Pepopo")
		end },
		{ time = 80, func = function()
			print("Test: Disengage")
			-- Monitor Cleanup
			if self.db.profile.custommonitor then
				self:ToggleMonitor(false)
			end
			module:OnDisengage()
		end },
	}

	-- Schedule each event at its absolute time
	for i, event in ipairs(events) do
		self:ScheduleEvent("AnomalusTest" .. i, event.func, event.time)
	end

	self:Message("Anomalus test started", "Positive")
	
	-- Test Monitor
	if self.db.profile.custommonitor then
		self:CreateMonitorFrame()
		self:ToggleMonitor(true)
		overloadPlayers["TestPlayer1"] = GetTime() + 12
		dampeningPlayers["TestPlayer2"] = GetTime() + 35
		unstablePlayers["TestPlayer3"] = true -- Should be Red
		unstablePlayers["TestPlayer2"] = true -- Should be White (has dampening)
	end

	return true
end

-- Test command:
-- /run local m=BigWigs:GetModule("Anomalus"); BigWigs:SetupModule("Anomalus");m:Test();

-----------------------------------------------------------------------
-- Monitor UI
-----------------------------------------------------------------------

function module:CreateMonitorFrame()
	if monitorFrame then return end

	local f = CreateFrame("Frame", "BigWigsAnomalusMonitor", UIParent)
	f:SetWidth(450)
	f:SetHeight(200)
	
	local x = module.db.profile.monitorposx or 0
	local y = module.db.profile.monitorposy or 0
	f:SetPoint("CENTER", UIParent, "CENTER", x, y)
	
	f:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
		edgeFile = "Interface\\AddOns\\BigWigs\\Textures\\otravi-border", edgeSize = 16,
		insets = {left = 4, right = 4, top = 4, bottom = 4},
	})
	f:SetBackdropColor(0,0,0,0.8)
	f:SetBackdropBorderColor(1,1,1,1)
	f:EnableMouse(true)
	f:SetMovable(true)
	f:RegisterForDrag("LeftButton")
	f:SetScript("OnDragStart", function() this:StartMoving() end)
	f:SetScript("OnDragStop", function()
		this:StopMovingOrSizing()
		local x, y = this:GetCenter()
		local ux, uy = UIParent:GetCenter()
		module.db.profile.monitorposx = x - ux
		module.db.profile.monitorposy = y - uy
	end)
	f:SetScript("OnUpdate", function() module:UpdateMonitorFrame() end)

	-- Title
	local title = f:CreateFontString(nil, "OVERLAY")
	title:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
	title:SetPoint("TOP", f, "TOP", 0, -10)
	title:SetText(L["custommonitor_name"])
	f.title = title

	-- Close Button
	local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -5, -5)
	close:SetScript("OnClick", function() module:ToggleMonitor(false) end)

	-- Headers
	local h1 = f:CreateFontString(nil, "OVERLAY")
	h1:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
	h1:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -35)
	h1:SetWidth(140)
	h1:SetJustifyH("LEFT")
	h1:SetText(L["monitor_header_unstable"])
	h1:SetTextColor(1, 0.8, 0)

	local h2 = f:CreateFontString(nil, "OVERLAY")
	h2:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
	h2:SetPoint("TOPLEFT", f, "TOPLEFT", 160, -35)
	h2:SetWidth(140)
	h2:SetJustifyH("LEFT")
	h2:SetText(L["monitor_header_dampening"])
	h2:SetTextColor(0, 0.8, 1)

	local h3 = f:CreateFontString(nil, "OVERLAY")
	h3:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
	h3:SetPoint("TOPLEFT", f, "TOPLEFT", 310, -35)
	h3:SetWidth(130)
	h3:SetJustifyH("LEFT")
	h3:SetText(L["monitor_header_overload"])
	h3:SetTextColor(1, 0.2, 0.2)
	
	-- Content Text (Simple Multi-line FontStrings)
	f.text1 = f:CreateFontString(nil, "OVERLAY")
	f.text1:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
	f.text1:SetPoint("TOPLEFT", h1, "BOTTOMLEFT", 0, -10)
	f.text1:SetWidth(140)
	f.text1:SetJustifyH("LEFT")


	f.text2 = f:CreateFontString(nil, "OVERLAY")
	f.text2:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
	f.text2:SetPoint("TOPLEFT", h2, "BOTTOMLEFT", 0, -10)
	f.text2:SetWidth(140)
	f.text2:SetJustifyH("LEFT")


	f.text3 = f:CreateFontString(nil, "OVERLAY")
	f.text3:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
	f.text3:SetPoint("TOPLEFT", h3, "BOTTOMLEFT", 0, -10)
	f.text3:SetWidth(130)
	f.text3:SetJustifyH("LEFT")


	monitorFrame = f
end

function module:ToggleMonitor(show)
	if not monitorFrame then return end
	if show then
		monitorFrame:Show()
	else
		monitorFrame:Hide()
	end
end

local lastUpdate = 0
function module:UpdateMonitorFrame()
	if not monitorFrame or not monitorFrame:IsVisible() then return end
	if GetTime() - lastUpdate < 0.5 then return end
	lastUpdate = GetTime()

	-- Sorting Helper
	local function sortTime(a, b)
		return a.time > b.time
	end

	-- 1. Dampening (Middle)
	local listDamp = {}
	for name, expire in pairs(dampeningPlayers) do
		local remain = expire - GetTime()
		if remain > 0 then
			table.insert(listDamp, {name = name, time = remain})
		else
			dampeningPlayers[name] = nil
		end
	end
	table.sort(listDamp, sortTime)
	
	-- 2. Overload (Right)
	local listOver = {}
	for name, expire in pairs(overloadPlayers) do
		local remain = expire - GetTime()
		if remain > 0 then
			table.insert(listOver, {name = name, time = remain})
		else
			overloadPlayers[name] = nil
		end
	end
	table.sort(listOver, sortTime)

	-- 3. Unstable (Left) - Check expiry
	local listUnstable = {}
	for name, expire in pairs(unstablePlayers) do
		if expire > GetTime() then
            local remain = expire - GetTime()
            -- If remain is very small (< 1.2), it implies we strictly rely on combat log refresh or it's just a keep-alive.
            -- If we got a real duration from API, remain will be accurate.
			table.insert(listUnstable, {name=name, time=remain})
		else
			unstablePlayers[name] = nil
		end
	end
    
    -- Sort unstable by time if we have it, otherwise alpha
    table.sort(listUnstable, function(a,b) return a.time < b.time end)

	-- Update Text 1 (Unstable)
	local t1 = ""
	for _, u in ipairs(listUnstable) do
		-- Check if they have Dampening (protection)
		local safe = false
		for _, d in ipairs(listDamp) do
			if d.name == u.name then safe = true break end
		end
        
        local timeStr = ""
        if u.time > 2 then -- Only show time if it's a "real" duration (>2s), not a scanner refresh flicker
            timeStr = string.format(" %ds", u.time)
        end
		
		if safe then
			t1 = t1 .. "|cffffffff" .. u.name .. timeStr .. "|r\n"
		else
			t1 = t1 .. "|cffff0000" .. u.name .. timeStr .. "|r\n"
		end
	end
	monitorFrame.text1:SetText(t1)

	-- Update Text 2 (Dampening)
	local t2 = ""
	for _, d in ipairs(listDamp) do
		t2 = t2 .. string.format("%s  %d\n", d.name, d.time)
	end
	monitorFrame.text2:SetText(t2)

	-- Update Text 3 (Overload)
	local t3 = ""
	for _, o in ipairs(listOver) do
		t3 = t3 .. string.format("%s  %d\n", o.name, o.time)
	end
	monitorFrame.text3:SetText(t3)
	
	-- Auto resize height based on content? Optional.
end
