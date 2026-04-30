if MPPlayerClass ~= "DRUID" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 奶德一键宏
-- 更新日期：2026-04-10 （后面根据时间来判断版本）
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
--
-- 可选条件：SuperWoW
--
-- 说明：
-- 
-- -------------------------------------
-- 功能配置：
-- 注：修改以下配置，需要在游戏中/reload，或者小退让配置生效
-- 
-- 主开关

-- 以下功能开关：1开启 0关闭

local AUTO_DH_Shapeshift = 0                -- 是否自动进入树形态
local AUTO_DH_Swiftmend = 1				    -- 是否自动使用迅捷治愈

local AUTO_DH_HealthStone = 1				-- 是否自动使用治疗石
local AUTO_DH_HealthStone_Value = 0.3		-- 吃治疗石的血线(百分比，默认0.3 即30%)

local AUTO_DH_HerbalTea = 1			    	-- 是否自动使用草药茶
local AUTO_DH_HerbalTea_Value = 0.2		    -- 吃草药茶的血线(百分比，默认0.2 即20%)


-- -------------------------------------
-- 全局变量，可以直接调用，不需要函数访问，以提高宏的性能
-- 以下参数请勿手动修改，插件会自动进行变化

-- 树姿态的姿态ID
MPDriudTreeShapeshiftID = 0

-- 愈合技能的1、3、6、9等级耗蓝
MPDriudRegrowth1 = 96
MPDriudRegrowth3 = 224
MPDriudRegrowth6 = 408
MPDriudRegrowth9 = 704

MPDriudRegrowth = {}
MPDriudRegrowthEffect = {}
MPDriudRegrowthFactor = 0.4
MPDriudRegrowthMaxLevel = 9

-- 回春术的1、7、11等级耗蓝
MPDriudRejuvenation1 = 25
MPDriudRejuvenation7 = 195
MPDriudRejuvenation11 = 360

MPDriudRejuvenation = {}
MPDriudRejuvenationEffect = {}
MPDriudRejuvenationFactor = 0.8
MPDriudRejuvenationMaxLevel = 11

-- 治疗之触
MPDriudHealingTouch = {}
MPDriudHealingTouchEffect = {}
MPDriudHealingTouchFactor = 0.2
MPDriudHealingTouchMaxLevel = 11

-- 是否点出迅捷治愈天赋
MPDriudSwiftmend = 0

-- 是否点出生命之树形态
MPDriudTreeForm = 0

-- 治疗量
MPDriudTotalHealing = 0

-- -------------------------------------

MPDriudCastHeal = -5
MPDriudCastHealTarget = nil
local MPHealTargetDelay = {}
local MPHealthUnit = nil

-- 默认配置
MPDriudHealConfig = 1


function MPDriudAutoHealth()

    -- 愈合正在读条
    if GetTime()-MPDriudCastHeal<3 then

        -- 是否有治疗目标
        if MPHealthUnit and MPDriudHealSaved[MPDriudHealConfig].Overflow==1 then
            -- 被治疗目标状态
            local target_percent = UnitHealth(MPHealthUnit) / UnitHealthMax(MPHealthUnit) * 100
            if target_percent > MPDriudHealSaved[MPDriudHealConfig].Begin_Value then
                SpellStopCasting()
            end
        end

        return
    end

	-- 自动拾取
	if MPDriudHealSaved[MPDriudHealConfig].Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPDriudHealSaved[MPDriudHealConfig].Power==1 then
		MPCatPower()
	end

    -- 是否需要在树形态下
    --[[
	if MPDriudHealSaved[MPDriudHealConfig].Shapeshift==1 and MPDriudTreeForm==1 and not MPGetShape(MPDriudTreeShapeshiftID) then
		CastShapeshiftForm(MPDriudTreeShapeshiftID)
	end
    ]]
	if MPDriudHealSaved[MPDriudHealConfig].Shapeshift==1 and MPDriudTreeForm==1 then
		if not MPBuff("生命之树形态") then
			CastSpellByName("生命之树形态")
		end
	end

	-- 在战斗中
	if MPInCombat then
	    -- 血量危险时处理，潜行下不吃药
	    local percent = UnitHealth("player") / UnitHealthMax("player") * 100
	    if percent<MPDriudHealSaved[MPDriudHealConfig].HealthStone_Value and MPDriudHealSaved[MPDriudHealConfig].HealthStone==1 then
		    MPUseItemByName("特效治疗石")
	    end
	    if percent<MPDriudHealSaved[MPDriudHealConfig].HerbalTea_Value and MPDriudHealSaved[MPDriudHealConfig].HerbalTea==1 then
		    MPUseItemByName("糖水茶")
		    MPUseItemByName("诺达纳尔草药茶")
	    end
		local percentMana = UnitMana("player") / UnitManaMax("player") * 100
		if percentMana<MPDriudHealSaved[MPDriudHealConfig].HerbalTeaMana_Value and MPDriudHealSaved[MPDriudHealConfig].HerbalTeaMana==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end
    end

	local GCD = MPGetGCD()

    if GCD<1.3 then
        return
    end

    -- 目标
    if UnitExists("target") and MPDriudHealSaved[MPDriudHealConfig].TargetFirst==1 then
        if MPDriudHealth("target") then
            return
        end
    end

    -- 目标 的 目标
    if UnitExists("target") and UnitExists("targettarget") and MPDriudHealSaved[MPDriudHealConfig].TargetTarget==1 then
        if MPDriudHealth("targettarget") then
            return
        end
    end

    -- 自己
    if MPDriudHealSaved[MPDriudHealConfig].SelfFirst==1 then
        if MPDriudHealth("player") then
            return
        end
    end

    -- 队伍里的其他人
    if MPDriudHealSaved[MPDriudHealConfig].ScanTeam==1 then

        if MPDriudHealSaved[MPDriudHealConfig].ScanTeam_Low==1 then
            local sortedMembers = MPGetSortedGroupByHealth()
            for i, member in ipairs(sortedMembers) do
                if MPDriudHealth(member.unit) then
                    return
                end
            end
        else
            local sortedMembers = MPShuffleTable( MPGetSortedGroupByHealth() )
            
            for i, member in ipairs(sortedMembers) do
                if MPDriudHealth(member.unit) then
                    return
                end
            end
        end

    end
end



function MPDriudHealth(unit)

    if not unit then
        return false
    end

	local DM = MPDriudMana()
    local percentHealth = 0.0
    local HealthDec = 0
    local XJZY=MPSpellReady("迅捷治愈")

    if UnitIsDeadOrGhost(unit) then
        return false
    end

    local health = UnitHealth(unit)
    local maxHealth = UnitHealthMax(unit)

    if health==0 or maxHealth == 0 then
        -- 离线忽略 死亡忽略
        return false
    end

    -- 敌人
    if UnitCanAttack("player", unit) then
        return false
    end



    percentHealth = health/maxHealth * 100
    HealthDec = maxHealth - health
    --print(string.format("[查询] %s: %d/%d (%f%%)", name, health, maxHealth, percentHealth))

    if MPDriudHealSaved[MPDriudHealConfig].Begin_Value <= percentHealth then
--        print(percentHealth)
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
        MPDriudCastHealTarget = nil
    --end

    if MPHealTargetDelay[targetName] and GetTime()-MPHealTargetDelay[targetName] < 1.2 then
        --print("return "..targetName)
        return false
    else
        --print(targetName)
        --MPHealTargetDelay[targetName] = GetTime()
    end

    --MPDriudCastHealTarget = unit
    -- 危机抢救
    if percentHealth < MPDriudHealSaved[MPDriudHealConfig].Swiftmend_Value and (MPBuff("愈合",unit) or MPBuff("回春术",unit)) and XJZY and MPDriudSwiftmend==1 and MPDriudHealSaved[MPDriudHealConfig].Swiftmend==1 then
        MPHealTargetDelay[targetName] = GetTime()
        return MPCastSpellWithoutTarget("迅捷治愈", unit, 1)
    end


    if (MPIsMoving() or MPDriudHealSaved[MPDriudHealConfig].Regrowth==0) and MPDriudHealSaved[MPDriudHealConfig].MoveRejuvenation==1 and MPDriudRejuvenationMaxLevel>0 then
        -- 目标是否已经有回春术
        if not MPBuff("回春术",unit) then
            MPHealTargetDelay[targetName] = GetTime()

            -- 根据配置等级和所学等级计算
            local RejuvenationMaxLevel = MPDriudRejuvenationMaxLevel
            local RejuvenationMinLevel = MPDriudHealSaved[MPDriudHealConfig].RejuvenationMinLevel
            if MPDriudHealSaved[MPDriudHealConfig].RejuvenationMaxLevel < MPDriudRejuvenationMaxLevel then
                RejuvenationMaxLevel = MPDriudHealSaved[MPDriudHealConfig].RejuvenationMaxLevel
            end

            for i = RejuvenationMaxLevel, RejuvenationMinLevel, -1 do
                if MPDriudRejuvenationEffect[i] < HealthDec then

                    if DM >= MPDriudRejuvenation[i] then
                        return MPCastSpellWithoutTarget("回春术(等级 "..i..")", unit, 1)
                    else
                        return MPCastSpellWithoutTarget("回春术(等级 1)", unit, 1)
                    end

                end
            end

            return MPCastSpellWithoutTarget("回春术(等级 "..MPDriudHealSaved[MPDriudHealConfig].RejuvenationMinLevel..")", unit, 1)

        end

    else

        -- 触有开，优先触
        if MPDriudHealSaved[MPDriudHealConfig].HealingTouch==1 and MPDriudHealingTouchMaxLevel>0 then
            MPHealthUnit = unit

            MPHealTargetDelay[targetName] = GetTime()

            -- 根据配置等级和所学等级计算
            local  TouchMaxLevel = MPDriudHealingTouchMaxLevel
            if MPDriudHealSaved[MPDriudHealConfig].TouchMaxLevel < MPDriudHealingTouchMaxLevel then
                TouchMaxLevel = MPDriudHealSaved[MPDriudHealConfig].TouchMaxLevel
            end

            for i = TouchMaxLevel, MPDriudHealSaved[MPDriudHealConfig].TouchMinLevel, -1 do
                if MPDriudHealingTouchEffect[i] < HealthDec then

                    if DM >= MPDriudHealingTouch[i] then
                        return MPCastSpellWithoutTarget("治疗之触(等级 "..i..")", unit, 1)
                    else
                        return MPCastSpellWithoutTarget("治疗之触(等级 1)", unit, 1)
                    end

                end
            end

            return MPCastSpellWithoutTarget("治疗之触(等级 "..MPDriudHealSaved[MPDriudHealConfig].TouchMinLevel..")", unit, 1)

        end



        -- 目标是否已经有愈合
        if not MPBuff("愈合",unit) or (MPDriudHealSaved[MPDriudHealConfig].RegrowthAgain==1 and MPGetShape(MPDriudTreeShapeshiftID) and percentHealth<=MPDriudHealSaved[MPDriudHealConfig].RegrowthAgain_Value) and MPDriudRegrowthMaxLevel>0 then
--        print(HealthDec)
            MPHealthUnit = unit

            MPHealTargetDelay[targetName] = GetTime()

            -- 根据配置等级和所学等级计算
            local RegrowthMaxLevel = MPDriudRegrowthMaxLevel
            local RegrowthMinLevel = MPDriudHealSaved[MPDriudHealConfig].RegrowthMinLevel
            if MPDriudHealSaved[MPDriudHealConfig].RegrowthMaxLevel < MPDriudRegrowthMaxLevel then
                RegrowthMaxLevel = MPDriudHealSaved[MPDriudHealConfig].RegrowthMaxLevel
            end

            for i = RegrowthMaxLevel, RegrowthMinLevel, -1 do
                if MPDriudRegrowthEffect[i] < HealthDec then

                    if DM >= MPDriudRegrowth[i] then
                        return MPCastSpellWithoutTarget("愈合(等级 "..i..")", unit, 1)
                    else
                        return MPCastSpellWithoutTarget("愈合(等级 1)", unit, 1)
                    end

                end
            end

            return MPCastSpellWithoutTarget("愈合(等级 "..MPDriudHealSaved[MPDriudHealConfig].RegrowthMinLevel..")", unit, 1)
        end

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








