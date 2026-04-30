if MPPlayerClass ~= "DRUID" then
    return  -- 终止文件执行
end


-- 创建一个 Frame 并监听事件
local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("SPELLCAST_START")
frame:RegisterEvent("SPELLCAST_STOP")
frame:RegisterEvent("SPELLCAST_FAILED")
frame:RegisterEvent("SPELLCAST_INTERRUPTED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")
frame:RegisterEvent("PLAYER_DEAD")
frame:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
frame:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS")
frame:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")

frame:RegisterEvent("PLAYER_COMBO_POINTS")



-- 节能施法(清晰预兆)是否存在
local DriudOmen = false
local DriudOmenTimer = 0

-- 扫击、撕碎、血袭监测
local RateCheck = {}
local RateDelayTime = {}
local RateMiss = 0              -- Nampower处理

local RipCheck = {}
local RipDelayTime = {}
local RipMiss = 0               -- Nampower处理

local RavageCheck = {}
local RavageDelayTime = {}
local RavageMiss = 0            -- Nampower处理

-- 月火术、虫群监测
local MoonfireCheck = {}
local MoonfireDelayTime = {}
local MoonfireMiss = 0          -- Nampower处理

local InsectSwarmCheck = {}
local InsectSwarmDelayTime = {}
local InsectSwarmMiss = 0       -- Nampower处理


-- 续杯
local RefillTimer = 0
local RefillGUID = 0
local Refill = false
local RefillMiss = 0

local ComboPoints = 0

-- 等待技能反馈的等待时间
local BLEENCHECKDELAY = 0.2

-- DOT持续时间的网络延迟减少
local DOT_DURATION_DELAY = 0.01


local DriudUnOmenList = {

    -- 猫德技能
    [9904] = true,      -- 扫击
    [9896] = true,      -- 撕扯
    [9827] = true,      -- 血袭
    [9850] = true,      -- 爪击
    [45969] = true,     -- 撕碎
    [31018] = true,     -- 凶猛撕咬

    -- 熊德技能
    [9881] = true,      -- 槌击
    [9908] = true,      -- 挥击
    [45739] = true,     -- 野蛮撕咬

    -- 鸟德技能（这里默认最高等级）
    [45967] = true,     -- 愤怒
    [25298] = true,     -- 星火术
    [9835] = true,      -- 月火术
    [24977] = true,     -- 虫群

    -- 奶德技能（这里默认最高等级）
    [9858] = true,      -- 愈合
    [25299] = true,     -- 回春术
    [25297] = true,     -- 治疗之触
}


local function ResetData()
    --DriudOmen = false
    DriudOmenTimer = 0

    RateCheck = {}
    RateDelayTime = {}
    RateMiss = 0

    RipCheck = {}
    RipDelayTime = {}
    RipMiss = 0

    RavageMiss = 0

    MoonfireCheck = {}
    MoonfireDelayTime = {}
    MoonfireMiss = 0

    InsectSwarmCheck = {}
    InsectSwarmDelayTime = {}
    InsectSwarmMiss = 0

    MPDriudCastHeal = 0

    ComboPoints = 0

    MPDriudMaxRipAP = 0
    MPDriudMaxRakeAP = 0

    RefillTimer = 0
    RefillGUID = 0
    Refill = false
    RefillMiss = 0

end

local function OnEvent()

    -- 进入游戏世界刷新常量值
    if event == "PLAYER_ENTERING_WORLD" then
        ResetData()

        if MP_Nampower4 then
            -- Nampower专有事件
            frame:RegisterEvent("SPELL_GO_SELF")
            frame:RegisterEvent("SPELL_MISS_SELF")
        else
            -- SuperWow专有事件
            frame:RegisterEvent("UNIT_CASTEVENT")
            frame:RegisterEvent("RAW_COMBATLOG")
        end

    -- 目标变化事件
    elseif event == "PLAYER_TARGET_CHANGED" then

        -- 将目标切换的事件传递给猫德宏
        MPDriudSwapIdol()

    -- 进入战斗事件
    elseif event == "PLAYER_REGEN_DISABLED" then

        -- 将目标切换的事件传递给猫德宏
        MPDriudSwapIdol()

    -- 离开战斗事件
    elseif event == "PLAYER_REGEN_ENABLED" then
        ResetData()

    -- 玩家死亡，重置一些参数
    elseif event == "PLAYER_DEAD" then
        ResetData()

    -- 施法事件处理，读条类，读条也要处理GCD
    elseif event == "SPELLCAST_START" then

        -- 德鲁伊治疗读条处理
        if arg1 == "愈合" then MPDriudCastHeal=GetTime() end
        if arg1 == "治疗之触" then MPDriudCastHeal=GetTime() end

    elseif event == "SPELLCAST_STOP" then

        MPDriudCastHeal = 0

    elseif event == "SPELLCAST_FAILED" then

        MPDriudCastHeal = 0

    elseif event == "SPELLCAST_INTERRUPTED" then

        MPDriudCastHeal = 0

    elseif event == "CHAT_MSG_SPELL_SELF_DAMAGE" then

        -- 撕扯 - 异常流血目标记录
        if string.find( arg1, "你的撕扯施放失败。.*对此免疫.*" ) then

        	local creature = UnitCreatureType("target") or "其它"
    	    local position = string.find("亡灵,龙类,恶魔", creature)
            -- 此记录只对亡灵类怪物进行处理
	        if position then
                local targetName = UnitName("target")
                if targetName then
                    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."发现["..targetName.."]不吃流血。")
                    -- 将该目标加入流血表（临时，重登后丢失）
                    MPmonsterList[targetName] = true
                end
	        end

        end

    elseif event == "CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE" then

        -- 扫击 dot jump
        if string.find( arg1, "你的扫击使.*" ) then
            MPDriudRateJumpTimer = GetTime() + 3.0

        -- 撕扯 dot jump
        elseif string.find( arg1, "你的撕扯使.*" ) then
            MPDriudRipJumpTimer = GetTime() + 2.0

        end

    elseif event == "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS" then

        -- 猛虎 jump
        if string.find( arg1, "你从猛虎之怒.*" ) then
            MPDriudTigerFuryTimer = GetTime() + 3.0

        elseif string.find( arg1, ".*节能施法.*" ) then
            DriudOmenTimer = GetTime()

        elseif string.find( arg1, "你获得了原始凶猛的效果.*" ) then
            local number = MPExtractNumber(arg1) 
            if number then
                MPDriudPrimalFury = MPToNumber(number)
            else
                MPDriudPrimalFury = 1
            end

        elseif string.find( arg1, "你获得了阿莎曼之怒的效果。" ) then
            MPDriudAshamane = GetTime()
            MPDriudPrimalFury = 0

        elseif string.find( arg1, ".*日蚀.*" ) then
            MPSolarTimer = GetTime()

        elseif string.find( arg1, ".*月蚀.*" ) then
            MPLunarTimer = GetTime()

        end

    elseif event == "CHAT_MSG_SPELL_AURA_GONE_SELF" then

        if string.find( arg1, ".*节能施法.*" ) then
            DriudOmenTimer = 0
        elseif string.find( arg1, ".*原始凶猛.*" ) then
            MPDriudPrimalFury = 0
        elseif string.find( arg1, ".*日蚀.*" ) then
            MPSolarTimer = 0
        elseif string.find( arg1, ".*月蚀.*" ) then
            MPLunarTimer = 0
        end

    elseif event == "PLAYER_COMBO_POINTS" then

        if MP_SuperWoW or MP_Nampower4 then

            if Refill then
                if RateCheck[RefillGUID] and GetTime()-RateCheck[RefillGUID]<MPDriudRakeDuration then RateCheck[RefillGUID]=RefillTimer end
                if RipCheck[RefillGUID] and GetTime()-RipCheck[RefillGUID]<MPDriudRipDuration then RipCheck[RefillGUID]=RefillTimer end
                Refill = false
                MPMsg("|cFF6060EE续杯-成功")
            end

        end

    ---------------------------
    -- SuperWoW事件 -----------
    ---------------------------

    -- 施法、攻击事件处理
    elseif event == "UNIT_CASTEVENT" then

        if arg3 == "CAST" then

            -- 仅监控自己放出的技能
            if arg1 == MP_PLAYER_GUID then

                --MPMsg(arg4)

                -- 监控双流血
                -- 扫击
                if arg4 == 9904 then

                    RateDelayTime[arg2] = GetTime()

                    -- 优质扫击
                    if UnitAttackPower("player") > MPDriudMaxRakeAP then
                        MPDriudMaxRakeAP = UnitAttackPower("player")
                    end
                    MPMsg("扫击 "..ComboPoints.." AP="..MPGetAP())
                    MPDriudRateJumpTimer = GetTime() + 3.0

                -- 撕扯
                elseif arg4 == 9896 then
                    -- 优质撕扯
                    if MPGetAP() > MPDriudMaxRipAP then
                        MPDriudMaxRipAP = MPGetAP()
                    end
                    MPMsg("撕扯 "..ComboPoints.." AP="..MPDriudMaxRipAP)
                    MPDriudRipJumpTimer = GetTime() + 2.0

                    RipDelayTime[arg2] = GetTime()
                    -- 动态调整持续时间
                    MPDriudRipDuration = 8+ComboPoints*2

                -- 血袭
                elseif arg4 == 9827 then
                    RavageDelayTime[arg2] = GetTime()

                -- 监控月火术、虫群
                -- 月火术
                elseif arg4==8921 or arg4==8924 or arg4==8925 or arg4==8926 or arg4==8927 or arg4==8928 or arg4==8929 or arg4==9833 or arg4==9834 or arg4==9835 then
                    MPMsg("月火术")
                    MoonfireDelayTime[arg2] = GetTime()
                -- 虫群
                elseif arg4==5570 or arg4==24974 or arg4==24975 or arg4==24976 or arg4 == 24977 then
                    MPMsg("虫群")
                    InsectSwarmDelayTime[arg2] = GetTime()

                -- 清晰预兆
                elseif arg4 == 16870 then
                    DriudOmenTimer = GetTime()

                -- 凶猛撕咬 31018
                elseif arg4 == 31018 then 
                    MPMsg("凶猛撕咬 "..ComboPoints)

                    -- 续杯机制
                    Refill = true
                    RefillTimer = GetTime()
                    RefillGUID = arg2

                -- 重整
                elseif arg4 == 768 then
                    MPMHTimer = 0
                    MPMsg("|cFFFF7D0A变猫|r "..UnitMana("player"))
                    -- 将目标切换的事件传递给猫德宏
                    MPDriudSwapIdol(2)

                elseif arg4 == 9634 then
                    MPMHTimer = 0
                    MPMsg("|cFFFF7D0A变熊|r")
                    -- 将目标切换的事件传递给猫德宏
                    MPDriudSwapIdol(1)


                elseif arg4 == 9846 then
                    MPMHTimer=GetTime()
                    MPMsg("猛虎之怒")
                    MPDriudTigerFuryTimer = GetTime() + 3.0
                

                elseif arg4 == 9827 then
                    MPMsg("突袭 "..ComboPoints)

                elseif arg4 == 9850 then
                    MPMsg("爪击 "..ComboPoints)

                elseif arg4 == 45969 then
                    MPMsg("撕碎 "..ComboPoints)

                elseif arg4 == 17392 then
                    MPMsg("精灵之火（野性）")

                elseif arg4 == 45967 then
                    MPMsg("愤怒")

                elseif arg4 == 25298 then
                    MPMsg("星火术")

                --[[
                -- 献祭之油
                elseif arg4 == 11350 then
                    MPSacrificialTimer = GetTime()+15

                ]]

                end



                -- 反向清除清晰预兆
                if DriudUnOmenList[arg4] == true then
                    DriudOmenTimer = 0
                end

            end

        end

    -- 战斗日志事件处理
    elseif event == "RAW_COMBATLOG" then

        -- 自己的攻击
        if arg1 == "CHAT_MSG_SPELL_SELF_DAMAGE" then

            -- 扫击
            if string.find( arg2, "你的扫击.*招架.*" ) or string.find( arg2, "你的扫击.*躲闪.*" ) or string.find( arg2, "你的扫击.*格挡.*" ) or string.find( arg2, "你的扫击.*没有击中.*" ) then
                local targetGUID = MPMatchGUID(arg2)
                if RateDelayTime[targetGUID] then 
                    local timer = GetTime() - RateDelayTime[targetGUID]
                    if timer <= BLEENCHECKDELAY then
                        RateDelayTime[targetGUID] = nil
                    end
                end

                MPMsg("|cFFEE2222扫击 "..ComboPoints.." 招闪")

            -- 撕扯
            elseif string.find( arg2, "你的撕扯.*招架.*" ) or string.find( arg2, "你的撕扯.*躲闪.*" ) or string.find( arg2, "你的撕扯.*格挡.*" ) or string.find( arg2, "你的撕扯.*没有击中.*" ) then
                local targetGUID = MPMatchGUID(arg2)
                if RipDelayTime[targetGUID] then 
                    local timer = GetTime() - RipDelayTime[targetGUID]
                    if timer <= BLEENCHECKDELAY then
                        RipDelayTime[targetGUID] = nil
                    end
                end

                MPMsg("|cFFEE2222撕扯 "..ComboPoints.." 招闪")

            elseif string.find( arg2, "你的凶猛撕咬.*招架.*" ) or string.find( arg2, "你的凶猛撕咬.*躲闪.*" ) or string.find( arg2, "你的凶猛撕咬.*格挡.*" ) or string.find( arg2, "你的凶猛撕咬.*没有击中.*" ) then
                Refill = false
                RefillGUID = 0
                RefillTimer = 0

                MPMsg("|cFFEE2222凶猛撕咬 "..ComboPoints.." 招闪")

            -- 月火术
            elseif string.find( arg2, "你的月火术被.*抵抗.*" ) then
                local targetGUID = MPMatchGUID(arg2)
                if MoonfireDelayTime[targetGUID] then 
                    local timer = GetTime() - MoonfireDelayTime[targetGUID]
                    if timer <= BLEENCHECKDELAY then
                        MoonfireDelayTime[targetGUID] = nil
                    end
                end

            -- 虫群
            elseif string.find( arg2, "你的虫群被.*抵抗.*" ) then
                local targetGUID = MPMatchGUID(arg2)
                if InsectSwarmDelayTime[targetGUID] then 
                    local timer = GetTime() - InsectSwarmDelayTime[targetGUID]
                    if timer <= BLEENCHECKDELAY then
                        InsectSwarmDelayTime[targetGUID] = nil
                    end
                end

            end


        end


    -- Nampower 事件
    elseif event == "SPELL_GO_SELF" then
        -- 监控双流血
        -- 扫击
        if arg2 == 9904 then
            if RateMiss==0 then
                RateCheck[arg4] = GetTime()

                -- 优质扫击
                if UnitAttackPower("player") > MPDriudMaxRakeAP then
                    MPDriudMaxRakeAP = UnitAttackPower("player")
                end
                MPMsg("扫击 "..ComboPoints.." AP="..MPGetAP())
                MPDriudRateJumpTimer = GetTime() + 3.0
            end

            RateMiss = 0

        -- 撕扯
        elseif arg2 == 9896 then
            if RipMiss==0 then
                -- 优质撕扯
                if MPGetAP() > MPDriudMaxRipAP then
                    MPDriudMaxRipAP = MPGetAP()
                end
                MPMsg("撕扯 "..ComboPoints.." AP="..MPDriudMaxRipAP)
                MPDriudRipJumpTimer = GetTime() + 2.0

                RipCheck[arg4] = GetTime()
                -- 动态调整持续时间
                MPDriudRipDuration = 8+ComboPoints*2
            end

            RipMiss = 0

        -- 血袭
        elseif arg2 == 9827 then
            if RavageMiss==0 then
                RavageCheck[arg4] = GetTime()
                MPMsg("突袭 "..ComboPoints)
            end
            RavageMiss = 0

        -- 监控月火术、虫群
        -- 月火术
        elseif arg2==8921 or arg2==8924 or arg2==8925 or arg2==8926 or arg2==8927 or arg2==8928 or arg2==8929 or arg2==9833 or arg2==9834 or arg2==9835 then
            if MoonfireMiss==0 then
                MoonfireCheck[arg4] = GetTime()
                MPMsg("月火术")
            end

            MoonfireMiss = 0

        -- 虫群
        elseif arg2==5570 or arg2==24974 or arg2==24975 or arg2==24976 or arg2 == 24977 then
            if InsectSwarmMiss==0 then
                InsectSwarmCheck[arg4] = GetTime()
                MPMsg("虫群")
            end

            InsectSwarmMiss = 0

        -- 凶猛撕咬 31018
        elseif arg2 == 31018 then
            if RefillMiss==0 then
                -- 续杯机制
                Refill = true
                RefillTimer = GetTime()
                RefillGUID = arg4

                MPMsg("凶猛撕咬 "..ComboPoints)
            end

            RefillMiss = 0

        -- 清晰预兆
        elseif arg2 == 16870 then
            DriudOmenTimer = GetTime()

        -- 重整
        elseif arg2 == 768 then
            MPMHTimer = 0
            -- 将目标切换的事件传递给猫德宏
            MPDriudSwapIdol(2)

            MPMsg("|cFFFF7D0A变猫|r "..UnitMana("player"))

        elseif arg2 == 9634 then
            MPMHTimer = 0
            -- 将目标切换的事件传递给猫德宏
            MPDriudSwapIdol(1)

            MPMsg("|cFFFF7D0A变熊|r")


        elseif arg2 == 9846 then
            MPMHTimer=GetTime()
            MPDriudTigerFuryTimer = GetTime() + 3.0

            MPMsg("猛虎之怒")
                

        elseif arg2 == 9850 then
            MPMsg("爪击 "..ComboPoints)

        elseif arg2 == 45969 then
            MPMsg("撕碎 "..ComboPoints)

        elseif arg2 == 17392 then
            MPMsg("精灵之火（野性）")

        elseif arg2 == 45967 then
            MPMsg("愤怒")

        elseif arg2 == 25298 then
            MPMsg("星火术")

        --[[
        -- 献祭之油
        elseif arg2 == 11350 then
            MPSacrificialTimer = GetTime()+15

        ]]

        end


        -- 反向清除清晰预兆
        if DriudUnOmenList[arg4] == true then
            DriudOmenTimer = 0
        end

    elseif event == "SPELL_MISS_SELF" then

        -- 扫击
        if arg3==9904 then
            RateMiss = 1
            MPMsg("|cFFEE2222扫击 "..ComboPoints.." 招闪")

        -- 撕扯
        elseif arg3==9896 then
            RipMiss = 1
            MPMsg("|cFFEE2222撕扯 "..ComboPoints.." 招闪")

        -- 突袭
        elseif arg3==9827 then
            RavageMiss = 1
            MPMsg("|cFFEE2222突袭 "..ComboPoints.." 招闪")

        -- 月火术
        elseif arg3==8921 or arg3==8924 or arg3==8925 or arg3==8926 or arg3==8927 or arg3==8928 or arg3==8929 or arg3==9833 or arg3==9834 or arg3==9835 then
            MoonfireMiss = 1
            MPMsg("|cFFEE2222月火术 抵抗")

        -- 虫群
        elseif arg3==5570 or arg3==24974 or arg3==24975 or arg3==24976 or arg3 == 24977 then
            InsectSwarmMiss = 1
            MPMsg("|cFFEE2222虫群 抵抗")

        -- 凶猛撕咬
        elseif arg3 == 31018 then 
            RefillMiss = 0
            MPMsg("|cFFEE2222凶猛撕咬 "..ComboPoints.." 招闪")

        end

    end

end






local function OnUpdate()

    -- 保存Combo
    -- 注意：这如果放在事件中，特别是终结技的事件中，星已经被清空
    ComboPoints = GetComboPoints("target")

    if MP_SuperWoW or MP_Nampower4 then

        if Refill then
            local time = GetTime() - RefillTimer
            if time>BLEENCHECKDELAY then
            --[[
                if ComboPoints==1 then
                    if RateCheck[RefillGUID] and GetTime()-RateCheck[RefillGUID]<8.8 then RateCheck[RefillGUID]=RefillTimer end
                    if RipCheck[RefillGUID] and GetTime()-RipCheck[RefillGUID]<17.8 then RipCheck[RefillGUID]=RefillTimer end
                    MPMsg("|cFF6060EE续杯-成功")
                else
                    MPMsg("|cFFEE2222续杯-失败 ")
                end
                ]]
                MPMsg("|cFFEE2222续杯-失败 ")
                Refill = false
            end
        end

    end


end



-- 设置事件处理函数
frame:SetScript("OnEvent", OnEvent)
frame:SetScript("OnUpdate", OnUpdate)




---------事件计算部分------------------------------------

-- 获取当前目标是否有扫击效果
-- 注：SuperWow支持更加准确
-- return 存在返回真
function MPGetRakeDot()

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW or not MP_Nampower4 or MPPlayerLevel<60 then
        return MPBuff("扫击","target")
    end


    -- 获取目标GUID，并确保其存在
    local a,guid=UnitExists("target")
    if not guid then
        return false
    end

    if not MP_Nampower4 then
        -- 0.2秒监测期里
        if RateDelayTime[guid] then 
            local timer = GetTime() - RateDelayTime[guid]
            if timer <= BLEENCHECKDELAY then
                -- 还在等待认证期
                return true --MPGetRakeDotCheck(guid)
            else
                -- 已经过了认证期
                RateCheck[guid] = RateDelayTime[guid]
                RateDelayTime[guid] = nil
            end
        end
    end

    return MPGetRakeDotCheck(guid)
end

function MPGetRakeDotCheck( guid )
    if RateCheck[guid] then
        local timer = GetTime() - RateCheck[guid]
        if timer <= MPDriudRakeDuration then
            return true
        else
            RateCheck[guid] = nil
        end
    end

    return false
end

function MPResetRakeDot(guid)
    RateCheck[guid] = nil
end

-- 获取当前目标是否有撕扯效果
-- 注：SuperWow支持更加准确
-- return 存在返回真
function MPGetRipDot()

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW or not MP_Nampower4 or MPPlayerLevel<60 then
        return MPBuff("撕扯","target")
    end

    -- 获取目标GUID，并确保其存在
    local a,guid=UnitExists("target")
    if not guid then
        return false
    end

    if not MP_Nampower4 then
        -- 0.2秒监测期里
        if RipDelayTime[guid] then 
            local timer = GetTime() - RipDelayTime[guid]
            if timer <= BLEENCHECKDELAY then
                -- 还在等待认证期
                return true -- MPGetRipDotCheck(guid)
            else
                -- 已经过了认证期
                RipCheck[guid] = RipDelayTime[guid]
                RipDelayTime[guid] = nil
            end
        end
    end

    return MPGetRipDotCheck(guid)
end

function MPGetRipDotCheck( guid )
    if RipCheck[guid] then
        local timer = GetTime() - RipCheck[guid]
        if timer < MPDriudRipDuration then
            return true
        else
            RipCheck[guid] = nil
        end
    end

    return false
end

function MPResetRipDot(guid)
    RipCheck[guid] = nil
end

-- 获取当前目标是否有血袭效果
-- 注：SuperWow支持更加准确
-- return 存在返回真
function MPGetRavageDot()

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW or not MP_Nampower4 or MPPlayerLevel<60 then
        return MPBuff("血袭","target")
    end

    -- 获取目标GUID，并确保其存在
    local a,guid=UnitExists("target")
    if not guid then
        return false
    end

    if not MP_Nampower4 then
        -- 0.2秒监测期里
        if RavageDelayTime[guid] then 
            local timer = GetTime() - RavageDelayTime[guid]
            if timer <= BLEENCHECKDELAY then
                -- 还在等待认证期
                return true -- MPGetRavageDotCheck(guid)
            else
                -- 已经过了认证期
                RavageCheck[guid] = RavageDelayTime[guid]
                RavageDelayTime[guid] = nil
            end
        end
    end

    return MPGetRavageDotCheck(guid)
end

function MPGetRavageDotCheck( guid )
    if RavageCheck[guid] then
        local timer = GetTime() - RavageCheck[guid]
        if timer < MPDriudRavageDuration then
            return true
        else
            RavageCheck[guid] = nil
        end
    end

    return false
end




-- 获取当前目标是否有月火术效果
-- 注：SuperWow支持更加准确
-- return 存在返回真
function MPGetMoonfireDot(unit)

    unit = unit or "target"

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW or not MP_Nampower4 or MPPlayerLevel<60 then
        return MPBuff("月火术","target")
    end

    -- 获取目标GUID，并确保其存在
    local a,guid=UnitExists(unit)
    if not guid then
        return false
    end

    if not MP_Nampower4 then
        -- 0.2秒监测期里
        if MoonfireDelayTime[guid] then 
            local timer = GetTime() - MoonfireDelayTime[guid]
            if timer <= BLEENCHECKDELAY then
                -- 还在等待认证期
                return true -- MPGetMoonfireDotCheck(guid)
            else
                -- 已经过了认证期
                MoonfireCheck[guid] = MoonfireDelayTime[guid]
                MoonfireDelayTime[guid] = nil
            end
        end
    end

    return MPGetMoonfireDotCheck(guid)
end

function MPGetMoonfireDotCheck( guid )
    if MoonfireCheck[guid] then
        local timer = GetTime() - MoonfireCheck[guid]
        if timer < MPDriudMoonfireDuration then
            return true
        else
            MoonfireCheck[guid] = nil
        end
    end

    return false
end

-- 获取当前目标是否有虫群效果
-- 注：SuperWow支持更加准确
-- return 存在返回真
function MPGetInsectSwarmDot(unit)

    unit = unit or "target"

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW or not MP_Nampower4 or MPPlayerLevel<60 then
        return MPBuff("虫群","target")
    end

    -- 获取目标GUID，并确保其存在
    local a,guid=UnitExists(unit)
    if not guid then
        return false
    end

    if not MP_Nampower4 then
        -- 0.2秒监测期里
        if InsectSwarmDelayTime[guid] then 
            local timer = GetTime() - InsectSwarmDelayTime[guid]
            if timer <= BLEENCHECKDELAY then
                -- 还在等待认证期
                return true -- MPGetInsectSwarmDotCheck(guid)
            else
                -- 已经过了认证期
                InsectSwarmCheck[guid] = InsectSwarmDelayTime[guid]
                InsectSwarmDelayTime[guid] = nil
            end
        end
    end

    return MPGetInsectSwarmDotCheck(guid)
end

function MPGetInsectSwarmDotCheck( guid )
    if InsectSwarmCheck[guid] then
        local timer = GetTime() - InsectSwarmCheck[guid]
        if timer < MPDriudInsectSwarmDuration then
            return true
        else
            InsectSwarmCheck[guid] = nil
        end
    end

    return false
end

function MPGetRateCheck()
    return RateCheck
end
function MPGetRipCheck()
    return RipCheck
end
function MPGetRavageCheck()
    return RavageCheck
end
function MPGetMoonfireCheck()
    return MoonfireCheck
end
function MPGetInsectSwarmCheck()
    return InsectSwarmCheck
end



-- 获取清晰预兆状态
function MPGetOmen()

    -- 兼容性检测
    --local buff, count = MPBuff("节能施法")
    --if MPBuff("节能施法") then
    --    return true
    --end

    if GetTime()-DriudOmenTimer<15 then
        return true
    end

    return false
end

function MPGetOmenTimer()
    return DriudOmenTimer
end


-- 获取日蚀时间
function MPGetSolar()
    if GetTime()-MPSolarTimer<15 then
        return 15-(GetTime()-MPSolarTimer)
    end

    return 0
end

-- 获取月蚀时间
function MPGetLunar()
    if GetTime()-MPLunarTimer<15 then
        return 15-(GetTime()-MPLunarTimer)
    end

    return 0
end


-- T3.5套装buff获取
function MPGetDriudAshamane()

	if GetTime()-MPDriudAshamane<10 then
		return true
	end

	return false
end



--------------------------------------------




--------------------------------------------


-- 德鲁伊刷新特性状态
function MPDriudRefreshInfo()


    -- 测定当前系别
    if MPIsTalentLearned(1,15) == 1 then
        MPDriudTalent = 1
    elseif MPIsTalentLearned(2,18) == 1 then
        MPDriudTalent = 2
    elseif MPIsTalentLearned(3,9) > 0 then
        MPDriudTalent = 3
    else
        MPDriudTalent = 0
    end

	local count = 0
	local rage = 0

	-- -------------------------------------
	-- 猫德特性 --
	-- -------------------------------------

	for i = 1, 9 do
		local _, name, _, id = GetShapeshiftFormInfo(i)
        if name then
            MPCleanString(name)
            if name=="猎豹形态" then
                MPDriudCatShapeshiftID = i
                break
            end
        end
        --[[
		if icon then
			if icon=="Interface\\Icons\\Ability_Druid_CatForm" then
				MPDriudCatShapeshiftID = i
			end
		end
        ]]
	end

	-- 猫德T2.5套装特效
	if MPCheckInventoryItemName(1,"起源皮盔") then count=count+1 end
	if MPCheckInventoryItemName(3,"起源肩垫") then count=count+1 end
	if MPCheckInventoryItemName(5,"起源长袍") then count=count+1 end
	if MPCheckInventoryItemName(7,"起源短裤") then count=count+1 end
	if MPCheckInventoryItemName(8,"起源便靴") then count=count+1 end
	if count >2 then rage = 3 end

	-- 保存撕碎能量为常量
	-- 60固定 - 天赋（强化撕碎）- T2.5三件套
	MPDriudShredEnergy = 60 - MPIsTalentLearned(2,13)*6 - rage

	if MPCheckInventoryItemName(18,"凶猛神像") then rage=rage+3 end

	-- 常量回归，重新检测
	MPDriudRakeDuration = 9
	--MPDriudRipDuration = 12

	if MPCheckInventoryItemName(15,"血腥掠夺者斗篷") then
		MPDriudRakeDuration = MPDriudRakeDuration - (9 * 0.05)
		--MPDriudRipDuration = MPDriudRipDuration - (12 * 0.05)
	end


	if MPCheckInventoryItemName(18,"野蛮神像") then
		MPDriudRakeDuration = MPDriudRakeDuration - (9 * 0.1)
		--MPDriudRipDuration = MPDriudRipDuration - (12 * 0.1)
	end

	-- 保存爪击能量为常量
	MPDriudClawEnergy = 45 - MPIsTalentLearned(2,1) - rage
	MPDriudRakeEnergy = 40 - MPIsTalentLearned(2,1) - rage

	-- 保存变身所需要的蓝量
	if MPCheckInventoryItemName(18,"狂野变形者神像") then
		MPDriudShapeshiftMana = 435 - 75
	else
		MPDriudShapeshiftMana = 435
	end
	MPDriudShapeshiftMana = MPFloor( MPDriudShapeshiftMana * ( 1 - MPIsTalentLearned(1,8) * 0.1 ) )

	-- 保存天赋中，激怒的标记
	if MPIsTalentLearned(3,2)>=5 then
		MPDriudCatFuror = 1
	else
		MPDriudCatFuror = 0
	end


	-- -------------------------------------
	-- 鸟德特性 --
	-- -------------------------------------

	for i = 1, 9 do
		local _, name, _, id = GetShapeshiftFormInfo(i)
        if name then
            MPCleanString(name)
            if name=="枭兽形态" then
                MPDriudCooShapeshiftID = i
                break
            end
        end
        --[[
		local icon,_,a=GetShapeshiftFormInfo(i)
		if icon then
			if icon == "Interface\\Icons\\Spell_Nature_ForceOfNature" then
				MPDriudCooShapeshiftID = i
			end
		end
        ]]
	end


	-- 鸟德T3套装特效
	count = 0
	if MPCheckInventoryItemName(1,"梦游者帽盔") then count=count+1 end
	if MPCheckInventoryItemName(3,"梦游者肩垫") then count=count+1 end
	if MPCheckInventoryItemName(5,"梦游者外衣") then count=count+1 end
	if MPCheckInventoryItemName(6,"梦游者腰带") then count=count+1 end
	if MPCheckInventoryItemName(7,"梦游者长裤") then count=count+1 end
	if MPCheckInventoryItemName(8,"梦游者便鞋") then count=count+1 end
	if MPCheckInventoryItemName(9,"梦游者腕带") then count=count+1 end
	if MPCheckInventoryItemName(10,"梦游者裹手") then count=count+1 end
	if MPCheckInventoryItemName(11,"梦游者指环") then count=count+1 end
	if MPCheckInventoryItemName(12,"梦游者指环") then count=count+1 end
	if count >= 4 then
		MPDriudMoonfireDuration = 18 + 3
		MPDriudInsectSwarmDuration = 18 + 2
	end

	-- 计算天赋对月火术、虫群、愤怒、星火术的耗蓝影响
	local percent = 1 - MPIsTalentLearned(1,13)*0.03-- - MPIsTalentLearned(1,15)*0.2
	-- 只有在枭兽形态才有耗蓝减少
	if MPIsTalentLearned(1,15)==1 then
		percent = percent - 0.2
	end

	MPDriudMoonfireMana = MPFloor( 375 * percent )
    MPDriudMoonfireRange = 30 + (30 * (MPIsTalentLearned(1,11)*0.1) )
	MPDriudInsectSwarmMana = MPFloor( 160 * percent )
    MPDriudInsectSwarmRange = 30 + (30 * (MPIsTalentLearned(1,11)*0.1) )
	MPDriudWrathMana = MPFloor( 210 * percent )
	MPDriudStarfireMana = MPFloor( 340 * percent )

	-- 存在 万物平衡 天赋的话，预计算自然恩赐的愤怒耗蓝
	MPDriudPowerGiftWrathMana = MPFloor( 210 * (percent-MPIsTalentLearned(1,18)*0.1) )


	-- -------------------------------------
	-- 奶德特性 --
	-- -------------------------------------

	for i = 1, 9 do
		local _, name, _, id = GetShapeshiftFormInfo(i)
        if name then
            MPCleanString(name)
            if name=="生命之树形态" then
                MPDriudTreeShapeshiftID = i
                break
            end
        end
        --[[
		local icon,_,a=GetShapeshiftFormInfo(i)
		if icon then
			if icon == "Interface\\Icons\\Ability_Druid_TreeofLife" then
				MPDriudTreeShapeshiftID = i
			end
		end
        ]]
	end

	-- 奶德T3套装特效
	count = 0
	percent = 1
	if MPCheckInventoryItemName(1,"梦游者头饰") then count=count+1 end
	if MPCheckInventoryItemName(3,"梦游者肩饰") then count=count+1 end
	if MPCheckInventoryItemName(5,"梦游者外套") then count=count+1 end
	if MPCheckInventoryItemName(6,"梦游者束带") then count=count+1 end
	if MPCheckInventoryItemName(7,"梦游者护腿") then count=count+1 end
	if MPCheckInventoryItemName(8,"梦游者长靴") then count=count+1 end
	if MPCheckInventoryItemName(9,"梦游者腕甲") then count=count+1 end
	if MPCheckInventoryItemName(10,"梦游者护手") then count=count+1 end
	if MPCheckInventoryItemName(11,"梦游者之戒") then count=count+1 end
	if MPCheckInventoryItemName(12,"梦游者之戒") then count=count+1 end
	if count >= 4 then
		percent = percent - 0.03
	end

	-- 天赋-月光
	percent = percent - MPIsTalentLearned(1,13)*0.03

	-- 只有在树形态才有耗蓝减少
	if MPIsTalentLearned(3,16)==1 then
		percent = percent - 0.2
	end


	-- 回春术
	MPDriudRejuvenation1 = MPFloor( 25 * percent )
	MPDriudRejuvenation7 = MPFloor( 195 * percent )
	MPDriudRejuvenation11 = MPFloor( 360 * percent )

    MPDriudRejuvenation[1] = MPFloor( 25 * percent )
    MPDriudRejuvenationEffect[1] = 32+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[2] = MPFloor( 40 * percent )
    MPDriudRejuvenationEffect[2] = 56+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[3] = MPFloor( 75 * percent )
    MPDriudRejuvenationEffect[3] = 116+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[4] = MPFloor( 105 * percent )
    MPDriudRejuvenationEffect[4] = 180+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[5] = MPFloor( 135 * percent )
    MPDriudRejuvenationEffect[5] = 244+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[6] = MPFloor( 160 * percent )
    MPDriudRejuvenationEffect[6] = 304+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[7] = MPFloor( 195 * percent )
    MPDriudRejuvenationEffect[7] = 388+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[8] = MPFloor( 235 * percent )
    MPDriudRejuvenationEffect[8] = 488+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[9] = MPFloor( 280 * percent )
    MPDriudRejuvenationEffect[9] = 608+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[10] = MPFloor( 335 * percent )
    MPDriudRejuvenationEffect[10] = 756+(MPHealingPower*MPDriudRejuvenationFactor)
    MPDriudRejuvenation[11] = MPFloor( 360 * percent )
    MPDriudRejuvenationEffect[11] = 888+(MPHealingPower*MPDriudRejuvenationFactor)

    MPDriudRejuvenationMaxLevel = MPGetHighestRankOfSpell("回春术")

	-- 天赋-宁静之魂，该天赋只对愈合、触有效
	percent = percent - MPIsTalentLearned(3,10)*0.02

	-- 愈合
	MPDriudRegrowth1 = MPFloor( 96 * percent )
	MPDriudRegrowth3 = MPFloor( 224 * percent )
	MPDriudRegrowth6 = MPFloor( 408 * percent )
	MPDriudRegrowth9 = MPFloor( 704 * percent )

    MPDriudRegrowth[1] = MPFloor( 96 * percent )
    MPDriudRegrowthEffect[1] = 100+(MPHealingPower*MPDriudRegrowthFactor)
    MPDriudRegrowth[2] = MPFloor( 164 * percent )
    MPDriudRegrowthEffect[2] = 188+(MPHealingPower*MPDriudRegrowthFactor)
    MPDriudRegrowth[3] = MPFloor( 224 * percent )
    MPDriudRegrowthEffect[3] = 272+(MPHealingPower*MPDriudRegrowthFactor)
    MPDriudRegrowth[4] = MPFloor( 280 * percent )
    MPDriudRegrowthEffect[4] = 357+(MPHealingPower*MPDriudRegrowthFactor)
    MPDriudRegrowth[5] = MPFloor( 336 * percent )
    MPDriudRegrowthEffect[5] = 451+(MPHealingPower*MPDriudRegrowthFactor)
    MPDriudRegrowth[6] = MPFloor( 408 * percent )
    MPDriudRegrowthEffect[6] = 566+(MPHealingPower*MPDriudRegrowthFactor)
    MPDriudRegrowth[7] = MPFloor( 492 * percent )
    MPDriudRegrowthEffect[7] = 711+(MPHealingPower*MPDriudRegrowthFactor)
    MPDriudRegrowth[8] = MPFloor( 592 * percent )
    MPDriudRegrowthEffect[8] = 887+(MPHealingPower*MPDriudRegrowthFactor)
    MPDriudRegrowth[9] = MPFloor( 704 * percent )
    MPDriudRegrowthEffect[9] = 1061+(MPHealingPower*MPDriudRegrowthFactor)

    MPDriudRegrowthMaxLevel = MPGetHighestRankOfSpell("愈合")

	-- 树形态返还耗蓝
	if MPIsTalentLearned(3,16)==1 then
		percent = percent + 0.2
	end

    -- 治疗之触
    MPDriudHealingTouch[1] = 25 * percent
    MPDriudHealingTouchEffect[1] = 48+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[2] = 55 * percent
    MPDriudHealingTouchEffect[2] = 108+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[3] = 110 * percent
    MPDriudHealingTouchEffect[3] = 230+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[4] = 185 * percent
    MPDriudHealingTouchEffect[4] = 420+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[5] = 270 * percent
    MPDriudHealingTouchEffect[5] = 650+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[6] = 335 * percent
    MPDriudHealingTouchEffect[6] = 840+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[7] = 405 * percent
    MPDriudHealingTouchEffect[7] = 1050+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[8] = 495 * percent
    MPDriudHealingTouchEffect[8] = 1340+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[9] = 600 * percent
    MPDriudHealingTouchEffect[9] = 1630+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[10] = 720 * percent
    MPDriudHealingTouchEffect[10] = 2100+(MPHealingPower*MPDriudHealingTouchFactor)
    MPDriudHealingTouch[11] = 800 * percent
    MPDriudHealingTouchEffect[11] = 2450+(MPHealingPower*MPDriudHealingTouchFactor)

    MPDriudHealingTouchMaxLevel = MPGetHighestRankOfSpell("治疗之触")

    -- 自然赐福 天赋
    local NatureGrace = 1+MPIsTalentLearned(3,9)*0.02

    -- 自然赐福 修正治疗效果
    if NatureGrace > 0 then
        for i = 1, 11 do
            MPDriudRejuvenationEffect[i] = MPDriudRejuvenationEffect[i] * NatureGrace
        end

        for i = 1, 9 do
            MPDriudRegrowthEffect[i] = MPDriudRegrowthEffect[i] * NatureGrace
            MPDriudRegrowthEffect[i] = MPDriudRegrowthEffect[i] * 1.5
        end
    end

	-- 是否点出迅捷治愈
	MPDriudSwiftmend = MPIsTalentLearned(3,6)

	-- 是否点出生命之树形态
	MPDriudTreeForm = MPIsTalentLearned(3,16)


	-- -------------------------------------
	-- 熊德特性 --
	-- -------------------------------------

	for i = 1, 9 do
		local _, name, _, id = GetShapeshiftFormInfo(i)
        if name then
            MPCleanString(name)

            if name=="巨熊形态" then
                MPDriudBearShapeshiftID = i
                break
            end
            if name=="熊形态" then
                MPDriudBearShapeshiftID = i
                break
            end
        end
	end

	-- 获取 野蛮撕咬、槌击、挥击 消耗怒气值
	MPDruidFerociousBitePower = 30 - MPIsTalentLearned(2,1)
	MPDruidManglePower = 15 - MPIsTalentLearned(2,1)
	MPDruidSwipePower = 20 - MPIsTalentLearned(2,1)

	if MPCheckInventoryItemName(18,"蛮兽神像") then
		MPDruidManglePower = MPDruidManglePower - 3
		MPDruidSwipePower = MPDruidSwipePower - 3
	end

	-- 狂暴天赋是否存在
	MPDriudBerserk = MPIsTalentLearned(2,15)

end


