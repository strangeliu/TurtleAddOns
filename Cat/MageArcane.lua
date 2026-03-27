if MPPlayerClass ~= "MAGE" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 奥法一键宏
-- 更新日期：2026-01-06（后面根据时间来判断版本）
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


-- -------------------------------------

-- -------------------------------------
-- 全局变量，可以直接调用，不需要函数访问，以提高宏的性能
-- 以下参数请勿手动修改，插件会自动进行变化


-- 奥术溃裂
MPMageArcaneExplosion = 0

-- 魔甲术 蓝量
MPMageArmorMana = 490

-- 奥术溃裂 蓝量
MPMageArcaneExplosionMana = 390

-- 奥术涌动 蓝量
MPMageArcaneSurgeMana = 170

-- 奥术飞弹 蓝量
MPMageArcaneMissilesnMana = 655


-- -------------------------------------

local MHP,DM,ASKL,ASYD,HYCJ


local function MageArmor()
	local m =  (UnitMana("player") - MPMageArmorMana) / UnitManaMax("player") * 100
	if MPMageArcaneSaved.ArcanePowerSafe==1 then
		if MPBuff("奥术强化") then
			if m > MPMageArcaneSaved.ArcanePowerSafe_Value+2 then
				CastSpellByName("魔甲术")
			else
				DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."奥术强化 蓝量保护。|r")
			end
		else
			CastSpellByName("魔甲术")
		end
	else
		CastSpellByName("魔甲术")
	end
end



local function ArcaneExplosion()
	local m =  (UnitMana("player") - MPMageArcaneExplosionMana) / UnitManaMax("player") * 100
	if MPMageArcaneSaved.ArcanePowerSafe==1 then
		if MPBuff("奥术强化") then
			if m > MPMageArcaneSaved.ArcanePowerSafe_Value+2 then
				MPCast("奥术溃裂")
			else
				DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."奥术强化 蓝量保护。|r")
			end
		else
			MPCast("奥术溃裂")
		end
	else
		MPCast("奥术溃裂")
	end
end

local function ArcaneMissiles()
	local m =  (UnitMana("player") - MPMageArcaneMissilesnMana) / UnitManaMax("player") * 100
	if MPMageArcaneSaved.ArcanePowerSafe==1 then
		if MPBuff("奥术强化") then
			if m > MPMageArcaneSaved.ArcanePowerSafe_Value+4 then
				MPCastSpell("奥术飞弹")
			else
				DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."奥术强化 蓝量保护。|r")
			end
		else
			MPCastSpell("奥术飞弹")
		end
	else
		MPCastSpell("奥术飞弹")
	end
end

local function ArcaneSurge()

	local m =  (UnitMana("player") - MPMageArcaneSurgeMana) / UnitManaMax("player") * 100
	if MPMageArcaneSaved.ArcanePowerSafe==1 then
		if MPBuff("奥术强化") then
			if m < MPMageArcaneSaved.ArcanePowerSafe_Value+2 then
				DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."奥术强化 蓝量保护。|r")
				return
			end
		end
	end

	MPCast("奥术涌动")
	return true
end


function MPMageArcaneAuto()

	MHP = UnitHealth("player")
	DM = UnitMana("player")
	local percent = UnitHealth("player") / UnitHealthMax("player") * 100
	local percentMana = UnitMana("player") / UnitManaMax("player") * 100

	ASKL = MPSpellReadyOffset("奥术溃裂")
	ASYD = MPSpellReady("奥术涌动")
	HYCJ = MPSpellReady("火焰冲击")

	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPMageArcaneSaved.Target, 0)

	-- 自动拾取
	if MPMageArcaneSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPMageArcaneSaved.Power==1 then
		MPCatPower()
	end


	--if not UnitExists("target") then return end

	-- 在战斗中
	if MPInCombat and GetMageArcaneMissiles()<=0.2 then

		-- 自动开启饰品
		if GetInventoryItemCooldown("player",13)==0 and MP_Trinket_Upper==1 and MPMageArcaneSaved.Trinket_Upper==1 then
			if MPMageArcaneSaved.TUBoss==1 and MPIsBossTarget() then
				UseInventoryItem(13)
			elseif MPMageArcaneSaved.TUBoss==0 then
				UseInventoryItem(13)
			end
		end
		if GetInventoryItemCooldown("player",14)==0 and MP_Trinket_Below==1 and MPMageArcaneSaved.Trinket_Below==1 then
			if MPMageArcaneSaved.TBBoss==1 and MPIsBossTarget() then
				UseInventoryItem(14)
			elseif MPMageArcaneSaved.TBBoss==0 then
				UseInventoryItem(14)
			end
		end

		if MPMageArcaneSaved.Soulspeed==1 and MPIsBossTarget() then
			MPUseItemByName("魂能之速")
		end

		-- 血量危险时处理，潜行下不吃药
		if percent<MPMageArcaneSaved.HealthStone_Value and MPMageArcaneSaved.HealthStone==1 then
			MPUseItemByName("特效治疗石")
		end
		if percent<MPMageArcaneSaved.HerbalTea_Value and MPMageArcaneSaved.HerbalTea==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end

		if percentMana<MPMageArcaneSaved.HerbalTeaMana_Value and MPMageArcaneSaved.HerbalTeaMana==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end

		if percentMana<MPMageArcaneSaved.JewelMana_Value and MPMageArcaneSaved.JewelMana==1 then
			MPUseItemByName("法力红宝石")
			MPUseItemByName("法力黄水晶")
			MPUseItemByName("法力翡翠")
			MPUseItemByName("法力玛瑙")
		end


		-- 特定 种族天赋 --

		if MPMageArcaneSaved.RacialTraits==1 and GetMageArcaneMissiles()<=0 then

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






	if MPMageArcaneSaved.MageArmor==1 and not MPBuff("魔甲术") then
		MageArmor()
	end

	-- 奥术涌动
	if MPMageArcaneSaved.ArcaneSurge==1 and MPGetMageArcaneSurge() and ASYD and GetMageArcaneMissiles()<=0.5 then

		-- 奥术强化时的处理
		if MPMageArcaneSaved.ArcanePowerNoSurge==1 and MPBuff("奥术强化") then

			-- 不打

		elseif MPMageArcaneSaved.ArcaneExplosionNoSurge==1 and MPBuff("奥术溃裂") then

			-- 不打

		-- 正常下处理
		else
			ArcaneSurge()
			return
		end

	end

	-- 火焰冲击
	-- 奥法增加在没有奥术溃裂CD的时候才允许火冲
	if GetMageArcaneMissiles()<=0 then
		if MP_UnitXP and UnitExists("target") then
			local inRange = UnitXP("distanceBetween", "player", "target")
			if MPMageArcaneSaved.FireBlast==1 and HYCJ and not MPBuff("奥术溃裂") and inRange<MPMageFireBlastDist then
				CastSpellByName("火焰冲击")
				return
			end
		else
			if MPMageArcaneSaved.FireBlast==1 and HYCJ and not MPBuff("奥术溃裂") then
				CastSpellByName("火焰冲击")
			end
		end
	end

	-- 奥术溃裂
	if MPMageArcaneSaved.ArcaneExplosion==1 and ASKL and MPMageArcaneExplosion==1 and not MPBuff("奥术溃裂") then
		if MPMageArcaneSaved.IntExplosion==1 then
			-- 时间融合
			-- 补溃裂
			ArcaneExplosion()
			return
		else
			if MP_Nampower then
				if GetMageArcaneMissiles()<=0.5 then
					MPCastSpell("奥术溃裂")
					return
				end
			else
				if GetMageArcaneMissiles()<=0 then
					ArcaneExplosion()
					return
				end
			end
		end
	end

	--[[
	if MPMageArcaneSaved.ArcaneExplosion==1 and MPMageArcaneExplosion==1 and MPMageArcaneSaved.IntExplosion==1 and ASKL and GetMageArcaneMissiles()>0 and not MPBuff("奥术溃裂") then
		ArcaneExplosion()
		return
	end
	]]

	-- 奥术飞弹
	if MP_Nampower then
		if GetMageArcaneMissiles()<=0.5 then
			ArcaneMissiles()
		end
	else
		if GetMageArcaneMissiles()<=0 then
			ArcaneMissiles()
		end
	end

end

