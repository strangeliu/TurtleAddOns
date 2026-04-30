if MPPlayerClass ~= "DRUID" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 全自动熊一键宏
-- 更新日期：2026-04-12 （后面根据时间来判断版本）
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

-- 默认配置
MPDriudBearConfig = 1


function MPBear(value)

	value = value or 0

	myPower = UnitMana("player")
	MHP = UnitHealth("player")
	GCD = MPGetGCD()
	JNSF = MPGetOmen()
	XMSY = MPSpellReadyOffset("野蛮撕咬")
	KN = MPSpellReady("狂怒")

	-- 确保在巨熊形态下
	if MPDriudBearSaved[MPDriudBearConfig].Bear==1 and MPDriudBearShapeshiftID>0 then
		if not MPGetShape(MPDriudBearShapeshiftID) then
			CastShapeshiftForm(MPDriudBearShapeshiftID)
		end
	end
	--[[
	if MPDriudBearSaved[MPDriudBearConfig].Bear==1 then
		if not MPBuff("巨熊形态") or not MPBuff("熊形态") then
			CastSpellByName("巨熊形态")
		end
		if not MPBuff("巨熊形态") or not MPBuff("熊形态") then
			CastSpellByName("熊形态")
		end
	end
	]]

	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPDriudBearSaved[MPDriudBearConfig].Target)

	-- 开启自动攻击
	MPStartAttack()

	-- 自动拾取
	if MPDriudBearSaved[MPDriudBearConfig].Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPDriudBearSaved[MPDriudBearConfig].Power==1 then
		MPCatPower()
	end

	-- 在战斗中
	if MPInCombat then
		-- 自动开启饰品
		if GetInventoryItemCooldown("player",13)==0 and MP_Trinket_Upper==1 and MPGetTargetDistance() and MPDriudBearSaved[MPDriudBearConfig].Trinket_Upper==1 then
			if MPDriudBearSaved[MPDriudBearConfig].TUBoss==1 and MPIsBossTarget() then
				UseInventoryItem(13)
			elseif MPDriudBearSaved[MPDriudBearConfig].TUBoss==0 then
				UseInventoryItem(13)
			end
		end
		if GetInventoryItemCooldown("player",14)==0 and MP_Trinket_Below==1 and MPGetTargetDistance() and MPDriudBearSaved[MPDriudBearConfig].Trinket_Below==1 then
			if MPDriudBearSaved[MPDriudBearConfig].TBBoss==1 and MPIsBossTarget() then
				UseInventoryItem(14)
			elseif MPDriudBearSaved[MPDriudBearConfig].TBBoss==0 then
				UseInventoryItem(14)
			end
		end

		if MPDriudBearSaved[MPDriudBearConfig].Soulspeed==1 and TargetDistance then
			if MPDriudBearSaved[MPDriudBearConfig].SoulspeedBoss==0 or (MPDriudBearSaved[MPDriudBearConfig].SoulspeedBoss==1 and MPIsBossTarget()) then
				MPUseItemByName("魂能之速")
			end
		end

		-- 血量危险时处理
		local percent = UnitHealth("player") / UnitHealthMax("player") * 100
		if percent<MPDriudBearSaved[MPDriudBearConfig].HealthStone_Value and MPDriudBearSaved[MPDriudBearConfig].HealthStone==1 then
			MPUseItemByName("特效治疗石")
		end
		if percent<MPDriudBearSaved[MPDriudBearConfig].HerbalTea_Value and MPDriudBearSaved[MPDriudBearConfig].HerbalTea==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end
		if percent<MPDriudBearSaved[MPDriudBearConfig].Frenzied_Value and MPDriudBearSaved[MPDriudBearConfig].Frenzied==1 and MPGetShape(MPDriudBearShapeshiftID) then
			CastSpellByName("狂暴回复")
		end
		if percent<MPDriudBearSaved[MPDriudBearConfig].Berserk_Value and MPDriudBearSaved[MPDriudBearConfig].Berserk==1 and MPDriudBerserk==1 and MPGetShape(MPDriudBearShapeshiftID) then
			CastSpellByName("狂暴")
		end
		if percent<MPDriudBearSaved[MPDriudBearConfig].Barkskin_Value and MPDriudBearSaved[MPDriudBearConfig].Barkskin==1 and MPGetShape(MPDriudBearShapeshiftID) then
			CastSpellByName("树皮术（野性）")
		end


	end

	-- 是否自动取消拯救
	if MPDriudBearSaved[MPDriudBearConfig].UnSalvation==1 and (MPBuff("强效拯救祝福") or MPBuff("拯救祝福")) then
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
	if MPScanNearbyEnemiesCount() > 1 and MPDriudBearSaved[MPDriudBearConfig].SwipeFirst==1 then

		-- 群拉
		if myPower >= MPDruidSwipePower and MPDriudBearSaved[MPDriudBearConfig].Swipe==1 and value==0 then
			CastSpellByName("挥击")
		end
		if myPower >= MPDruidSwipePower+MPDruidManglePower then
			CastSpellByName("槌击")
		end

		-- 能量空挡时用精灵之火填补GCD
		if myPower<MPDruidSwipePower and MPIsFaerieFire() and not XMSY and MPDriudBearSaved[MPDriudBearConfig].FaerieFire==1 then 
			if MPGetTargetDistance() and MPGetShape(MPDriudBearShapeshiftID) then
				CastSpellByName("精灵之火（野性）")
			end
		end

	else

		if MPDriudBearSaved[MPDriudBearConfig].MangleFirst==1 and myPower>=MPDruidManglePower then
			CastSpellByName("槌击")
		end

		-- 单拉
		if myPower >= MPDruidFerociousBitePower+MPDruidManglePower then
			CastSpellByName("槌击")
		end

		if myPower >= MPDruidSwipePower+MPDruidFerociousBitePower and not JNSF and not XMSY and MPDriudBearSaved[MPDriudBearConfig].Swipe==1 and value==0 then  --  +MPDruidManglePower
			CastSpellByName("挥击")
		end

		if myPower >= 80 and not XMSY and MPDriudBearSaved[MPDriudBearConfig].Swipe==1 and value==0 then  --  +MPDruidManglePower
			CastSpellByName("挥击")
		end

		-- 能量空挡时用精灵之火填补GCD
		if myPower<MPDruidFerociousBitePower and MPIsFaerieFire() and not XMSY and MPDriudBearSaved[MPDriudBearConfig].FaerieFire==1 then 
			if MPGetTargetDistance() and MPGetShape(MPDriudBearShapeshiftID) then
				CastSpellByName("精灵之火（野性）")
			end
		end

	end

	-- 是否自动开启狂怒
	if MPDriudBearSaved[MPDriudBearConfig].Fury==1 and KN and MPInCombat then
		if not MPBuff("血之狂暴") then
			if MPDriudBearSaved[MPDriudBearConfig].FuryBoss==1 then
				if MPIsBossTarget() then
					CastSpellByName("狂怒")
				end
			else
				CastSpellByName("狂怒")
			end
		end
	end

	-- 保持 精灵之火
	if MPDriudBearSaved[MPDriudBearConfig].FaerieFire==1 and MPIsFaerieFire() and not XMSY and not MPBuff("精灵之火（野性）","target") and not MPBuff("精灵之火","target") then
		if MPGetTargetDistance() and MPGetShape(MPDriudBearShapeshiftID) then
			CastSpellByName("精灵之火（野性）")
		end
	end


	-- 是否要补挫志咆哮
	if MPDriudBearSaved[MPDriudBearConfig].Demoralizing==1 and GetTime()-MPInCombatTime>BEAR_DemoralizingDelay and value==0 then
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









