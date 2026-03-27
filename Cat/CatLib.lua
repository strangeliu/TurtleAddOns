_G = getfenv()

-- 辅助功能类开关：1开启 0关闭
CAT_SHOW_CHANGES = 0					-- 是否显示切换装备/天赋时，显示耗能/耗蓝变化的提示信息，建议使用神像舞时关闭，以避免由于神像变化带来的信息过载

-- 全局参数

-- 种族
MPPlayerRace = nil

-- 职业
_, MPPlayerClass = UnitClass("player")

-- 种族体型影响的近战距离
MPMeleeRange = 2.4

-- 是否携带爆发饰品
MP_Trinket_Upper = 0			-- 饰品上面
MP_Trinket_Below = 0			-- 饰品下面

-- 目标是否可以流血，该值已经通过目标切换事件动态调整
MPTargetBleed = true

-- 进入战斗/战斗时间
MPInCombat = false
MPInCombatTime = 0

-- 启动自动攻击
MPAutoAttack = false
MPAutoAttackLock = false
MPAutoAttackLockTimer = 0

-- 角色治疗量
MPHealingPower = 0
-- 角色急速
MPHasteRating = 0

-- 提示信息
MPTipsColor = "|cFF9264cdCat|r |cFFc3a7e2"

-- 版本
MPCatAddonVer = "2026-03-27"

-- 调试
MPCatDebug = 1

MPSendCatMsgTimer = 0

if not MPPublicSaved then
    MPPublicSaved = {}
end



local function GetChatFrameByName(frameName)
    for i = 1, NUM_CHAT_WINDOWS do
        local name = GetChatWindowInfo(i)
        if name and name == frameName then
            return _G["ChatFrame"..i]
        end
    end
    return nil
end

-- 将调试信息打印在Cat频道窗口里
function MPMsg(str)

	if MPCatDebug==0 then
		return
	end

	local chat = GetChatFrameByName("Cat")
	if not chat then chat = GetChatFrameByName("CAT") end
	if not chat then chat = GetChatFrameByName("cat") end

	if chat then
		--chat:AddMessage(MPTipsColor.."["..string.format("%d",GetTime()*1000).."] |r "..str)
		local timeTable = date("*t")
		chat:AddMessage(MPTipsColor.."["..string.format("%02d",timeTable.hour)..":"..string.format("%02d",timeTable.min)..":"..string.format("%02d",timeTable.sec).."] |r "..str)
	end
	--DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."["..string.format("%.2f",GetTime()).."] |r "..str)
end

--开始自动攻击
function MPStartAttack()

	--[[

	for A=1,172 do
		if IsAttackAction(A) then
			if not IsCurrentAction(A) then
				UseAction(A)
				return
			end
		end
	end
	]]


	--AttackTarget()
	--if ( not PlayerFrame.inCombat ) and UnitExists("target") then CastSpellByName("攻击") end


	if not MPAutoAttack and not MPAutoAttackLock then
		--MPAutoAttack = true
		MPAutoAttackLock = true
		MPAutoAttackLockTimer = GetTime()
		AttackTarget()
	end

	--[[
	if _G["PlayerFrame"] ~= nil then
		if not PlayerFrame.inCombat then CastSpellByName("攻击") end
	else
	end
	]]

end


-- 目标已死或者不存在，自动切换目标
function MPAutoSwitchTarget(value, type)
	value = value or 0
	type = type or 1		-- 1=近战 2=远程
	local isClear = 0

	if value==0 then
		return
	end

	local target = UnitExists("target")

	-- 是否存在目标
	if not target then
		isClear = 1
	else

		-- 目标是否超出近战距离
		if type==1 and target and not MPGetTargetDistance() then
			if MPScanNearbyEnemiesCount() > 0 then
				isClear = 1
			end
		end

		-- UnitXP存在，增加一个机制
		if type==1 and MP_UnitXP and target then
			-- 目标在你背后
			if UnitXP("behind", "target", "player") then
				isClear = 1
			end
		end

		--[[
		-- 目标在特殊状态下
		if not MPCheckAllowAttack("target") then
			isClear = 1
		end
		]]

		-- 目标是否可以攻击
		if not UnitCanAttack("player", "target") then
			ClearTarget()
			isClear = 1
		end

		-- 目标是否死亡
		if UnitIsDeadOrGhost("target") then
			ClearTarget()
			isClear = 1
		end

	end



    -- 如果当前目标不存在/已死亡/不可攻击
    if isClear==1 then
		TargetNearestEnemy()
    end

	--MPStartAttack() -- 启动自动攻击
end


-- 选择远处目标
-- 需要UnitXP模组
function MPSwitchDistantTarget(value)
	value = value or 1

	if value==0 then
		return
	end

	if not MP_UnitXP then
		return
	end


    local list = {}
    local count = 0

    _,count,_,_,list = MPScanNearbyEnemiesCount()

    if count==0 then
        --pirnt("周围没有敌人")
        return
    end

	local farway = 0
	local target = nil

	for key, value in pairs(list) do
		local dist = UnitXP("distanceBetween", "player", key)
		if dist and dist > farway then
			farway = dist
			target = key
		end
	end

	-- 选择扫描后目标
	if target~=nil then
		TargetUnit(target)
	end

end


--停止自动攻击
function MPStopAttack()

	if MPIsAutoAttack() then
		CastSpellByName("攻击")
	end

end




-- （#废弃#）获取对象buff
-- buffname名称（精确判断，区分大小写），unit对象类型
-- return 获取成立返回真

local CatPlusTooltip = CreateFrame("GameTooltip", "CatPlusTooltip", UIParent, "GameTooltipTemplate")


function MPBuffed(buffname, unit)
	CatPlusTooltip:SetOwner(UIParent, "ANCHOR_NONE");
	if (not buffname) then
		return;
	end;
	if (not unit) then
		unit="player";
	end;
	if string.lower(unit) == "mainhand" then
		CatPlusTooltip:ClearLines();
		CatPlusTooltip:SetInventoryItem("player",GetInventorySlotInfo("MainHandSlot"));
		for i = 1,CatPlusTooltip:NumLines() do
			if getglobal("CatPlusTooltipTextLeft"..i):GetText() == buffname then
				return true
			end;
		end
		return false
	end
	if string.lower(unit) == "offhand" then
		CatPlusTooltip:ClearLines();
		CatPlusTooltip:SetInventoryItem("player",GetInventorySlotInfo("SecondaryHandSlot"));
		for i=1,CatPlusTooltip:NumLines() do
			if getglobal("CatPlusTooltipTextLeft"..i):GetText() == buffname then
				return true
			end;
		end
		return false
	end
  local i = 1;
  while UnitBuff(unit, i) do 
		CatPlusTooltip:ClearLines();
		CatPlusTooltip:SetUnitBuff(unit,i);
    if CatPlusTooltipTextLeft1:GetText() == buffname then
      return true, i
    end;
    i = i + 1;
  end;
  local i = 1;
  while UnitDebuff(unit, i) do 
		CatPlusTooltip:ClearLines();
		CatPlusTooltip:SetUnitDebuff(unit,i);
    if CatPlusTooltipTextLeft1:GetText() == buffname then
      return true, i
    end;
    i = i + 1;
  end;
end



function MPPlayerBuffNameByIndex(index)
    CatPlusTooltip:SetOwner(UIParent, "ANCHOR_NONE");
    CatPlusTooltip:SetPlayerBuff(index);
    local buffName = CatPlusTooltipTextLeft1:GetText();
    CatPlusTooltip:Hide();

	if buffName then
		return true, buffName
	end

	return false, "未发现BUFF"
end

-- 内部调用
function MPGetBuffNameByIndex(unit, index)
	if UnitBuff(unit, index) then
		CatPlusTooltip:SetOwner(UIParent, "ANCHOR_NONE");
		CatPlusTooltip:SetUnitBuff(unit, index);
		local buffName = CatPlusTooltipTextLeft1:GetText();
		CatPlusTooltip:Hide();

		if buffName then
			return true, buffName
		end
	end

	return false, "未发现BUFF"
end

-- 内部调用
function MPGetDebuffNameByIndex(unit, index)
	if UnitDebuff(unit, index) then
		CatPlusTooltip:SetOwner(UIParent, "ANCHOR_NONE");
		CatPlusTooltip:SetUnitDebuff(unit, index);
		local buffName = CatPlusTooltipTextLeft1:GetText();
		CatPlusTooltip:Hide();

		if buffName then
			return true, buffName
		end
	end

	return false, "未发现BUFF"
end



-- 查找 Aura（BUFF 或 DEBUFF）并返回可能的时间，-1为未找到
function MPBuffTime(buffName, unit)
	unit = unit or "player";  -- 默认检查玩家自己

	-- 提取buff的index
	local has, index = MPBuff(buffName, unit)
	if not has then
		return -1
	end

	return GetPlayerBuffTimeLeft(index)
end

--[[ 废弃
function MPBuffTimeFromID(buffID, unit)
	unit = unit or "player";  -- 默认检查玩家自己

	-- 提取buff的index
	for i = 1, 32 do
		local indexTex,_,spellID = UnitBuff(unit,i)
		-- 找到buff，并ID正确
		if spellID and spellID==buffID then
			print(spellID)
			print(i)
			return GetPlayerBuffTimeLeft(i-1)
		end
	end

	return -1
end
]]


function MPBuffTimeFromTex(buffIcon)
	unit = "player"

	-- 提取buff的index
	for i = 0, 32 do

		-- 通过索引尝试访问buff
		local indexTex = GetPlayerBuffTexture(i)
		if not indexTex then
			break
		end

		-- 校验图标
		if indexTex == buffIcon then
			local timeleft = GetPlayerBuffTimeLeft(i)
			if timeleft>0 then
				return timeleft
			end
		end

	end

	return -1
end



-- 查找 Aura（BUFF 或 DEBUFF）并返回 (found, index)
-- @param targetName: 要查找的 Aura 名称（如 "真言术：盾"、"中毒"）
-- @param unit: 目标单位（默认为 "player"）
-- 支持SuperWoW
function MPBuff(buffName, unit)
	unit = unit or "player";  -- 默认检查玩家自己
	local maxIndex = 32;

	if unit == "player" then
		-- 扫描buff位
		local count = 0
		for i = 0, maxIndex do
			-- 通过索引尝试访问buff
			local found, name = MPPlayerBuffNameByIndex(i)
			if not found then
				break
			end

			--message(name)
			count = count+1

			-- 找到buff，并名称正确
			if name==buffName then
				return true, i
			end
		end

	else
		-- 扫描debuff位
		for i = 1, maxIndex do
			-- 通过索引尝试访问buff
			local found, name = MPGetDebuffNameByIndex(unit,i)
			if not found then
				break
			end

			-- 找到buff，并名称正确
			if name==buffName then
				return true, i
			end
		end

		-- 扫描buff位
		for i = 1, maxIndex do
			-- 通过索引尝试访问buff
			local found, name = MPGetBuffNameByIndex(unit,i)
			if not found then
				break
			end

			-- 找到buff，并名称正确
			if name==buffName then
				return true, i
			end
		end

	end

    return false, -1  -- 未找到
end

-- 取消自己身上的buff
-- @param buffName: 要取消的Buff名称（如 "野性印记"、"恢复"）
function MPCancelBuffByName(buffName, unit)
	unit = unit or "player";  -- 默认检查玩家自己
	local f, i = MPBuff(buffName, unit)
	if f then
		CancelPlayerBuff(i)
	end
end

-- 获取buff层数
function MPGetBuffLevel(buffName, unit)
	unit = unit or "player";  -- 默认检查玩家自己

	local f, i = MPBuff(buffName, unit)
	if not f then
		return 0
	end

	local bufft,bufflevel = UnitBuff(unit,i)

	if bufft then
		return bufflevel
	end

	return 0
end

-- 获取debuff层数
function MPGetDebuffLevel(buffName, unit)
	unit = unit or "player";  -- 默认检查玩家自己

	local f, i = MPBuff(buffName, unit)
	if not f then
		return 0
	end

	bufft,bufflevel = UnitDebuff(unit,i)

	if bufft then
		return bufflevel
	end

	return 0
end

-- 获取debuff类型
--  "Magic", "Curse", "Poison", "Disease"
function MPIsDebuffType(type, unit)
	unit = unit or "player";  -- 默认检查玩家自己

	for i = 1, 16 do
		local bufft,bufflevel,bufftype = UnitDebuff(unit,i)
		if bufftype==type then
			return true
		end
	end

	return false
end


function MPGetTexFromBuff(index, unit)
	unit = unit or "player";  -- 默认检查玩家自己

	local bufft,bufflevel = UnitBuff(unit,index)
	if bufft then
		return bufft
	end

	return nil
end


function MPBuffFromTex(buffIcon, unit)
	unit = unit or "player";  -- 默认检查玩家自己

	for i = 1, 32 do
		bufft,bufflevel = UnitBuff(unit,i)
		if bufft and bufft==buffIcon then
			return true
		end
	end

	for i = 1, 64 do
		bufft,bufflevel = UnitDebuff(unit,i)
		if bufft and bufft==buffIcon then
			return true
		end
	end

	return false
end

-- 获取buff层数，通过图标
function MPGetBuffApplications(buffIcon, unit)
	unit = unit or "player";  -- 默认检查玩家自己


	for i = 1, 64 do
		bufft,bufflevel = UnitBuff(unit,i)
		if bufft and bufft==buffIcon then
			--message(unit.." index: "..i.."   texture: "..bufft)
			return bufflevel
		end
	end
	for i = 1, 64 do
		debufft,debufflevel = UnitDebuff(unit,i)
		if debufft and debufft==buffIcon then
			--message(unit.." index: "..i.."   texture: "..bufft)
			return debufflevel
		end
	end

	return 0
end

-- 获取debuff层数，通过图标
function MPGetDebuffApplications(buffIcon, unit)
	unit = unit or "player";  -- 默认检查玩家自己

	for i = 1, 64 do
		bufft,bufflevel = UnitDebuff(unit,i)
		if bufft and bufft==buffIcon then
			--message(unit.." index: "..i.."   texture: "..bufft)
			return bufflevel
		end
	end

	return 0
end


function MPDebugShowBuffTex(unit)
	unit = unit or "player";  -- 默认检查玩家自己

	for i=1,64 do
		s=UnitBuff(unit, i); 
		if(s) then 
			message("B "..i..": "..s); 
		end 
	end

	for i=1,64 do
		s=UnitDebuff(unit, i); 
		if(s) then 
			message("D "..i..": "..s); 
		end 
	end
end


-- 保持自己身上的buff
function MPHoldBuff(buffName)
	if buffName and not MPBuff(buffName) then
		CastSpellByName(buffName)
	end
end




-- 获取技能是否CD结束
-- name技能名称
-- return 获取成立返回真
function MPSpellReady(name)
	local spell_id = MPGetSpellID(name)

	-- 不存在该技能
	if spell_id == 0 then
		return false
	end

	if GetSpellCooldown(spell_id, "spell") == 0 then
		return true
	end
	return false
end



-- 获取技能是否CD结束，增加可以判断还差多久结束
-- name技能名称，offset偏移值，空为默认0.5秒
-- return 获取成立返回真
function MPSpellReadyOffset(name,offset)
	if not offset then offset=0.5 end
	if MPGetSpellCooldown(name) <offset then
		return true
	end
	return false
end

function MPGetSpellCooldown(spell)
	local i = MPGetSpellID(spell)

	-- 不存在该技能
	if i==0 then
		return 0
	end

	local start, dur = GetSpellCooldown(i, "spell")
	local time = dur-(GetTime()-start);
	if time < 0 then time=0 end
	return time
end

function MPGetSpellID(name, rank)
	local i = 0
	local spellName = " "
	while spellName ~= nil do
		i = i + 1
		spellName, spellRank = GetSpellName(i, "spell")

		if rank then
			if spellName==name and spellRank== rank then
				return i
			end
		else
			if spellName==name then
				return i
			end
		end
	end
	return 0
end


------------------------
-- 施法
------------------------

function MPCastSpellWithoutTarget(spellName, unit, tip)

	tip = tip or 0;

	if not unit then
		return false
	end

	if tip>0 then
		MPMsg(spellName.."-> ["..UnitName(unit).."]")
	end

    --[[
	local selfCast = GetCVar("autoSelfCast")
	SetCVar("autoSelfCast", "0")

	CastSpellByName(spellName)

	if unit == "player" then
	print("---player")
		SpellTargetUnit(unit)
		if SpellIsTargeting() then
			SpellStopTargeting()
		end

		SetCVar("autoSelfCast", selfCast)

	elseif UnitIsVisible(unit) and SpellCanTargetUnit(unit) then
	print(unit)
		SpellTargetUnit(unit)
		if SpellIsTargeting() then
			SpellStopTargeting()
		end

		SetCVar("autoSelfCast", selfCast)
	else
		--DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."施法对象 ["..UnitName(unit).."] 无法治疗！")
		if SpellIsTargeting() then
			SpellStopTargeting()
		end

		SetCVar("autoSelfCast", selfCast)
		return false
	end


	]]


	-- 保存当前目标
	local obj,oldTargetGUID = UnitExists("target")

	-- 临时选中目标
	if unit == "target" then
	else
		TargetUnit(unit)
	end
    
	-- 施法
	if UnitIsVisible(unit) then

		MPCastWithoutNampower(spellName)

		-- 恢复原来的目标
		if unit ~= "target" then
			if obj then
				TargetUnit(oldTargetGUID)
			else
				ClearTarget()
			end
		end

	else
		-- 恢复原来的目标
		if unit ~= "target" then
			if obj then
				TargetUnit(oldTargetGUID)
			else
				ClearTarget()
			end
		end

		return false
	end

	return true
end



function MPCast(spellName, unit)
	local NP_QueueChannelingSpells
	if MP_Nampower then
		NP_QueueChannelingSpells = GetCVar("NP_QueueChannelingSpells")
		if NP_QueueChannelingSpells ~= 0 then
			SetCVar("NP_QueueChannelingSpells", 0)
		end
	end

	CastSpellByName(spellName)

	if MP_Nampower then
		SetCVar("NP_QueueChannelingSpells", NP_QueueChannelingSpells)
	end

end

function MPCastWithNampower(spellName, unit)
	if MP_Nampower then
		QueueSpellByName(spellName)
	else
		CastSpellByName(spellName)
	end
end

function MPCastWithoutNampower(spellName)
	if MP_Nampower then
		SetCVar("NP_QueueCastTimeSpells", "0")
		SetCVar("NP_QueueInstantSpells", "0")
		CastSpellByName(spellName)
		SetCVar("NP_QueueCastTimeSpells", "1")
		SetCVar("NP_QueueInstantSpells", "1")
	else
		CastSpellByName(spellName)
	end
end


-- 施法的替代宏，针对Nampower的施法队列
-- 使用方法同CastSpellByName
function MPCastSpell(spellName)
	if MP_Nampower then
		QueueSpellByName(spellName)
	else
		CastSpellByName(spellName)
	end
end

--[[ 预备删除
-- 猫德变身特殊函数
-- 临时使用
function MPCastCat()

	if TURTLE_WOW_VERSION and string.find(TURTLE_WOW_VERSION, "1.18") then
		CastSpellByName("重整")
		return
	end

	if CatModVersion==12 then
		CastSpellByName("精灵之火（野性）(等级 1)")
	elseif CatModVersion==10 then
		CastSpellByName("追踪人型生物")
	else
		CastSpellByName("猎豹形态(变形)")
	end
end

]]


-- 检测是否可以进行攻击
function MPCheckAllowAttack(unit)

    if MPBuff("变形术", unit) then
        return false
    end
    if MPBuff("变形术：猪", unit) then
        return false
    end
    if MPBuff("变形术：龟", unit) then
        return false
    end
    if MPBuff("变形术：鼠", unit) then
        return false
    end
    if MPBuff("变形术：奶牛", unit) then
        return false
    end

    if MPBuff("放逐术", unit) then
        return false
    end

    if MPBuff("休眠", unit) then
        return false
    end
    if MPBuff("束缚亡灵", unit) then
        return false
    end
    if MPBuff("​​冰冻陷阱", unit) then
        return false
    end
    if MPBuff("​​闷棍", unit) then
        return false
    end
    if MPBuff("​​致盲", unit) then
        return false
    end

    return true

end



-- 获取当前姿态，战士、德鲁伊可用
-- id顺序1-6
-- return 获取到返回真
function MPGetShape(id)
	local _,_,a=GetShapeshiftFormInfo(id)
	if a then return true end

	return false
end


-- 获取当前是否为人形，德鲁伊可用
-- return 获取到返回真
function MPIsHumanForm()
	local i
	for i = 1, 8 do
		if MPGetShape(i) then
			return false
		end
	end

	return true
end

-- 取消德鲁伊形态
function MPResetShapes()
	for i=1, GetNumShapeshiftForms() do
		local _,_,a = GetShapeshiftFormInfo(i)
		if a then
			CastShapeshiftForm(i)
		end
	end
end

-- 德鲁伊变形后的蓝获取
-- return 蓝量，获取不到返回0，变身下可用
function MPDriudMana()

	local e,m = UnitMana("player")
	if not m then
		return 0
	end
	return m

end

-- 使用背包中物品
-- itemName 物品名
-- return 存在为真
function MPUseItemByName(itemName)
	local bag, slot
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local _, _, name = string.find(itemLink, "%[(.-)%]")
                if name == itemName then
					local startTime, duration, enable = GetContainerItemCooldown(bag, slot)
					if enable then
						if duration-(GetTime()-startTime) <= 1 then
							UseContainerItem(bag, slot)
							return true
						end
					end
                    return false
                end
            end
        end
    end

    return false
end

-- 检查背包中物品CD
-- return 存在为真
function MPGetItemByNameCD(itemName)
	local bag, slot
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local _, _, name = string.find(itemLink, "%[(.-)%]")
                if name == itemName then
					local startTime, duration, enable = GetContainerItemCooldown(bag, slot)
					if duration-(GetTime()-startTime) <= 1 then
						return true
					end
                    return false
                end
            end
        end
    end

    return false
end

-- 检查背包中物品ID
-- return id
function MPGetItemByNameID(itemName)
	local bag, slot
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local _, _, name = string.find(itemLink, "%[(.-)%]")
                if name == itemName then
					local itemID = MPMatch(itemLink, "item:(%d+):")
					if itemID then
						return MPToNumber(itemID)
					end
                end
            end
        end
    end

    return 0
end

-- 检查背包中物品数量
-- return 数量
function MPGetItemByNameCount(itemName)
	local bag, slot
	local count = 0
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local _, _, name = string.find(itemLink, "%[(.-)%]")
                if name == itemName then
					local _,c = GetContainerItemInfo(bag,slot)
					if c then
						if c<0 then
							count = count + (c*-1)
						else
							count = count+c
						end
					end
                end
            end
        end
    end

    return count
end

-- 获取背包中物品贴图
-- return 
function MPGetItemTexByName(itemName)
	local bag, slot
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local _, _, name = string.find(itemLink, "%[(.-)%]")
                if name == itemName then
                    return GetContainerItemInfo(bag, slot)
                end
            end
        end
    end

    return nil
end

-- 背包里装备穿戴到身上
function MPEquipItemByName(itemName, inventory)
	local bag, slot
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local _, _, name = string.find(itemLink, "%[(.-)%]")
                if name == itemName then
                    PickupContainerItem(bag, slot)
					EquipCursorItem(inventory)
                    return true
                end
            end
        end
    end

    return false
end




local function IsBankOpen()
    return (BankFrame and BankFrame:IsVisible()) or false
end

local function IsAuctionHouseOpen()
    return (AuctionFrame and AuctionFrame:IsVisible()) or false
end

local function IsMailboxOpen()
    return (MailFrame and MailFrame:IsVisible()) or false
end

local function IsMerchantOpen()
    return (MerchantFrame and MerchantFrame:IsVisible()) or false
end

-- 是否打开交互窗口（银行、邮箱、拍卖行、商人）
function MPCheckUIStatus()

	if IsBankOpen() then
		return true
	end

	if IsAuctionHouseOpen() then
		return true
	end

	if IsMailboxOpen() then
		return true
	end

	if IsMerchantOpen() then
		return true
	end

	return false
end



-- 计算AP
function MPGetAP()
	local a,b = UnitAttackPower("player")
	return a+b
end



function MPFloor(num)
	return math.floor(num)
end


function MPTestAura()
	for i = 1, 9 do
		local icon,_,a=GetShapeshiftFormInfo(i)
		if icon then
			print(icon)
		end
	end

end






-- 刷新属性
function MPRefreshInfo()


	-- 刷新战士属性
	if type(MPWarriorRefreshInfo) == "function" then MPWarriorRefreshInfo() end

	-- 刷新德鲁伊属性
	if type(MPDriudRefreshInfo) == "function" then MPDriudRefreshInfo() end

	-- 刷新圣骑士属性
	if type(MPPaladinRefreshInfo) == "function" then MPPaladinRefreshInfo() end

	-- 刷新盗贼属性
	if type(MPRogueRefreshInfo) == "function" then MPRogueRefreshInfo() end

	-- 刷新萨满属性
	if type(MPShamanRefreshInfo) == "function" then MPShamanRefreshInfo() end

	-- 刷新术士属性
	if type(MPWarlockRefreshInfo) == "function" then MPWarlockRefreshInfo() end

	-- 刷新牧师属性
	if type(MPPriestRefreshInfo) == "function" then MPPriestRefreshInfo() end

	-- 刷新法师属性
	if type(MPMageRefreshInfo) == "function" then MPMageRefreshInfo() end

	-- 刷新猎人属性
	if type(MPHunterRefreshInfo) == "function" then MPHunterRefreshInfo() end

	-- 保存种族
	local a
	a,MPPlayerRace = UnitRace("player")

	-- 统计饰品栏位
	MP_Trinket_Upper = MPCheckTrinket(13)
	MP_Trinket_Below = MPCheckTrinket(14)


	-- 计算治疗量
	MPHealingPower = MPCalculateTotalHealingPower()
	-- 急速
	--MPHasteRating = MPCalculateTotalHasteRating()

end

-- slot = 13 上， 14下
function MPCheckTrinket(slot)

	-- KLZ
	if MPCheckInventoryItemName(slot,"压制能量遗物") then return 1 end
	if MPCheckInventoryItemName(slot,"狂野魔法宝石") then return 1 end
	--if MPCheckInventoryItemName(slot,"艾露恩之镰") then return 1 end

	-- NAXX
	if MPCheckInventoryItemName(slot,"衰落之眼") then return 1 end
	if MPCheckInventoryItemName(slot,"萨菲隆的精华") then return 1 end
	if MPCheckInventoryItemName(slot,"屠龙者的纹章") then return 1 end
	if MPCheckInventoryItemName(slot,"蜘蛛之吻") then return 1 end
	if MPCheckInventoryItemName(slot,"偏斜雕文") then return 1 end

	-- TAQ
	if MPCheckInventoryItemName(slot,"虫群卫士徽章") then return 1 end
	if MPCheckInventoryItemName(slot,"沙漠掠夺者塑像") then return 1 end
	if MPCheckInventoryItemName(slot,"沙虫之毒") then return 1 end
	if MPCheckInventoryItemName(slot,"坠落星辰碎片") then return 1 end

	-- BWL
	if MPCheckInventoryItemName(slot,"自然之盟水晶") then return 1 end
	if MPCheckInventoryItemName(slot,"盲目光芒卷轴") then return 1 end
	if MPCheckInventoryItemName(slot,"毒性图腾") then return 1 end
	if MPCheckInventoryItemName(slot,"思维加速宝石") then return 1 end
	if MPCheckInventoryItemName(slot,"奥术能量宝石") then return 1 end
	if MPCheckInventoryItemName(slot,"黑龙之书") then return 1 end

	-- MC
	if MPCheckInventoryItemName(slot,"短暂能量护符") then return 1 end
	if MPCheckInventoryItemName(slot,"焰烬之石") then return 1 end

	-- ZG
	if MPCheckInventoryItemName(slot,"赞达拉英雄勋章") then return 1 end
	if MPCheckInventoryItemName(slot,"赞达拉英雄护符") then return 1 end

	-- Other
	if MPCheckInventoryItemName(slot,"大地之击") then return 1 end
	if MPCheckInventoryItemName(slot,"钻石水瓶") then return 1 end
	if MPCheckInventoryItemName(slot,"优越护符") then return 1 end
	if MPCheckInventoryItemName(slot,"龙人能量徽章") then return 1 end
	if MPCheckInventoryItemName(slot,"魔暴龙眼") then return 1 end


	return 0
end





-- 牧师特性状态
function MPPriestRefreshInfo()
	-- 非牧师，则无效执行
	local _, class = UnitClass("player")
	if class ~= "PRIEST" then
		return 0
	end

end




-- 是否装备双手武器
function MPIsTwoHand()
    local mainHand = GetInventoryItemLink("player", 16)  -- 主手武器槽(16)
    local offHand = GetInventoryItemLink("player", 17)   -- 副手武器槽(17)
    
    -- 如果有副手武器，则是双持
    if offHand then
        return false
    end
       
    -- 默认情况(无武器或单手武器+无副手)
    return true
end

-- 远程武器类型
function IsRangedThrownWeapon()
    local itemLink = GetInventoryItemLink("player", 18)  -- 18=远程武器栏位
    if not itemLink then return false end

	local itemID = MPMatch(itemLink, "item:(%d+):")
    if not itemID then return false end

	local _,_,_,_,_,itemSubType = GetItemInfo(itemID)
	if itemSubType=="投掷武器" then 
		return true 
	end

	return false
end



-- 检查身上装备格子的装备名称
function MPCheckInventoryItemName(slot, name)
	local Link = GetInventoryItemLink("player",slot)
	if Link and strfind(Link,name) then return true end
	return false
end

-- 获取天赋参数
function MPIsTalentLearned(tabIndex, talentIndex)
	local _, _, _, _, rank = GetTalentInfo(tabIndex, talentIndex)
	return rank
end



function MPMatchGUID(str, length)
    -- 生成 0x + N 位十六进制的模式
    local pattern = "0x" .. string.rep("%x", length or 16)  -- 默认 16 位
    local start, finish = string.find(str,pattern)
    return start and string.sub(str, start, finish) or nil
end


function MPExtractNumber(text)

    -- 降级方案：用 string.find + string.sub
    local leftPos = string.find(text, "（") or string.find(text, "%(")
    local rightPos = string.find(text, "）") or string.find(text, "%)")
    if leftPos and rightPos then
        return string.sub(text, leftPos + 1, rightPos - 1)
    end

end


function MPToNumber(str)

	if not str then
		return 0
	end

    local number = 0
    local i = 1
    while true do
        local char = string.sub(str, i, i)
        if char == "" then break end  -- 超出字符串长度
        
        local byte = string.byte(char)
        if byte >= 48 and byte <= 57 then  -- '0'-'9'
            number = number * 10 + (byte - 48)
        end
        i = i + 1
    end
    return number	
end


function MPMatch(str, pattern, index)
	if type(str) ~= "string" and type(str) ~= "number" then
		return nil--error(format("bad argument #1 to 'match' (string expected, got %s)", str and type(str) or "no value"), 2)
	elseif type(pattern) ~= "string" and type(pattern) ~= "number" then
		return nil--error(format("bad argument #2 to 'match' (string expected, got %s)", pattern and type(pattern) or "no value"), 2)
	elseif index and type(index) ~= "number" and (type(index) ~= "string" or index == "") then
		return nil--error(format("bad argument #3 to 'match' (number expected, got %s)", index and type(index) or "no value"), 2)
	end

	local i1, i2, match, match2 = string.find(str, pattern, index)

	if not match and i2 and i2 >= i1 then
		return sub(str, i1, i2)
	elseif match2 then
		local matches = {string.find(str, pattern, index)}
		tremove(matches, 2)
		tremove(matches, 1)
		return unpack(matches)
	end

	return match
end

function MPCleanString(str)
    return string.gsub(str, "[%z\1-\31]", "")  -- 移除控制字符
end





function MPResetAllSettings()

	MPResetBearSettings()
	MPResetCatSettings()
	MPResetCOOSettings()
	MPResetDriudHealSettings()

	MPResetPaladinCJSettings()
	MPResetPaladinHealSettings()
	MPResetPaladinTankSettings()

	MPResetWarriorDPSSettings()
	MPResetWarriorTankSettings()

	MPResetRogueSettings()

	MPResetShamanHealSettings()

	DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."Cat插件 重置所有配置 完成！|r")

end



function MPClickReplace()

    -- 弹窗是否存在
    if StaticPopup1 and StaticPopup1:IsVisible() then
        local str=StaticPopup1Text:GetText() or ""
        if string.find(str,"替换") then
            StaticPopup1Button1:Click()
        end
    end

end


-- 获取tip信息

-- 创建临时Tooltip帧
local tooltip = CreateFrame("GameTooltip", "MyScanningTooltip", nil, "GameTooltipTemplate")
tooltip:SetOwner(UIParent, "ANCHOR_NONE")

function MPGetSpellDetails()
    tooltip:ClearLines()
    tooltip:SetSpell("嗜血 (等级 4)")
	--tooltip:SetSpellByID(96)

	for i = 1, 4 do
		local leftText = _G["MyScanningTooltipTextLeft"..i]:GetText()
		local rightText = _G["MyScanningTooltipTextRight"..i]:GetText()
		print(leftText)
		print(rightText)
	end
end


--[[
-- 获取目标详细信息（模拟鼠标悬停效果）
function GetTargetDetails()
    tooltip:ClearLines()
    tooltip:SetUnit("target")  -- 检测当前目标
    
    -- 提取Tooltip文本行
    local lines = {}
    for i = 1, 2 do --tooltip:NumLines() do
        local leftText = _G["CatScanningTooltipTextLeft"..i]:GetText()
        local rightText = _G["CatScanningTooltipTextRight"..i]:GetText()
        if leftText then
            table.insert(lines, leftText)
        end
        if rightText then
            table.insert(lines, " | " .. rightText)
        end
    end
    
    return table.concat(lines, "\n")
end

]]

local HealingPowerScannerTooltip = CreateFrame("GameTooltip", "HealingPowerScannerTooltip", nil, "GameTooltipTemplate")
HealingPowerScannerTooltip:SetOwner(UIParent, "ANCHOR_NONE")

function MPCalculateTotalHealingPower()
    local totalHealing = 0
    
    -- 装备栏位列表（经典旧世版本）
    local slotNames = {
        "HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot",
        "WristSlot", "HandsSlot", "WaistSlot", "LegsSlot", "FeetSlot",
        "Finger0Slot", "Finger1Slot", "Trinket0Slot", "Trinket1Slot",
        "MainHandSlot", "SecondaryHandSlot", "RangedSlot"
    }
        
    -- 遍历所有装备栏位
    for _, slotName in ipairs(slotNames) do
        local slotID = GetInventorySlotInfo(slotName)
        if slotID then

            HealingPowerScannerTooltip:ClearLines()
            HealingPowerScannerTooltip:SetInventoryItem("player", slotID)  -- 关键修正
            -- 扫描 Tooltip 文本
            for i = 2, HealingPowerScannerTooltip:NumLines() do
                local line = _G["HealingPowerScannerTooltipTextLeft"..i]
                if line then
                    local text = line:GetText() or ""
                    local healingValue = MPMatch(text, "治疗效果，最多(%d+)点")
                    if healingValue then
                        totalHealing = totalHealing + MPToNumber(healingValue)
                    end

					healingValue = MPMatch(text, "治疗效果提高最多(%d+)")
                    if healingValue then
                        totalHealing = totalHealing + MPToNumber(healingValue)
                    end
                end
            end

        end
    end
    
    --print("总法术治疗量: " .. totalHealing)
    return totalHealing
end

local PostionTooltip = CreateFrame("GameTooltip", "MPPostionTooltip", nil, "GameTooltipTemplate")

-- 获取主手附魔计数
function MPGetMainHandCount()

	PostionTooltip:SetOwner(UIParent, "ANCHOR_NONE")
    PostionTooltip:ClearLines()
    PostionTooltip:SetInventoryItem("player", 16)
    -- 扫描 Tooltip 文本
    for i = 2, PostionTooltip:NumLines() do
        local line = _G["MPPostionTooltipTextLeft"..i]
        if line then
            local text = line:GetText() or ""
            local Value = MPMatch(text, "(%d+)次")
            if Value then
				pn = MPMatch(text, "^(.-)（")
				--print(pn)
                return true, MPToNumber(Value), pn
            end

        end
    end


	return false, -1, nil
end
-- 获取副手附魔计数
function MPGetOffHandCount()

	PostionTooltip:SetOwner(UIParent, "ANCHOR_NONE")
    PostionTooltip:ClearLines()
    PostionTooltip:SetInventoryItem("player", 17)
    -- 扫描 Tooltip 文本
    for i = 2, PostionTooltip:NumLines() do
        local line = _G["MPPostionTooltipTextLeft"..i]
        if line then
            local text = line:GetText() or ""
            local Value = MPMatch(text, "(%d+)次")
            if Value then
				pn = MPMatch(text, "^(.-)（")
				--print(pn)
                return true, MPToNumber(Value), pn
            end

        end
    end

	return false, -1, nil
end


-- 获取装备某词条的是否存在
-- pos格子id，如16主手，17副手
-- name用于判断的字串
function MPIsItemEntry(pos, name)

	PostionTooltip:SetOwner(UIParent, "ANCHOR_NONE")
    PostionTooltip:ClearLines()
    PostionTooltip:SetInventoryItem("player", pos)
    -- 扫描 Tooltip 文本
    for i = 2, PostionTooltip:NumLines() do
        local line = _G["MPPostionTooltipTextLeft"..i]
        if line then
            local text = line:GetText() or ""
			--print(text)
            if string.find(text, name) then
                return true, text
            end

        end
    end


	return false, nil
end


-- 计算急速
function MPCalculateTotalHasteRating()
    local totalHasteRating = 0
    
    -- 装备栏位列表（经典旧世版本）
    local slotNames = {
        "HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot",
        "WristSlot", "HandsSlot", "WaistSlot", "LegsSlot", "FeetSlot",
        "Finger0Slot", "Finger1Slot", "Trinket0Slot", "Trinket1Slot",
        "MainHandSlot", "SecondaryHandSlot", "RangedSlot"
    }
        
    -- 遍历所有装备栏位
    for _, slotName in ipairs(slotNames) do
        local slotID = GetInventorySlotInfo(slotName)
        if slotID then

            HealingPowerScannerTooltip:ClearLines()
            HealingPowerScannerTooltip:SetInventoryItem("player", slotID)  -- 关键修正
            -- 扫描 Tooltip 文本
            for i = 2, HealingPowerScannerTooltip:NumLines() do
                local line = _G["HealingPowerScannerTooltipTextLeft"..i]
                if line then
                    local text = line:GetText() or ""
                    local Value = MPMatch(text, "施法速度提高(%d+)")
                    if Value then
                        totalHasteRating = totalHasteRating + MPToNumber(Value)
                    end

					--[[
					Value = MPMatch(text, "治疗效果提高最多(%d+)")
                    if Value then
                        totalHasteRating = totalHasteRating + MPToNumber(Value)
                    end
					]]
                end
            end

        end
    end
    
    --print("急速量: " .. totalHasteRating)
    return totalHasteRating
end


function MPCalculateDistance(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt(dx * dx + dy * dy)
end

function MPCalculateTotemDistance(x1, y1, x2, y2)
	local b = 1000 --3660
	x1 = x1 * b
	x2 = x2 * b
	y1 = y1 * b
	y2 = y2 * b
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt(dx * dx + dy * dy)
end



-- 通过技能名称或ID获取图标纹理路径
function MPGetSpellIcon(spellIdentifier)
    local spellName, _, spellIcon = GetSpellInfo(spellIdentifier)
    if spellIcon then
        print(string.format("技能图标路径: %s", spellIcon))
        return spellIcon
    else
        print("未找到技能:", spellIdentifier)
        return nil
    end
end

function MPIsAddOnLoaded(addonName)
    return _G[addonName] ~= nil or IsAddOnLoaded(addonName)
end



-- 获取技能文字描述
-- spellName 技能名字
-- spellRank 技能等级，如："等级 8"
-- 返回string
local SpellTooltip = CreateFrame("GameTooltip", "MPSpellTooltip", UIParent, "GameTooltipTemplate")
function MPGetSpellTooltip(spellName, spellRank)

	SpellTooltip:SetOwner(UIParent, "ANCHOR_NONE") -- 隐藏锚点
	SpellTooltip:ClearLines()

	local spellID = MPGetSpellID(spellName, spellRank)

	-- 技能不存在
	if spellID==0 then
		return
	end

    SpellTooltip:SetSpell(spellID, "spell")

    -- 提取 Tooltip 文本
    local TooltipText = ""
    for i = 1, 10 do  -- 1.12 Tooltip 通常不超过 10 行
        local line = getglobal("MPSpellTooltipTextLeft" .. i)
        if line and line:GetText() then
            TooltipText = TooltipText .. line:GetText() .. "\n"
        end
    end

    -- 清理 Tooltip
    SpellTooltip:Hide()
    return TooltipText
end



-- 获取技能最高等级
-- spellName 技能名字
-- spellRank 技能等级，如："回春术"
-- 返回int
function MPGetHighestRankOfSpell(spellName)
    local highestRank = 0
    local highestSpellIndex = nil
    
    local i = 1
    while true do

        local name, rank = GetSpellName(i, BOOKTYPE_SPELL)
        
        if not name then
            break
        end
        
        if name == spellName then
            local currentRank = 1  -- 默认等级为1
            
            -- 解析等级文本（处理各种格式）
            if rank and rank ~= "" then
                -- 匹配数字（适用于"Rank 3", "等级 3", "级别 3"等格式）
                local rankNum = MPMatch(rank, "(%d+)")
                if rankNum then
                    currentRank = MPToNumber(rankNum)
                end
                -- 如果没有匹配到数字，保持默认等级1
            end
            
            if currentRank > highestRank then
                highestRank = currentRank
                highestSpellIndex = i
            end
        end
        
        i = i + 1
        -- 安全限制，防止无限循环
        if i > 300 then break end
    end
    
    return highestRank, highestSpellIndex
end

