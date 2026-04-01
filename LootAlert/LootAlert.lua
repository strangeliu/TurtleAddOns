-- 拾取提示插件 for WoW 1.12
-- 在屏幕上显示拾取的物品

-- 玩家信息（用于验证拾取消息）
local PLAYER_NAME = UnitName("player")
-- Turtle WoW GUID 获取（参考 ClassicFCT_Nameplate）
-- 在 Turtle WoW 中，UnitExists 返回两个值：(exists, guid)
local PLAYER_GUID = nil
if UnitGUID then
    -- 标准方法（零售版）
    PLAYER_GUID = UnitGUID("player")
elseif UnitExists then
    -- Turtle WoW 方法：UnitExists 的第二个返回值是 GUID
    local exists, guid = UnitExists("player")
    if guid and type(guid) == "string" and strlen(guid) > 0 then
        PLAYER_GUID = guid
    end
end

-- 检测可用的库功能（延迟检测，在插件加载后）
local hasMyLib = false
local hasSuperWoW = false
local hasLSM = false
local LSM = nil

-- 检测函数（在插件加载后调用）
local function DetectLibraries()
	-- 检测 !MyLib（通过检查特征函数）
	-- 修正：HexColors 不存在，改为检查 RAID_CLASS_COLORS
	if GetItemInfoByName and Over1E3toK and RAID_CLASS_COLORS then
		hasMyLib = true
	end
	
	-- 检测 SuperWoW
	if SUPERWOW_VERSION then
		hasSuperWoW = true
	end
	
	-- 检测 LibSharedMedia-3.0
	if AceLibrary and AceLibrary.HasInstance and AceLibrary:HasInstance("LibSharedMedia-3.0") then
		LSM = AceLibrary("LibSharedMedia-3.0")
		hasLSM = true
	end
end

-- 兼容性修复：为旧版本添加缺失的函数
if not wipe then
	wipe = function(tbl)
		for k in pairs(tbl) do
			tbl[k] = nil
		end
		return tbl
	end
end

-- string.match 兼容性包装（优先使用 !MyLib 的版本）
local string_match
if hasMyLib and string.match then
	-- 使用 !MyLib 的 string.match（Lua 5.1 兼容）
	string_match = string.match
else
	-- 备用方案：1.12 中使用 strfind
	string_match = function(str, pattern)
		local _, _, captured = strfind(str, pattern)
		return captured
	end
end

-- 数字格式化函数（优先使用 !MyLib 的版本）
local FormatLargeNumber
if hasMyLib and Over1E3toK then
	-- 使用 !MyLib 的 Over1E3toK（显示为"万"）
	FormatLargeNumber = Over1E3toK
else
	-- 备用方案：直接显示数字
	FormatLargeNumber = function(num)
		return tostring(num)
	end
end

-- 金币格式化函数（WoW 1.12 兼容）
local function FormatMoney(amount)
	-- 处理负数（参考 ls_Toasts）
	local absAmount = math.abs(amount)
	local gold = math.floor(absAmount / 10000)
	local silver = math.floor(math.mod(absAmount, 10000) / 100)
	local copper = math.mod(absAmount, 100)
	
	local text = ""
	if gold > 0 then
		text = text .. gold .. "金 "
	end
	if silver > 0 then
		text = text .. silver .. "银 "
	end
	if copper > 0 or text == "" then
		text = text .. copper .. "铜"
	end
	
	return text
end

-- 根据金额获取对应的金币图标
local function GetMoneyIcon(amount)
	-- 处理负数（使用绝对值判断图标）
	local absAmount = math.abs(amount)
	local gold = math.floor(absAmount / 10000)
	local silver = math.floor(math.mod(absAmount, 10000) / 100)
	
	if gold > 0 then
		-- 有金币，显示金币图标
		return "Interface\\Icons\\INV_Misc_Coin_01"
	elseif silver > 0 then
		-- 只有银币，显示银币图标
		return "Interface\\Icons\\INV_Misc_Coin_03"
	else
		-- 只有铜币，显示铜币图标
		return "Interface\\Icons\\INV_Misc_Coin_05"
	end
end

-- 线性插值函数
local function lerp(v1, v2, perc)
	return v1 + (v2 - v1) * perc
end

-- ========== 自定义边框系统（完全模仿 ls_Toasts）==========
local sections = {"TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT", "TOP", "BOTTOM", "LEFT", "RIGHT"}

-- 边框样式配置（完全模仿 ls_Toasts 的皮肤系统）
local BORDER_STYLES = {
    ["default"] = {
        name = "默认",
        toast_border = {
            texture = "Interface\\AddOns\\LootAlert\\assets\\toast-border",
            offset = -6,
            size = 16,
        },
        icon_border = {
            texture = "Interface\\AddOns\\LootAlert\\assets\\icon-border",
            offset = -4,
            size = 16,
        },
    },
    ["beautycase"] = {
        name = "美化",
        toast_border = {
            texture = "Interface\\AddOns\\LootAlert\\assets\\toast-border-beautycase",
            offset = -4,
            size = 16,
        },
        icon_border = {
            texture = "Interface\\AddOns\\LootAlert\\assets\\icon-border",
            offset = -4,
            size = 16,
        },
    },
    ["azerite"] = {
        name = "艾泽里特（粗边框）",
        toast_border = {
            texture = "Interface\\AddOns\\LootAlert\\assets\\toast-border-azerite",
            offset = -16,
            size = 32,
        },
        icon_border = {
            texture = "Interface\\AddOns\\LootAlert\\assets\\icon-border-azerite",
            offset = -4,
            size = 16,
        },
    },
    ["elv"] = {
        name = "ElvUI（极简）",
        toast_border = {
            texture = nil,  -- 使用纯色，不用纹理
            color = {0, 0, 0, 1},  -- 黑色
            offset = 0,
            size = 1,
        },
        icon_border = {
            texture = nil,  -- 使用纯色，不用纹理
            color = {0, 0, 0, 1},  -- 黑色
            offset = 0,
            size = 1,
        },
    },
}

local function border_SetOffset(self, offset)
	self.offset = offset
	self.TOPLEFT:SetPoint("BOTTOMRIGHT", self.parent, "TOPLEFT", -offset, offset)
	self.TOPRIGHT:SetPoint("BOTTOMLEFT", self.parent, "TOPRIGHT", offset, offset)
	self.BOTTOMLEFT:SetPoint("TOPRIGHT", self.parent, "BOTTOMLEFT", -offset, -offset)
	self.BOTTOMRIGHT:SetPoint("TOPLEFT", self.parent, "BOTTOMRIGHT", offset, -offset)
end

local function border_SetTexture(self, texture)
	self.calcTile = true
	for i, v in ipairs(sections) do
		if i > 4 then
			self[v]:SetTexture(texture, "REPEAT", "REPEAT")
		else
			self[v]:SetTexture(texture)
		end
	end
end

local function border_SetSize(self, size)
	if size < 1 then
		size = 1
	end
	
	self.size = size
	-- WoW 1.12 使用 SetWidth/SetHeight 代替 SetSize
	self.TOPLEFT:SetWidth(size)
	self.TOPLEFT:SetHeight(size)
	self.TOPRIGHT:SetWidth(size)
	self.TOPRIGHT:SetHeight(size)
	self.BOTTOMLEFT:SetWidth(size)
	self.BOTTOMLEFT:SetHeight(size)
	self.BOTTOMRIGHT:SetWidth(size)
	self.BOTTOMRIGHT:SetHeight(size)
	self.TOP:SetHeight(size)
	self.BOTTOM:SetHeight(size)
	self.LEFT:SetWidth(size)
	self.RIGHT:SetWidth(size)
	
	if self.calcTile then
		local tile = (self.parent:GetWidth() + 2 * self.offset) / 16
		self.TOP:SetTexCoord(0.25, tile, 0.375, tile, 0.25, 0, 0.375, 0)
		self.BOTTOM:SetTexCoord(0.375, tile, 0.5, tile, 0.375, 0, 0.5, 0)
		
		tile = (self.parent:GetHeight() + 2 * self.offset) / 16
		self.LEFT:SetTexCoord(0, 0.125, 0, tile)
		self.RIGHT:SetTexCoord(0.125, 0.25, 0, tile)
	end
end

local function border_Hide(self)
	for _, v in ipairs(sections) do
		self[v]:Hide()
	end
end

local function border_Show(self)
	for _, v in ipairs(sections) do
		self[v]:Show()
	end
end

local function border_SetVertexColor(self, r, g, b, a)
	for _, v in ipairs(sections) do
		self[v]:SetVertexColor(r, g, b, a)
	end
end

local function createBorder(parent, drawLayer, drawSubLevel)
	local border = {
		calcTile = true,
		offset = 0,
		parent = parent,
		size = 1,
	}
	
	for _, v in ipairs(sections) do
		border[v] = parent:CreateTexture(nil, drawLayer or "OVERLAY", nil, drawSubLevel or 1)
		-- SetTexelSnappingBias 和 SetSnapToPixelGrid 在 WoW 1.12 中不存在，移除
	end
	
	border.TOPLEFT:SetTexCoord(0.5, 0.625, 0, 1)
	border.TOPLEFT:SetPoint("BOTTOMRIGHT", parent, "TOPLEFT", 0, 0)
	
	border.TOPRIGHT:SetTexCoord(0.625, 0.75, 0, 1)
	border.TOPRIGHT:SetPoint("BOTTOMLEFT", parent, "TOPRIGHT", 0, 0)
	
	border.BOTTOMLEFT:SetTexCoord(0.75, 0.875, 0, 1)
	border.BOTTOMLEFT:SetPoint("TOPRIGHT", parent, "BOTTOMLEFT", 0, 0)
	
	border.BOTTOMRIGHT:SetTexCoord(0.875, 1, 0, 1)
	border.BOTTOMRIGHT:SetPoint("TOPLEFT", parent, "BOTTOMRIGHT", 0, 0)
	
	border.TOP:SetPoint("TOPLEFT", border.TOPLEFT, "TOPRIGHT", 0, 0)
	border.TOP:SetPoint("TOPRIGHT", border.TOPRIGHT, "TOPLEFT", 0, 0)
	
	border.BOTTOM:SetPoint("BOTTOMLEFT", border.BOTTOMLEFT, "BOTTOMRIGHT", 0, 0)
	border.BOTTOM:SetPoint("BOTTOMRIGHT", border.BOTTOMRIGHT, "BOTTOMLEFT", 0, 0)
	
	border.LEFT:SetPoint("TOPLEFT", border.TOPLEFT, "BOTTOMLEFT", 0, 0)
	border.LEFT:SetPoint("BOTTOMLEFT", border.BOTTOMLEFT, "TOPLEFT", 0, 0)
	
	border.RIGHT:SetPoint("TOPRIGHT", border.TOPRIGHT, "BOTTOMRIGHT", 0, 0)
	border.RIGHT:SetPoint("BOTTOMRIGHT", border.BOTTOMRIGHT, "TOPRIGHT", 0, 0)
	
	border.Hide = border_Hide
	border.SetOffset = border_SetOffset
	border.SetSize = border_SetSize
	border.SetTexture = border_SetTexture
	border.SetVertexColor = border_SetVertexColor
	border.Show = border_Show
	
	return border
end
-- ========== 自定义边框系统结束 ==========

-- ========== 金币变化缓冲系统（修复维修+售卖混淆问题）==========
-- 使用 !Libs 的 C_Timer.After 来延迟处理金币变化
local moneyChangeBuffer = {
	changes = {},      -- 存储金币变化
	timer = nil,       -- 延迟处理计时器
	isProcessing = false,
	bufferDelay = 0.3, -- 缓冲延迟（秒），增加到0.3秒以更好地分离维修和售卖
	lastProcessedAmount = nil,  -- 上次处理的金额
	lastProcessedTime = 0       -- 上次处理的时间
}

-- 添加金币变化到缓冲区
local function BufferMoneyChange(diff, timestamp)
	-- 去重：如果0.5秒内有相同金额的变化，忽略（防止重复事件）
	if moneyChangeBuffer.lastProcessedAmount == diff and 
	   (timestamp - moneyChangeBuffer.lastProcessedTime) < 0.5 then
		if LootAlertDB and LootAlertDB.debug then
			DEFAULT_CHAT_FRAME:AddMessage(string.format(
				"[拾取提示调试] 忽略重复的金币变化: %+d 铜币 (距上次 %.2f 秒)",
				diff, timestamp - moneyChangeBuffer.lastProcessedTime
			))
		end
		return
	end
	
	table.insert(moneyChangeBuffer.changes, {
		amount = diff,
		time = timestamp,
		isGain = diff > 0,
		isLoss = diff < 0
	})
	
	if LootAlertDB and LootAlertDB.debug then
		DEFAULT_CHAT_FRAME:AddMessage(string.format(
			"[拾取提示调试] 缓冲金币变化: %+d 铜币 (队列长度: %d)",
			diff, table.getn(moneyChangeBuffer.changes)
		))
	end
end

-- 显示金币提示（从原代码提取，支持分离显示）
local function ShowMoneyAlert(diff, allowMerge)
	-- 去重检查：如果已经有完全相同金额的金币提示正在显示（0.5秒内），直接返回
	local currentTime = GetTime()
	for _, alert in ipairs(activeAlerts) do
		if alert:IsShown() and alert.isMoney and alert.moneyAmount == diff then
			local alertAge = currentTime - (alert.startTime or 0)
			if alertAge < 0.5 then
				if LootAlertDB and LootAlertDB.debug then
					DEFAULT_CHAT_FRAME:AddMessage(string.format(
						"[拾取提示调试] 忽略重复的金币提示: %+d 铜币 (已显示 %.2f 秒)",
						diff, alertAge
					))
				end
				return
			end
		end
	end
	
	-- 查找现有金币提示
	local existingAlert = nil
	if allowMerge then
		for _, alert in ipairs(activeAlerts) do
			if alert:IsShown() and alert.isMoney and not alert.isFading then
				existingAlert = alert
				break
			end
		end
	end
	
	local existingQueueData = nil
	if allowMerge then
		for _, data in ipairs(lootQueue) do
			if data.isMoney then
				existingQueueData = data
				break
			end
		end
	end
	
	if existingAlert and allowMerge then
		-- 累加到现有提示
		PlayMoneySound()
		
		local currentDisplayAmount
		if existingAlert.moneyAnimTarget and existingAlert.moneyAnimStart ~= existingAlert.moneyAnimTarget then
			local progress = (existingAlert.moneyAnimTime or 0) / (existingAlert.moneyAnimDuration or 0.6)
			if progress > 1 then progress = 1 end
			currentDisplayAmount = math.floor(lerp(existingAlert.moneyAnimStart, existingAlert.moneyAnimTarget, progress))
		else
			currentDisplayAmount = existingAlert.moneyAmount or 0
		end
		
		local oldAmount = existingAlert.moneyAmount or 0
		local newAmount = oldAmount + diff
		existingAlert.moneyAmount = newAmount
		
		-- 更新标题
		if newAmount < 0 then
			existingAlert.label:SetText("你失去了")
			existingAlert.label:SetTextColor(1, 0.2, 0.2)
		else
			existingAlert.label:SetText("你获得了")
			existingAlert.label:SetTextColor(1, 1, 0.5)
		end
		
		-- 更新图标
		if existingAlert.icon then
			existingAlert.icon:SetTexture(GetMoneyIcon(newAmount))
		end
		
		-- 设置动画
		existingAlert.moneyAnimStart = currentDisplayAmount
		existingAlert.moneyAnimTarget = newAmount
		existingAlert.moneyAnimTime = 0
		existingAlert.moneyAnimDuration = 0.6
		existingAlert.lastMoneyChangeTime = GetTime()
		
		-- 重置淡出状态
		existingAlert.isFading = false
		existingAlert.lockedY = nil
		
		-- 重置淡出时间
		local elapsed = GetTime() - existingAlert.startTime
		local fadeInDuration = 0.2
		if elapsed > fadeInDuration then
			existingAlert.startTime = GetTime() - fadeInDuration
		end
		
	elseif existingQueueData and allowMerge then
		-- 累加到队列
		local oldAmount = existingQueueData.moneyAmount or 0
		local newAmount = oldAmount + diff
		existingQueueData.moneyAmount = newAmount
		existingQueueData.name = FormatMoney(newAmount)
		existingQueueData.texture = GetMoneyIcon(newAmount)
		existingQueueData.moneyAnimStart = oldAmount
		existingQueueData.moneyAnimTarget = newAmount
		
	else
		-- 创建新提示
		local moneyText = FormatMoney(diff)
		local moneyData = {
			name = moneyText,
			link = nil,
			quality = 6,
			texture = GetMoneyIcon(diff),
			count = 1,
			isMoney = true,
			moneyAmount = diff,
			moneyAnimStart = diff,
			moneyAnimTarget = diff,
			needsUpdate = false
		}
		
		-- 添加到队列末尾（按拾取顺序显示）
		table.insert(lootQueue, moneyData)
	end
end

-- 处理缓冲区中的金币变化
local function ProcessMoneyBuffer()
	if moneyChangeBuffer.isProcessing then return end
	if table.getn(moneyChangeBuffer.changes) == 0 then return end
	
	moneyChangeBuffer.isProcessing = true
	
	-- 分析缓冲区中的变化
	local gains = {}  -- 收入（售卖、拾取）
	local losses = {}  -- 支出（维修、购买）
	
	for _, change in ipairs(moneyChangeBuffer.changes) do
		if change.isGain then
			table.insert(gains, change)
		elseif change.isLoss then
			table.insert(losses, change)
		end
	end
	
	if LootAlertDB and LootAlertDB.debug then
		DEFAULT_CHAT_FRAME:AddMessage(string.format(
			"[拾取提示调试] 处理缓冲区: %d 次收入, %d 次支出",
			table.getn(gains), table.getn(losses)
		))
	end
	
	-- 策略：如果同时有收入和支出，检查时间间隔来分离维修和售卖
	if table.getn(gains) > 0 and table.getn(losses) > 0 then
		-- 计算总收入
		local totalGain = 0
		for _, change in ipairs(gains) do
			totalGain = totalGain + change.amount
		end
		
		-- 计算总支出
		local totalLoss = 0
		for _, change in ipairs(losses) do
			totalLoss = totalLoss + change.amount
		end
		
		-- 检查收入和支出的时间间隔
		local firstLossTime = losses[1].time
		local firstGainTime = gains[1].time
		local timeGap = math.abs(firstGainTime - firstLossTime)
		
		if LootAlertDB and LootAlertDB.debug then
			DEFAULT_CHAT_FRAME:AddMessage(string.format(
				"[拾取提示调试] 同时有收入和支出: 收入 %+d, 支出 %+d, 时间间隔 %.3f 秒",
				totalGain, totalLoss, timeGap
			))
		end
		
		-- 如果时间间隔很小（<0.05秒），可能是同一个操作，分别显示
		-- 如果时间间隔较大（>=0.05秒），是维修后售卖，只显示收入
		if timeGap < 0.05 then
			-- 时间太近，可能是bug或特殊情况，分别显示
			if LootAlertDB and LootAlertDB.debug then
				DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 时间间隔太小，分别显示")
			end
			
			-- 先显示支出（如果启用）
			if totalLoss < 0 and LootAlertDB.trackLoss then
				ShowMoneyAlert(totalLoss, false)
			end
			
			-- 延迟显示收入
			if totalGain > 0 then
				local shouldShow = false
				if LootAlertDB.useGoldThreshold then
					local threshold = LootAlertDB.goldThreshold or 1
					shouldShow = (totalGain >= threshold)
				else
					shouldShow = true
				end
				
				if shouldShow then
					if C_Timer and C_Timer.After then
						C_Timer.After(0.1, function()
							ShowMoneyAlert(totalGain, true)
						end)
					else
						ShowMoneyAlert(totalGain, true)
					end
				end
			end
		else
			-- 时间间隔较大，是维修后售卖，只显示收入（忽略维修费用）
			if LootAlertDB and LootAlertDB.debug then
				DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 维修后售卖，只显示收入")
			end
			
			if totalGain > 0 then
				local shouldShow = false
				if LootAlertDB.useGoldThreshold then
					local threshold = LootAlertDB.goldThreshold or 1
					shouldShow = (totalGain >= threshold)
				else
					shouldShow = true
				end
				
				if shouldShow then
					ShowMoneyAlert(totalGain, true)
				end
			end
			
			-- 如果启用了trackLoss，单独显示支出
			if totalLoss < 0 and LootAlertDB.trackLoss then
				if C_Timer and C_Timer.After then
					C_Timer.After(0.1, function()
						ShowMoneyAlert(totalLoss, false)
					end)
				else
					local delayFrame = CreateFrame("Frame")
					delayFrame.elapsed = 0
					delayFrame:SetScript("OnUpdate", function()
						this.elapsed = this.elapsed + arg1
						if this.elapsed >= 0.1 then
							ShowMoneyAlert(totalLoss, false)
							this:SetScript("OnUpdate", nil)
						end
					end)
				end
			end
		end
		
	-- 只有收入或只有支出，正常显示
	else
		local total = 0
		for _, change in ipairs(moneyChangeBuffer.changes) do
			total = total + change.amount
		end
		
		if LootAlertDB and LootAlertDB.debug then
			DEFAULT_CHAT_FRAME:AddMessage(string.format(
				"[拾取提示调试] 单一类型变化: %+d 铜币",
				total
			))
		end
		
		-- 显示金币变化
		if total ~= 0 then
			local shouldShow = false
			if LootAlertDB.trackLoss then
				shouldShow = true
			elseif total > 0 then
				if LootAlertDB.useGoldThreshold then
					local threshold = LootAlertDB.goldThreshold or 1
					shouldShow = (total >= threshold)
				else
					shouldShow = true
				end
			end
			
			if shouldShow then
				ShowMoneyAlert(total, true)  -- true = 可以累加到现有提示
			end
		end
	end
	
	-- 记录最后处理的金额和时间（用于去重）
	if table.getn(moneyChangeBuffer.changes) > 0 then
		local lastChange = moneyChangeBuffer.changes[table.getn(moneyChangeBuffer.changes)]
		moneyChangeBuffer.lastProcessedAmount = lastChange.amount
		moneyChangeBuffer.lastProcessedTime = lastChange.time
	end
	
	-- 清空缓冲区
	moneyChangeBuffer.changes = {}
	moneyChangeBuffer.isProcessing = false
end
-- ========== 金币变化缓冲系统结束 ==========

-- 默认配置（完全模仿 ls_Toasts）
local defaults = {
    enabled = true,
    minQuality = 0,  -- 0=灰色 1=白色 2=绿色 3=蓝色 4=紫色 5=橙色
    showMoney = true,
    playSound = true,  -- 播放物品音效
    soundFile = 8,  -- 物品音效文件选择：默认使用普通拾取音效
    playMoneySound = true,  -- 播放金币音效
    moneySoundFile = 1,  -- 金币音效文件选择：默认使用金币音效
    autoSoundByQuality = true,  -- 根据品质自动选择音效
    maxAlerts = 12,  -- 最多同时显示12个（和 ls_Toasts 一样）
    duration = 3,  -- 显示时长3秒（和 ls_Toasts 的 fadeout_delay 一样）
    scale = 0.8,  -- 缩放1.0（和 ls_Toasts 默认一样）
    displayInterval = 0,  -- 显示间隔0秒，立即显示（和 ls_Toasts 一样）
    bgAlpha = 0.5,  -- 背景透明度：1.0=完全不透明（和 ls_Toasts 一样）
    goldThreshold = 1,  -- 金币阈值（铜币），低于此值不显示，默认1铜（显示所有）
    useGoldThreshold = false,  -- 是否启用金币阈值
    trackLoss = false,  -- 是否追踪金币损失（维修、购买等），默认关闭（和 ls_Toasts 一样）
    growDirection = "down",  -- 生长方向："down"=向下（和 ls_Toasts 一样）
    strata = "HIGH",  -- 框架层级："BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG"（和 ls_Toasts 一样）
    showItemLevel = true,  -- 显示物品等级（和 ls_Toasts 一样）
    spacing = 10,  -- 提示框之间的间距（像素），默认14（和 ls_Toasts 一样）
    
    -- 颜色设置（完全模仿 ls_Toasts）
    colors = {
        border = true,  -- 边框根据品质显示颜色
        threshold = 2,  -- 绿色及以上品质才显示颜色边框（和 ls_Toasts 一样）
    },
    
    -- 背景素材设置
    itemBgTexture = 1,  -- 物品背景素材：1-15（15=纯色）
    
    -- 边框样式设置（完全模仿 ls_Toasts）
    borderStyle = "azerite",  -- 边框样式："default", "beautycase", "azerite", "elv"

    mouseThrough = true,  -- 鼠标穿透，默认开启
    debug = false,  -- 调试模式，默认关闭
}

-- 音效列表（全局，供Config.lua访问）
LootAlertSoundFiles = {
    [1] = {name = "金币", path = "Sound\\Interface\\LootCoinLarge.wav", isFile = true},
    [2] = {name = "升级", path = "Sound\\Interface\\LevelUp.wav", isFile = true},
    [3] = {name = "任务完成", path = "Sound\\Interface\\iQuestComplete.wav", isFile = true},
    [4] = {name = "物品拾取", path = "Sound\\Interface\\LootCoinSmall.wav", isFile = true},
    [5] = {name = "拾取窗口", path = "LOOTWINDOWOPENEMPTY", isFile = false},
    [6] = {name = "告诉", path = "Sound\\Interface\\iTellMessage.wav", isFile = true},
    [7] = {name = "铃铛", path = "Sound\\Doodad\\BellTollAlliance.wav", isFile = true},
    [8] = {name = "普通拾取", path = "Interface\\AddOns\\LootAlert\\ui-common-loot-toast.OGG", isFile = true},
}

-- 音效冷却时间
local lastSoundTime = 0
local lastMoneySoundTime = 0
local soundCooldown = 0.5  -- 0.5秒冷却

-- 播放物品拾取音效（全局，供Config.lua访问）
-- quality: 物品品质（0-5），如果为nil则使用默认音效
function PlayLootSound(quality)
    if not LootAlertDB then return end
    if LootAlertDB.playSound ~= false then
        local currentTime = GetTime()
        -- 检查冷却时间
        if currentTime - lastSoundTime < soundCooldown then
            return  -- 还在冷却中，不播放
        end
        
        local soundId = LootAlertDB.soundFile or 8
        
        -- 如果启用了根据品质自动选择音效
        if LootAlertDB.autoSoundByQuality and quality then
            if quality >= 5 then
                -- 橙色传说物品 - 使用升级音效（更震撼）
                soundId = 2
            elseif quality >= 3 then
                -- 蓝色/紫色稀有物品 - 使用任务完成音效
                soundId = 3
            else
                -- 其他品质 - 使用普通拾取音效
                soundId = 8
            end
        end
        
        local sound = LootAlertSoundFiles[soundId]
        if sound then
            if sound.isFile then
                -- 播放音效文件
                PlaySoundFile(sound.path)
            else
                -- 播放音效 ID
                PlaySound(sound.path, "Master")
            end
            lastSoundTime = currentTime  -- 更新最后播放时间
        end
    end
end

-- 播放金币拾取音效（全局，供Config.lua访问）
function PlayMoneySound()
    if not LootAlertDB then return end
    if LootAlertDB.playMoneySound ~= false then
        local currentTime = GetTime()
        -- 检查冷却时间
        if currentTime - lastMoneySoundTime < soundCooldown then
            return  -- 还在冷却中，不播放
        end
        
        local soundId = LootAlertDB.moneySoundFile or 1
        local sound = LootAlertSoundFiles[soundId]
        if sound then
            if sound.isFile then
                -- 播放音效文件
                PlaySoundFile(sound.path)
            else
                -- 播放音效 ID
                PlaySound(sound.path, "Master")
            end
            lastMoneySoundTime = currentTime  -- 更新最后播放时间
        end
    end
end

-- 配置初始化函数
local function InitializeConfig()
    if not LootAlertDB then
        LootAlertDB = {}
    end
    for k, v in pairs(defaults) do
        if LootAlertDB[k] == nil then
            LootAlertDB[k] = v
        end
    end
    
    -- 移除自动更新逻辑，允许用户自由设置 maxAlerts
    -- 用户可以在设置面板中自由调整 1-12 的任意值
end

-- 品质颜色
local QUALITY_COLORS = {
    [0] = {0.6, 0.6, 0.6},  -- 灰色
    [1] = {1.0, 1.0, 1.0},  -- 白色
    [2] = {0.1, 1.0, 0.1},  -- 绿色
    [3] = {0.0, 0.5, 1.0},  -- 蓝色
    [4] = {0.7, 0.3, 1.0},  -- 紫色
    [5] = {1.0, 0.5, 0.0},  -- 橙色
    [6] = {0.9, 0.75, 0.26}, -- 金币色（参考 ls_Toasts）
}

-- 拾取队列（全局，供其他模块访问）
lootQueue = {}
activeAlerts = {}

-- 创建主框架（锚点）
local LootAlertFrame = CreateFrame("Frame", "LootAlertFrame", UIParent)
LootAlertFrame:SetWidth(200)
LootAlertFrame:SetHeight(50)
LootAlertFrame:SetPoint("TOP", UIParent, "TOP", 0, -150)
LootAlertFrame:SetFrameStrata(LootAlertDB and LootAlertDB.strata or "HIGH")
LootAlertFrame:EnableMouse(false)
LootAlertFrame:SetMovable(true)
LootAlertFrame:Hide()

-- 锚点背景（深色半透明）
LootAlertFrame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
LootAlertFrame:SetBackdropColor(0, 0, 0, 0.8)  -- 深色半透明背景
LootAlertFrame:SetBackdropBorderColor(1, 0.82, 0, 1)  -- 金色边框

-- 锚点文字（金色）
LootAlertFrame.text = LootAlertFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
LootAlertFrame.text:SetPoint("CENTER", LootAlertFrame, "CENTER", -10, 0)
LootAlertFrame.text:SetFont("Fonts\\FZXHLJW.TTF", 14, "OUTLINE")
LootAlertFrame.text:SetText("拾取提示位置\n(拖动移动)")
LootAlertFrame.text:SetTextColor(1, 0.82, 0)  -- 金色文字

-- 创建方向切换按钮（在锚点右侧）
LootAlertFrame.directionButton = CreateFrame("Button", "LootAlertDirectionButton", LootAlertFrame)
LootAlertFrame.directionButton:SetWidth(40)
LootAlertFrame.directionButton:SetHeight(40)
LootAlertFrame.directionButton:SetPoint("LEFT", LootAlertFrame, "RIGHT", -45, 0)

-- 按钮背景（深色半透明，金色边框）
LootAlertFrame.directionButton:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 }
})
LootAlertFrame.directionButton:SetBackdropColor(0, 0, 0, 0.8)  -- 深色半透明背景
LootAlertFrame.directionButton:SetBackdropBorderColor(1, 0.82, 0, 1)  -- 金色边框

-- 按钮文字（箭头，金色）
LootAlertFrame.directionButton.text = LootAlertFrame.directionButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
LootAlertFrame.directionButton.text:SetPoint("CENTER", LootAlertFrame.directionButton, "CENTER", 0, 0)
LootAlertFrame.directionButton.text:SetFont("Fonts\\FZXHLJW.TTF", 18, "OUTLINE")
LootAlertFrame.directionButton.text:SetTextColor(1, 0.82, 0)  -- 金色箭头

-- 更新按钮文字的函数
function UpdateDirectionButtonText()
    if LootAlertDB and LootAlertDB.growDirection == "down" then
        LootAlertFrame.directionButton.text:SetText("↓")
    elseif LootAlertDB then
        LootAlertFrame.directionButton.text:SetText("↑")
    else
        -- 默认向下
        LootAlertFrame.directionButton.text:SetText("↓")
    end
end

-- 按钮点击事件
LootAlertFrame.directionButton:SetScript("OnClick", function()
    if LootAlertDB.growDirection == "down" then
        LootAlertDB.growDirection = "up"
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 切换为向上显示|r")
    else
        LootAlertDB.growDirection = "down"
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 切换为向下显示|r")
    end
    UpdateDirectionButtonText()
end)

-- 按钮鼠标悬停效果（高亮为亮金色）
LootAlertFrame.directionButton:SetScript("OnEnter", function()
    this:SetBackdropBorderColor(1, 1, 0, 1)  -- 亮黄色高亮
    GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
    GameTooltip:AddLine("切换显示方向", 1, 0.82, 0)  -- 金色标题
    if LootAlertDB and LootAlertDB.growDirection == "down" then
        GameTooltip:AddLine("当前：向下显示", 0.2, 1, 0.2)
        GameTooltip:AddLine("点击切换为向上显示", 1, 1, 0.5)
    else
        GameTooltip:AddLine("当前：向上显示", 0.2, 1, 0.2)
        GameTooltip:AddLine("点击切换为向下显示", 1, 1, 0.5)
    end
    GameTooltip:Show()
end)

LootAlertFrame.directionButton:SetScript("OnLeave", function()
    this:SetBackdropBorderColor(1, 0.82, 0, 1)  -- 恢复金色边框
    GameTooltip:Hide()
end)

-- 使锚点可拖动
LootAlertFrame:SetScript("OnMouseDown", function()
    if arg1 == "LeftButton" then
        this:StartMoving()
    end
end)

LootAlertFrame:SetScript("OnMouseUp", function()
    this:StopMovingOrSizing()
    -- 保存位置
    local point, _, relativePoint, xOfs, yOfs = this:GetPoint()
    if not LootAlertDB.position then
        LootAlertDB.position = {}
    end
    LootAlertDB.position.point = point
    LootAlertDB.position.relativePoint = relativePoint
    LootAlertDB.position.x = xOfs
    LootAlertDB.position.y = yOfs
end)

-- 创建提示框池（全局，供Config.lua访问）
alertPool = {}
for i = 1, 12 do
    local alert = CreateFrame("Button", "LootAlert"..i, UIParent)
    alert:SetWidth(224)  -- 和 ls_Toasts 一样：224x48
    alert:SetHeight(48)
    alert:SetFrameStrata(LootAlertDB and LootAlertDB.strata or "HIGH")
    alert:SetScale(defaults.scale)
    -- 根据配置决定是否启用鼠标交互
    if LootAlertDB and LootAlertDB.mouseThrough then
        alert:EnableMouse(false)  -- 鼠标穿透
    else
        alert:EnableMouse(true)  -- 可以交互
    end
    alert:Hide()
    
    -- 整个提示框的鼠标悬停事件
    alert:SetScript("OnEnter", function()
        -- 显示物品 Tooltip
        if this.itemLink and this.itemLink ~= "" then
            -- 提取物品ID，使用 SetBagItem 方式显示完整 Tooltip
            local itemId = string_match(this.itemLink, "item:(%d+)")
            itemId = tonumber(itemId)
            
            local tooltipSet = false
            if itemId then
                -- 在背包中查找物品并显示其 Tooltip
                for bag = 0, 4 do
                    local numSlots = GetContainerNumSlots(bag)
                    if numSlots then
                        for slot = 1, numSlots do
                            local link = GetContainerItemLink(bag, slot)
                            if link then
                                local bagItemId = string_match(link, "item:(%d+)")
                                bagItemId = tonumber(bagItemId)
                                if bagItemId == itemId then
                                    -- 找到了！使用 SetBagItem 显示完整 Tooltip
                                    GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
                                    GameTooltip:SetBagItem(bag, slot)
                                    GameTooltip:Show()
                                    tooltipSet = true
                                    break
                                end
                            end
                        end
                        if tooltipSet then break end
                    end
                end
            end
            
            -- 如果在背包中没找到，尝试使用 SetHyperlink
            if not tooltipSet then
                local success = pcall(function()
                    GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
                    GameTooltip:SetHyperlink(this.itemLink)
                    GameTooltip:Show()
                end)
                
                -- 如果还是失败，显示简单提示
                if not success then
                    GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
                    GameTooltip:AddLine(this.displayName or "物品", 1, 1, 1)
                    GameTooltip:Show()
                end
            end
        elseif this.isMoney then
            -- 金币提示
            GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
            GameTooltip:AddLine("金币", 1, 1, 0)
            GameTooltip:Show()
        else
            -- 没有物品链接，显示简单提示
            GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
            GameTooltip:AddLine(this.displayName or "物品", 1, 1, 1)
            GameTooltip:Show()
        end
        
        -- 暂停淡出动画
        if not this.isPaused then
            this.isPaused = true
            this.pauseTime = GetTime()
        end
        -- 恢复到用户设置的透明度
        local bgAlpha = LootAlertDB.bgAlpha or 1.0
        this:SetAlpha(bgAlpha)
    end)
    
    alert:SetScript("OnLeave", function()
        GameTooltip:Hide()
        
        -- 计算暂停的时间，并补偿到startTime
        if this.isPaused and this.pauseTime then
            local pauseDuration = GetTime() - this.pauseTime
            this.startTime = this.startTime + pauseDuration
        end
        -- 恢复淡出动画
        this.isPaused = false
        this.pauseTime = nil
    end)
    
    -- 点击事件：左键使用物品，Shift+点击试穿装备
    alert:SetScript("OnClick", function()
        -- Shift+点击：试穿装备
        if IsShiftKeyDown() and this.itemLink then
            DressUpItemLink(this.itemLink)
        -- 普通左键点击：使用物品
        elseif this.itemLink then
            -- 提取物品ID
            local itemId = string_match(this.itemLink, "item:(%d+)")
            itemId = tonumber(itemId)
            
            if itemId then
                -- 在背包中查找物品并使用
                for bag = 0, 4 do
                    local numSlots = GetContainerNumSlots(bag)
                    if numSlots then
                        for slot = 1, numSlots do
                            local link = GetContainerItemLink(bag, slot)
                            if link then
                                local bagItemId = string_match(link, "item:(%d+)")
                                bagItemId = tonumber(bagItemId)
                                if bagItemId == itemId then
                                    -- 找到了物品，使用它
                                    UseContainerItem(bag, slot)
                                    return
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    
    -- 背景纹理（完全模仿 ls_Toasts 的格式）
    alert.bg = alert:CreateTexture(nil, "BACKGROUND", nil, -8)
    alert.bg:SetAllPoints()
    -- 使用你自己的素材，但用 ls_Toasts 的 TexCoord
    alert.bg:SetTexture("Interface\\AddOns\\LootAlert\\assets\\1")  -- 默认使用1.tga
    -- WoW 1.12 不支持 SetHorizTile/SetVertTile，直接设置 TexCoord 即可
    -- ls_Toasts 的 TexCoord: {1/512, 449/512, 1/128, 97/128}
    alert.bg:SetTexCoord(1/512, 449/512, 1/128, 97/128)
    alert.bg:SetVertexColor(1, 1, 1, 1)  -- 白色，不改变原色
    
    -- 保存原始的 SetTexture 方法，用于切换纹理/纯色
    alert.bg.SetTextureOriginal = alert.bg.SetTexture
    
    -- 自定义边框（完全模仿 ls_Toasts，使用配置的边框样式）
    local border = createBorder(alert, "BACKGROUND", 1)
    alert.Border = border
    -- 边框样式会在初始化时设置
    

    
    -- 图标框架（完全模仿 ls_Toasts）
    alert.iconFrame = CreateFrame("Frame", nil, alert)
    alert.iconFrame:SetWidth(42)  -- 42x42 图标框架
    alert.iconFrame:SetHeight(42)
    alert.iconFrame:SetPoint("TOPLEFT", alert, "TOPLEFT", 3, -3)  -- 和 ls_Toasts 一样的位置
    alert.iconFrame:EnableMouse(false)  -- 禁用鼠标交互，让事件穿透到父框架
    alert.iconFrame:SetFrameLevel(alert:GetFrameLevel() + 1)
    
    -- 图标
    alert.icon = alert.iconFrame:CreateTexture(nil, "BACKGROUND", nil, 2)
    alert.icon:SetPoint("TOPLEFT", 0, 0)
    alert.icon:SetWidth(42)   -- WoW 1.12 使用 SetWidth/SetHeight
    alert.icon:SetHeight(42)
    alert.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    
    -- 图标边框（完全模仿 ls_Toasts）
    local iconBorder = createBorder(alert.iconFrame, "BACKGROUND", 5)
    iconBorder:Hide()  -- 默认隐藏，品质高时显示
    alert.IconBorder = iconBorder
    -- 边框样式会在初始化时设置
    
    -- 图标边框框架（不显示边框，只用于承载文字元素）
    alert.iconBorder = CreateFrame("Frame", nil, alert)
    alert.iconBorder:SetAllPoints(alert.iconFrame)  -- 完全覆盖图标框架
    alert.iconBorder:SetFrameLevel(alert.iconFrame:GetFrameLevel() + 1)
    -- 不设置 Backdrop，不显示边框
    
    -- 物品等级文字（显示在图标左上角，作为 iconBorder 的子元素确保在最上层）
    alert.itemLevel = alert.iconBorder:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alert.itemLevel:SetPoint("TOPLEFT", alert.iconFrame, "TOPLEFT", -10, 4)
    alert.itemLevel:SetFont("Fonts\\FZXHLJW.TTF", 16, "THICKOUTLINE")
    alert.itemLevel:SetTextColor(1, 1, 1)  -- 白色，更清晰
    alert.itemLevel:SetDrawLayer("OVERLAY", 7)  -- 设置为最高层级
    alert.itemLevel:Hide()
    
    -- 任务物品标记（显示在图标右上角）
    alert.questMark = alert.iconBorder:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alert.questMark:SetPoint("TOPRIGHT", alert.iconFrame, "TOPRIGHT", 8, 3)
    alert.questMark:SetFont("Fonts\\FZXHLJW.TTF", 20, "THICKOUTLINE")
    alert.questMark:SetText("!")
    alert.questMark:SetTextColor(1, 0.82, 0)  -- 金黄色
    alert.questMark:SetDrawLayer("OVERLAY", 7)
    alert.questMark:Hide()
    
    -- 发光效果 (Glow) - 使用 444.tga 素材，完全模仿 ls_Toasts
    alert.glow = alert:CreateTexture(nil, "OVERLAY", nil, 7)
    alert.glow:SetTexture("Interface\\AddOns\\LootAlert\\assets\\444")  -- 使用 444.tga 发光素材
    alert.glow:SetBlendMode("ADD")
    alert.glow:SetWidth(450)
    alert.glow:SetHeight(80)
    alert.glow:SetPoint("CENTER", alert, "CENTER", 0, 0)
    alert.glow:SetAlpha(0)
    alert.glow:SetVertexColor(1, 1, 1, 1)  -- 白色，和 ls_Toasts 一样
    
    -- 扫光效果 (Shine) - 使用 555.tga 素材，完全模仿 ls_Toasts
    alert.shine = alert:CreateTexture(nil, "OVERLAY", nil, 7)
    alert.shine:SetTexture("Interface\\AddOns\\LootAlert\\assets\\555")  -- 使用 555.tga 扫光素材
    alert.shine:SetBlendMode("ADD")
    alert.shine:SetWidth(150)
    alert.shine:SetHeight(90)
    alert.shine:SetPoint("CENTER", alert, "CENTER", 0, 0)
    alert.shine:SetAlpha(0)
    alert.shine:SetVertexColor(1, 1, 1, 1)  -- 白色，和 ls_Toasts 一样
    
    -- 动画状态
    alert.animState = {
        glowAlpha = 0,
        glowStep = 0,
        glowTime = 0,
        shineStep = 0,
        shineTime = 0,
        shineAlpha = 0,
        shineOffset = 0
    }
    
    -- 数量相关
    alert.currentCount = 0
    alert.targetCount = 0
    alert.countAnimTime = 0
    
    -- 获取字体路径（支持 LibSharedMedia）
    local function GetFontPath()
        if hasLSM and LootAlertDB.fontName then
            local fontPath = LSM:Fetch("font", LootAlertDB.fontName)
            if fontPath then
                return fontPath
            end
        end
        return "Fonts\\FZXHLJW.TTF"  -- 默认字体
    end
    
    local fontPath = GetFontPath()
    
    -- 标题文字：你获得了 / 你失去了（在上方，完全模仿 ls_Toasts）
    alert.label = alert:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alert.label:SetPoint("TOPLEFT", alert.iconFrame, "TOPRIGHT", 6, 2)  -- 图标右侧，上方
    alert.label:SetPoint("TOPRIGHT", alert, "TOPRIGHT", -2, -2)
    alert.label:SetFont(fontPath, 12, "OUTLINE")
    alert.label:SetHeight(14)
    alert.label:SetJustifyH("CENTER")  -- 居中对齐（和 ls_Toasts 一样）
    alert.label:SetJustifyV("MIDDLE")  -- 垂直居中
    alert.label:SetTextColor(1, 1, 0.5)
    alert.label:SetText("你获得了")  -- 默认文本，会根据金币正负动态更新
    
    -- 物品名称（在下方，居中对齐，完全模仿 ls_Toasts）
    alert.itemName = alert:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alert.itemName:SetPoint("BOTTOMLEFT", alert.iconFrame, "BOTTOMRIGHT", 6, 0)  -- 图标右侧，下方
    alert.itemName:SetPoint("BOTTOMRIGHT", alert, "BOTTOMRIGHT", -2, 2)
    alert.itemName:SetFont(fontPath, 12, "OUTLINE")
    alert.itemName:SetHeight(28)
    alert.itemName:SetJustifyH("CENTER")  -- 居中对齐（和 ls_Toasts 一样）
    alert.itemName:SetJustifyV("MIDDLE")  -- 垂直居中
    -- 注意：WoW 1.12 支持 SetMaxLines，长名字会自动换行显示2行
    
    -- 数量文字（显示在图标右下角，完全模仿 ls_Toasts 的 IconText1）
    alert.countText = alert.iconBorder:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alert.countText:SetPoint("BOTTOMRIGHT", alert.iconFrame, "BOTTOMRIGHT", 4, -4)  -- 调整位置
    alert.countText:SetFont(fontPath, 16, "THICKOUTLINE")  -- 稍小的字体
    alert.countText:SetTextColor(1, 1, 1)  -- 白色
    alert.countText:SetDrawLayer("OVERLAY", 7)  -- 最高层级
    alert.countText:SetText("")
    
    -- "+X" 增量提示文字（显示在图标上方，完全模仿 ls_Toasts 的 IconText2）
    alert.countAddText = alert.iconBorder:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alert.countAddText:SetPoint("BOTTOM", alert.iconFrame, "TOP", 0, -10)  -- 调整位置
    alert.countAddText:SetFont(fontPath, 14, "THICKOUTLINE")  -- 稍小的字体
    alert.countAddText:SetTextColor(0, 1, 0)  -- 绿色
    alert.countAddText:SetDrawLayer("OVERLAY", 7)
    alert.countAddText:SetAlpha(0)
    
    -- "+X" 闪烁动画状态（完全模仿 ls_Toasts 的 Blink 动画）
    alert.countAddAnim = {
        step = 0,      -- 0=未开始, 1=淡入, 2=保持, 3=淡出, 4=完成
        alpha = 0,
        time = 0
    }
    
    -- 动画相关
    alert.startTime = 0
    alert.alpha = 0
    alert.scale = 1
    alert.isPaused = false  -- 是否暂停淡出
    
    -- 点击事件：左键使用物品，Shift+点击试穿装备（绑定到整个提示框）
    alert:SetScript("OnClick", function()
        -- Shift+点击：试穿装备
        if IsShiftKeyDown() and this.itemLink then
            DressUpItemLink(this.itemLink)
        -- 普通左键点击：使用物品
        elseif this.itemLink then
            -- 提取物品ID
            local itemId = string_match(this.itemLink, "item:(%d+)")
            itemId = tonumber(itemId)
            
            if itemId then
                -- 在背包中查找物品并使用
                for bag = 0, 4 do
                    local numSlots = GetContainerNumSlots(bag)
                    if numSlots then
                        for slot = 1, numSlots do
                            local link = GetContainerItemLink(bag, slot)
                            if link then
                                local bagItemId = string_match(link, "item:(%d+)")
                                bagItemId = tonumber(bagItemId)
                                if bagItemId == itemId then
                                    -- 找到了物品，使用它
                                    UseContainerItem(bag, slot)
                                    return
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    
    -- 鼠标悬停事件：显示 Tooltip 并暂停淡出（绑定到整个提示框）
    alert:SetScript("OnEnter", function()
        -- 显示物品 Tooltip
        if this.itemLink and this.itemLink ~= "" then
            -- 提取物品ID，使用 SetBagItem 方式显示完整 Tooltip
            local itemId = string_match(this.itemLink, "item:(%d+)")
            itemId = tonumber(itemId)
            
            local tooltipSet = false
            if itemId then
                -- 在背包中查找物品并显示其 Tooltip
                for bag = 0, 4 do
                    local numSlots = GetContainerNumSlots(bag)
                    if numSlots then
                        for slot = 1, numSlots do
                            local link = GetContainerItemLink(bag, slot)
                            if link then
                                local bagItemId = string_match(link, "item:(%d+)")
                                bagItemId = tonumber(bagItemId)
                                if bagItemId == itemId then
                                    -- 找到了！使用 SetBagItem 显示完整 Tooltip
                                    GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
                                    GameTooltip:SetBagItem(bag, slot)
                                    GameTooltip:Show()
                                    tooltipSet = true
                                    break
                                end
                            end
                        end
                        if tooltipSet then break end
                    end
                end
            end
            
            -- 如果在背包中没找到，尝试使用 SetHyperlink
            if not tooltipSet then
                local success = pcall(function()
                    GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
                    GameTooltip:SetHyperlink(this.itemLink)
                    GameTooltip:Show()
                end)
                
                -- 如果还是失败，显示简单提示
                if not success then
                    GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
                    GameTooltip:AddLine(this.displayName or "物品", 1, 1, 1)
                    GameTooltip:Show()
                end
            end
        elseif this.isMoney then
            -- 金币提示
            GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
            GameTooltip:AddLine("金币", 1, 1, 0)
            GameTooltip:Show()
        else
            -- 没有物品链接，显示简单提示
            GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
            GameTooltip:AddLine(this.displayName or "物品", 1, 1, 1)
            GameTooltip:Show()
        end
        
        -- 暂停淡出动画
        if not this.isPaused then
            this.isPaused = true
            this.pauseTime = GetTime()  -- 记录暂停开始时间
        end
        -- 恢复到用户设置的透明度
        local bgAlpha = LootAlertDB.bgAlpha or 1.0
        this:SetAlpha(bgAlpha)
    end)
    
    -- 鼠标离开事件：隐藏 Tooltip（绑定到整个提示框）
    alert:SetScript("OnLeave", function()
        GameTooltip:Hide()
        
        -- 计算暂停的时间，并补偿到startTime
        if this.isPaused and this.pauseTime then
            local pauseDuration = GetTime() - this.pauseTime
            this.startTime = this.startTime + pauseDuration
        end
        
        -- 恢复淡出动画，不直接隐藏
        this.isPaused = false
        this.pauseTime = nil
    end)
    
    -- 右键点击功能已移除，只保留鼠标悬停显示信息
    
    table.insert(alertPool, alert)
end

-- 应用边框样式到提示框（全局，供Config.lua访问）
function ApplyBorderStyle(alert, styleName)
    local style = BORDER_STYLES[styleName or LootAlertDB.borderStyle or "azerite"]
    if not style then
        style = BORDER_STYLES["azerite"]  -- 默认使用 Azerite
    end
    
    -- 应用主框架边框
    if alert.Border and style.toast_border then
        if style.toast_border.texture then
            -- 使用纹理边框
            alert.Border:SetTexture(style.toast_border.texture)
            alert.Border:SetVertexColor(1, 1, 1, 1)
        elseif style.toast_border.color then
            -- 使用纯色边框（ElvUI 风格）
            for _, section in ipairs(sections) do
                alert.Border[section]:SetTexture(style.toast_border.color[1], style.toast_border.color[2], 
                                                 style.toast_border.color[3], style.toast_border.color[4])
            end
        end
        alert.Border:SetOffset(style.toast_border.offset)
        alert.Border:SetSize(style.toast_border.size)
    end
    
    -- 应用图标边框
    if alert.IconBorder and style.icon_border then
        if style.icon_border.texture then
            -- 使用纹理边框
            alert.IconBorder:SetTexture(style.icon_border.texture)
            alert.IconBorder:SetVertexColor(1, 1, 1, 1)
        elseif style.icon_border.color then
            -- 使用纯色边框（ElvUI 风格）
            for _, section in ipairs(sections) do
                alert.IconBorder[section]:SetTexture(style.icon_border.color[1], style.icon_border.color[2], 
                                                     style.icon_border.color[3], style.icon_border.color[4])
            end
        end
        alert.IconBorder:SetOffset(style.icon_border.offset)
        alert.IconBorder:SetSize(style.icon_border.size)
    end
end

-- 更新所有提示框的边框样式（全局，供Config.lua访问）
function UpdateAllBorderStyles()
    for _, alert in ipairs(alertPool) do
        ApplyBorderStyle(alert)
    end
end

-- 更新所有框架的层级（全局，供Config.lua访问）
function UpdateAllStrata()
    local strata = LootAlertDB.strata or "HIGH"
    
    -- 更新锚点框架
    if LootAlertFrame then
        LootAlertFrame:SetFrameStrata(strata)
    end
    
    -- 更新所有提示框
    if alertPool then
        for _, alert in ipairs(alertPool) do
            alert:SetFrameStrata(strata)
        end
    end
end

-- 更新所有提示框的鼠标交互状态（全局，供Config.lua访问）
function UpdateAllMouseInteraction()
    if not alertPool then return end
    
    local mouseThrough = LootAlertDB.mouseThrough
    for _, alert in ipairs(alertPool) do
        if mouseThrough then
            alert:EnableMouse(false)  -- 鼠标穿透
        else
            alert:EnableMouse(true)  -- 可以交互
        end
    end
end

-- 解析拾取消息
local function ParseLootMessage(msg)
    -- 尝试多种模式匹配
    local itemLink
    local count = 1
    
    -- 先尝试提取完整的物品链接（最通用的方法）
    -- 格式: |cXXXXXXXX|Hitem:XXXX...|h[物品名]|h|r
    itemLink = string_match(msg, "(|c%x+|Hitem:[^|]+|h%[[^%]]+%]|h|r)")
    
    if not itemLink then
        return nil, 0
    end
    
    -- 提取数量 - 支持多种格式
    -- 格式1: x2, ×2, *2
    local countStr = string_match(msg, "|h|r[x×%*](%d+)")
    if not countStr then
        -- 格式2: 在整个消息中查找 x2
        countStr = string_match(msg, "[x×%*](%d+)")
    end
    
    if countStr then
        count = tonumber(countStr) or 1
    else
        -- 格式3: "N个" 格式
        countStr = string_match(msg, "(%d+)个")
        if countStr then
            count = tonumber(countStr) or 1
        end
    end
    
    return itemLink, count
end

-- 延迟队列（用于等待物品信息加载）
local pendingItems = {}

-- 创建隐藏的Tooltip用于显示物品信息
local scanTooltip = CreateFrame("GameTooltip", "LootAlertScanTooltip", nil, "GameTooltipTemplate")
scanTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
scanTooltip:Hide()

-- 从物品链接中提取物品ID
local function GetItemIdFromLink(itemLink)
    if not itemLink then return nil end
    local itemId = string_match(itemLink, "item:(%d+)")
    return tonumber(itemId)
end

-- 检查物品是否是任务物品
local function IsQuestItem(itemId)
    if not itemId then return false end
    
    -- 方法1：遍历背包查找物品并检查其类型
    for bag = 0, 4 do
        local numSlots = GetContainerNumSlots(bag)
        if numSlots then
            for slot = 1, numSlots do
                local link = GetContainerItemLink(bag, slot)
                if link then
                    local bagItemId = GetItemIdFromLink(link)
                    if bagItemId == itemId then
                        -- 使用 Tooltip 检查是否是任务物品
                        scanTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
                        scanTooltip:ClearLines()
                        scanTooltip:SetBagItem(bag, slot)
                        
                        -- 检查 Tooltip 文本中是否包含"任务物品"
                        for i = 1, scanTooltip:NumLines() do
                            local line = getglobal("LootAlertScanTooltipTextLeft" .. i)
                            if line then
                                local text = line:GetText()
                                if text and (strfind(text, "任务物品") or strfind(text, "Quest Item")) then
                                    scanTooltip:Hide()
                                    return true
                                end
                            end
                        end
                        scanTooltip:Hide()
                        return false
                    end
                end
            end
        end
    end
    
    -- 方法2：使用 GetItemInfo 检查物品类型
    local info = {GetItemInfo(itemId)}
    local itemType = info[6]
    if itemType and (itemType == "任务" or itemType == "Quest") then
        return true
    end
    
    return false
end

-- 从背包中查找物品并获取其图标
local function GetItemTextureFromBags(itemId)
    if not itemId then return nil end
    
    -- 尝试从系统信息中扫描图标
    local info = {GetItemInfo(itemId)}
    if info and info[1] then
        for i = 1, 20 do
            local val = info[i]
            if val and type(val) == "string" then
                local lval = string.lower(val)
                if strfind(lval, "interface\\icons\\") or strfind(lval, "inventory\\") then
                    return val
                elseif strfind(lval, "inv_") then
                    return "Interface\\Icons\\" .. val
                end
            elseif val and type(val) == "number" and val > 1000 then
                return val
            end
        end
        if info[10] and info[10] ~= 1 and info[10] ~= 0 then return info[10] end
    end
    
    -- 备用方案：在背包中查找
    for bag = 0, 4 do
        local numSlots = GetContainerNumSlots(bag)
        if numSlots then
            for slot = 1, numSlots do
                local link = GetContainerItemLink(bag, slot)
                if link and GetItemIdFromLink(link) == itemId then
                    local texture = GetContainerItemInfo(bag, slot)
                    if texture then return texture end
                end
            end
        end
    end
    
    return nil
end



-- 查找已存在的相同物品提示（使用物品ID匹配，更可靠）
local function FindExistingAlert(itemLink)
    if not itemLink then return nil, nil end
    
    -- 提取物品ID
    local itemId = GetItemIdFromLink(itemLink)
    if not itemId then return nil, nil end
    
    -- 先检查正在显示的提示（使用物品ID匹配）
    for _, alert in ipairs(activeAlerts) do
        if alert:IsShown() and alert.itemId == itemId and not alert.isFading then
            return alert, false
        end
    end
    
    -- 再检查队列中的提示（使用物品ID匹配）
    for _, data in ipairs(lootQueue) do
        if data.itemId == itemId then
            return nil, data
        end
    end
    
    return nil, nil
end

-- 添加拾取提示到队列
local function AddLootAlert(itemLink, count)
    if not LootAlertDB or not LootAlertDB.enabled then return end
    
    local itemName, _, quality, _, _, _, _, _, texture
    
    -- 物品提示
    -- 检查是否已存在相同物品的提示
    local existingAlert, existingQueueData = FindExistingAlert(itemLink)
    
    if existingAlert then
        -- 已经在显示中，更新数量并显示 "+X"（完全模仿 ls_Toasts）
        existingAlert.targetCount = existingAlert.targetCount + count
        existingAlert.countAnimTime = 0
        
        -- 显示 "+X" 闪烁提示（完全模仿 ls_Toasts 的 IconText2）
        existingAlert.countAddText:SetText("+" .. count)
        existingAlert.countAddAnim.step = 1  -- 开始淡入
        existingAlert.countAddAnim.alpha = 0
        existingAlert.countAddAnim.time = 0
        
        -- 播放音效（每次累加都播放）
        PlayLootSound(existingAlert.quality or 1)
        
        -- 重置淡出动画，延长显示时间（完全模仿 ls_Toasts 的 AnimOut）
        existingAlert.isFading = false
        existingAlert.lockedY = nil
        
        -- 重置 startTime，让提示重新开始计时
        local elapsed = GetTime() - existingAlert.startTime
        local fadeInDuration = 0.2  -- 入场动画时长（统一为0.2秒，和ls_Toasts一致）
        if elapsed > fadeInDuration then
            -- 保持在显示状态，重新计时
            existingAlert.startTime = GetTime() - fadeInDuration
        end
        return
    elseif existingQueueData then
        -- 在队列中，直接增加数量
        existingQueueData.count = existingQueueData.count + count
        return
    end
    
    -- 先从物品链接中提取品质和名称
    local colorCode = string_match(itemLink, "|c(%x+)")
    local itemNameFromLink = string_match(itemLink, "%[(.+)%]")
    local itemId = tonumber(string_match(itemLink, "item:(%d+)"))  -- 转换为数字
    
    -- 根据颜色代码判断品质
    local quality = 1  -- 默认白色
    if colorCode then
        if colorCode == "ff9d9d9d" or colorCode == "9d9d9d" then
            quality = 0  -- 灰色
        elseif colorCode == "ffffffff" or colorCode == "ffffff" then
            quality = 1  -- 白色
        elseif colorCode == "ff1eff00" or colorCode == "1eff00" then
            quality = 2  -- 绿色
        elseif colorCode == "ff0070dd" or colorCode == "0070dd" then
            quality = 3  -- 蓝色
        elseif colorCode == "ffa335ee" or colorCode == "a335ee" then
            quality = 4  -- 紫色
        elseif colorCode == "ffff8000" or colorCode == "ff8000" then
            quality = 5  -- 橙色
        end
    end
    
    -- 品质过滤
    if quality < LootAlertDB.minQuality then 
        return 
    end
    
    -- 简化的图标获取（参考 ls_Toasts，但保留兜底）
    local texture = "Interface\\Icons\\INV_Misc_QuestionMark"
    local itemName = itemNameFromLink
    local itemLevelValue = nil  -- 物品等级
    
    -- 方法1：直接使用 GetItemInfo 获取所有信息（最简单可靠，优先使用）
    if itemId then
        -- 多级解析图标（兼容各种客户端和插件环境）
        local info = {GetItemInfo(itemId)}
        local name = info[1]
        local itemQuality = info[3]
        local itemLevel = info[4]
        local iconTextureResolved = nil
        
        -- 尝试 1: 各类 GetIcon API
        if GetItemIcon then iconTextureResolved = GetItemIcon(itemId) end
        if (not iconTextureResolved or iconTextureResolved == 1) and GetItemTexture then iconTextureResolved = GetItemTexture(itemId) end
        if (not iconTextureResolved or iconTextureResolved == 1) and C_Item and C_Item.GetItemIconByID then iconTextureResolved = C_Item.GetItemIconByID(itemId) end
        
        -- 尝试 2: 全量扫描返回值 (1-20)
        if not iconTextureResolved or iconTextureResolved == 1 or iconTextureResolved == 0 then
            for i = 1, 20 do
                local val = info[i]
                if val then
                    if type(val) == "string" and (strfind(string.lower(val), "interface\\icons\\") or strfind(string.lower(val), "inventory\\")) then
                        iconTextureResolved = val
                        break
                    elseif type(val) == "string" and strfind(string.lower(val), "inv_") then
                        iconTextureResolved = "Interface\\Icons\\" .. val
                        break
                    elseif type(val) == "number" and val > 1000 then
                        iconTextureResolved = val
                        break
                    end
                end
            end
        end
        
        -- 尝试 3: 兜底逻辑
        if (not iconTextureResolved or iconTextureResolved == 1) and info[10] and info[10] ~= 1 then
            iconTextureResolved = info[10]
        end
        
        -- 开发调试：输出更多信息用于排查
        if LootAlertDB.debug then
            local debugStr = "|cff00fbff[拾取提示调试] " .. (name or "未知") .. " ID:" .. itemId .. " 解析图标:" .. tostring(iconTextureResolved)
            if info[10] then debugStr = debugStr .. " [10]:" .. tostring(info[10]) end
            if info[11] then debugStr = debugStr .. " [11]:" .. tostring(info[11]) end
            DEFAULT_CHAT_FRAME:AddMessage(debugStr)
        end
        
        if name and iconTextureResolved and iconTextureResolved ~= 1 then
            -- 成功获取完整信息
            itemName = name
            itemLink = info[2] or itemLink
            quality = itemQuality or quality
            texture = iconTextureResolved
            
            -- 保存物品等级
            if itemLevel and itemLevel > 0 then
                itemLevelValue = itemLevel
            end
        elseif name then
            -- 方法2：有名称但没图标，从背包获取（兜底方案）
            itemName = name
            quality = itemQuality or quality
            
            if itemLevel and itemLevel > 0 then
                itemLevelValue = itemLevel
            end
            
            -- 从背包查找图标
            local bagTexture = GetItemTextureFromBags(itemId)
            if bagTexture then
                texture = bagTexture
            end
        end
    end
    
    -- 检查是否是任务物品
    local isQuest = false
    if itemId then
        isQuest = IsQuestItem(itemId)
    end
    
    -- 添加到显示队列
    local data = {
        name = itemName,
        link = itemLink,
        quality = quality,
        texture = texture,
        count = count,
        isMoney = false,
        itemId = itemId,
        itemLevel = itemLevelValue,  -- 物品等级
        isQuest = isQuest  -- 是否是任务物品
    }
    table.insert(lootQueue, data)
    
    -- 如果是问号图标，添加到延迟队列尝试更新
    if texture == "Interface\\Icons\\INV_Misc_QuestionMark" then
        table.insert(pendingItems, {
            link = itemLink,
            data = data,
            time = GetTime()
        })
    end
end

-- 处理延迟队列（简化版，参考 ls_Toasts 但保留兜底）
local function ProcessPendingItems()
    if not LootAlertDB then return end
    
    for i = getn(pendingItems), 1, -1 do
        local pending = pendingItems[i]
        if not pending then
            table.remove(pendingItems, i)
        else
            -- 尝试获取图标
            local texture = nil
            if pending.data.itemId then
                -- 优先使用 GetItemInfo
                local _, _, _, _, _, _, _, _, _, icon = GetItemInfo(pending.data.itemId)
                if icon then
                    texture = icon
                else
                    -- 兜底：从背包获取
                    texture = GetItemTextureFromBags(pending.data.itemId)
                end
            end
            
            -- 如果获取成功
            if texture and texture ~= "Interface\\Icons\\INV_Misc_QuestionMark" then
                pending.data.texture = texture
                
                -- 更新队列中的物品
                for _, queueData in ipairs(lootQueue) do
                    if queueData.link == pending.link then
                        queueData.texture = texture
                    end
                end
                
                -- 如果物品正在显示，更新显示的图标
                for _, alert in ipairs(activeAlerts) do
                    if alert:IsShown() and alert.itemLink == pending.link then
                        -- 格式化图标路径（确保包含 Interface\Icons\ 前缀）
                        local iconPath = texture
                        if type(iconPath) == "string" and not strfind(iconPath, "\\") and not strfind(iconPath, "/") then
                            iconPath = "Interface\\Icons\\" .. iconPath
                        end
                        alert.icon:SetTexture(iconPath)
                        alert.icon:SetVertexColor(1, 1, 1, 1)
                    end
                end
                
                table.remove(pendingItems, i)
            elseif GetTime() - pending.time > 3 then
                -- 3秒后放弃
                table.remove(pendingItems, i)
            end
        end
    end
end

-- 显示提示
local function ShowAlert(data)
    -- 找一个空闲的提示框
    local alert
    for _, a in ipairs(alertPool) do
        if not a:IsShown() then
            alert = a
            break
        end
    end
    
    if not alert then return false end
    
    -- 播放音效（根据物品品质或金币类型）
    if data.isMoney then
        PlayMoneySound()
    else
        PlayLootSound(data.quality)
    end
    
    -- 如果图标是问号且有物品ID，立即尝试获取真实图标
    if data.texture == "Interface\\Icons\\INV_Misc_QuestionMark" and data.itemId then
        -- 优先使用 GetItemInfo
        local _, _, _, _, _, _, _, _, _, icon = GetItemInfo(data.itemId)
        if icon then
            data.texture = icon
        else
            -- 兜底：从背包获取
            local bagTexture = GetItemTextureFromBags(data.itemId)
            if bagTexture then
                data.texture = bagTexture
            end
        end
    end
    
    -- 格式化图标路径
    local iconTexture = data.texture
    
    -- 彻底修复：如果图标是纯数字（FileDataID）或者不完整的路径
    if type(iconTexture) == "number" then
        -- 在某些新版 1.12 客户端中，SetTexture(number) 应该有效，但如果显示红框，
        -- 可能是因为 SetTexCoord 导致的，或者是 FileDataID 需要特殊处理。
    elseif type(iconTexture) == "string" then
        -- 去掉可能存在的双引号
        iconTexture = string.gsub(iconTexture, "\"", "")
        -- 如果只有文件名，没有路径，补全路径
        if not strfind(iconTexture, "\\") and not strfind(iconTexture, "/") then
            iconTexture = "Interface\\Icons\\" .. iconTexture
        end
        -- 确保不缺少扩展名（如果是自定义素材或某些特定系统图标）
        if not strfind(iconTexture, "%.") and not strfind(string.lower(iconTexture), "interface\\icons\\") then
             -- 并非官方图标目录下的文件，可能需要后缀
             iconTexture = iconTexture .. ".tga"
        end
    end
    
    -- 设置数据
    alert.icon:SetTexture(iconTexture)
    
    -- 关键修复：如果是 FileDataID (数字)，重置裁剪，因为新客户端的数字图标通常已裁剪好
    if type(iconTexture) == "number" then
        alert.icon:SetTexCoord(0, 1, 0, 1)
    else
        alert.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    end
    
    alert.icon:SetVertexColor(1, 1, 1, 1)  -- 强制设置为白色
    alert.icon:SetDesaturated(false)       -- 确保不被去色
    alert.itemLink = data.link  -- 保存物品链接，用于 Tooltip 显示
    alert.itemId = data.itemId  -- 保存物品ID，用于累加匹配
    alert.quality = data.quality  -- 保存品质，用于累加时播放音效
    alert.isMoney = data.isMoney  -- 标记是否是金币
    alert.moneyAmount = data.moneyAmount  -- 保存金币数量
    
    -- 如果是金币且有动画参数，初始化动画
    if data.isMoney and data.moneyAnimStart and data.moneyAnimTarget then
        alert.moneyAnimStart = data.moneyAnimStart
        alert.moneyAnimTarget = data.moneyAnimTarget
        alert.moneyAnimTime = 0
        alert.moneyAnimDuration = 0.6
        alert.lastMoneyChangeTime = GetTime()
    end
    
    -- 设置颜色
    local color = QUALITY_COLORS[data.quality] or {1, 1, 1}
    alert.itemName:SetTextColor(color[1], color[2], color[3])
    
    -- 设置边框颜色（完全模仿 ls_Toasts）
    if data.isMoney then
        -- 金币边框始终显示为金色
        local goldColor = QUALITY_COLORS[6] or {0.9, 0.75, 0.26}
        alert.Border:SetVertexColor(goldColor[1], goldColor[2], goldColor[3], 1)
        alert.IconBorder:SetVertexColor(goldColor[1], goldColor[2], goldColor[3], 1)
    elseif LootAlertDB.colors and LootAlertDB.colors.border then
        -- 如果启用了品质边框颜色
        if data.quality >= (LootAlertDB.colors.threshold or 1) then
            alert.Border:SetVertexColor(color[1], color[2], color[3], 1)
            alert.IconBorder:SetVertexColor(color[1], color[2], color[3], 1)
        else
            -- 低品质使用默认白色
            alert.Border:SetVertexColor(1, 1, 1, 1)
            alert.IconBorder:SetVertexColor(1, 1, 1, 1)
        end
    else
        -- 默认白色边框
        alert.Border:SetVertexColor(1, 1, 1, 1)
        alert.IconBorder:SetVertexColor(1, 1, 1, 1)
    end
    
    -- 显示图标边框（完全模仿 ls_Toasts）
    alert.IconBorder:Show()
    
    -- 物品等级已禁用
    alert.itemLevel:Hide()
    
    -- 显示任务物品标记
    if data.isQuest then
        alert.questMark:Show()
    else
        alert.questMark:Hide()
    end
    
    -- 根据类型使用不同的背景素材（金币和物品都使用相同的背景素材设置）
    local bgTexture = LootAlertDB.itemBgTexture or 1
    if bgTexture == 15 then
        -- 素材15：纯色背景（ElvUI风格）
        alert.bg:SetTexture(0.06, 0.06, 0.06, 0.8)  -- 深灰色半透明
        alert.bg:SetTexCoord(0, 1, 0, 1)  -- 重置裁剪
    else
        -- 使用纹理（完全模仿 ls_Toasts 的格式）
        alert.bg.SetTextureOriginal(alert.bg, "Interface\\AddOns\\LootAlert\\assets\\" .. bgTexture)
        -- WoW 1.12 不支持 SetHorizTile/SetVertTile，直接设置 TexCoord 即可
        -- ls_Toasts 的 TexCoord: {1/512, 449/512, 1/128, 97/128}
        alert.bg:SetTexCoord(1/512, 449/512, 1/128, 97/128)
        alert.bg:SetVertexColor(1, 1, 1, 1)  -- 白色，不改变原色
    end
    
    -- 根据类型设置标题
    if data.isMoney then
        -- 根据金币正负设置标题（参考 ls_Toasts）
        if data.moneyAmount and data.moneyAmount < 0 then
            alert.label:SetText("你失去了")
            alert.label:SetTextColor(1, 0.2, 0.2)  -- 红色
        else
            alert.label:SetText("你获得了")
            alert.label:SetTextColor(1, 1, 0.5)  -- 金黄色
        end
    else
        alert.label:SetText("你获得了")
        alert.label:SetTextColor(1, 1, 0.5)  -- 金黄色
    end
    
    -- 设置数量（完全模仿 ls_Toasts：物品名不显示数量，数量显示在图标右下角）
    local displayName = data.name
    
    -- 添加物品等级（完全模仿 ls_Toasts）
    if not data.isMoney and LootAlertDB.showItemLevel and data.itemLevel and data.itemLevel > 0 then
        local color = QUALITY_COLORS[data.quality] or {1, 1, 1}
        -- 格式：[品质颜色的等级] 物品名
        -- 例如：[|cff0070dd463|r] 暗影之刃
        local colorHex = string.format("|cff%02x%02x%02x", color[1] * 255, color[2] * 255, color[3] * 255)
        displayName = "[" .. colorHex .. data.itemLevel .. "|r] " .. displayName
    end
    
    -- 初始化数量
    alert.currentCount = data.count or 1
    alert.targetCount = data.count or 1
    alert.countAnimTime = 0
    
    -- 设置图标右下角的数量文字（使用 !MyLib 的数字格式化）
    if data.count and data.count > 1 then
        alert.countText:SetText(FormatLargeNumber(data.count))
    else
        alert.countText:SetText("")  -- 数量为1时不显示
    end
    
    -- 完全模仿 ls_Toasts：不截断名字，始终居中对齐
    -- ls_Toasts 使用 SetMaxLines(2) 让长名字自动换行显示2行
    alert.itemName:SetText(displayName)  -- 物品名不显示数量，不截断
    alert.displayName = displayName  -- 保存用于后续更新
    
    -- 设置初始位置（根据生长方向）
    local growDirection = LootAlertDB.growDirection or "down"
    if growDirection == "down" then
        alert:SetPoint("TOP", LootAlertFrame, "BOTTOM", 0, -10)
    else
        alert:SetPoint("BOTTOM", LootAlertFrame, "TOP", 0, 10)
    end
    
    -- 显示
    alert.startTime = GetTime()
    alert.alpha = 0
    alert.isFading = false  -- 初始化淡出状态
    alert.lockedY = nil  -- 初始化锁定位置
    alert:SetAlpha(0)
    alert:SetScale(LootAlertDB.scale)
    
    -- 重置动画状态
    alert.animState.glowAlpha = 0
    alert.animState.glowStep = 0
    alert.animState.glowTime = 0
    alert.animState.shineStep = 0
    alert.animState.shineTime = 0
    alert.animState.shineAlpha = 0
    alert.animState.shineOffset = 0
    
    -- 重置 shine 位置到图标右侧
    alert.shine:ClearAllPoints()
    alert.shine:SetPoint("CENTER", alert, "LEFT", 48, 0)
    
    alert:Show()
    
    -- 插入到数组末尾（完全模仿 ls_Toasts：按顺序排列）
    table.insert(activeAlerts, alert)
    return true
end

-- 更新所有提示框的位置（完全模仿 ls_Toasts：立即定位，无平滑移动）
local function UpdateAlertPositions()
    local growDirection = LootAlertDB.growDirection or "down"
    local spacing = 62  -- 基础高度 48 + 间距 14 = 62 像素（和 ls_Toasts 一样）
    
    for i, alert in ipairs(activeAlerts) do
        if alert:IsShown() then
            alert:ClearAllPoints()
            
            if i == 1 then
                -- 第一个提示框：直接贴在锚点上（完全模仿 ls_Toasts）
                if growDirection == "down" then
                    alert:SetPoint("TOP", LootAlertFrame, "BOTTOM", 0, 0)
                else
                    alert:SetPoint("BOTTOM", LootAlertFrame, "TOP", 0, 0)
                end
            else
                -- 后续提示框：相对于前一个提示框定位（完全模仿 ls_Toasts）
                local spacing = LootAlertDB.spacing or 14
                if growDirection == "down" then
                    alert:SetPoint("TOP", activeAlerts[i - 1], "BOTTOM", 0, -spacing)
                else
                    alert:SetPoint("BOTTOM", activeAlerts[i - 1], "TOP", 0, spacing)
                end
            end
        end
    end
end

-- 更新 "+X" 闪烁动画（完全模仿 ls_Toasts 的 IconText2.Blink）
local function UpdateCountAddAnim(alert, dt)
    local anim = alert.countAddAnim
    
    if anim.step == 0 then
        -- 未开始，不做任何事
        return
    elseif anim.step == 1 then
        -- 淡入：0.2秒（模仿 ls_Toasts）
        anim.alpha = anim.alpha + dt * 5  -- 5 = 1/0.2
        if anim.alpha >= 1 then
            anim.alpha = 1
            anim.step = 2
            anim.time = 0
        end
        alert.countAddText:SetAlpha(anim.alpha)
    elseif anim.step == 2 then
        -- 保持：0.4秒（模仿 ls_Toasts）
        anim.time = anim.time + dt
        if anim.time >= 0.4 then
            anim.step = 3
            anim.time = 0
        end
    elseif anim.step == 3 then
        -- 淡出：0.4秒（模仿 ls_Toasts）
        anim.alpha = anim.alpha - dt * 2.5  -- 2.5 = 1/0.4
        if anim.alpha <= 0 then
            anim.alpha = 0
            anim.step = 0  -- 重置为未开始状态
            alert.countAddText:SetAlpha(0)
        else
            alert.countAddText:SetAlpha(anim.alpha)
        end
    end
end

-- 更新入场动画（完全模仿 ls_Toasts 的 AnimIn）
local function UpdateAnimIn(alert, dt)
    local state = alert.animState
    
    -- Glow 发光动画：0.2秒淡入，0.5秒淡出（完全模仿 ls_Toasts）
    if state.glowStep == 0 then
        state.glowStep = 1
        state.glowAlpha = 0
        state.glowTime = 0
    elseif state.glowStep == 1 then
        -- 淡入阶段：0.2秒
        state.glowTime = state.glowTime + dt
        state.glowAlpha = state.glowTime / 0.2
        if state.glowAlpha >= 1 then
            state.glowAlpha = 1
            state.glowStep = 2
            state.glowTime = 0
        end
        alert.glow:SetAlpha(state.glowAlpha)
    elseif state.glowStep == 2 then
        -- 淡出阶段：0.5秒
        state.glowTime = state.glowTime + dt
        state.glowAlpha = 1 - (state.glowTime / 0.5)
        if state.glowAlpha <= 0 then
            state.glowAlpha = 0
            state.glowStep = 3
        end
        alert.glow:SetAlpha(state.glowAlpha)
    end
    
    -- Shine 扫光动画：从图标右边开始扫到右边缘
    -- 0.2秒淡入，0.85秒平移，0.35秒延迟后0.5秒淡出
    if state.shineStep == 0 then
        state.shineStep = 1
        state.shineTime = 0
        state.shineAlpha = 0
        state.shineOffset = 48  -- 从图标右边开始（图标宽度48像素）
        -- 重置位置到图标右侧
        alert.shine:ClearAllPoints()
        alert.shine:SetPoint("CENTER", alert, "LEFT", 48, 0)
    elseif state.shineStep == 1 then
        -- 阶段1：淡入 (0.2秒)
        state.shineTime = state.shineTime + dt
        state.shineAlpha = state.shineTime / 0.2
        if state.shineAlpha >= 1 then
            state.shineAlpha = 1
            state.shineStep = 2
            state.shineTime = 0
        end
        alert.shine:SetAlpha(state.shineAlpha)
    elseif state.shineStep == 2 then
        -- 阶段2：平移 (0.85秒) + 延迟淡出 (0.35秒延迟后0.5秒淡出)
        state.shineTime = state.shineTime + dt
        local progress = state.shineTime / 0.85
        
        if progress > 1 then
            progress = 1
        end
        
        -- 平移：从图标右边(48)到右边缘(224)，移动距离176像素
        state.shineOffset = 48 + progress * 176
        alert.shine:ClearAllPoints()
        alert.shine:SetPoint("CENTER", alert, "LEFT", state.shineOffset, 0)
        
        -- 淡出：0.35秒后开始淡出 (0.5秒)
        if state.shineTime > 0.35 then
            local fadeProgress = (state.shineTime - 0.35) / 0.5
            state.shineAlpha = 1 - fadeProgress
            if state.shineAlpha < 0 then state.shineAlpha = 0 end
            alert.shine:SetAlpha(state.shineAlpha)
            
            -- 淡出完成后进入下一阶段
            if fadeProgress >= 1 then
                state.shineStep = 3
                state.shineTime = 0
            end
        end
    elseif state.shineStep == 3 then
        -- 完成：隐藏并重置位置到图标右侧
        alert.shine:SetAlpha(0)
        alert.shine:ClearAllPoints()
        alert.shine:SetPoint("CENTER", alert, "LEFT", 48, 0)
    end
end

-- 更新提示框
local function UpdateAlerts(dt)
    if not LootAlertDB then return end
    if not dt then dt = 0.016 end  -- 默认值，约60fps
    
    local currentTime = GetTime()
    
    -- 处理延迟队列
    ProcessPendingItems()
    
    -- 更新现有提示框
    for i = getn(activeAlerts), 1, -1 do
        local alert = activeAlerts[i]
        
        -- 如果鼠标悬停，暂停淡出但继续播放动画（完全模仿 ls_Toasts）
        if alert.isPaused then
            -- 保持完全不透明（应用用户设置的透明度）
            local bgAlpha = LootAlertDB.bgAlpha or 1.0
            alert:SetAlpha(bgAlpha)
            alert:SetScale(LootAlertDB.scale)
            
            -- 继续更新入场动画（Glow 和 Shine）- 和 ls_Toasts 一样
            if alert.animState.glowStep < 3 or alert.animState.shineStep < 3 then
                UpdateAnimIn(alert, dt)
            end
            
            -- 更新 "+X" 闪烁动画（和 ls_Toasts 一样）
            if alert.countAddAnim.step > 0 then
                UpdateCountAddAnim(alert, dt)
            end
            
            -- 更新金币动画（平滑过渡）
            if alert.isMoney and alert.moneyAnimTarget and alert.moneyAnimStart ~= alert.moneyAnimTarget then
                alert.moneyAnimTime = (alert.moneyAnimTime or 0) + dt
                local progress = alert.moneyAnimTime / (alert.moneyAnimDuration or 0.6)
                if progress >= 1 then
                    progress = 1
                    alert.moneyAnimStart = alert.moneyAnimTarget
                    local moneyText = FormatMoney(alert.moneyAnimTarget)
                    alert.itemName:SetText(moneyText)
                    alert.displayName = moneyText
                else
                    -- 平滑过渡金币数量
                    local currentAmount = math.floor(lerp(alert.moneyAnimStart, alert.moneyAnimTarget, progress))
                    local moneyText = FormatMoney(currentAmount)
                    alert.itemName:SetText(moneyText)
                end
            end
            
            -- 更新数量动画（完全模仿 ls_Toasts：0.6秒线性插值）
            if alert.currentCount ~= alert.targetCount then
                alert.countAnimTime = alert.countAnimTime + dt
                local progress = alert.countAnimTime / 0.6  -- 0.6秒完成（和 ls_Toasts 一致）
                if progress >= 1 then
                    progress = 1
                    alert.currentCount = alert.targetCount
                else
                    -- 使用线性插值（和 ls_Toasts 一致）
                    if alert.currentCount < alert.targetCount then
                        alert.currentCount = math.ceil(lerp(alert.currentCount, alert.targetCount, progress))
                    else
                        alert.currentCount = math.floor(lerp(alert.currentCount, alert.targetCount, progress))
                    end
                end
                
                -- 更新图标右下角的数量文字（使用 !MyLib 的数字格式化）
                if alert.currentCount > 1 then
                    alert.countText:SetText(FormatLargeNumber(alert.currentCount))
                else
                    alert.countText:SetText("")  -- 数量为1时不显示
                end
            end
        else
            -- 正常动画流程（完全模仿 ls_Toasts）
            local elapsed = currentTime - alert.startTime
            
            -- 阶段1：立即显示（0秒）- ls_Toasts 的 AnimIn.Anim1
            -- 不需要淡入，直接显示，让 Glow 和 Shine 来做入场效果
            if elapsed < LootAlertDB.duration then
                -- 显示状态：保持完全不透明（应用用户设置的透明度）
                local bgAlpha = LootAlertDB.bgAlpha or 1.0
                alert:SetAlpha(bgAlpha)
                alert:SetScale(LootAlertDB.scale)
                
                -- 更新入场动画（Glow 和 Shine）
                if alert.animState.glowStep < 3 or alert.animState.shineStep < 3 then
                    UpdateAnimIn(alert, dt)
                end
                
                -- 更新 "+X" 闪烁动画
                if alert.countAddAnim.step > 0 then
                    UpdateCountAddAnim(alert, dt)
                end
            
                -- 更新金币动画（平滑过渡，完全模仿 ls_Toasts）
                if alert.isMoney and alert.moneyAnimTarget and alert.moneyAnimStart ~= alert.moneyAnimTarget then
                    alert.moneyAnimTime = (alert.moneyAnimTime or 0) + dt
                    local progress = alert.moneyAnimTime / (alert.moneyAnimDuration or 0.6)
                    if progress >= 1 then
                        progress = 1
                        alert.moneyAnimStart = alert.moneyAnimTarget
                        local moneyText = FormatMoney(alert.moneyAnimTarget)
                        alert.itemName:SetText(moneyText)
                        alert.displayName = moneyText
                    else
                        -- 平滑过渡金币数量
                        local currentAmount = math.floor(lerp(alert.moneyAnimStart, alert.moneyAnimTarget, progress))
                        local moneyText = FormatMoney(currentAmount)
                        alert.itemName:SetText(moneyText)
                    end
                end
                
                -- 更新数量动画（平滑过渡，完全模仿 ls_Toasts）
                if alert.currentCount ~= alert.targetCount then
                    alert.countAnimTime = alert.countAnimTime + dt
                    local progress = alert.countAnimTime / 0.6  -- 0.6秒完成（和 ls_Toasts 一致）
                    if progress >= 1 then
                        progress = 1
                        alert.currentCount = alert.targetCount
                    else
                        -- 使用线性插值（和 ls_Toasts 一致）
                        if alert.currentCount < alert.targetCount then
                            alert.currentCount = math.ceil(lerp(alert.currentCount, alert.targetCount, progress))
                        else
                            alert.currentCount = math.floor(lerp(alert.currentCount, alert.targetCount, progress))
                        end
                    end
                    
                    -- 更新图标右下角的数量文字（使用 !MyLib 的数字格式化）
                    if alert.currentCount > 1 then
                        alert.countText:SetText(FormatLargeNumber(alert.currentCount))
                    else
                        alert.countText:SetText("")  -- 数量为1时不显示
                    end
                end
                
            elseif elapsed < LootAlertDB.duration + 1.2 then
                -- 阶段2：淡出（1.2秒）- 完全模仿 ls_Toasts 的 AnimOut
                -- 金币特殊处理：如果是金币且最近有变化，延长显示时间
                if alert.isMoney and alert.lastMoneyChangeTime then
                    local timeSinceLastChange = currentTime - alert.lastMoneyChangeTime
                    local bgAlpha = LootAlertDB.bgAlpha or 1.0
                    if timeSinceLastChange < 2.0 then
                        -- 最近2秒内有金币变化，保持显示
                        alert:SetAlpha(bgAlpha)
                        alert:SetScale(LootAlertDB.scale)
                        -- 延长startTime，防止进入淡出
                        alert.startTime = currentTime - LootAlertDB.duration + 0.5
                    else
                        -- 超过2秒没有变化，开始淡出（1.2秒）- 完全模仿 ls_Toasts
                        local fadeProgress = (elapsed - LootAlertDB.duration) / 1.2
                        alert.alpha = (1 - fadeProgress) * bgAlpha
                        alert:SetAlpha(alert.alpha)
                        alert:SetScale(LootAlertDB.scale)
                        
                        -- 标记为正在淡出（完全模仿 ls_Toasts：不锁定位置）
                        alert.isFading = true
                    end
                else
                    -- 普通物品：正常淡出（1.2秒）- 完全模仿 ls_Toasts 的 AnimOut
                    local bgAlpha = LootAlertDB.bgAlpha or 1.0
                    local fadeProgress = (elapsed - LootAlertDB.duration) / 1.2
                    alert.alpha = (1 - fadeProgress) * bgAlpha
                    alert:SetAlpha(alert.alpha)
                    alert:SetScale(LootAlertDB.scale)
                    
                    -- 标记为正在淡出（完全模仿 ls_Toasts：不锁定位置）
                    alert.isFading = true
                end
        else
            -- 隐藏
            alert:Hide()
            alert.glow:SetAlpha(0)
            alert.shine:SetAlpha(0)
            alert.isFading = false
            table.remove(activeAlerts, i)
            end
        end
    end
    
    -- 更新所有提示框的位置（实现平滑上移效果）
    UpdateAlertPositions()
    
    -- 控制显示间隔：从队列中取出提示（完全参考 ls_Toasts，立即显示）
    -- 计算非淡出状态的提示框数量
    local activeCount = 0
    for _, alert in ipairs(activeAlerts) do
        if not alert.isFading then
            activeCount = activeCount + 1
        end
    end
    
    -- 一次性显示多个提示框，直到达到最大数量（完全模仿 ls_Toasts 的立即显示）
    -- ls_Toasts 不使用 displayInterval，而是立即显示所有队列中的物品
    if activeCount < LootAlertDB.maxAlerts and getn(lootQueue) > 0 then
        -- 计算可以显示的数量
        local canShow = math.min(LootAlertDB.maxAlerts - activeCount, getn(lootQueue))
        
        for i = 1, canShow do
            local data = table.remove(lootQueue, 1)
            if data then
                -- 立即显示，不延迟（和 ls_Toasts 一样）
                ShowAlert(data)
            end
        end
    end
end

-- 事件处理
local eventFrame = CreateFrame("Frame")
local isLoaded = false

eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("CHAT_MSG_LOOT")
eventFrame:RegisterEvent("CHAT_MSG_MONEY")  -- 监听金币拾取消息（只在拾取时触发）
eventFrame:RegisterEvent("PLAYER_MONEY")  -- 监听金币变化（所有金币变化都触发）
eventFrame:RegisterEvent("BAG_UPDATE")  -- 背包更新时触发
eventFrame:RegisterEvent("CHAT_MSG_SYSTEM")  -- 监听系统消息（任务奖励等）

-- 金币追踪变量
local lastMoney = 0
local lastMoneyChangeTime = 0
local moneyChangeFromLoot = false  -- 标记金币变化是否来自拾取
local playerMoneyEventCount = 0  -- 调试：统计PLAYER_MONEY事件触发次数

local recentLootItems = {}  -- 记录最近通过CHAT_MSG_LOOT获得的物品，避免重复提示



-- 清理过期的最近拾取记录
local function CleanRecentLoot()
    local currentTime = GetTime()
    for itemId, time in pairs(recentLootItems) do
        if currentTime - time > 3 then  -- 3秒后清理
            recentLootItems[itemId] = nil
        end
    end
end

eventFrame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" and arg1 == "LootAlert" and not isLoaded then
        isLoaded = true
        InitializeConfig()
        InitMinimapButton()  -- 初始化小地图按钮
        
        -- 检测库（在插件加载后）
        DetectLibraries()
        
        -- 重新获取 PLAYER_GUID（确保在插件加载后正确获取）
        if UnitGUID then
            -- 标准方法（零售版）
            PLAYER_GUID = UnitGUID("player")
        elseif UnitExists then
            -- Turtle WoW 方法：UnitExists 的第二个返回值是 GUID
            local exists, guid = UnitExists("player")
            if guid and type(guid) == "string" and strlen(guid) > 0 then
                PLAYER_GUID = guid
            end
        end
        
        -- 显示 GUID 状态
        if PLAYER_GUID then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] GUID 支持已启用！可精确识别拾取者|r")
        end
        
        -- 显示加载消息
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 已加载！输入 /lg 查看命令|r")
        
        -- 显示库检测信息
        if hasMyLib then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 检测到 !MyLib，启用增强功能（带词缀物品支持、大数字格式化）|r")
        end
        if hasSuperWoW then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 检测到 SuperWoW v" .. (SUPERWOW_VERSION or "未知") .. "|r")
        end
        
        -- 更新所有提示框的缩放和边框样式
        for _, alert in ipairs(alertPool) do
            alert:SetScale(LootAlertDB.scale)
            ApplyBorderStyle(alert)
        end
        
        -- 恢复保存的位置
        if LootAlertDB.position then
            LootAlertFrame:ClearAllPoints()
            LootAlertFrame:SetPoint(
                LootAlertDB.position.point or "TOP",
                UIParent,
                LootAlertDB.position.relativePoint or "TOP",
                LootAlertDB.position.x or 0,
                LootAlertDB.position.y or -150
            )
        end
        
        -- 初始化方向按钮文字
        UpdateDirectionButtonText()
        
        -- 初始化金币数量
        lastMoney = GetMoney()
        
    elseif event == "PLAYER_MONEY" then
        -- 金币变化事件（使用缓冲系统修复维修+售卖混淆问题）
        playerMoneyEventCount = playerMoneyEventCount + 1
        local currentMoney = GetMoney()
        
        -- 调试信息（在所有检查之前）- 添加事件计数
        if LootAlertDB and LootAlertDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage(string.format("|cffff00ff[拾取提示调试] PLAYER_MONEY 触发 #%d (时间:%.3f)|r", playerMoneyEventCount, GetTime()))
            DEFAULT_CHAT_FRAME:AddMessage(string.format("  当前=%d, 之前=%d, 差值=%+d", currentMoney, lastMoney, currentMoney - lastMoney))
        end
        
        -- 检查是否启用金币显示
        if not LootAlertDB or not LootAlertDB.showMoney then 
            lastMoney = currentMoney
            return 
        end
        
        -- 初始化（首次运行）
        if lastMoney == 0 then
            lastMoney = currentMoney
            return
        end
        
        local diff = currentMoney - lastMoney
        
        -- 先更新 lastMoney（关键！必须在显示提示之前更新，避免重复触发）
        lastMoney = currentMoney
        
        -- 如果没有变化，直接返回
        if diff == 0 then return end
        
        -- 判断是否应该显示
        local shouldShow = false
        if LootAlertDB.trackLoss then
            -- 追踪损失模式：显示所有非零变化
            shouldShow = true
        else
            -- 不追踪损失：只显示正数且大于等于阈值的变化
            if diff > 0 then
                if LootAlertDB.useGoldThreshold then
                    local threshold = LootAlertDB.goldThreshold or 1
                    if threshold < 1 then threshold = 1 end
                    shouldShow = (diff >= threshold)
                else
                    shouldShow = true
                end
            end
        end
        
        -- 如果不应该显示，直接返回
        if not shouldShow then
            if LootAlertDB.debug then
                DEFAULT_CHAT_FRAME:AddMessage(string.format("[拾取提示调试] 金币变化被过滤: %+d 铜币", diff))
            end
            return
        end
        
        if LootAlertDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage(string.format("[拾取提示调试] 金币变化进入缓冲: %+d 铜币", diff))
        end
        
        -- 添加到缓冲区
        BufferMoneyChange(diff, GetTime())
        
        -- 取消之前的延迟处理
        if moneyChangeBuffer.timer then
            moneyChangeBuffer.timer:SetScript("OnUpdate", nil)
            moneyChangeBuffer.timer = nil
        end
        
        -- 延迟0.15秒处理（给时间让所有相关事件触发完）
        -- 使用 C_Timer.After（!Libs 提供）
        if C_Timer and C_Timer.After then
            C_Timer.After(moneyChangeBuffer.bufferDelay, ProcessMoneyBuffer)
        else
            -- 备用方案：自己实现延迟
            moneyChangeBuffer.timer = CreateFrame("Frame")
            moneyChangeBuffer.timer.elapsed = 0
            moneyChangeBuffer.timer:SetScript("OnUpdate", function()
                this.elapsed = this.elapsed + arg1
                if this.elapsed >= moneyChangeBuffer.bufferDelay then
                    ProcessMoneyBuffer()
                    this:SetScript("OnUpdate", nil)
                    moneyChangeBuffer.timer = nil
                end
            end)
        end

        
    elseif event == "CHAT_MSG_MONEY" then
        -- CHAT_MSG_MONEY 事件：拾取金币时触发（只在拾取时触发，不在购买/维修时触发）
        -- 这个事件会在 PLAYER_MONEY 之前触发
        -- 我们不在这里处理金币显示，完全由 PLAYER_MONEY 处理
        -- 这样可以避免重复显示，并且能正确累加金币
        
        if LootAlertDB and LootAlertDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] CHAT_MSG_MONEY 事件触发: " .. tostring(arg1))
        end
        
        -- 不做任何处理，让 PLAYER_MONEY 处理所有金币变化
        
    elseif event == "CHAT_MSG_LOOT" then
        -- CHAT_MSG_LOOT 事件会捕获所有拾取消息（包括队友的）
        -- 参考 ls_Toasts：只处理玩家自己的拾取
        
        local message = arg1
        local playerName = arg2  -- 拾取者名字（arg2）
        local guid = arg12  -- Turtle WoW 的 GUID 参数（第12个参数）
        
        -- 调试：打印拾取消息和拾取者信息
        if LootAlertDB and LootAlertDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] LOOT消息: " .. tostring(message))
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 拾取者名字(arg2): " .. tostring(playerName))
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 拾取者GUID(arg12): " .. tostring(guid))
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 玩家名字: " .. tostring(PLAYER_NAME))
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 玩家GUID: " .. tostring(PLAYER_GUID))
        end
        
        -- 三重验证：玩家名字 + GUID + 消息文本（按优先级验证）
        local isPlayerLoot = false
        
        -- 方法1：玩家名字验证（最可靠，如果有名字就优先使用）
        if playerName and PLAYER_NAME and playerName ~= "" then
            if playerName == PLAYER_NAME then
                isPlayerLoot = true
                if LootAlertDB and LootAlertDB.debug then
                    DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ✓ 玩家名字验证通过: " .. playerName)
                end
            else
                -- 名字不匹配，肯定是队友的
                if LootAlertDB and LootAlertDB.debug then
                    DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ✗ 玩家名字不匹配 (" .. tostring(playerName) .. " != " .. tostring(PLAYER_NAME) .. ")，跳过队友拾取")
                end
                return
            end
        end
        
        -- 方法2：GUID 验证（Turtle WoW 支持，如果名字验证没通过就用 GUID）
        if not isPlayerLoot and PLAYER_GUID and guid and guid ~= "" then
            if guid == PLAYER_GUID then
                isPlayerLoot = true
                if LootAlertDB and LootAlertDB.debug then
                    DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ✓ GUID验证通过")
                end
            else
                -- GUID 不匹配，肯定是队友的
                if LootAlertDB and LootAlertDB.debug then
                    DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ✗ GUID不匹配，跳过队友拾取")
                end
                return
            end
        end
        
        -- 方法3：消息文本验证（最后的备用方案，如果前两个都没有就用文本）
        if not isPlayerLoot then
            -- 检查消息是否以"你"或"You"开头（只有自己的拾取消息才这样开头）
            -- 队友的消息格式是："XXX获得了物品"或"XXX赢得了物品"，不会以"你"开头
            if strfind(message, "^你") or strfind(message, "^You ") then
                isPlayerLoot = true
                if LootAlertDB and LootAlertDB.debug then
                    DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ✓ 消息文本验证通过")
                end
            else
                -- 消息不以"你"开头，肯定是队友的
                if LootAlertDB and LootAlertDB.debug then
                    DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ✗ 消息不以'你'开头，跳过队友拾取")
                end
                return
            end
        end
        
        -- 最终检查：如果所有验证都失败，直接返回（安全起见）
        if not isPlayerLoot then
            if LootAlertDB and LootAlertDB.debug then
                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ✗ 所有验证都失败，跳过")
            end
            return
        end
        
        -- 验证通过，继续处理拾取
        if LootAlertDB and LootAlertDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ✓✓✓ 最终验证通过，这是自己的拾取")
        end
        
        -- 检测是否是ROLL消息（"赢得了"/"won"）
        -- 当玩家点击"放弃"ROLL时，某些服务器仍会发送"你赢得了"消息
        -- 我们需要通过背包验证来确保真的获得了物品
        local isRollMessage = strfind(message, "赢得了") or strfind(message, "won")
        
        -- 调试信息
        if LootAlertDB and LootAlertDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 验证通过，这是自己的拾取")
            if isRollMessage then
                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 检测到ROLL消息，将严格验证背包")
            end
        end
        
        -- 过滤掉 ROLL 选择消息（需求、贪婪、放弃）
        -- 参考 ls_Toasts，只处理真正的拾取消息
        if strfind(message, "选择了需求") or strfind(message, "选择了贪婪") or strfind(message, "选择了放弃") 
           or strfind(message, "passed on") or strfind(message, "选择") then
            -- 这是 ROLL 选择消息，不是真正的拾取，跳过
            if LootAlertDB and LootAlertDB.debug then
                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 过滤 ROLL 选择消息: " .. tostring(message))
            end
            return
        end
        
        local itemLink, count = ParseLootMessage(arg1)
        if itemLink then
            -- 记录到最近拾取列表
            local itemId = GetItemIdFromLink(itemLink)
            if itemId then
                recentLootItems[tostring(itemId)] = GetTime()
            end
            
            -- 调试：打印解析结果
            if LootAlertDB and LootAlertDB.debug then
                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 解析成功: " .. tostring(itemLink) .. " x" .. tostring(count))
            end
            
            -- 延迟验证并添加提示，确保物品真的进入背包
            -- 对于ROLL消息，延迟时间0.5秒，确保背包已更新
            -- 对于普通拾取，延迟0.2秒（加快显示速度）
            local delayTime = isRollMessage and 0.5 or 0.2
            local maxWaitTime = isRollMessage and 2.0 or 1.5  -- 最大等待时间
            local capturedLink = itemLink
            local capturedCount = count
            local capturedIsRoll = isRollMessage
            local delayFrame = CreateFrame("Frame")
            delayFrame.elapsed = 0
            delayFrame.retries = 0
            delayFrame.verified = false
            delayFrame:SetScript("OnUpdate", function()
                this.elapsed = this.elapsed + arg1
                
                -- 每0.1秒尝试触发一次物品信息加载
                if this.retries < 5 and this.elapsed >= this.retries * 0.1 then
                    this.retries = this.retries + 1
                    local itemString = string_match(capturedLink, "(item:%d+[^|]*)")
                    if itemString then
                        pcall(function()
                            scanTooltip:ClearLines()
                            scanTooltip:SetHyperlink(itemString)
                        end)
                    end
                end
                
                -- 达到延迟时间后开始验证，或者超过最大等待时间
                if this.elapsed >= delayTime and not this.verified then
                    -- 验证物品是否真的在背包里（防止背包满了或ROLL失败误报）
                    local itemId = GetItemIdFromLink(capturedLink)
                    local foundInBag = false
                    local bagItemCount = 0
                    
                    if itemId then
                        -- 在背包中查找物品，并统计数量
                        for bag = 0, 4 do
                            local numSlots = GetContainerNumSlots(bag)
                            if numSlots then
                                for slot = 1, numSlots do
                                    local link = GetContainerItemLink(bag, slot)
                                    if link then
                                        local bagItemId = GetItemIdFromLink(link)
                                        if bagItemId == itemId then
                                            foundInBag = true
                                            -- 获取该槽位的物品数量
                                            local _, itemCount = GetContainerItemInfo(bag, slot)
                                            if itemCount then
                                                bagItemCount = bagItemCount + itemCount
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    -- 对于ROLL消息和普通拾取，都必须在背包中找到物品才显示
                    if foundInBag then
                        AddLootAlert(capturedLink, capturedCount)
                        this.verified = true
                        this:SetScript("OnUpdate", nil)
                        if LootAlertDB and LootAlertDB.debug then
                            if capturedIsRoll then
                                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ROLL物品已在背包中确认，显示提示")
                            else
                                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 物品已在背包中确认，显示提示")
                            end
                        end
                    elseif this.elapsed >= maxWaitTime then
                        -- 超过最大等待时间仍未找到，放弃
                        this:SetScript("OnUpdate", nil)
                        if LootAlertDB and LootAlertDB.debug then
                            if capturedIsRoll then
                                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] ROLL物品未在背包中找到（超时），可能是放弃ROLL或背包已满，不显示")
                            else
                                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 物品未在背包中找到（超时），可能背包已满，不显示")
                            end
                        end
                    end
                    -- 如果还没找到且未超时，继续等待下一帧
                end
            end)
        else
            -- 调试：打印解析失败
            if LootAlertDB and LootAlertDB.debug then
                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 解析失败")
            end
        end
        
    
    elseif event == "CHAT_MSG_SYSTEM" then
        -- 系统消息事件（捕获任务奖励等）
        if not LootAlertDB or not LootAlertDB.enabled then return end
        
        -- 调试：打印系统消息
        if LootAlertDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 系统消息: " .. tostring(arg1))
        end
        
        -- 多重检查：确保100%是自己的系统消息
        local isSelfMessage = false
        
        -- 检查1：消息必须以"获得"或"You"开头
        if strfind(arg1, "^获得") then
            isSelfMessage = true
        elseif strfind(arg1, "^You receive") or strfind(arg1, "^You get") then
            isSelfMessage = true
        end
        
        -- 检查2：如果消息包含空格+中文字符在"获得"之前，说明是玩家名
        -- 例如："张三 获得物品" - 这是队友的
        if isSelfMessage and strfind(arg1, "%s+获得") then
            -- 有空格在"获得"前面，说明前面有玩家名，这是队友的消息
            isSelfMessage = false
        end
        
        -- 检查3：如果还不确定，直接返回（宁可不显示，也不显示队友的）
        if not isSelfMessage then
            return
        end
        
        -- 调试信息（只在确认是自己的消息时才显示）
        if LootAlertDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 自己的系统消息: " .. tostring(arg1))
        end
        
        -- 首先尝试解析金币（任务奖励金币）
        -- 格式示例：
        -- "你获得了 5 金 20 银 30 铜。"
        -- "You receive 5 gold, 20 silver, 30 copper."
        -- "获得金币：5金20银30铜"
        local moneyAmount = 0
        local hasMoneyReward = false
        
        -- 中文格式：提取金、银、铜
        local gold = string_match(arg1, "(%d+)%s*金") or string_match(arg1, "(%d+)%s*gold")
        local silver = string_match(arg1, "(%d+)%s*银") or string_match(arg1, "(%d+)%s*silver")
        local copper = string_match(arg1, "(%d+)%s*铜") or string_match(arg1, "(%d+)%s*copper")
        
        if gold or silver or copper then
            hasMoneyReward = true
            moneyAmount = (tonumber(gold) or 0) * 10000 + (tonumber(silver) or 0) * 100 + (tonumber(copper) or 0)
            
            if LootAlertDB.debug then
                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 系统消息解析到金币: " .. moneyAmount .. "铜币 (" .. (gold or 0) .. "金 " .. (silver or 0) .. "银 " .. (copper or 0) .. "铜)")
            end
        end
        
        -- 如果解析到金币，显示金币提示
        -- 注意：任务奖励金币会同时触发 PLAYER_MONEY 和 CHAT_MSG_SYSTEM
        -- 为了避免重复显示，我们不在这里处理金币，完全由 PLAYER_MONEY 处理
        if hasMoneyReward and moneyAmount > 0 and LootAlertDB.showMoney then
            if LootAlertDB.debug then
                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 系统消息检测到金币，但由 PLAYER_MONEY 处理，跳过")
            end
            -- 不处理金币，避免与 PLAYER_MONEY 重复
            -- 直接跳过金币处理，继续解析物品
        end
        
        -- 旧的金币处理代码已禁用，避免重复显示
        --[[
        if hasMoneyReward and moneyAmount > 0 and LootAlertDB.showMoney then
            -- 检查金币阈值
            if not LootAlertDB.useGoldThreshold or moneyAmount >= (LootAlertDB.goldThreshold or 1) then
                -- 查找现有金币提示
                local existingAlert = nil
                for _, alert in ipairs(activeAlerts) do
                    if alert:IsShown() and alert.isMoney and not alert.isFading then
                        existingAlert = alert
                        break
                    end
                end
                
                if existingAlert then
                    -- 累加到现有提示
                    PlayMoneySound()
                    
                    local currentDisplayAmount
                    if existingAlert.moneyAnimTarget and existingAlert.moneyAnimStart ~= existingAlert.moneyAnimTarget then
                        local progress = (existingAlert.moneyAnimTime or 0) / (existingAlert.moneyAnimDuration or 0.6)
                        if progress > 1 then progress = 1 end
                        currentDisplayAmount = math.floor(lerp(existingAlert.moneyAnimStart, existingAlert.moneyAnimTarget, progress))
                    else
                        currentDisplayAmount = existingAlert.moneyAmount or 0
                    end
                    
                    local newAmount = (existingAlert.moneyAmount or 0) + moneyAmount
                    existingAlert.moneyAmount = newAmount
                    
                    if existingAlert.icon then
                        existingAlert.icon:SetTexture(GetMoneyIcon(newAmount))
                    end
                    
                    existingAlert.moneyAnimStart = currentDisplayAmount
                    existingAlert.moneyAnimTarget = newAmount
                    existingAlert.moneyAnimTime = 0
                    existingAlert.moneyAnimDuration = 0.6
                    existingAlert.lastMoneyChangeTime = GetTime()
                    
                    local elapsed = GetTime() - existingAlert.startTime
                    local fadeInDuration = 0.2  -- 入场动画时长（统一为0.2秒，和ls_Toasts一致）
                    if elapsed > fadeInDuration then
                        existingAlert.startTime = GetTime() - fadeInDuration
                    end
                else
                    -- 创建新金币提示（立即显示）
                    local moneyText = FormatMoney(moneyAmount)
                    local moneyData = {
                        name = moneyText,
                        link = nil,
                        quality = 6,
                        texture = GetMoneyIcon(moneyAmount),
                        count = 1,
                        isMoney = true,
                        moneyAmount = moneyAmount,
                        moneyAnimStart = moneyAmount,
                        moneyAnimTarget = moneyAmount,
                        needsUpdate = false
                    }
                    
                    ShowAlert(moneyData)
                    
                    if LootAlertDB.debug then
                        DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 系统消息金币提示已显示")
                    end
                end
            end
        end
        ]]--
        
        -- 然后解析物品（任务奖励、邮件等）
        -- 格式1: 获得物品：[物品链接]
        -- 格式2: 获得物品：[物品链接] x数量
        -- 格式3: You receive item: [item link]
        
        -- 尝试多种匹配方式，从最宽松到最严格
        local itemLink = nil
        
        -- 方法1：匹配任何"获得"后面的物品链接（最宽松）
        itemLink = string_match(arg1, "获得.-([|c%x]+|Hitem:[^|]+|h%[[^%]]+%]|h|r)")
        
        -- 方法2：如果方法1失败，尝试匹配"获得物品"
        if not itemLink then
            itemLink = string_match(arg1, "获得物品[：:](|c%x+|Hitem:[^|]+|h%[[^%]]+%]|h|r)")
        end
        
        -- 方法3：匹配"获得战利品"
        if not itemLink then
            itemLink = string_match(arg1, "获得战利品[：:](|c%x+|Hitem:[^|]+|h%[[^%]]+%]|h|r)")
        end
        
        -- 方法4：英文格式
        if not itemLink then
            itemLink = string_match(arg1, "[Rr]eceive item[：:]%s*(|c%x+|Hitem:[^|]+|h%[[^%]]+%]|h|r)")
        end
        
        -- 方法5：You get 格式
        if not itemLink then
            itemLink = string_match(arg1, "[Yy]ou get[：:]%s*(|c%x+|Hitem:[^|]+|h%[[^%]]+%]|h|r)")
        end
        
        if itemLink then
            -- 提取数量
            local count = 1
            local countStr = string_match(arg1, "[x×%*](%d+)")
            if countStr then
                count = tonumber(countStr) or 1
            end
            
            -- 记录到最近拾取列表
            local itemId = GetItemIdFromLink(itemLink)
            if itemId then
                recentLootItems[tostring(itemId)] = GetTime()
            end
            
            -- 调试：打印解析结果
            if LootAlertDB.debug then
                DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 系统消息解析成功: " .. tostring(itemLink) .. " x" .. tostring(count))
            end
            
            -- 延迟验证并添加提示，确保物品真的进入背包
            -- 系统消息（任务奖励等）延迟0.2秒验证（加快显示速度）
            local delayTime = 0.2
            local maxWaitTime = 1.5  -- 最大等待时间
            local capturedLink = itemLink
            local capturedCount = count
            local delayFrame = CreateFrame("Frame")
            delayFrame.elapsed = 0
            delayFrame.retries = 0
            delayFrame.verified = false
            delayFrame:SetScript("OnUpdate", function()
                this.elapsed = this.elapsed + arg1
                
                -- 每0.1秒尝试触发一次物品信息加载
                if this.retries < 5 and this.elapsed >= this.retries * 0.1 then
                    this.retries = this.retries + 1
                    local itemString = string_match(capturedLink, "(item:%d+[^|]*)")
                    if itemString then
                        pcall(function()
                            scanTooltip:ClearLines()
                            scanTooltip:SetHyperlink(itemString)
                        end)
                    end
                end
                
                -- 达到延迟时间后开始验证，或者超过最大等待时间
                if this.elapsed >= delayTime and not this.verified then
                    -- 验证物品是否真的在背包里
                    local itemId = GetItemIdFromLink(capturedLink)
                    local foundInBag = false
                    
                    if itemId then
                        for bag = 0, 4 do
                            local numSlots = GetContainerNumSlots(bag)
                            if numSlots then
                                for slot = 1, numSlots do
                                    local link = GetContainerItemLink(bag, slot)
                                    if link then
                                        local bagItemId = GetItemIdFromLink(link)
                                        if bagItemId == itemId then
                                            foundInBag = true
                                            break
                                        end
                                    end
                                end
                                if foundInBag then break end
                            end
                        end
                    end
                    
                    -- 只有在背包中找到物品时才显示提示
                    if foundInBag then
                        AddLootAlert(capturedLink, capturedCount)
                        this.verified = true
                        this:SetScript("OnUpdate", nil)
                        if LootAlertDB and LootAlertDB.debug then
                            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 系统消息物品已在背包中确认，显示提示")
                        end
                    elseif this.elapsed >= maxWaitTime then
                        -- 超过最大等待时间仍未找到，放弃
                        this:SetScript("OnUpdate", nil)
                        if LootAlertDB and LootAlertDB.debug then
                            DEFAULT_CHAT_FRAME:AddMessage("[拾取提示调试] 系统消息物品未在背包中找到（超时），不显示")
                        end
                    end
                    -- 如果还没找到且未超时，继续等待下一帧
                end
            end)
        end
        
    elseif event == "BAG_UPDATE" then
        -- 背包更新时，尝试更新所有等待图标的物品（简化版）
        for _, pending in ipairs(pendingItems) do
            if pending.data.texture == "Interface\\Icons\\INV_Misc_QuestionMark" and pending.data.itemId then
                -- 优先使用 GetItemInfo
                local _, _, _, _, _, _, _, _, _, icon = GetItemInfo(pending.data.itemId)
                local texture = icon or GetItemTextureFromBags(pending.data.itemId)
                
                if texture and texture ~= "Interface\\Icons\\INV_Misc_QuestionMark" then
                    -- 找到了图标，更新
                    pending.data.texture = texture
                    
                    -- 更新队列中的物品
                    for _, queueData in ipairs(lootQueue) do
                        if queueData.link == pending.link then
                            queueData.texture = texture
                        end
                    end
                    
                    -- 更新正在显示的提示框
                    for _, alert in ipairs(activeAlerts) do
                        if alert:IsShown() and alert.itemLink == pending.link then
                            alert.icon:SetTexture(texture)
                        end
                    end
                end
            end
        end
        

    end
end)

-- 主更新循环
local originalOnUpdate = eventFrame:GetScript("OnUpdate")
eventFrame:SetScript("OnUpdate", function()
    -- 调用原有的更新逻辑
    if originalOnUpdate then
        originalOnUpdate()
    end
    
    UpdateAlerts(arg1)
    
    -- 清理过期的最近拾取记录
    CleanRecentLoot()
    

end)





-- 测试函数（全局，供Config.lua调用）
function TestLootAlert(quality)
    local testItems = {
        [0] = {
            {"破损的剑", "Interface\\Icons\\INV_Sword_04"},
            {"破烂的布片", "Interface\\Icons\\INV_Fabric_Linen_01"},
        },
        [1] = {
            {"公式：附魔护腕 - 初级力量", "Interface\\Icons\\INV_Misc_Note_01"},
            {"亚麻布", "Interface\\Icons\\INV_Fabric_Linen_01"},
        },
        [2] = {
            {"配方：初级敏捷药剂", "Interface\\Icons\\INV_Scroll_03"},
            {"绿色优秀装备", "Interface\\Icons\\INV_Chest_Leather_06"},
        },
        [3] = {
            {"超级无敌霹雳巨型蓝色稀有武器", "Interface\\Icons\\INV_Sword_27"},
            {"蓝色稀有护甲", "Interface\\Icons\\INV_Chest_Plate16"},
        },
        [4] = {
            {"紫色装备", "Interface\\Icons\\INV_Chest_Plate16"},
            {"史诗武器", "Interface\\Icons\\INV_Sword_50"},
        },
        [5] = {
            {"传说级别的超长名字橙色装备测试物品", "Interface\\Icons\\INV_Misc_AhnQirajOuro"},
            {"橙色传说", "Interface\\Icons\\INV_Sword_39"},
        }
    }
    
    local items = testItems[quality]
    if items then
        for _, item in ipairs(items) do
            -- 根据品质生成测试物品等级
            local testItemLevel = nil
            if quality >= 2 then
                -- 绿色及以上品质显示物品等级
                testItemLevel = random(10, 60)  -- 随机10-60级
            end
            
            table.insert(lootQueue, {
                name = item[1],
                link = nil,
                quality = quality,
                texture = item[2],
                count = random(1, 5),
                isMoney = false,
                needsUpdate = false,
                itemLevel = testItemLevel  -- 添加物品等级
            })
        end
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试品质 "..quality.." 的物品|r")
    end
end

-- 斜杠命令
SLASH_LOOTALERT1 = "/lootalert"
SLASH_LOOTALERT2 = "/拾取提示"
SLASH_LOOTALERT3 = "/lg"
SlashCmdList["LOOTALERT"] = function(msg)
    if not LootAlertDB then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[拾取提示] 插件未正确加载！|r")
        return
    end
    
    msg = strlower(msg)
    
    if msg == "on" or msg == "开启" then
        LootAlertDB.enabled = true
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 已开启|r")
        
    elseif msg == "off" or msg == "关闭" then
        LootAlertDB.enabled = false
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[拾取提示] 已关闭|r")
        
    elseif strfind(msg, "quality") or strfind(msg, "品质") then
        local quality = tonumber(string_match(msg, "%d+"))
        if quality and quality >= 0 and quality <= 5 then
            LootAlertDB.minQuality = quality
            local qualityNames = {"灰色", "白色", "绿色", "蓝色", "紫色", "橙色"}
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 最低品质设置为: "..qualityNames[quality+1].."|r")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[拾取提示] 品质值必须在 0-5 之间|r")
        end
        
    elseif strfind(msg, "debug") or strfind(msg, "调试") then
        -- 切换调试模式
        if not LootAlertDB.debug then
            LootAlertDB.debug = true
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 调试模式已开启|r")
            DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00提示：现在拾取物品时会显示详细的调试信息|r")
        else
            LootAlertDB.debug = false
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 调试模式已关闭|r")
        end
        
    elseif msg == "guid" or msg == "guid测试" then
        -- 显示 GUID 信息
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00========== GUID 测试 ==========|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00玩家名字：|r " .. tostring(PLAYER_NAME))
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00玩家GUID：|r " .. tostring(PLAYER_GUID))
        
        -- 检测 GUID 功能是否可用
        if PLAYER_GUID then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00✓ GUID 功能可用|r")
            DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00说明：|r 插件将使用 GUID 验证来过滤队友的拾取")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000✗ GUID 功能不可用|r")
            DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00说明：|r 插件将使用消息文本验证来过滤队友的拾取")
        end
        
        DEFAULT_CHAT_FRAME:AddMessage("")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00GUID 获取方法测试：|r")
        
        -- 方法1：UnitGUID 函数（零售版）
        if UnitGUID then
            local testGuid = UnitGUID("player")
            DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00方法1 - UnitGUID('player')：|r " .. tostring(testGuid))
            if testGuid and testGuid == PLAYER_GUID then
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  ✓ 可用且匹配|r")
            elseif testGuid then
                DEFAULT_CHAT_FRAME:AddMessage("|cffff9900  ⚠ 可用但不匹配|r")
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cffff0000  ✗ 返回 nil|r")
            end
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000方法1 - UnitGUID 函数不存在|r")
        end
        
        -- 方法2：UnitExists 的第二个返回值（Turtle WoW）
        if UnitExists then
            local exists, guid = UnitExists("player")
            DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00方法2 - UnitExists('player')：|r")
            DEFAULT_CHAT_FRAME:AddMessage("  exists = " .. tostring(exists))
            DEFAULT_CHAT_FRAME:AddMessage("  guid = " .. tostring(guid))
            if guid and type(guid) == "string" and strlen(guid) > 0 then
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  ✓ Turtle WoW GUID 可用！|r")
                if guid == PLAYER_GUID then
                    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  ✓ 与 PLAYER_GUID 匹配|r")
                else
                    DEFAULT_CHAT_FRAME:AddMessage("|cffff9900  ⚠ 与 PLAYER_GUID 不匹配|r")
                end
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cffff0000  ✗ GUID 不可用|r")
            end
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000方法2 - UnitExists 函数不存在|r")
        end
        
        DEFAULT_CHAT_FRAME:AddMessage("")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00测试方法：|r")
        DEFAULT_CHAT_FRAME:AddMessage("1. 输入 |cff00ff00/lg debug|r 开启调试模式")
        DEFAULT_CHAT_FRAME:AddMessage("2. 拾取物品或 ROLL 物品")
        DEFAULT_CHAT_FRAME:AddMessage("3. 查看聊天框中的 GUID 信息")
        DEFAULT_CHAT_FRAME:AddMessage("4. 如果显示 'GUID验证通过'，说明工作正常")
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00================================|r")
        
    elseif msg == "info" or msg == "信息" then
        -- 显示插件信息和库检测结果
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00========== 拾取提示插件信息 ==========|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00版本：|r 1.1")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00作者：|r 嘎子")
        DEFAULT_CHAT_FRAME:AddMessage("")
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00库检测结果：|r")
        
        -- 重新检测库（确保最新状态）
        DetectLibraries()
        
        if hasMyLib then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  ✓ !MyLib|r - 已检测到")
            DEFAULT_CHAT_FRAME:AddMessage("    - 带词缀物品支持")
            DEFAULT_CHAT_FRAME:AddMessage("    - 大数字格式化（显示为'万'）")
            DEFAULT_CHAT_FRAME:AddMessage("    - 标准 Lua 5.1 API")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000  ✗ !MyLib|r - 未检测到")
            DEFAULT_CHAT_FRAME:AddMessage("    提示：安装 !Libs 文件夹可启用增强功能")
        end
        
        if hasSuperWoW then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  ✓ SuperWoW|r - v" .. (SUPERWOW_VERSION or "未知"))
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000  ✗ SuperWoW|r - 未检测到")
        end
        
        if hasLSM then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  ✓ LibSharedMedia-3.0|r - 已检测到")
            DEFAULT_CHAT_FRAME:AddMessage("    - 字体选择功能已启用")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000  ✗ LibSharedMedia-3.0|r - 未检测到")
            DEFAULT_CHAT_FRAME:AddMessage("    提示：安装 !Libs 文件夹可启用字体选择")
        end
        
        DEFAULT_CHAT_FRAME:AddMessage("")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00功能检测：|r")
        DEFAULT_CHAT_FRAME:AddMessage("  GetItemInfoByName: " .. (GetItemInfoByName and "|cff00ff00可用|r" or "|cffff0000不可用|r"))
        DEFAULT_CHAT_FRAME:AddMessage("  HexColors: " .. (HexColors and "|cff00ff00可用|r" or "|cffff0000不可用|r"))
        DEFAULT_CHAT_FRAME:AddMessage("  Over1E3toK: " .. (Over1E3toK and "|cff00ff00可用|r" or "|cffff0000不可用|r"))
        DEFAULT_CHAT_FRAME:AddMessage("  SUPERWOW_VERSION: " .. (SUPERWOW_VERSION and "|cff00ff00" .. SUPERWOW_VERSION .. "|r" or "|cffff0000不可用|r"))
        DEFAULT_CHAT_FRAME:AddMessage("  Waterfall-1.0: " .. (AceLibrary and AceLibrary:HasInstance("Waterfall-1.0") and "|cff00ff00可用|r" or "|cffff0000不可用|r"))
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00=====================================|r")
        
    elseif msg == "teststack" or msg == "测试累加" then
        -- 测试物品累加效果（使用延迟添加，模拟真实拾取）
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试物品累加效果|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00将在3秒内连续拾取5次相同物品，观察 +X 闪烁效果|r")
        
        -- 使用相同的物品链接模拟连续拾取
        local testLink = "|cff0070dd|Hitem:12345:0:0:0|h[测试蓝装]|h|r"
        
        -- 第1次：立即添加
        AddLootAlert(testLink, 1)
        
        -- 第2次：0.6秒后
        local timer1 = CreateFrame("Frame")
        timer1.elapsed = 0
        timer1:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1
            if this.elapsed >= 0.6 then
                AddLootAlert(testLink, 2)
                this:SetScript("OnUpdate", nil)
            end
        end)
        
        -- 第3次：1.2秒后
        local timer2 = CreateFrame("Frame")
        timer2.elapsed = 0
        timer2:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1
            if this.elapsed >= 1.2 then
                AddLootAlert(testLink, 3)
                this:SetScript("OnUpdate", nil)
            end
        end)
        
        -- 第4次：1.8秒后
        local timer3 = CreateFrame("Frame")
        timer3.elapsed = 0
        timer3:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1
            if this.elapsed >= 1.8 then
                AddLootAlert(testLink, 1)
                this:SetScript("OnUpdate", nil)
            end
        end)
        
        -- 第5次：2.4秒后
        local timer4 = CreateFrame("Frame")
        timer4.elapsed = 0
        timer4:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1
            if this.elapsed >= 2.4 then
                AddLootAlert(testLink, 5)
                this:SetScript("OnUpdate", nil)
            end
        end)
        
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00观察：应该只显示1个提示框，数字从1增长到12，并依次闪烁 +2、+3、+1、+5|r")
        
    elseif msg == "debuginfo" or msg == "调试信息" then
        -- 调试命令：测试物品信息获取
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 调试信息|r")
        
        -- 测试 GetItemInfo
        local testItemId = 2589  -- 亚麻布
        local name, link, quality, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, texture = GetItemInfo(testItemId)
        DEFAULT_CHAT_FRAME:AddMessage("GetItemInfo("..testItemId.."):")
        DEFAULT_CHAT_FRAME:AddMessage("  name: "..(name or "nil"))
        DEFAULT_CHAT_FRAME:AddMessage("  quality: "..(tostring(quality) or "nil"))
        DEFAULT_CHAT_FRAME:AddMessage("  texture: "..(texture or "nil"))
        
        -- 测试 GetContainerItemInfo - 查找背包中的第一个物品
        DEFAULT_CHAT_FRAME:AddMessage("GetContainerItemInfo 测试:")
        for bag = 0, 4 do
            local numSlots = GetContainerNumSlots(bag)
            if numSlots and numSlots > 0 then
                for slot = 1, numSlots do
                    local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetContainerItemInfo(bag, slot)
                    if r1 then
                        DEFAULT_CHAT_FRAME:AddMessage("  背包"..bag.." 槽位"..slot..":")
                        DEFAULT_CHAT_FRAME:AddMessage("    返回值1: "..(tostring(r1) or "nil"))
                        DEFAULT_CHAT_FRAME:AddMessage("    返回值2: "..(tostring(r2) or "nil"))
                        DEFAULT_CHAT_FRAME:AddMessage("    返回值3: "..(tostring(r3) or "nil"))
                        DEFAULT_CHAT_FRAME:AddMessage("    返回值9: "..(tostring(r9) or "nil"))
                        return  -- 只测试第一个物品
                    end
                end
            end
        end
        
    elseif msg == "testquest" or msg == "测试任务" then
        -- 测试任务物品显示
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试任务物品|r")
        
        -- 添加几个模拟的任务物品
        table.insert(lootQueue, {
            name = "神秘的卷轴",
            link = nil,
            quality = 1,  -- 白色
            texture = "Interface\\Icons\\INV_Scroll_03",
            count = 1,
            isMoney = false,
            needsUpdate = false,
            isQuest = true  -- 标记为任务物品
        })
        
        table.insert(lootQueue, {
            name = "古老的遗物",
            link = nil,
            quality = 2,  -- 绿色
            texture = "Interface\\Icons\\INV_Misc_Rune_01",
            count = 3,
            isMoney = false,
            needsUpdate = false,
            isQuest = true
        })
        
        table.insert(lootQueue, {
            name = "稀有的任务物品",
            link = nil,
            quality = 3,  -- 蓝色
            texture = "Interface\\Icons\\INV_Misc_Gem_Pearl_05",
            count = 1,
            isMoney = false,
            needsUpdate = false,
            isQuest = true
        })
        
    elseif msg == "testreward" or msg == "测试奖励" then
        -- 测试任务奖励（模拟系统消息）
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试任务奖励显示|r")
        
        -- 模拟几个任务奖励物品
        table.insert(lootQueue, {
            name = "任务奖励：强力药水",
            link = nil,
            quality = 2,  -- 绿色
            texture = "Interface\\Icons\\INV_Potion_54",
            count = 5,
            isMoney = false,
            needsUpdate = false,
            isQuest = false
        })
        
        table.insert(lootQueue, {
            name = "任务奖励：精良护甲",
            link = nil,
            quality = 2,  -- 绿色
            texture = "Interface\\Icons\\INV_Chest_Leather_06",
            count = 1,
            isMoney = false,
            needsUpdate = false,
            isQuest = false
        })
        
        table.insert(lootQueue, {
            name = "任务奖励：稀有武器",
            link = nil,
            quality = 3,  -- 蓝色
            texture = "Interface\\Icons\\INV_Sword_27",
            count = 1,
            isMoney = false,
            needsUpdate = false,
            isQuest = false
        })
        
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00已添加 3 个任务奖励物品|r")
        
    elseif msg == "testsystem" or msg == "测试系统" then
        -- 测试系统消息解析（模拟真实的任务奖励消息）
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试系统消息解析|r")
        
        -- 模拟不同格式的系统消息
        local testMessages = {
            "获得物品：|cff1eff00|Hitem:12345:0:0:0|h[虚弱巫毒指环]|h|r。",
            "获得物品：|cff0070dd|Hitem:12346:0:0:0|h[蓝色测试物品]|h|r x2。",
            "获得战利品：|cffa335ee|Hitem:12347:0:0:0|h[紫色史诗装备]|h|r。",
        }
        
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00尝试解析以下消息：|r")
        for i, testMsg in ipairs(testMessages) do
            DEFAULT_CHAT_FRAME:AddMessage("|cffcccccc" .. i .. ". " .. testMsg .. "|r")
            
            -- 尝试解析
            local itemLink = string_match(testMsg, "获得.-([|c%x]+|Hitem:[^|]+|h%[[^%]]+%]|h|r)")
            if itemLink then
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00   ✓ 解析成功: " .. itemLink .. "|r")
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cffff0000   ✗ 解析失败|r")
            end
        end
        
    elseif msg == "testmoney" or msg == "测试金币" or msg == "money" then
        -- 测试不同金额的金币图标
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试金币图标|r")
        
        -- 测试金币（金色图标）
        table.insert(lootQueue, {
            name = FormatMoney(52030),  -- 5金20银30铜
            link = nil,
            quality = 6,
            texture = GetMoneyIcon(52030),
            count = 1,
            isMoney = true,
            moneyAmount = 52030,
            needsUpdate = false
        })
        
        -- 测试银币（银色图标）
        table.insert(lootQueue, {
            name = FormatMoney(5030),  -- 50银30铜
            link = nil,
            quality = 6,
            texture = GetMoneyIcon(5030),
            count = 1,
            isMoney = true,
            moneyAmount = 5030,
            needsUpdate = false
        })
        
        -- 测试铜币（铜色图标）
        table.insert(lootQueue, {
            name = FormatMoney(99),  -- 99铜
            link = nil,
            quality = 6,
            texture = GetMoneyIcon(99),
            count = 1,
            isMoney = true,
            moneyAmount = 99,
            needsUpdate = false
        })
        
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00已添加：金币、银币、铜币测试|r")
        return
        
    elseif msg == "testwin" or msg == "测试赢得" then
        -- 测试"你赢得了"消息解析
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 模拟'你赢得了'消息|r")
        
        -- 模拟不同品质的"你赢得了"消息
        local testMessages = {
            "你赢得了战利品：|cff0070dd|Hitem:12345:0:0:0|h[蓝色测试物品]|h|r。",
            "你赢得了战利品：|cffa335ee|Hitem:12346:0:0:0|h[紫色史诗装备]|h|r x2。",
            "你赢得了战利品：|cff1eff00|Hitem:12347:0:0:0|h[绿色优秀物品]|h|r。",
        }
        
        for _, msg in ipairs(testMessages) do
            -- 直接调用事件处理逻辑
            local itemLink, count = ParseLootMessage(msg)
            if itemLink then
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00解析成功: " .. itemLink .. " x" .. count .. "|r")
                AddLootAlert(itemLink, count)
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cffff0000解析失败: " .. msg .. "|r")
            end
        end
        

        
    elseif msg == "teststack" or msg == "测试累加" then
        -- 测试物品累加效果（完全模拟 ls_Toasts）
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试物品累加效果|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00将在3秒内连续拾取5次相同物品，观察累加效果|r")
        
        -- 使用相同的物品链接模拟连续拾取
        local testLink = "|cff0070dd|Hitem:12345:0:0:0|h[测试蓝装]|h|r"
        local testData = {
            name = "测试蓝装",
            link = testLink,
            quality = 3,
            texture = "Interface\\Icons\\INV_Sword_27",
            count = 1,
            isMoney = false,
            needsUpdate = false
        }
        
        -- 第一次拾取
        table.insert(lootQueue, {
            name = testData.name,
            link = testData.link,
            quality = testData.quality,
            texture = testData.texture,
            count = 1,
            isMoney = false,
            needsUpdate = false
        })
        
        -- 延迟0.5秒后第二次拾取
        local frame1 = CreateFrame("Frame")
        frame1.elapsed = 0
        frame1:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1
            if this.elapsed >= 0.5 then
                table.insert(lootQueue, {
                    name = testData.name,
                    link = testData.link,
                    quality = testData.quality,
                    texture = testData.texture,
                    count = 2,
                    isMoney = false,
                    needsUpdate = false
                })
                this:SetScript("OnUpdate", nil)
            end
        end)
        
        -- 延迟1秒后第三次拾取
        local frame2 = CreateFrame("Frame")
        frame2.elapsed = 0
        frame2:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1
            if this.elapsed >= 1.0 then
                table.insert(lootQueue, {
                    name = testData.name,
                    link = testData.link,
                    quality = testData.quality,
                    texture = testData.texture,
                    count = 3,
                    isMoney = false,
                    needsUpdate = false
                })
                this:SetScript("OnUpdate", nil)
            end
        end)
        
        -- 延迟1.5秒后第四次拾取
        local frame3 = CreateFrame("Frame")
        frame3.elapsed = 0
        frame3:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1
            if this.elapsed >= 1.5 then
                table.insert(lootQueue, {
                    name = testData.name,
                    link = testData.link,
                    quality = testData.quality,
                    texture = testData.texture,
                    count = 1,
                    isMoney = false,
                    needsUpdate = false
                })
                this:SetScript("OnUpdate", nil)
            end
        end)
        
        -- 延迟2秒后第五次拾取
        local frame4 = CreateFrame("Frame")
        frame4.elapsed = 0
        frame4:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1
            if this.elapsed >= 2.0 then
                table.insert(lootQueue, {
                    name = testData.name,
                    link = testData.link,
                    quality = testData.quality,
                    texture = testData.texture,
                    count = 5,
                    isMoney = false,
                    needsUpdate = false
                })
                this:SetScript("OnUpdate", nil)
            end
        end)
        
    elseif msg == "testmerge" or msg == "测试合并" then
        -- 测试金币合并：从铜币累加到银币再到金币
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试金币合并（铜→银→金）|r")
        -- 定义测试金额：从铜币开始
        local testAmounts = {
            50,      -- 50铜（铜色图标）
            60,      -- +60铜 = 1银10铜（变成银色图标）
            5000,    -- +50银 = 51银10铜（保持银色）
            5000,    -- +50银 = 1金1银10铜（变成金色图标）
            10000,   -- +1金 = 2金1银10铜（保持金色）
        }
        
        -- 模拟5次拾取金币，每次间隔0.5秒
        for i = 1, 5 do
            local delay = (i - 1) * 0.5
            local frame = CreateFrame("Frame")
            frame.elapsed = 0
            frame.delay = delay
            frame.amount = testAmounts[i]  -- 使用预定义金额
            frame:SetScript("OnUpdate", function()
                this.elapsed = this.elapsed + arg1
                if this.elapsed >= this.delay then
                    -- 模拟金币变化
                    local oldMoney = lastMoney
                    lastMoney = lastMoney + this.amount
                    -- 手动触发PLAYER_MONEY事件的处理逻辑
                    local diff = this.amount
                    local moneyText = FormatMoney(diff)
                    
                    -- 查找现有金币提示
                    local existingAlert = nil
                    for _, alert in ipairs(activeAlerts) do
                        if alert:IsShown() and alert.isMoney and not alert.isFading then
                            existingAlert = alert
                            break
                        end
                    end
                    
                    if existingAlert then
                        -- 播放金币音效
                        PlayMoneySound()
                        
                        -- 使用和PLAYER_MONEY相同的动画逻辑
                        local currentDisplayAmount
                        if existingAlert.moneyAnimTarget and existingAlert.moneyAnimStart ~= existingAlert.moneyAnimTarget then
                            local progress = (existingAlert.moneyAnimTime or 0) / (existingAlert.moneyAnimDuration or 0.6)
                            if progress > 1 then progress = 1 end
                            currentDisplayAmount = math.floor(lerp(existingAlert.moneyAnimStart, existingAlert.moneyAnimTarget, progress))
                        else
                            currentDisplayAmount = existingAlert.moneyAmount or 0
                        end
                        
                        local newAmount = (existingAlert.moneyAmount or 0) + diff
                        existingAlert.moneyAmount = newAmount
                        
                        -- 更新金币图标
                        if existingAlert.icon then
                            existingAlert.icon:SetTexture(GetMoneyIcon(newAmount))
                        end
                        
                        existingAlert.moneyAnimStart = currentDisplayAmount
                        existingAlert.moneyAnimTarget = newAmount
                        existingAlert.moneyAnimTime = 0
                        existingAlert.moneyAnimDuration = 0.6
                        existingAlert.lastMoneyChangeTime = GetTime()
                        
                        -- 不重置 startTime，避免重新播放入场动画
                        local elapsed = GetTime() - existingAlert.startTime
                        local fadeInDuration = 0.2  -- 入场动画时长（统一为0.2秒，和ls_Toasts一致）
                        if elapsed > fadeInDuration then
                            existingAlert.startTime = GetTime() - fadeInDuration
                        end
                    else
                        table.insert(lootQueue, {
                            name = moneyText,
                            link = nil,
                            quality = 6,
                            texture = GetMoneyIcon(diff),  -- 根据金额显示对应图标
                            count = 1,
                            isMoney = true,
                            moneyAmount = diff,
                            needsUpdate = false
                        })
                    end
                    
                    this:SetScript("OnUpdate", nil)
                end
            end)
        end
        
    elseif strfind(msg, "test") or strfind(msg, "测试") then
        local quality = tonumber(string_match(msg, "%d+"))
        if quality and quality >= 0 and quality <= 5 then
            TestLootAlert(quality)
        else
            -- 先测试金币
            table.insert(lootQueue, {
                name = FormatMoney(52030),  -- 5金20银30铜
                link = nil,
                quality = 6,
                texture = GetMoneyIcon(52030),  -- 根据金额显示对应图标
                count = 1,
                isMoney = true,
                moneyAmount = 52030,
                needsUpdate = false
            })
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 测试金币|r")
            
            -- 测试所有品质
            for i = 0, 5 do
                TestLootAlert(i)
            end
        end
        
    elseif msg == "move" or msg == "移动" then
        if LootAlertFrame:IsShown() then
            LootAlertFrame:Hide()
            LootAlertFrame:EnableMouse(false)
            LootAlertFrame.directionButton:Hide()
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 锁定位置|r")
        else
            LootAlertFrame:Show()
            LootAlertFrame:EnableMouse(true)
            LootAlertFrame.directionButton:Show()
            UpdateDirectionButtonText()
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 解锁位置，拖动绿框移动|r")
        end
        
    elseif strfind(msg, "scale") or strfind(msg, "缩放") then
        local scale = tonumber(string_match(msg, "%d+%.?%d*"))
        if scale and scale >= 0.5 and scale <= 2.0 then
            LootAlertDB.scale = scale
            -- 更新所有提示框的缩放（包括正在显示的）
            for _, alert in ipairs(alertPool) do
                if not alert:IsShown() then
                    alert:SetScale(LootAlertDB.scale)
                end
            end
            for _, alert in ipairs(activeAlerts) do
                if alert:IsShown() then
                    alert:SetScale(LootAlertDB.scale)
                end
            end
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 缩放比例设置为: "..scale.."|r")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[拾取提示] 缩放值必须在 0.5-2.0 之间|r")
        end
        
    elseif msg == "reset" or msg == "重置" then
        LootAlertDB.position = nil
        LootAlertFrame:ClearAllPoints()
        LootAlertFrame:SetPoint("TOP", UIParent, "TOP", 0, -150)
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 位置已重置|r")
        
    elseif strfind(msg, "max") or strfind(msg, "最大") then
        local maxNum = tonumber(string_match(msg, "%d+"))
        if maxNum and maxNum >= 1 and maxNum <= 12 then
            LootAlertDB.maxAlerts = maxNum
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 最大同时显示数量设置为: "..maxNum.."|r")
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cffff0000[拾取提示] 数量必须在 1-12 之间|r")
        end
        
    elseif msg == "status" or msg == "状态" then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 当前状态：|r")
        DEFAULT_CHAT_FRAME:AddMessage("  启用: " .. (LootAlertDB.enabled and "是" or "否"))
        local qualityNames = {"灰色", "白色", "绿色", "蓝色", "紫色", "橙色"}
        DEFAULT_CHAT_FRAME:AddMessage("  最低品质: " .. qualityNames[LootAlertDB.minQuality + 1])
        DEFAULT_CHAT_FRAME:AddMessage("  显示金币: " .. (LootAlertDB.showMoney and "是" or "否"))
        DEFAULT_CHAT_FRAME:AddMessage("  追踪金币损失: " .. (LootAlertDB.trackLoss and "是" or "否"))
        DEFAULT_CHAT_FRAME:AddMessage("  启用金币阈值: " .. (LootAlertDB.useGoldThreshold and "是" or "否"))
        if LootAlertDB.useGoldThreshold then
            DEFAULT_CHAT_FRAME:AddMessage("  金币阈值: " .. (LootAlertDB.goldThreshold or 1) .. " 铜币")
        end
        DEFAULT_CHAT_FRAME:AddMessage("  播放音效: " .. (LootAlertDB.playSound and "是" or "否"))
        DEFAULT_CHAT_FRAME:AddMessage("  缩放: " .. LootAlertDB.scale)
        DEFAULT_CHAT_FRAME:AddMessage("  持续时间: " .. LootAlertDB.duration .. "秒")
        DEFAULT_CHAT_FRAME:AddMessage("  最大同时显示: " .. LootAlertDB.maxAlerts)
        DEFAULT_CHAT_FRAME:AddMessage("  显示间隔: " .. (LootAlertDB.displayInterval or 0.05) .. "秒")
        DEFAULT_CHAT_FRAME:AddMessage("  调试模式: " .. (LootAlertDB.debug and "是" or "否"))
        
    elseif msg == "config" or msg == "设置" then
        ShowLootAlertConfig()
        
    elseif msg == "sound" or msg == "音效" then
        LootAlertDB.playSound = not LootAlertDB.playSound
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 音效 " .. (LootAlertDB.playSound and "已开启" or "已关闭") .. "|r")
        -- 测试音效
        PlayLootSound()
        

    elseif msg == "benchmark" or msg == "性能测试" then
        -- 性能测试：对比优化前后的速度
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 性能测试|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00测试 GetItemInfo 的响应速度...|r")
        
        local testItemIds = {2589, 2592, 4306, 4338, 6948}  -- 常见物品ID
        local startTime = GetTime()
        local successCount = 0
        
        -- 测试 GetItemInfo（优化后的方法）
        for i = 1, 100 do
            for _, itemId in ipairs(testItemIds) do
                local name, _, _, _, _, _, _, _, _, texture = GetItemInfo(itemId)
                if name and texture then
                    successCount = successCount + 1
                end
            end
        end
        
        local endTime = GetTime()
        local elapsed = (endTime - startTime) * 1000  -- 转换为毫秒
        
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00测试完成！|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00- 测试次数: 500 次查询|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00- 成功次数: " .. successCount .. "|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00- 总耗时: " .. string.format("%.2f", elapsed) .. " 毫秒|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00- 平均耗时: " .. string.format("%.3f", elapsed/500) .. " 毫秒/次|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00结论: GetItemInfo 非常快！⚡|r")
        
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[拾取提示] 命令列表：|r")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg config|r - 打开设置界面")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg on|r - 开启提示")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg off|r - 关闭提示")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg sound|r - 切换音效")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg move|r - 移动位置（点击右侧按钮切换方向）")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg reset|r - 重置位置")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg debug|r - 开启/关闭调试模式")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg guid|r - 显示 GUID 信息和测试方法 🔍")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg info|r - 显示插件信息和库检测结果 ℹ️")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg test|r - 测试提示")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg benchmark|r - 性能测试 ⚡")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg testquest|r - 测试任务物品")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg testreward|r - 测试任务奖励")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg testsystem|r - 测试系统消息解析")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg money|r - 测试金币图标（金/银/铜）")
        DEFAULT_CHAT_FRAME:AddMessage("|cffffcc00/lg testmerge|r - 测试金币合并")
    end
end

-- 插件加载完成（配置将在 VARIABLES_LOADED 事件中初始化）
