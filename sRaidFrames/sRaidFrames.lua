local L = AceLibrary("AceLocale-2.2"):new("sRaidFrames")
local BS = AceLibrary("Babble-Spell-2.2")
local Compost = AceLibrary("Compost-2.0")
local Banzai = AceLibrary:HasInstance("Banzai-1.0") and AceLibrary("Banzai-1.0") or nil
local HealComm = AceLibrary("HealComm-1.0")

--local proximity = ProximityLib:GetInstance("1")
local surface = AceLibrary("Surface-1.0")
local roster = AceLibrary("RosterLib-2.0")

surface:Register("Otravi", "Interface\\AddOns\\sRaidFrames\\textures\\otravi")
surface:Register("Smooth", "Interface\\AddOns\\sRaidFrames\\textures\\smooth")
surface:Register("Striped", "Interface\\AddOns\\sRaidFrames\\textures\\striped")
surface:Register("BantoBar", "Interface\\AddOns\\sRaidFrames\\textures\\bantobar")
surface:Register("Gradient", "Interface\\AddOns\\sRaidFrames\\textures\\gradient32x32")
surface:Register("RenaitreMinion", "Interface\\AddOns\\sRaidFrames\\textures\\RenaitreMinion.tga")
surface:Register("Smelly", "Interface\\AddOns\\sRaidFrames\\textures\\Smelly.tga")
surface:Register("Minimalist", "Interface\\AddOns\\sRaidFrames\\textures\\Minimalist.tga")
surface:Register("HiContrast", "Interface\\AddOns\\sRaidFrames\\textures\\bar15.tga")
surface:Register("LiteStepLite", "Interface\\AddOns\\sRaidFrames\\textures\\LiteStepLite")
surface:Register("Aluminium", "Interface\\AddOns\\sRaidFrames\\textures\\Aluminium")
surface:Register("DarkBottom", "Interface\\AddOns\\sRaidFrames\\textures\\DarkBottom")
surface:Register("Progressbar", "Interface\\AddOns\\sRaidFrames\\textures\\progressbar.tga")
surface:Register("Flat", "Interface\\AddOns\\sRaidFrames\\textures\\bar17.tga")
surface:Register("Club", "Interface\\AddOns\\sRaidFrames\\textures\\bar5.tga")
--surface:Register("Bumps", "Interface\\AddOns\\sRaidFrames\\textures\\Bumps")
--surface:Register("Button", "Interface\\AddOns\\sRaidFrames\\textures\\Button")
surface:Register("Cloud", "Interface\\AddOns\\sRaidFrames\\textures\\Insomniax_Bar_1f.tga")
surface:Register("Diagonal", "Interface\\AddOns\\sRaidFrames\\textures\\Diagonal")
surface:Register("Fifths", "Interface\\AddOns\\sRaidFrames\\textures\\Fifths")
surface:Register("Fourths", "Interface\\AddOns\\sRaidFrames\\textures\\Fourths")
surface:Register("Gloss", "Interface\\AddOns\\sRaidFrames\\textures\\Gloss")
surface:Register("Hatched", "Interface\\AddOns\\sRaidFrames\\textures\\Hatched")
surface:Register("Paint", "Interface\\AddOns\\sRaidFrames\\textures\\Paint")
surface:Register("Skewed", "Interface\\AddOns\\sRaidFrames\\textures\\Skewed")
surface:Register("Water", "Interface\\AddOns\\sRaidFrames\\textures\\Insomniax_Bar_1e.tga")
surface:Register("Charcoal", "Interface\\AddOns\\sRaidFrames\\textures\\normTex.tga")
surface:Register("Glaze", "Interface\\AddOns\\sRaidFrames\\textures\\glaze")
--surface:Register("Metal", "Interface\\AddOns\\sRaidFrames\\textures\\BEB-BarFill-Metal")
surface:Register("Wood", "Interface\\AddOns\\sRaidFrames\\textures\\BEB-BarFill-Wood")
surface:Register("Rupture", "Interface\\AddOns\\sRaidFrames\\textures\\Insomniax_Bar_1d.tga")
--surface:Register("Highlight", "Interface\\AddOns\\sRaidFrames\\textures\\debuffHighlight")
--surface:Register("TukuiBar", "Interface\\AddOns\\sRaidFrames\\textures\\tukuibar")
surface:Register("Blur", "Interface\\AddOns\\sRaidFrames\\textures\\bar1.tga")
surface:Register("VuhDo", "Interface\\AddOns\\sRaidFrames\\textures\\bar3.tga")
--surface:Register("Force", "Interface\\AddOns\\sRaidFrames\\textures\\bar8.tga")
--surface:Register("CoffeShop", "Interface\\AddOns\\sRaidFrames\\textures\\bar13.tga")
--surface:Register("Toxic", "Interface\\AddOns\\sRaidFrames\\textures\\bar14.tga")
--surface:Register("Tube", "Interface\\AddOns\\sRaidFrames\\textures\\Tube.tga")
surface:Register("Stoned", "Interface\\AddOns\\sRaidFrames\\textures\\metal.tga")
--surface:Register("Glow", "Interface\\AddOns\\sRaidFrames\\textures\\glowTex.tga")
surface:Register("Discord", "Interface\\AddOns\\sRaidFrames\\textures\\Insomniax_Bar_2a.tga")
surface:Register("Neal", "Interface\\AddOns\\sRaidFrames\\textures\\Neal.blp")
surface:Register("Ruben", "Interface\\AddOns\\sRaidFrames\\textures\\Ruben.tga")
surface:Register("Orient", "Interface\\AddOns\\sRaidFrames\\textures\\Orient.tga")
surface:Register("Ghost", "Interface\\AddOns\\sRaidFrames\\textures\\Ghost.tga")
surface:Register("Acid", "Interface\\AddOns\\sRaidFrames\\textures\\Insomniax_Bar_1b.tga")
surface:Register("Insomniac", "Interface\\AddOns\\sRaidFrames\\textures\\Insomniax_Bar_1a.tga")

local math_mod = math.fmod or math.mod

sRaidFrames = AceLibrary("AceAddon-2.0"):new(
	"AceDB-2.0",
	"AceEvent-2.0",
	"AceConsole-2.0",
	"FuBarPlugin-2.0",
	"AceModuleCore-2.0",
	"AceHook-2.0"
)

-- Look I'm a fubar plugin!!
sRaidFrames.hasIcon = "Interface\\Icons\\INV_Helmet_06"
sRaidFrames.defaultMinimapPosition = 180
sRaidFrames.cannotDetachTooltip = true
sRaidFrames.hasNoColor = true
sRaidFrames.clickableTooltip = false
sRaidFrames.hideWithoutStandby = false
sRaidFrames.independentProfile = true
sRaidFrames.TargetMonitor = nil
sRaidFrames.TargetMonitorEnd = nil
sRaidFrames.TargetMonitorManual = nil
sRaidFrames.TargetMonitorCycleName = nil
sRaidFrames.UpdateTargetIndex = {}


sRaidFrames.FocusWithRange = false
sRaidFrames.ClassCheck = false
sRaidFrames.SpellCheck = false
sRaidFrames.MenuOpen = false
sRaidFrames.MapEnable = false
sRaidFrames.MultidragInfo = false
sRaidFrames.BuffsDebuffsInfo = false
sRaidFrames.PopulateFocusInfo = false

sRaidFrames.debuffSlots = {}
sRaidFrames.buffsupdatecounter = 0
sRaidFrames.JoiningWorld = 0
sRaidFrames.NextScan = 0
sRaidFrames.MapScale = 0

-- 动态unitId映射系统
sRaidFrames.dynamicUnitIds = {}  -- 存储u1到u40对应的实际unitId
sRaidFrames.currentGroupType = "none"  -- 当前组队类型: "solo", "party", "raid"

sRaidFrames.ArrowsDisable = false

-- 增加unitxp模组加载判断
local r1, r2 = pcall(UnitXP, "nop", "nop")
sRaidFrames.unitxp = (r1 == true and r2 == true)
local DEFAULT_BORDER_EDGE_SIZE = 16
local DEFAULT_BORDER_INSET = 5
local AGGRO_BORDER_EDGE_SIZE = 24
local AGGRO_BORDER_INSET = 7
local baseAggroBorderColor = { 1, 0, 0 }
local baseCombatBorderColor = { 1, 0.45, 0.05 }
local debuffAuraOptionMap = {
	Curse = "debuff_aura_curse",
	Magic = "debuff_aura_magic",
	Disease = "debuff_aura_disease",
	Poison = "debuff_aura_poison",
}
local function getBorderAlpha()
	if sRaidFrames.opt and sRaidFrames.opt.BorderColor and sRaidFrames.opt.BorderColor.a ~= nil then
		return sRaidFrames.opt.BorderColor.a
	end

	return 1
end

local function getCombatBorderColor()
	baseCombatBorderColor[4] = getBorderAlpha()
	return baseCombatBorderColor
end


--sRaidFrames.ClassSpellArray = {Paladin = "Holy Light", Priest = "Flash Heal", Druid = "Healing Touch", Shaman = "Healing Wave"}
if BS then
	sRaidFrames.ClassSpellArray = {Paladin = BS["Holy Light"], Priest = BS["Flash Heal"], Druid = BS["Healing Touch"], Shaman = BS["Healing Wave"]}
else
	sRaidFrames.ClassSpellArray = {Paladin = "Holy Light", Priest = "Flash Heal", Druid = "Healing Touch", Shaman = "Healing Wave"}
end

function sRaidFrames:OnInitialize()
    self:RegisterDB("sRaidFramesDB")
    self:Variables()

    sRaidFrames.UnitRangeFocus = (Compost and Compost.Acquire and Compost:Acquire()) or {}
    sRaidFrames.ExtendedRangeScan = (Compost and Compost.Acquire and Compost:Acquire()) or {}

    self:RegisterDefaults("profile", {
        lock                = false,
        SortBy              = "group",
        healthDisplayType   = 'curmax',
        Invert = false,
        Scale               = 0.95,
        Width               = 65,
        ScaleFocus          = 0.95,
        WidthFocus          = 65,
        Width_OLD           = 65,
        Border              = true,
        Texture             = "Smooth",
        BuffType            = "buffsanddebuffs",
        ShowOnlyDispellable = nil,
        BackgroundColor     = {r = 0.3, g = 0.3, b = 0.3, a = 0.7},
        BorderColor         = {r = 1, g = 1, b = 1, a = 1},
        Growth              = "down",
        Spacing             = -5,
        ShowGroupTitles     = true,
        SubSort             = "none",
        TooltipMethod       = "notincombat",
        ClassFilter         = {["WARRIOR"] = true, ["PALADIN"] = true, ["SHAMAN"] = true, ["HUNTER"] = true, ["WARLOCK"] = true, ["MAGE"] = true, ["DRUID"] = true, ["ROGUE"] = true, ["PRIEST"] = true},
        GroupFilter         = {true, true, true, true, true, true, true, true},
        BuffFilter          = {},
        DebuffFilter        = {},
        PowerFilter         = {[0] = true,[1] = true,[2] = true,[3] = true},
        aggro               = true,
        red                 = true,
        redbar              = false,
        aggro_aura          = false,
        combat_border       = true,
        RangeCheck          = false,
        ExtendedRangeCheck  = false,
        ExtendedRangeCheckCombat = false,
        fixed_count         = 5,
        RangeFrequency      = 0.20,
        AccurateRangeFactor = 0.05,
        RangeAlpha          = 0.2,
        buff_size           = 15,
        srfhideparty        = true,
        lock_focus          = false,
        ShowGroupTitles_Focus = true,
        dead_sort           = false,
        fill_range          = false,
        hp_limit            = 100,
        units_limit         = 10,
        Growth_Focus        = "down",
        show_txt_buff       = false,
        targeting           = true,
        statusbar_color     = true,
        unitname_color      = true,
        unit_debuff_aura    = false,
        debuff_aura_curse   = true,
        debuff_aura_magic   = true,
        debuff_aura_disease = true,
        debuff_aura_poison  = true,
        self_targeting      = true,
        buff_slots          = 2,
        Buff_Growth         = "vertical",
        Buff_Anchor         = "topright",
        Bordertexture       = "Interface\\Addons\\sRaidFrames\\borders\\UI-Tooltip-Border_Grid.tga",
        heal                = "round",
        RangeShow           = false,
        FocusRangeShow      = false,
        ArrowsEnable        = true,
        WSG_Focus           = false,
        raidmarker_size     = 16,
        raidmarker_onable   = true,
        raidMarkerAlpha     = 0.5,
        showInParty         = false,
        showInSolo          = false,
    })

    self:RegisterChatCommand({"/srf", "/sraidframes"}, self.options)

    self.opt = self.db.profile

    self.OnMenuRequest = self.options

    self.master = CreateFrame("Frame", "sRaidFrame", UIParent)
    self.master:SetMovable(true)
    self.master:SetScale(self.opt.Scale)

    self.master:SetHeight(200);
    self.master:SetWidth(200);

    self.tooltip = CreateFrame("GameTooltip", "sRaidFramesTooltip", WorldFrame, "GameTooltipTemplate")
    self.tooltip:SetOwner(WorldFrame, "ANCHOR_NONE");
    --self.tooltip:SetOwner(WorldFrame, "ANCHOR_TOPRIGHT", 0,0);

    self.master:Hide()

    --self:LoadProfile()

    for i = 1, MAX_RAID_MEMBERS do
        sRaidFrames.debuffSlots["raid"..i] = 0
        self:CreateUnitFrame(i)
    end

    for i = 1, 9 do
        self:CreateGroupFrame(i)
    end

    for i = 1, MAX_RAID_MEMBERS do
        self.UnitSortOrder[i] = 0
    end

    if WatchDog_OnClick then
        sRaidFramesCustomOnClickFunction = WatchDog_OnClick
    elseif JC_OnClick then
        sRaidFramesCustomOnClickFunction = JC_OnClick
    elseif CT_RA_CustomOnClickFunction then
        sRaidFramesCustomOnClickFunction = CT_RA_CustomOnClickFunction
    end

    --==Added by Ogrisch
    self:Hook("TargetFrame_OnEvent")
    self:Hook("TargetFrame_OnShow")
    self:Hook("TargetFrame_OnHide")

    Zorlen_MakeFirstMacros = nil
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ffff团队框架 已加载|r")
end

function sRaidFrames:OnProfileEnable()
	self.opt = self.db.profile
end

function sRaidFrames:OnEnable()
	self:PatchUpdate()

	self:SetPosition()

	self:chatUpdateDebuffMenu()
	self:chatUpdateBuffMenu()
	sRaidFrames:UpdateRaidMarkers()
	self:RegisterBucketEvent("RAID_ROSTER_UPDATE", 0.1, "UpdateRoster")
	self:RegisterBucketEvent("PLAYER_ENTERING_WORLD",1.5)
	self:RegisterBucketEvent("PARTY_MEMBERS_CHANGED", 0.01, "UpdateRoster");

	-- 注册团队标记更新事件
    self:RegisterEvent("RAID_TARGET_UPDATE", "UpdateRaidMarkers")

	self:UpdateRoster()

	Zorlen_MakeFirstMacros = nil


	--HOOKS--

	if LunaUnitFrames then
		LunaUnitFrames.UpdateTargetFrameOld = LunaUnitFrames.UpdateTargetFrame
		LunaUnitFrames.UpdateTargetFrame = self.Luna_Target_Hook
	end

	if aUF then
		aUF.PLAYER_TARGET_CHANGED_OLD = aUF.PLAYER_TARGET_CHANGED
		aUF.PLAYER_TARGET_CHANGED = self.ag_PLAYER_TARGET_CHANGED_Hook
	end

	if XPerl_Frame_FindID then
		XPerl_Target_UpdateDisplay_OLD = XPerl_Target_UpdateDisplay
		XPerl_Target_UpdateDisplay = self.XPerl_Target_UpdateDisplay_Hook

		XPerl_Target_UpdatePortrait_OLD = XPerl_Target_UpdatePortrait
		XPerl_Target_UpdatePortrait = self.XPerl_Target_UpdatePortrait_Hook

		--XPerl_Target_CombatFlash_OLD = XPerl_Target_CombatFlash
		--XPerl_Target_CombatFlash = self.XPerl_Target_CombatFlash_Hook

	end
end

function sRaidFrames:PatchUpdate()
	if not self.opt.DebuffFilter then
		self.opt.DebuffFilter = {}
	end
	if not self.opt.heal then
		self.opt.heal = "none"
	end
	if self.opt.unit_debuff_aura == nil then
		self.opt.unit_debuff_aura = false
	end
	if self.opt.combat_border == nil then
		self.opt.combat_border = true
	end
	if self.opt.debuff_aura_curse == nil then
		self.opt.debuff_aura_curse = true
	end
	if self.opt.debuff_aura_magic == nil then
		self.opt.debuff_aura_magic = true
	end
	if self.opt.debuff_aura_disease == nil then
		self.opt.debuff_aura_disease = true
	end
	if self.opt.debuff_aura_poison == nil then
		self.opt.debuff_aura_poison = true
	end

	--patch 1.1
	self.opt.fill_range = false
	self.opt.dynamic_sort = false
	self.opt.dynamic_range_sort = false
	self.opt.dynamic_overheal_sort = false
	self.opt.dynamic_aggro_sort = false
end


function sRaidFrames:XPerl_Target_UpdateDisplay_Hook()
	if not sRaidFrames.TargetMonitor then
		--DEFAULT_CHAT_FRAME:AddMessage("XPerl_Target_UpdateDisplay_Hook")
		XPerl_Target_UpdateDisplay_OLD()
		sRaidFrames.UpdateTargetIndex[1] = true
	end
end

function sRaidFrames:XPerl_Target_UpdatePortrait_Hook()
	if not sRaidFrames.TargetMonitor then
		--DEFAULT_CHAT_FRAME:AddMessage("XPerl_Target_UpdatePortrait_Hook")
		XPerl_Target_UpdatePortrait_OLD()
		sRaidFrames.UpdateTargetIndex[1] = true
	end
end

function sRaidFrames:Luna_Target_Hook()
	if not sRaidFrames.TargetMonitor then
		--DEFAULT_CHAT_FRAME:AddMessage("LunaUnitFrames:UpdateTargetFrameOld")
		LunaUnitFrames:UpdateTargetFrameOld()
		sRaidFrames.UpdateTargetIndex[2] = true
	end
end

function sRaidFrames:ag_PLAYER_TARGET_CHANGED_Hook()
	if not sRaidFrames.TargetMonitor then
		--DEFAULT_CHAT_FRAME:AddMessage("aUF:PLAYER_TARGET_CHANGED_OLD")
		aUF:PLAYER_TARGET_CHANGED_OLD()
		sRaidFrames.UpdateTargetIndex[3] = true
	end
end

function sRaidFrames:TargetFrame_OnEvent(event)
	if not self.TargetMonitor then
		--DEFAULT_CHAT_FRAME:AddMessage("sRaidFrames:TargetFrame_OnEvent")
		self.hooks.TargetFrame_OnEvent.orig(event)
		sRaidFrames.UpdateTargetIndex[4] = true
	end
end

function sRaidFrames:TargetFrame_OnShow()
	--self.hooks.TargetFrame_OnShow.orig()
	--DEFAULT_CHAT_FRAME:AddMessage("TargetFrame_OnShow")
end

function sRaidFrames:TargetFrame_OnHide()
	--self.hooks.TargetFrame_OnHide.orig()
	--DEFAULT_CHAT_FRAME:AddMessage("TargetFrame_OnHide")
end

function sRaidFrames:OnDisable()
	if self.enabled then
		self:LeftRaid()
	else
		self.master:Hide()
	end

	if ShowPartyFrame then
		ShowPartyFrame()
	end
end

function sRaidFrames:JoinedRaid()
	--self:Print("Joined a raid, enabling raid frames")
	self.enabled = true
	self.carrier = nil

	self:RegisterBucketEvent("UNIT_HEALTH", 0.2, "UpdateUnit")
	self:RegisterBucketEvent("UNIT_AURA", 0.2, "UpdateBuffs")

	self:RegisterBucketEvent("ZONE_CHANGED_NEW_AREA", 1, "ZoneCheck")
	self:RegisterBucketEvent("PLAYER_UNGHOST", 1, "ZoneCheck")

	self:RegisterBucketEvent("PLAYER_REGEN_ENABLED", 2, "CombatEnds")
	self:RegisterBucketEvent("PLAYER_REGEN_DISABLED", 2, "CombatStarts")
	self:RegisterBucketEvent("PLAYER_DEAD", 2, "ResetHealIndicators")

	self:RegisterBucketEvent("PLAYER_TARGET_CHANGED", 0.01)

	self:RegisterEvent("Banzai_UnitGainedAggro")
	self:RegisterEvent("Banzai_UnitLostAggro")

	self:RegisterEvent("oRA_PlayerCanResurrect")
	self:RegisterEvent("oRA_PlayerResurrected")
	self:RegisterEvent("oRA_PlayerNotResurrected")
	self:RegisterEvent("HealComm_Ressupdate", "HealCommRez")


	self:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE", "TrackCarrier")
	self:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE", "TrackCarrier")

	-- TODO: only updateunit
	self:ScheduleRepeatingEvent("sRaidFramesSort_Force", self.Sort_Force, 0.5, self)
	if sRaidFrames.unitxp then
		self:ScheduleRepeatingEvent("sRaidFramesRangeCheck", self.RangeCheck, 0.5, self)
	else
		self:ScheduleRepeatingEvent("sRaidFramesRangeCheck", self.RangeCheck, self.opt.RangeFrequency, self)
	end


	self:ScheduleRepeatingEvent("sRaidFramesUpdateAllUnits", self.UpdateAllUnits, 1, self)
	self:ScheduleRepeatingEvent("sRaidFramesUpdateAllBuffs", self.UpdateAllBuffs, 0.33, self)

	self:UpdateRoster()

	self:UpdateAllUnits()
	self:UpdateAllBuffs()

	self.master:Show()
	self:ZoneCheck()
	self:UpdateParty()

end

function sRaidFrames:UpdateParty()
    local shouldHideParty = HidePartyFrame and self.opt and self.opt.srfhideparty and (
        self.currentGroupType == "raid"
        or (self.opt.showInParty and self.currentGroupType == "party")
    )

    if shouldHideParty then
        HidePartyFrame()
    elseif ShowPartyFrame and self.currentGroupType ~= "raid" then
        ShowPartyFrame()
    end
end

function sRaidFrames:ShouldEnableFrames(groupType)
    groupType = groupType or self:GetCurrentGroupType()

    if groupType == "raid" then
        return GetNumRaidMembers and GetNumRaidMembers() > 0
    elseif groupType == "party" then
        return GetNumPartyMembers and GetNumPartyMembers() > 0 and self.opt.showInParty == true
    elseif groupType == "solo" then
        return self.opt.showInSolo == true
    end

    return false
end

function sRaidFrames:PLAYER_ENTERING_WORLD()
	self.JoiningWorld = GetTime()
	-- 更新动态unitId映射
	if self.UpdateDynamicUnitIds then
		self:UpdateDynamicUnitIds()
	end

	-- 检查是否应该启用框架
	local groupType = self:GetCurrentGroupType()
	local shouldEnable = self:ShouldEnableFrames(groupType)

	if shouldEnable and not self.enabled then
		self:JoinedRaid();
	elseif not shouldEnable and self.enabled then
		self:LeftRaid()
	else
		self:UpdateParty()
	end
end

function sRaidFrames:PLAYER_TARGET_CHANGED()
	local skipp_blizz = nil
	--if not self.TargetMonitor then
	if self.TargetMonitorCycleName ~= GetUnitName("target") then
		self.TargetMonitorManual = true
	end

	if self.TargetMonitor and self.TargetMonitorEnd then
		self.TargetMonitorEnd = nil
		self.TargetMonitor = nil
	end

	-- 清除所有框架的self_targeting状态
	for unit, _ in pairs(self.self_targeting) do
		self.self_targeting[unit] = nil
	end

	-- 强制更新所有可见框架，确保颜色正确显示
	for unit, _ in pairs(self.visible) do
		if self.frames[unit] then
			self:UpdateUnit({[unit] = true})
		end
	end

	-- 避免选目标看上去有延迟
	self:UpdateAllUnits()
end

function sRaidFrames:UtilizeTarget()
	--if self.TargetMonitorCycleEnd then
		if self.TargetMonitorManual then
			self:DebugRange("____Target Changed Manually______")
			for blockindex,blockmatch in pairs(self.UpdateTargetIndex) do
				if blockindex == 1 then
				--DEFAULT_CHAT_FRAME:AddMessage("1")
					skipp_blizz = true
					XPerl_Target_UpdateDisplay_OLD()
					XPerl_Target_UpdatePortrait_OLD()

				elseif blockindex == 2 then
				--DEFAULT_CHAT_FRAME:AddMessage("2")
					skipp_blizz = true
					LunaUnitFrames:UpdateTargetFrameOld()

				elseif blockindex == 3 then
				--	DEFAULT_CHAT_FRAME:AddMessage("3")
					skipp_blizz = true
					aUF:PLAYER_TARGET_CHANGED_OLD()

				elseif blockindex == 4 and not skipp_blizz then
					if UnitExists("target") then
						--if TargetFrame and TargetFrame.name and TargetFrame.name:GetText() ~= GetUnitName("target") then
						--	DEFAULT_CHAT_FRAME:AddMessage("************BLIZZARD "..TargetFrame.name:GetText().." diff "..GetUnitName("target"))
						--end

						TargetFrame.name:SetText(UnitName("target"));
						SetPortraitTexture(TargetFrame.portrait, "target");
						UnitFrameHealthBar_Update(TargetFrame.healthbar, "target");
						UnitFrameManaBar_Update(TargetFrame.manabar, "target");
						UnitFrame_UpdateManaType();
						TargetFrame_CheckLevel();
						TargetFrame_CheckFaction();
						TargetFrame_CheckClassification();
						TargetFrame_CheckDead();
						TargetFrame:Show()
						--DEFAULT_CHAT_FRAME:AddMessage("4")
					else
						TargetFrame:Hide()
						--DEFAULT_CHAT_FRAME:AddMessage("2")
					end
				end
			end
			self.TargetMonitorManual = nil
		end
		--self.TargetMonitorCycleEnd = nil
	--end
end


function sRaidFrames:LeftRaid()
	--self:Print("Left raid, disabling raid frames")
	self.visible = {}
	self.enabled = false

	self:UnregisterBucketEvent("UNIT_HEALTH")
	self:UnregisterBucketEvent("UNIT_AURA")
	self:UnregisterBucketEvent("ZONE_CHANGED_NEW_AREA")
	self:UnregisterBucketEvent("PLAYER_UNGHOST")
	self:UnregisterBucketEvent("PLAYER_REGEN_ENABLED")
	self:UnregisterBucketEvent("PLAYER_REGEN_DISABLED")
	self:UnregisterBucketEvent("PLAYER_DEAD")
	self:UnregisterBucketEvent("PLAYER_TARGET_CHANGED")

	self:UnregisterEvent("Banzai_UnitGainedAggro")
	self:UnregisterEvent("Banzai_UnitLostAggro")

	self:UnregisterEvent("oRA_PlayerCanResurrect")
	self:UnregisterEvent("oRA_PlayerResurrected")
	self:UnregisterEvent("oRA_PlayerNotResurrected")
	self:UnregisterEvent("HealComm_Ressupdate")
	self:UnregisterEvent("CHAT_MSG_BG_SYSTEM_HORDE")
	self:UnregisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE")

	self:CancelScheduledEvent("sRaidFramesUpdateAllBuffs")
	self:CancelScheduledEvent("sRaidFramesUpdateAllUnits")

	self:CancelScheduledEvent("sRaidFramesRangeCheck")

	for id = 1, MAX_RAID_MEMBERS do
		self.frames["raid" ..id]:Hide()
	end

	self.master:Hide()
	self:UpdateParty()
end

function sRaidFrames:UpdateAllUnits()
	self:UpdateUnit(self.visible)
end

function sRaidFrames:UpdateAllBuffs()
	self:UpdateBuffsGroup(self.visible)
end

function sRaidFrames:Variables()
	self.mouseoverunit = nil
	self.enabled = false
	self.preparesort = false
	self.frames, self.visible, self.groupframes = {}, {}, {}
	self.feign, self.unavail, self.res, self.hpaura = {}, {}, {}, {}

	-- 初始化动态unitId映射
	self:InitializeDynamicUnitIds()



	self.TempTooltipDebuffs = {}
	self.carrier = {}
	self.UnitSortOrder = {}
	self.UnitFocusHPArray = {}
	self.UnitFocusArray = {}
	self.UnitRangeArray = {}
	self.UnitInSightArray = {}
	self.UnitInCombatArray = {}
	self.indicator = {}
	self.debuff = {}
	self.targeting = {}
	self.self_targeting = {}

	self.debuffColors = {}
	self.debuffColors["Curse"]    = { ["r"] = 1, ["g"] = 0, ["b"] = 0.75, ["a"] = 0.5, ["priority"] = 4 }
	self.debuffColors["Magic"]    = { ["r"] = 1, ["g"] = 0, ["b"] = 0, ["a"] = 0.5, ["priority"] = 3 }
	self.debuffColors["Disease"]  = { ["r"] = 1, ["g"] = 1, ["b"] = 0, ["a"] = 0.5, ["priority"] = 2 }
	self.debuffColors["Poison"]   = { ["r"] = 0, ["g"] = 0.5, ["b"] = 0, ["a"] = 0.5, ["priority"] = 1 }
	self.debuffColors["Blue"]    = { ["r"] = 0, ["g"] = 0, ["b"] = 1, ["a"] = 1, ["priority"] = 4 }
	self.debuffColors["Red"]    = { ["r"] = 1, ["g"] = 0, ["b"] = 0, ["a"] = 1, ["priority"] = 4 }

	self.RAID_CLASS_COLORS = {
	  ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "|cffabd473" },
	  ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79, colorStr = "|cff9482c9" },
	  ["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0, colorStr = "|cffffffff" },
	  ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "|cfff58cba" },
	  ["MAGE"] = { r = 0.41, g = 0.8, b = 0.94, colorStr = "|cff69ccf0" },
	  ["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41, colorStr = "|cfffff569" },
	  ["DRUID"] = { r = 1.0, g = 0.49, b = 0.04, colorStr = "|cffff7d0a" },
	  ["SHAMAN"] = { r = 0.0, g = 0.44, b = 0.87, colorStr = "|cff0070de" },
	  ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "|cffc79c6e" },
	};

	self.cooldownSpells = {}
	if BS then
		self.cooldownSpells["WARLOCK"] = BS["Soulstone Resurrection"]
		self.cooldownSpells["DRUID"] = BS["Rebirth"]
		self.cooldownSpells["SHAMAN"] = BS["Reincarnation"]
	end

	self.ManaBarColor = ManaBarColor or {}

	-- Nurfed mana color, where is the love :(
	--self.ManaBarColor[0] = { r = 0.00, g = 1.00, b = 1.00, prefix = TEXT(MANA) };
end

-- 初始化动态unitId映射
function sRaidFrames:InitializeDynamicUnitIds()
	-- 确保dynamicUnitIds数组存在
	if not self.dynamicUnitIds then
		self.dynamicUnitIds = {}
	end

	-- 清空现有映射
	for i = 1, 40 do
		self.dynamicUnitIds[i] = nil
	end
	self.currentGroupType = "none"
end

-- 更新动态unitId映射
function sRaidFrames:UpdateDynamicUnitIds()
	-- 确保dynamicUnitIds数组存在
	if not self.dynamicUnitIds then
		self.dynamicUnitIds = {}
	end

	local oldGroupType = self.currentGroupType
	local newGroupType = self:GetCurrentGroupType()

	-- 如果组队类型没有变化，仍然需要检查团队成员变化
	if oldGroupType == newGroupType then
		-- 检查团队成员是否有变化，如果有变化则更新映射
		local needUpdate = false
		if newGroupType == "raid" then
			-- 检查团队成员的映射是否正确
			for i = 1, 40 do
				local shouldExist = UnitExists("raid" .. i)
				local currentMapping = self.dynamicUnitIds[i]
				if shouldExist and currentMapping ~= "raid" .. i then
					needUpdate = true
					break
				elseif not shouldExist and currentMapping then
					needUpdate = true
					break
				end
			end
		elseif newGroupType == "party" then
			-- 检查小队成员的映射是否正确
			if self.dynamicUnitIds[1] ~= "player" then
				needUpdate = true
			else
				for i = 1, 4 do
					local shouldExist = UnitExists("party" .. i)
					local currentMapping = self.dynamicUnitIds[i + 1]
					if shouldExist and currentMapping ~= "party" .. i then
						needUpdate = true
						break
					elseif not shouldExist and currentMapping then
						needUpdate = true
						break
					end
				end
			end
		end

		if not needUpdate then
			return
		end
	end

	self.currentGroupType = newGroupType

	-- 清空现有映射
	for i = 1, 40 do
		self.dynamicUnitIds[i] = nil
	end

	if newGroupType == "solo" then
		-- 单人状态：u1 = player
		self.dynamicUnitIds[1] = "player"

	elseif newGroupType == "party" then
		-- 小队状态：u1 = player, u2 = party1, u3 = party2, u4 = party3, u5 = party4
		self.dynamicUnitIds[1] = "player"
		for i = 1, 4 do
			if UnitExists("party" .. i) then
				self.dynamicUnitIds[i + 1] = "party" .. i
			end
		end

	elseif newGroupType == "raid" then
		-- 团队状态：保持原有逻辑，u1 = raid1, u2 = raid2, ... u40 = raid40
		for i = 1, 40 do
			if UnitExists("raid" .. i) then
				self.dynamicUnitIds[i] = "raid" .. i
			end
		end
	end
end

-- 获取当前组队类型
function sRaidFrames:GetCurrentGroupType()
	if GetNumRaidMembers and GetNumRaidMembers() > 0 then
		return "raid"
	elseif GetNumPartyMembers and GetNumPartyMembers() > 0 then
		return "party"
	else
		return "solo"
	end
end

-- 获取动态unitId对应的实际unitId
function sRaidFrames:GetActualUnitId(dynamicIndex)
	if not self.dynamicUnitIds then
		return nil
	end
	if dynamicIndex >= 1 and dynamicIndex <= 40 then
		return self.dynamicUnitIds[dynamicIndex]
	end
	return nil
end

function sRaidFrames:GetActualUnitToken(unit)
	if not unit or type(unit) ~= "string" then
		return unit
	end

	local dynamicIndex = string.match(unit, "^raid(%d+)$")
	if dynamicIndex then
		return self:GetActualUnitId(tonumber(dynamicIndex)) or unit
	end

	return unit
end

function sRaidFrames:GetFrameUnitId(unit)
	if not unit or type(unit) ~= "string" then
		return nil
	end

	local dynamicIndex = string.match(unit, "^raid(%d+)$")
	if dynamicIndex then
		return "raid" .. dynamicIndex
	end

	if self.dynamicUnitIds then
		for i = 1, MAX_RAID_MEMBERS do
			if self.dynamicUnitIds[i] == unit then
				return "raid" .. i
			end
		end
	end

	return nil
end

function sRaidFrames:GetCachedUnitValue(cache, unit)
	if not cache or not unit then
		return nil
	end

	local value = cache[unit]
	if value ~= nil then
		return value
	end

	local actualUnit = self:GetActualUnitToken(unit)
	if actualUnit and actualUnit ~= unit then
		value = cache[actualUnit]
		if value ~= nil then
			return value
		end
	end

	local frameUnit = self:GetFrameUnitId(unit)
	if frameUnit and frameUnit ~= unit then
		value = cache[frameUnit]
		if value ~= nil then
			return value
		end
	end

	return nil
end

function sRaidFrames:SetCachedUnitValue(cache, unit, value)
	if not cache or not unit then
		return
	end

	cache[unit] = value

	local actualUnit = self:GetActualUnitToken(unit)
	if actualUnit and actualUnit ~= unit then
		cache[actualUnit] = value
	end

	local frameUnit = self:GetFrameUnitId(unit)
	if frameUnit and frameUnit ~= unit and frameUnit ~= actualUnit then
		cache[frameUnit] = value
	end
end

function sRaidFrames:GetUnitAggro(unit)
	if not unit or not Banzai or not Banzai.GetUnitAggroByUnitId then
		return nil
	end

	local actualUnit = self:GetActualUnitToken(unit)
	if actualUnit and UnitExists(actualUnit) then
		return Banzai:GetUnitAggroByUnitId(actualUnit)
	end

	local frameUnit = self:GetFrameUnitId(unit)
	if frameUnit and frameUnit ~= unit then
		return Banzai:GetUnitAggroByUnitId(frameUnit)
	end

	return Banzai:GetUnitAggroByUnitId(unit)
end

function sRaidFrames:IsUnitCombatActive(unit)
	local actualUnit = self:GetActualUnitToken(unit)
	if not actualUnit or not UnitExists(actualUnit) then
		return false
	end

	if not UnitIsConnected(actualUnit) then
		return false
	end

	if (UnitIsDeadOrGhost and UnitIsDeadOrGhost(actualUnit)) or (UnitHealth and UnitHealth(actualUnit) <= 1) then
		return false
	end

	local inCombat = UnitAffectingCombat and UnitAffectingCombat(actualUnit)
	if inCombat == nil then
		inCombat = self:GetCachedUnitValue(self.UnitInCombatArray, unit)
	end

	return inCombat == 1 or inCombat == true
end

function sRaidFrames:GetUnitHighlightState(unit, aggro)
	local actualUnit = self:GetActualUnitToken(unit)
	if not actualUnit or not UnitExists(actualUnit) then
		return false, false, false
	end

	if not UnitIsConnected(actualUnit) then
		return false, false, false
	end

	if (UnitIsDeadOrGhost and UnitIsDeadOrGhost(actualUnit)) or (UnitHealth and UnitHealth(actualUnit) <= 1) then
		return false, false, false
	end

	local hasAggro = aggro
	if hasAggro == nil then
		hasAggro = self:GetUnitAggro(unit)
	end
	hasAggro = hasAggro and true or false

	local aggroBorder = hasAggro and self.opt.aggro ~= false
	local aggroName = hasAggro and self.opt.red ~= false
	local combatBorder = not aggroBorder and self.opt.combat_border ~= false and self:IsUnitCombatActive(unit)

	return aggroBorder, aggroName, combatBorder
end

function sRaidFrames:IsDebuffAuraColorEnabled(debuffType)
	if not debuffType or not self.opt or self.opt.unit_debuff_aura then
		return false
	end

	local optionKey = debuffAuraOptionMap[debuffType]
	return optionKey and self.opt[optionKey] ~= false
end

function sRaidFrames:UpdateFrameBackdropLayout(f, aggroBorder)
	if not f then
		return
	end

	local backdropState
	if not self.opt.Border then
		backdropState = "noborder"
	else
		backdropState = aggroBorder and "aggro" or "normal"
	end

	if f._srfBackdropState == backdropState and f._srfBackdropTexture == self.opt.Bordertexture then
		return
	end

	if self.opt.Border then
		local edgeSize = aggroBorder and AGGRO_BORDER_EDGE_SIZE or DEFAULT_BORDER_EDGE_SIZE
		local inset = aggroBorder and AGGRO_BORDER_INSET or DEFAULT_BORDER_INSET
		f:SetBackdrop({
			bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
			tile = true,
			tileSize = 16,
			edgeFile = self.opt.Bordertexture,
			edgeSize = edgeSize,
			insets = { left = inset, right = inset, top = inset, bottom = inset }
		})
	else
		f:SetBackdrop({
			bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
			tile = true,
			tileSize = 16,
			insets = { left = 0, right = 0, top = 0, bottom = 0 }
		})
	end

	f._srfBackdropState = backdropState
	f._srfBackdropTexture = self.opt.Bordertexture
end

function sRaidFrames:ApplyUnitBorderState(f, unit, aggro)
	if not f or not unit or not self.opt then
		return
	end

	local aggroBorder, _, combatBorder = self:GetUnitHighlightState(unit, aggro)
	self:UpdateFrameBackdropLayout(f, aggroBorder)

	if not self.opt.Border then
		return
	end

	if aggroBorder then
		f:SetBackdropBorderColor(baseAggroBorderColor[1], baseAggroBorderColor[2], baseAggroBorderColor[3], getBorderAlpha())
	elseif combatBorder then
		f:SetBackdropBorderColor(unpack(getCombatBorderColor()))
	else
		f:SetBackdropBorderColor(self.opt.BorderColor.r, self.opt.BorderColor.g, self.opt.BorderColor.b, getBorderAlpha())
	end
end

-- 检查动态unitId是否有效
function sRaidFrames:IsDynamicUnitIdValid(dynamicIndex)
	local actualUnitId = self:GetActualUnitId(dynamicIndex)
	return actualUnitId and UnitExists(actualUnitId)
end

-- 获取当前组队类型的最大循环次数
function sRaidFrames:GetMaxLoopCount()
	local groupType = self:GetCurrentGroupType()
	if groupType == "raid" then
		return MAX_RAID_MEMBERS  -- 40
	elseif groupType == "party" then
		return 5  -- 玩家 + 4个队友
	else  -- solo
		return 1  -- 只有玩家
	end
end

-- 更新框架的unit属性
function sRaidFrames:UpdateFrameUnit(frameId)
	if frameId >= 1 and frameId <= MAX_RAID_MEMBERS then
		local actualUnitId = self:GetActualUnitId(frameId)
		if actualUnitId and self.frames and self.frames["raid" .. frameId] then
			self.frames["raid" .. frameId].unit = actualUnitId
			-- 强制更新框架数据
			if self.visible and self.visible["raid" .. frameId] then
				self:UpdateUnit({["raid" .. frameId] = true})
			end
		end
	end
end

-- 更新所有框架的unit属性
function sRaidFrames:UpdateAllFrameUnits()
	if self.frames then
		for i = 1, MAX_RAID_MEMBERS do
			self:UpdateFrameUnit(i)
		end
	end
end

function sRaidFrames:UpdateRoster()
	-- 更新动态unitId映射
	if self.UpdateDynamicUnitIds then
		self:UpdateDynamicUnitIds()
	end

	local groupType = self:GetCurrentGroupType()
	local shouldEnable = self:ShouldEnableFrames(groupType)

	if not shouldEnable then
		if self.enabled then
			self:LeftRaid()
		else
			self:UpdateParty()
		end
		return
	end

	if not self.enabled then
		self:JoinedRaid()
		return
	end

	-- 更新所有框架的unit属性
	if self.frames then
		self:UpdateAllFrameUnits()
	end

	self:ResetHealIndicators()
	self:UpdateRaidFrames()

	-- 有成员加入时可能会获得错误的团队标记，在这里刷新一下解决
	if groupType == "raid" then
		self:UpdateRaidMarkers()
	end

	self:UpdateParty()
end

function sRaidFrames:QueryVisibility(id)
	-- 使用动态unitId
	local unitid = self:GetActualUnitId(id)
	if not unitid or not UnitName(unitid) then
		return false
	end

	local _, eClass = UnitClass(unitid)
	if eClass and self.opt and self.opt.ClassFilter and not self.opt.ClassFilter[eClass] then
		return false
	end

	-- 只有在团队状态下才检查队伍过滤
	if self.currentGroupType == "raid" then
		-- 需要找到实际的raid成员索引
		local raidIndex = nil
		if string.find(unitid, "^raid") then
			-- 仅提取数字部分，避免将 gsub 的第二个返回值作为 tonumber 的进制参数
			raidIndex = tonumber(string.match(unitid, "^raid(%d+)"))
		end

		if raidIndex and GetRaidRosterInfo then
			local _, _, subgroup = GetRaidRosterInfo(raidIndex)
			if subgroup and self.opt and self.opt.GroupFilter and not self.opt.GroupFilter[subgroup] then
				return false
			end
		end
	end

	return true
end

function sRaidFrames:UpdateVisibility()
	for id = 1, MAX_RAID_MEMBERS do
		if self:QueryVisibility(id) then
			if not self.visible["raid" .. id] then
				self.frames["raid" .. id]:Show()
				self.visible["raid" .. id] = true;
			end
		else
			if self.visible["raid" .. id] then
				self.frames["raid" .. id]:Hide()
				self.visible["raid" .. id] = nil;
			end
		end
	end

	self:Sort();
end

function sRaidFrames:Banzai_UnitGainedAggro(unit, unitTable)
	local frameUnit = self:GetFrameUnitId(unit) or unit
	if not frameUnit or not self.visible[frameUnit] or not self.frames[frameUnit] then return end
	self:ApplyUnitBorderState(self.frames[frameUnit], frameUnit, true)
	self:UpdateUnit({[frameUnit] = true})
end

function sRaidFrames:Banzai_UnitLostAggro(unit)
	local frameUnit = self:GetFrameUnitId(unit) or unit
	if not frameUnit or not self.visible[frameUnit] or not self.frames[frameUnit] then return end
	self:ApplyUnitBorderState(self.frames[frameUnit], frameUnit, false)
	self:UpdateUnit({[frameUnit] = true})
end

function sRaidFrames:oRA_PlayerCanResurrect(msg, author)
	local unit = roster:GetUnitIDFromName(author)
	--self:Print("oRA_PlayerCanResurrect", UnitIsDead(unit), UnitIsGhost(unit), self.unavail[unit], msg, author, unit)
	if unit then self:SetCachedUnitValue(self.res, unit, 1) end
end

function sRaidFrames:oRA_PlayerResurrected(msg, author)
	local unit = roster:GetUnitIDFromName(author)
	--self:Print("oRA_PlayerResurrected", UnitIsDead(unit), UnitIsGhost(unit), self.unavail[unit], msg, author, unit)
	if unit then self:SetCachedUnitValue(self.res, unit, 2) end
end

function sRaidFrames:oRA_PlayerNotResurrected(msg, author)
	local unit = roster:GetUnitIDFromName(author)
	--self:Print("oRA_PlayerNotResurrected", UnitIsDead(unit), UnitIsGhost(unit), self.unavail[unit], msg, author, unit)
	if unit then self:SetCachedUnitValue(self.res, unit, nil) end
end


function sRaidFrames:HealCommRez(author)
	local unit = roster:GetUnitIDFromName(author)
	--self:Print("oRA_PlayerResurrected", UnitIsDead(unit), UnitIsGhost(unit), self.unavail[unit], msg, author, unit)
	if unit and HealComm:UnitisResurrecting(GetUnitName(unit)) then self:SetCachedUnitValue(self.res, unit, 2) end
end

function sRaidFrames:SRF_PlayerResurrected(caster, target, prefix)
	local unit = roster:GetUnitIDFromName(target)
	sRaidFrames:DebugRez(strupper(prefix).." >> "..caster.." -> Resurrection -> "..target)

	if unit then self:SetCachedUnitValue(self.res, unit, 2) end
end

function sRaidFrames:IsSpellInRangeAndActionBar(SpellName)
	if SpellName then
		local SpellButton = Zorlen_Button[SpellName..".Any"]
		if SpellButton then
			if(IsActionInRange(SpellButton) == 1) then
				return true
			else
				return false
			end
		else
			if self.JoiningWorld > 0 and (GetTime() - self.JoiningWorld > 6) then
				UIErrorsFrame:AddMessage("|cff00eeee sRaidFrames: |cff00FF00"..SpellName.." - not on Actionbar")
			end
			return false
		end
	end
	return false
end

function sRaidFrames:Freqcalc(num)
	local factor = self.opt.AccurateRangeFactor or 0.05
	local val1 = (factor*num + 0.6)
	--local val1 = (0.064*num + 0.936)
	local val2 = val1/num
	return val2, val1
end

function sRaidFrames:ExtendedRangeArrayUtilize(modez, unit)
	local counter = 0
	if modez == "add" then
		self.ExtendedRangeScan[unit] = true

	elseif modez == "remove" then
		self.ExtendedRangeScan[unit] = nil

	elseif modez == "ret" then
		for blockindex,blockmatch in pairs(self.ExtendedRangeScan) do
			return blockindex
		end
		return nil

	elseif modez == "reset" then
		for blockindex,blockmatch in pairs(self.ExtendedRangeScan) do
			self.ExtendedRangeScan[blockindex] = nil
		end

	elseif modez == "calc" then
		for blockindex,blockmatch in pairs(self.ExtendedRangeScan) do
			counter = counter + 1
		end
		return counter
	end
end

local getUnitXpDist = function(unit1, unit2)
	local dist = UnitXP("distanceBetween", unit1, unit2)
	if not dist then
		return ""
	end

	return math.ceil(dist) -- 向上取整
end

function sRaidFrames:RangeCheck()
	if sRaidFrames.unitxp then
		-- unitxp模组存在
		self.UnitRangeArray = {}
		self.UnitInSightArray = {}
		self.UnitInCombatArray = {}

		local playerUnit
		-- 找到玩家对应的unit
		for id = 1, MAX_RAID_MEMBERS do
			if self.visible["raid" .. id] then
				local unit = self:GetActualUnitId(id)
				if unit and UnitIsUnit("player", unit) then
					playerUnit = "raid" .. id
					break
				end
			end
		end

		-- 遍历所有可见单位
		for id = 1, MAX_RAID_MEMBERS do
			if self.visible["raid" .. id] then
				local unit = self:GetActualUnitId(id)
				local unitKey = "raid" .. id

				if unitKey == playerUnit then
					-- 距离
					self:SetCachedUnitValue(self.UnitRangeArray, unitKey, 0)
					-- 在视野中
					self:SetCachedUnitValue(self.UnitInSightArray, unitKey, true)
				else
					-- ""代表没获取到距离，一般来说是距离过远 / 没在线的情况
					self:SetCachedUnitValue(self.UnitRangeArray, unitKey, getUnitXpDist("player", unit))
					self:SetCachedUnitValue(self.UnitInSightArray, unitKey, UnitXP("inSight", "player", unit))
				end
				-- 在战斗中
				self:SetCachedUnitValue(self.UnitInCombatArray, unitKey, UnitAffectingCombat(unit))
			end
		end

		-- return
	end

	-- unitxp模组不存在才会执行以下代码
	local now = GetTime()
	local moving = Zorlen_isMoving()
	local _px, _py = GetPlayerMapPosition("player")

	if _px > 0 and _py > 0 and not self.MapEnable then
		self.MapEnable = true
		self:DebugRange("RC_MAP_ENABLE")
	end
	if not self.opt.RangeCheck and not self.opt.ExtendedRangeCheck and not self.opt.ExtendedRangeCheckCombat then
		return
	end

	if not self.ClassCheck then
		self.ClassCheck = Zorlen_UnitClass("player")
		self.SpellCheck = self.ClassSpellArray[self.ClassCheck]
	end

	if not UnitIsDeadOrGhost("player") and self:ExtendedRangeArrayUtilize("calc") == 0 then
		local counter = 1
		self:CancelScheduledEvent("sRaidFramesExtendedRangeCheck")
		self:ExtendedRangeArrayUtilize("reset")


		-- 遍历所有可见单位
		for id = 1, MAX_RAID_MEMBERS do
			if self.visible["raid" .. id] then
				local unit = self:GetActualUnitId(id)
				if unit then
					local unitcheck = UnitExists(unit) and UnitIsVisible(unit) and UnitIsConnected(unit) and not UnitIsGhost(unit)
					local deadcheck = UnitIsDead(unit)
					local _tx, _ty, dist = nil, nil, 28

					if self.MapEnable and unitcheck and not deadcheck then
						_tx, _ty = GetPlayerMapPosition(unit)
						dist = sqrt((_px - _tx)^2 + (_py - _ty)^2)*1000
					end

					local check_accurate = unitcheck and self.SpellCheck and (self.opt.ExtendedRangeCheck or self.opt.ExtendedRangeCheckCombat and UnitAffectingCombat("player")) and not deadcheck
					local check_light = unitcheck and self.MapEnable and (self.opt.RangeCheck or self.opt.ExtendedRangeCheckCombat and not UnitAffectingCombat("player")) and not deadcheck

					if unitcheck and UnitIsUnit("player", unit) then
						self:SetCachedUnitValue(self.UnitRangeArray, unit, 0)
					elseif unitcheck and CheckInteractDistance(unit, 4) then
						local close_range = CheckInteractDistance(unit, 2)
						if close_range then
							self:SetCachedUnitValue(self.UnitRangeArray, unit, 11)
						else
							self:SetCachedUnitValue(self.UnitRangeArray, unit, 28)
						end
						if self.MapEnable then
							self:SetCachedUnitValue(self.UnitRangeArray, unit, math.floor(dist/self.MapScale))
							if _tx and _tx > 0 and _ty and _ty > 0 then
								if (dist/11.11) > self.MapScale and close_range then
									local adjust = dist/11.11
									self:DebugRange("RC_INC "..GetUnitName(unit).."_11Y: "..adjust.." - "..math.floor(adjust/self.MapScale*100 - 100).."% ")
									self.MapScale = adjust
								elseif (dist/28) > self.MapScale then
									local adjust = dist/28
									self:DebugRange("RC_INC "..GetUnitName(unit).."_28Y: "..adjust.." - "..math.floor(adjust/self.MapScale*100 - 100).."% ")
									self.MapScale = adjust
								end
							end
						end
					elseif check_light or check_accurate then
						if unitcheck and self.MapEnable and not deadcheck and _tx and _tx > 0 and _ty and _ty > 0 and self:VerifyUnitRange(unit, dist) then
							if check_light or check_accurate and self:GetCachedUnitValue(self.UnitRangeArray, unit) ~= "" then
								self:SetCachedUnitValue(self.UnitRangeArray, unit, math.floor(dist/self.MapScale))
							end
						elseif check_light then
							self:SetCachedUnitValue(self.UnitRangeArray, unit, "")
						elseif self:GetCachedUnitValue(self.UnitRangeArray, unit) ~= "" then
							self:SetCachedUnitValue(self.UnitRangeArray, unit, 40)
						end

						if check_accurate then
							self:ExtendedRangeArrayUtilize("add", unit)
							counter = counter + 1
						end

					else
						self:SetCachedUnitValue(self.UnitRangeArray, unit, "")
					end
				end
			end
		end
		if counter > 1 then
			local status = "INACTIVE"
			if (not self.MenuOpen or self.MenuOpen < GetTime()) and not (InspectFrame and InspectFrame:IsVisible() or LootFrame and LootFrame:IsVisible() or XLootFrame and XLootFrame:IsVisible() or TradeFrame and TradeFrame:IsVisible()) then
				status = "ACTIVE"
			end

			local table_val = self:ExtendedRangeArrayUtilize("calc")
			local step, freq = self:Freqcalc(table_val)
			self:DebugRange("RC_STATUS: |cff00eeee"..status.."|cffffffff - TOTAL: |cff00eeee"..table_val.."|cffffffff - PERIOD: |cff00eeee"..((math.floor(freq *100))/100).."s |cffffffff")
			self:ScheduleRepeatingEvent("sRaidFramesExtendedRangeCheck", self.ExtendedRangeCheck, step , self)
		end
	end
end

function sRaidFrames:ExtendedRangeCheck()
	if sRaidFrames.unitxp then return end

	-- unitxp模组不存在才会执行以下代码
	local now = GetTime()
	local j = self:ExtendedRangeArrayUtilize("ret")

	if not (self.opt.ExtendedRangeCheck or self.opt.ExtendedRangeCheckCombat and UnitAffectingCombat("player")) or not UnitExists(j) or self.MenuOpen and self.MenuOpen > now or (InspectFrame and InspectFrame:IsVisible() or XLootFrame and XLootFrame:IsVisible() or LootFrame and LootFrame:IsVisible() or TradeFrame and TradeFrame:IsVisible()) or Zorlen_isEnemy("target") and isShootActive() then
		self:CancelScheduledEvent("sRaidFramesExtendedRangeCheck")
		self:ExtendedRangeArrayUtilize("reset")
		return
	end

	if j then
		local jumpnext = true
		local targetchanged = nil
		local tempcyclename = nil

		self.TargetMonitorCycleName = GetUnitName("target")

		if not UnitExists("target") or UnitExists("target") and not UnitIsUnit("target", j) then
			tempcyclename = GetUnitName("target")
			self.TargetMonitorCycleName = GetUnitName(j)
			self.TargetMonitor = true
			targetchanged = true
			TargetUnit(j)
		end
		if self:IsSpellInRangeAndActionBar(self.SpellCheck) then
			if self:GetCachedUnitValue(self.UnitRangeArray, j) == "" then
				self:SetCachedUnitValue(self.UnitRangeArray, j, 40)
			end
			self:DebugRange("RC "..GetUnitName(j).."_40y - " .."|cff00FF00 PASS")
			jumpnext = nil
		end
		if targetchanged then
			self.TargetMonitorCycleName = tempcyclename
			self.TargetMonitorEnd = true
			TargetLastTarget()
		end
		if jumpnext then
			self:SetCachedUnitValue(self.UnitRangeArray, j, "")
			self:DebugRange("RC "..GetUnitName(j).."_40y - " .."|cffFF0000 NOT PASS")
		end
		self:ExtendedRangeArrayUtilize("remove", j)

		if self:ExtendedRangeArrayUtilize("calc") == 0 then
			--self.TargetMonitorCycleEnd = true
			sRaidFrames:UtilizeTarget()


		end
	end
end

function sRaidFrames:VerifyUnitRange(unit, dist)
	if UnitExists("target") and UnitIsUnit("target", unit) then
		if self:IsSpellInRangeAndActionBar(self.SpellCheck) then
			if dist > (self.MapScale*40) then
				local adjust = dist/(40*0.99)
				self:DebugRange("RC_INC "..GetUnitName(unit).."_40Y: "..adjust.." - "..math.floor(adjust/self.MapScale*100 - 100).."% ")
				self.MapScale = adjust
			end
			return true
		elseif dist < (self.MapScale*40) then
			local adjust = dist/(40*1.01)
			self:DebugRange("RC_DEC "..GetUnitName(unit).."_40Y: "..adjust.." - "..math.floor(adjust/self.MapScale*100 - 100).."% ")
			self.MapScale = adjust
			return nil
		else
			return nil
		end
	elseif dist < (self.MapScale*40*0.95) then
		return true
	else
		return nil
	end
end

function sRaidFrames:ZoneCheck()
	self.MapScale = 0
	self.MapEnable = false
	SetMapToCurrentZone()
	self:ResetHealIndicators()
	self:ScheduleEvent("SRF_ZoneCheck", 2)
	sRaidFrames:SetDegTex(true)
	self:DebugRange("RC_RST")
end

function sRaidFrames:Debug(msg)
	if msg then
		DEFAULT_CHAT_FRAME:AddMessage("|cff00eeee SRF Debug: |cffffffff"..msg);
	end
end

function sRaidFrames:DebugRange(msg)
	if self.opt.DebugRange then
		DEFAULT_CHAT_FRAME:AddMessage("|cff00eeee SRF Debug Range: |cffffffff"..msg);
	end
end

function sRaidFrames:DebugHeal(msg)
	if self.opt.DebugHeal then
		DEFAULT_CHAT_FRAME:AddMessage("|cff00eeee SRF Debug Heal: |cffffffff"..msg);
	end
end

function sRaidFrames:DebugRez(msg)
	if self.opt.DebugRez then
		DEFAULT_CHAT_FRAME:AddMessage("|cff00eeee SRF Debug Rez: |cffffffff"..msg);
	end
end

function sRaidFrames:UpdateRangeFrequency(value)
	if not sRaidFrames.unitxp then
		self:CancelScheduledEvent("sRaidFramesRangeCheck")
		self:ScheduleRepeatingEvent("sRaidFramesRangeCheck", self.RangeCheck, value, self)
	end
end

function sRaidFrames:UpdateUnit(units)
	local class_color = self.opt.statusbar_color
	for unit in pairs(units) do
		--local focus_unit = self:CheckFocusUnit(unit)
		if self.visible[unit] and self.frames[unit] then
			-- 获取动态unitId
			local unitIdStr = string.gsub(unit,"raid","")
			local unitId = tonumber(unitIdStr)
			local actualUnitId = self:GetActualUnitId(unitId)
			if actualUnitId and UnitExists(actualUnitId) then
				--if (not self.opt.dynamic_sort or not focus_unit and not force_focus or focus_unit and force_focus) then
				local f = self.frames[unit]
				local range = ""

				local id_str = string.gsub(unit,"raid","")
				local _, _, subgroup = nil, nil, nil
				-- 只有在团队状态下才获取队伍信息
				if self.currentGroupType == "raid" and GetRaidRosterInfo then
					_, _, subgroup = GetRaidRosterInfo(id_str)
				end

				if self.opt.grp_name then
					subgroup = "("..subgroup..")"
				else
					subgroup = ""
				end

				if self.opt.RangeShow and (not self.opt.FocusRangeShow or self.opt.FocusRangeShow and self:CheckFocusUnit(unit)) then
					range = self:GetCachedUnitValue(self.UnitRangeArray, unit)
					if not range or range == "" or range == 0 or UnitIsDeadOrGhost("player") then
						range =  ""
					else
						range =  " "..range.."Y"
					end

				end

				local _, class = UnitClass(actualUnitId)
				local unit_name = subgroup..(UnitName and UnitName(actualUnitId) or "Unknown")
				local unit_aggro = self:GetUnitAggro(unit)
				local _, aggroName = self:GetUnitHighlightState(unit, unit_aggro)

				if self.opt.unit_name_lenght or self.opt.RangeShow then
					unit_name = subgroup..string.sub(UnitName and UnitName(actualUnitId) or "Unknown", 1, 3) --UnitName(actualUnitId)
				end

				if aggroName then
					f.title:SetText("|cffff0000"..unit_name..range.."|r")
				elseif not self.opt.unitname_color then
					f.title:SetText(unit_name..range.."|r")
				elseif class then
					f.title:SetText(self.RAID_CLASS_COLORS[class].colorStr..unit_name..range.."|r")
				else
					f.title:SetText(unit_name or L["Unknown"])
				end

				self.feign[unit] = nil

				-- Silly hunters, why do you have to be so annoying
				if UnitExists(actualUnitId.."target") and not UnitAffectingCombat(actualUnitId) and UnitIsUnit(actualUnitId.."target", "player") and not UnitIsUnit(actualUnitId, "player") then
					self.targeting[unit] = true
				else
					self.targeting[unit] = nil
				end

				-- 检查玩家是否选中了当前单位
				local isTargeted = UnitExists("target") and UnitIsUnit("target", actualUnitId)
				if isTargeted then
					-- 玩家选中了当前单位，设置紫色
					self.self_targeting[unit] = true
				else
					-- 玩家没有选中当前单位，清除紫色
					self.self_targeting[unit] = nil
				end

				if class == "HUNTER" then
					if UnitIsDead(actualUnitId) then
						for i=1,32 do
							local texture = UnitBuff(actualUnitId, i)
							if not texture then break end
							if texture == "Interface\\Icons\\Ability_Rogue_FeignDeath" then
								self.feign[unit] = true
								break
							end
						end
					end
				end


				if not self.feign[unit] then
					local status, dead, ghost = nil, (UnitIsDead and UnitIsDead(actualUnitId)) or (UnitHealth and UnitHealth(actualUnitId) <= 1), (UnitIsGhost and UnitIsGhost(actualUnitId))
					if not UnitIsConnected(actualUnitId) then status = "|cff858687"..L["Offline"].."|r"
					elseif self:GetCachedUnitValue(self.res, unit) == 1 and dead then status = "|cffff8c00"..L["Can Recover"].."|r"
					elseif self:GetCachedUnitValue(self.res, unit) == 2 and (dead or ghost) then status = "|cffff8c00"..L["Rezzed"].."|r"
					elseif self.hpaura[unit] then status = "|cffff8c00"..self.hpaura[unit].."|r"
					elseif ghost then status = "|cffff0000"..L["Ghost"].."|r"
					elseif dead or (UnitHealth and UnitHealth(actualUnitId) <= 1) then status = "|cffff0000"..L["Dead"].."|r"
					end


					if status and not self:GetCachedUnitValue(self.unavail, unit) or not status and self:GetCachedUnitValue(self.unavail, unit) then
						self.preparesort = true
					end


					if status then
						self:SetCachedUnitValue(self.unavail, unit, true)
						f.hpbar.text:SetText(status)
						f.hpbar:SetValue(0)
						--f.mpbar.text:SetText()
						f.mpbar:SetValue(0)
						--f:SetBackdropColor(0.3, 0.3, 0.3, 1)

						self:HideHealIndicator(unit, true)
					else

						--self:CreateHealIndicator(unit)

						self:SetCachedUnitValue(self.unavail, unit, false)
						self:SetCachedUnitValue(self.res, unit, nil)
						local hp = (UnitHealth and UnitHealth(actualUnitId)) or 0
						local hpmax = UnitHealthMax(actualUnitId)
						local hpp = (hpmax and hpmax ~= 0) and ceil((hp / hpmax) * 100) or 0
						local hptext, hpvalue = nil, nil

						if self.opt.healthDisplayType == "percent" then
							hptext = hpp .."%"
						elseif self.opt.healthDisplayType == "deficit" then
							hptext = (hp-hpmax) ~=  0 and (hp-hpmax) or nil
						elseif self.opt.healthDisplayType == "current" then
							hptext = hp
						elseif self.opt.healthDisplayType == "curmax" then
							hptext = hp .."/".. hpmax
						end

						if self.opt.Invert then
							hpvalue = 100 - hpp
						else
							hpvalue = hpp
						end

						f.hpbar.text:SetText(hptext)
						f.hpbar:SetValue(hpvalue)


						if unit_aggro and self.opt.redbar then
							f.hpbar:SetStatusBarColor(1,0,0)

						elseif self.opt.self_targeting and self.self_targeting[unit] then
							f.hpbar:SetStatusBarColor(1,0,1,0.75)

						elseif self.opt.targeting and self.targeting[unit] then
							f.hpbar:SetStatusBarColor(0,0,0,0.75)

						elseif self.opt.statusbar_color then
							-- 使用Zorlen_UnitClass函数获取职业
							local class = Zorlen_UnitClass and Zorlen_UnitClass(actualUnitId)
							if class then
								-- 将职业名称转换为大写以匹配RAID_CLASS_COLORS的键
								local classUpper = string.upper(class)
								local color = self.RAID_CLASS_COLORS[classUpper]
								if color then
									f.hpbar:SetStatusBarColor(color.r, color.g, color.b)
								else
									f.hpbar:SetStatusBarColor(self:GetHPSeverity(hpp/100))
								end
							else
								f.hpbar:SetStatusBarColor(self:GetHPSeverity(hpp/100))
							end
						else
							f.hpbar:SetStatusBarColor(self:GetHPSeverity(hpp/100))
						end

						local mp = (UnitMana and UnitMana(actualUnitId)) or 0
						local mpmax = UnitManaMax(actualUnitId)
						local mpp = (mpmax and mpmax ~= 0) and ceil((mp / mpmax) * 100) or 0

						local powerType = UnitPowerType(actualUnitId)
						if self.opt.PowerFilter[powerType] == false then
							f.mpbar:SetValue(0)
						else
							local color = self.ManaBarColor[powerType]
							if color then
								f.mpbar:SetStatusBarColor(color.r, color.g, color.b)
							end
							f.mpbar:SetValue(mpp)
						end
					end
				else
					f.hpbar.text:SetText("|cff00ff00"..L["Feign Death"].."|r")
					f.hpbar:SetValue(100)
					f.hpbar:SetStatusBarColor(0, 0.9, 0.5)
					f.mpbar:SetValue(0)
				end

				self:ApplyUnitBorderState(f, unit, unit_aggro)
			end
		end
	end
end

function sRaidFrames:UpdateBuffsGroup(units)
	sRaidFrames:UpdateBuffs(units,self.buffsupdatecounter)
	self.buffsupdatecounter = self.buffsupdatecounter + 1
	if self.buffsupdatecounter == 3 then
		self.buffsupdatecounter = 0
	end
end

function sRaidFrames:UpdateBuffs(units, update_counter)
	for unit in pairs(units) do
		if self.visible[unit] and self.frames[unit] then
			local f = self.frames[unit]
			-- 获取动态unitId
			local unitIdStr = string.gsub(unit,"raid","")
			local unitId = tonumber(unitIdStr)
			local actualUnitId = self:GetActualUnitId(unitId)
			if actualUnitId and UnitExists(actualUnitId) and UnitIsVisible(actualUnitId) then
				local currentDebuffSlots = self.debuffSlots[unit] or 0
				if not update_counter or update_counter == 1 then
					for i = 1, currentDebuffSlots do
						f["buff".. i]:Hide()
					end
				end
				if not update_counter or update_counter == 2 then
					for i = (currentDebuffSlots + 1), 4 do
						f["buff".. i]:Hide()
					end
				end
				if not update_counter or update_counter == 0 then
					f.mpbar.text:SetText()


					for i=1,32 do
						local texture = UnitBuff(actualUnitId, i)
						if not texture then break end
						--INV_BannerPVP_01
						-- First we match the texture, then we pull the name of the debuff from a tooltip, and compare it to BabbleSpell
						-- The idea is that we do a simple string match, and only if that string match triggers something, then we do the extra check
						-- This should prevent unnessesary calls to functions and lookups

						if texture == "Interface\\Icons\\Spell_Nature_TimeStop" and self:GetBuffName(actualUnitId, i) == BS["Divine Intervention"] then
							self.hpaura[unit] = L["Intervened"]
						elseif texture == "Interface\\Icons\\Spell_Holy_GreaterHeal" and self:GetBuffName(actualUnitId, i) == BS["Spirit of Redemption"] then
							f.hpbar.text:SetText("|cffff8c00"..L["Spirit"].."|r")
							self.hpaura[unit] = L["Spirit"]
						else
							self.hpaura[unit] = nil
						end


						if not self.opt.show_txt_buff then
							if texture == "Interface\\Icons\\INV_BannerPVP_01" or self.carrier == strlower(GetUnitName and GetUnitName(actualUnitId) or "Unknown") then
								f.mpbar.text:SetText("|cffFF0000"..L["Carrier"].."|r")
								if self.carrier ~= strlower(GetUnitName and GetUnitName(actualUnitId) or "Unknown") then
									self.carrier = strlower(GetUnitName and GetUnitName(actualUnitId) or "Unknown")
									self:UpdateRaidFrames()
								end
							elseif texture == "Interface\\Icons\\Spell_Nature_Lightning" and self:GetBuffName(actualUnitId, i) == BS["Innervate"] then
								f.mpbar.text:SetText("|cff00ff00"..L["Innervate"].."|r")
							elseif texture == "Interface\\Icons\\Ability_Warrior_ShieldWall" and self:GetBuffName(actualUnitId, i) == BS["Shield Wall"] then
								f.mpbar.text:SetText("|cffffffff"..BS["Shield Wall"].."|r")
							elseif texture == "Interface\\Icons\\Spell_Holy_AshesToAshes" and self:GetBuffName(actualUnitId, i) == BS["Last Stand"] then
								f.mpbar.text:SetText("|cffffffff"..BS["Last Stand"].."|r")
							elseif texture == "Interface\\Icons\\INV_Misc_Gem_Pearl_05" then
								f.mpbar.text:SetText("|cffffffff"..L["Gifted"].."|r")
							elseif texture == "Interface\\Icons\\Spell_Frost_Frost" and self:GetBuffName(actualUnitId, i) == BS["Ice Block"] then
								f.mpbar.text:SetText("|cffbfefff"..BS["Ice Block"].."|r")
							elseif texture == "Interface\\Icons\\Spell_Holy_SealOfProtection" and self:GetBuffName(actualUnitId, i) == BS["Blessing of Protection"] then
								f.mpbar.text:SetText("|cffffffff"..L["Protection"].."|r")
							elseif texture == "Interface\\Icons\\Spell_Holy_DivineIntervention" and self:GetBuffName(actualUnitId, i) == BS["Divine Shield"] then
								f.mpbar.text:SetText("|cffffffff"..L["Shield"].."|r")
							elseif texture == "Interface\\Icons\\Ability_Vanish" and self:GetBuffName(actualUnitId, i) == BS["Vanish"] then
								f.mpbar.text:SetText("|cffffffff"..L["Vanished"].."|r")
							elseif texture == "Interface\\Icons\\Ability_Stealth" and self:GetBuffName(actualUnitId, i) == BS["Stealth"] then
								f.mpbar.text:SetText("|cffffffff"..L["Stealthed"].."|r")
							elseif texture == "Interface\\Icons\\Spell_Holy_PowerInfusion" and self:GetBuffName(actualUnitId, i) == BS["Power Infusion"] then
								f.mpbar.text:SetText("|cffffffff"..L["Infused"].."|r")
							elseif texture == "Interface\\Icons\\Spell_Holy_Excorcism" and self:GetBuffName(actualUnitId, i) == BS["Fear Ward"] then
								f.mpbar.text:SetText("|cffffff00"..BS["Fear Ward"].."|r")
							elseif UnitClass("player") == "Priest" and texture == "Interface\\Icons\\Spell_Holy_Renew" and self:GetBuffName(actualUnitId, i) == BS["Renew"] then
								f.mpbar.text:SetText("|cff00ff00"..BS["Renew"].."|r")
							elseif UnitClass("player") == "Druid" and texture == "Interface\\Icons\\Spell_Nature_Rejuvenation" and self:GetBuffName(actualUnitId, i) == BS["Rejuvenation"] then
								f.mpbar.text:SetText("|cff00ff00"..BS["Rejuvenation"].."|r")
							end
						end
					end
				end

				if not update_counter or update_counter == 1 then
					local cAura = nil
					local debuff_mask = nil
					local process1 = nil
					local process2 = nil
					local debuffSlots = 0

					for blockindex,blockmatch in pairs(self.TempTooltipDebuffs) do
						self.TempTooltipDebuffs[blockindex] = nil
					end

					for j=1,2 do
						for i=1,16 do
							if j == 1 then
								debuff_mask = nil
							elseif j == 2 then
								debuff_mask = true
							end

							local debuffTexture, debuffApplications, debuffType = UnitDebuff(actualUnitId, i, debuff_mask)
							if not debuffTexture then break end
							local debuffName = self:GetDebuffName(actualUnitId, i, debuff_mask)

							if j == 1 then
								process1 = self.opt.ShowFilteredDebuffs or not self.opt.ShowFilteredDebuffs and not self.opt.ShowOnlyDispellable
								process2 = not self.opt.ShowFilteredDebuffs and not self.opt.ShowOnlyDispellable or self.opt.ShowFilteredDebuffs and self.opt.DebuffFilter[debuffName] and not self.TempTooltipDebuffs[debuffName]

							elseif j == 2 then
								process1 = self.opt.ShowOnlyDispellable
								local unitRange = self:GetCachedUnitValue(self.UnitRangeArray, unit)
								process2 = not self.opt.ShowDebuffsOnlyRange or self.opt.ShowDebuffsOnlyRange and unitRange and unitRange ~= "" and unitRange < 28
								process2 = process2 and not self.TempTooltipDebuffs[debuffName]

							end

							if not process1 then
								break
							end

							if debuffType ~= nil and self.debuffColors[debuffType] and self:IsDebuffAuraColorEnabled(debuffType) and ((cAura and cAura.priority < self.debuffColors[debuffType].priority) or not cAura) then
								cAura = self.debuffColors[debuffType]
								sRaidFrames.debuff[unit] = debuffType
							end

							if (self.opt.BuffType == "debuffs" or self.opt.BuffType == "buffsanddebuffs") and debuffSlots < self.opt.buff_slots and process2 and not (UnitIsDeadOrGhost and UnitIsDeadOrGhost(actualUnitId)) then
								debuffSlots = debuffSlots + 1

								local debuffFrame = f["buff".. debuffSlots]
								debuffFrame.unit = actualUnitId
								debuffFrame.debuffid = i
								debuffFrame.mask = debuff_mask
								debuffFrame:SetScript("OnEnter", function() GameTooltip:SetOwner(debuffFrame) GameTooltip:SetUnitDebuff(this.unit, this.debuffid, this.mask) end);
								debuffFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)
								debuffFrame:SetScript("OnClick", self.OnUnitClick)
								debuffFrame.count:SetText(debuffApplications > 1 and debuffApplications or nil);
								debuffFrame.texture:SetTexture(debuffTexture)
								debuffFrame:SetFrameLevel(5)
								debuffFrame:Show()

								self.TempTooltipDebuffs[debuffName] = true
							end
						end
					end

					local dead = (UnitIsDeadOrGhost and UnitIsDeadOrGhost(actualUnitId)) or (UnitHealth and UnitHealth(actualUnitId) <= 1)
					if self.opt.aggro_aura and not dead and self:GetUnitAggro(unit) then
						sRaidFrames.debuff[unit] = "Red"
						cAura = self.debuffColors["Red"]
						f:SetBackdropColor(cAura.r, cAura.g, cAura.b, cAura.a);

					elseif cAura and not dead then
						f:SetBackdropColor(cAura.r, cAura.g, cAura.b, cAura.a);

					else
						sRaidFrames.debuff[unit] = nil
						f:SetBackdropColor(self.opt.BackgroundColor.r, self.opt.BackgroundColor.g, self.opt.BackgroundColor.b, self.opt.BackgroundColor.a)
					end

					self.debuffSlots[unit] = debuffSlots
				end

				if not update_counter or update_counter == 2 then
					local buffSlots = self.debuffSlots[unit] or 0
					for i = (buffSlots + 1), 4 do
						f["buff".. i]:Hide()
					end

					if self.opt.BuffType == "buffs" or self.opt.BuffType == "buffsanddebuffs" then
						local showOnlyCastable = 1
						--if next(self.opt.BuffFilter) then
						if self.opt.ShowFilteredBuffs then
							showOnlyCastable = 0
						end
						for i=1,32 do
							if buffSlots == self.opt.buff_slots then break end

							local buffTexture, buffApplications = UnitBuff(actualUnitId, i, showOnlyCastable)
							if not buffTexture then break end
							if showOnlyCastable == 1 or self.opt.BuffFilter[self:GetBuffName(actualUnitId, i)] then
								buffSlots = buffSlots + 1
								local buffFrame = f["buff".. buffSlots]
								buffFrame.buffid = i
								buffFrame.unit = actualUnitId
								buffFrame:SetScript("OnEnter", function() GameTooltip:SetOwner(buffFrame) GameTooltip:SetUnitBuff(this.unit, this.buffid, showOnlyCastable) end)
								buffFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)
								buffFrame:SetScript("OnClick", self.OnUnitClick)
								buffFrame.count:SetText(buffApplications > 1 and buffApplications or nil)
								buffFrame.texture:SetTexture(buffTexture)
								--buffFrame:SetFrameLevel(10)
								buffFrame:Show()

							end
						end
					end

				end
			else
				if not self.opt.show_txt_buff and self:CheckCarrier(actualUnitId) then
					f.mpbar.text:SetText("|cffFF0000"..L["Carrier"].."|r")
				else
					f.mpbar.text:SetText()
				end
				f:SetBackdropColor(self.opt.BackgroundColor.r, self.opt.BackgroundColor.g, self.opt.BackgroundColor.b, self.opt.BackgroundColor.a)
			end
		end
	end
end

function sRaidFrames:GetBuffName(unit, i)
	sRaidFramesTooltip:SetUnitBuff(unit, i)
  return sRaidFramesTooltipTextLeft1:GetText() or ""
end

function sRaidFrames:GetDebuffName(unit, i, filter)
	sRaidFramesTooltip:SetUnitDebuff(unit, i, filter)
  return sRaidFramesTooltipTextLeft1:GetText() or ""
end

function sRaidFrames:SetUnitBuffDuration(unit, buff)
	if not oRAOBuff or not oRAOBuff.UnitBuffsTables then return end
	local unitBuffs = oRAOBuff.UnitBuffsTables[UnitName(unit)]
	if not unitBuffs then return end

	local endtime = unitBuffs[self:GetBuffName(unit, buff)]
	if endtime then
		local time = endtime - GetTime()
		if time > 0 then
			GameTooltip:AddLine("Time remaining: ".. SecondsToTimeAbbrev(time), 0.7, 0.7, 1)
			GameTooltip:Show()
		end
	end
end

function sRaidFrames:GetHPSeverity(percent)
	if percent >= 0.75 then
		return (-4*percent + 4), 1.0, 0.0

	--elseif percent >= 0.25 then
		--return 1.0, (2*percent - 0.5), 0.0

	--elseif percent >= 0.30 then
		--return 1.0, (2.22*percent - 0.66), 0.0

	elseif percent >= 0.35 then
		return 1.0, (2.5*percent - 0.875), 0.0

	else
		return 1.0, 0.0, 0.0
	end
end

function sRaidFrames:StartMovingAll()
	this.multidrag = 1
	local id = this:GetID()
	local fg = self.groupframes[id]
	local x, y = fg:GetLeft(), fg:GetTop()
	if ( not x or not y ) then
		return
	end
	for k, f in pairs(self.groupframes) do
		if k ~= id then
			local oX, oY = f:GetLeft(), f:GetTop()
			if ( oX and oY ) then
				f:ClearAllPoints()
				f:SetPoint("TOPLEFT", fg, "TOPLEFT", oX-x, oY-y)
			end
		end
	end
end

function sRaidFrames:StopMovingOrSizingAll()
	this.multidrag = nil
	local id = this:GetID()
	local fg = self.groupframes[id]
	for k, f in pairs(self.groupframes) do
		if k ~= id then
			local oX, oY = f:GetLeft(), f:GetTop()
			if ( oX and oY ) then
				f:ClearAllPoints()
				f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", oX, oY)
			end
		end
	end
end

function sRaidFrames:UnitTooltip(frame)
	local name, rank, subgroup, level, class, fileName, zone, online, isDead = GetRaidRosterInfo(frame.id);

	if self.currentGroupType ~= "raid" then
		name = UnitName(frame.unit)
		subgroup = 1
		level = UnitLevel(frame.unit)
		class, fileName = UnitClass(frame.unit)
		-- zone = -- 小队无法获取区域信息
	end

	if not fileName then return end

	self.mouseoverunit = frame.unit

	if self.opt.TooltipMethod == "never" then
		return
	elseif self.opt.TooltipMethod == "notincombat" and UnitAffectingCombat("player") then
		return
	end

	GameTooltip:SetOwner(frame)
	GameTooltip:AddDoubleLine(name, level, self.RAID_CLASS_COLORS[fileName].r, self.RAID_CLASS_COLORS[fileName].g, self.RAID_CLASS_COLORS[fileName].b, 1, 1, 1)
	GameTooltip:AddLine(UnitRace(frame.unit) .. " " .. class, 1, 1, 1);
	local groupLabel = "Group ".. subgroup
	if self.currentGroupType == "solo" then
		groupLabel = L["Solo"]
	end
	GameTooltip:AddDoubleLine(zone or ' ', groupLabel, 1, 1, 1, 1, 1, 1);

	if oRAOCoolDown and oRAOCoolDown.db.profile.cooldowns[name] and self.cooldownSpells[fileName] then
		GameTooltip:AddLine(" ")
		local expire = oRAOCoolDown.db.profile.cooldowns[name]-time()
		if expire > 0 then
  		GameTooltip:AddDoubleLine(self.cooldownSpells[fileName], SecondsToTime(expire), nil, nil, nil, 1, 0, 0)
  	else
  		GameTooltip:AddDoubleLine(self.cooldownSpells[fileName], "Ready!", nil, nil, nil, 0, 1, 0)
  	end
	end

	if ItemSocre and ItemSocre.ScanUnit then
		local score = ItemSocre:ScanUnit(frame.unit)
		if score and score > 0 then
			GameTooltip:AddDoubleLine(" ", "装备等级 " .. score, 1, 1, 1, 1, 1, 0)
		end
	end

	GameTooltip:Show()
end


function sRaidFrames:MouseOverHighlight(f, type)
	--DEFAULT_CHAT_FRAME:AddMessage(type)
	if type =="ENTER" then
		f.hpbar.highlight:Show()
	else
		f.hpbar.highlight:Hide()
	end
end

function sRaidFrames:CreateUnitFrame(id)
	local f = CreateFrame("Button", "sRaidFrames_" .. id, self.master)
	f:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp", "Button4Up", "Button5Up")
	f:SetScript("OnClick", self.OnUnitClick)
	f:SetScript("OnEnter", function() self:UnitTooltip(this) sRaidFrames:MouseOverHighlight(f, "ENTER") end)
	f:SetScript("OnLeave", function() GameTooltip:Hide() sRaidFrames:MouseOverHighlight(f, "LEAVE") sRaidFrames.mouseoverunit = nil end)

	f.title = f:CreateFontString(nil, "ARTWORK")
	f.title:SetFontObject(GameFontNormalSmall)
	f.title:SetJustifyH("LEFT")


	f.buff1 = CreateFrame("Button", nil, f)
	f.buff1.texture = f.buff1:CreateTexture(nil, "ARTWORK")
	f.buff1.texture:SetAllPoints(f.buff1)
	f.buff1.count = f.buff1:CreateFontString(nil, "OVERLAY")
	f.buff1.count:SetFontObject(GameFontHighlightSmallOutline)
	f.buff1.count:SetJustifyH("CENTER")
	f.buff1.count:SetPoint("CENTER", f.buff1, "CENTER", 0, 0);
	f.buff1:Hide()

	f.buff2 = CreateFrame("Button", nil, f)
	f.buff2.texture = f.buff2:CreateTexture(nil, "ARTWORK")
	f.buff2.texture:SetAllPoints(f.buff2)
	f.buff2.count = f.buff2:CreateFontString(nil, "OVERLAY")
	f.buff2.count:SetFontObject(GameFontHighlightSmallOutline)
	f.buff2.count:SetJustifyH("CENTER")
	f.buff2.count:SetPoint("CENTER", f.buff2, "CENTER", 0, 0);
	f.buff2:Hide()

	f.buff3 = CreateFrame("Button", nil, f)
	f.buff3.texture = f.buff3:CreateTexture(nil, "ARTWORK")
	f.buff3.texture:SetAllPoints(f.buff3)
	f.buff3.count = f.buff3:CreateFontString(nil, "OVERLAY")
	f.buff3.count:SetFontObject(GameFontHighlightSmallOutline)
	f.buff3.count:SetJustifyH("CENTER")
	f.buff3.count:SetPoint("CENTER", f.buff3, "CENTER", 0, 0);
	f.buff3:Hide()

	f.buff4 = CreateFrame("Button", nil, f)
	f.buff4.texture = f.buff4:CreateTexture(nil, "ARTWORK")
	f.buff4.texture:SetAllPoints(f.buff4)
	f.buff4.count = f.buff4:CreateFontString(nil, "OVERLAY")
	f.buff4.count:SetFontObject(GameFontHighlightSmallOutline)
	f.buff4.count:SetJustifyH("CENTER")
	f.buff4.count:SetPoint("CENTER", f.buff4, "CENTER", 0, 0);
	f.buff4:Hide()

	f.hpbar = CreateFrame("StatusBar", nil, f)
	f.hpbar:SetStatusBarTexture(surface:Fetch(self.opt.Texture))
	f.hpbar:SetMinMaxValues(0,100)
	f.hpbar:SetFrameLevel(2)

	f.hpbar.texture = f.hpbar:CreateTexture(nil, "BORDER")
	f.hpbar.texture:SetTexture(surface:Fetch(self.opt.Texture))
	f.hpbar.texture:SetVertexColor(1, 0, 0, 0)

	f.hpbar.highlight = f.hpbar:CreateTexture(nil, "OVERLAY")
	f.hpbar.highlight:SetAlpha(0.3)
	f.hpbar.highlight:SetTexture("Interface\\AddOns\\sRaidFrames\\textures\\MouseoverHighlight")
	f.hpbar.highlight:SetBlendMode("ADD")
	f.hpbar.highlight:Hide()

	f.hpbar.indicator1 = f.hpbar:CreateTexture(nil, "OVERLAY")
	f.hpbar.indicator1:SetAlpha(1)
	f.hpbar.indicator1:SetTexture("Interface\\Addons\\sRaidFrames\\textures\\round16x16")
	f.hpbar.indicator1:Hide()

	f.hpbar.indicator2 = f.hpbar:CreateTexture(nil, "OVERLAY")
	f.hpbar.indicator2:SetAlpha(1)
	f.hpbar.indicator2:SetTexture("Interface\\Addons\\sRaidFrames\\textures\\square16x16")
	f.hpbar.indicator2:Hide()

	f.hpbar.arrow = f.hpbar:CreateTexture(nil, "OVERLAY")
	f.hpbar.arrow:SetAlpha(1)
	f.hpbar.arrow:SetTexture("Interface\\Addons\\sRaidFrames\\textures\\arrows\\forward")
	f.hpbar.arrow:Hide()

	f.hpbar.text = f.hpbar:CreateFontString(nil, "ARTWORK")
	f.hpbar.text:SetFontObject(GameFontHighlightSmall)
	f.hpbar.text:SetJustifyH("CENTER")

	f.mpbar = CreateFrame("StatusBar", nil, f)
	f.mpbar:SetStatusBarTexture(surface:Fetch(self.opt.Texture))
	f.mpbar:SetMinMaxValues(0,100)

	f.mpbar.texture = f.mpbar:CreateTexture(nil, "BORDER")
	f.mpbar.texture:SetTexture(surface:Fetch(self.opt.Texture))
	f.mpbar.texture:SetVertexColor(1, 0, 0, 0)

	f.mpbar.text = f.mpbar:CreateFontString(nil, "ARTWORK")
	f.mpbar.text:SetFontObject(GameFontHighlightSmall)
	f.mpbar.text:SetJustifyH("CENTER")

    f.raidMarker = CreateFrame("Frame", nil , f)
    f.raidMarker.texture = f.raidMarker:CreateTexture(nil, "OVERLAY")
    f.raidMarker.texture:SetAllPoints(f.raidMarker)
	f.raidMarker:SetAlpha(0.5)
    f.raidMarker:Hide()

	f:SetID(id)
	f.id = id
	-- 使用动态unitId，初始时设置为raid格式，后续会动态更新
	f.unit = "raid" .. id

	self:SetStyle(f, "raid"..id)

	f:Hide();

	-- 增加不在视野覆盖层
	f.notinsightmask = f:CreateTexture(nil, "OVERLAY")
	f.notinsightmask:SetTexture(0, 0, 0, 0.5)
	f.notinsightmask:SetAllPoints(f)
	f.notinsightmask:Hide()

	self.frames["raid"..id] = f
end


function sRaidFrames:CreateGroupFrame(id)
	local f = CreateFrame("Frame", "sRaidGroupFrames_" .. id, self.master)
	f:SetHeight(15)
	f:SetWidth(90)
	f:SetMovable(true)
	f:EnableMouse(true)

	if id == 9 then
		f:SetScript("OnDragStart", function() if self.opt.lock_focus then return end if IsAltKeyDown() then self:StartMovingAll() end f:StartMoving() end)
	else
		f:SetScript("OnDragStart", function() if self.opt.lock then return end if IsAltKeyDown() then self:StartMovingAll() end f:StartMoving() end)
	end

	f:SetScript("OnDragStop", function() if f.multidrag == 1 then self:StopMovingOrSizingAll() end f:StopMovingOrSizing() self:SavePosition() end)
	f:RegisterForDrag("LeftButton")
	f:SetParent(self.master)

	f.title = f:CreateFontString(nil, "ARTWORK")
	f.title:SetFontObject(GameFontNormalSmall)
	f.title:SetJustifyH("CENTER")
	f.title:SetText("Group ".. id);
	if id ~= 9 and not self.opt.ShowGroupTitles or id == 9 and not self.opt.ShowGroupTitles_Focus then
		f.title:Hide()
	end

	self:SetWHP(f.title, 80, f:GetHeight(), "TOPLEFT", f, "TOPLEFT", 0, 0)

	f:ClearAllPoints();
	f:SetPoint("LEFT", self.master, "LEFT")


	f:SetID(id)
	f.id = id

	f:Hide();
	self.groupframes[id] = f
end

function sRaidFrames:SortGroupFrames(frame, id)
	frame:ClearAllPoints();
	if id == 1 then
		frame:SetPoint("TOPLEFT", self.master, "BOTTOMLEFT")
	else
		frame:SetPoint("TOPLEFT", self.groupframes[id-1], "BOTTOMLEFT")
	end
end

function sRaidFrames:SetBackdrop(f, unit, aggro)
	local frameUnit = self:GetFrameUnitId(unit) or unit
	local actualUnit = self:GetActualUnitToken(unit) or unit
	local aggroBorder = self:GetUnitHighlightState(unit, aggro)
	self:UpdateFrameBackdropLayout(f, aggroBorder)

	local dead = actualUnit and UnitExists(actualUnit) and ((UnitIsDeadOrGhost and UnitIsDeadOrGhost(actualUnit)) or (UnitHealth and UnitHealth(actualUnit) <= 1))
	if self.debuff[frameUnit] and not dead then
		local cAura = self.debuffColors[self.debuff[frameUnit]]
		f:SetBackdropColor(cAura.r, cAura.g, cAura.b, cAura.a);
	else
		f:SetBackdropColor(self.opt.BackgroundColor.r, self.opt.BackgroundColor.g, self.opt.BackgroundColor.b, self.opt.BackgroundColor.a)
	end

	self:ApplyUnitBorderState(f, unit, aggro)
end

function sRaidFrames:SetStyle(f, unit, width, aggro)
	local frame_width = width or self.opt.Width
	local actualUnit = self:GetActualUnitToken(unit)
	local powertype = actualUnit and UnitPowerType(actualUnit) or 0

	self:SetWHP(f, frame_width, 40)
	self:SetWHP(f.title, frame_width - 10, 16, "TOPLEFT", f, "TOPLEFT", 5, -6)

	if self.opt.Buff_Anchor == "topright" then
		self:SetWHP(f.buff1, self.opt.buff_size, self.opt.buff_size, "TOPRIGHT", f.hpbar, "TOPRIGHT", 0.35, 0)
		self:SetWHP(f.raidMarker, self.opt.raidmarker_size, self.opt.raidmarker_size, "BOTTOMLEFT", f.hpbar, "BOTTOMLEFT", 0, 0)
		if self.opt.Buff_Growth == "horizontal" then
			self:SetWHP(f.buff2, self.opt.buff_size, self.opt.buff_size, "RIGHT", f.buff1, "LEFT", 0, 0)
			self:SetWHP(f.buff3, self.opt.buff_size, self.opt.buff_size, "RIGHT", f.buff2, "LEFT", 0, 0)
			self:SetWHP(f.buff4, self.opt.buff_size, self.opt.buff_size, "RIGHT", f.buff3, "LEFT", 0, 0)
		elseif self.opt.Buff_Growth == "vertical" then
			self:SetWHP(f.buff2, self.opt.buff_size, self.opt.buff_size, "TOP", f.buff1, "BOTTOM", 0, 0)
			self:SetWHP(f.buff3, self.opt.buff_size, self.opt.buff_size, "TOP", f.buff2, "BOTTOM", 0, 0)
			self:SetWHP(f.buff4, self.opt.buff_size, self.opt.buff_size, "TOP", f.buff3, "BOTTOM", 0, 0)
		else
			self:SetWHP(f.buff2, self.opt.buff_size, self.opt.buff_size, "RIGHT", f.buff1, "LEFT", 0, 0)
			self:SetWHP(f.buff3, self.opt.buff_size, self.opt.buff_size, "TOP", f.buff1, "BOTTOM", 0, 0)
			self:SetWHP(f.buff4, self.opt.buff_size, self.opt.buff_size, "TOP", f.buff2, "BOTTOM", 0, 0)
		end
	else
		self:SetWHP(f.buff1, self.opt.buff_size, self.opt.buff_size, "BOTTOMRIGHT", f.hpbar, "BOTTOMRIGHT", 0.35, 0)
		self:SetWHP(f.raidMarker, self.opt.raidmarker_size, self.opt.raidmarker_size, "TOPLEFT", f.hpbar, "TOPLEFT", 0, 0)
		if self.opt.Buff_Growth == "horizontal" then
			self:SetWHP(f.buff2, self.opt.buff_size, self.opt.buff_size, "RIGHT", f.buff1, "LEFT", 0, 0)
			self:SetWHP(f.buff3, self.opt.buff_size, self.opt.buff_size, "RIGHT", f.buff2, "LEFT", 0, 0)
			self:SetWHP(f.buff4, self.opt.buff_size, self.opt.buff_size, "RIGHT", f.buff3, "LEFT", 0, 0)
		elseif self.opt.Buff_Growth == "vertical" then
			self:SetWHP(f.buff2, self.opt.buff_size, self.opt.buff_size, "BOTTOM", f.buff1, "TOP", 0, 0)
			self:SetWHP(f.buff3, self.opt.buff_size, self.opt.buff_size, "BOTTOM", f.buff2, "TOP", 0, 0)
			self:SetWHP(f.buff4, self.opt.buff_size, self.opt.buff_size, "BOTTOM", f.buff3, "TOP", 0, 0)
		else
			self:SetWHP(f.buff2, self.opt.buff_size, self.opt.buff_size, "RIGHT", f.buff1, "LEFT", 0, 0)
			self:SetWHP(f.buff3, self.opt.buff_size, self.opt.buff_size, "BOTTOM", f.buff1, "TOP", 0, 0)
			self:SetWHP(f.buff4, self.opt.buff_size, self.opt.buff_size, "BOTTOM", f.buff2, "TOP", 0, 0)
		end
	end

	if self.opt.PowerFilter[powertype] then
		self:SetWHP(f.hpbar, frame_width - 10, 26, "TOPLEFT", f, "BOTTOMLEFT", 5, 35)
	else
		self:SetWHP(f.hpbar, frame_width - 9.4, 30, "TOPLEFT", f, "BOTTOMLEFT", 4.75, 35)
	end

	self:SetWHP(f.mpbar, frame_width - 10, 4, "TOPLEFT", f.hpbar, "BOTTOMLEFT", 0, 0)

	if sRaidFrames.opt.heal == "round" then
		self:SetWHP(f.hpbar.indicator1, 7.7, 7.7, "TOPLEFT", f, "BOTTOMLEFT", 4, 37)
	else
		self:SetWHP(f.hpbar.indicator2, 4.5, 4.5, "TOPLEFT", f, "BOTTOMLEFT", 5, 35)
	end

	self:SetWHP(f.mpbar.text, f.mpbar:GetWidth(), f.mpbar:GetHeight(), "CENTER", f, "CENTER", 0, -11)
	self:SetWHP(f.hpbar.highlight, frame_width - 10, 30, "TOPLEFT", f, "BOTTOMLEFT", 5, 35) -- highlight
	self:SetWHP(f.hpbar.text, f.hpbar:GetWidth(), f.hpbar:GetHeight(), "CENTER", f, "CENTER", 0, -3.5)

	f.mpbar.text:SetTextHeight(7.5)
	f.hpbar.text:SetTextHeight(8)

	self:SetBackdrop(f, unit, aggro)

	self:SetWHP(f.hpbar.arrow, 20, 30, "CENTER", f, "CENTER", 0, 0)

	if self.opt.vertical_hp then
		f.hpbar:SetOrientation("VERTICAL")
	else
		f.hpbar:SetOrientation("HORIZONTAL")
	end
end

function sRaidFrames:SetWHP(frame, width, height, p1, relative, p2, x, y)
	frame:SetWidth(width)
	frame:SetHeight(height)

	if (p1) then
		frame:ClearAllPoints()
		frame:SetPoint(p1, relative, p2, x, y)
	end
end

function sRaidFrames:Sort_Force()

	--if self.opt.dynamic_sort then
	if self.preparesort and self.opt.dead_sort then
		self.preparesort = false
		self:Sort()
		--DEFAULT_CHAT_FRAME:AddMessage("Sort_Force")
	end


	sRaidFrames:SetDegTex()

	for id = 1, MAX_RAID_MEMBERS do
		local unit = self:GetActualUnitId(id)
		local frameUnit = "raid" .. id
		local frame = self.frames[frameUnit]
		if unit and self.visible[frameUnit] and frame then
			if self.opt.RangeCheck or self.opt.ExtendedRangeCheck or self.opt.ExtendedRangeCheckCombat then
				if sRaidFrames.unitxp then
					-- unitxp模块
					if self.UnitRangeArray then
						local unitRange = self:GetCachedUnitValue(self.UnitRangeArray, unit)
						-- 超出距离染色
						if unitRange then
							if UnitIsConnected(unit) and (unitRange == "" or unitRange > 40) then
								frame:SetAlpha(self.opt.RangeAlpha)
							else
								frame:SetAlpha(1)

								if self.UnitInSightArray then
									local inSight = self:GetCachedUnitValue(self.UnitInSightArray, unit)
									-- 不在视野染色
									if inSight == false then
										frame.notinsightmask:Show()
									else
										frame.notinsightmask:Hide()
									end
								end
							end
						else
							frame:SetAlpha(1)
							frame.notinsightmask:Hide()
						end
					end
				else
					-- 无unitxp模块
					local unitRange = self:GetCachedUnitValue(self.UnitRangeArray, unit)
					if unitRange ~= "" or UnitIsDeadOrGhost("player") then
						frame:SetAlpha(1)
					else
						frame:SetAlpha(self.opt.RangeAlpha)
					end
				end
			else
				frame:SetAlpha(1)
				frame.notinsightmask:Hide()
			end

			self:ApplyUnitBorderState(frame, frameUnit)
		end
	end
end

function sRaidFrames:ReturnClassCount(class)
	local counter_class = 0

	-- 根据当前组队类型计算职业数量
	if self.currentGroupType == "raid" then
		local NumMembers = GetNumRaidMembers()
		for counter = 1, NumMembers do
			local u = "raid"..counter
			if Zorlen_UnitClass(u) == class and not self:CheckFocusUnit(u) then
				counter_class = counter_class + 1
			end
		end
	elseif self.currentGroupType == "party" then
		-- 检查玩家
		if Zorlen_UnitClass("player") == class and not self:CheckFocusUnit("player") then
			counter_class = counter_class + 1
		end
		-- 检查队友
		for i = 1, 4 do
			local u = "party" .. i
			if UnitExists(u) and Zorlen_UnitClass(u) == class and not self:CheckFocusUnit(u) then
				counter_class = counter_class + 1
			end
		end
	elseif self.currentGroupType == "solo" then
		-- 只检查玩家
		if Zorlen_UnitClass("player") == class and not self:CheckFocusUnit("player") then
			counter_class = counter_class + 1
		end
	end

	return counter_class
end

function sRaidFrames:ReturnClassPrefix(class)
	if class == "Warrior" then
		return 1
	elseif class == "Rogue" then
		return 2
	elseif class == "Mage" then
		return 3
	elseif class == "Warlock" then
		return 4
	elseif class == "Druid" then
		return 5
	elseif class == "Priest" then
		return 6
	elseif class == "Shaman" then
		return 7
	elseif class == "Paladin" then
		return 7
	elseif class == "Hunter" then
		return 8
	else
		return ""
	end
end

function sRaidFrames:MembersSortBy(id)
	local sort_by = ""
	local unit = self:GetActualUnitId(id)
	if not unit then
		return "zzz" -- 无效单位排到最后
	end

	if self.opt.SubSort == "class" then
		local class = Zorlen_UnitClass(unit) or ""
		if UnitExists(unit) and class then
			local prefix = 0
			if self.opt.SortBy == "class" then
				prefix = self:ReturnClassCount(class) or 0
			else
				prefix = self:ReturnClassPrefix(class) or 0
			end
			sort_by = (prefix or 0)..(class or "")
		end
	elseif self.opt.SubSort == "name" then
		sort_by = UnitName(unit) or ""
	else
		-- 只有在团队状态下才使用队伍信息排序
		if self.currentGroupType == "raid" then
			local _, _, subgroup = GetRaidRosterInfo(id)
			sort_by = subgroup..id
		else
			-- 单人/小队状态下使用单位名称排序
			sort_by = UnitName(unit) or ""
		end
	end

	if self.opt.dead_sort and not self.feign[unit] then
		if not UnitIsConnected(unit) then
			sort_by = "zzz"..sort_by
		elseif UnitIsDead(unit) then
			sort_by = "zzy"..sort_by
		elseif UnitIsGhost(unit) then
			sort_by = "zzx"..sort_by
		elseif UnitHealth(unit) <= 1 then
			sort_by = "zzw"..sort_by
		end
	end
	return sort_by
end

function sRaidFrames:Sort(force_sort)
	local self = sRaidFrames
	local frameAssignments = {}
	local sort = {}
	local counter={0,0,0,0,0,0,0,0,0}

	--self:RefreshFocusWithRange()


	for id = 1, MAX_RAID_MEMBERS do
		if self.visible["raid" .. id] then
			--if not force_sort or force_sort and self:CheckFocusUnit("raid"..id) then
				table.insert(sort, id)
			--end
		end
	end
	if self.opt.ReverseSort then
		table.sort(sort, function(a,b) return self:MembersSortBy(a) > self:MembersSortBy(b) end)
	else
		table.sort(sort, function(a,b) return self:MembersSortBy(a) < self:MembersSortBy(b) end)
	end

	if self.opt.SortBy == "class" then
		local queue = {}

		table.insert(queue, "Warrior")
		table.insert(queue, "Mage")
		if UnitFactionGroup("player") == "Alliance" then table.insert(queue, "Paladin")	else table.insert(queue, "Shaman") end
		table.insert(queue, "Druid")
		table.insert(queue, "Hunter")
		table.insert(queue, "Rogue")
		table.insert(queue, "Warlock")
		table.insert(queue, "Priest")

		if self.opt.ReverseSort then
			table.sort(queue, function(a,b) return sRaidFrames:ReturnClassCount(a) < sRaidFrames:ReturnClassCount(b) end)
		else
			table.sort(queue, function(a,b) return sRaidFrames:ReturnClassCount(a) > sRaidFrames:ReturnClassCount(b) end)
		end

		for i=1,8 do
			frameAssignments[string.upper(queue[i])] = i
		end

		self.groupframes[frameAssignments["WARRIOR"]].title:SetText(L["Warrior"]);
		self.groupframes[frameAssignments["MAGE"]].title:SetText(L["Mage"]);
		if UnitFactionGroup("player") == "Alliance" then
			self.groupframes[frameAssignments["PALADIN"]].title:SetText(L["Paladin"]);
		else
			self.groupframes[frameAssignments["SHAMAN"]].title:SetText(L["Shaman"]);
		end
		self.groupframes[frameAssignments["DRUID"]].title:SetText(L["Druid"]);
		self.groupframes[frameAssignments["HUNTER"]].title:SetText(L["Hunter"]);
		self.groupframes[frameAssignments["ROGUE"]].title:SetText(L["Rogue"]);
		self.groupframes[frameAssignments["WARLOCK"]].title:SetText(L["Warlock"]);
		self.groupframes[frameAssignments["PRIEST"]].title:SetText(L["Priest"]);

	elseif self.opt.SortBy == "group" or self.opt.SortBy == "fixed" then
		frameAssignments[1] = 1;
		frameAssignments[2] = 2;
		frameAssignments[3] = 3;
		frameAssignments[4] = 4;
		frameAssignments[5] = 5;
		frameAssignments[6] = 6;
		frameAssignments[7] = 7;
		frameAssignments[8] = 8;

		if self.currentGroupType == "solo" then
			self.groupframes[1].title:SetText(L["Solo"]);
		else
			self.groupframes[1].title:SetText(L["Group 1"]);
		end
		self.groupframes[2].title:SetText(L["Group 2"]);
		self.groupframes[3].title:SetText(L["Group 3"]);
		self.groupframes[4].title:SetText(L["Group 4"]);
		self.groupframes[5].title:SetText(L["Group 5"]);
		self.groupframes[6].title:SetText(L["Group 6"]);
		self.groupframes[7].title:SetText(L["Group 7"]);
		self.groupframes[8].title:SetText(L["Group 8"]);
	end

	frameAssignments[9] = 9;
	self.groupframes[9].title:SetText("Focus");

	-- -- -- Do the sorting -- -- --

	local focus_units1 = {}
	local focus_units2 = {}
	for _,id in pairs(sort) do
		local unit = self:GetActualUnitId(id)
		if unit and self:CheckFocusUnit(unit) then
			table.insert(focus_units1, id)
		end
	end

	--if self.opt.dynamic_sort then
	--	table.sort(focus_units1, function(a,b) return self:UnitModHP("raid".. a) < self:UnitModHP("raid"..b) end)
	--end

	local index = 40
	for id in pairs(self.UnitSortOrder) do
		index = index + 1
		self.UnitSortOrder[id] = index
	end

	for i,id in pairs(focus_units1) do
		focus_units2[id] = i-1
		self.UnitSortOrder[id] = i
	end

	for _,id in pairs(sort) do
		local frameAssignee = nil
		if self.opt.SortBy == "class" then
			local unit = self:GetActualUnitId(id)
			if unit then
				local _, eClass = UnitClass(unit)
				if eClass then
					frameAssignee = frameAssignments[eClass]
				end
			end
		elseif self.opt.SortBy == "group" then
			-- 只有在团队状态下才使用队伍排序
			if self.currentGroupType == "raid" then
				local name, _, subgroup = GetRaidRosterInfo(id)
				if name and subgroup then
					frameAssignee = frameAssignments[subgroup]
				end
			else
				-- 单人/小队状态下使用固定排序
				frameAssignee = 1
			end
		else
			for k=8,1,-1 do
				if counter[k] < self.opt.fixed_count then
					frameAssignee = k
				end
			end
		end

		local growth = self.opt.Growth
		local unit = self:GetActualUnitId(id)
		if unit and self:CheckFocusUnit(unit) then
			frameAssignee = 9
			growth = self.opt.Growth_Focus
		end

		if frameAssignee then
			local f = self.frames["raid" .. id]
			local groupframe = self.groupframes[frameAssignee]

			local count = counter[frameAssignee]
			if focus_units2[id] then
				count = focus_units2[id]
			end

			if growth == "up" then
				a1, a2, yMod, xMod = "BOTTOM", "TOP", (count*(f:GetHeight()+self.opt.Spacing)), 0
			elseif growth == "right" then
				a1, a2, yMod, xMod = "TOP", "BOTTOM", 0, (count*(f:GetWidth()+self.opt.Spacing))
			elseif growth == "left" then
				a1, a2, yMod, xMod = "TOP", "BOTTOM", 0, -1*(count*(f:GetWidth()+self.opt.Spacing))
			else
				a1, a2, yMod, xMod = "TOP", "BOTTOM", -1*(count*(f:GetHeight()+self.opt.Spacing)), 0
			end

			f:ClearAllPoints()
			f:SetPoint(a1, groupframe, a2, xMod, yMod)

			counter[frameAssignee] = counter[frameAssignee] + 1
			groupframe:Show()

			if frameAssignee ~= 9 and self.opt.ShowGroupTitles or frameAssignee == 9 and self.opt.ShowGroupTitles_Focus then
				groupframe.title:Show()
			else
				groupframe.title:Hide()
			end
		end
	end

	-- Hide group frames which contain no children
	--if not force_sort then
		for k,v in pairs(counter) do
			if v == 0 then
				self.groupframes[k]:Hide()
			end
		end

		self:UpdateAllUnits()
	--else
		--self:UpdateUnit(self.visible, force_sort)
	--end

end

function sRaidFrames:OnUnitClick()
	local unitid, button = this.unit, arg1;

	if sRaidFramesCustomOnClickFunction and sRaidFramesCustomOnClickFunction(button, unitid) then
		return
	end
    if arg1 == "LeftButton" then
		if SpellIsTargeting() then
			SpellTargetUnit(unitid)
		elseif CursorHasItem() then
			DropItemOnUnit(unitid)
		else
			TargetUnit(unitid)
		end
	else --Thanks Luna :^)
		local name = UnitName(unitid)
		local id = string.match(unitid or "", "(%d+)$") or string.sub(unitid,5)
		local menuFrame = FriendsDropDown
		menuFrame.displayMode = "MENU"
		if name == UnitName("player") then
			menuFrame.initialize = function() UnitPopup_ShowMenu(_G[UIDROPDOWNMENU_OPEN_MENU], "SELF", "player") end
		else
			menuFrame.initialize = function() UnitPopup_ShowMenu(_G[UIDROPDOWNMENU_OPEN_MENU], "PARTY", unitid, name, id) end
		end
		ToggleDropDownMenu(1, nil, FriendsDropDown, "cursor")
	end
	-- if ( SpellIsTargeting() ) then
	-- 	SpellTargetUnit(unitid)
	-- else
	-- 	TargetUnit(unitid)
	-- end
end

function sRaidFrames:SetPosition()
	if not self.opt.Positions then
		self:ResetPosition()
	else
		self:RestorePosition()
	end
end

function sRaidFrames:SavePosition()
	local aryPos = {}
	local s = self.master:GetEffectiveScale()

	for k,f in pairs(self.groupframes) do
		aryPos[k] = {x = f:GetLeft()*s, y = f:GetTop()*s}
	end

	self:S("Positions", aryPos)
end

function sRaidFrames:RestorePosition()
	local aryPos = self.opt.Positions
	local s = self.master:GetEffectiveScale()

	for k, pos in pairs(aryPos) do
		local f = self.groupframes[k]
		f:ClearAllPoints()
		f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", pos["x"]/s, pos["y"]/s)
	end
end

function sRaidFrames:ResetPosition()
	self:PositionLayout("sticky", 200, -300)
	self:S("ScaleFocus", sRaidFrames.opt.Scale)
	self:S("WidthFocus", sRaidFrames.opt.Width)
	self:LoadStyle()
end

function sRaidFrames:PositionLayout(layout, xBuffer, yBuffer)
	local xMod, yMod, i = 0, 0, -1
	local frameHeight = self.frames["raid1"]:GetHeight()+3
	local f = self.frames["raid1"]

	for k,v in pairs(self.groupframes) do
		i = i + 1

		if k == 9 then
			xMod = 2*(f:GetHeight()*self.master:GetScale()+self.opt.Spacing)
			yMod = f:GetWidth()*self.master:GetScale()+self.opt.Spacing
		elseif layout == "horizontal" then
			yMod = (i) * v:GetWidth()
			xMod = 0
		elseif layout == "vertical" then
			if i ~= 0 and math_mod(i, 2) == 0 then
				xMod = xMod + (-1*self.opt.fixed_count*frameHeight)
				yMod = 0
				i = 0
			else
				yMod = i * v:GetWidth()
			end
		elseif layout == "ctra" then
			if i ~= 0 and math_mod(i, 2) == 0 then
				yMod = yMod + v:GetWidth()
				xMod = 0
				i = 0
			else
				xMod = i * (-1*self.opt.fixed_count*frameHeight)
			end
		elseif layout == "sticky" then
			local growth = self.opt.Growth
			if growth == "right" or growth == "left" then
				yMod = 0
				xMod = -1*(f:GetHeight()*self.master:GetScale()+self.opt.Spacing)*k
			else

				yMod = (f:GetWidth()*self.master:GetScale()+self.opt.Spacing)*k
				xMod = 0
			end
		end
			v:ClearAllPoints()
			v:SetPoint("TOPLEFT", UIParent, "TOPLEFT", xBuffer+yMod, yBuffer+xMod)
	end
	self:SavePosition()
end


local Tablet = AceLibrary:HasInstance("Tablet-2.0") and AceLibrary("Tablet-2.0") or nil
function sRaidFrames:OnTooltipUpdate()
	if Tablet then
		Tablet:SetHint(L["Right-click for options."])
	end
end

function sRaidFrames:S(var, val)
	self.db.profile[var] = val
end


--==Added by Ogrisch

function sRaidFrames:ShowHealIndicator(unit)
	if not unit or self.opt.heal == "none" then return end
	unit = self:GetFrameUnitId(unit) or unit

	if not self.indicator[unit] then
		self.indicator[unit] = 0
	end

	--if not unit or not self.indicator or not self.indicator[unit] then return end

	if self.indicator[unit] then
		self.indicator[unit] = self.indicator[unit] + 1
	end

	self:SetHealIndicator(unit);
end

function sRaidFrames:HideHealIndicator(unit, force)
	if not unit or self.opt.heal == "none" then return end
	unit = self:GetFrameUnitId(unit) or unit

	if not self.indicator[unit] then
		self.indicator[unit] = 0
	end

	if self.indicator[unit] and self.indicator[unit] > 0 then
		if force then
			self.indicator[unit] = 0
		else
			self.indicator[unit] = self.indicator[unit] - 1
		end
	end

	self:SetHealIndicator(unit);
end

function sRaidFrames:SetHealIndicator(unit)
	local frameUnit = self:GetFrameUnitId(unit) or unit
	local actualUnit = self:GetActualUnitToken(unit)
	if not frameUnit or not actualUnit or not UnitExists(actualUnit) or not self.frames or not self.frames[frameUnit] then
		return
	end

	local f = nil

	if self.opt.heal == "round" then
		f = self.frames[frameUnit].hpbar.indicator1
	else
		f = self.frames[frameUnit].hpbar.indicator2
	end

	if self.indicator[frameUnit] == 0 then
		f:SetVertexColor(0, 0, 0, 0)
		f:Hide()
	else
		if self.indicator[frameUnit] == 1 then
			f:SetVertexColor(0, 1, 0, 1)
		elseif self.indicator[frameUnit] == 2 then
			f:SetVertexColor(1, 1, 0, 1)
		elseif self.indicator[frameUnit] == 3 then
			f:SetVertexColor(1, 0.4, 0, 1)
		else
			f:SetVertexColor(1, 0, 0, 1)
		end

		f:Show()
	end
end

function sRaidFrames:CombatStarts()
	self:ResetHealIndicators()
	if self.enabled then
		self:UpdateAllUnits()
		self:Sort_Force()
	end
end

function sRaidFrames:CombatEnds()
	self:ResetHealIndicators()
	for key,value in pairs(self.res) do
		self.res[key] = nil
	end
	if self.enabled then
		self:UpdateAllUnits()
		self:Sort_Force()
	end
end

function sRaidFrames:ResetHealIndicators(mode)
	if self.enabled and self.indicator then
		for key,value in pairs(self.indicator) do
			self.indicator[key] = 0
			self:SetHealIndicator(key)
			--if mode == "force" then
				--self.indicator[key] = nil
			--end
		end
	end
end

function sRaidFrames:LoadStyle()
	for unit in pairs(self.visible) do
		local frame = self.frames[unit]
		if frame then
			local aggro = self:GetUnitAggro(unit)
			if self:CheckFocusUnit(unit) then
				self:SetStyle(frame, unit, self.opt.WidthFocus, aggro)
				frame:SetScale(self.opt.ScaleFocus)
			else
				self:SetStyle(frame, unit, self.opt.Width, aggro)
				frame:SetScale(self.opt.Scale)
			end

			if frame.raidMarker then
				frame.raidMarker:SetAlpha(self.opt.raidMarkerAlpha)
			end
		end
	end

	self:Sort();
end

function sRaidFrames:CheckFocusUnit(unit)
	if not unit then
		return
	end
	local actualUnit = self:GetActualUnitToken(unit)
	if not actualUnit or not UnitExists(actualUnit) then
		return
	end
	local name = UnitName(actualUnit)
	if not name then
		return
	end

	if self.UnitFocusArray[name] or self.opt.WSG_Focus and self:CheckCarrier(actualUnit) then
		return true
	end

	return nil
end

function sRaidFrames:AddRemoveFocusUnit(unit)
	local err_txt = "Unit not in Group"
	if UnitExists(unit) then
		if Zorlen_isEnemy and Zorlen_isEnemy(unit)  then
			err_txt = "Unit Has no Target"
			if UnitExists(unit.."target") and UnitIsFriend(unit.."target", "player") then
				unit = unit.."target"
			end
		end
	end

	local name = UnitName(unit)

	local _, classFileName = UnitClass(unit)
	--local color = self.classColors[classFileName]
	local color = self.RAID_CLASS_COLORS[classFileName] and self.RAID_CLASS_COLORS[classFileName].colorStr

	if self.UnitFocusArray[name] then
		self.UnitFocusArray[name] = nil
		UIErrorsFrame:Clear()
		UIErrorsFrame:AddMessage(color.."Remove Focus: "..name)

		self:UpdateRaidFrames()

		return true
	end

	local unit = roster:GetUnitIDFromName(name)

	if unit then
		self.UnitFocusArray[name] = true
		UIErrorsFrame:Clear()
		UIErrorsFrame:AddMessage(color.."Add Focus : "..name)

		self:UpdateRaidFrames()
		return true
	else
		UIErrorsFrame:Clear()
		UIErrorsFrame:AddMessage("|cFFFF0000"..err_txt)
		return nil
	end
	return
end


function sRaidFrames:CheckCarrier(unit)
	local actualUnit = self:GetActualUnitToken(unit)
	local name = actualUnit and GetUnitName and GetUnitName(actualUnit)
	if self.carrier and name and strlower(name) == self.carrier and not (UnitIsDeadOrGhost and UnitIsDeadOrGhost(actualUnit)) then
		return true
	end
	return nil
end

function sRaidFrames:UpdateRaidFrames()
	self:UpdateVisibility()
	self:LoadStyle()
end

function sRaidFrames:TrackCarrier(msg)
	local oposite_faction = "Alliance"
	if UnitFactionGroup("player") == oposite_faction then
		oposite_faction = "Horde"
	end
	if msg then
		msg = strlower(msg)

		local find0 = "captured "
		local find1 = "The "..oposite_faction.." Flag"
		local find2 = " was picked up "
		local find3 = " was dropped "

		if string.find(msg, strlower(find1..find2)) then
			_, _, self.carrier = string.find(msg, strlower(find1..find2.."by (.+)%!"))
			self:UpdateRaidFrames()
		elseif string.find(msg, strlower(find1..find3)) or string.find(msg, strlower(find0..find1)) then
			self.carrier = nil
			self:UpdateRaidFrames()
		end
	end
end

function sRaidFrames:SetDegTex(force)
	if force then
		self.ArrowsDisable = nil
	elseif self.ArrowsDisable then
		return
	end

	if not self.opt.RangeCheck and not self.opt.ExtendedRangeCheck and not self.opt.ExtendedRangeCheckCombat or not sRaidFrames.opt.ArrowsEnable or not self.MapEnable or self:GetCurrentGroupType() == "solo" then
		self.ArrowsDisable = true
	end

	-- 根据当前组队类型确定循环范围
	local maxCount = MAX_RAID_MEMBERS -- self:GetMaxLoopCount()
	for id = 1, maxCount do
		if self.visible["raid" .. id] then
			local unit = self:GetActualUnitId(id)
			if unit then
				local dir = sRaidFramesArrows:CalcDegUnit(unit) - sRaidFramesArrows.direction - 180
				local ArrowIcon
				local OffSet
				local FILE_PATH = "Interface\\Addons\\sRaidFrames\\textures\\arrows\\"

				if(dir and not self.ArrowsDisable) then
					OffSet = tonumber(dir)
					if(OffSet)then
						if(OffSet > 180 )then
							OffSet = OffSet - 360
						elseif(OffSet < -180) then
							OffSet = OffSet + 360
						end
					end

					if(OffSet)and ((OffSet >=-5) and ( OffSet <= 5))or(OffSet < -355) then
						ArrowIcon = FILE_PATH.."forward"
					elseif(OffSet)and (OffSet < -5) and (OffSet >= -15) then
						ArrowIcon = FILE_PATH.."FLeft+2"
					elseif(OffSet)and (OffSet < -15) and (OffSet >= -35) then
						ArrowIcon = FILE_PATH.."FLeft+1"
					elseif(OffSet)and (OffSet < -35) and (OffSet >= -55) then
						ArrowIcon = FILE_PATH.."FLeft"
					elseif(OffSet)and (OffSet < -55) and (OffSet >= -65) then
						ArrowIcon = FILE_PATH.."FLeft-1"
					elseif(OffSet)and (OffSet < -65) and (OffSet >= -80) then
						ArrowIcon = FILE_PATH.."FLeft-2"
					elseif(OffSet)and (OffSet < -80) and (OffSet >= -100) then
						ArrowIcon = FILE_PATH.."left"
					elseif(OffSet)and (OffSet < -100) and (OffSet >= -115) then
						ArrowIcon = FILE_PATH.."BLeft-2"
					elseif(OffSet)and (OffSet < -115) and (OffSet >= -135) then
						ArrowIcon = FILE_PATH.."BLeft-1"
					elseif(OffSet)and (OffSet < -135) and (OffSet >= -155) then
						ArrowIcon = FILE_PATH.."BLeft"
					elseif(OffSet)and (OffSet < -155) and (OffSet >= -165) then
						ArrowIcon = FILE_PATH.."BLeft+1"
					elseif(OffSet)and (OffSet < -165) and (OffSet >= -175) then
						ArrowIcon = FILE_PATH.."BLeft+2"
					elseif(OffSet)and ((OffSet < -175) and (OffSet >= -190)) or((OffSet > 175) and (OffSet <= 190)) then
						ArrowIcon = FILE_PATH.."Backward"
					elseif(OffSet)and (OffSet > 165) and (OffSet <= 175) then
						ArrowIcon = FILE_PATH.."BRight+2"
					elseif(OffSet)and (OffSet > 155) and (OffSet <= 165) then
						ArrowIcon = FILE_PATH.."BRight+1"
					elseif(OffSet)and (OffSet > 135) and (OffSet <= 155) then
						ArrowIcon = FILE_PATH.."BRight"
					elseif(OffSet)and (OffSet > 115) and (OffSet <= 135) then
						ArrowIcon = FILE_PATH.."BRight-1"
					elseif(OffSet)and (OffSet > 100) and (OffSet <= 115) then
						ArrowIcon = FILE_PATH.."BRight-2"
					elseif(OffSet)and (OffSet > 80) and (OffSet <= 100) then
						ArrowIcon = FILE_PATH.."right"
					elseif(OffSet)and (OffSet > 65) and (OffSet <= 80) then
						ArrowIcon = FILE_PATH.."FRight-2"
					elseif(OffSet)and (OffSet > 55) and (OffSet <= 65) then
						ArrowIcon = FILE_PATH.."FRight-1"
					elseif(OffSet)and (OffSet > 35) and (OffSet <= 55) then
						ArrowIcon = FILE_PATH.."FRight"
					elseif(OffSet)and (OffSet > 15) and (OffSet <= 35) then
						ArrowIcon = FILE_PATH.."FRight+1"
					elseif(OffSet)and (OffSet > 5) and (OffSet <= 15) then
						ArrowIcon = FILE_PATH.."FRight+2"
					else
						ArrowIcon = FILE_PATH.."Arrived"
					end
				end

				if not self.ArrowsDisable and self.visible["raid" .. id] and not self:GetCachedUnitValue(self.unavail, unit) and not UnitIsDeadOrGhost("player") and self:GetCachedUnitValue(self.UnitRangeArray, unit) == "" and sRaidFramesArrows.direction ~= 0 and sRaidFramesArrows.ZoneUnit["raid" .. id] and (not self.opt.FocusArrows or self.opt.FocusArrows and self:CheckFocusUnit(unit)) then
					self.frames["raid" .. id].hpbar.arrow:SetTexture(ArrowIcon);
					self.frames["raid" .. id].hpbar.arrow:Show()
				else
					self.frames["raid" .. id].hpbar.arrow:Hide()
				end
			end
		end
	end


end



function cba()
	DEFAULT_CHAT_FRAME:AddMessage(igCreatureAggroSelect)

end


function sRaidFrames:UpdateRaidMarkers()
    for id = 1, MAX_RAID_MEMBERS do
        local unit = self:GetActualUnitId(id)
        if unit and UnitExists(unit) then
            local markerIndex = GetRaidTargetIndex and GetRaidTargetIndex(unit)
            local frame = self.frames and self.frames["raid" .. id]
            local markerTexCoord = {
                [1] = {0, 0.25, 0, 0.25},   -- 星星
                [2] = {0.25, 0.5, 0, 0.25}, -- 大饼
                [3] = {0.5, 0.75, 0, 0.25}, -- 三角
                [4] = {0.75, 1, 0, 0.25},   -- 月亮
                [5] = {0, 0.25, 0.25, 0.5}, -- 方块
                [6] = {0.25, 0.5, 0.25, 0.5}, -- 红叉
                [7] = {0.5, 0.75, 0.25, 0.5}, -- 紫菱
                [8] = {0.75, 1, 0.25, 0.5}  -- 骷髅
            }
            local texCoord = markerTexCoord[markerIndex] or {0, 0, 0, 0}
            if markerIndex and self.opt and self.opt.raidmarker_onable and frame and frame.raidMarker then
                frame.raidMarker.texture:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
                frame.raidMarker.texture:SetTexCoord(unpack(texCoord))
                frame.raidMarker:SetAlpha(self.opt.raidMarkerAlpha or 0.5)
                frame.raidMarker:Show()
            elseif frame and frame.raidMarker then
                frame.raidMarker:Hide()
            end
        end
    end
end
