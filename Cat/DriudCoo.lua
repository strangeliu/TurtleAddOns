if MPPlayerClass ~= "DRUID" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 鸟德一键宏
-- 更新日期：2026-04-16 （后面根据时间来判断版本）
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
local AUTO_COO_Use_Trinket = 1				-- 饰品总开关，是否自动使用爆发饰品

-- -------------------------------------

-- -------------------------------------
-- 全局变量，可以直接调用，不需要函数访问，以提高宏的性能
-- 以下参数请勿手动修改，插件会自动进行变化

-- 德鲁伊月火术的持续时间
MPDriudMoonfireDuration = 18
MPDriudMoonfireRange = 30
-- 德鲁伊月火术的耗蓝
MPDriudMoonfireMana = 375

-- 德鲁伊虫群的持续时间
MPDriudInsectSwarmDuration = 18
MPDriudInsectSwarmRange = 30
-- 德鲁伊虫群的耗蓝
MPDriudInsectSwarmMana = 160

-- 德鲁伊愤怒的耗蓝
MPDriudWrathMana = 210
-- 德鲁伊星火术的耗蓝
MPDriudStarfireMana = 340

-- 德鲁伊 触发自然恩赐后 愤怒的耗蓝
MPDriudPowerGiftWrathMana = 44

-- 枭兽姿态的姿态ID
MPDriudCooShapeshiftID = 0

-- 日蚀
MPSolarTimer = 0

-- 月蚀
MPLunarTimer = 0

-- -------------------------------------

local MHP,DM
local TargetBOSS = false

-- 默认配置
MPDriudCooConfig = 1


local function MPCastMoonfire()
	if MPDriudCOOSaved[MPDriudCooConfig].MILevel==0 then

		if DM>2000 then
			CastSpellByName("月火术")
		elseif DM>1000 then
			CastSpellByName("月火术(等级 6)")
		else
			CastSpellByName("月火术(等级 2)")
			--print("月火术(等级 2)")
		end

	elseif MPDriudCOOSaved[MPDriudCooConfig].MILevel==1 then
		CastSpellByName("月火术(等级 2)")
	elseif MPDriudCOOSaved[MPDriudCooConfig].MILevel==2 then
		CastSpellByName("月火术(等级 6)")
	elseif MPDriudCOOSaved[MPDriudCooConfig].MILevel==3 then
		CastSpellByName("月火术")
	end
end

local function MPCastInsectSwarm()
	if MPDriudCOOSaved[MPDriudCooConfig].MILevel==0 then

		if DM>2000 then
			CastSpellByName("虫群")
		elseif DM>1000 then
			CastSpellByName("虫群(等级 3)")
		else
			CastSpellByName("虫群(等级 1)")
			--print("虫群(等级 1)")
		end

	elseif MPDriudCOOSaved[MPDriudCooConfig].MILevel==1 then
		CastSpellByName("虫群(等级 1)")
	elseif MPDriudCOOSaved[MPDriudCooConfig].MILevel==2 then
		CastSpellByName("虫群(等级 3)")
	elseif MPDriudCOOSaved[MPDriudCooConfig].MILevel==3 then
		CastSpellByName("虫群")
	end

	--CastSpellByName("虫群")
end


local function MPCastWrath()

	-- 补 虫群
	if MPDriudCOOSaved[MPDriudCooConfig].InsectSwarm==1 and not MPGetInsectSwarmDot() then
		if MPDriudCOOSaved[MPDriudCooConfig].InsectSwarmBoss==0 or (MPDriudCOOSaved[MPDriudCooConfig].InsectSwarmBoss==1 and TargetBOSS) then
			MPCastInsectSwarm() -- 虫群
			return
		end
	end

	if DM>=MPDriudWrathMana then
		MPCastWithoutNampower("愤怒")
	else
		MPCastWithoutNampower("愤怒(等级 1)")
	end
end

local function MPCastStarfire()

	-- 补 月火术
	if MPDriudCOOSaved[MPDriudCooConfig].Moonfire==1 and not MPGetMoonfireDot() then
		if MPDriudCOOSaved[MPDriudCooConfig].MoonfireBoss==0 or (MPDriudCOOSaved[MPDriudCooConfig].MoonfireBoss==1 and TargetBOSS) then
			MPCastMoonfire() -- 月火术
			return
		end
	end

	if DM>=MPDriudStarfireMana then
		MPCastWithoutNampower("星火术")
	else
		MPCastWithoutNampower("星火术(等级 1)")
	end
end


function MPCoo()

	MHP = UnitHealth("player")
	DM = MPDriudMana()
	TargetBOSS = MPIsBossTarget()

	-- 确保在枭兽形态下
	if MPDriudCOOSaved[MPDriudCooConfig].Shapeshift==1 and MPDriudCooShapeshiftID>0 then
		if not MPGetShape(MPDriudCooShapeshiftID) then
			CastShapeshiftForm(MPDriudCooShapeshiftID)
		end
	end

	--[[
	if MPDriudCOOSaved[MPDriudCooConfig].Shapeshift==1 then
		if not MPBuff("枭兽形态") then
			CastSpellByName("枭兽形态")
			return
		end
	end
	]]

	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPDriudCOOSaved[MPDriudCooConfig].Target, 2)

	-- 自动拾取
	if MPDriudCOOSaved[MPDriudCooConfig].Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPDriudCOOSaved[MPDriudCooConfig].Power==1 then
		MPCatPower()
	end

	if not UnitExists("target") then return end

	-- 在战斗中
	if MPInCombat then

		-- 自动开启饰品
		if MP_Trinket_Upper==1 and MPDriudCOOSaved[MPDriudCooConfig].Trinket_Upper==1 and GetInventoryItemCooldown("player",13)==0 then
			if MPDriudCOOSaved[MPDriudCooConfig].TUBoss==1 and TargetBOSS then
				UseInventoryItem(13)
			elseif MPDriudCOOSaved[MPDriudCooConfig].TUBoss==0 then
				UseInventoryItem(13)
			end
		end
		if MP_Trinket_Below==1 and MPDriudCOOSaved[MPDriudCooConfig].Trinket_Below==1 and GetInventoryItemCooldown("player",14)==0 then
			if MPDriudCOOSaved[MPDriudCooConfig].TBBoss==1 and TargetBOSS then
				UseInventoryItem(14)
			elseif MPDriudCOOSaved[MPDriudCooConfig].TBBoss==0 then
				UseInventoryItem(14)
			end
		end

		if MPDriudCOOSaved[MPDriudCooConfig].Soulspeed==1 then
			if MPDriudCOOSaved[MPDriudCooConfig].SoulspeedBoss==1 and TargetBOSS then
				MPUseItemByName("魂能之速")
			elseif MPDriudCOOSaved[MPDriudCooConfig].SoulspeedBoss==0 then
				MPUseItemByName("魂能之速")
			end
		end

		-- 血量危险时处理，潜行下不吃药
		local percent = UnitHealth("player") / UnitHealthMax("player") * 100
		if percent<MPDriudCOOSaved[MPDriudCooConfig].HealthStone_Value and MPDriudCOOSaved[MPDriudCooConfig].HealthStone==1 then
			MPUseItemByName("特效治疗石")
		end
		if percent<MPDriudCOOSaved[MPDriudCooConfig].HerbalTea_Value and MPDriudCOOSaved[MPDriudCooConfig].HerbalTea==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end

		local percentMana = UnitMana("player") / UnitManaMax("player") * 100
		if percentMana<MPDriudCOOSaved[MPDriudCooConfig].HerbalTeaMana_Value and MPDriudCOOSaved[MPDriudCooConfig].HerbalTeaMana==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end

	end

	if not MPInCombat and MPDriudCOOSaved[MPDriudCooConfig].FirstStarfire==1 then
		MPCastStarfire()
		return
	end



	-- 补 精灵之火
	if MPDriudCOOSaved[MPDriudCooConfig].FaerieFireB==1 and not MPBuff("精灵之火（野性）","target") and not MPBuff("精灵之火","target") then
		if MPDriudCOOSaved[MPDriudCooConfig].FaerieFireBOSS==0 or (MPDriudCOOSaved[MPDriudCooConfig].FaerieFireBOSS==1 and TargetBOSS) then
			CastSpellByName("精灵之火")
		end
	end


	if MPDriudCOOSaved[MPDriudCooConfig].Strategy==1 then

		-- 日月蚀触发，优先

		if MPBuff("月蚀") then

			MPCastStarfire() -- 星火术

		elseif MPBuff("日蚀") then

			MPCastWrath() -- 愤怒

		elseif MPBuff("昼至") then

			MPCastStarfire() -- 星火术

		elseif MPBuff("夜至") then

			MPCastWrath() -- 愤怒

		else

			MPCastWrath() -- 愤怒

		end

	else
	
		-- 愤怒偏向

		if MPBuff("月蚀") then

			MPCastStarfire() -- 星火术

		else

			MPCastWrath() -- 愤怒

		end

	end


end


