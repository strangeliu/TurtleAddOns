HunterTracker = {}
HunterTracker.version = "1.1.1"
HunterTrackerSaved = HunterTrackerSaved or {}

local trackingTypes = {
	{ name = "追踪野兽", 		spell = "追踪野兽" },
	{ name = "追踪恶魔", 		spell = "追踪恶魔" },
	{ name = "追踪龙类", 		spell = "追踪龙类" },
	{ name = "追踪元素生物", 	spell = "追踪元素生物" },
	{ name = "追踪巨人", 		spell = "追踪巨人" },
	{ name = "追踪隐藏生物", 	spell = "追踪隐藏生物" },
	{ name = "追踪人型生物", 	spell = "追踪人型生物" },
	{ name = "追踪亡灵", 		spell = "追踪亡灵" },
	{ name = "寻找草药", 		spell = "寻找草药" },
	{ name = "寻找树木", 		spell = "寻找树木" },
	{ name = "寻找矿物", 		spell = "寻找矿物" },
}

local function GetSpellIcon(spellName)
	for i = 1, 256 do
		local name = GetSpellName(i, BOOKTYPE_SPELL)
		if name then
			if name == spellName then
				return GetSpellTexture(i, BOOKTYPE_SPELL)
			end
			if string.find(name, spellName) then
				return GetSpellTexture(i, BOOKTYPE_SPELL)
			end
		end
	end
	return "Interface\\Icons\\Ability_Tracking"
end

local function UpdateButtonIcon(spellName)
	if HunterTrackerButtonIcon then
		local tex = GetSpellIcon(spellName)
		if tex then
			HunterTrackerButtonIcon:SetTexture(tex)
		end
	end
end

local function CastTracking(spellName)
	CastSpellByName(spellName)
	if HunterTrackerSaved then
		HunterTrackerSaved.lastSpell = spellName
	end
	if HunterTrackerDropdown then
		HunterTrackerDropdown:Hide()
	end
	UpdateButtonIcon(spellName)
end

local function CreateDropdown()
	if HunterTrackerDropdown then return end

	local dropdown = CreateFrame("Frame", "HunterTrackerDropdown", UIParent)
	dropdown:SetWidth(160)
	dropdown:SetHeight(264)
	dropdown:SetFrameStrata("DIALOG")
	dropdown:Hide()

	for i = 1, table.getn(trackingTypes) do
		local spellName = trackingTypes[i].spell
		local btn = CreateFrame("Button", nil, dropdown)
		btn:SetWidth(140)
		btn:SetHeight(22)
		btn:SetPoint("TOPLEFT", dropdown, "TOPLEFT", 10, -(i - 1) * 24 - 8)
		btn:EnableMouse(true)

		local icon = btn:CreateTexture(nil, "BACKGROUND")
		icon:SetWidth(18)
		icon:SetHeight(18)
		icon:SetPoint("LEFT", btn, "LEFT", 2, 0)
		
		local tex = GetSpellIcon(spellName)
		if tex then
			icon:SetTexture(tex)
		else
			icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
		end

		local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
		text:SetText(trackingTypes[i].name)
		text:SetPoint("LEFT", icon, "RIGHT", 6, 0)

		btn:SetScript("OnClick", function()
			CastTracking(spellName)
		end)
	end
end

function HunterTracker.ToggleMenu()
	CreateDropdown()
	
	if HunterTrackerDropdown:IsVisible() then
		HunterTrackerDropdown:Hide()
		return
	end
	
	if HunterTrackerButton then
		local x, y = HunterTrackerButton:GetLeft(), HunterTrackerButton:GetBottom()
		HunterTrackerDropdown:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
	else
		HunterTrackerDropdown:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	end
	HunterTrackerDropdown:Show()
end

local button = CreateFrame("Button", "HunterTrackerButton", UIParent)
button:SetWidth(24)
button:SetHeight(24)
button:SetFrameStrata("HIGH")
button:SetFrameLevel(100)

local icon = button:CreateTexture("HunterTrackerButtonIcon", "BACKGROUND")
icon:SetAllPoints()
icon:SetTexture("Interface\\Icons\\Ability_Tracking")

button:SetScript("OnClick", function()
	HunterTracker.ToggleMenu()
end)

button:SetScript("OnEnter", function()
	GameTooltip:SetOwner(button, "ANCHOR_BOTTOM")
	GameTooltip:SetText("猎人追踪助手")
	GameTooltip:Show()
end)

button:SetScript("OnLeave", function()
	GameTooltip:Hide()
end)

button:EnableMouse(true)
button:SetMovable(true)
button:RegisterForDrag("LeftButton")
button:SetScript("OnDragStart", function()
	if IsAltKeyDown() then
		button:StartMoving()
	end
end)
button:SetScript("OnDragStop", function()
	button:StopMovingOrSizing()
	if HunterTrackerSaved then
		HunterTrackerSaved.posX = button:GetLeft()
		HunterTrackerSaved.posY = button:GetTop()
	end
end)

if HunterTrackerSaved and HunterTrackerSaved.posX and HunterTrackerSaved.posY then
	button:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", HunterTrackerSaved.posX, HunterTrackerSaved.posY)
else
	button:SetPoint("TOPRIGHT", Minimap, "TOPLEFT", -5, -5)
end

if HunterTrackerSaved and HunterTrackerSaved.lastSpell then
	UpdateButtonIcon(HunterTrackerSaved.lastSpell)
end

SLASH_HUNTERTRACKER1 = "/ht"
SlashCmdList["HUNTERTRACKER"] = function()
	HunterTracker.ToggleMenu()
end

DEFAULT_CHAT_FRAME:AddMessage("猎人追踪助手 v" .. HunterTracker.version .. " 已加载", 0.68, 0.85, 0.2)