local _G, _M = getfenv(0), {}
setfenv(1, setmetatable(_M, {__index=_G}))

CreateFrame('GameTooltip', 'SortBagsTooltip', nil, 'GameTooltipTemplate')

local function IsPlayingOnTurtleWoW()
	return TargetHPText ~= nil and TargetHPPercText ~= nil
end

local function IsSuperWoWLoaded()
	return SetAutoloot ~= nil
end

local function GetContainerItemCount(container, position)
	local _, countOrCharges = GetContainerItemInfo(container, position)
	local count = countOrCharges
	if IsSuperWoWLoaded() and countOrCharges < 0 then
		count = 1
	end
	return count
end

local CONTAINERS
local REVERSE

function _G.Clean_Up(containers, reverse)
	if containers == 'bags' then
		CONTAINERS = {0, 1, 2, 3, 4}
	elseif containers == 'bank' then
		CONTAINERS = {-1, 5, 6, 7, 8, 9, 10}
	else
		error()
	end
	REVERSE = reverse
	Start()
end

function _G.SortBags()
	CONTAINERS = {0, 1, 2, 3, 4}
	REVERSE = _G.SortBagsRightToLeft
	Start()
end

function _G.SortBankBags()
	CONTAINERS = {-1, 5, 6, 7, 8, 9, 10}
	REVERSE = _G.SortBagsRightToLeft
	Start()
end

function _G.GetSortBagsRightToLeft(enabled)
	return SortBagsRightToLeft
end

function _G.SetSortBagsRightToLeft(enabled)
	_G.SortBagsRightToLeft = enabled and 1 or nil
end

local function set(...)
	local t = {}
	for i = 1, arg.n do
		t[arg[i]] = true
	end
	return t
end

local function union(...)
	local t = {}
	for i = 1, arg.n do
		for k in arg[i] do
			t[k] = true
		end
	end
	return t
end

local ITEM_TYPES = {GetAuctionItemClasses()}

local MOUNT = set(
	5864, 5872, 5873, 18785, 18786, 18787, 18244, 19030, 13328, 13329,
	2411, 2414, 5655, 5656, 18778, 18776, 18777, 18241, 12353, 12354,
	8629, 8631, 8632, 18766, 18767, 18902, 18242, 13086, 19902, 12302, 12303, 8628, 12326,
	8563, 8595, 13321, 13322, 18772, 18773, 18774, 18243, 13326, 13327,
	15277, 15290, 18793, 18794, 18795, 18247, 15292, 15293,
	1132, 5665, 5668, 18796, 18797, 18798, 18245, 12330, 12351,
	8588, 8591, 8592, 18788, 18789, 18790, 18246, 19872, 8586, 13317,
	13331, 13332, 13333, 13334, 18791, 18248, 13335,
	21218, 21321, 21323, 21324, 21176
)

local SPECIAL = set(5462, 9173, 17056, 17696, 17117, 13347, 13289, 11511, 41915, 61000)

local KEY = set(9240, 17191, 13544, 12324, 16309, 12384, 20402)

local TOOL = set(6218, 6339, 11130, 11145, 16207, 5060, 7005, 12709, 19727, 5956, 2901, 6219, 10498, 9149, 15846, 6256, 6365, 6366, 6367, 55155, 41326, 41327, 41328, 12225, 19022, 19970)

local ENCHANTING_REAGENT = set(
	10940, 11083, 11137, 11176, 16204,
	10938, 10939, 10998, 11082, 11134, 11135, 11174, 11175, 16202, 16203,
	10978, 11084, 11138, 11139, 11177, 11178, 14343, 14344,
	20725
)

local HERBS = set(765, 785, 2447, 2449, 2450, 2452, 2453, 3355, 3356, 3357, 3358, 3369, 3818, 3819, 3820, 3821, 4625, 8153, 8831, 8836, 8838, 8839, 8845, 8846, 13463, 13464, 13465, 13466, 13467, 13468)

local SEEDS = set(17034, 17035, 17036, 17037, 17038)

local CLASSES = {
	{
		containers = {2101, 5439, 7278, 11362, 3573, 3605, 7371, 8217, 2662, 19319, 18714, 61549},
		items = set(2512, 2515, 3030, 3464, 9399, 11285, 12654, 18042, 19316),
	},
	{
		containers = {2102, 5441, 7279, 11363, 3574, 3604, 7372, 8218, 2663, 19320},
		items = set(2516, 2519, 3033, 3465, 4960, 5568, 8067, 8068, 8069, 10512, 10513, 11284, 11630, 13377, 15997, 19317),
	},
	{
		containers = {22243, 22244, 21340, 21341, 21342},
		items = set(6265, 6990, 16583, 5565),
	},
	{
		containers = {22246, 22248, 22249},
		items = union(ENCHANTING_REAGENT, set(6218, 6339, 11130, 11145, 16207)),
	},
	{
		containers = {22250, 22251, 22252},
		items = union(HERBS, SEEDS),
	},
}

local defaultDelay = 0.2
if IsPlayingOnTurtleWoW() then
	defaultDelay = 1.2
end

local model, itemStacks, itemClasses, itemSortKeys

do
    local f = CreateFrame("Frame", "Clean_UpFrame", UIParent)
    f:Hide()

    local timeout

    function Start()
        if f:IsShown() then return end
        Initialize()
        timeout = GetTime() + 7
        f:Show()
    end

    local delay = 0
    f:SetScript('OnUpdate', function()
        delay = delay - arg1
        if delay <= 0 then
            delay = defaultDelay
            local complete = Sort()
            if complete or GetTime() > timeout then
                f:Hide()
                return
            end
            Stack()
        end
    end)
end

do
	local function key(table, value)
		for k, v in table do
			if v == value then
				return k
			end
		end
	end

	function ItemTypeKey(itemClass)
		return key(ITEM_TYPES, itemClass) or 0
	end

	function ItemSubTypeKey(itemClass, itemSubClass)
		return key({GetAuctionItemSubClasses(ItemTypeKey(itemClass))}, itemClass) or 0
	end

	function ItemInvTypeKey(itemClass, itemSubClass, itemSlot)
		return key({GetAuctionInvTypes(ItemTypeKey(itemClass), ItemSubTypeKey(itemSubClass))}, itemSlot) or 0
	end
end

function LT(a, b)
	local i = 1
	while true do
		if a[i] and b[i] and a[i] ~= b[i] then
			return a[i] < b[i]
		elseif not a[i] and b[i] then
			return true
		elseif not b[i] then
			return false
		end
		i = i + 1
	end
end

function Move(src, dst)
    local texture, _, srcLocked = GetContainerItemInfo(src.container, src.position)
    local _, _, dstLocked = GetContainerItemInfo(dst.container, dst.position)
    
	if texture and not srcLocked and not dstLocked then
		ClearCursor()
       	PickupContainerItem(src.container, src.position)
		PickupContainerItem(dst.container, dst.position)

		if src.item == dst.item then
			local count = min(src.count, itemStacks[dst.item] - dst.count)
			src.count = src.count - count
			dst.count = dst.count + count
			if src.count == 0 then
				src.item = nil
			end
		else
			src.item, dst.item = dst.item, src.item
			src.count, dst.count = dst.count, src.count
		end

		return true
    end
end

function TooltipInfo(container, position)
	local chargesPattern = '^' .. gsub(gsub(ITEM_SPELL_CHARGES_P1, '%%d', '(%%d+)'), '%%%d+%$d', '(%%d+)') .. '$'

	SortBagsTooltip:SetOwner(UIParent, 'ANCHOR_NONE')
	SortBagsTooltip:ClearLines()

	if container == BANK_CONTAINER then
		SortBagsTooltip:SetInventoryItem('player', BankButtonIDToInvSlotID(position))
	else
		SortBagsTooltip:SetBagItem(container, position)
	end

	local charges, usable, soulbound, quest, conjured
	for i = 1, SortBagsTooltip:NumLines() do
		local text = getglobal('SortBagsTooltipTextLeft' .. i):GetText()

		local _, _, chargeString = strfind(text, chargesPattern)
		if chargeString then
			charges = tonumber(chargeString)
		elseif strfind(text, '^' .. ITEM_SPELL_TRIGGER_ONUSE) then
			usable = true
		elseif text == ITEM_SOULBOUND then
			soulbound = true
		elseif text == ITEM_BIND_QUEST then
			quest = true
		elseif text == ITEM_CONJURED then
			conjured = true
		end
	end

	return charges or 1, usable, soulbound, quest, conjured
end

function Sort()
	local complete = true
	
	for _, dst in model do
		if dst.targetItem and (dst.item ~= dst.targetItem or dst.count < dst.targetCount) then
			complete = false

			local sources, rank = {}, {}

			for _, src in model do
				if src.item == dst.targetItem
					and src ~= dst
					and not (dst.item and src.class and src.class ~= itemClasses[dst.item])
					and not (src.targetItem and src.item == src.targetItem and src.count <= src.targetCount)
				then
					rank[src] = abs(src.count - dst.targetCount + (dst.item == dst.targetItem and dst.count or 0))
					tinsert(sources, src)
				end
			end

			sort(sources, function(a, b) return rank[a] < rank[b] end)

			for _, src in sources do
				if Move(src, dst) then
					break
				end
			end
		end
	end
	
	return complete
end

function Stack()
	for _, src in model do
		if src.item and src.count < itemStacks[src.item] and src.item ~= src.targetItem then
			for _, dst in model do
				if dst ~= src and dst.item and dst.item == src.item and dst.count < itemStacks[dst.item] and dst.item ~= dst.targetItem then
					Move(src, dst)
				end
			end
		end
	end
end

do
	local counts

	local function insert(t, v)
		if REVERSE then
			tinsert(t, v)
		else
			tinsert(t, 1, v)
		end
	end

	local function assign(slot, item)
		if counts[item] > 0 then
			local count
			if REVERSE and mod(counts[item], itemStacks[item]) ~= 0 then
				count = mod(counts[item], itemStacks[item])
			else
				count = min(counts[item], itemStacks[item])
			end
			slot.targetItem = item
			slot.targetCount = count
			counts[item] = counts[item] - count
			return true
		end
	end

	function Initialize()
		model, counts, itemStacks, itemClasses, itemSortKeys = {}, {}, {}, {}, {}

		for _, container in CONTAINERS do
			local class = ContainerClass(container)
			for position = 1, GetContainerNumSlots(container) do
				local slot = {container=container, position=position, class=class}
				local item = Item(container, position)
				if item then
					local count = GetContainerItemCount(container, position)
					slot.item = item
					slot.count = count
					counts[item] = (counts[item] or 0) + count
				end
				insert(model, slot)
			end
		end

		local free = {}
		for item, count in counts do
			local stacks = ceil(count / itemStacks[item])
			free[item] = stacks
			if itemClasses[item] then
				free[itemClasses[item]] = (free[itemClasses[item]] or 0) + stacks
			end
		end
		for _, slot in model do
			if slot.class and free[slot.class] then
				free[slot.class] = free[slot.class] - 1
			end
		end

		local items = {}
		for item in counts do
			tinsert(items, item)
		end
		sort(items, function(a, b) return LT(itemSortKeys[a], itemSortKeys[b]) end)

		for _, slot in model do
			if slot.class then
				for _, item in items do
					if itemClasses[item] == slot.class and assign(slot, item) then
						break
					end
				end
			else
				for _, item in items do
					if (not itemClasses[item] or free[itemClasses[item]] > 0) and assign(slot, item) then
						if itemClasses[item] then
							free[itemClasses[item]] = free[itemClasses[item]] - 1
						end
						break
					end
				end
			end
		end
	end
end

function ContainerClass(container)
	if container ~= 0 and container ~= BANK_CONTAINER then
		local name = GetBagName(container)
		if name then		
			for class, info in CLASSES do
				for _, itemID in info.containers do
					if name == GetItemInfo(itemID) then
						return class
					end
				end	
			end
		end
	end
end

function Item(container, position)
	local link = GetContainerItemLink(container, position)
	if link then
		local _, _, itemID, enchantID, suffixID, uniqueID = strfind(link, 'item:(%d+):(%d*):(%d*):(%d*)')
		itemID = tonumber(itemID)
		local _, _, quality, _, type, subType, stack, invType = GetItemInfo(itemID)
		local charges, usable, soulbound, quest, conjured = TooltipInfo(container, position)
		
		local sortKey = {}
		
		if itemID == 6948 then
			tinsert(sortKey, 1)
		elseif MOUNT[itemID] then
			tinsert(sortKey, 2)
		elseif SPECIAL[itemID] then
			tinsert(sortKey, 3)
		elseif KEY[itemID] then
			tinsert(sortKey, 4)
		elseif TOOL[itemID] then
			tinsert(sortKey, 5)
		elseif itemID == 6265 then
			tinsert(sortKey, 14)
		elseif conjured then
			tinsert(sortKey, 15)
		elseif soulbound then
			tinsert(sortKey, 6)
		elseif ENCHANTING_REAGENT[itemID] then
			tinsert(sortKey, 7)
		elseif type == ITEM_TYPES[9] then
			tinsert(sortKey, 8)
		elseif quest then
			tinsert(sortKey, 10)
		elseif usable and type ~= ITEM_TYPES[1] and type ~= ITEM_TYPES[2] and type ~= ITEM_TYPES[8] or type == ITEM_TYPES[4] then
			tinsert(sortKey, 9)
		elseif quality > 1 then
			tinsert(sortKey, 11)
		elseif quality == 1 then
			tinsert(sortKey, 12)
		elseif quality == 0 then
			tinsert(sortKey, 13)
		end
		
		tinsert(sortKey, ItemTypeKey(type))
		tinsert(sortKey, ItemInvTypeKey(type, subType, invType))
		tinsert(sortKey, ItemSubTypeKey(type, subType))
		tinsert(sortKey, -quality)
		tinsert(sortKey, itemID)
		tinsert(sortKey, (REVERSE and 1 or -1) * charges)
		tinsert(sortKey, suffixID)
		tinsert(sortKey, enchantID)
		tinsert(sortKey, uniqueID)

		local key = format('%s:%s:%s:%s:%s:%s', itemID, enchantID, suffixID, uniqueID, charges, (soulbound and 1 or 0))

		itemStacks[key] = stack
		itemSortKeys[key] = sortKey

		for class, info in CLASSES do
			if info.items[itemID] then
				itemClasses[key] = class
				break
			end
		end

		return key
	end
end