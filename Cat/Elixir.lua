-- -------------------------------------
-- 乌龟服 - 自动药剂一键宏
-- 发布日期：2026-04-23 （后面根据时间来判断版本）
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
--
-- 必要条件：SuperWoW
--
-- 打断宏，必须开启SuperWoW
--
-- -------------------------------------
--
-- 功能配置：

-- 以下功能开关：1开启 0关闭

-- -------------------------------------


local function MPElixirMsg(text)

	if MPElixirSaved.Msg==1 then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor..""..text)
	else
		MPMsg(text)
	end
end

function MPCatElixir()

	-- 总开关
	if MPElixirSaved.Use==0 then
		return
	end

	-- 进战斗开关
	if MPElixirSaved.Combat==1 and not MPInCombat then
		return
	end

	local min = MPElixirSaved.LeftTime * 60

	-- 独特药剂 --

	if MPElixirSaved.ZanzaSpeed==1 and MPBuffTime("赞扎之速")<min then
		MPElixirMsg("使用：赞扎之速")
		MPUseItemByName("赞扎之速")
	end
	if MPElixirSaved.ArthasGift==1 and MPBuffTime("阿尔萨斯的礼物")<min then
		MPElixirMsg("使用：阿尔萨斯的礼物")
		MPUseItemByName("阿尔萨斯的礼物")
	end

	-- 生存药剂 --

	if MPElixirSaved.ZanzaSpirit==1 and MPBuffTime("赞扎之魂")<min then
		MPElixirMsg("使用：赞扎之魂")
		MPUseItemByName("赞扎之魂")
	end
	if MPElixirSaved.Fortitude==1 and MPBuffTime("生命 II")<min then
		MPElixirMsg("使用：坚韧药剂")
		MPUseItemByName("坚韧药剂")
	end
	if MPElixirSaved.MedivhWine==1 and MPBuffTime("麦迪文的葡萄酒")<min then
		if not MPGetCast() then
			MPElixirMsg("使用：麦迪文的葡萄酒")
			MPUseItemByName("麦迪文的葡萄酒")
		else
			MPElixirMsg("使用：麦迪文的葡萄酒 |cFFEE2222失败 - 正在施法中")
		end
	end
	if MPElixirSaved.Cocktail==1 and MPBuffTime("野猪之魂")<min then
		MPElixirMsg("使用：肺片鸡尾酒")
		MPUseItemByName("肺片鸡尾酒")
	end
	if MPElixirSaved.TrollBlood==1 and MPBuffTime("回复")<min then
		MPElixirMsg("使用：特效巨魔之血药水")
		MPUseItemByName("特效巨魔之血药水")
	end
	if MPElixirSaved.Stoneshield==1 and MPBuffTime("强效护甲")<min then
		MPElixirMsg("使用：超强防御药剂")
		MPUseItemByName("超强防御药剂")
	end

	-- 物理药剂 --

	if MPElixirSaved.Mongoose==1 and MPBuffTime("猫鼬药剂")<min then
		MPElixirMsg("使用：猫鼬药剂")
		MPUseItemByName("猫鼬药剂")
	end
	if MPElixirSaved.Agility==1 and MPBuffTime("敏捷")<min then
		MPElixirMsg("使用：敏捷药剂")
		MPUseItemByName("敏捷药剂")
	end

	-- 屠魔药剂
	if MPElixirSaved.Demon==1 and UnitExists("target") and not MPBuff("屠魔药剂") then
		local creature = UnitCreatureType("target") or "其它"
		local position = string.find("恶魔", creature)
		-- 目标是恶魔
		if position then
			if MPElixirSaved.DemonBoss==1 and MPIsBossTarget() then
				MPElixirMsg("使用：屠魔药剂")
				MPUseItemByName("屠魔药剂")
			elseif MPElixirSaved.DemonBoss==0 then
				MPElixirMsg("使用：屠魔药剂")
				MPUseItemByName("屠魔药剂")
			end
		end
	end

	if MPElixirSaved.Giants==1 and MPBuffTime("巨人药剂")<min then
		MPElixirMsg("使用：巨人药剂")
		MPUseItemByName("巨人药剂")
	end
	if MPElixirSaved.BruteForce==1 and MPBuffTime("蛮力药剂")<min then
		MPElixirMsg("使用：蛮力药剂")
		MPUseItemByName("蛮力药剂")
	end
	if MPElixirSaved.SoulEnergy==1 and MPBuffTime("魂能之力")<min then
		if MPGetItemByNameCD("魂能之力") then
			MPElixirMsg("使用：魂能之力")
            local target,guid = UnitExists("target")

            TargetUnit("player")
			MPUseItemByName("魂能之力")

            if not target then
                ClearTarget()
            else
                TargetUnit(guid)
            end
		else
			MPElixirMsg("使用：魂能之力 |cFFEE2222失败 - 物品尚未冷却")
		end
	end
	if MPElixirSaved.Firewater==1 and MPBuffTime("冬泉火酒")<min then
		MPElixirMsg("使用：冬泉火酒")
		MPUseItemByName("冬泉火酒")
	end
	if MPElixirSaved.HerbalBrew==1 and MPBuffTime("黑根酒")<min then
		MPElixirMsg("使用：黑根酒")
		MPUseItemByName("黑根酒")
	end
	if MPElixirSaved.SoulStrike==1 and MPBuffTime("魂能之击")<min then
		if MPGetItemByNameCD("魂能之击") then
			MPElixirMsg("使用：魂能之击")
            local target,guid = UnitExists("target")

            TargetUnit("player")
			MPUseItemByName("魂能之击")

            if not target then
                ClearTarget()
            else
                TargetUnit(guid)
            end
		else
			MPElixirMsg("使用：魂能之击 |cFFEE2222失败 - 物品尚未冷却")
		end
	end
	if MPElixirSaved.HyenaStimulant==1 and MPBuffTime("远古之怒")<min then
		MPElixirMsg("使用：土狼兴奋剂")
		MPUseItemByName("土狼兴奋剂")
	end
	if MPElixirSaved.Encrusted==1 and MPBuffTime("厚甲蝎之击")<min then
		MPElixirMsg("使用：厚甲蝎药粉")
		MPUseItemByName("厚甲蝎药粉")
	end


	-- 法系药剂 --

	if MPElixirSaved.DreamEssence==1 and MPBuffTime("梦境精华药剂")<min then
		MPElixirMsg("使用：梦境精华药剂")
		MPUseItemByName("梦境精华药剂")
	end
	if MPElixirSaved.ArcanePower==1 and MPBuffTime("强效奥法药剂")<min then
		MPElixirMsg("使用：强效奥法药剂")
		MPUseItemByName("强效奥法药剂")
	end
	if MPElixirSaved.Dreamshire==1 and MPBuffTime("梦通")<min then
		MPElixirMsg("使用：梦境酊剂")
		MPUseItemByName("梦境酊剂")
	end
	if MPElixirSaved.CortexPotion==1 and MPBuffTime("坚定信念")<min then
		MPElixirMsg("使用：脑皮层混合饮料")
		MPUseItemByName("脑皮层混合饮料")
	end
	if MPElixirSaved.Intellect==1 and MPBuffTime("强效智力")<min then
		MPElixirMsg("使用：强效聪颖药剂")
		MPUseItemByName("强效聪颖药剂")
	end
	if MPElixirSaved.SoulTrickery==1 and MPBuffTime("魂能之诈")<min then
		if MPGetItemByNameCD("魂能之诈") then
			MPElixirMsg("使用：魂能之诈")
            local target,guid = UnitExists("target")

            TargetUnit("player")
			MPUseItemByName("魂能之诈")

            if not target then
                ClearTarget()
            else
                TargetUnit(guid)
            end
		else
			MPElixirMsg("使用：魂能之诈 |cFFEE2222失败 - 物品尚未冷却")
		end
	end
	if MPElixirSaved.Firepower==1 and MPBuffTime("强效火力")<min then
		MPElixirMsg("使用：强效火力药剂")
		MPUseItemByName("强效火力药剂")
	end
	if MPElixirSaved.ShadowPower==1 and MPBuffTime("暗影强化")<min then
		MPElixirMsg("使用：暗影之力药剂")
		MPUseItemByName("暗影之力药剂")
	end
	if MPElixirSaved.FrostPower==1 and MPBuffTime("强效冰霜之力")<min then
		MPElixirMsg("使用：强效冰霜之力药剂")
		MPUseItemByName("强效冰霜之力药剂")
	end
	if MPElixirSaved.GreaterArcanePower==1 and MPBuffTime("强效奥术之力")<min then
		MPElixirMsg("使用：强效奥术之力药剂")
		MPUseItemByName("强效奥术之力药剂")
	end
	if MPElixirSaved.NaturePower==1 and MPBuffTime("强效自然力量药剂")<min then
		MPElixirMsg("使用：强效自然之力药水")
		MPUseItemByName("强效自然之力药水")
	end
	if MPElixirSaved.FelMana==1 and MPBuffTimeFromTex("Interface\\Icons\\INV_Potion_45")<min then
		MPElixirMsg("使用：魔血药水")
		MPUseItemByName("魔血药水")
	end
	if MPElixirSaved.MedivhBlue==1 and MPBuffTime("麦迪文的蓝标葡萄酒")<min then
		if not MPGetCast() then
			MPElixirMsg("使用：麦迪文的蓝标葡萄酒")
			MPUseItemByName("麦迪文的蓝标葡萄酒")
		else
			MPElixirMsg("使用：麦迪文的蓝标葡萄酒 |cFFEE2222失败 - 正在施法中")
		end
	end


	-- 混合 --

	if MPElixirSaved.DreamMongoose==1 and MPBuffTime("翡翠猫鼬药剂")<min then
		MPElixirMsg("使用：翡翠猫鼬药剂")
		MPUseItemByName("翡翠猫鼬药剂")
	end
	if MPElixirSaved.ArcaneGiants==1 and MPBuffTime("奥法巨人药剂")<min then
		MPElixirMsg("使用：奥法巨人药剂")
		MPUseItemByName("奥法巨人药剂")
	end
	if MPElixirSaved.DreamFirewater==1 and MPBuffTime("梦境火酒药剂")<min then
		MPElixirMsg("使用：梦境火酒药剂")
		MPUseItemByName("梦境火酒药剂")
	end


	-- 烹饪 --

	if MPBuff("进食") then
		MPElixirMsg("使用烹饪 |cFFEE2222失败 - 正在进食中")
	elseif MPPlayerIsMoving then
		local eat = MPElixirSaved.DesertDumplings + MPElixirSaved.Nutritious + MPElixirSaved.Crispy
		eat = eat + MPElixirSaved.GrilledSquid + MPElixirSaved.TerrabeMood + MPElixirSaved.TerrabeFun
		eat = eat + MPElixirSaved.TerrabeSurprise + MPElixirSaved.HerbSalad + MPElixirSaved.Dragonbreath
		if eat>= 1 then
			MPElixirMsg("使用烹饪 |cFFEE2222失败 - 正在移动中")
		end
	else
		if MPElixirSaved.DesertDumplings==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：沙漠肉丸子")
			MPUseItemByName("沙漠肉丸子")
		end
		if MPElixirSaved.Nutritious==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：营养的魔法蘑菇")
			MPUseItemByName("营养的魔法蘑菇")
		end
		if MPElixirSaved.BigFish==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：大鱼片")
			MPUseItemByName("大鱼片")
		end


		if MPElixirSaved.GrilledSquid==1 and MPBuffTime("敏捷提高")<min then
			MPElixirMsg("使用：烤鱿鱼")
			MPUseItemByName("烤鱿鱼")
		end
		if MPElixirSaved.SweetBerries==1 and MPBuffTime("敏捷提高")<min then
			MPElixirMsg("使用：酸甜的山地浆果")
			MPUseItemByName("酸甜的山地浆果")
		end
		if MPElixirSaved.Skewers==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：鱿鱼鳗串")
			MPUseItemByName("鱿鱼鳗串")
		end

		if MPElixirSaved.TerrabeMood==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：达农佐的泰拉比姆情调")
			MPUseItemByName("达农佐的泰拉比姆情调")
		end
		if MPElixirSaved.TerrabeFun==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：达农佐的泰拉比姆趣味")
			MPUseItemByName("达农佐的泰拉比姆趣味")
		end
		if MPElixirSaved.TerrabeSurprise==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：达农佐的泰拉比姆惊喜")
			MPUseItemByName("达农佐的泰拉比姆惊喜")
		end

		if MPElixirSaved.NightfinSoup==1 and MPBuffTimeFromTex("Interface\\Icons\\Spell_Nature_ManaRegenTotem")<min then
			MPElixirMsg("使用：夜鳞鱼汤")
			MPUseItemByName("夜鳞鱼汤")
		end
		if MPElixirSaved.SmokedPerch==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：烟熏鲈鱼")
			MPUseItemByName("烟熏鲈鱼")
		end
		if MPElixirSaved.HerbSalad==1 and MPBuffTime("提高治疗")<min then
			MPElixirMsg("使用：强能草药沙拉")
			MPUseItemByName("强能草药沙拉")
		end

		if MPElixirSaved.Crispy==1 and MPBuffTime("耐力提高")<min then
			MPElixirMsg("使用：香脆的魔法蘑菇")
			MPUseItemByName("香脆的魔法蘑菇")
		end
		if MPElixirSaved.Chimera==1 and MPBuffTime("强化耐力")<min then
			MPElixirMsg("使用：迪尔格的超美味奇美拉肉片")
			MPUseItemByName("迪尔格的超美味奇美拉肉片")
		end
		if MPElixirSaved.Seafood==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：深海炖菜")
			MPUseItemByName("深海炖菜")
		end

		if MPElixirSaved.CookedFish==1 and MPBuffTime("进食充分")<min then
			MPElixirMsg("使用：煮熟的光滑大鱼")
			MPUseItemByName("煮熟的光滑大鱼")
		end
		if MPElixirSaved.Dragonbreath==1 and MPBuffTime("龙息红椒")<min then
			MPElixirMsg("使用：龙息红椒")
			MPUseItemByName("龙息红椒")
		end
	end

	-- 武器附魔 --

    if MPCheckUIStatus() then
        MPElixirMsg("|cFFEE2222你正与NPC交互，无法自动武器附魔！")
        return
    end

	local Value = 0

	-- 元素磨刀石
	if MPElixirSaved.ElementalStone==1 then
		local fumo, text = MPIsItemEntry(16, "致命一击 %+2")
		if text then
			local str = MPMatch(text, "（(%d+)分钟）")
			Value = MPToNumber( str ) * 60
		end

		if GetInventoryItemLink("player", 16) and Value<min then
			MPElixirMsg("使用：元素磨刀石 (主手)")
			if not MPUseItemByName("元素磨刀石") then
				return
			end
			PickupInventoryItem(16)
			MPClickReplace()
			ClearCursor()
		end

		fumo, text = MPIsItemEntry(17, "致命一击 %+2")
		if text then
			local str = MPMatch(text, "（(%d+)分钟）")
			Value = MPToNumber( str ) * 60
		end

		if GetInventoryItemLink("player", 17) and Value<min then
			MPElixirMsg("使用：元素磨刀石 (副手)")
			if not MPUseItemByName("元素磨刀石") then
				return
			end
			PickupInventoryItem(17)
			MPClickReplace()
			ClearCursor()
		end
	end

	-- 神圣磨刀石
	if MPElixirSaved.SacredStone==1 then
		local fumo, text = MPIsItemEntry(16, "攻击强度vs亡灵")
		if text then
			local str = MPMatch(text, "（(%d+)分钟）")
			Value = MPToNumber( str ) * 60
		end

		if GetInventoryItemLink("player", 16) and Value<min then
			MPElixirMsg("使用：神圣磨刀石 (主手)")
			if not MPUseItemByName("神圣磨刀石") then
				return
			end
			PickupInventoryItem(16)
			MPClickReplace()
			ClearCursor()
		end

		fumo, text = MPIsItemEntry(17, "攻击强度vs亡灵")
		if text then
			local str = MPMatch(text, "（(%d+)分钟）")
			Value = MPToNumber( str ) * 60
		end

		if GetInventoryItemLink("player", 17) and Value<min then
			MPElixirMsg("使用：神圣磨刀石 (副手)")
			if not MPUseItemByName("神圣磨刀石") then
				return
			end
			PickupInventoryItem(17)
			MPClickReplace()
			ClearCursor()
		end
	end

	-- 神圣巫师之油
	if MPElixirSaved.SacredOil==1 then
		local fumo, text = MPIsItemEntry(16, "法术伤害vs亡灵")
		if text then
			local str = MPMatch(text, "（(%d+)分钟）")
			Value = MPToNumber( str ) * 60
		end

		if GetInventoryItemLink("player", 16) and Value<min then
			MPElixirMsg("使用：神圣巫师之油")
			if not MPUseItemByName("神圣巫师之油") then
				return
			end
			PickupInventoryItem(16)
			MPClickReplace()
			ClearCursor()
		end
	end

	-- 卓越巫师之油
	if MPElixirSaved.WizardOil==1 then
		local fumo, text = MPIsItemEntry(16, "卓越巫师之油")
		if text then
			local str = MPMatch(text, "（(%d+)分钟）")
			Value = MPToNumber( str ) * 60
		end

		if GetInventoryItemLink("player", 16) and Value<min then
			MPElixirMsg("使用：卓越巫师之油")
			if not MPUseItemByName("卓越巫师之油") then
				return
			end
			PickupInventoryItem(16)
			MPClickReplace()
			ClearCursor()
		end
	end

	-- 卓越法力之油
	if MPElixirSaved.ManaOil==1 then
		local fumo, text = MPIsItemEntry(16, "卓越法力之油")
		if text then
			local str = MPMatch(text, "（(%d+)分钟）")
			Value = MPToNumber( str ) * 60
		end

		if GetInventoryItemLink("player", 16) and Value<min then
			MPElixirMsg("使用：卓越法力之油")
			if not MPUseItemByName("卓越法力之油") then
				return
			end
			PickupInventoryItem(16)
			MPClickReplace()
			ClearCursor()
		end
	end

end
