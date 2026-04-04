if MPPlayerClass ~= "ROGUE" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 毒伤贼一键宏
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

-- -------------------------------------


local QG,GCP,QX,THP,myPower,TX,XX,JRLW,DS,PJ,YG
local TargetDistance = false





-- 毒伤贼
function MPRogueEnvenomDPS()


	myPower = UnitMana("player")
	THP = UnitHealth("target")
	QX = MPBuff("潜行")

	DS = MPGetRogueEnvenom(0)	-- 毒伤
	XX = MPGetRogueBloody(0)	-- 血腥气息
	QG = MPGetRogueSlice(0)	-- 切割

	GCP = GetComboPoints("target")
	--JRLW = MPSpellReady("剑刃乱舞")
	BEHIND = MPCheckBehind(MPRogueEnvenomSaved.UnitXP)
	TX = MPSpellReady("突袭")
	YG = MPSpellReady("佯攻")
	TargetDistance = MPGetTargetDistance()


	-- 补充毒药
	if MPRogueEnvenomSaved.LeaveFight==0 or (MPRogueEnvenomSaved.LeaveFight==1 and not MPInCombat) then

		-- 主手
		if MPRogueEnvenomSaved.MainHand==1 then

			-- 获取武器信息
			local main, mc, mn = MPGetMainHandCount()

			-- 覆盖
			if MPRogueEnvenomSaved.Cover==1 and main then
				if mn ~= MPRogueEnvenomSaved.MainHand_Value then
					MPPutonPostion(MPRogueEnvenomSaved.MainHand_Value, 16)
				end
			end

			if mc<MPRogueEnvenomSaved.MainHandCount then
				MPPutonPostion(MPRogueEnvenomSaved.MainHand_Value, 16)
			end

		end

		-- 副手
		if MPRogueEnvenomSaved.OffHand==1 then

			-- 获取武器信息
			local off, oc, on = MPGetOffHandCount()

			if MPRogueEnvenomSaved.Cover==1 and off then
				if on~=MPRogueEnvenomSaved.OffHand_Value then
					MPPutonPostion(MPRogueEnvenomSaved.OffHand_Value, 17)
				end
			end

			if oc<MPRogueEnvenomSaved.OffHandCount then
				MPPutonPostion(MPRogueEnvenomSaved.OffHand_Value, 17)
			end

		end

	end


	-- 在潜行状态
	if QX and MPRogueEnvenomSaved.Stealth==1 then

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
	MPAutoSwitchTarget(MPRogueEnvenomSaved.Target)

	-- 开启自动攻击
	MPStartAttack()

	-- 自动拾取
	if MPRogueEnvenomSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPRogueEnvenomSaved.Power==1 then
		MPCatPower()
	end


	if MPBuff("放逐术", "target") then
		return
	end


	-- 在战斗中
	if MPInCombat then
		-- 自动开启饰品
		if GetInventoryItemCooldown("player",13)==0 and MP_Trinket_Upper==1 and GetTime()-MPInCombatTime>AUTO_RDPS_Trinket_Delay and TargetDistance and MPRogueEnvenomSaved.Trinket_Upper==1 then
			if MPRogueEnvenomSaved.TUBoss==1 and MPIsBossTarget() then
				UseInventoryItem(13)
			elseif MPRogueEnvenomSaved.TUBoss==0 then
				UseInventoryItem(13)
			end
		end
		if GetInventoryItemCooldown("player",14)==0 and MP_Trinket_Below==1 and GetTime()-MPInCombatTime>AUTO_RDPS_Trinket_Delay and TargetDistance and MPRogueEnvenomSaved.Trinket_Below==1 then
			if MPRogueEnvenomSaved.TBBoss==1 and MPIsBossTarget() then
				UseInventoryItem(14)
			elseif MPRogueEnvenomSaved.TBBoss==0 then
				UseInventoryItem(14)
			end
		end

		if MPRogueEnvenomSaved.Soulspeed==1 and MPIsBossTarget() then
			MPUseItemByName("魂能之速")
		end

		-- 血量危险时处理
		local percent = UnitHealth("player") / UnitHealthMax("player") * 100
		if percent<MPRogueEnvenomSaved.HealthStone_Value and MPRogueEnvenomSaved.HealthStone==1 then
			MPUseItemByName("特效治疗石")
		end
		if percent<MPRogueEnvenomSaved.HerbalTea_Value and MPRogueEnvenomSaved.HerbalTea==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end
		if percent<MPRogueEnvenomSaved.Carrot_Value and MPRogueEnvenomSaved.Carrot==1 then
			MPUseItemByName("鞭根块茎")
		end

		-- 特定 种族天赋 --

		if MPRogueEnvenomSaved.RacialTraits==1 and TargetDistance then

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
	if MPRogueEnvenomSaved.Interrupt==1 then
		MPINTCast()
	end

	-- 保护剑刃乱舞
	if MPRogueEnvenomSaved.Protect==1 and GetTime()-MPRogueProtectTimer>3.0 then

		MPCancelBuffByName("奥术光辉")
		MPCancelBuffByName("奥术智慧")
		MPCancelBuffByName("精神祷言")
		MPCancelBuffByName("神圣之灵")
		MPCancelBuffByName("智慧祝福")
		MPCancelBuffByName("强效智慧祝福")

		MPRogueProtectTimer = GetTime()

	end

	-- 剑刃乱舞
	if MPRogueEnvenomSaved.BladeFlurry==1 and myPower>24 then
		if MPScanNearbyEnemiesCount(MPRogueEnvenomSaved.BladeFlurry_Value-4)>1 and not MPBuff("剑刃乱舞") then
			MPCastWithoutNampower("剑刃乱舞")
		elseif MPScanNearbyEnemiesCount(MPRogueEnvenomSaved.BladeFlurry_Value-4)<=1 and MPBuff("剑刃乱舞") then
			MPCastWithoutNampower("剑刃乱舞")
		end
	end

	-- 仇恨高的时候佯攻
	-- 仇恨高于80
	if MPRogueEnvenomSaved.Feint==1 and YG and myPower>=20 and MPGetHatredFromTWT()>=80 then
		MPCastWithNampower("佯攻")
		return
	end

	if GCP>=1 and GCP<=2 then

		-- 保持毒伤
		if MPRogueEnvenomSaved.Envenom==1 and MPRogueEnvenom==1 and not MPGetRogueEnvenom(1) and myPower>=20 then
			MPCastWithoutNampower("毒伤")
			return
		end
		-- 保持切割
		if MPRogueEnvenomSaved.SliceDice==1 and not MPGetRogueSlice(1) and myPower>=MPRogueSliceEnergy then
			MPCastWithoutNampower("切割")
			return
		end

	elseif GCP==3 then

		if MPGetRogueBloody(8) or MPRogueBloody==0 or MPRogueEnvenomSaved.Bloody==0 then

			-- 保持毒伤
			if MPRogueEnvenomSaved.Envenom==1 and MPRogueEnvenom==1 and not MPGetRogueEnvenom(2) and myPower>=20 then
				MPCastWithoutNampower("毒伤")
				return
			end
			-- 保持切割
			if MPRogueEnvenomSaved.SliceDice==1 and not MPGetRogueSlice(2) and myPower>=MPRogueSliceEnergy then
				MPCastWithoutNampower("切割")
				return
			end

		end

	elseif GCP==4 then

		if MPGetRogueBloody(10) or MPRogueBloody==0 or MPRogueEnvenomSaved.Bloody==0 then

			-- 保持毒伤
			if MPRogueEnvenomSaved.Envenom==1 and MPRogueEnvenom==1 and  not MPGetRogueEnvenom(3) and myPower>=20 then
				MPCastWithoutNampower("毒伤")
				return
			end
			-- 保持切割
			if MPRogueEnvenomSaved.SliceDice==1 and not MPGetRogueSlice(3) and myPower>=MPRogueSliceEnergy then
				MPCastWithoutNampower("切割")
				return
			end


			if MPRogueEnvenomSaved.Eviscerate==1 and myPower>29 and (not MPGetRogueSlice(5) or not MPGetRogueEnvenom(5)) then
				MPCastWithoutNampower("剔骨")
				return
			end


		end

	elseif GCP==5 then

		if MPGetRogueBloody(10) or MPRogueBloody==0 or MPRogueEnvenomSaved.Bloody==0 then

			-- > 10

			-- 保持毒伤
			if MPRogueEnvenomSaved.Envenom==1 and MPRogueEnvenom==1 and  not MPGetRogueEnvenom(4) and myPower>=20 then
				MPCastWithoutNampower("毒伤")
				return
			end
			-- 保持切割
			if MPRogueEnvenomSaved.SliceDice==1 and not MPGetRogueSlice(4) and myPower>=MPRogueSliceEnergy then
				MPCastWithoutNampower("切割")
				return
			end

			if MPRogueEnvenomSaved.Eviscerate==1 and myPower>29 and (not MPGetRogueSlice(5) or not MPGetRogueEnvenom(5)) then
				MPCastWithoutNampower("剔骨")
				return
			end


		else

			-- < 10

			if MPRogueEnvenomSaved.Bloody==1 and MPRogueBloody==1 and not MPGetRogueBloody(4) and myPower>=20 then
				MPCastWithoutNampower("割裂")
				return
			end

			if MPRogueEnvenomSaved.Bloody==1 and MPRogueBloody==1 and (not MPGetRogueSlice(2) or not MPGetRogueEnvenom(2)) and myPower>=20 then
				--print("紧急-割裂")
				MPCastWithoutNampower("割裂")
				return
			end


		end

	end


	-- 填充技能


	-- 尝试还击
	if MPRogueEnvenomSaved.Riposte==1 and myPower>9 then
		CastSpellByName("还击")
	end

	if myPower>39 and MPRogueEnvenomSaved.GhostlyStrike==1 then
		CastSpellByName("鬼魅攻击")
	end
	if myPower>44 then
		CastSpellByName("双刃毒袭")
	end

	-- 突袭
	if MPRogueEnvenomSaved.SurpriseStrike==1 and MPRogueRiposte==1 and myPower>9 and MPRogueSurpriseStrike() and TX then
		CastSpellByName("突袭")
		return
	end
end



