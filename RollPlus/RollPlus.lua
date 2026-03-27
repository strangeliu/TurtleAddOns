-- ===============================================
-- 插件名称: Roll点框架增强 (RollPlus)
-- 适用版本: World of Warcraft 1.12.x (Vanilla/Turtle)
-- 作者: Kmust
-- 版本: 1.0.0
-- 描述:
--   - Roll点框架增强。
--   - 显示需求、贪婪、放弃的玩家数量和角色名称。
--   - 输入/RollPlus查看设置命令。
--   - 参考了pfUI的Roll模块中代码。
-- ===============================================

local ADDON = "RollPlus"

local CORE = CreateFrame("Frame", ADDON .. "Core", UIParent)
CORE:RegisterEvent("ADDON_LOADED")
CORE:RegisterEvent("CHAT_MSG_LOOT")
CORE:RegisterEvent("CANCEL_LOOT_ROLL")

-- ============================================
-- 工具函数：安全字符串捕获，用于战利品解析
-- ============================================
local function rollplus_find(text)
  if not text then return nil,nil end
  -- 先尝试带超链接
  local _, _, player, item = string.find(text, "^(.-).-|Hitem:%d+:%d+:%d+:%d+|h%[(.-)%]|h")
  if player and item then
    player = string.gsub(player, "^%s+", "")
    player = string.gsub(player, "%s+$", "")
    item = string.gsub(item, "^%s+", "")
    item = string.gsub(item, "%s+$", "")
    return player, "[" .. item .. "]"
  end
  -- 回退：玩家 … [物品]
  _, _, player, item = string.find(text, "^(.-)%s*%[(.-)%]")
  if player and item then
    player = string.gsub(player, "^%s+", "")
    player = string.gsub(player, "%s+$", "")
    item = string.gsub(item, "^%s+", "")
    item = string.gsub(item, "%s+$", "")
    return player, "[" .. item .. "]"
  end
  return nil,nil
end

-- ----------------------------
-- ============================================
-- 模板简化：将物品超链接压缩为 %s（适配多语言）
-- ============================================
local function SimplifyTemplate(tpl)
  if not tpl then return "" end
  -- 原始：%s|Hitem:%d+:%d+:%d+:%d+|h[%s]|h%s
  -- 替换为单个 %s，避免复杂超链接结构
  local simplified = string.gsub(tpl, "%%s|Hitem:%%d+:%%d+:%%d+:%%d+|h%%[%%s%%]|h%%s", "%%s")
  return simplified
end

-- 保留原始模板（可能用于扩展）与旧的简化模板兼容
local RAW_GREED, RAW_NEED, RAW_PASS = LOOT_ROLL_GREED, LOOT_ROLL_NEED, LOOT_ROLL_PASSED
local TPL_GREED   = SimplifyTemplate(LOOT_ROLL_GREED)
local TPL_NEED    = SimplifyTemplate(LOOT_ROLL_NEED)
local TPL_PASS    = SimplifyTemplate(LOOT_ROLL_PASSED)

-- 检测"everyone"串用于忽略
local _, _, everyone = string.find(LOOT_ROLL_ALL_PASSED or "", TPL_PASS or "")
local BLACKLIST = { YOU, everyone }

-- ============================================
-- 职业本地化映射与颜色
-- ============================================
local CLASS_LOCALIZATION = {
  ["术士"] = "WARLOCK",
  ["战士"] = "WARRIOR",
  ["猎人"] = "HUNTER",
  ["法师"] = "MAGE",
  ["牧师"] = "PRIEST",
  ["德鲁伊"] = "DRUID",
  ["圣骑士"] = "PALADIN",
  ["萨满祭司"] = "SHAMAN",
  ["盗贼"] = "ROGUE",
}

-- 职业颜色兜底表（如果 RAID_CLASS_COLORS 不存在）
local CLASS_COLORS_FALLBACK = {
  ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43 },
  ["MAGE"]    = { r = 0.41, g = 0.80, b = 0.94 },
  ["ROGUE"]   = { r = 1.00, g = 0.96, b = 0.41 },
  ["DRUID"]   = { r = 1.00, g = 0.49, b = 0.04 },
  ["HUNTER"]  = { r = 0.67, g = 0.83, b = 0.45 },
  ["SHAMAN"]  = { r = 0.14, g = 0.35, b = 1.00 },
  ["PRIEST"]  = { r = 1.00, g = 1.00, b = 1.00 },
  ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79 },
  ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73 },
}

-- ============================================
-- 配置保存变量（跨会话保存）
-- ============================================
RollPlusDB = RollPlusDB or {
  framePositions = {},
  frameScale = 1.0,
  locked = true,
  classCache = {},  -- 缓存玩家职业信息 {["玩家名"] = "WARRIOR", ...}
}

-- 本地职业缓存（会话内使用，快速访问）
local classCache = RollPlusDB.classCache or {}

-- 获取玩家职业颜色（1.12版本兼容，带缓存）
local function GetPlayerClassColor(playerName)
  if not playerName then return 1, 1, 1 end
  
  local class
  
  -- 1. 先检查缓存
  if classCache[playerName] then
    class = classCache[playerName]
  else
    -- 2. 尝试从队伍获取
    if GetNumPartyMembers() > 0 then
      for i = 1, GetNumPartyMembers() do
        if UnitName("party"..i) == playerName then
          _, class = UnitClass("party"..i)
          break
        end
      end
    end
    
    -- 3. 尝试从团队获取
    if not class and GetNumRaidMembers() > 0 then
      for i = 1, GetNumRaidMembers() do
        if UnitName("raid"..i) == playerName then
          _, class = UnitClass("raid"..i)
          break
        end
      end
    end
    
    -- 4. 检查目标
    if not class and UnitName("target") == playerName then
      _, class = UnitClass("target")
    end
    
    -- 5. 检查玩家自己
    if not class and UnitName("player") == playerName then
      _, class = UnitClass("player")
    end
    
    -- 6. 如果获取到职业，缓存起来
    if class then
      classCache[playerName] = class
  RollPlusDB.classCache[playerName] = class  -- 持久化保存
    end
  end
  
  -- 使用职业颜色（优先使用游戏内置表，否则使用兜底表）
  if class then
    local colorTable = RAID_CLASS_COLORS or CLASS_COLORS_FALLBACK
    if colorTable[class] then
      local c = colorTable[class]
      return c.r, c.g, c.b
    end
  end
  
  return 1, 1, 1  -- 默认白色
end

-- ----------------------------
-- Cache structure: by itemName
-- itemName = { NEED={}, GREED={}, PASS={}, TIMESTAMP = t }
-- Entry is either string (player) or table { name=, roll= }
-- ============================================
local rollCache = {}
-- 维护 itemName -> itemLink 映射（延迟补全）
local itemLinkMap = {}

-- ============================================
-- 自定义 Roll Frame 容器
-- ============================================
local frames = {}
local MAX_FRAMES = 4

-- 队列系统：等待显示的Roll
local rollQueue = {}  -- { {rollID=, rollTime=}, ... }

-- ============================================
-- Frame 外观工具
-- ============================================
local function SetSimpleBackdrop(f)
  f:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 }
  })
  f:SetBackdropColor(0,0,0,0.8)
  f:SetBackdropBorderColor(0.2,0.2,0.2,1)
end

-- ============================================
-- 更新按钮三个计数
-- ============================================
local function UpdateCounts(frame)
  local name = frame.itemName
  if not name then
    frame.need.count:SetText("")
    frame.greed.count:SetText("")
    frame.pass.count:SetText("")
    return
  end
  local data = rollCache[name]
  local nNeed  = data and table.getn(data.NEED)  or 0
  local nGreed = data and table.getn(data.GREED) or 0
  local nPass  = data and table.getn(data.PASS)  or 0
  frame.need.count:SetText(nNeed  > 0 and nNeed  or "")
  frame.greed.count:SetText(nGreed > 0 and nGreed or "")
  frame.pass.count:SetText(nPass  > 0 and nPass  or "")
end

-- ============================================
-- 增强的Tooltip显示函数，支持Shift键显示完整列表
-- ============================================
local function ShowTooltipWithList(button, title, cacheTable)
  GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
  GameTooltip:SetText("|cff33ffcc" .. title)
  
  if not cacheTable then
    GameTooltip:Show()
    return
  end
  
  local playerCount = table.getn(cacheTable)
  if playerCount == 0 then
    GameTooltip:Show()
    return
  end
  
  -- 检查是否按住Shift键显示完整列表
  local showAll = IsShiftKeyDown()
  local maxDisplay = showAll and 50 or 15  -- Shift键时显示更多
  
  -- 显示总数（如果玩家较多）
  if playerCount > 5 then
    GameTooltip:AddLine("共 " .. playerCount .. " 名玩家" .. (showAll and " (完整列表)" or ""))
    GameTooltip:AddLine(" ") -- 空行分隔
  end
  
  -- 对玩家进行排序
  local sortedPlayers = {}
  for _, entry in pairs(cacheTable) do
    table.insert(sortedPlayers, entry)
  end
  table.sort(sortedPlayers, function(a, b)
    local nameA = type(a) == "table" and a.name or a
    local nameB = type(b) == "table" and b.name or b
    return nameA < nameB
  end)
  
  -- 显示玩家列表
  local displayed = 0
  for _, entry in ipairs(sortedPlayers) do
    if displayed >= maxDisplay then
      if not showAll then
        GameTooltip:AddLine("|cffaaaaaa... 还有 " .. (playerCount - displayed) .. " 名玩家|r")
        GameTooltip:AddLine("|cffaaaa00按住Shift显示完整列表|r")
      end
      break
    end
    
    local playerName, rollText
    if type(entry) == "table" then
      playerName = entry.name
      rollText = entry.roll and (" (" .. entry.roll .. ")") or ""
    else
      playerName = entry
      rollText = ""
    end
    
    local r, g, b = GetPlayerClassColor(playerName)
    local coloredName = string.format("|cff%02x%02x%02x%s|r", r*255, g*255, b*255, playerName)
    GameTooltip:AddLine(coloredName .. rollText)
    displayed = displayed + 1
  end
  
  GameTooltip:Show()
end

-- ----------------------------
-- ============================================`n-- 创建单个 Roll Frame`n-- ============================================
-- ----------------------------
local function CreateRollFrame(idx)
  local f = CreateFrame("Frame", ADDON .. "RollFrame" .. idx, UIParent)
  f:SetWidth(360)
  f:SetHeight(32)  -- 增加框架高度以容纳图标
  f:SetFrameStrata("DIALOG")
  SetSimpleBackdrop(f)
  f:Hide()
  f:SetMovable(true)
  f:EnableMouse(true)
  f:RegisterForDrag("LeftButton")
  
  -- 拖拽功能
  f:SetScript("OnDragStart", function()
  if not RollPlusDB.locked then
      this:StartMoving()
    end
  end)
  f:SetScript("OnDragStop", function()
    this:StopMovingOrSizing()
  -- 保存位置
    local point, _, relativePoint, xOfs, yOfs = this:GetPoint()
  RollPlusDB.framePositions[idx] = {
      point = point,
      relativePoint = relativePoint,
      xOfs = xOfs,
      yOfs = yOfs,
    }
  end)

  -- 位置默认堆叠（如果有保存的位置则使用保存的位置）
  if RollPlusDB.framePositions[idx] then
    local pos = RollPlusDB.framePositions[idx]
    f:SetPoint(pos.point, UIParent, pos.relativePoint, pos.xOfs, pos.yOfs)
  else
    f:SetPoint("CENTER", UIParent, "CENTER", 0, - (idx * 42))  -- 增加间距以适应新高度
  end
  
  -- 应用缩放
  f:SetScale(RollPlusDB.frameScale or 1.0)

  -- 图标
  local icon = CreateFrame("Button", f:GetName() .. "Icon", f)
  icon:SetWidth(24); icon:SetHeight(24)  -- 稍微减小图标尺寸
  icon:SetPoint("CENTER", f, "LEFT", 19, 0)  -- 图标居中定位：7(边距) + 12(图标中心) = 19
  icon.tex = icon:CreateTexture(nil, "ARTWORK")
  icon.tex:SetAllPoints()
  icon.tex:SetTexCoord(0.08,0.92,0.08,0.92)

  icon:SetScript("OnEnter", function()
    if not this:GetParent().rollID then return end
    GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
    GameTooltip:SetLootRollItem(this:GetParent().rollID)
  end)
  icon:SetScript("OnLeave", function() GameTooltip:Hide() end)
  icon:SetScript("OnClick", function()
    local rid = this:GetParent().rollID
    if not rid then return end
    if IsControlKeyDown() then
      DressUpItemLink(GetLootRollItemLink(rid))
    elseif IsShiftKeyDown() then
      local link = GetLootRollItemLink(rid)
      if ChatEdit_InsertLink then
        ChatEdit_InsertLink(link)
      elseif ChatFrameEditBox and ChatFrameEditBox:IsVisible() then
        ChatFrameEditBox:Insert(link)
      end
    end
  end)
  f.icon = icon

  local font = "Fonts\\FRIZQT__.TTF"
  local function CreateActionButton(name, textureNormal, xOff, yOff)
    local b = CreateFrame("Button", f:GetName() .. name, f)
    b:SetWidth(24); b:SetHeight(24)  -- 稍微减小按钮尺寸以匹配图标
    -- 所有按钮都使用CENTER定位，但允许单独的Y偏移调整
    b:SetPoint("CENTER", f, "LEFT", xOff, yOff or 0)
    b:SetNormalTexture(textureNormal)
    b:SetHighlightTexture(textureNormal)
    b:GetHighlightTexture():SetVertexColor(0,1,0,0.3)
    b.count = b:CreateFontString(nil, "OVERLAY")
    b.count:SetFont(font, 12, "OUTLINE")  -- 稍微减小字体以匹配按钮
    b.count:SetPoint("CENTER", b, "CENTER", 0, 0)
    b.count:SetText("")
    return b
  end

  f.need = CreateActionButton("Need", "Interface\\Buttons\\UI-GroupLoot-Dice-Up", 55, -2)   -- 需求按钮向上调整2像素
  f.greed = CreateActionButton("Greed", "Interface\\Buttons\\UI-GroupLoot-Coin-Up", 85, -2)  -- 贪婪按钮向上调整2像素
  f.pass = CreateActionButton("Pass", "Interface\\Buttons\\UI-GroupLoot-Pass-Up", 115, 0)   -- 放弃按钮保持原位（已经居中）

  f.need:SetScript("OnClick", function() if this:GetParent().rollID then RollOnLoot(this:GetParent().rollID, 1) end end)
  f.greed:SetScript("OnClick", function() if this:GetParent().rollID then RollOnLoot(this:GetParent().rollID, 2) end end)
  f.pass:SetScript("OnClick", function() if this:GetParent().rollID then RollOnLoot(this:GetParent().rollID, 0) end end)

  f.need:SetScript("OnEnter", function()
    local n = this:GetParent().itemName
    if ROLLPLUS_DEBUG then
      DEFAULT_CHAT_FRAME:AddMessage("|cffff9900[ROLLPLUS Tooltip]|r itemName: " .. (n or "nil"))
      if n and rollCache[n] then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff9900[ROLLPLUS Tooltip]|r NEED count: " .. table.getn(rollCache[n].NEED))
      end
    end
    ShowTooltipWithList(this, NEED, n and rollCache[n] and rollCache[n].NEED or nil)
  end)
  f.greed:SetScript("OnEnter", function()
    local n = this:GetParent().itemName
    ShowTooltipWithList(this, GREED, n and rollCache[n] and rollCache[n].GREED or nil)
  end)
  f.pass:SetScript("OnEnter", function()
    local n = this:GetParent().itemName
    ShowTooltipWithList(this, PASS, n and rollCache[n] and rollCache[n].PASS or nil)
  end)
  f.need:SetScript("OnLeave", function() GameTooltip:Hide() end)
  f.greed:SetScript("OnLeave", function() GameTooltip:Hide() end)
  f.pass:SetScript("OnLeave", function() GameTooltip:Hide() end)

  -- BoP/BoE 标签
  f.boe = f:CreateFontString(nil, "OVERLAY")
  f.boe:SetFont(font, 14, "OUTLINE")  -- 从 12 调整为 14
  f.boe:SetPoint("LEFT", f.pass, "RIGHT", 10, 0)
  f.boe:SetText("")

  -- 物品名称
  f.name = f:CreateFontString(nil, "OVERLAY")
  f.name:SetFont(font, 14, "OUTLINE")  -- 从 12 调整为 14
  f.name:SetPoint("LEFT", f.boe, "RIGHT", 8, 0)
  f.name:SetPoint("RIGHT", f, "RIGHT", -11, 0)  -- 考虑边框insets（-8-3=-11）
  f.name:SetJustifyH("LEFT")
  f.name:SetText("")

  -- 计时条覆盖背景
  f.timeBar = CreateFrame("StatusBar", f:GetName() .. "StatusBar", f)
  f.timeBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
  f.timeBar:SetAllPoints(f)
  f.timeBar:SetAlpha(0.25)
  f.timeBar:SetMinMaxValues(0, 100)
  f.timeBar:SetValue(100)
  f.timeBar:SetStatusBarColor(0.6,0.6,0.6,0.4)

  -- 读秒文字（固定时长倒计时）
  f.timeText = f:CreateFontString(nil, "OVERLAY")
  f.timeText:SetFont(font, 14, "OUTLINE")
  f.timeText:SetPoint("RIGHT", f, "RIGHT", -7, 0)  -- 考虑边框insets（-4-3=-7）
  f.timeText:SetJustifyH("RIGHT")
  f.timeText:SetTextColor(1, 1, 1)
  f.timeText:SetText("")

  f.timeBar:SetScript("OnUpdate", function()
    local parent = this:GetParent()
    if not parent.rollID or not parent.rollEndTime or not parent.rollTotal then
      -- 预览或未初始化
      return
    end
    local now = GetTime()
    local left = parent.rollEndTime - now
    if left < 0 then left = 0 end
    this:SetMinMaxValues(0, parent.rollTotal)
    this:SetValue(left)
    local seconds = math.ceil(left)
    if seconds > 0 then
      f.timeText:SetText(seconds .. "秒")
      if seconds <= 10 then
        f.timeText:SetTextColor(1,0.2,0.2)
      else
        f.timeText:SetTextColor(1,1,1)
      end
    else
      f.timeText:SetText("")
    end
  end)

  return f
end

-- ----------------------------
-- ============================================`n-- 更新某个 Roll Frame 显示`n-- ============================================
-- ----------------------------
local function UpdateRollFrame(i)
  local f = frames[i]
  if not f.rollID then return end
  local texture, itemName, count, quality, bop = GetLootRollItemInfo(f.rollID)
  if not itemName then
  -- Item not cached, try later
    f.name:SetText("...")
    return
  end
  f.itemName = itemName
  f.icon.tex:SetTexture(texture or "Interface\\Icons\\INV_Misc_QuestionMark")

  -- 品质染色
  local color = ITEM_QUALITY_COLORS[quality] or { r=1,g=1,b=1 }
  f:SetBackdropBorderColor(color.r, color.g, color.b, 1)
  f.name:SetText(itemName .. (count and count > 1 and (" x"..count) or ""))
  f.name:SetTextColor(color.r, color.g, color.b)

  -- BOP / BOE
  if bop then
    f.boe:SetText("BoP")
    f.boe:SetTextColor(1,0.3,0.3)
  else
    f.boe:SetText("BoE")
    f.boe:SetTextColor(0.3,1,0.3)
  end

  -- 计时条范围
  if f.rollTotal and f.rollEndTime then
    local left = f.rollEndTime - GetTime()
    if left < 0 then left = 0 end
    f.timeBar:SetMinMaxValues(0, f.rollTotal)
    f.timeBar:SetValue(left)
    f.timeBar:SetStatusBarColor(color.r, color.g, color.b, 0.35)
    if left > 0 then
      f.timeText:SetText(math.ceil(left) .. "秒")
    else
      f.timeText:SetText("")
    end
  end

  UpdateCounts(f)
  f:Show()
end

-- ----------------------------
-- 添加缓存（聊天解析后）
-- ----------------------------
local function AddCache(hyperlink, player, rollType, rollnum)
  if not hyperlink or not player or not rollType then return end

  -- 过滤黑名单名字
  for _, v in pairs(BLACKLIST) do
    if v and player == v then return end
  end

  -- 尝试多种方式提取物品名与 itemLink
  local itemName, itemString

  -- 超链接形式：|Hitem:xxxx:...
  local _, _, linkName = string.find(hyperlink, "|Hitem:%d+:%d+:%d+:%d+|h%[(.-)%]|h")
  local _, _, itemString = string.find(hyperlink, "(item:%d+:%d+:%d+:%d+)")
  if linkName then
    itemName = linkName
    if itemString then
      itemLinkMap[itemName] = itemString
      local giName = GetItemInfo(itemString)
      if giName then itemName = giName end -- 优先真实名称（可能与显示名一致）
    end
  end

  -- 方括号形式
  if not itemName then
    local _, _, bracketName = string.find(hyperlink, "%[(.-)%]")
    if bracketName then
      itemName = bracketName
    end
  end

  -- 纯文本兜底
  if not itemName then
    itemName = hyperlink
  end

  if not itemName or itemName == "" then return end

  -- 清理过期（>60秒）
  local existing = rollCache[itemName]
  if existing and existing.TIMESTAMP < GetTime() - 60 then
    rollCache[itemName] = nil
  end

  -- 初始化
  if not rollCache[itemName] then
    rollCache[itemName] = {
      NEED = {}, GREED = {}, PASS = {}, TIMESTAMP = GetTime(), LINK = itemString
    }
  elseif itemString and not rollCache[itemName].LINK then
    rollCache[itemName].LINK = itemString -- 延迟补全链接
  end
  local bucket = rollCache[itemName][rollType]
  -- 去重 / 更新
  for _, entry in pairs(bucket) do
    if type(entry) == "table" and entry.name == player then
      if rollnum then entry.roll = rollnum end
      return
    elseif entry == player then
      return
    end
  end

  if rollnum then
    table.insert(bucket, { name = player, roll = rollnum })
  else
    table.insert(bucket, player)
  end

  -- 实时刷新显示中对应物品框
  for i=1,MAX_FRAMES do
    if frames[i]:IsShown() and frames[i].itemName == itemName then
      UpdateCounts(frames[i])
    end
  end
end

-- ----------------------------
-- Hook：拦截系统新建 Roll 框（带队列支持）
-- ----------------------------
local function OpenNewRollFrame(rollID, rollTime)
  -- 若当前没有任何真实Roll框体显示，说明新一轮，清空缓存和队列
  local anyVisible
  for i=1,MAX_FRAMES do
    if frames[i]:IsShown() and frames[i].rollID then
      anyVisible = true
      break
    end
  end
  if not anyVisible then
    rollCache = {}
    rollQueue = {}
  end

  -- 尝试找到空闲框架（优先使用预览框架或隐藏的框架）
  for i=1,MAX_FRAMES do
    if not frames[i]:IsShown() or not frames[i].rollID then
      frames[i].rollID = rollID
      frames[i].rollTime = rollTime
      frames[i].rollTotal = (rollTime and rollTime > 0) and (rollTime/1000) or 60 -- 有的API给毫秒, 若为毫秒转秒, 否则默认60
      if frames[i].rollTotal > 300 then frames[i].rollTotal = 60 end -- 避免错误过大
      frames[i].rollEndTime = GetTime() + frames[i].rollTotal
      frames[i].timeBar:Show()  -- 确保计时条显示
      UpdateRollFrame(i)
      return
    end
  end
  
  -- 所有框架都在使用，加入队列
  table.insert(rollQueue, { rollID = rollID, rollTime = rollTime })
  if ROLLPLUS_DEBUG then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff9900[ROLLPLUS Queue]|r Added to queue. Queue size: " .. table.getn(rollQueue))
  end
end

-- 从队列中显示下一个Roll
local function ShowNextFromQueue()
  if table.getn(rollQueue) == 0 then return end
  
  -- 查找空闲框架（优先使用预览框架或隐藏的框架）
  for i=1,MAX_FRAMES do
    if not frames[i]:IsShown() or not frames[i].rollID then
      local nextRoll = table.remove(rollQueue, 1)  -- 取出队列第一个
      if nextRoll then
        frames[i].rollID = nextRoll.rollID
        frames[i].rollTime = nextRoll.rollTime
        frames[i].rollTotal = (nextRoll.rollTime and nextRoll.rollTime > 0) and (nextRoll.rollTime/1000) or 60
        if frames[i].rollTotal > 300 then frames[i].rollTotal = 60 end
        frames[i].rollEndTime = GetTime() + frames[i].rollTotal
        frames[i].timeBar:Show()  -- 确保计时条显示
        UpdateRollFrame(i)
        if ROLLPLUS_DEBUG then
          DEFAULT_CHAT_FRAME:AddMessage("|cffff9900[ROLLPLUS Queue]|r Showing from queue. Remaining: " .. table.getn(rollQueue))
        end
      end
      return
    end
  end
end

-- ----------------------------
-- 覆盖全局函数（保存原函数以便需要时调用）
-- ----------------------------
if not RollPlus_Original_OpenNewFrame then
  RollPlus_Original_OpenNewFrame = getglobal("GroupLootFrame_OpenNewFrame")
end
setglobal("GroupLootFrame_OpenNewFrame", OpenNewRollFrame)

-- ----------------------------
-- 隐藏默认 GroupLootFrame（防止闪烁）
-- ----------------------------
local function DisableDefaultFrames()
  for i=1,4 do
    local gf = getglobal("GroupLootFrame"..i)
    if gf then
      gf:UnregisterAllEvents()
      gf:Hide()
      gf.Show = function() end -- 避免被系统再次显示
    end
  end
end

-- ----------------------------
-- 事件处理
-- ----------------------------
-- 多模式解析：适配服务器本地化差异与中文/英文
local rollPatterns = {
  -- 带点数行（全角括号）- 只有需求和贪婪会有点数
  { patt = "（(需求)）(%d+)点：%[(.-)%]（(.+)）",   choice = "NEED",  hasRoll = true,  groups = { rollType=1, roll=2, item=3, player=4 } },
  { patt = "（(贪婪)）(%d+)点：%[(.-)%]（(.+)）",   choice = "GREED", hasRoll = true,  groups = { rollType=1, roll=2, item=3, player=4 } },
  -- 选择取向（不含点数）- 使用 .+ 确保至少匹配一个字符
  { patt = "(.+)选择了需求取向：*%[(.-)%]", choice = "NEED",  hasRoll = false, groups = { player=1, item=2 } },
  { patt = "(.+)选择了贪婪取向：%[(.-)%]", choice = "GREED", hasRoll = false, groups = { player=1, item=2 } },
  { patt = "(.+)对%[(.-)%]选择了放弃",       choice = "PASS",  hasRoll = false, groups = { player=1, item=2 } },
  -- 英文可能格式（示例，尽量宽松）
  { patt = "(.+) selected Need for: %[(.-)%]",   choice = "NEED",  hasRoll = false, groups = { player=1, item=2 } },
  { patt = "(.+) selected Greed for: %[(.-)%]",  choice = "GREED", hasRoll = false, groups = { player=1, item=2 } },
  { patt = "(.+) passed on: %[(.-)%]",           choice = "PASS",  hasRoll = false, groups = { player=1, item=2 } },
  -- 宽松兜底模式：允许后面跟任意内容
  { patt = "(.+)选择了需求取向.*%[(.-)%]", choice = "NEED",  hasRoll = false, groups = { player=1, item=2 } },
  { patt = "(.+)选择了贪婪取向.*%[(.-)%]", choice = "GREED", hasRoll = false, groups = { player=1, item=2 } },
  { patt = "(.+).*放弃.*%[(.-)%]",           choice = "PASS",  hasRoll = false, groups = { player=1, item=2 } },
}

local function ParseLootChat(msg)
  for _, entry in ipairs(rollPatterns) do
    local caps = { string.find(msg, entry.patt) }
    if ROLLPLUS_DEBUG then
      local capstr = ""
      local ncap = table.getn(caps)
      for i=1,math.max(6,ncap) do capstr = capstr .. (caps[i] and ("["..i.."]="..caps[i].." ") or "") end
      DEFAULT_CHAT_FRAME:AddMessage("|cffff9900[ROLLPLUS Try]|r patt: "..entry.patt.." | "..capstr)
    end
    if caps[1] then
      -- 按映射取值
      local player = entry.groups.player and caps[entry.groups.player + 2] -- offset: find returns start,end,c1,c2...
      local item   = entry.groups.item   and caps[entry.groups.item + 2]
      local roll   = entry.hasRoll and (entry.groups.roll and caps[entry.groups.roll + 2]) or nil
      -- 清理玩家名中的超链接和颜色代码
      if player then
        -- 超链接：|Hplayer:Name|hName|h -> Name
        local _, _, cleanName = string.find(player, "|Hplayer:.+|h(.+)|h")
        if cleanName then
          player = cleanName
        end
        -- 颜色代码：|cffxxxxxx 和 |r
        player = string.gsub(player, "|c%x%x%x%x%x%x%x%x", "")
        player = string.gsub(player, "|r", "")
        player = string.gsub(player, "^%s+", "")
        player = string.gsub(player, "%s+$", "")
      end
      if ROLLPLUS_DEBUG then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff9900[ROLLPLUS Parse]|r player=" .. (player or "nil") .. ", item=" .. (item or "nil"))
      end
      if player and player ~= "" and item then
        return player, "[" .. item .. "]", entry.choice, roll
      end
    end
  end
  -- 回退：使用全局 rollplus_find
  local p,i = rollplus_find(msg)
  if p and i then
    -- 尝试判断类型与点数
    local _,_,r=string.find(msg,"%((%d+)%)")
    if string.find(msg, "需求") or string.find(msg, "Need") then return p,i,"NEED", r end
    if string.find(msg, "贪婪") or string.find(msg, "Greed") then return p,i,"GREED", r end
    if string.find(msg, "放弃") or string.find(msg, "passed") then return p,i,"PASS", r end
  end
  return nil
end

CORE:SetScript("OnEvent", function()
  if event == "ADDON_LOADED" and arg1 == ADDON then
    -- 初始化本地缓存
  classCache = RollPlusDB.classCache or {}
    
    -- 初始化自定义框
    for i=1,MAX_FRAMES do
      frames[i] = CreateRollFrame(i)
    end
    DisableDefaultFrames()
    
  elseif event == "CHAT_MSG_LOOT" then
    local msg = arg1
    local player, item, choice, rollnum = ParseLootChat(msg or "")
    if player and item and choice then
      if ROLLPLUS_DEBUG then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff9900[ROLLPLUS]|r Parsed: " .. player .. " -> " .. item .. " (" .. choice .. ")" .. (rollnum and (" [" .. rollnum .. "]") or ""))
      end
      AddCache(item, player, choice, rollnum)
    end

  elseif event == "CANCEL_LOOT_ROLL" then
    local rid = arg1
    for i=1,MAX_FRAMES do
      local f = frames[i]
      if f.rollID == rid then
        f.rollID = nil
        f.itemName = nil
        f:Hide()
        -- 框架关闭后，尝试从队列显示下一个
        ShowNextFromQueue()
      end
    end
  end
end)

-- 可选：Slash 命令重载或测试
SLASH_ROLLPLUS1 = "/rollplus"
SlashCmdList["ROLLPLUS"] = function(msg)
  if msg == "reset" then
    rollCache = {}
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r cache cleared.")
    
  elseif msg == "debug" then
    if not ROLLPLUS_DEBUG then
      ROLLPLUS_DEBUG = true
      DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Debug mode |cff00ff00ON|r")
      -- 注册额外的调试监听
      if not ROLLPLUS_DebugFrame then
        ROLLPLUS_DebugFrame = CreateFrame("Frame")
        ROLLPLUS_DebugFrame:RegisterEvent("CHAT_MSG_LOOT")
        ROLLPLUS_DebugFrame:SetScript("OnEvent", function()
          DEFAULT_CHAT_FRAME:AddMessage("|cffff9900[ROLLPLUS Debug]|r " .. (arg1 or "nil"))
        end)
      end
    else
      ROLLPLUS_DEBUG = false
      DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Debug mode |cffff0000OFF|r")
    end
    
  elseif msg == "cache" then
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Current cache:")
    for itemName, data in pairs(rollCache) do
      DEFAULT_CHAT_FRAME:AddMessage("  Item: " .. itemName)
      DEFAULT_CHAT_FRAME:AddMessage("    NEED: " .. table.getn(data.NEED))
      DEFAULT_CHAT_FRAME:AddMessage("    GREED: " .. table.getn(data.GREED))
      DEFAULT_CHAT_FRAME:AddMessage("    PASS: " .. table.getn(data.PASS))
    end
    
  elseif msg == "queue" then
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Queue status:")
    DEFAULT_CHAT_FRAME:AddMessage("  Queue size: " .. table.getn(rollQueue))
    local activeFrames = 0
    for i=1,MAX_FRAMES do
      if frames[i]:IsShown() then
        activeFrames = activeFrames + 1
      end
    end
    DEFAULT_CHAT_FRAME:AddMessage("  Active frames: " .. activeFrames .. "/" .. MAX_FRAMES)
    
  elseif msg == "unlock" then
    RollPlusDB.locked = false
    -- 显示所有框架以便调整位置
    for i=1,MAX_FRAMES do
      if frames[i] and not frames[i]:IsShown() then
        frames[i].rollID = nil  -- 清空rollID，标记为预览模式
        frames[i].itemName = "[预览框架 " .. i .. "]"
        frames[i].name:SetText("[预览框架 " .. i .. "]")
        frames[i].name:SetTextColor(1, 1, 1)
        frames[i].icon.tex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        frames[i]:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        frames[i].boe:SetText("预览")
        frames[i].boe:SetTextColor(1, 1, 0)
        frames[i].need.count:SetText("")
        frames[i].greed.count:SetText("")
        frames[i].pass.count:SetText("")
        frames[i].timeBar:Hide()
        frames[i].timeText:SetText("30秒")  -- 仅预览展示，不设置rollEndTime/rollTotal
        frames[i].timeText:SetTextColor(1, 1, 1)
        frames[i]:Show()
      end
    end
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Frames |cff00ff00UNLOCKED|r. Drag to reposition.")
    
  elseif msg == "lock" then
    RollPlusDB.locked = true
    -- 隐藏所有预览框架（没有真实rollID的）
    for i=1,MAX_FRAMES do
      if frames[i] and not frames[i].rollID then
        frames[i]:Hide()
      end
    end
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Frames |cffff0000LOCKED|r.")
    
  elseif string.find(msg, "^scale ") then
    local _, _, scaleStr = string.find(msg, "^scale (.+)")
    local scale = tonumber(scaleStr)
    if scale and scale >= 0.5 and scale <= 2.0 then
      RollPlusDB.frameScale = scale
      for i=1,MAX_FRAMES do
        if frames[i] then
          frames[i]:SetScale(scale)
        end
      end
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Frame scale set to |cff00ff00" .. scale .. "|r")
    else
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Invalid scale value. Use 0.5-2.0")
    end
    
  elseif msg == "resetpos" then
  RollPlusDB.framePositions = {}
  RollPlusDB.frameScale = 1.0
  RollPlusDB.locked = true
    -- 重新定位所有框架
    for i=1,MAX_FRAMES do
      if frames[i] then
        frames[i]:ClearAllPoints()
        frames[i]:SetPoint("CENTER", UIParent, "CENTER", 0, - (i * 42))  -- 更新间距
        frames[i]:SetScale(1.0)
      end
    end
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Frame positions and scale |cff00ff00RESET|r.")
    
  elseif msg == "clearcache" then
    local count = 0
    for _ in pairs(classCache) do count = count + 1 end
    classCache = {}
  RollPlusDB.classCache = {}
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Cleared " .. count .. " cached player classes.")
    
  else
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99RollPlus:|r Commands:")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus reset - 清空缓存")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus debug - 开启/关闭调试模式")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus cache - 显示当前缓存")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus queue - 显示队列状态")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus unlock - 解锁并显示框架以便调整位置")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus lock - 锁定并隐藏预览框架")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus scale <0.5-2.0> - 设置框架缩放")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus resetpos - 重置框架位置和缩放")
  DEFAULT_CHAT_FRAME:AddMessage("  /rollplus clearcache - 清空玩家职业缓存")
  end
end
