TargetDistance = {}
local r1, r2 = pcall(UnitXP, "nop", "nop")
TargetDistance.unitxp = r1 == true and r2 == true
TargetDistanceCharDB = TargetDistanceCharDB or {}
local defaults = {
  offsetX = 0,
  offsetY = 200,
  locked = false,
  desc = true,
  showDeadDistance = false,
  pp = 1, -- player <--> pet
  hidden = false,
  linearYardsFrom = 8,
  linearYardsTo = 42,
  linearColor = true,
  linearColorFrom = { 0, 1, 0 },
  linearColorTo = { 1, 0, 0 },
  faceColor = { 1, 0, 0.5 },
  meleeColor = { 0, 1, 0 },
  blinkColor = { 1, 1, 0 },
  fontSize = 21,
  fontSizePp = 16,
  fontColor = { 0, 1, 0 },
  fontColorPp = { 0, 1, 0 },
  rangedColor = false,
  rangedColor1 = { 1, 0, 0 },           -- 近战
  userColors = {},
  showFaceWarning = true,               -- 控制打脸提示的显示
  playFaceWarningSound = true,          -- 控制打脸提示的声音播放
  playFaceWarningSoundOnlyGroup = true, -- 新增选项，仅在团队中播放打脸提示音
  intelligentPlayFaceWarningSound = false,
  mouseoverTooltipDistance = false,     -- 新增选项，鼠标指向目标时在tooltip显示与目标的距离
  outSight = false,                     -- 新增选项，不在视野内的目标覆盖颜色
  outSightColor = { 0.66, 0.66, 0.66 }, -- 新增选项，不在视野内的目标覆盖颜色
  outSightIcon = false,                 -- 新增选项，不在视野内的目标显示图标
}
-- 在全局作用域添加一个标志位
local nextSoundPlayTime = 0
local iplay = 1
local yardsIndex
local textColor
local lineHeight
local nextTrackTime = 0
local cantload = nil

local addonmsg = function(msg)
  DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00目标距离 " .. msg)
end

local function toggleDesc(v, notify)
  local newValue = v
  if v == nil then
    newValue = not TargetDistanceCharDB.desc
  end
  if newValue then
    TargetDistanceCharDB.desc = true
    if notify then
      addonmsg("详细信息已开启")
    end
  else
    TargetDistanceCharDB.desc = false
    if notify then
      addonmsg("详细信息已关闭")
    end
  end
end

local function toggleShowDeadDistance(v, notify)
  local newValue = v
  if v == nil then
    newValue = not TargetDistanceCharDB.showDeadDistance
  end
  if newValue then
    TargetDistanceCharDB.showDeadDistance = true
    if notify then
      addonmsg("死亡目标距离显示已开启")
    end
  else
    TargetDistanceCharDB.showDeadDistance = false
    if notify then
      addonmsg("死亡目标距离显示已关闭")
    end
  end
end

local function togglePlayerPet()
  local values = { "关闭", "常驻", "仅野兽之眼" }
  local v = (TargetDistanceCharDB.pp or 0) + 1
  if v > table.getn(values) then
    v = 1
  end
  TargetDistanceCharDB.pp = v
  addonmsg("人宠距离显示已设置为 >" .. values[TargetDistanceCharDB.pp] .. "<")
end

-- 新增函数，用于切换打脸提示的显示和声音播放
local function toggleShowFaceWarning(v, notify)
  local newValue = v
  if v == nil then
    newValue = not TargetDistanceCharDB.showFaceWarning
  end
  if newValue then
    TargetDistanceCharDB.showFaceWarning = true
    if notify then
      addonmsg("打脸提示已开启")
    end
  else
    TargetDistanceCharDB.showFaceWarning = false
    if notify then
      addonmsg("打脸提示已关闭")
    end
  end
end

local textureOEye = "Interface\\AddOns\\TargetDistance\\texture\\oeye"
local textureCEye = "Interface\\AddOns\\TargetDistance\\texture\\ceye"

-- 创建一个事件框架
local frame = CreateFrame("Frame", "TargetDistanceFrame", UIParent)
frame:SetWidth(70)
frame:SetHeight(20)
frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
local distanceText = frame:CreateFontString(nil, "OVERLAY")
distanceText:SetFont(STANDARD_TEXT_FONT, defaults.fontSize, "OUTLINE")
distanceText:SetPoint("CENTER", frame, "CENTER", 0, 0)
distanceText:SetJustifyH("CENTER")
distanceText:SetWidth(64)
distanceText.icon = frame:CreateTexture(nil, "OVERLAY")
distanceText.icon:SetPoint("RIGHT", distanceText, "LEFT", -1, 0)
distanceText.icon:SetWidth(32)
distanceText.icon:SetHeight(32)
-- distanceText.icon:SetTexture(textureCEye)
-- distanceText.icon:SetVertexColor(0, 1, 1)
frame.distanceText = distanceText
-- distanceText:SetTextColor(1, 1, 1)
-- distanceText:SetText("distanceText")

local distanceText2 = frame:CreateFontString(nil, "OVERLAY")
distanceText2:SetFont(STANDARD_TEXT_FONT, defaults.fontSizePp, "OUTLINE")
distanceText2:SetPoint("TOP", distanceText, "BOTTOM", 0, -4)
distanceText2:SetJustifyH("CENTER")
distanceText2:SetWidth(64)
distanceText2.pet = 1
distanceText2.icon = frame:CreateTexture(nil, "OVERLAY")
distanceText2.icon:SetPoint("RIGHT", distanceText2, "LEFT", -5, 0)
distanceText2.icon:SetWidth(24)
distanceText2.icon:SetHeight(24)
-- distanceText2.icon:SetTexture(textureOEye)
-- distanceText2.icon:SetVertexColor(0, 1, 1)
frame.distanceText2 = distanceText2

local setIconInSight = function(icon)
  if not icon then return end
  if icon.t == textureOEye then
    return
  end
  icon.t = textureOEye
  icon:SetTexture(textureOEye)
end

local setIconOutSight = function(icon)
  if not icon then return end
  if icon.t == textureCEye then
    return
  end
  icon.t = textureCEye
  icon:SetTexture(textureCEye)
end

local unit = "player"
local unitClass = UnitClass("player")
local eotbactive = function()
  for i = 1, 32 do
    local t = UnitBuff("player", i)
    if not t then break end
    if t == "Interface\\Icons\\Ability_EyeOfTheOwl" then
      return 1
    end
  end
end

local function fmtDistance(distance, decimals)
  if not distance or tonumber(distance) == nil then return "" end

  if not decimals then
    decimals = 1
  end

  return string.format("%." .. decimals .. "f", distance)
end

local function setTextColorLinear(fontString, distance)
  if not distance then return end

  local db = TargetDistanceCharDB
  local r, g, b
  if distance < db.linearYardsFrom then
    distance = db.linearYardsFrom
  elseif distance > db.linearYardsTo then
    distance = db.linearYardsTo
  end

  local p = (distance - db.linearYardsFrom) / (db.linearYardsTo - db.linearYardsFrom)
  r = db.linearColorFrom[1] + (db.linearColorTo[1] - db.linearColorFrom[1]) * p
  g = db.linearColorFrom[2] + (db.linearColorTo[2] - db.linearColorFrom[2]) * p
  b = db.linearColorFrom[3] + (db.linearColorTo[3] - db.linearColorFrom[3]) * p

  -- local red = distance / maxDistance
  -- local green = 1 - red
  -- 设置文字颜色
  fontString:SetTextColor(r, g, b)
  if fontString.icon and TargetDistanceCharDB.outSightIcon then
    fontString.icon:SetVertexColor(r, g, b)
  end
end

local function setTextColor(fontString, distance, melee, defaultColor)
  if not distance then return end

  local fontStringName = fontString:GetName() or ""
  local isGameTooltip = string.sub(fontStringName, 1, 11) == "GameTooltip"
  local showIcon = TargetDistanceCharDB.outSightIcon and not isGameTooltip
  local shouldUpdateColor = TargetDistanceCharDB.outSight and type(TargetDistanceCharDB.outSightColor) == "table"

  local inSight, icon
  if TargetDistance.unitxp then
    if shouldUpdateColor or showIcon then
      if fontString.pet then
        inSight = UnitXP("inSight", "player", "pet")
        icon = distanceText2.icon
      elseif isGameTooltip then
        inSight = UnitXP("inSight", "player", "mouseover")
      else
        inSight = UnitXP("inSight", unit, "target")
        icon = distanceText.icon
      end

      if shouldUpdateColor and inSight == false then
        fontString:SetTextColor(unpack(TargetDistanceCharDB.outSightColor))
      end

      if showIcon and inSight == false then
        icon:SetVertexColor(unpack(TargetDistanceCharDB.outSightColor))
        setIconOutSight(icon)
      end

      if inSight == false then
        return
      end
    end
  end

  if showIcon then
    setIconInSight(icon)
  end

  if TargetDistanceCharDB.linearColor and TargetDistanceCharDB.linearYardsFrom and TargetDistanceCharDB.linearYardsTo then
    setTextColorLinear(fontString, distance)
  elseif TargetDistanceCharDB.rangedColor then
    -- 自定义区间变色
    local colors = { 1, 1, 1 } -- 如果都匹配不到则显示白色

    if melee then
      colors = TargetDistanceCharDB.rangedColor1
    else
      for _, userColor in ipairs(TargetDistanceCharDB.userColors) do
        if userColor.yards and distance < userColor.yards then
          colors = userColor.colors
          break
        end
      end
    end

    fontString:SetTextColor(unpack(colors))
    if showIcon then
      icon:SetVertexColor(unpack(colors))
    end
  else
    if not defaultColor then
      defaultColor = { 0, 1, 0 }
    end
    fontString:SetTextColor(unpack(defaultColor))
    if showIcon then
      icon:SetVertexColor(unpack(defaultColor))
    end
  end
end

-- 根据距离值设置文字内容和颜色的方法
local function SetDistanceText()
  local text
  if not UnitExists("target") or UnitIsUnit(unit, "target") then
    text = ""
  else
    if (UnitHealth("target") or 0) == 0 and TargetDistanceCharDB.showDeadDistance == false then
      text = ""
    else
      local distance = UnitXP("distanceBetween", unit, "target");

      if not distance then
        text = ""
      else
        if distance == 0 then
          text = "0"
        else
          local fDistance = fmtDistance(distance, 1) -- math.floor(distance * 10 + 0.5) / 10

          -- 避免显示0.0
          text = fDistance
        end
        if distance >= 8 or not TargetDistanceCharDB.desc or not UnitCanAttack(unit, "target") or (UnitHealth("target") or 0) == 0 then
          -- 计算红色和绿色的分量，实现线性渐变
          -- local red = distance / 42
          -- local green = 1 - red
          -- -- 设置文字颜色
          -- distanceText:SetTextColor(red, green, 0)
          setTextColor(distanceText, distance, nil, TargetDistanceCharDB.fontColor)
          iplay = 1
        else
          local meleeDistance = UnitXP("distanceBetween", unit, "target", "meleeAutoAttack")
          if meleeDistance == 0 then
            local behind = UnitXP("behind", unit, "target")

            if behind then
              text = "近战\n" .. text
              setTextColor(distanceText, distance, true, TargetDistanceCharDB.fontColor)
              iplay = 1
            else
              if TargetDistanceCharDB.showFaceWarning then -- 判断是否开启打脸提示
                text = "打脸\n" .. text
                distanceText:SetTextColor(unpack(TargetDistanceCharDB["faceColor"]))

                if TargetDistanceCharDB.playFaceWarningSound then
                  local ttime = GetTime()
                  if UnitAffectingCombat("player") and (
                        not TargetDistanceCharDB.playFaceWarningSoundOnlyGroup
                        or GetNumPartyMembers() > 2
                        or GetNumRaidMembers() > 2
                      ) then
                    if TargetDistanceCharDB.intelligentPlayFaceWarningSound then
                      if iplay then
                        PlaySoundFile('Interface\\addons\\TargetDistance\\sounds\\warn.ogg')
                        iplay = nil
                      end
                    else
                      if ttime > nextSoundPlayTime then
                        PlaySoundFile('Interface\\addons\\TargetDistance\\sounds\\warn.ogg')
                        nextSoundPlayTime = ttime + 2
                      end
                    end
                  end
                end
              end
            end
          else
            iplay = 1

            if unitClass == "猎人" then
              text = "盲区\n" .. text
            end
            setTextColor(distanceText, distance, nil, TargetDistanceCharDB.fontColor)
          end
        end
      end
    end
  end

  distanceText:SetText(text)
  distanceText2:SetText("")

  if unitClass == "猎人" or string.lower(unitClass) == "hunter" then
    if UnitExists("pet") and (TargetDistanceCharDB.pp == 2 or (unit == "pet" and TargetDistanceCharDB.pp == 3)) then
      if not (unit == "pet" and UnitIsUnit("target", "player")) and not (unit == "player" and UnitIsUnit("target", "pet")) then
        local ppDistance = fmtDistance(UnitXP("distanceBetween", "player", "pet"))
        if ppDistance and ppDistance ~= "" then
          distanceText2:SetText(ppDistance)
          setTextColor(distanceText2, tonumber(ppDistance), nil, TargetDistanceCharDB.fontColorPp)
        end
      end
    end
  end

  local ntext, ntext2 = tonumber(text), tonumber(distanceText2:GetText())
  if TargetDistanceCharDB.outSightIcon then
    if ntext and ntext >= 0 then
      if not distanceText.icon:IsShown() then
        distanceText.icon:Show()
      end
    else
      if distanceText.icon:IsShown() then
        distanceText.icon:Hide()
      end
    end

    if ntext2 and ntext2 >= 0 then
      if not distanceText2.icon:IsShown() then
        distanceText2.icon:Show()
      end
    else
      if distanceText2.icon:IsShown() then
        distanceText2.icon:Hide()
      end
    end
  else
    if distanceText.icon:IsShown() then
      distanceText.icon:Hide()
    end
    if distanceText2.icon:IsShown() then
      distanceText2.icon:Hide()
    end
  end
end

-- OnUpdate 事件处理函数
local function OnUpdate()
  SetDistanceText()
end

local dwUpdateLimit = 0.1 -- 1秒约等于10次更新
local dwUpdateNextTime = 0
local function OnDWUpdate()
  -- 经典模式
  local ttime = GetTime()
  if ttime >= dwUpdateNextTime then
    if DWClassic then
      DWClassic.onTick()
    end

    dwUpdateNextTime = ttime + dwUpdateLimit
  end
end

-- 拖拽开始时的处理函数
local function OnDragStart()
  this:StartMoving()
end

-- 拖拽结束时的处理函数
local function OnDragStop()
  this:StopMovingOrSizing()
  local centerX, centerY = UIParent:GetCenter()
  local frameX, frameY = this:GetCenter()
  TargetDistanceCharDB.offsetX = frameX - centerX
  TargetDistanceCharDB.offsetY = frameY - centerY
end

local function toggleLocked(locked, notify)
  local newLocked = not TargetDistanceCharDB.locked
  if locked ~= nil then
    newLocked = locked
  end

  if newLocked == true then
    -- 禁止拖拽
    TargetDistanceCharDB.locked = true
    frame:EnableMouse(false)
    frame:RegisterForDrag()
    if notify then
      addonmsg("已锁定")
    end
  else
    if TargetDistanceCharDB.hidden then
      if TargetDistance.configItemsMap.hidden then
        TargetDistance.configItemsMap.hidden.setVal(false)
      end
      TargetDistance.toggleHidden(false)
    end
    -- 允许拖拽
    TargetDistanceCharDB.locked = false
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    if notify then
      addonmsg("已解锁")
    end
  end
end

local function toggleHidden(hidden)
  local newHidden = not TargetDistanceCharDB.hidden
  if hidden ~= nil then
    newHidden = hidden
  end

  TargetDistanceCharDB.hidden = newHidden
  if newHidden == true then
    frame:Hide()
  else
    frame:Show()
  end
end

local function refreshFramePoint()
  frame:ClearAllPoints()
  frame:SetPoint("CENTER", UIParent, "CENTER", TargetDistanceCharDB.offsetX, TargetDistanceCharDB.offsetY)
end

local function OnEvent()
  if event == "PLAYER_TARGET_CHANGED" then
    if not TargetDistance.unitxp and DWClassic then
      DWClassic.onPlayerTargetChanged()
    end
  elseif event == "ACTIONBAR_SLOT_CHANGED" then
    DWClassic.onActionbarSlotChanged(arg1)
  elseif event == "CHARACTER_POINTS_CHANGED" then
    DWClassic.onTalentChanged()
  elseif event == "PLAYER_ENTERING_WORLD" then
    if not TargetDistance.unitxp and DWClassic then
      DWClassic.onPlayerEnteringWorld()

      return
    end

    local oldOnShow = GameTooltip:GetScript("OnShow")
    GameTooltip:SetScript("OnShow", function(a1, a2, a3, a4, a5, a6, a7, a8, a9)
      if type(oldOnShow) == "function" then oldOnShow(a1, a2, a3, a4, a5, a6, a7, a8, a9) end


      if not TargetDistanceCharDB.mouseoverTooltipDistance then return end
      if UnitExists("mouseover") then
        local d = UnitXP("distanceBetween", "player", "mouseover")
        if not d then return end

        for i = 1, GameTooltip:NumLines() do
          local t = getglobal("GameTooltipTextLeft" .. i)
          if t and string.find(t:GetText() or "", "%d码$") then
            t:SetText((math.floor(d * 10) / 10) .. "码")
            setTextColor(t, d, nil, TargetDistanceCharDB.fontColor)
            return
          end
        end

        local lines = GameTooltip:NumLines() + 1
        GameTooltip:AddLine((math.floor(d * 10) / 10) .. "码", 1, 1, 1)
        local t = getglobal("GameTooltipTextLeft" .. lines)
        if t then
          GameTooltip:SetHeight(GameTooltip:GetHeight() + t:GetHeight())
          setTextColor(t, d, nil, TargetDistanceCharDB.fontColor)
        end
        -- 如果遇到了t为空就是提示内容过多，应该是超过30行，不能显示更多了
      end
    end)

    -- 这里也可以用GameTooltip的OnUpdate来处理，先就这样了
    local mouseoverTrackerFrame = CreateFrame("Frame", "TargetDistanceMouseoverTrackerFrame", UIParent)
    mouseoverTrackerFrame:SetScript("OnUpdate", function()
      if not TargetDistanceCharDB.mouseoverTooltipDistance then return end
      local ttime = GetTime()
      if ttime < nextTrackTime then return end
      nextTrackTime = ttime + 0.1

      if UnitExists("mouseover") then
        for i = 1, GameTooltip:NumLines() do
          local t = getglobal("GameTooltipTextLeft" .. i)
          if t and string.find(t:GetText() or "", "%d码$") then
            local d = UnitXP("distanceBetween", unit, "mouseover")

            if d then
              t:SetText((math.floor(d * 10) / 10) .. "码")
              setTextColor(t, d, nil, TargetDistanceCharDB.fontColor)
            end
          end
        end
      end
    end)
  elseif event == "ADDON_LOADED" and arg1 == "TargetDistance" then
    if not TargetDistance.unitxp then
      addonmsg("加载经典距离，因：UnitXP_SP3.dll未加载")
      cantload = 1
      -- frame:Hide()
      -- return

      frame:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
      frame:RegisterEvent("CHARACTER_POINTS_CHANGED")
    end

    for k, v in pairs(defaults) do
      if TargetDistanceCharDB[k] == nil then
        TargetDistanceCharDB[k] = defaults[k]
      end
    end

    -- 设置框架位置
    frame:SetPoint("CENTER", UIParent, "CENTER", TargetDistanceCharDB.offsetX, TargetDistanceCharDB.offsetY)
    toggleLocked(TargetDistanceCharDB.locked)
    TargetDistance.setFontSize(TargetDistanceCharDB.fontSize)
    TargetDistance.setFontSizePp(TargetDistanceCharDB.fontSizePp)

    frame:SetScript("OnDragStart", OnDragStart)
    frame:SetScript("OnDragStop", OnDragStop)

    if TargetDistance.unitxp then
      frame:SetScript("OnUpdate", OnUpdate)
    else
      frame:SetScript("OnUpdate", OnDWUpdate)
    end

    SlashCmdList["TARGETDISTANCE"] = function(s)
      local command, option = string.match(s, "^(%S*)%s*(.-)$")
      if command ~= nil then
        command = string.lower(command)
      end
      if option ~= nil then
        option = string.lower(option)
      end

      if command == "unlock" then
        toggleLocked(false, 1)
      elseif command == "lock" then
        toggleLocked(true, 1)
      elseif command == "x" then
        if tonumber(option) ~= nil then
          TargetDistanceCharDB.offsetX = tonumber(option)
          refreshFramePoint()
          addonmsg("已设置x为距离屏幕中心" .. option)
        end
      elseif command == "y" then
        if tonumber(option) ~= nil then
          TargetDistanceCharDB.offsetY = tonumber(option)
          refreshFramePoint()
          addonmsg("已设置y为距离屏幕中心" .. option)
        end
      elseif command == "show" then
        toggleHidden(true)
      elseif command == "hide" then
        toggleHidden(false)
      else
        -- 这里是TargetDistance特有的，需要unitxp模组
        if command == "desc" then
          toggleDesc(nil, 1)
        elseif command == "dead" then
          toggleShowDeadDistance(nil, 1)
        elseif command == "pp" then
          togglePlayerPet()
        elseif command == "facewarn" then -- 新增命令，用于切换打脸提示
          toggleShowFaceWarning(nil, 1)
        elseif command == "option" then
          if _G["TargetDistanceMinimapButton"] then
            _G["TargetDistanceMinimapButton"]:Click()
          end
        end
      end
    end

    SLASH_TARGETDISTANCE1 = "/tdistance"
    SLASH_TARGETDISTANCE2 = "/tdis"

    addonmsg("|cff00ff00目标距离|r 已加载。使用 /tdistance lock 或 /tdistance unlock 来锁定或解锁目标距离显示框。")
    TargetDistance.loaded = 1
  elseif event == "UNIT_AURA" and arg1 == "player" then
    if cantload then return end
    if eotbactive() then
      unit = "pet"
    else
      unit = "player"
    end
  end
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
if unitClass == "猎人" or string.lower(unitClass) == "hunter" then
  frame:RegisterEvent("UNIT_AURA")
end
frame:SetScript("OnEvent", OnEvent)

TargetDistance.loaded = nil
TargetDistance.defaults = defaults
TargetDistance.unitClass = unitClass
TargetDistance.addonmsg = addonmsg
TargetDistance.toggleLocked = toggleLocked
TargetDistance.toggleHidden = toggleHidden
TargetDistance.refreshFramePoint = refreshFramePoint
TargetDistance.toggleShowDeadDistance = toggleShowDeadDistance
TargetDistance.toggleDesc = toggleDesc
TargetDistance.setFontSize = function(fontSize)
  distanceText:SetFont(STANDARD_TEXT_FONT, fontSize, "OUTLINE")
end
TargetDistance.setFontSizePp = function(fontSize)
  distanceText2:SetFont(STANDARD_TEXT_FONT, fontSize, "OUTLINE")
end
local triggers = {}
TargetDistance.addTrigger = function(name, f)
  if not triggers[name] then
    triggers[name] = {}
  end

  table.insert(triggers[name], f)
end
TargetDistance.setProp = function(name, value)
  TargetDistanceCharDB[name] = value
  if triggers[name] then
    for _, f in ipairs(triggers[name]) do
      triggers[name](value)
    end
  end
end
