-- -------------------------------------
-- 乌龟服 - 自动拾取一键宏
-- 发布日期：2025-12-20 （后面根据时间来判断版本）
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
--
-- 必要条件：Interact.dll
--
--
-- -------------------------------------
--
-- 功能配置：


-- -------------------------------------



function MPAutoLoot()

    if MPPublicSaved.AutoLoot==0 then
        return
    end

    -- 检测是否有Interact模组
    if not MP_Interact then
        --DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."未加载Interact模组，自动拾取功能无效。|r")
        return 
    end

    if UnitExists("target") then

        if UnitIsDeadOrGhost("target") then
            ClearTarget()
            return
        end

        if MPGetTargetDistance() then
            return
        end
    end

    pcall(function()
        if InteractNearest then
            InteractNearest(1)
        else
            UnitXP("interact", 1)
        end
    end)

end


