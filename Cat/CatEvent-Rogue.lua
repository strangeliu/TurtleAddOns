local _, playerClass = UnitClass("player")
if playerClass ~= "ROGUE" then
    return  -- 终止文件执行
end

local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_DEAD")
frame:RegisterEvent("CHAT_MSG_COMBAT_SELF_MISSES")
frame:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")

-- SuperWow专有事件
frame:RegisterEvent("UNIT_CASTEVENT")
frame:RegisterEvent("RAW_COMBATLOG")

-- 自己的GUID
local PLAYER_GUID = 0


-- 切割buff
MPSliceTimer = 0

-- 割裂buff
MPBloodyTimer = 0

-- 毒伤buff
MPEnvenomTimer = 0

-- 取消buff周期
MPRogueProtectTimer = 0

local ExposeArmorCheck = {}
local ExposeArmorDelayTime = {}


-- 等待技能反馈的等待时间
local BLEENCHECKDELAY = 0.3

local function OnEvent()

    if event == "PLAYER_LOGIN" then
        if SUPERWOW_STRING then
            -- 获取并保存自己的GUID
            local a,guid = UnitExists("player")
            PLAYER_GUID = guid
        end

    -- 玩家死亡，重置参数
    elseif event == "PLAYER_DEAD" then
        MPSliceTimer = 0
        MPBloodyTimer = 0
        MPEnvenomTimer = 0
        ExposeArmorCheck = {}
        ExposeArmorDelayTime = {}


    elseif event == "CHAT_MSG_COMBAT_SELF_MISSES" then
        if not MP_SuperWoW then
            if string.find( arg1, "你发起了攻击.*闪开了.*" ) then
                MPRogueSurpriseStrikeTimerNoSW = GetTime()
            end
        end

    elseif event == "CHAT_MSG_SPELL_SELF_DAMAGE" then
        if not MP_SuperWoW then
            if string.find( arg1, "你的.*躲闪.*" ) then
                MPRogueSurpriseStrikeTimerNoSW = GetTime()
            elseif string.find( arg1, ".*突袭.*" ) then
                MPRogueSurpriseStrikeTimerNoSW = 0
            end
        end

    ---------------------------
    -- SuperWoW事件 -----------
    ---------------------------

    -- 施法、攻击事件处理
    elseif event == "UNIT_CASTEVENT" then

        -- 施法事件监测
        if arg3 == "CAST" then

            -- 仅监控自己放出的技能
            if arg1 == PLAYER_GUID then

                --MPMsg(arg4)

                -- 突袭
                if arg4 == 52511 then
                    MPMsg("突袭")
			        MPRogueSurpriseStrikeTimer=0

                -- 割裂
                elseif arg4== 11275 then
                    MPMsg("割裂 "..MPRogueCombo)
                    MPRogueBloodyDuration = 6+(MPRogueCombo*2) + MPRogueBloodyTalent
                    MPBloodyTimer = GetTime()

                -- 血腥气息
                elseif arg4 == 52530 then
                    MPMsg("血腥气息 "..MPRogueCombo)
                    MPRogueBloodyDuration = 6+(MPRogueCombo*2) + MPRogueBloodyTalent
                    MPBloodyTimer = GetTime()

                -- 毒伤
                elseif arg4 == 52531 then
                    MPMsg("毒伤 "..MPRogueCombo)
                    MPRogueEnvenomDuration = 8+(MPRogueCombo*4)
                    MPEnvenomTimer = GetTime()


                -- 切割
                elseif arg4 == 6774 then
                    MPMsg("切割 "..MPRogueCombo)
                    -- 计算应该持续时间
                    MPRogueSliceDuration = 6+(MPRogueCombo*3)
                    if MPRogueSliceTalent>0 then
                        MPRogueSliceDuration = MPRogueSliceDuration * MPRogueSliceTalent
                    end

                    MPSliceTimer = GetTime()

                -- 邪恶
                elseif arg4 == 11294 then
                    MPMsg("邪恶攻击 "..MPRogueCombo)

                -- 出血
                elseif arg4 == 16511 then
                    MPMsg("出血 "..MPRogueCombo)

                -- 背刺
                elseif arg4 == 25300 then
                    MPMsg("背刺 "..MPRogueCombo)

                -- 双刃毒袭
                elseif arg4==52714 or arg4==52715 or arg4==52716 or arg4==52717 then
                    MPMsg("双刃毒袭 "..MPRogueCombo)

                -- 剔骨
                elseif arg4 == 31016 then
                    MPMsg("剔骨 "..MPRogueCombo)

                -- 破甲
                elseif arg4 == 11198 then
                    MPMsg("破甲 "..MPRogueCombo)
                    ExposeArmorDelayTime[arg2] = GetTime()
                    MPExposeArmorCombo = MPRogueCombo

                else

                    --MPMsg(arg4)

                end


            end

        end

    -- 战斗日志事件处理
    elseif event == "RAW_COMBATLOG" then

        -- 自己的攻击
        if arg1 == "CHAT_MSG_COMBAT_SELF_MISSES" then
            if string.find( arg2, "你发起了攻击.*闪开了.*" ) then
                MPRogueSurpriseStrikeTimer = GetTime()
                MPRogueSurpriseStrikeTargetGUID = MPMatchGUID(arg2) 
            end

        elseif arg1 == "CHAT_MSG_SPELL_SELF_DAMAGE" then

            if string.find( arg2, "你的.*躲闪.*" ) then
                MPRogueSurpriseStrikeTimer = GetTime()
                MPRogueSurpriseStrikeTargetGUID = MPMatchGUID(arg2) 
            
            -- 破甲
            elseif string.find( arg2, "你的破甲.*招架.*" ) or string.find( arg2, "你的破甲.*躲闪.*" ) or string.find( arg2, "你的破甲.*格挡.*" ) or string.find( arg2, "你的破甲.*没有击中.*" ) then
                local targetGUID = MPMatchGUID(arg2)
                if ExposeArmorDelayTime[targetGUID] then 
                    local timer = GetTime() - ExposeArmorDelayTime[targetGUID]
                    if timer <= BLEENCHECKDELAY then
                        ExposeArmorDelayTime[targetGUID] = nil
                    end
                end
            end

        end

    end


end



local function OnUpdate()
    MPRogueCombo = GetComboPoints("target")
end


-- 设置事件处理函数
frame:SetScript("OnEvent", OnEvent)
frame:SetScript("OnUpdate", OnUpdate)



local function IsMainHandDagger()
    local itemLink = GetInventoryItemLink("player", 16)
    local itemID = MPMatch(itemLink, "item:(%d+):")
    if itemLink then
        local _, _, _, _, _, itemType = GetItemInfo(itemID)
        return itemType == "匕首"  -- 注意：英文可能是"Dagger" or "Daggers" 
    end
    
    return false
end





function MPGetRogueBloody(leaveTime)

    leaveTime = leaveTime or 0;

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW then
        return MPBuff("血腥气息")
    end
    

    if (GetTime()-MPBloodyTimer) < (MPRogueBloodyDuration-leaveTime) then
        return true
    end

    return false
end


function MPGetRogueEnvenom(leaveTime)

    leaveTime = leaveTime or 0;

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW then
        return MPBuff("毒伤")
    end
    

    if (GetTime()-MPEnvenomTimer) < (MPRogueEnvenomDuration-leaveTime) then
        return true
    end

    return false
end


function MPGetRogueSlice(leaveTime)

    leaveTime = leaveTime or 0;

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW then
        return MPBuff("切割")
    end
    

    if (GetTime()-MPSliceTimer) < (MPRogueSliceDuration-leaveTime) then
        return true
    end

    return false
end





-- 获取当前目标是否有破甲效果
-- 注：SuperWow支持更加准确
-- return 存在返回真
function MPGetExposeArmorDot(value)

    value = value or 0

    -- 检测是否有SuperWow模组
    if not MP_SuperWoW then
        return MPBuff("破甲","target")
    end

    -- 获取目标GUID，并确保其存在
    local a,guid=UnitExists("target")
    if not guid then
        return false
    end

    if ExposeArmorDelayTime[guid] then 
        local timer = GetTime() - ExposeArmorDelayTime[guid]
        -- 0.2秒监测期里
        if timer <= BLEENCHECKDELAY then
            -- 还在等待认证期
            return MPGetExposeArmorDOTCheck(guid, value)
        else
            -- 已经过了认证期
            ExposeArmorCheck[guid] = ExposeArmorDelayTime[guid]
        end
    end

    return MPGetExposeArmorDOTCheck(guid, value)
end

function MPGetExposeArmorDOTCheck( guid, value )

    if ExposeArmorCheck[guid] then
        local timer = GetTime() - ExposeArmorCheck[guid]
        if timer < (30-value) then
            return true
        end
    end

    return false
end

function MPGetExposeArmorCheck()
    return ExposeArmorCheck
end






-- 上毒
function MPPutonPostion(postion, slot)

    if MPCheckUIStatus() then
        MPMsg("你正与NPC交互，无法自动上毒！")
        return
    end

	if not MPUseItemByName(postion) then
        return
    end
	PickupInventoryItem(slot)
	MPClickReplace()    -- 点击替换按钮
	ClearCursor()
end




-- 盗贼特性状态
function MPRogueRefreshInfo()

	-- 天赋中是否有突袭
	MPRogueRiposte = MPIsTalentLearned(2, 13)

	-- 天赋中是否有剑刃乱舞
	MPRogueBladeFlurry = 1

	-- 天赋中是否有出血
	MPRogueHemorrhage = MPIsTalentLearned(3, 10)
    if MPIsTalentLearned(3, 17)==1 then
        MPRogueHemorrhageEnergy = 40 - 2
    elseif MPIsTalentLearned(3, 17)==2 then
        MPRogueHemorrhageEnergy = 40 - 5
    else
        MPRogueHemorrhageEnergy = 40
    end


	-- 血腥气息天赋是否点满
	if MPIsTalentLearned(1, 10) > 0 then
		MPRogueBloody = 1
	else
		MPRogueBloody = 0
	end

	-- 血腥气息天赋 持续时间
    MPRogueBloodyTalent = 0 --MPIsTalentLearned(1, 10)*2
    if MPIsTalentLearned(1, 10)==1 then MPRogueBloodyTalent=4 end
    if MPIsTalentLearned(1, 10)==2 then MPRogueBloodyTalent=6 end

    -- 强化刀锋战术
    MPRogueSliceTalent = 1+MPIsTalentLearned(1, 6)*0.15

	-- 统计废墟套装，计算切割消耗
	count = 0
	if MPCheckInventoryItemName(11,"笼罩阴影之戒") then count=count+1 end
	if MPCheckInventoryItemName(12,"笼罩阴影之戒") then count=count+1 end
	if MPCheckInventoryItemName(15,"笼罩阴影披风") then count=count+1 end
	if MPCheckInventoryItemName(16,"笼罩阴影匕首") then count=count+1 end
	if MPCheckInventoryItemName(17,"笼罩阴影匕首") then count=count+1 end
	if count >= 3 then
		MPRogueSliceEnergy = 20 - 10
	end

    -- 检查主手武器
    if IsMainHandDagger() then
        MPRogueMainHand = 2
    else
        MPRogueMainHand = 1
    end

    -- 检查毒伤天赋
    MPRogueEnvenom = MPIsTalentLearned(1,14)

    -- 检查双刃毒袭天赋
    MPRogueBothSword = MPIsTalentLearned(1,18)

end

