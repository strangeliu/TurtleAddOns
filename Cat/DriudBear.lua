if MPPlayerClass ~= "DRUID" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 全自动熊一键宏
-- 更新日期：2026-03-24 （后面根据时间来判断版本）
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
--
-- 可选条件：无
--
-- 说明：
-- 
-- -------------------------------------
--
-- 功能配置：

-- 以下功能开关：1开启 0关闭
local AUTO_BEAR_Use_Trinket = 1					-- 饰品总开关，是否自动使用爆发饰品


-- 输出流程辅助配置：

local BEAR_DemoralizingDelay = 9				-- 进入战斗后，9秒后开始补挫志咆哮

-- -------------------------------------
-- 全局变量，可以直接调用，不需要函数访问，以提高宏的性能
-- 以下参数请勿手动修改，插件会自动进行变化

-- 熊姿态的姿态ID
MPDriudBearShapeshiftID = 1

-- 野德狂暴天赋是否有点出
MPDriudBerserk = 0

-- 野蛮撕咬的消耗怒气
MPDruidFerociousBitePower = 30

-- 槌击的消耗怒气
MPDruidManglePower = 15

-- 挥击的消耗怒气
MPDruidSwipePower = 20

-- -------------------------------------

local myPower,MHP,GCD,JNSF,XMSY,KN

function MPBear(value)

	value = value or 0

	myPower = UnitMana("player")
	MHP = UnitHealth("player")
	GCD = MPGetGCD()
	JNSF = MPGetOmen()
	XMSY = MPSpellReadyOffset("野蛮撕咬")
	KN = MPSpellReady("狂怒")

	-- 确保在巨熊形态下
	if MPDriudBearSaved.Bear==1 and MPDriudBearShapeshiftID>0 then
		if not MPGetShape(MPDriudBearShapeshiftID) then
			CastShapeshiftForm(MPDriudBearShapeshiftID)
		end
	end
	--[[
	if MPDriudBearSaved.Bear==1 then
		if not MPBuff("巨熊形态") or not MPBuff("熊形态") then
			CastSpellByName("巨熊形态")
		end
		if not MPBuff("巨熊形态") or not MPBuff("熊形态") then
			CastSpellByName("熊形态")
		end
	end
	]]

	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPDriudBearSaved.Target)

	-- 开启自动攻击
	MPStartAttack()

	-- 自动拾取
	if MPDriudBearSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPDriudBearSaved.Power==1 then
		MPCatPower()
	end

	-- 在战斗中
	if MPInCombat then
		-- 自动开启饰品
		if GetInventoryItemCooldown("player",13)==0 and MP_Trinket_Upper==1 and MPGetTargetDistance() and MPDriudBearSaved.Trinket_Upper==1 then
			if MPDriudBearSaved.TUBoss==1 and MPIsBossTarget() then
				UseInventoryItem(13)
			elseif MPDriudBearSaved.TUBoss==0 then
				UseInventoryItem(13)
			end
		end
		if GetInventoryItemCooldown("player",14)==0 and MP_Trinket_Below==1 and MPGetTargetDistance() and MPDriudBearSaved.Trinket_Below==1 then
			if MPDriudBearSaved.TBBoss==1 and MPIsBossTarget() then
				UseInventoryItem(14)
			elseif MPDriudBearSaved.TBBoss==0 then
				UseInventoryItem(14)
			end
		end

		if MPDriudBearSaved.Soulspeed==1 and MPIsBossTarget() then
			MPUseItemByName("魂能之速")
		end

		-- 血量危险时处理
		local percent = UnitHealth("player") / UnitHealthMax("player") * 100
		if percent<MPDriudBearSaved.HealthStone_Value and MPDriudBearSaved.HealthStone==1 then
			MPUseItemByName("特效治疗石")
		end
		if percent<MPDriudBearSaved.HerbalTea_Value and MPDriudBearSaved.HerbalTea==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end
		if percent<MPDriudBearSaved.Frenzied_Value and MPDriudBearSaved.Frenzied==1 and MPGetShape(MPDriudBearShapeshiftID) then
			CastSpellByName("狂暴回复")
		end
		if percent<MPDriudBearSaved.Berserk_Value and MPDriudBearSaved.Berserk==1 and MPDriudBerserk==1 and MPGetShape(MPDriudBearShapeshiftID) then
			CastSpellByName("狂暴")
		end
		if percent<MPDriudBearSaved.Barkskin_Value and MPDriudBearSaved.Barkskin==1 and MPGetShape(MPDriudBearShapeshiftID) then
			CastSpellByName("树皮术（野性）")
		end


	end

	-- 是否自动取消拯救
	if MPDriudBearSaved.UnSalvation==1 and (MPBuff("强效拯救祝福") or MPBuff("拯救祝福")) then
		MPCancelBuffByName("强效拯救祝福")
		MPCancelBuffByName("拯救祝福")
	end

	-- 清晰预兆在，则优先使用野蛮撕咬
	if JNSF and XMSY then
		CastSpellByName("野蛮撕咬")
	end

	if myPower >= MPDruidFerociousBitePower and XMSY then
		CastSpellByName("野蛮撕咬")
	end


	-- 根据周围的敌人数量来选择策略
	if MPScanNearbyEnemiesCount() > 1 and MPDriudBearSaved.SwipeFirst==1 then

		-- 群拉
		if myPower >= MPDruidSwipePower and MPDriudBearSaved.Swipe==1 and value==0 then
			CastSpellByName("挥击")
		end
		if myPower >= MPDruidSwipePower+MPDruidManglePower then
			CastSpellByName("槌击")
		end

		-- 能量空挡时用精灵之火填补GCD
		if myPower<MPDruidSwipePower and MPIsFaerieFire() and not XMSY and MPDriudBearSaved.FaerieFire==1 then 
			if MPGetTargetDistance() and MPGetShape(MPDriudBearShapeshiftID) then
				CastSpellByName("精灵之火（野性）")
			end
		end

	else

		if MPDriudBearSaved.MangleFirst==1 and myPower>=MPDruidManglePower then
			CastSpellByName("槌击")
		end

		-- 单拉
		if myPower >= MPDruidFerociousBitePower+MPDruidManglePower then
			CastSpellByName("槌击")
		end

		if myPower >= MPDruidSwipePower+MPDruidFerociousBitePower and not JNSF and not XMSY and MPDriudBearSaved.Swipe==1 and value==0 then  --  +MPDruidManglePower
			CastSpellByName("挥击")
		end

		if myPower >= 80 and not XMSY and MPDriudBearSaved.Swipe==1 and value==0 then  --  +MPDruidManglePower
			CastSpellByName("挥击")
		end

		-- 能量空挡时用精灵之火填补GCD
		if myPower<MPDruidFerociousBitePower and MPIsFaerieFire() and not XMSY and MPDriudBearSaved.FaerieFire==1 then 
			if MPGetTargetDistance() and MPGetShape(MPDriudBearShapeshiftID) then
				CastSpellByName("精灵之火（野性）")
			end
		end

	end

	-- 是否自动开启狂怒
	if MPDriudBearSaved.Fury==1 and KN and MPInCombat then
		if not MPBuff("血之狂暴") then
			if MPDriudBearSaved.Burst==1 then
				if MPIsBossTarget() then
					CastSpellByName("狂怒")
				end
			else
				CastSpellByName("狂怒")
			end
		end
	end

	-- 保持 精灵之火
	if MPDriudBearSaved.FaerieFire==1 and MPIsFaerieFire() and not XMSY and not MPBuff("精灵之火（野性）","target") and not MPBuff("精灵之火","target") then
		if MPGetTargetDistance() and MPGetShape(MPDriudBearShapeshiftID) then
			CastSpellByName("精灵之火（野性）")
		end
	end


	-- 是否要补挫志咆哮
	if MPDriudBearSaved.Demoralizing==1 and GetTime()-MPInCombatTime>BEAR_DemoralizingDelay and value==0 then
		if UnitExists("target") and (not MPCZTimer or GetTime()-MPCZTimer>30) and GCD>1.5 then
			if myPower>9 and not MPBuff("挫志咆哮","target") and not MPBuff("挫志怒吼","target") and not XMSY then
				CastSpellByName("挫志咆哮")
				MPCZTimer=GetTime()
			end
		end
	end

	-- 远距离补精灵之火
	MPFaerieFire()


end









