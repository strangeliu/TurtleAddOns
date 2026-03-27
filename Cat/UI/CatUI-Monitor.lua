-- 定义插件名称
local ADDON_NAME = "CatUI"

-- 创建主框架
CatDebugWindow = CreateFrame("Frame", ADDON_NAME.."Frame", UIParent)
CatDebugWindow:Hide()

-- 设置窗口基本属性
CatDebugWindow:SetWidth(240)
CatDebugWindow:SetHeight(520)
CatDebugWindow:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
CatDebugWindow:SetFrameLevel(1)

-- 创建Tooltip风格的背景和边框
CatDebugWindow:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
CatDebugWindow:SetBackdropColor(0.1, 0.1, 0.2, 0.7)
--CatDebugWindow:SetBackdropBorderColor(0.5, 0.5, 0.5, 0.1)
CatDebugWindow:SetScale(0.8)

-- 使窗口可移动
CatDebugWindow:EnableMouse(true)
CatDebugWindow:SetMovable(true)
CatDebugWindow:RegisterForDrag("LeftButton")
CatDebugWindow:SetScript("OnDragStart", function()
    CatDebugWindow:StartMoving()
end)
CatDebugWindow:SetScript("OnDragStop", function()
    CatDebugWindow:StopMovingOrSizing()
end)

-- 添加标题文字
local title = CatDebugWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOPLEFT", CatDebugWindow, "TOPLEFT", 10, -10)
title:SetText(MPLanguage.UI_MonitorTitle)

-- 添加标准关闭按钮（精确对齐标题行）
local closeButton = CreateFrame("Button", nil, CatDebugWindow, "UIPanelCloseButton")
closeButton:SetWidth(32)
closeButton:SetHeight(32)
closeButton:SetPoint("TOPRIGHT", CatDebugWindow, "TOPRIGHT", -5, -2)  -- Y坐标调整为-10，与标题完全对齐
-- 设置点击事件
closeButton:SetScript("OnClick", function(self)
    MPPublicSaved.DebugWindowDisplay = 0
    CatDebugWindow:Hide()
    DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor..MPLanguage.UI_MonitorClosed)
end)

-- 添加分隔线
local divider = CatDebugWindow:CreateTexture(nil, "ARTWORK")
divider:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
divider:SetTexCoord(0.81, 0.94, 0.5, 1)
divider:SetVertexColor(0.5, 0.5, 0.5)
divider:SetWidth(230)
divider:SetHeight(4)
divider:SetPoint("TOP", CatDebugWindow, "TOP", 0, -30)

-- 添加文本内容区域
MPUIcontentText = CatDebugWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
MPUIcontentText:SetPoint("TOPLEFT", CatDebugWindow, "TOPLEFT", 15, -40)
MPUIcontentText:SetWidth(250)
MPUIcontentText:SetTextColor(1.0, 1.0, 1.0)
MPUIcontentText:SetJustifyH("LEFT")
MPUIcontentText:SetText("  ")

-- 添加提示内容区域
local TipText = CatDebugWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatDebugWindow, "BOTTOM", 0, 9)
TipText:SetWidth(250)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText(MPLanguage.UI_Mon_Version..MPCatAddonVer.." ]")


--

function MPRefreshInfoUI()
    -- 窗口未打开不刷新属性
    if not CatDebugWindow:IsVisible() then
        return
    end

    local Text
    local _, englishClass = UnitClass("player")


    -- 通用属性
    Text = MPtextSystemInfo .. "\n|cFFAAAAAA - "..MPLanguage.UI_Mon_GeneralParams.." - |r\n"


    local t = UnitExists("target")


    if t and MP_UnitXP then
        if MPCheckBehind(1) then
            Text = Text .. "\n"..MPLanguage.UI_Mon_TargetFacing.." |cFF6dff7b"..MPLanguage.UI_Mon_Behind.."|r"
        else
            Text = Text .. "\n"..MPLanguage.UI_Mon_TargetFacing.." |cFFff5c36"..MPLanguage.UI_Mon_Front.."|r"
        end

        if UnitIsVisible("target") then
            Text = Text .. "\n"..MPLanguage.UI_Mon_TargetDistance.." ".. string.format("%.2f", UnitXP("distanceBetween", "player", "target"))
        else
            Text = Text .. "\n"..MPLanguage.UI_Mon_TargetDistance.." "..MPLanguage.UI_Mon_OutOfVisibleRange
        end

    elseif not MP_UnitXP then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetFacing.." |cFF888888.."..MPLanguage.UI_Mon_NoUnitXP.."|r"
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetDistance.." |cFF888888"..MPLanguage.UI_Mon_NoUnitXP.."|r"
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetFacing.." |cFF888888"..MPLanguage.UI_Mon_NoTarget.."|r"
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetDistance.." |cFF888888"..MPLanguage.UI_Mon_NoTarget.."|r"
    end


    if t and MPTargetBleed then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetBleed.." |cFF6dff7b"..MPLanguage.UI_Mon_CanBleed.."|r"
    elseif t and not MPTargetBleed then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetBleed.." |cFFff5c36"..MPLanguage.UI_Mon_CannotBleed.."|r"
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetBleed.." |cFF888888"..MPLanguage.UI_Mon_NoTarget.."|r"
    end

    if t and MPIsDrain() then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetDrain.." |cFF6dff7b"..MPLanguage.UI_Mon_CanDrain.."|r"
    elseif t and not MPIsDrain() then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetDrain.." |cFFff5c36"..MPLanguage.UI_Mon_CannotBleed.."|r"
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetDrain.." |cFF888888"..MPLanguage.UI_Mon_NoTarget.."|r"
    end

    if t and MPIsPosion() then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetPosion.." |cFF6dff7b"..MPLanguage.UI_Mon_CanPosion.."|r"
    elseif t and not MPIsPosion() then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetPosion.." |cFFff5c36"..MPLanguage.UI_Mon_CannotPosion.."|r"
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetPosion.." |cFF888888"..MPLanguage.UI_Mon_NoTarget.."|r"
    end

    if t and MPIsBossTarget() then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetType.." |cFF6dff7bBOSS|r"
    elseif t and not MPIsBossTarget() then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetType.." "..MPLanguage.UI_Mon_Normal
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetType.." |cFF888888"..MPLanguage.UI_Mon_NoTarget.."|r"
    end

    if t then
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetArmor.." "..UnitArmor("target")
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_TargetArmor.." |cFF888888"..MPLanguage.UI_Mon_NoTarget.."|r"
    end

    if not MP_SuperWoW then
        Text = Text .. "\n"..MPLanguage.UI_Mon_MeleeEnemies.." |cFF888888"..MPLanguage.UI_Mon_NoSuperWoW.."|r"
    else
        local a,b = MPScanNearbyEnemiesCount()
        Text = Text .. "\n"..MPLanguage.UI_Mon_MeleeEnemies.." "..a.."  |cFF888888("..MPLanguage.UI_Mon_ActiveTargets..b..")|r"
    end

    if MPIsMoving() then
        Text = Text .. "\n"..MPLanguage.UI_Mon_MovementState.." |cFF6dff7b"..MPLanguage.UI_Mon_Moving.."|r"
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_MovementState.." |cFF888888"..MPLanguage.UI_Mon_Stationary.."|r"
    end

    if MPGetGCD() < MPGCDMax() then
        Text = Text .. "\n"..MPLanguage.UI_Mon_GCD.." "..string.format("%.1f", MPGCDMax()-MPGetGCD())
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_GCD.." |cFF888888"..MPLanguage.UI_Mon_CooldownReady.."|r"
    end

    Text = Text .. "\n"..MPLanguage.UI_Mon_MainHand.." "..string.format("%.1f",  MPGetMainHandLeft())

    if englishClass == "DRUID" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_EnergyRestore.." "..string.format("%.1f", MPGetRestoredEnergy() )
    end

    Text = Text .. "\n"


    -- 职业参数

    if englishClass == "WARRIOR" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Warrior
    elseif englishClass == "ROGUE" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Rogue
    elseif englishClass == "MAGE" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Mage
    elseif englishClass == "HUNTER" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Hunter
    elseif englishClass == "PRIEST" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Priest
    elseif englishClass == "WARLOCK" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Warlock
    elseif englishClass == "DRUID" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Druid
    elseif englishClass == "PALADIN" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Paladin
    elseif englishClass == "SHAMAN" then
        Text = Text .. "\n"..MPLanguage.UI_Mon_Class..MPLanguage.UI_Shaman
    else
        Text = Text .. "\n"..MPLanguage.UI_Mon_UnknownClass
    end

    local level = UnitLevel("player")
    if level >= 60 then
        Text = Text .. "   "..MPLanguage.UI_Mon_Level ..level .. "\n"
    else
        Text = Text .. "   |cFFff5c36"..MPLanguage.UI_Mon_Level ..level .. " "..MPLanguage.UI_Mon_NotSupported.."|r\n"
    end

    local a,guid=UnitExists("target")


    -- 德鲁伊
    if englishClass == "DRUID" then
        Text = Text .. "\n|cFFAAAAAA - "..MPLanguage.UI_Mon_DynamicStatus.." - |r\n"

        --[[
        if MPGetOmen() then
            Text = Text .. "\n清晰预兆… "..string.format("%.1f", 15-(GetTime()-MPGetOmenTimer()) )
        else
            Text = Text .. "\n清晰预兆… |cFF888888未激活|r"
        end
        ]]

        if MPGetSpellID("重整")==0 then
            Text = Text .. "\n|cFFEE1111重整技能：未学习|r"
        end

        -- 血袭
        if MPGetRavageDot() then
            if MP_SuperWoW or MP_Nampower4 then
                local check = MPGetRavageCheck()
                if check[guid] then
                    Text = Text .. "\n血袭… "..string.format("%.1f", MPDriudRavageDuration-(GetTime()-check[guid]))
                else
                    Text = Text .. "\n血袭… |cFF888888未激活 (持续:"..MPDriudRavageDuration.."秒)|r"
                end
            else
                Text = Text .. "\n血袭… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n血袭… |cFF888888未激活 (持续:"..MPDriudRavageDuration.."秒)|r"
        end

        -- 扫击
        if MPGetRakeDot() then
            if MP_SuperWoW or MP_Nampower4 then
                local check = MPGetRateCheck()
                if check[guid] then
                    Text = Text .. "\n扫击… "..string.format("%.1f", MPDriudRakeDuration-(GetTime()-check[guid])).."  跳 "..string.format("%.1f",MPDriudRateJumpTimer-GetTime())
                else
                    Text = Text .. "\n扫击… |cFF888888未激活 (持续:"..MPDriudRakeDuration.."秒)|r"
                end
            else
                Text = Text .. "\n扫击… |cFF6dff7b激活|r".."  跳 "..string.format("%.1f",MPDriudRateJumpTimer-GetTime())
            end
        else
            Text = Text .. "\n扫击… |cFF888888未激活 (持续:"..MPDriudRakeDuration.."秒)|r"
        end

        -- 撕扯
        if MPGetRipDot() then
            if MP_SuperWoW or MP_Nampower4 then
                local check = MPGetRipCheck()
                if check[guid] then
                    Text = Text .. "\n撕扯… "..string.format("%.1f", MPDriudRipDuration-(GetTime()-check[guid])).."  跳 "..string.format("%.1f",MPDriudRipJumpTimer-GetTime())
                else
                    Text = Text .. "\n撕扯… |cFF888888未激活 (持续:"..MPDriudRipDuration.."秒)|r"
                end
            else
                Text = Text .. "\n撕扯… |cFF6dff7b激活|r".."  跳 "..string.format("%.1f",MPDriudRipJumpTimer-GetTime())
            end
        else
            Text = Text .. "\n撕扯… |cFF888888未激活 (持续:"..MPDriudRipDuration.."秒)|r"
        end

        -- 猛虎之怒
        if MPMHTimer then
            if GetTime()-MPMHTimer<18 then
                Text = Text .. "\n猛虎之怒… "..string.format("%.1f", 18-(GetTime()-MPMHTimer) ).."  跳 "..string.format("%.1f",MPDriudTigerFuryTimer-GetTime())
            else
                Text = Text .. "\n猛虎之怒… |cFF888888未激活|r"
            end
        else
            Text = Text .. "\n猛虎之怒… |cFF888888未激活|r"
        end

        -- 自动回能 
        if MPGetDriudAshamane() then
            Text = Text .. "\n阿莎曼之怒… |cFF6dff7b激活|r"
        elseif MPDriudPrimalFury>0 then
            Text = Text .. "\n阿莎曼之怒… |cFF6dff7b"..MPDriudPrimalFury.."|r"
        else
            Text = Text .. "\n阿莎曼之怒… |cFF888888未激活|r"
        end


        -- 月火
        if MPGetMoonfireDot() then
            if MP_SuperWoW or MP_Nampower4 then
                local check = MPGetMoonfireCheck()
                if check[guid] then 
                    Text = Text .. "\n月火术… "..string.format("%.1f", MPDriudMoonfireDuration-(GetTime()-check[guid]))
                else
                    Text = Text .. "\n月火术… |cFF888888未激活 (持续:"..MPDriudMoonfireDuration.."秒)|r"
                end
            else
                Text = Text .. "\n月火术… "..string.format("%.1f", MPDriudMoonfireDuration-(GetTime()-MPGetMoonfireCheckUnSW()))
            end
        else
            Text = Text .. "\n月火术… |cFF888888未激活 (持续:"..MPDriudMoonfireDuration.."秒)|r"
        end

        -- 虫群
        if MPGetInsectSwarmDot() then
            if MP_SuperWoW or MP_Nampower4 then
                local check = MPGetInsectSwarmCheck()
                if check[guid] then
                    Text = Text .. "\n虫群… "..string.format("%.1f", MPDriudInsectSwarmDuration-(GetTime()-check[guid]))
                else
                    Text = Text .. "\n虫群… |cFF888888未激活 (持续:"..MPDriudInsectSwarmDuration.."秒)|r"
                end
            else
                Text = Text .. "\n虫群… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n虫群… |cFF888888未激活 (持续:"..MPDriudInsectSwarmDuration.."秒)|r"
        end
        --[[
        -- 日蚀
        if MPGetSolar()>0.0 then
            Text = Text .. "\n日蚀… |cFF6dff7b激活|r "..string.format("%.1f", MPGetSolar())
        else
            Text = Text .. "\n日蚀… |cFF888888未激活|r"
        end

        -- 月蚀
        if MPGetLunar()>0.0 then
            Text = Text .. "\n月蚀… |cFF6dff7b激活|r "..string.format("%.1f", MPGetLunar())
        else
            Text = Text .. "\n月蚀… |cFF888888未激活|r"
        end
        ]]



    -- 圣骑士
    elseif englishClass == "PALADIN" then
        Text = Text .. "\n|cFFAAAAAA - 动态监控状态 - |r\n"


        if not MP_SuperWoW then

            if MPSeal("智慧圣印") then
                Text = Text .. "\n智慧圣印… |cFF6dff7b激活|r"
            else
                Text = Text .. "\n智慧圣印… |cFF888888未激活|r"
            end

            if MPSeal("十字军圣印") then
                Text = Text .. "\n十字军圣印… |cFF6dff7b激活|r"
            else
                Text = Text .. "\n十字军圣印… |cFF888888未激活|r"
            end

            if MPSeal("正义圣印") then
                Text = Text .. "\n正义圣印… |cFF6dff7b激活|r"
            else
                Text = Text .. "\n正义圣印… |cFF888888未激活|r"
            end

            if MPSeal("命令圣印") then
                Text = Text .. "\n命令圣印… |cFF6dff7b激活|r"
            else
                Text = Text .. "\n命令圣印… |cFF888888未激活|r"
            end

            if MPSeal("光明圣印") then
                Text = Text .. "\n光明圣印… |cFF6dff7b激活|r"
            else
                Text = Text .. "\n光明圣印… |cFF888888未激活|r"
            end

        else

            if GetTime()-MPPaladinSealWisdomDuration<30 then
                Text = Text .. "\n智慧圣印… "..string.format("%.1f", 30-(GetTime()-MPPaladinSealWisdomDuration))
            else
                Text = Text .. "\n智慧圣印… |cFF888888未激活|r"
            end

            if GetTime()-MPPaladinSealCrusaderDuration<30 then
                Text = Text .. "\n十字军圣印… "..string.format("%.1f", 30-(GetTime()-MPPaladinSealCrusaderDuration))
            else
                Text = Text .. "\n十字军圣印… |cFF888888未激活|r"
            end

            if GetTime()-MPPaladinSealJusticeDuration<30 then
                Text = Text .. "\n正义圣印… "..string.format("%.1f", 30-(GetTime()-MPPaladinSealJusticeDuration))
            else
                Text = Text .. "\n正义圣印… |cFF888888未激活|r"
            end

            if GetTime()-MPPaladinSealCommandDuration<30 then
                Text = Text .. "\n命令圣印… "..string.format("%.1f", 30-(GetTime()-MPPaladinSealCommandDuration))
            else
                Text = Text .. "\n命令圣印… |cFF888888未激活|r"
            end

            if GetTime()-MPPaladinSealRightDuration<30 then
                Text = Text .. "\n光明圣印… "..string.format("%.1f", 30-(GetTime()-MPPaladinSealRightDuration))
            else
                Text = Text .. "\n光明圣印… |cFF888888未激活|r"
            end

        end

        --Text = Text .. "\n"
        if GetTime()-MPPaladinHolyStrikeDuration<20 then
            Text = Text .. "\n神圣威能… "..string.format("%.1f", 20-(GetTime()-MPPaladinHolyStrikeDuration))
        else
            Text = Text .. "\n神圣威能… |cFF888888未激活|r"
        end
        if MPGetCrusaderStrike() then
            Text = Text .. "\n狂热… ".." ("..MPPaladinFrenzyLayer.."层) "..string.format("%.1f", 30-(GetTime()-MPPaladinFrenzyDuration))
        else
            Text = Text .. "\n狂热… |cFF888888未激活|r"
        end



    -- 战士
    elseif englishClass == "WARRIOR" then
        Text = Text .. "\n|cFFAAAAAA - 动态监控状态 - |r\n"

        if MPWarriorDPSType==1 then
            Text = Text .. "\n天赋技能… 致死打击"
        elseif MPWarriorDPSType==2 then
            Text = Text .. "\n天赋技能… 嗜血"
        elseif MPWarriorDPSSweeping==1 and MPWarriorFlurry==1 then
            Text = Text .. "\n天赋技能… 邪修"
        elseif MPWarriorDPSType==3 then
            Text = Text .. "\n天赋技能… 盾牌猛击"
        else
            Text = Text .. "\n天赋技能… |cFF888888未发现|r"
        end


        --if MPGetBattleShout()>0 then
        if MPBuff("战斗怒吼") then
            Text = Text .. "\n战斗怒吼… |cFF6dff7b激活|r"
            if MPGetBattleShout()>0 then
                Text = Text .. " (预估 "..string.format("%.1f", MPGetBattleShout()).."秒)"
            end
        else
            if MPGetBattleShout()>0 then
                Text = Text .. "\n战斗怒吼… |cFF6dff7b猜测激活|r (预估 "..string.format("%.1f", MPGetBattleShout()).."秒)"
            else
                Text = Text .. "\n战斗怒吼… |cFF888888未发现|r"
            end
        end

        if MPWarriorOverpower() then
            Text = Text .. "\n压制… |cFF6dff7b激活|r"
        else
            Text = Text .. "\n压制… |cFF888888未激活|r"
        end

        if MPWarriorCounterAttack() then
            Text = Text .. "\n复仇… |cFF6dff7b激活|r"
        else
            Text = Text .. "\n复仇… |cFF888888未激活|r"
        end

        if MP_SuperWoW then
            if MPWarriorRend() and a then
                Text = Text .. "\n撕裂… |cFF6dff7b激活|r" --..string.format("%.1f", 21-(GetTime()-MPGetWarriorRendValue(guid)))
            else
                Text = Text .. "\n撕裂… |cFF888888未激活|r"
            end
        else
            Text = Text .. "\n撕裂… |cFF888888未发现SuperWoW|r"
        end

        Text = Text .. "\n英勇/顺劈阈值… "..MPWarrorYYNQ





    -- 盗贼
    elseif englishClass == "ROGUE" then
        Text = Text .. "\n|cFFAAAAAA - 动态监控状态 - |r\n"

        if MPRogueSurpriseStrike() then
            Text = Text .. "\n突袭… |cFF6dff7b激活|r"
        else
            Text = Text .. "\n突袭… |cFF888888未激活|r"
        end

        if MPGetRogueSlice() then
            if MP_SuperWoW then
                Text = Text .. "\n切割… "..string.format("%.1f", (MPRogueSliceDuration-(GetTime()-MPSliceTimer)))
            else
                Text = Text .. "\n切割… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n切割… |cFF888888未激活|r"
        end

        if MPGetRogueBloody() then
            if MP_SuperWoW then
                Text = Text .. "\n割裂… "..string.format("%.1f", (MPRogueBloodyDuration-(GetTime()-MPBloodyTimer)))
            else
                Text = Text .. "\n割裂… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n割裂… |cFF888888未激活|r"
        end


        if MPGetRogueEnvenom() then
            if MP_SuperWoW then
                Text = Text .. "\n毒伤… "..string.format("%.1f", (MPRogueEnvenomDuration-(GetTime()-MPEnvenomTimer)))
            else
                Text = Text .. "\n毒伤… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n毒伤… |cFF888888未激活|r"
        end


        if MPGetExposeArmorDot() then
            if MP_SuperWoW then
                local check = MPGetExposeArmorCheck()
                if check[guid] then
                    Text = Text .. "\n破甲… "..string.format("%.1f", (30-(GetTime()-check[guid])) ).." ("..MPExposeArmorCombo.."星)"
                end
            else
                Text = Text .. "\n破甲… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n破甲… |cFF888888未激活|r"
        end






    -- 萨满
    elseif englishClass == "SHAMAN" then
        Text = Text .. "\n|cFFAAAAAA - 动态监控状态 - |r\n"

        local x, y = GetPlayerMapPosition("player")

        if MPEarthTotem() then
            Text = Text .. "\n大地图腾… ("..MPEarthTotemName..") "..string.format("%.1f", (MPEarthTotemDuration-(GetTime()-MPEarthTotemTimer)))
            --Text = Text .. "\n大地图腾距离… "..string.format("%.1f",  MPCalculateTotemDistance(x,y, MPEarthTotemX, MPEarthTotemY))
        else
            Text = Text .. "\n大地图腾… |cFF888888未激活|r"
            --Text = Text .. "\n大地图腾距离… |cFF888888未激活|r"
        end

        if MPFireTotem() then
            Text = Text .. "\n火焰图腾… ("..MPFireTotemName..") "..string.format("%.1f", (MPFireTotemDuration-(GetTime()-MPFireTotemTimer)))
            --Text = Text .. "\n火焰图腾距离… "..string.format("%.1f",  MPCalculateTotemDistance(x,y, MPFireTotemX, MPFireTotemY))
        else
            Text = Text .. "\n火焰图腾… |cFF888888未激活|r"
            --Text = Text .. "\n火焰图腾距离… |cFF888888未激活|r"
        end

        if MPWaterTotem() then
            Text = Text .. "\n水之图腾… ("..MPWaterTotemName..") "..string.format("%.1f", (MPWaterTotemDuration-(GetTime()-MPWaterTotemTimer)))
            --Text = Text .. "\n水之图腾距离… "..string.format("%.1f",  MPCalculateTotemDistance(x,y, MPWaterTotemX, MPWaterTotemY))
        else
            Text = Text .. "\n水之图腾… |cFF888888未激活|r"
            --Text = Text .. "\n水之图腾距离… |cFF888888未激活|r"
        end

        if MPAirTotem() then
            Text = Text .. "\n空气图腾… ("..MPAirTotemName..") "..string.format("%.1f", (MPAirTotemDuration-(GetTime()-MPAirTotemTimer)))
            --Text = Text .. "\n空气图腾距离… "..string.format("%.1f",  MPCalculateTotemDistance(x,y, MPAirTotemX, MPAirTotemY))
        else
            Text = Text .. "\n空气图腾… |cFF888888未激活|r"
            --Text = Text .. "\n空气图腾距离… |cFF888888未激活|r"
        end

        if MPGetFlameShockDot() then
            if MP_SuperWoW then
                local check = MPGetFlameShockCheck()
                if check[guid] then
                    Text = Text .. "\n烈焰震击… "..string.format("%.1f", MPShamanFlameShockDuration-(GetTime()-check[guid]))
                else
                    Text = Text .. "\n烈焰震击… |cFF888888未激活|r"
                end
            else
                Text = Text .. "\n烈焰震击… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n烈焰震击… |cFF888888未激活|r"
        end





    -- 术士
    elseif englishClass == "WARLOCK" then
        Text = Text .. "\n|cFFAAAAAA - 动态监控状态 - |r\n"

        if MPGetCurseAgonyDot() then
            if MP_SuperWoW then
                local check = MPGetCurseAgonyCheck()
                if check[guid] then
                    Text = Text .. "\n痛苦诅咒… "..string.format("%.1f", MPCurseAgonyDuration-(GetTime()-check[guid]))
                else
                    Text = Text .. "\n痛苦诅咒… |cFF888888未激活 (持续:"..MPCurseAgonyDuration.."秒)|r"
                end
            else
                Text = Text .. "\n痛苦诅咒… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n痛苦诅咒… |cFF888888未激活 (持续:"..MPCurseAgonyDuration.."秒)|r"
        end

        if MPGetCorruptionDot() then
            if MP_SuperWoW then
                local check = MPGetCorruptionCheck()
                if check[guid] then
                    Text = Text .. "\n腐蚀术… "..string.format("%.1f", MPWarlockCorruptionDuration-(GetTime()-check[guid]))
                else
                    Text = Text .. "\n腐蚀术… |cFF888888未激活 (持续:"..MPWarlockCorruptionDuration.."秒)|r"
                end
            else
                Text = Text .. "\n腐蚀术… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n腐蚀术… |cFF888888未激活 (持续:"..MPWarlockCorruptionDuration.."秒)|r"
        end

        if MPGetSiphonLifeDot() then
            if MP_SuperWoW then
                local check = MPGetSiphonLifeCheck()
                if check[guid] then
                    Text = Text .. "\n生命虹吸… "..string.format("%.1f", MPWarlockSiphonLifeDuration-(GetTime()-check[guid]))
                else
                    Text = Text .. "\n生命虹吸… |cFF888888未激活 (持续:"..MPWarlockSiphonLifeDuration.."秒)|r"
                end
            else
                Text = Text .. "\n生命虹吸… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n生命虹吸… |cFF888888未激活 (持续:"..MPWarlockSiphonLifeDuration.."秒)|r"
        end

        if MPGetImmolateDot() then
            if MP_SuperWoW then
                local check = MPGetImmolateCheck()
                if check[guid] then
                    Text = Text .. "\n献祭… "..string.format("%.1f", MPWarlockImmolateDuration-(GetTime()-check[guid]))
                else
                    Text = Text .. "\n献祭… |cFF888888未激活 (持续:"..MPWarlockImmolateDuration.."秒)|r"
                end
            else
                Text = Text .. "\n献祭… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n献祭… |cFF888888未激活 (持续:"..MPWarlockImmolateDuration.."秒)|r"
        end



        if MPGetWarlockChanneled()>0 then
            Text = Text .. "\n引导技能… |cFF6dff7b"..string.format("%.1f", MPGetWarlockChanneled()).."|r"
        else
            Text = Text .. "\n引导技能… |cFF888888未激活|r"
        end

        if MPGetPotential() then
            Text = Text .. "\n释放潜力… "..MPGetPotentialLayer().."层 |cFF6dff7b"..string.format("%.1f", 20-(GetTime()-MPGetPotentialTimer())).."|r"
        else
            Text = Text .. "\n释放潜力… |cFF888888未激活|r"
        end

        Text = Text .. "\n大诅咒… "
        local count = 0
        -- 大诅咒
        if MPBuff("鲁莽诅咒","target") then
            Text = Text .. "|cFF6dff7b鲁莽诅咒|r"
            count = 1
        end

        if MPBuff("元素诅咒","target") then
            Text = Text .. "|cFF6dff7b元素诅咒|r"
            count = 1
        end

        if MPBuff("暗影诅咒","target") then
            Text = Text .. "|cFF6dff7b暗影诅咒|r"
            count = 1
        end

        if MPBuff("语言诅咒","target") then
            Text = Text .. "|cFF6dff7b语言诅咒|r"
            count = 1
        end

        if count==0 then
            Text = Text .. "|cFF888888未激活|r"
        end



    -- 法师
    elseif englishClass == "MAGE" then

        if MPGetMageArcaneSurge() then
            Text = Text .. "\n奥术涌动… |cFF6dff7b激活|r"
        else
            Text = Text .. "\n奥术涌动… |cFF888888未激活|r"
        end

        local fslj = 0
        fslj = MPGetBuffApplications("Interface\\Icons\\Ability_Mage_Firestarter")
        if fslj>0 then
            Text = Text .. "\n法术连击… |cFF6dff7b"..fslj.."|r"
        else
            Text = Text .. "\n法术连击… |cFF888888未激活|r"
        end


        --[[
        if MPGetFireDot() then
            if MP_SuperWoW then
                local check = MPGetScorchCheck()
                local layer = MPGetFireVulnerabilityLayer()
                if check[guid] then
                    Text = Text .. "\n火焰易伤… "..string.format("%.1f", 30-(GetTime()-check[guid])).." ( "..layer[guid].."层 )"
                end
            else
                local yishang = 0
                yishang = MPGetDebuffApplications("Interface\\Icons\\Spell_Fire_SoulBurn", "target")
                if yishang>0 then
                    Text = Text .. "\n火焰易伤… |cFF6dff7b"..yishang.."|r"
                else
                    Text = Text .. "\n火焰易伤… |cFF888888未激活|r"
                end
                --Text = Text .. "\n火焰易伤… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n火焰易伤… |cFF888888未激活|r"
        end
        ]]
        local yishang = 0
        yishang = MPGetDebuffApplications("Interface\\Icons\\Spell_Fire_SoulBurn", "target")
        if yishang>0 then
            Text = Text .. "\n火焰易伤… |cFF6dff7b"..yishang.."|r"
        else
            Text = Text .. "\n火焰易伤… |cFF888888未激活|r"
        end

        if GetMageArcaneMissiles()>0 then
            Text = Text .. "\n引导… |cFF6dff7b"..string.format("%.1f", GetMageArcaneMissiles()).."|r"
        else
            Text = Text .. "\n引导… |cFF888888未激活|r"
        end





    -- 牧师
    elseif englishClass == "PRIEST" then

        if MPGetPainDot() then
            if MP_SuperWoW then
                local check = MPGetPainCheck()
                if check[guid] then
                    Text = Text .. "\n暗言术：痛… "..string.format("%.1f", MPPainDuration-(GetTime()-check[guid]))
                end
            else
                Text = Text .. "\n暗言术：痛… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n暗言术：痛… |cFF888888未激活 (持续:"..MPPainDuration.."秒)|r"
        end

        if MPGetPriestChanneled()>0 then
            Text = Text .. "\n精神鞭笞… |cFF6dff7b"..string.format("%.1f", MPGetPriestChanneled()).."|r"
        else
            Text = Text .. "\n精神鞭笞… |cFF888888未激活|r"
        end

        if MPGetPriestMindFlayCount() > 0 then
            Text = Text .. "\n鞭笞阶段… |cFF6dff7b"..MPGetPriestMindFlayCount().."|r"
        else
            Text = Text .. "\n鞭笞阶段… |cFF888888未激活|r"
        end


        if MPGetVampiricDot() then
            if MP_SuperWoW then
                local check = MPGetVampiricCheck()
                if check[guid] then
                    Text = Text .. "\n吸血鬼的拥抱… "..string.format("%.1f", 60-(GetTime()-check[guid]))
                end
            else
                Text = Text .. "\n吸血鬼的拥抱… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n吸血鬼的拥抱… |cFF888888未激活|r"
        end

        if MPGetHolyFireDot() then
            if MP_SuperWoW then
                Text = Text .. "\n神圣之火… "..string.format("%.1f", MPGetHolyFireCheck(guid))
            else
                Text = Text .. "\n神圣之火… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n神圣之火… |cFF888888未激活|r"
        end



    -- 猎人
    elseif englishClass == "HUNTER" then

        Text = Text .. "\n自动射击… "..string.format("%.1f", MPGetHunterShotLeft())..""

        if MPGetSerpentStingDot() then
            if MP_SuperWoW then
                local check = MPGetSerpentStingCheck()
                if check[guid] then
                    Text = Text .. "\n毒蛇钉刺… "..string.format("%.1f", 15-(GetTime()-check[guid]))
                end
            else
                Text = Text .. "\n毒蛇钉刺… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n毒蛇钉刺… |cFF888888未激活|r"
        end

        if MPGetViperStingDot() then
            if MP_SuperWoW then
                local check = MPGetViperStingCheck()
                if check[guid] then
                    Text = Text .. "\n蝰蛇钉刺… "..string.format("%.1f", 8-(GetTime()-check[guid]))
                end
            else
                Text = Text .. "\n蝰蛇钉刺… |cFF6dff7b激活|r"
            end
        else
            Text = Text .. "\n蝰蛇钉刺… |cFF888888未激活|r"
        end

        if MPGetHunterGoreAllow() then
            Text = Text .. "\n割伤… |cFF6dff7b激活|r "..string.format("%.1f", MPHunterGoreTimer-GetTime())
        else
            Text = Text .. "\n割伤… |cFF888888未激活|r"
        end

        --[[
        if GetTime()-MPHunterBaitShotTimer<0 then
            Text = Text .. "\n诱饵射击… |cFF6dff7b激活|r "..string.format("%.1f", MPHunterBaitShotTimer-GetTime())
        else
            Text = Text .. "\n诱饵射击… |cFF888888未激活|r"
        end
        ]]



    else
        Text = Text .. "\n|cFF888888暂未有与之匹配的宏参数|r"
    end


    MPUIcontentText:SetText(Text)
end


function MPCatUISliderRegionHide(slider)
    local region1, region2, region3, region4,region5,region6,region7,region8,region9 = slider:GetRegions()
    if region4 then region4:Hide() end
    if region5 then region5:Hide() end
    if region6 then region6:Hide() end
    if region7 then region7:Hide() end
    if region8 then region8:Hide() end
    if region9 then region9:Hide() end

    _G[slider:GetName().."Low"]:Hide()
    _G[slider:GetName().."High"]:Hide()

end


function MPCreateFrame(addonname, fwidth, fheight, titlestr)
    -- 创建主框架
    local valueWindow = CreateFrame("Frame", addonname, UIParent)
    valueWindow:Hide()

    --tinsert(UISpecialFrames, addonname)

    -- 设置窗口基本属性
    valueWindow:SetWidth(fwidth)   -- 520
    valueWindow:SetHeight(fheight)
    valueWindow:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    valueWindow:SetFrameLevel(1)

    -- 创建Tooltip风格的背景和边框
    valueWindow:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    valueWindow:SetBackdropColor(0.1, 0.1, 0.2, 0.85)
    valueWindow:SetScale(0.9)

    -- 使窗口可移动
    valueWindow:EnableMouse(true)
    valueWindow:SetMovable(true)
    valueWindow:RegisterForDrag("LeftButton")
    valueWindow:SetScript("OnDragStart", function()
        valueWindow:StartMoving()
    end)
    valueWindow:SetScript("OnDragStop", function()
        valueWindow:StopMovingOrSizing()
    end)

    -- 添加标题文字
    local title = valueWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", valueWindow, "TOP", 0, -11)
    title:SetText(titlestr)
    title:SetJustifyH("CENTER")

    local cr = valueWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    cr:SetPoint("TOPLEFT", valueWindow, "TOPLEFT", 10, -12)
    cr:SetFont("Fonts\\FRIZQT__.TTF", 12)
    cr:SetText("\67\97\116\32\229\150\181\239\188\129")

    -- 添加标准关闭按钮
    local closeButton = CreateFrame("Button", nil, valueWindow, "UIPanelCloseButton")
    closeButton:SetWidth(32)
    closeButton:SetHeight(32)
    closeButton:SetPoint("TOPRIGHT", valueWindow, "TOPRIGHT", -5, -2)

    local addButton = CreateFrame("Button", nil, valueWindow, "UIPanelButtonTemplate")
    addButton:SetWidth(54)
    addButton:SetHeight(20)
    addButton:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    addButton:SetPoint("TOPRIGHT", valueWindow, "TOPRIGHT", -55, -8)
    addButton:SetText("放大 +")
    addButton:SetScript("OnClick", function(self)
        local parent = this:GetParent()
        local scale = parent:GetScale()+0.1
        if scale < 2.0 then
            parent:SetScale( scale )
        end
    end)

    local decButton = CreateFrame("Button", nil, valueWindow, "UIPanelButtonTemplate")
    decButton:SetWidth(54)
    decButton:SetHeight(20)
    decButton:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    decButton:SetPoint("TOPRIGHT", valueWindow, "TOPRIGHT", -115, -8)
    decButton:SetText("缩小 -")
    decButton:SetScript("OnClick", function(self)
        local parent = this:GetParent()
        local scale = parent:GetScale()-0.1
        if scale > 0.3 then
            parent:SetScale( scale )
        end
    end)


    -- 添加分隔线
    local divider = valueWindow:CreateTexture(nil, "ARTWORK")
    divider:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    divider:SetTexCoord(0.81, 0.94, 0.5, 1)
    divider:SetVertexColor(0.5, 0.5, 0.5)
    divider:SetWidth(fwidth-10)
    divider:SetHeight(4)
    divider:SetPoint("TOP", valueWindow, "TOP", 0, -30)

    return valueWindow
end

function MPCreateCheckButton(father, name, x, y, str)
    -- 创建单选框 - 狂怒
    local valueButon = CreateFrame("CheckButton", name, father, "UICheckButtonTemplate")
    valueButon:SetPoint("TOPLEFT", father, "TOPLEFT", x, y)
    valueButon:SetScale(0.8)

    -- 添加文字标签
    local checkText_Fury = valueButon:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    checkText_Fury:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
    checkText_Fury:SetTextColor(1, 1, 1)
    checkText_Fury:SetPoint("LEFT", valueButon, "LEFT", 34, 1)
    checkText_Fury:SetText(str)

    return valueButon
end

function MPCreateCheckButtonSmall(father, name, x, y, str)
    -- 创建单选框 - 狂怒
    local valueButon = CreateFrame("CheckButton", name, father, "UICheckButtonTemplate")
    valueButon:SetPoint("TOPLEFT", father, "TOPLEFT", x, y)
    valueButon:SetScale(0.8)

    -- 添加文字标签
    local checkText_Fury = valueButon:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    checkText_Fury:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    checkText_Fury:SetTextColor(0.8, 0.8, 0.8)
    checkText_Fury:SetPoint("LEFT", valueButon, "LEFT", 34, 1)
    checkText_Fury:SetText(str)

    return valueButon
end

function MPCreateButton(father, name, text, x, y, w, h)
    local myButton = CreateFrame("Button", name, father, "UIPanelButtonTemplate")
    myButton:SetPoint("TOPLEFT", father, "TOPLEFT", 120, -44)
    myButton:SetWidth(w)
    myButton:SetHeight(h)
    myButton:SetFont("Fonts\\FRIZQT__.TTF", 12)
    myButton:SetText(text)

    -- 调整按钮纹理
    myButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    myButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    myButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
    myButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
    return myButton
end

function MPBottomLine(father)
    local bottomline = father:CreateTexture(nil, "ARTWORK")
    bottomline:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    bottomline:SetTexCoord(0.81, 0.94, 0.5, 1)
    bottomline:SetVertexColor(0.5, 0.5, 0.5)
    bottomline:SetWidth(510)
    bottomline:SetHeight(4)
    bottomline:SetPoint("BOTTOM", father, "BOTTOM", 0, 60)
end

function MPPublicCheckButton(father, name, x, y, str)
    local checkButton = CreateFrame("CheckButton", name, father, "UICheckButtonTemplate")
    checkButton:SetPoint("BOTTOMLEFT", father, "BOTTOMLEFT", x, y)
    checkButton:SetScale(0.8)
    local checkText = checkButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    checkText:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
    checkText:SetTextColor(1, 1, 1)
    checkText:SetPoint("LEFT", checkButton, "LEFT", 34, 1)
    checkText:SetText(str)
    return checkButton
end

function MPPublicButton(father, name, text, x, y, w, h)
    local Button = CreateFrame("Button", name, father, "UIPanelButtonTemplate")
    Button:SetPoint("BOTTOMLEFT", father, "BOTTOMLEFT", x, y)
    Button:SetWidth(w)
    Button:SetHeight(h)
    Button:SetFont("Fonts\\FRIZQT__.TTF", 12)
    Button:SetText(text)
    Button:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    Button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
    Button:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
    Button:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
    return Button
end

