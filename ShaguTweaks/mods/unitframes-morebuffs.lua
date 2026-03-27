local _G = ShaguTweaks.GetGlobalEnv()
local T = ShaguTweaks.T

local module = ShaguTweaks:register({
  title = T["More Buffs & Debuffs"],
  description = T["Extends the target frame to display up to 32 buffs and debuffs with improved layout."],
  expansions = { ["vanilla"] = true, ["tbc"] = true },
  category = T["Unit Frames"],
  enabled = true,
})

module.enable = function(self)
  local TARGETFRAMEBUFF_MAX_TARGET_DEBUFFS = 128
  local TARGETFRAMEBUFF_MAX_TARGET_BUFFS = 64

  -- 创建额外的buff/debuff按钮
  for i = 6, TARGETFRAMEBUFF_MAX_TARGET_BUFFS do
    local button = CreateFrame("Button", "TargetFrameBuff"..i, TargetFrame, "TargetBuffButtonTemplate")
    button:SetID(i)
    button:SetWidth(21)
    button:SetHeight(21)
    button:SetFrameLevel(0)
  end

  for i = 6, TARGETFRAMEBUFF_MAX_TARGET_DEBUFFS do
    local button = CreateFrame("Button", "TargetFrameDebuff"..i, TargetFrame, "TargetDebuffButtonTemplate")
    button:SetID(i)
    button:SetWidth(21)
    button:SetHeight(21)
    button:SetFrameLevel(0)
    local border = _G["TargetFrameDebuff"..i.."Border"]
    if border then
      border:SetWidth(21)
      border:SetHeight(21)
    end
  end

  -- 排列按钮组的函数
  local function ArrangeButtonGroup(prefix, count, startAnchor, isFirstGroup, firstRowCount, secondRowCount, thirdRowCount, laterRowCount, maxRows)
    if count < 1 then return nil, 0 end

    local rows = 1
    local currentRowCount = 1
    local rowStartIndex = 1

    for i = 1, count do
      local button = _G[prefix..i]
      if button then
        button:ClearAllPoints()
        button:Show()

        -- 确定当前行应该显示多少个按钮
        local buttonsPerRow
        if rows == 1 then
          buttonsPerRow = firstRowCount
        elseif rows == 2 then
          buttonsPerRow = secondRowCount
        elseif rows == 3 then
          buttonsPerRow = thirdRowCount
        else
          buttonsPerRow = laterRowCount
        end

        if i == 1 then
          -- 第一个按钮的定位
          if type(startAnchor) == "string" then
            button:SetPoint("TOPLEFT", startAnchor, "BOTTOMLEFT", isFirstGroup and 5 or 0, isFirstGroup and 32 or -2)
          else
            button:SetPoint("TOPLEFT", startAnchor, "BOTTOMLEFT", 0, -2)
          end
        else
          -- 判断是否需要换行
          if currentRowCount >= buttonsPerRow then
            rows = rows + 1
            if rows > maxRows then
              button:Hide()
            else
              currentRowCount = 1
              rowStartIndex = i
              -- 新行按钮放在上一行起始按钮下方
              local anchorButton = _G[prefix..(i - buttonsPerRow)]
              if anchorButton then
                button:SetPoint("TOPLEFT", anchorButton, "BOTTOMLEFT", 0, -2)
              end
            end
          else
            -- 同行中的后续按钮
            if rows <= maxRows then
              local prevButton = _G[prefix..(i-1)]
              if prevButton then
                button:SetPoint("LEFT", prevButton, "RIGHT", 3, 0)
              end
            else
              button:Hide()
            end
            currentRowCount = currentRowCount + 1
          end
        end
      end
    end

    -- 返回最后一行起始按钮和行数
    if count > 0 then
      local lastRowStartIndex = rowStartIndex
      if rows > maxRows then
        lastRowStartIndex = rowStartIndex
      end
      return _G[prefix..lastRowStartIndex], rows
    end
    return nil, 0
  end

  -- 扩展的更新函数
  function TargetFrameBuff_Update()
    local num_buff = 0
    local num_debuff = 0
    local button, buff

    -- 更新BUFF
    for i = 1, TARGETFRAMEBUFF_MAX_TARGET_BUFFS do
      buff = UnitBuff("target", i)
      button = _G["TargetFrameBuff"..i]
      if button then
        if buff then
          _G["TargetFrameBuff"..i.."Icon"]:SetTexture(buff)
          button:Show()
          button.id = i
          num_buff = i
        else
          button:Hide()
        end
      end
    end

    -- 更新DEBUFF
    local debuff, debuffApplications, debuffType
    for i = 1, TARGETFRAMEBUFF_MAX_TARGET_DEBUFFS do
      debuff, debuffApplications, debuffType = UnitDebuff("target", i)
      button = _G["TargetFrameDebuff"..i]
      if button then
        if debuff then
          local debuffCount = _G["TargetFrameDebuff"..i.."Count"]
          if debuffApplications and debuffApplications > 1 then
            debuffCount:SetText(debuffApplications)
            debuffCount:Show()
          else
            debuffCount:Hide()
          end
          _G["TargetFrameDebuff"..i.."Icon"]:SetTexture(debuff)
          button:Show()
          button.id = i
          num_debuff = i
        else
          button:Hide()
        end
      end
    end

    -- 重置所有按钮位置
    if TargetFrameBuff1 then TargetFrameBuff1:ClearAllPoints() end
    if TargetFrameDebuff1 then TargetFrameDebuff1:ClearAllPoints() end

    -- 根据目标类型排列BUFF/DEBUFF
    if UnitIsFriend("player", "target") then
      -- 友好目标：BUFF优先显示
      local lastBuffRowStart, buffRows = ArrangeButtonGroup("TargetFrameBuff", num_buff, "TargetFrame", true, 4, 4, 4, 12, 8)
      if num_debuff > 0 then
        -- 使用BUFF组最后一行起始按钮作为锚点
        ArrangeButtonGroup("TargetFrameDebuff", num_debuff, lastBuffRowStart or "TargetFrame", false, 12, 12, 12, 12, 8)
      end
    else
      -- 敌对目标：DEBUFF优先显示
      local lastDebuffRowStart, debuffRows = ArrangeButtonGroup("TargetFrameDebuff", num_debuff, "TargetFrame", true, 4, 4, 4, 12, 8)
      if num_buff > 0 then
        -- 使用DEBUFF组最后一行起始按钮作为锚点
        ArrangeButtonGroup("TargetFrameBuff", num_buff, lastDebuffRowStart or "TargetFrame", false, 12, 12, 12, 12, 8)
      end
    end
  end

  -- 替换原始函数
  ShaguTweaks.hooksecurefunc("TargetDebuffButton_Update", function()
    TargetFrameBuff_Update()
  end)

  -- 初始调用
  TargetFrameBuff_Update()

  -- 监听目标变化事件
  local eventFrame = CreateFrame("Frame")
  eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
  eventFrame:RegisterEvent("UNIT_AURA")
  eventFrame:SetScript("OnEvent", function()
    if event == "UNIT_AURA" and arg1 == "target" or event == "PLAYER_TARGET_CHANGED" then
      TargetFrameBuff_Update()
    end
  end)
end
