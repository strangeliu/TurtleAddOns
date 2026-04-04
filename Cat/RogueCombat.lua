if MPPlayerClass ~= "ROGUE" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 战斗贼一键宏
-- 发布日期：2026-04-03 （后面根据时间来判断版本）
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
--
-- 可选条件：SuperWoW
--
-- -------------------------------------
--
-- 功能配置：
-- 注：修改以下配置，需要在游戏中/reload，或者小退让配置生效
-- 
-- 主开关
-- 以下功能开关：1开启 0关闭


local AUTO_RDPS_Trinket_Delay = 3			-- 进入战斗后，3秒后才允许使用饰品


-- -------------------------------------
-- 全局变量，可以直接调用，不需要函数访问，以提高宏的性能
-- 以下参数请勿手动修改，插件会自动进行变化

-- 突袭天赋是否存在
MPRogueRiposte = 0

-- 血腥气息是否点满
MPRogueBloody = 0

-- 是否有剑刃乱舞
MPRogueBladeFlurry = 0

-- 能量消耗相关

-- 切割能量
MPRogueSliceEnergy = 20
MPRogueSliceDuration = 0
MPRogueSliceTalent = 0

-- 当前连击点
MPRogueCombo = 1

-- 割裂buff持续时间
MPRogueBloodyDuration = 0
MPRogueBloodyTalent = 0

-- 毒伤buff持续时间
MPRogueEnvenomDuration = 0


-- 突袭的闪避状态
MPRogueSurpriseStrikeTimer = 0
MPRogueSurpriseStrikeTargetGUID = 0
MPRogueSurpriseStrikeTimerNoSW = 0

-- 盗贼主手武器 1=其他 2=匕首
MPRogueMainHand = 1

-- 毒伤 天赋
MPRogueEnvenom = 0

-- 双刃毒袭 天赋
MPRogueBothSword = 0

-- -------------------------------------


local QG,GCP,QX,THP,myPower,TX,XX,JRLW,DS,PJ,YG
local TargetDistance = false



-- 战斗贼
function MPRogueCombatDPS()


	myPower = UnitMana("player")
	THP = UnitHealth("target")
	QX = MPBuff("潜行")

	GCP = GetComboPoints("target")
	--JRLW = MPSpellReady("剑刃乱舞")
	BEHIND = MPCheckBehind(MPRogueCombatSaved.UnitXP)
	TX = MPSpellReady("突袭")
	YG = MPSpellReady("佯攻")
	TargetDistance = MPGetTargetDistance()


	-- 补充毒药
	if MPRogueCombatSaved.LeaveFight==0 or (MPRogueCombatSaved.LeaveFight==1 and not MPInCombat) then

		-- 主手
		if MPRogueCombatSaved.MainHand==1 then

			-- 获取武器信息
			local main, mc, mn = MPGetMainHandCount()

			-- 覆盖
			if MPRogueCombatSaved.Cover==1 and main then
				if mn ~= MPRogueCombatSaved.MainHand_Value then
					MPPutonPostion(MPRogueCombatSaved.MainHand_Value, 16)
				end
			end

			if mc<MPRogueCombatSaved.MainHandCount then
				MPPutonPostion(MPRogueCombatSaved.MainHand_Value, 16)
			end

		end

		-- 副手
		if MPRogueCombatSaved.OffHand==1 then

			-- 获取武器信息
			local off, oc, on = MPGetOffHandCount()

			if MPRogueCombatSaved.Cover==1 and off then
				if on~=MPRogueCombatSaved.OffHand_Value then
					MPPutonPostion(MPRogueCombatSaved.OffHand_Value, 17)
				end
			end

			if oc<MPRogueCombatSaved.OffHandCount then
				MPPutonPostion(MPRogueCombatSaved.OffHand_Value, 17)
			end

		end

	end

	-- 在潜行状态
	if QX and MPRogueCombatSaved.Stealth==1 then

		if MPBuff("放逐术", "target") then
			return
		end

		MPStopAttack()

		if MPTargetBleed then
			CastSpellByName("绞喉")
			return
		else
			if MPRogueMainHand==2 then
				CastSpellByName("伏击")
				return
			else
				CastSpellByName("偷袭")
				return
			end
		end

	end



	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPRogueCombatSaved.Target)

	-- 开启自动攻击
	MPStartAttack()

	-- 自动拾取
	if MPRogueCombatSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPRogueCombatSaved.Power==1 then
		MPCatPower()
	end


	if MPBuff("放逐术", "target") then
		return
	end


	-- 在战斗中
	if MPInCombat then


		-- 自动开启饰品
		if GetInventoryItemCooldown("player",13)==0 and MP_Trinket_Upper==1 and GetTime()-MPInCombatTime>AUTO_RDPS_Trinket_Delay and TargetDistance and MPRogueCombatSaved.Trinket_Upper==1 then
			if MPRogueCombatSaved.TUBoss==1 and MPIsBossTarget() then
				UseInventoryItem(13)
			elseif MPRogueCombatSaved.TUBoss==0 then
				UseInventoryItem(13)
			end
		end
		if GetInventoryItemCooldown("player",14)==0 and MP_Trinket_Below==1 and GetTime()-MPInCombatTime>AUTO_RDPS_Trinket_Delay and TargetDistance and MPRogueCombatSaved.Trinket_Below==1 then
			if MPRogueCombatSaved.TBBoss==1 and MPIsBossTarget() then
				UseInventoryItem(14)
			elseif MPRogueCombatSaved.TBBoss==0 then
				UseInventoryItem(14)
			end
		end

		if MPRogueCombatSaved.Soulspeed==1 and MPIsBossTarget() then
			MPUseItemByName("魂能之速")
		end

		-- 血量危险时处理
		local percent = UnitHealth("player") / UnitHealthMax("player") * 100
		if percent<MPRogueCombatSaved.HealthStone_Value and MPRogueCombatSaved.HealthStone==1 then
			MPUseItemByName("特效治疗石")
		end
		if percent<MPRogueCombatSaved.HerbalTea_Value and MPRogueCombatSaved.HerbalTea==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end
		if percent<MPRogueCombatSaved.Carrot_Value and MPRogueCombatSaved.Carrot==1 then
			MPUseItemByName("鞭根块茎")
		end

		-- 特定 种族天赋 --

		if MPRogueCombatSaved.RacialTraits==1 and TargetDistance then

			-- 是否自动开启 人类-感知
			if MPPlayerRace=="Human" then
				local TF = MPSpellReady("感知")
				if TF then CastSpellByName("感知") end
			end

			-- 是否自动开启 兽人-血性狂怒
			if MPPlayerRace=="Orc" then
				local TF = MPSpellReady("血性狂怒")
				if TF then CastSpellByName("血性狂怒") end
			end
		
			-- 是否自动开启 巨魔-狂暴
			if MPPlayerRace=="Troll" then
				local TF = MPSpellReady("狂暴")
				if TF then CastSpellByName("狂暴") end
			end

		end

	end

	-- 自动打断
	if MPRogueCombatSaved.Interrupt==1 then
		MPINTCast()
	end

	-- 保护剑刃乱舞
	if MPRogueCombatSaved.Protect==1 and GetTime()-MPRogueProtectTimer>3.0 then

		MPCancelBuffByName("奥术光辉")
		MPCancelBuffByName("奥术智慧")
		MPCancelBuffByName("精神祷言")
		MPCancelBuffByName("神圣之灵")
		MPCancelBuffByName("智慧祝福")
		MPCancelBuffByName("强效智慧祝福")

		MPRogueProtectTimer = GetTime()

	end

	-- 剑刃乱舞
	if MPRogueCombatSaved.BladeFlurry==1 and myPower>24 then
		local aoe = MPScanNearbyEnemiesCount(MPRogueCombatSaved.BladeFlurry_Value-4)
		if aoe>1 and not MPBuff("剑刃乱舞") then
			MPCastWithoutNampower("剑刃乱舞")
		elseif aoe<=1 and MPBuff("剑刃乱舞") and TargetDistance then
			MPCancelBuffByName("剑刃乱舞")
		end
	end

	-- 仇恨高的时候佯攻
	-- 仇恨高于80
	if MPRogueCombatSaved.Feint==1 and YG and myPower>=20 and MPGetHatredFromTWT()>=80 then
		MPCastWithNampower("佯攻")
		return
	end

	if GCP>=1 and GCP<=2 then

		-- 保持切割
		if MPRogueCombatSaved.SliceDice==1 and not MPGetRogueSlice(2) and myPower>=MPRogueSliceEnergy then
			MPCastWithoutNampower("切割")
			return
		end

		-- 保持毒伤
		if MPRogueCombatSaved.Envenom==1 and MPRogueEnvenom==1 and not MPGetRogueEnvenom(2) and myPower>=20 then
			MPCastWithoutNampower("毒伤")
			return
		end

	elseif GCP==3 then

		if MPGetRogueBloody(10) or MPRogueBloody==0 or MPRogueCombatSaved.Bloody==0 then

			-- 保持切割
			if MPRogueCombatSaved.SliceDice==1 and not MPGetRogueSlice(4) and myPower>=MPRogueSliceEnergy then
				MPCastWithoutNampower("切割")
				return
			end

			-- 保持毒伤
			if MPRogueCombatSaved.Envenom==1 and MPRogueEnvenom==1 and not MPGetRogueEnvenom(4) and myPower>=20 then
				MPCastWithoutNampower("毒伤")
				return
			end

		end

	elseif GCP==4 then

		if MPGetRogueBloody(10) or MPRogueBloody==0 or MPRogueCombatSaved.Bloody==0 then

			-- 保持切割
			if MPRogueCombatSaved.SliceDice==1 and not MPGetRogueSlice(2) and myPower>=MPRogueSliceEnergy then
				MPCastWithoutNampower("切割")
				return
			end

			-- 保持毒伤
			if MPRogueCombatSaved.Envenom==1 and MPRogueEnvenom==1 and  not MPGetRogueEnvenom(2) and myPower>=20 then
				MPCastWithoutNampower("毒伤")
				return
			end


			if MPRogueCombatSaved.Eviscerate==1 and myPower>29 then
				MPCastWithoutNampower("剔骨")
				return
			end

		end

	elseif GCP==5 then

		if MPGetRogueBloody(10) or MPRogueBloody==0 or MPRogueCombatSaved.Bloody==0 then

			-- 保持切割
			if MPRogueCombatSaved.SliceDice==1 and not MPGetRogueSlice(3) and myPower>=MPRogueSliceEnergy then
				MPCastWithoutNampower("切割")
				return
			end

			-- 保持毒伤
			if MPRogueCombatSaved.Envenom==1 and MPRogueEnvenom==1 and  not MPGetRogueEnvenom(3) and myPower>=20 then
				MPCastWithoutNampower("毒伤")
				return
			end

			if MPRogueCombatSaved.Eviscerate==1 and myPower>29 then
				MPCastWithoutNampower("剔骨")
				return
			end


		else

			if MPRogueCombatSaved.Bloody==1 and MPRogueBloody==1 and not MPGetRogueBloody(5) and myPower>=20 then
				MPCastWithoutNampower("割裂")
				return
			end

			if MPRogueCombatSaved.Bloody==1 and MPRogueBloody==1 and myPower>=20 then
				if not MPGetRogueSlice(3) or not MPGetRogueEnvenom(3) then
					MPCastWithoutNampower("割裂")
					return
				end
			end

		end

	end





	-- 填充技能



	-- 尝试还击
	if MPRogueCombatSaved.Riposte==1 and myPower>9 then
		CastSpellByName("还击")
	end

	if MPRogueCombatSaved.Backstab==1 and MPRogueMainHand==2 then

		-- 背刺贼
		if BEHIND then
			if myPower>59 then
				CastSpellByName("背刺")
			end
		else
			if myPower>39 and MPRogueCombatSaved.GhostlyStrike==1 then
				CastSpellByName("鬼魅攻击")
			end

			if MPRogueCombatSaved.SinisterStrike==1 and myPower>39 then
				CastSpellByName("邪恶攻击")
			end

		end

	else

		-- 战斗贼
		if myPower>39 and MPRogueCombatSaved.GhostlyStrike==1 then
			CastSpellByName("鬼魅攻击")
		end

		if myPower>39 then
			CastSpellByName("邪恶攻击")
		end


	end

	-- 突袭
	if MPRogueCombatSaved.SurpriseStrike==1 and MPRogueRiposte==1 and myPower>9 and MPRogueSurpriseStrike() and TX then
		CastSpellByName("突袭")
		return
	end


end
