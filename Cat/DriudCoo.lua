if MPPlayerClass ~= "DRUID" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 鸟德一键宏
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
local AUTO_COO_Use_Trinket = 1				-- 饰品总开关，是否自动使用爆发饰品

local AUTO_COO_Trinket_Upper = 1			-- 是否开启上方饰品
local AUTO_COO_Trinket_Below = 1			-- 是否开启下方饰品

local AUTO_COO_HealthStone = 1				-- 是否自动使用治疗石
local AUTO_COO_HealthStone_Value = 0.3		-- 吃治疗石的血线(百分比，默认0.3 即30%)

local AUTO_COO_HerbalTea = 1				-- 是否自动使用草药茶
local AUTO_COO_HerbalTea_Value = 0.2		-- 吃草药茶的血线(百分比，默认0.2 即20%)

local AUTO_COO_Moonfire = 1					-- 是否自动补月火术
local AUTO_COO_InsectSwarm = 1				-- 是否自动补虫群
local AUTO_COO_FaerieFire = 0				-- 是否自动补精灵之火

local AUTO_COO_Target = 0					-- 自动优化目标选择，远程DPS无效

-- -------------------------------------

-- -------------------------------------
-- 全局变量，可以直接调用，不需要函数访问，以提高宏的性能
-- 以下参数请勿手动修改，插件会自动进行变化

-- 德鲁伊月火术的持续时间
MPDriudMoonfireDuration = 18
-- 德鲁伊虫群的持续时间
MPDriudInsectSwarmDuration = 18
-- 德鲁伊月火术的耗蓝
MPDriudMoonfireMana = 375
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


local function MPCastWrath()
	if DM>=MPDriudWrathMana then
		MPCastWithoutNampower("愤怒")
	else
		MPCastWithoutNampower("愤怒(等级 1)")
	end
end

local function MPCastStarfire()
	if DM>=MPDriudStarfireMana then
		MPCastWithoutNampower("星火术")
	else
		MPCastWithoutNampower("星火术(等级 1)")
	end
end

local function MPCastMoonfire()
	if MPDriudCOOSaved.MILevel==0 then

		if DM>2000 then
			CastSpellByName("月火术")
		elseif DM>1000 then
			CastSpellByName("月火术(等级 6)")
		else
			CastSpellByName("月火术(等级 2)")
			--print("月火术(等级 2)")
		end

	elseif MPDriudCOOSaved.MILevel==1 then
		CastSpellByName("月火术(等级 2)")
	elseif MPDriudCOOSaved.MILevel==2 then
		CastSpellByName("月火术(等级 6)")
	elseif MPDriudCOOSaved.MILevel==3 then
		CastSpellByName("月火术")
	end
end

local function MPCastInsectSwarm()
	if MPDriudCOOSaved.MILevel==0 then

		if DM>2000 then
			CastSpellByName("虫群")
		elseif DM>1000 then
			CastSpellByName("虫群(等级 3)")
		else
			CastSpellByName("虫群(等级 1)")
			--print("虫群(等级 1)")
		end

	elseif MPDriudCOOSaved.MILevel==1 then
		CastSpellByName("虫群(等级 1)")
	elseif MPDriudCOOSaved.MILevel==2 then
		CastSpellByName("虫群(等级 3)")
	elseif MPDriudCOOSaved.MILevel==3 then
		CastSpellByName("虫群")
	end

	--CastSpellByName("虫群")
end

function MPCoo()

	MHP = UnitHealth("player")
	DM = MPDriudMana()
	TargetBOSS = MPIsBossTarget()

	-- 确保在枭兽形态下
	if MPDriudCOOSaved.Shapeshift==1 and MPDriudCooShapeshiftID>0 then
		if not MPGetShape(MPDriudCooShapeshiftID) then
			CastShapeshiftForm(MPDriudCooShapeshiftID)
		end
	end

	--[[
	if MPDriudCOOSaved.Shapeshift==1 then
		if not MPBuff("枭兽形态") then
			CastSpellByName("枭兽形态")
			return
		end
	end
	]]

	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPDriudCOOSaved.Target, 2)

	-- 自动拾取
	if MPDriudCOOSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPDriudCOOSaved.Power==1 then
		MPCatPower()
	end

	if not UnitExists("target") then return end

	-- 在战斗中
	if MPInCombat then

		-- 自动开启饰品
		if MP_Trinket_Upper==1 and MPDriudCOOSaved.Trinket_Upper==1 and GetInventoryItemCooldown("player",13)==0 then
			if MPDriudCOOSaved.TUBoss==1 and TargetBOSS then
				UseInventoryItem(13)
			elseif MPDriudCOOSaved.TUBoss==0 then
				UseInventoryItem(13)
			end
		end
		if MP_Trinket_Below==1 and MPDriudCOOSaved.Trinket_Below==1 and GetInventoryItemCooldown("player",14)==0 then
			if MPDriudCOOSaved.TBBoss==1 and TargetBOSS then
				UseInventoryItem(14)
			elseif MPDriudCOOSaved.TBBoss==0 then
				UseInventoryItem(14)
			end
		end

		if MPDriudCOOSaved.Soulspeed==1 and TargetBOSS then
			MPUseItemByName("魂能之速")
		end

		-- 血量危险时处理，潜行下不吃药
		local percent = UnitHealth("player") / UnitHealthMax("player") * 100
		if percent<MPDriudCOOSaved.HealthStone_Value and MPDriudCOOSaved.HealthStone==1 then
			MPUseItemByName("特效治疗石")
		end
		if percent<MPDriudCOOSaved.HerbalTea_Value and MPDriudCOOSaved.HerbalTea==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end

		local percentMana = UnitMana("player") / UnitManaMax("player") * 100
		if percentMana<MPDriudCOOSaved.HerbalTeaMana_Value and MPDriudCOOSaved.HerbalTeaMana==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end

	end

	if not MPInCombat and MPDriudCOOSaved.FirstStarfire==1 then
		MPCastStarfire()
		return
	end



	-- 补 精灵之火
	if MPDriudCOOSaved.FaerieFireBOSS==1 then
		if not MPBuff("精灵之火（野性）","target") and not MPBuff("精灵之火","target") and MPDriudCOOSaved.FaerieFire==1 and TargetBOSS then
			CastSpellByName("精灵之火")
		end
	else
		if not MPBuff("精灵之火（野性）","target") and not MPBuff("精灵之火","target") and MPDriudCOOSaved.FaerieFire==1 then
			CastSpellByName("精灵之火")
		end
	end


	local dot = false
	if MPDriudCOOSaved.BOSS==0 then
		dot = true
	else
		if TargetBOSS then
			dot = true
		end
	end

	if dot then

		if MPDriudCOOSaved.MoonfireInsectSwarm== 1 then
			-- 补 月火术
			if MPDriudCOOSaved.Moonfire==1 and not MPGetMoonfireDot() then
				MPCastMoonfire() -- 月火术
				return
			end
			-- 补 虫群
			if MPDriudCOOSaved.InsectSwarm==1 and not MPGetInsectSwarmDot() then
				MPCastInsectSwarm() -- 虫群
				return
			end
		else
			-- 补 虫群
			if MPDriudCOOSaved.InsectSwarm==1 and not MPGetInsectSwarmDot() then
				MPCastInsectSwarm() -- 虫群
				return
			end

			-- 补 月火术
			if MPDriudCOOSaved.Moonfire==1 and not MPGetMoonfireDot() then
				MPCastMoonfire() -- 月火术
				return
			end
		end

	end


	-- 日月蚀触发，优先

	if MPGetSolar()>0 then --MPBuff("日蚀") then
		MPCastWrath() -- 愤怒
		return
	end

	local lefttime = 3.0
	if MPBuff("自然之赐") then lefttime=lefttime-0.5 end
	--if MPBuff("万物平衡") then lefttime=lefttime-0.5 end

	if MPGetLunar()>lefttime then --MPBuff("月蚀") then
		MPCastStarfire() -- 星火术
		return
	end

	-- 用愤怒填补空档
	MPCastWrath() -- 愤怒

end


