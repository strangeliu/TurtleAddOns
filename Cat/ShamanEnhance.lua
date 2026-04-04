if MPPlayerClass ~= "SHAMAN" then
    return  -- 终止文件执行
end

-- -------------------------------------
-- 乌龟服 - 增强萨一键宏
-- 更新日期：2026-04-02 （后面根据时间来判断版本）
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
--
-- 可选条件：SuperWoW
--
-- 说明：
-- 
-- -------------------------------------

local AUTO_Shaman_Trinket_Delay = 3

-- 闪电之盾层数
MPShamanLightningShield = 3

-- 风暴打击
MPShamanStormStrike = 0

-- 闪电打击
MPShamanLightningStrike = 0

-- 6T3套装特效
MPShaman6T3 = 0


local function EnhanceEarthTotemManager()

    -- 检测开关
    if MPShamanEnhanceSaved.EarthTotem==0 then
        return
    end

    -- 图腾是否存在
    if MPEarthTotem() and MPShamanEnhanceSaved.ForceTotem==0 then
    elseif MPEarthTotem() and MPEarthTotemName==MPShamanEnhanceSaved.EarthTotem_Value and MPShamanEnhanceSaved.ForceTotem==1 then

    else
        CastSpellByName(MPShamanEnhanceSaved.EarthTotem_Value)
        MPEarthTotemX, MPEarthTotemY = GetPlayerMapPosition("player")
    end

end


local function EnhanceFireTotemManager()

    -- 检测开关
    if MPShamanEnhanceSaved.FireTotem==0 then
        return
    end

    -- 图腾是否存在
    if MPFireTotem() and MPShamanEnhanceSaved.ForceTotem==0 then
    elseif MPFireTotem() and MPFireTotemName==MPShamanEnhanceSaved.FireTotem_Value and MPShamanEnhanceSaved.ForceTotem==1 then

    else
        CastSpellByName(MPShamanEnhanceSaved.FireTotem_Value)
        MPFireTotemX, MPFireTotemY = GetPlayerMapPosition("player")
    end

end

local function EnhanceWaterTotemManager()

    -- 检测开关
    if MPShamanEnhanceSaved.WaterTotem==0 then
        return
    end

    -- 图腾是否存在
    if MPWaterTotem() and MPShamanEnhanceSaved.ForceTotem==0 then
    elseif MPWaterTotem() and MPWaterTotemName==MPShamanEnhanceSaved.WaterTotem_Value and MPShamanEnhanceSaved.ForceTotem==1 then

    else
        CastSpellByName(MPShamanEnhanceSaved.WaterTotem_Value)
        MPWaterTotemX, MPWaterTotemY = GetPlayerMapPosition("player")
    end

end


local function EnhanceAirTotemManager()

    -- 检测开关
    if MPShamanEnhanceSaved.AirTotem==0 then
        return
    end

    -- 图腾是否存在
    if MPAirTotem() and MPShamanEnhanceSaved.ForceTotem==0 then
    elseif MPAirTotem() and MPAirTotemName==MPShamanEnhanceSaved.AirTotem_Value and MPShamanEnhanceSaved.ForceTotem==1 then

    else
        CastSpellByName(MPShamanEnhanceSaved.AirTotem_Value)
        MPAirTotemX, MPAirTotemY = GetPlayerMapPosition("player")
    end

end


local GCD,SS,LS,DDZJ,LYZJ,BSZJ,Mana,SD,DT,RY

-- 切换图腾逻辑
--[[ 废弃
local function MPSwitchTotemItem()

    local StormCD = MPGetSpellCooldown("闪电打击")
    local ShockCD = MPGetSpellCooldown("大地震击")
    local Flame = MPBuff("烈焰震击", "target")

    GCD = MPGetGCD()

    -- 公CD的时候才进行切换
    --if GCD<0.5 then 

        -- 大地震击
        if MPShamanEnhanceSaved.EarthShockTotem==1 then
            if StormCD > ShockCD and Flame then
                MPEquipItemByName("破碎大地图腾", 9)
                return
            end
        end

        -- 震击类
        if MPShamanEnhanceSaved.ShockTotem==1 then
            if StormCD > ShockCD then
                MPEquipItemByName("裂石图腾", 9)
                return
            end
        end

        -- 闪电打击
        if MPShamanEnhanceSaved.StormstrikeTotem==1 then
            if StormCD <= ShockCD then
                MPEquipItemByName("裂雷图腾", 9)
                return
            end
        end

    --end


end
]]


function MPShamanAutoEnhance()

    if MPShamanStormStrike==1 then SS=MPSpellReady("风暴打击") else SS=false end
    if MPShamanLightningStrike==1 then LS=MPSpellReady("闪电打击") else LS=false end
    DDZJ = MPSpellReady("大地震击")
    LYZJ = MPSpellReady("烈焰震击")
    BSZJ = MPSpellReady("冰霜震击")
    Mana = UnitMana("player")

    if MPShaman6T3==1 then
        SD = MPBuff("霜冻")
        DT = MPBuff("冻土")
        RY = MPBuff("熔岩")
    else
        SD = false
        DT = false
        RY = false
    end


	-- 确认目标的存活和转火
	MPAutoSwitchTarget(MPShamanEnhanceSaved.Target)

	-- 开启自动攻击
	MPStartAttack()

	-- 自动拾取
	if MPShamanEnhanceSaved.Pick==1 then
		MPAutoLoot()
	end

	-- 功能药水
	if MPShamanEnhanceSaved.Power==1 then
		MPCatPower()
	end



	if MPBuff("放逐术", "target") then
		return
	end


	-- 在战斗中
	if MPInCombat then

		-- 自动开启饰品
		if GetInventoryItemCooldown("player",13)==0 and MP_Trinket_Upper==1 and GetTime()-MPInCombatTime>AUTO_Shaman_Trinket_Delay and MPGetTargetDistance() and MPShamanEnhanceSaved.Trinket_Upper==1 then
			if MPShamanEnhanceSaved.TUBoss==1 and MPIsBossTarget() then
				UseInventoryItem(13)
				return
			elseif MPShamanEnhanceSaved.TUBoss==0 then
				UseInventoryItem(13)
				return
			end
		end
		if GetInventoryItemCooldown("player",14)==0 and MP_Trinket_Below==1 and GetTime()-MPInCombatTime>AUTO_Shaman_Trinket_Delay and MPGetTargetDistance() and MPShamanEnhanceSaved.Trinket_Below==1 then
			if MPShamanEnhanceSaved.TBBoss==1 and MPIsBossTarget() then
				UseInventoryItem(14)
				return
			elseif MPShamanEnhanceSaved.TBBoss==0 then
				UseInventoryItem(14)
				return
			end
		end

		if MPShamanEnhanceSaved.Soulspeed==1 and MPIsBossTarget() then
			MPUseItemByName("魂能之速")
		end

	    -- 血量危险时处理，潜行下不吃药
	    local percent = UnitHealth("player") / UnitHealthMax("player") * 100
	    if percent<MPShamanEnhanceSaved.HealthStone_Value and MPShamanEnhanceSaved.HealthStone==1 then
		    MPUseItemByName("特效治疗石")
	    end
	    if percent<MPShamanEnhanceSaved.HerbalTea_Value and MPShamanEnhanceSaved.HerbalTea==1 then
		    MPUseItemByName("糖水茶")
		    MPUseItemByName("诺达纳尔草药茶")
	    end
		local percentMana = UnitMana("player") / UnitManaMax("player") * 100
		if percentMana<MPShamanEnhanceSaved.HerbalTeaMana_Value and MPShamanEnhanceSaved.HerbalTeaMana==1 then
			MPUseItemByName("糖水茶")
			MPUseItemByName("诺达纳尔草药茶")
		end

	    -- 特定 种族天赋 --

	    if MPShamanEnhanceSaved.RacialTraits==1 and MPGetTargetDistance() then

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

    -- 图腾召回
    --[[
    if MPShamanEnhanceSaved.RecallTotems==1 then
        local recall = 0
        local x, y = GetPlayerMapPosition("player")
        if MPEarthTotem() and MPCalculateTotemDistance(x,y, MPEarthTotemX, MPEarthTotemY)>MPShamanEnhanceSaved.RecallTotems_Value then recall = recall+1 end
        if MPFireTotem() and MPCalculateTotemDistance(x,y, MPFireTotemX, MPFireTotemY)>MPShamanEnhanceSaved.RecallTotems_Value  then recall = recall+1 end
        if MPWaterTotem() and MPCalculateTotemDistance(x,y, MPWaterTotemX, MPWaterTotemY)>MPShamanEnhanceSaved.RecallTotems_Value  then recall = recall+1 end
        if MPAirTotem() and MPCalculateTotemDistance(x,y, MPAirTotemX, MPAirTotemY)>MPShamanEnhanceSaved.RecallTotems_Value  then recall = recall+1 end
        if recall > 0 then
            CastSpellByName("图腾召回")
            return
        end
    end
    ]]

    -- 图腾
    EnhanceEarthTotemManager()
    EnhanceFireTotemManager()
    EnhanceWaterTotemManager()
    EnhanceAirTotemManager()

    if MPShamanEnhanceSaved.AutoWaterShield==1 then

        if Mana < MPShamanEnhanceSaved.AutoWaterShield_Value then
            if not MPBuff("水之护盾") then
                CastSpellByName("水之护盾")
            end
        elseif Mana > (MPShamanEnhanceSaved.AutoWaterShield_Value+1000) then

            -- 闪电之盾
            if MPShamanEnhanceSaved.LightningShield==1 then
                MPCancelBuffByName("水之护盾", "player")
                if not MPBuff("闪电之盾") then
                    CastSpellByName("闪电之盾")
                    return
                end
            end

            -- 大地之盾
            if MPShamanEnhanceSaved.EarthShield==1 then
                MPCancelBuffByName("水之护盾", "player")
                if not MPBuff("大地之盾") then
                    CastSpellByName("大地之盾")
                    return
                end
            end

            -- 水之护盾
            if MPShamanEnhanceSaved.WaterShield==1 then
                if not MPBuff("水之护盾") then
                    CastSpellByName("水之护盾")
                end
            end

        else

            -- 闪电之盾
            if MPShamanEnhanceSaved.LightningShield==1 and not MPBuff("闪电之盾") and not MPBuff("水之护盾") then
                CastSpellByName("闪电之盾")
                return
            end

            -- 大地之盾
            if MPShamanEnhanceSaved.EarthShield==1 and not MPBuff("大地之盾") and not MPBuff("水之护盾") then
                CastSpellByName("大地之盾")
                return
            end

            -- 水之护盾
            if MPShamanEnhanceSaved.WaterShield==1 and not MPBuff("水之护盾") then
                CastSpellByName("水之护盾")
            end

        end
    else
        -- 闪电之盾
        if MPShamanEnhanceSaved.LightningShield==1 then
            MPCancelBuffByName("水之护盾", "player")
            if not MPBuff("闪电之盾") then
                CastSpellByName("闪电之盾")
                return
            end
        end

        -- 大地之盾
        if MPShamanEnhanceSaved.EarthShield==1 then
            MPCancelBuffByName("水之护盾", "player")
            if not MPBuff("大地之盾") then
                CastSpellByName("大地之盾")
                return
            end
        end

        -- 水之护盾
        if MPShamanEnhanceSaved.WaterShield==1 then
            if not MPBuff("水之护盾") then
                CastSpellByName("水之护盾")
            end
        end
    end


    -- 武器附魔
    if MPShamanEnhanceSaved.WEnhance==1 then
        if not string.find(MPGetShamanEnchantName(),MPShamanEnhanceSaved.WEnhance_Value) then
            CastSpellByName(MPShamanEnhanceSaved.WEnhance_Value)
            return
        end
    end

    -- 尝试切换图腾装备
    -- MPSwitchTotemItem()


    if MPShaman6T3==1 and MPShamanEnhanceSaved.SixT3==1 then

        -- 6T3 Buff 烈焰震击->霜冻->冰霜震击
        -- 6T3 Buff 冰霜震击->冻土->大地震击
        -- 6T3 Buff 大地震击->熔岩->烈焰震击

        if MPShamanEnhanceSaved.FlameShock==1 and LYZJ and not MPBuff("烈焰震击", "target") and not RY and not DT and not SD then
            CastSpellByName("烈焰震击")
            return
        elseif MPShamanEnhanceSaved.FlameShock==1 and LYZJ and RY then
            CastSpellByName("烈焰震击")
            return
        end

        if SS and MPGetMainHandLeft()>0.4 then
            CastSpellByName("风暴打击")
        end

        if LS and MPGetMainHandLeft()>0.4 then
            CastSpellByName("闪电打击")
        end

        -- 6T3的特效
        if DDZJ and DT then
            CastSpellByName("大地震击")
            return
        end

        if BSZJ and SD then
            CastSpellByName("冰霜震击")
            return
        end

        return
    end


    -- 补烈焰震击
    if MPShamanEnhanceSaved.FlameShock==1 and LYZJ and not MPBuff("烈焰震击", "target") and MPGetMainHandLeft()<(UnitAttackSpeed("player")/2) then
        CastSpellByName("烈焰震击")
        return
    end

    if SS and MPGetMainHandLeft()>(UnitAttackSpeed("player")/2) then
        CastSpellByName("风暴打击")
        return
    end

    if LS and MPGetMainHandLeft()>(UnitAttackSpeed("player")/2) then
        CastSpellByName("闪电打击")
        return
    end



    if MPShamanEnhanceSaved.EarthShock==1 and DDZJ and MPGetMainHandLeft()<(UnitAttackSpeed("player")/2) then
        --if MPCanBeDamagedByNature("target") then
            CastSpellByName("大地震击")
            return
        --[[
        else 
            -- 目标免疫自然伤害，改用冰霜震击
            CastSpellByName("冰霜震击")
            return
        end
        ]]
    end

    if MPShamanEnhanceSaved.FrostShock==1 and DDZJ and MPGetMainHandLeft()<(UnitAttackSpeed("player")/2) then
        CastSpellByName("冰霜震击")
        return
    end




end

