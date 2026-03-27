if MPPlayerClass ~= "DRUID" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 猫德一键宏
-- 更新日期：2026-03-24 （后面根据时间来判断版本）
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
--
-- 可选条件：SuperWoW
-- SuperWoW优势1可以更加准确获得扫击、撕扯的持续时间（特别是在团队副本，避免目标身上debuff过多时可能丢失的可能性），可支持多只猫的环境下计算自己的扫击、撕扯
--
-- -------------------------------------
--
-- 功能配置：
-- 注：修改以下配置，需要在游戏中/reload，或者小退让配置生效
-- 
-- 主开关

-- 以下功能开关：1开启 0关闭

local AUTO_Cat_Trinket_Delay = 0			-- 进入战斗后，3秒后才允许使用饰品


-- 进阶配置（非熟练，请勿使用）：


-- -------------------------------------


-- -------------------------------------
-- 全局变量，可以直接调用，不需要函数访问，以提高宏的性能
-- 以下参数请勿手动修改，插件会自动进行变化


-- 德鲁伊爪击所需要的能量值（自动算神像“凶猛神像”+ T2.5三件套效果）
MPDriudClawEnergy = 40
-- 德鲁伊扫击所需要的能量值（自动算神像“凶猛神像”+ T2.5三件套效果）
MPDriudRakeEnergy = 35
-- 德鲁伊撕碎所需要的能量值（自动计算天赋“强化撕碎”+ T2.5三件套效果）
MPDriudShredEnergy = 60

-- 德鲁伊扫击的持续时间（自动算神像“野蛮神像”+ K40老三披风）
MPDriudRakeDuration = 9
-- 德鲁伊撕扯的持续时间（自动算神像“野蛮神像”+ K40老三披风）
MPDriudRipDuration = 18
-- 德鲁伊血袭的持续时间 
MPDriudRavageDuration = 18

-- 德鲁伊变身所需要消耗的蓝量
MPDriudShapeshiftMana = 435

-- 德鲁伊当前自身的蓝量
MPDriudManaValue = 1000

-- 猫姿态的姿态ID
MPDriudCatShapeshiftID = 0

-- 激怒天赋是否点满
MPDriudCatFuror = 0

-- T3.5套装 原始凶猛 层数
MPDriudPrimalFury = 0
-- T3.5套装 爆发 阿莎曼之怒
MPDriudAshamane = 0


-- 天赋系别
MPDriudTalent = 0

-- 猛虎时间
MPMHTimer = 10

-- 流血dot 跳 时间
MPDriudRateJumpTimer = 0
MPDriudRipJumpTimer = 0

-- 猛虎回能 跳 时间
MPDriudTigerFuryTimer = 0

-- 双流血AP快照
MPDriudMaxRipAP = 0
MPDriudMaxRakeAP = 0

-- 献祭之油时间
MPSacrificialTimer = 0

-- 临时变量 -------------------------------------

local myPower,DM,GCD,GCP,QX,JNSF,THP,MPRake,MPRip,BEHIND,PCD,WS,JLZH
local TargetDistance = false
local TargetBOSS = false

local Timer = 0
local SlowRun = 0

-------------------------------------------------

local function CatDotReset()

	if not MP_SuperWoW then
		return
	end

	-- 续杯保险丝
	if MPInCombat then

		-- 先检查目标是否存在
		local hasTarget,guid = UnitExists("target")
		if not hasTarget then
			return
		end

		-- 爪击保险
		if MPGetRakeDot() and MPDriudRateJumpTimer-Timer < -3.0 then
			MPResetRakeDot(guid)
			DEFAULT_CHAT_FRAME:AddMessage("爪击续杯失败，重置计时！")
		end

		-- 撕扯保险
		if MPGetRipDot() and MPDriudRipJumpTimer-Timer < -2.0 then
			MPResetRipDot(guid)
			DEFAULT_CHAT_FRAME:AddMessage("撕扯续杯失败，重置计时！")
		end

	end
end


-- 命令入口
function MPCat(type)


	-- 无参数强制打法类型，则通过配置来决定
	-- 一键宏的技能模式，取值范围(1,2,3)
	if not type then
		type = 1
	else
		if type < 1 or type > 6 then
			DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."Cat()传递错误参数，将自动使用默认值！|r")
			type = 1
		end
	end

	-- 确保在豹子形态下
	if MPDriudCatSaved.Shapeshift==1 and MPDriudCatShapeshiftID>0 then
		if not MPGetShape(MPDriudCatShapeshiftID) then
			CastShapeshiftForm(MPDriudCatShapeshiftID)
			return
		end
	end
	--[[
	if MPDriudCatSaved.Shapeshift==1 then
		if not MPBuff("猎豹形态") then
			CastSpellByName("猎豹形态")
		end
	end
	]]

	------------------

	QX = MPBuff("潜行")
	myPower = UnitMana("player")
	Timer = GetTime()

	-- 在潜行状态
	if QX and MPDriudCatSaved.Prowl==1 then

		if MPBuff("放逐术", "target") then
			return
		end

		MPStopAttack()

		-- 潜行时，可以预先开启猛虎之怒
		if MPDriudCatSaved.TigerFury==1 and (not MPMHTimer or Timer-MPMHTimer>10) and myPower>=80 then
			CastSpellByName("猛虎之怒")
			MPMHTimer=Timer
		end

		if MPTargetBleed then
			-- 目标可流血用突袭
			CastSpellByName("突袭")
			return
		else
			-- 目标不可流血就毁灭
			CastSpellByName("毁灭")
			return
		end

		-- 潜行下，无需后续流程
		return

	end

	DM = MPDriudMana()
	GCD = MPGetGCD()
	GCP = GetComboPoints("target")
	JNSF = MPGetOmen()
	BEHIND = MPCheckBehind(MPDriudCatSaved.UnitXP)
	WS = MPSpellReady("畏缩")
	JLZH = MPSpellReady("精灵之火（野性）")
	THP = UnitHealth("target")
	TargetDistance = MPGetTargetDistance()
	TargetBOSS = MPIsBossTarget()

	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPDriudCatSaved.Target)

	-- 开启自动攻击
	MPStartAttack()

	-- 自动拾取
	if MPDriudCatSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPDriudCatSaved.Power==1 then
		MPCatPower()
	end

	--[[
	if MPBuff("放逐术", "target") then
		return
	end
	--]]

	-- 在战斗中
	if MPInCombat and (Timer-SlowRun>0) then


		if MPDriudCatSaved.Ashamane==1 then
			if GCP>=(25-MPDriudPrimalFury-2) and MPDriudPrimalFury>=20 then
				-- 自动开启饰品
				if MP_Trinket_Upper==1 then
					if TargetDistance and MPDriudCatSaved.Trinket_Upper==1 and GetInventoryItemCooldown("player",13)==0 then
						if MPDriudCatSaved.TUBoss==1 and TargetBOSS then
							UseInventoryItem(13)
						elseif MPDriudCatSaved.TUBoss==0 then
							UseInventoryItem(13)
						end
					end
				end
				if MP_Trinket_Below==1 then
					if TargetDistance and MPDriudCatSaved.Trinket_Below==1 and GetInventoryItemCooldown("player",14)==0 then
						if MPDriudCatSaved.TBBoss==1 and TargetBOSS then
							UseInventoryItem(14)
						elseif MPDriudCatSaved.TBBoss==0 then
							UseInventoryItem(14)
						end
					end
				end
			end
		else
			-- 自动开启饰品
			if MP_Trinket_Upper==1 then
				if TargetDistance and MPDriudCatSaved.Trinket_Upper==1 and Timer-MPInCombatTime>AUTO_Cat_Trinket_Delay and GetInventoryItemCooldown("player",13)==0 then
					if MPDriudCatSaved.TUBoss==1 and TargetBOSS then
						UseInventoryItem(13)
						return
					elseif MPDriudCatSaved.TUBoss==0 then
						UseInventoryItem(13)
						return
					end
				end
			end
			if MP_Trinket_Below==1 then
				if TargetDistance and MPDriudCatSaved.Trinket_Below==1 and Timer-MPInCombatTime>AUTO_Cat_Trinket_Delay and GetInventoryItemCooldown("player",14)==0 then
					if MPDriudCatSaved.TBBoss==1 and TargetBOSS then
						UseInventoryItem(14)
						return
					elseif MPDriudCatSaved.TBBoss==0 then
						UseInventoryItem(14)
						return
					end
				end
			end
		end

		if MPDriudCatSaved.Soulspeed==1 and TargetBOSS then
			MPUseItemByName("魂能之速")
		end

		-- 血量危险时处理
		local percent = UnitHealth("player") / UnitHealthMax("player") * 100

		if MPDriudCatSaved.Barkskin==1 then
			if percent<MPDriudCatSaved.Barkskin_Value and MPGetShape(MPDriudCatShapeshiftID) then
				CastSpellByName("树皮术（野性）")
			end
		end
		if MPDriudCatSaved.HealthStone==1 then
			if percent<MPDriudCatSaved.HealthStone_Value then
				MPUseItemByName("特效治疗石")
			end
		end
		if MPDriudCatSaved.HerbalTea==1 then
			if percent<MPDriudCatSaved.HerbalTea_Value then
				MPUseItemByName("糖水茶")
				MPUseItemByName("诺达纳尔草药茶")
			end
		end

		-- 双流血 安全检测
		CatDotReset()

		SlowRun = Timer+0.5
	end

	-- 献祭之油
	--[[
	if MPDriudCatSaved.Sacrificial==1 then
		if Timer-MPSacrificialTimer>0 and MPScanNearbyEnemiesCount(8)>3 then
			MPUseItemByName("献祭之油")
		end
	end
	]]


	-- 流派策略

	if MP_SuperWoW then

		if type == 2 then
			MPCatBackstabNew()
		else

			if MPDriudCatSaved.BOSS==1 and not TargetBOSS then
				MPCatBackstabNew()
			else

				if MPTargetBleed then	-- 目标可流血
					MPCatBleedNew()
				else					-- 目标不可流血
					MPCatBackstabNew()
				end

			end

		end

	else

		if type == 2 then
			MPCatBackstab()			-- 背刺流
		else
			if MPDriudCatSaved.BOSS==1 and not TargetBOSS then
				MPCatBackstab()
			else
				if MPTargetBleed then	-- 目标可流血
					MPCatBleed()
				else					-- 目标不可流血
					MPCatBackstab()
				end
			end
		end

	end


	-- 远距离补精灵之火
	--MPFaerieFire()

end




-- 是否满足终结技条件
-- 阿莎曼之怒的星优先于配置星
local function AllowFerocious(Bite)

	--[[
	-- 阿莎曼之怒 特效补星
	--if MPDriudCatSaved.Ashamane==1 then
		local last = 25-MPDriudPrimalFury
		if last < 5 then
			if GCP>=last then
				return true
			end
		end
	--end
	]]

	-- 怪即将死亡
	if THP<3000 and GCP>=2 then
		return true
	end


	if GCP>=Bite then
		return true
	end

	return false
end



function MPCatIdolDance(CombeValue)
	-- 检测开关，同时交互交互界面的安全检测
	if MPDriudCatSaved.Idol_Dance==1 and not MPCheckUIStatus() and GCD<0.2 then
		-- 几星切换神像，根据撕咬的星数来决定
		if AllowFerocious(CombeValue) then
			MPEquipItemByName(MPDriudCatSaved.Idol_Dance_High, 9)
		else
			MPEquipItemByName(MPDriudCatSaved.Idol_Dance_Low, 9)
		end
	end
end


-- 德鲁伊切换目标神像事件
function MPDriudSwapIdol(value)

	value = value or 0

	-- 开关检测
	if MPDriudCatSaved.Target_Swap_Idol == 0 then
		return
	end

	--[[
	-- 非德鲁伊，则无效执行
	local _, class = UnitClass("player")
	if class ~= "DRUID" then
		return
	end
	]]

	-- 天赋检测，野性
	if MPDriudTalent ~= 2 then
		return
	end



	-- 目标类型
	if not UnitExists("target") then
		return
	end

	if MPCheckUIStatus() then
		return
	end


	if value==0 then

		-- 熊形态下，神像固定
		if MPGetShape(MPDriudBearShapeshiftID) then
			MPEquipItemByName(MPDriudCatSaved.Target_Swap_Idol_Bear, 9)
			return
		elseif MPGetShape(MPDriudCatShapeshiftID) then
			-- 流血状态，且没有打开银行等窗口
			if MPTargetBleed then
				MPEquipItemByName(MPDriudCatSaved.Target_Swap_Idol_Bleed, 9)
			else
				MPEquipItemByName(MPDriudCatSaved.Target_Swap_Idol_Shred, 9)
			end
		end

	-- 强制熊
	elseif value==1 then

		MPEquipItemByName(MPDriudCatSaved.Target_Swap_Idol_Bear, 9)
		return

	-- 强制猫德
	elseif value==2 then
		-- 流血状态，且没有打开银行等窗口
		if MPTargetBleed then
			MPEquipItemByName(MPDriudCatSaved.Target_Swap_Idol_Bleed, 9)
		else
			MPEquipItemByName(MPDriudCatSaved.Target_Swap_Idol_Shred, 9)
		end
	end

end


-- 中间距离的精灵火
function MPFaerieFire()

	-- 开关
	if MPDriudCatSaved.FaerieFire==0 then
		return
	end

	-- 先检查目标是否存在
	local hasTarget = UnitExists("target")
	if not hasTarget then
		return
	end

	-- 是不是敌人
    if not UnitCanAttack("player", "target") then
        return
    end

	-- 自己在战斗中，目标也在战斗中
	if MPInCombat and UnitAffectingCombat("target") then
		-- 不在近战范围
		if not MPGetTargetDistance("target",6) and MPIsFaerieFire() then
			CastSpellByName("精灵之火（野性）")
		end
	end

end


-- 参数，饰品位置：13 上，14 下，默认上
function MPCastShortBlade(slot, trinket)

	slot = slot or 13
	trinket = trinket or "破盾护符"

	local tex=GetInventoryItemTexture("player", slot)
	if tex=="Interface\\Icons\\Inv_weapon_shortblade_23" then

		local begin,dru = GetInventoryItemCooldown("player",slot)
		-- 装备了镰刀
		if begin==0 then
			-- 已经冷却
			UseInventoryItem(slot)
		end

		if (dru-(GetTime()-begin)) > 1 then
			MPEquipItemByName(trinket, slot)
		end
	end

end


-- 爪击处理
local function MPCastClaw()

	if UnitExists("target") then
		local n = UnitExists("targettarget")
		if n and n==UnitName("player") then
			MPCastWithNampower("爪击")
		else
			if myPower>=80 then
				MPCastWithNampower("爪击")
			end
			if JNSF and myPower>=70 then
				MPCastWithNampower("爪击")
			end
		end
	end

end

-- 猫德填充技能
local function MPCatAttack()

	-- 根据正反面撕碎/爪击填充空挡
	-- 基础技能
	if MPDriudCatSaved.Style==1 then

		-- 爪击流
		MPCastWithNampower("爪击")
		return

	elseif MPDriudCatSaved.Style==2 then

		-- 均衡 朝向自动
		if BEHIND then
			MPCastWithNampower("撕碎")
			return
		else
			MPCastWithNampower("爪击")
			return
		end

	elseif MPDriudCatSaved.Style==3 then

		-- 均衡 偏向撕碎
		if BEHIND then
			MPCastWithNampower("撕碎")
			return
		else
			MPCastClaw()
			return
		end

	else
	
		-- 撕碎流
		MPCastWithNampower("撕碎")
		return

	end

end



local function MPCheckShapeshift()

	local allow = 0

	-- 自动回能
	if MPGetRestoredEnergy()<1.3 then
		allow = allow + 4
	end

	-- 猛虎回能
	if (MPDriudTigerFuryTimer-Timer)>0.8 then
		allow = allow + 2
	end

	-- 扫击回能
	if (MPDriudRateJumpTimer-Timer)>0.8 then
		allow = allow + 1
	end

	-- 撕扯回能
	if (MPDriudRipJumpTimer-Timer)>0.8 then
		allow = allow + 1
	end

	return allow
end




-- 背刺猫攻击流程
function MPCatBackstab()
	PCD = MPGetRestoredEnergy()

	-- 神像舞
	MPCatIdolDance(MPDriudCatSaved.ShredFerocious_Bite)


	if MPDriudCatSaved.TigerFury==1 then
		if MPDriudCatSaved.Shapeshift==0 then
			-- 走地猫的开启猛虎优化
			if (not MPMHTimer or Timer-MPMHTimer>18) and myPower>=30 then
				MPCastWithNampower("猛虎之怒")
				MPMHTimer=Timer
			end
		else
			-- 变身猫的猛虎策略
			if (not MPMHTimer or Timer-MPMHTimer>17) and myPower>=30 then
				MPCastWithNampower("猛虎之怒")
				MPMHTimer=Timer
			end
		end
	end

	if AllowFerocious(MPDriudCatSaved.ShredFerocious_Bite) and myPower<MPDriudCatSaved.ShredModeShapeshift and JNSF then
		MPCastWithoutNampower("凶猛撕咬")
		return
	end

	-- 清晰预兆触发时，根据正反面选择撕碎/爪击
	if JNSF then
		if BEHIND then
			MPCastWithNampower("撕碎")
			return
		else
			MPCastWithNampower("爪击")
			--MPCastClaw()
			return
		end
	end

	-- 仇恨高的时候畏缩
	-- 仇恨高于80
	if MPDriudCatSaved.Cower==1 and WS and myPower>=20 and MPGetHatredFromTWT()>=80 then
		MPCastWithNampower("畏缩")
		return
	end

	-- 无清晰预兆，再撕咬
	if AllowFerocious(MPDriudCatSaved.ShredFerocious_Bite) and myPower<MPDriudCatSaved.ShredFerocious_Value and not JNSF then
		MPCastWithoutNampower("凶猛撕咬")
		return
	end

	if Timer-MPMHTimer>15 then

		if not MPBuff("裂隙诅咒") then -- 防御村长的诅咒意外变身解除
			if MPDriudCatSaved.Shapeshift==1 and DM>=MPDriudShapeshiftMana and GCD>0.9 and not MPBuff("狂暴") then
				if myPower<30 then
					MPCastWithNampower("重整")
					MPMHTimer=0
					return
				end
			end

		end

	elseif Timer-MPMHTimer>8 then

		if not MPBuff("裂隙诅咒") then -- 防御村长的诅咒意外变身解除
			if MPDriudCatSaved.Shapeshift==1 and DM>=MPDriudShapeshiftMana and GCD>0.8 and not MPBuff("狂暴") and MPGetRestoredEnergy()<1.5 then
				if myPower<MPDriudCatSaved.ShredModeShapeshift then
					MPCastWithNampower("重整")
					MPMHTimer=0
					return
				end
			end

			if MPDriudCatSaved.Shapeshift==1 and DM>=MPDriudShapeshiftMana and  myPower<30 and GCD>0.9 then
				MPCastWithNampower("重整")
				MPMHTimer=0
				return
			end
		end

	else
		-- 空挡仇恨高于70
		if MPDriudCatSaved.Cower==1 and WS and myPower>=20 and MPGetHatredFromTWT()>=70 then
			MPCastWithNampower("畏缩")
			return
		end

		-- 空挡时补精灵之火
		if MPDriudCatSaved.FaerieFire==1 and MPIsFaerieFire() then
			if MPGetShape(MPDriudCatShapeshiftID) and MPInCombat and TargetDistance and not JNSF and JLZH then
				if myPower<=MPDriudCatSaved.ShredModeShapeshift then
					MPCastWithNampower("精灵之火（野性）")
					return
				end
			end
		end
	end

	MPCatAttack()

end





-- 流血猫攻击流程
function MPCatBleed()

	local BeginShapeshift = 8

	MPRake = MPGetRakeDot()
	MPRip = MPGetRipDot()
	MPRavage = MPGetRavageDot()
	local _,guid = UnitExists("target")

	-- 神像舞
	MPCatIdolDance(MPDriudCatSaved.Ferocious_Bite)

	if MPDriudCatSaved.TigerFury==1 then

		if MPDriudCatSaved.Shapeshift==0 then
			-- 走地猫的开启猛虎优化
			if (not MPMHTimer or Timer-MPMHTimer>18) and myPower>=30 then
				CastSpellByName("猛虎之怒")
				MPMHTimer=Timer
			end
		else
			-- 变身猫的猛虎策略
			if (not MPMHTimer or Timer-MPMHTimer>17) and myPower>=30 then
				CastSpellByName("猛虎之怒")
				MPMHTimer=Timer
			end
		end
	end

	-- 非BOSS 禁用撕扯
	if MPDriudCatSaved.BOSS==1 and not TargetBOSS then
		MPRip = true
	else

		-- 补撕扯
		if not MPRip and GCP>=5 and THP>MPDriudCatSaved.OutHPRip and (myPower>=30 or JNSF) then
			MPCastWithNampower("撕扯")
			return
		end

	end


	if AllowFerocious(MPDriudCatSaved.Ferocious_Bite) and myPower<MPDriudCatSaved.BleedModeShapeshift and JNSF and MPRip then
		MPCastWithoutNampower("凶猛撕咬")
		return
	end

	if JNSF and BEHIND then
		MPCastWithNampower("撕碎")
		return
	end

	-- 补扫击
	if not MPRake and not AllowFerocious(MPDriudCatSaved.Ferocious_Bite) and myPower>=MPDriudRakeEnergy then 
		MPCastWithNampower("扫击")
		return
	end

	-- 仇恨高的时候畏缩
	-- 仇恨高于80
	if MPDriudCatSaved.Cower==1 and WS and MPGetHatredFromTWT()>=80 then
		MPCastWithNampower("畏缩")
		return
	end

	-- 撕咬
	if MPRip and AllowFerocious(MPDriudCatSaved.Ferocious_Bite) and myPower<MPDriudCatSaved.Ferocious_Value then
		MPCastWithoutNampower("凶猛撕咬")
		return
	end
	

	if Timer-MPMHTimer>BeginShapeshift then

		if not MPBuff("裂隙诅咒") then -- 防御村长的诅咒意外变身解除

			-- 变身基本条件
			if MPDriudCatSaved.Shapeshift==1 and DM>=MPDriudShapeshiftMana and not MPBuff("狂暴") and GCD>0.8 then

				if AllowFerocious(MPDriudCatSaved.Ferocious_Bite) then
					if myPower<15 then
						MPCastWithNampower("重整")
						MPMHTimer=0
						return
					end
				else
					if myPower<MPDriudCatSaved.BleedModeShapeshift then
						MPCastWithNampower("重整")
						MPMHTimer=0
						return
					end

					if Timer-MPMHTimer>15 and myPower<35 then
						MPCastWithNampower("重整")
						MPMHTimer=0
						return
					end
				end
			end

		end

	end

	-- 补充畏缩
	if MPDriudCatSaved.Cower==1 and WS and MPGetHatredFromTWT()>=70 then
		MPCastWithNampower("畏缩")
		return
	end

	-- 允许精灵之火
	if MPDriudCatSaved.FaerieFire==1 and MPIsFaerieFire() then


		-- 必要条件
		if TargetDistance and MPGetShape(MPDriudCatShapeshiftID) and MPInCombat and not JNSF and JLZH then

			if myPower<15 then
				MPCastWithNampower("精灵之火（野性）")
				return
			end

			if myPower<(MPDriudClawEnergy-20) and GCP<MPDriudCatSaved.Ferocious_Bite then
				MPCastWithNampower("精灵之火（野性）")
				return
			end

		end

	end

	MPCatAttack()

end
















-- 新-流血猫攻击流程
-- New A
function MPCatBleedNew()

	local AF = AllowFerocious(MPDriudCatSaved.Ferocious_Bite)

	MPRake = MPGetRakeDot()
	MPRip = MPGetRipDot()
	MPRavage = MPGetRavageDot()
	local _,guid = UnitExists("target")

	-- 神像舞
	MPCatIdolDance(MPDriudCatSaved.Ferocious_Bite)


	-- 变身基本条件
	if MPDriudCatSaved.Shapeshift==1 and DM>=MPDriudShapeshiftMana and GCD>0.8 then --

		if Timer-MPMHTimer>17 and myPower<=30 then
			MPCastWithoutNampower("重整")
			MPMsg("猛虎即将结束")
			return
		end
		
		if not JNSF and not MPBuff("狂暴") then

			if MPCheckShapeshift()>=7 and myPower<MPDriudCatSaved.BleedModeShapeshift then
				MPCastWithoutNampower("重整")
				return
			end

		end

	end


	if MPDriudCatSaved.TigerFury==1 then

		-- 变身猫的猛虎策略
		if (not MPMHTimer or Timer-MPMHTimer>18) and myPower>=60 then
			MPCastWithNampower(MPLanguage.TigerFury)
		end
	end

	-- 非BOSS 禁用撕扯
	if MPDriudCatSaved.BOSS==1 and not TargetBOSS then
		MPRip = true
	else

		-- 补撕扯
		if not MPRip and GCP>=5 and THP>MPDriudCatSaved.OutHPRip then
			MPCastWithNampower(MPLanguage.Rip)
			return
		end

	end

	-- 抢救 撕扯
	if AF and MPRip and (myPower>=35 or JNSF) then
		local check = MPGetRipCheck()
        if check[guid] then
			local timer = MPDriudRipDuration-(Timer-check[guid])
			if timer < 3 then 
				MPCastWithoutNampower(MPLanguage.FerociousBite)
				MPMsg("|cFFee1111抢救 撕扯|r")
				return
			end
		end
	end

	--清晰预兆
	if JNSF and BEHIND then
		MPCastWithNampower(MPLanguage.Shred)
		return
	end


	-- 仇恨高的时候畏缩
	-- 仇恨高于80
	if MPDriudCatSaved.Cower==1 then
		if WS and myPower>=20 and MPGetHatredFromTWT()>=80 then
			MPCastWithoutNampower("畏缩")
			return
		end
	end

	-- 撕咬
	if AF and myPower<MPDriudCatSaved.Ferocious_Value and MPRip and not JNSF and myPower>=35 then
		MPCastWithoutNampower(MPLanguage.FerociousBite)
		return
	else

		-- 补扫击
		if MPDriudCatSaved.BOSS==1 and not TargetBOSS then
			if not BEHIND and not MPRake then 

				MPCastWithNampower(MPLanguage.Rake)
				return
			end
		else
			if not MPRake then 

				MPCastWithNampower(MPLanguage.Rake)
				return
			end
		end

	end
	

	if MPDriudCatSaved.FaerieFire==1 then

		-- 允许精灵之火
		if MPCheckShapeshift()<4 and GCD>0.8 and MPIsFaerieFire() then

			-- 必要条件
			if MPGetShape(MPDriudCatShapeshiftID) and MPInCombat and not JNSF and JLZH then

				if AF then
					if myPower>=MPDriudCatSaved.BleedModeShapeshift and myPower<35 then
						MPCastWithNampower("精灵之火（野性）")
						return
					end
				else
					if myPower>=MPDriudCatSaved.BleedModeShapeshift and myPower<MPDriudShredEnergy then
						MPCastWithNampower("精灵之火（野性）")
						return
					end
				end

			end

		end

	end

	MPCatAttack()

end




-- 新-背刺猫攻击流程
-- New A
function MPCatBackstabNew()

	-- 神像舞
	MPCatIdolDance(MPDriudCatSaved.ShredFerocious_Bite)

	-- 变身基本条件
	if MPDriudCatSaved.Shapeshift==1 and DM>=MPDriudShapeshiftMana and GCD>0.8 then 

		if Timer-MPMHTimer>17 then
			if myPower<30 then
				MPCastWithNampower("重整")
				return
			end
		end

		if MPCheckShapeshift()>4 and not JNSF and not MPBuff("狂暴") then

			if myPower<MPDriudCatSaved.ShredModeShapeshift then
				MPCastWithNampower("重整")
				return
			end

		end

	end

	if MPDriudCatSaved.TigerFury==1 then
		-- 变身猫的猛虎策略
		if (not MPMHTimer or Timer-MPMHTimer>18) and myPower>=60 then
			MPCastWithNampower(MPLanguage.TigerFury)
		end
	end

	if GCP>=5 and myPower<15 and JNSF and MPRip then   -- AllowFerocious(MPDriudCatSaved.Ferocious_Bite)
		MPCastWithNampower(MPLanguage.FerociousBite)
		return
	end

	-- 清晰预兆触发时，根据正反面选择撕碎/爪击
	if JNSF and BEHIND then
		MPCastWithNampower("撕碎")
		return
	end

	-- 仇恨高的时候畏缩
	-- 仇恨高于80
	if MPDriudCatSaved.Cower==1 and WS and myPower>=20 and MPGetHatredFromTWT()>=80 then
		MPCastWithNampower("畏缩")
		return
	end


	-- 无清晰预兆，再撕咬
	if AllowFerocious(MPDriudCatSaved.ShredFerocious_Bite) and myPower<MPDriudCatSaved.ShredFerocious_Value and not JNSF and myPower>=35 then
		MPCastWithNampower("凶猛撕咬")
		return
	end


	if MPCheckShapeshift()<4 and GCD>0.8 then

		-- 变身保护期

		if MPDriudCatSaved.Cower==1 and WS and myPower>=20 and MPGetHatredFromTWT()>=70 then
			MPCastWithoutNampower("畏缩")
			return
		end

		-- 允许精灵之火
		if MPDriudCatSaved.FaerieFire==1 and MPIsFaerieFire() then

			-- 必要条件
			if TargetDistance and MPGetShape(MPDriudCatShapeshiftID) and MPInCombat and not JNSF and JLZH then

				if AllowFerocious(MPDriudCatSaved.ShredFerocious_Bite) then
					if myPower>=MPDriudCatSaved.ShredModeShapeshift and myPower<35 then
						MPCastWithoutNampower("精灵之火（野性）")
						return
					end

				else
					if myPower>=MPDriudCatSaved.ShredModeShapeshift and myPower<MPDriudShredEnergy then
						MPCastWithoutNampower("精灵之火（野性）")
						return
					end

				end


			end

		end

	end

	MPCatAttack()

end


