-- -------------------------------------
-- 乌龟服 - TWT仇恨相关
-- 更新日期：2025-10-21 
-- 发布者：妖姬变 - 卡拉赞 - 亚服
-- 有问题游戏里或者kook-德鲁伊频道交流
-- -------------------------------------
--



function MPGetHatredFromTWT()

	-- TWT是否存在
	if TWT then
		-- 安全验证
		if TWT.name and TWT.threats then
			if TWT.threats[TWT.name] and TWT.threats[TWT.name].perc then
				return TWT.round(TWT.threats[TWT.name].perc)
			end
		end

		return 0
	end

	return -1

end



	--print(TWT.name)
	--message(TWT.round(TWT.threats[TWT.name].perc))
	--[[ 其他人
	for name, data in TWT.threats do
		print(name)
		message(TWT.round(data.perc))
		return
	end
	]]


