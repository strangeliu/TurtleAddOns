if MPPlayerClass ~= "HUNTER" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 兽王猎一键宏
-- 发布日期：2026-03-22 （后面根据时间来判断版本）
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

local AUTO_HBDPS_Trinket_Delay = 3				-- 进入战斗后，3秒后才允许使用饰品


-- -------------------------------------
-- 全局变量，可以直接调用，不需要函数访问，以提高宏的性能
-- 以下参数请勿手动修改，插件会自动进行变化

-- 杀戮命令 天赋
MPHunterKillCommand = 1

-- -------------------------------------


local DCSJ,KSDC,ASSJ,KC,MZSJ

-- 检测自动射击是否拖出来
local function MPCheckAutoShot()
	for A=1,172 do
		local _,_,id = GetActionText(A)
		if id==75 then
			return
		end
	end

	DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."请将【自动射击】拖到技能条的任意位置！")
end

local function MPAutoShot()

	for A=1,172 do
		if IsAutoRepeatAction(A)  then
			return
		end
	end

	CastSpellByName("自动射击")
end


function MPHunterBeastDPS()

	DCSJ = MPSpellReady("多重射击")
	KSDC = MPSpellReady("蝰蛇钉刺")
	ASSJ = MPSpellReady("奥术射击")
	KC = MPSpellReady("杀戮命令")
	MZSJ = MPSpellReady("瞄准射击")


	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPHunterBeastSaved.Target, 0)

	-- 自动拾取
	if MPHunterBeastSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPHunterBeastSaved.Power==1 then
		MPCatPower()
	end


	if not UnitExists("target") then return end

	if MPBuff("放逐术", "target") then
		return
	end

	-- 自动攻击/自动射击
	if MPGetTargetDistance() then
		MPStartAttack()
	else
		MPAutoShot()
	end

	-- 宠物攻击
	if MPHunterBeastSaved.PetAttack==1 and UnitAffectingCombat("target") then
		PetAttack()
	end

	-- 在战斗中
	if MPInCombat then
		-- 自动开启饰品
		if GetInventoryItemCooldown("player",13)==0 and MP_Trinket_Upper==1 and GetTime()-MPInCombatTime>AUTO_HBDPS_Trinket_Delay and MPHunterBeastSaved.Trinket_Upper==1 then
			if MPHunterBeastSaved.TUBoss==1 and MPIsBossTarget() then
				UseInventoryItem(13)
			elseif MPHunterBeastSaved.TUBoss==0 then
				UseInventoryItem(13)
			end
		end
		if GetInventoryItemCooldown("player",14)==0 and MP_Trinket_Below==1 and GetTime()-MPInCombatTime>AUTO_HBDPS_Trinket_Delay and MPHunterBeastSaved.Trinket_Below==1 then
			if MPHunterBeastSaved.TBBoss==1 and MPIsBossTarget() then
				UseInventoryItem(14)
			elseif MPHunterBeastSaved.TBBoss==0 then
				UseInventoryItem(14)
			end
		end
		if MPHunterBeastSaved.Soulspeed==1 and MPIsBossTarget() then
			MPUseItemByName("魂能之速")
		end

		-- 血量危险时处理
		local percent = UnitHealth("player") / UnitHealthMax("player") * 100
		if percent<MPHunterBeastSaved.HealthStone_Value and MPHunterBeastSaved.HealthStone==1 then
			MPUseItemByName("特效治疗石")
		end
		if percent<MPHunterBeastSaved.HerbalTea_Value and MPHunterBeastSaved.HerbalTea==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end
		local percentMana = UnitMana("player") / UnitManaMax("player") * 100
		if percentMana<MPHunterBeastSaved.HerbalTeaMana_Value and MPHunterBeastSaved.HerbalTeaMana==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end


		-- 特定 种族天赋 --

		if MPHunterBeastSaved.RacialTraits==1 then

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

		-- 急速射击
		if MPHunterBeastSaved.RapidFire==1 and MPSpellReady("急速射击") then
			CastSpellByName("急速射击")
		end

	end




	-- 补buff

	if MPHunterBeastSaved.ViperGuardian==1 then
		local mana = UnitMana("player")
		if mana < MPHunterBeastSaved.Viper_Value then
			if not MPBuff("蝰蛇守护") then
				CastSpellByName("蝰蛇守护")
				return
			end
		elseif mana > (MPHunterBeastSaved.Viper_Value+1000) then
			if MPHunterBeastSaved.Hawk==1 and not MPBuff("雄鹰守护") then
				CastSpellByName("雄鹰守护")
				return
			end
		end
	else
		if MPHunterBeastSaved.Hawk==1 and not MPBuff("雄鹰守护") then
			CastSpellByName("雄鹰守护")
			return
		end
	end

	if MPHunterBeastSaved.Trueshot==1 and not MPBuff("强击光环") then
		CastSpellByName("强击光环")
	end

	if MPHunterBeastSaved.Mark==1 and not MPBuff("猎人印记","target") then
		CastSpellByName("猎人印记")
	end

	-- 杀戮命令
	if MPHunterBeastSaved.KillCommand==1 and MPHunterKillCommand==1 and KC and MPGetHunterGoreAllow() then
		CastSpellByName("杀戮命令")
		return
	end

	-- 被近身处理
	if MPGetTargetDistance("target",2.8) then

		if MPHunterBeastSaved.RaptorStrike==1 then
			CastSpellByName("猛禽一击")
		end

		if MPHunterBeastSaved.MeerkatsBiting==1 then
			CastSpellByName("猫鼬撕咬")
		end

	end

	-- 射击

	-- 瞄准射击 旗下条件
	if MPHunterBeastSaved.AimedShot==1 and MPHunterElement==1 then

		-- 瞄准射击->火焰弹药
		if MPHunterBeastSaved.MultiShot==1 then
			if MPBuff("爆炸弹药") and DCSJ then
				CastSpellByName("多重射击")
				return
			end
		end

		-- 瞄准射击->奥术弹药
		if MPHunterBeastSaved.ArcaneShot==1 then
			if MPBuff("魔力弹药") and ASSJ then
				CastSpellByName("奥术射击")
				return
			end
		end

		-- 瞄准射击->自然弹药
		if MPHunterBeastSaved.Serpent==1 then
			if MPBuff("剧毒弹药") and not MPGetSerpentStingDot() and MPIsPosion() then
				CastSpellByName("毒蛇钉刺")
				return
			end
		end

	else

		-- 未开启瞄准射击的情况

		-- 瞄准射击->火焰弹药
		if MPHunterBeastSaved.MultiShot==1 and DCSJ then
			CastSpellByName("多重射击")
			return
		end

		-- 瞄准射击->奥术弹药
		if MPHunterBeastSaved.ArcaneShot==1 and ASSJ then
			CastSpellByName("奥术射击")
			return
		end

		-- 瞄准射击->自然弹药
		if MPHunterBeastSaved.Serpent==1 and not MPGetSerpentStingDot() and MPIsPosion() then
			CastSpellByName("毒蛇钉刺")
			return
		end


	end

	-- 瞄准射击
	if MPHunterBeastSaved.AimedShot==1 and MZSJ and MPHunterAimedShot==1 then
		CastSpellByName("瞄准射击")
		return
	end


	-- 蝰蛇钉刺
	if MPHunterBeastSaved.Viper==1 then
		local TMP = 0
		if UnitExists("target") then
			TMP = UnitManaMax("target")
		end
		if KSDC and not MPGetViperStingDot() and TMP>200 then
			CastSpellByName("蝰蛇钉刺")
			return
		end
	end


	-- 稳固射击
	--if MPHunterBeastSaved.SteadyShot==1 then

		--MPHunterBeastSaved.SteadyShot_Value
		if MPGetHunterShotLeft()>1.1 then
			CastSpellByName("稳固射击")
			return
		end

		if MPBuff("急速射击") and MPGetHunterShotLeft()>0.8 then
			CastSpellByName("稳固射击")
			return
		end

	--end


end

