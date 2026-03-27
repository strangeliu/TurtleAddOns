if MPPlayerClass ~= "PALADIN" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 奶骑一键宏
-- 更新日期：2026-01-26 （后面根据时间来判断版本）
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
--
-- 可选条件：SuperWoW
--
-- 说明：
-- 
-- -------------------------------------

-- 圣光闪现
MPPaladinFlashLight = {}
MPPaladinFlashLightEffect = {}
MPPaladinFlashLightFactor = 0.7
MPPaladinFlashLightMaxLevel = 7

-- 圣光术
MPPaladinHolyLight = {}
MPPaladinHolyLightEffect = {}
MPPaladinHolyLightFactor = 1.4
MPPaladinHolyLightMaxLevel = 9


MPPaladinCastHeal = -5
MPPaladinCastHealTarget = nil
local MPHealTargetDelay = {}
local MPHealthUnit = nil

function MPPaladinAutoHealth()

    -- 正在读条
    if GetTime()-MPPaladinCastHeal < 3 then

        -- 是否有治疗目标
        if MPHealthUnit and MPPaladinHealSaved.Overflow==1 then
            -- 被治疗目标状态
            local target_percent = UnitHealth(MPHealthUnit) / UnitHealthMax(MPHealthUnit) * 100
            if target_percent > MPPaladinHealSaved.Begin_Value then
                SpellStopCasting()
            end
        end

        return
    end

	-- 自动拾取
	if MPPaladinHealSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPPaladinHealSaved.Power==1 then
		MPCatPower()
	end


	-- 在战斗中
	if MPInCombat then
	    -- 血量危险时处理，潜行下不吃药
	    local percent = UnitHealth("player") / UnitHealthMax("player") * 100
	    if percent<MPPaladinHealSaved.HealthStone_Value and MPPaladinHealSaved.HealthStone==1 then
		    MPUseItemByName("特效治疗石")
	    end
	    if percent<MPPaladinHealSaved.HerbalTea_Value and MPPaladinHealSaved.HerbalTea==1 then
		    MPUseItemByName("糖水茶")
		    MPUseItemByName("诺达纳尔草药茶")
	    end

		local percentMana = UnitMana("player") / UnitManaMax("player") * 100
		if percentMana<MPPaladinHealSaved.HerbalTeaMana_Value and MPPaladinHealSaved.HerbalTeaMana==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end

		if percent<MPPaladinHealSaved.Protection_Value and MPPaladinHealSaved.Protection==1 then
			MPCastSpellWithoutTarget("保护之手","player")
		end
		if percent<MPPaladinHealSaved.DivineShield_Value and MPPaladinHealSaved.DivineShield==1 then
			CastSpellByName("圣盾术")
		end

    end

	local GCD = MPGetGCD()

    if GCD<1.3 then
        return
    end

    -- 目标
    if UnitExists("target") and MPPaladinHealSaved.TargetFirst==1 then
        if MPPaladinHealth("target") then
            return
        end
    end

    -- 目标
    if UnitExists("target") and UnitExists("targettarget") and MPPaladinHealSaved.TargetTarget==1 then
        if MPPaladinHealth("targettarget") then
            return
        end
    end

    -- 自己
    if MPPaladinHealSaved.SelfFirst==1 then
        if MPPaladinHealth("player") then
            return
        end
    end

    -- 队伍里的其他人
    if MPPaladinHealSaved.ScanTeam==1 then

        if MPPaladinHealSaved.ScanTeam_Low==1 then

            local sortedMembers = MPGetSortedGroupByHealth()
            for i, member in ipairs(sortedMembers) do
                if MPPaladinHealth(member.unit) then
                    return
                end
            end

        else
            local sortedMembers = MPShuffleTable( MPGetSortedGroupByHealth() )
            for i, member in ipairs(sortedMembers) do
                if MPPaladinHealth(member.unit) then
                    return
                end
            end
        end

    end

end


function MPPaladinHealth(unit)

    if not unit then
        return false
    end


	local DM = UnitMana("player")
    local health = UnitHealth(unit)
    local maxHealth = UnitHealthMax(unit)
    local percentHealth = 0
    local HealthDec = 0
    SLS = MPSpellReady("圣疗术")
    SSZJ = MPSpellReady("神圣震击")

    if UnitIsDeadOrGhost(unit) then
        return false
    end

    if health==0 or maxHealth == 0 then
        -- 离线忽略 死亡忽略
        return false
    end

       -- 敌人
    if UnitCanAttack("player", unit) then
        return false
    end

    -- 计算目标生命值比例
    percentHealth = health/maxHealth*100
    HealthDec = maxHealth - health

    if MPPaladinHealSaved.Begin_Value <= percentHealth then
        return false
    end

    -- 视野
    if MP_UnitXP then
        if unit ~= "player" then
            local inRange = UnitXP("distanceBetween", "player", unit)
            if inRange and inRange>40 then
                MPMsg("|cFFee1111["..UnitName(unit).."] 不在有效距离|r")
                return false
            else
                local inS = UnitXP("inSight", "player", unit)
                if not inS then
                    MPMsg("|cFFee1111["..UnitName(unit).."] 不在视野中|r")
                    return false
                end
            end
        end
    end

    -- 用于防止同一目标多次治疗
    --if MPDriudCastHealTarget == unit then
        local targetName = UnitName(unit)
        MPPaladinCastHealTarget = nil
    --end

    if MPHealTargetDelay[targetName] and GetTime()-MPHealTargetDelay[targetName] < 1.2 then
        --print("return "..targetName)
        return false
    else
        --print(targetName)
        --MPHealTargetDelay[targetName] = GetTime()
    end


    --MPPaladinCastHealTarget = unit


    -- 治疗 --


    if percentHealth < MPPaladinHealSaved.LayHands_Value and MPPaladinHealSaved.LayHands==1 and SLS then
        MPHealTargetDelay[targetName] = GetTime()
        return MPCastSpellWithoutTarget("圣疗术", unit, 1)
    end

    if percentHealth < MPPaladinHealSaved.HolyShock_Value and MPPaladinHealSaved.HolyShock==1 and SSZJ then
        if MP_UnitXP then
            if UnitXP("distanceBetween", "player", unit)<=20 then
                MPHealTargetDelay[targetName] = GetTime()
                if MPCastSpellWithoutTarget("神圣震击", unit, 1) then
                    return
                end
            else
                MPMsg("施放：神圣震击-> ["..UnitName(unit).."] 超出距离！")
            end
        else
            MPHealTargetDelay[targetName] = GetTime()
            if MPCastSpellWithoutTarget("神圣震击", unit, 1) then
                return
            end
        end
    end


    MPHealthUnit = unit

    if percentHealth < MPPaladinHealSaved.HolyLight_Value and MPPaladinHealSaved.HolyLight==1 and MPPaladinHolyLightMaxLevel>0 then

        MPHealTargetDelay[targetName] = GetTime()

        -- 根据配置等级和所学等级计算
        local HolyLightMaxLevel = MPPaladinHolyLightMaxLevel
        local HolyLightMinLevel = MPPaladinHealSaved.HolyLightMinLevel
        if MPPaladinHealSaved.HolyLightMaxLevel < MPPaladinHolyLightMaxLevel then
            HolyLightMaxLevel = MPPaladinHealSaved.HolyLightMaxLevel
        end

        for i = HolyLightMaxLevel, HolyLightMinLevel, -1 do
            if MPPaladinHolyLightEffect[i] < HealthDec then

                if DM >= MPPaladinHolyLight[i] then
                    return MPCastSpellWithoutTarget("圣光术(等级 "..i..")", unit, 1)
                else
                    return MPCastSpellWithoutTarget("圣光术(等级 1)", unit, 1)
                end

            end
        end

        return MPCastSpellWithoutTarget("圣光术(等级 "..MPPaladinHealSaved.HolyLightMinLevel..")", unit, 1)
    end



    if MPPaladinHealSaved.FlashLight==1 and MPPaladinFlashLightMaxLevel>0 then

        MPHealTargetDelay[targetName] = GetTime()

        -- 根据配置等级和所学等级计算
        local FlashLightMaxLevel = MPPaladinFlashLightMaxLevel
        local FlashLightMinLevel = MPPaladinHealSaved.FlashLightMinLevel
        if MPPaladinHealSaved.FlashLightMaxLevel < MPPaladinFlashLightMaxLevel then
            FlashLightMaxLevel = MPPaladinHealSaved.FlashLightMaxLevel
        end

        for i = FlashLightMaxLevel, FlashLightMinLevel, -1 do
            if MPPaladinFlashLightEffect[i] < HealthDec then

                if DM >= MPPaladinFlashLight[i] then
                    return MPCastSpellWithoutTarget("圣光闪现(等级 "..i..")", unit, 1)
                else
                    return MPCastSpellWithoutTarget("圣光闪现(等级 1)", unit, 1)
                end

            end
        end

        return MPCastSpellWithoutTarget("圣光闪现(等级 "..MPPaladinHealSaved.FlashLightMinLevel..")", unit, 1)
    end


    return false
end




-- 洗牌
function MPShuffleTable(t)
    if not t or type(t) ~= "table" then
        return {}
    end
    
    local result = {}
    local n = table.getn(t)
    
    for i = 1, n do
        result[i] = t[i]
    end
    
    for i = n, 2, -1 do
        local j = math.random(1, i)
        result[i], result[j] = result[j], result[i]
    end
    
    return result
end


-- 获取团队成员并按血量降序排序
function MPGetSortedGroupByHealth()
    local members = MPGetGroupHealthList()
    return MPSortByHealthPercentAsc(members)
end

function MPSortByHealthPercentAsc(members)
    table.sort(members, function(a, b)
        local aPercent = a.health / a.maxHealth
        local bPercent = b.health / b.maxHealth
        return aPercent < bPercent
    end)
    return members
end


function MPGetGroupHealthList()
    local groupMembers = {}
    
    -- 先检查是否在团队（经典旧世团队和队伍互斥）
    local numRaidMembers = GetNumRaidMembers()
    if numRaidMembers > 0 then
        -- 处理团队（最多40人）
        for i = 1, numRaidMembers do
            local unit = "raid" .. i
            if UnitExists(unit) and UnitIsVisible(unit) then
                table.insert(groupMembers, {
                    name = UnitName(unit),
                    health = UnitHealth(unit),
                    maxHealth = UnitHealthMax(unit),
                    unit = unit,
                    isPlayer = UnitIsUnit(unit, "player")
                })
            end
        end
    else
        -- 不在团队，检查是否在队伍
        local numPartyMembers = GetNumPartyMembers()
        
        -- 先添加玩家自己
        table.insert(groupMembers, {
            name = UnitName("player"),
            health = UnitHealth("player"),
            maxHealth = UnitHealthMax("player"),
            unit = "player",
            isPlayer = true
        })
        
        -- 添加队友（如果有）
        if numPartyMembers > 0 then
            for i = 1, numPartyMembers do
                local unit = "party" .. i
                if UnitExists(unit) and UnitIsVisible(unit) then
                    table.insert(groupMembers, {
                        name = UnitName(unit),
                        health = UnitHealth(unit),
                        maxHealth = UnitHealthMax(unit),
                        unit = unit,
                        isPlayer = false
                    })
                end
            end
        end
    end
    
    return groupMembers
end



