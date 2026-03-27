if TargetDistance.unitxp then
  return
end

local frame = TargetDistanceFrame
if not frame then return end

DW_MELEE_MODIFYER = 0
DW_RANGE_MODIFYER = 0

DWClassic = {
  min = 0,
  max = 200
} -- DistanceWarning

local scanSlots = {}

local findTalentPos = function(talentName)
  for tab = 1, 3 do
    local i = 1
    while (1) do
      local name, texture, _, _, points, maxPoints = GetTalentInfo(i)

      if name == talentName then
        return tab, i
      end

      if not name then break end
      i = i + 1
    end
  end
end

local getTalentPoints = function(tab, index)
  return ({ GetTalentInfo(tab, index) })[5]
end

local increaseRangeTalentMap = {
  ["HUNTER"] = { ["鹰眼"] = { inc = { 3, 6 }, pos = { 2, 5 } } },
  ["MAGE"] = { ["烈焰投掷"] = { inc = { 3, 6 }, pos = { 2, 4 } }, ["极寒延伸"] = { inc = { 0.1, 0.2 }, pos = { 3, 11 } } },
  ["DRUID"] = { ["自然延伸"] = { inc = { 0.1, 0.2 }, pos = { 1, 11 } } },
  ["PRIEST"] = { ["神圣延伸"] = { inc = { 0.1, 0.2 }, pos = { 2, 6 } }, ["暗影延伸"] = { inc = { 0.06, 0.13, 0.2 }, pos = { 3, 11 } } },
  ["WARLOCK"] = { ["无情延伸"] = { inc = { 0.1, 0.2 }, pos = { 1, 10 } }, ["毁灭延伸"] = { inc = { 0.1, 0.2 }, pos = { 3, 10 } } },
  ["SHAMAN"] = { ["风暴来临"] = { inc = { 3, 6 }, pos = { 1, 12 } } },
  ["ROGUE"] = { ["投掷武器专精"] = { inc = { 3, 6 }, pos = { 1, 10 } } },
}

local detectRangeSpells = {
  ["HUNTER"] = {
    ["摔绊"] = { yards = "5", t = "ATTACK" },
    ["猫鼬撕咬"] = { yards = "5", t = "ATTACK" },
    ["切碎"] = { yards = "5", t = "ATTACK" },
    ["投掷"] = { yards = "8-30", t = "ATTACK" },
    ["驱散射击"] = { yards = '15-1', t = "ATTACK" },
    ["毒蛇钉刺"] = { yards = "8-35-1", t = "ATTACK" },
    ["蝰蛇钉刺"] = { yards = "8-35-1", t = "ATTACK" },
    ["毒蝎钉刺"] = { yards = "8-35-1", t = "ATTACK" },
    ["宁神射击"] = { yards = "8-35-1", t = "ATTACK" },
    ["奥术射击"] = { yards = "8-35-1", t = "ATTACK" },
    ["多重射击"] = { yards = "8-35-1", t = "ATTACK" },
    ["瞄准射击"] = { yards = "8-35-1", t = "ATTACK" },
    ["稳固射击"] = { yards = "8-35-1", t = "ATTACK" },
    ["震荡射击"] = { yards = "8-35-1", t = "ATTACK" },
  },
  ["MAGE"] = {
    ["火焰冲击"] = { yards = "20", t = "ATTACK" },
    ["法术反制"] = { yards = "30", t = "ATTACK" },
    ["法术偷取"] = { yards = "30", t = "ATTACK" },
    ["奥术溃裂"] = { yards = "30", t = "ATTACK" },
    ["奥术飞弹"] = { yards = "30", t = "ATTACK" },
    ["奥术涌动"] = { yards = "30", t = "ATTACK" },
    ["奥术智慧"] = { yards = "30", t = "ASSIST" },
    ["解除次级诅咒"] = { yards = "30", t = "ASSIST" },
    ["魔法增效"] = { yards = "30", t = "ALL" },
    ["魔法抑制"] = { yards = "30", t = "ALL" },
    ["灼烧"] = { yards = "30-1", t = "ATTACK" },
    ["火球术"] = { yards = "35", t = "ATTACK" },
    ["炎爆术"] = { yards = "35", t = "ATTACK" },
    ["寒冰箭"] = { yards = "30-2", t = "ATTACK" },
    ["冰柱"] = { yards = "30-2", t = "ATTACK" },
    ["侦测魔法"] = { yards = "40", t = "ATTACK" },
  },
  ["DRUID"] = {
    ["捶击"] = { yards = "5", t = "ATTACK" },
    ["挥击"] = { yards = "5", t = "ATTACK" },
    ["低吼"] = { yards = "5", t = "ATTACK" },
    ["重击"] = { yards = "5", t = "ATTACK" },
    ["扫击"] = { yards = "5", t = "ATTACK" },
    ["爪击"] = { yards = "5", t = "ATTACK" },
    ["撕碎"] = { yards = "5", t = "ATTACK" },
    ["毁灭"] = { yards = "5", t = "ATTACK" },
    ["突袭"] = { yards = "5", t = "ATTACK" },
    ["撕扯"] = { yards = "5", t = "ATTACK" },
    ["凶猛撕咬"] = { yards = "5", t = "ATTACK" },
    ["畏缩"] = { yards = "5", t = "ATTACK" },
    ["割伤"] = { yards = "5", t = "ATTACK" },
    ["斜掠"] = { yards = "5", t = "ATTACK" },
    ["横扫"] = { yards = "5", t = "ATTACK" },
    ["割裂"] = { yards = "5", t = "ATTACK" },
    ["野性冲锋"] = { yards = "8-25", t = "ATTACK" },
    ["愤怒"] = { yards = "30-1", t = "ATTACK" },
    ["月火术"] = { yards = "30-1", t = "ATTACK" },
    ["星火术"] = { yards = "30-1", t = "ATTACK" },
    ["纠缠根须"] = { yards = "30-1", t = "ATTACK" },
    ["精灵之火"] = { yards = "30-1", t = "ATTACK" },
    ["虫群"] = { yards = "30-1", t = "ATTACK" },
    ["野性印记"] = { yards = "30", t = "ASSIST" },
    ["废毒术"] = { yards = "30", t = "ASSIST" },
    ["驱毒术"] = { yards = "30", t = "ASSIST" },
    ["解除诅咒"] = { yards = "30", t = "ASSIST" },
    ["消毒术"] = { yards = "30", t = "ASSIST" },
    ["荆棘术"] = { yards = "30-1", t = "ASSIST" },
    ["激活"] = { yards = "30-1", t = "ASSIST" },
    ["愈合"] = { yards = "40", t = "ASSIST" },
    ["治疗之触"] = { yards = "40", t = "ASSIST" },
    ["回春术"] = { yards = "40", t = "ASSIST" },
  },
  ["PRIEST"] = {
    ["沉默"] = { yards = "20", t = "ATTACK" },
    ["神圣之火"] = { yards = "30-1", t = "ATTACK" },
    ["惩击"] = { yards = "30-1", t = "ATTACK" },
    ["精神鞭笞"] = { yards = "20-2", t = "ATTACK" },
    ["暗言术：痛"] = { yards = "30-2", t = "ATTACK" },
    ["心灵震爆"] = { yards = "30-2", t = "ATTACK" },
    ["噬灵瘟疫"] = { yards = "30-2", t = "ATTACK" },
    ["暗言术：灭"] = { yards = "30-2", t = "ATTACK" },
    ["吸血鬼之触"] = { yards = "30-2", t = "ATTACK" },
    ["法力燃烧"] = { yards = "30", t = "ATTACK" },
    ["真言术：韧"] = { yards = "30", t = "ASSIST" },
    ["神圣精神"] = { yards = "30", t = "ASSIST" },
    ["驱散魔法"] = { yards = "30", t = "ASSIST" },
    ["祛病术"] = { yards = "30", t = "ASSIST" },
    ["驱除疾病"] = { yards = "30", t = "ASSIST" },
    ["神圣之灵"] = { yards = "30", t = "ASSIST" },
    ["暗影防护"] = { yards = "30", t = "ASSIST" },
    ["防护恐惧结界"] = { yards = "30", t = "ASSIST" },
    ["治疗术"] = { yards = "40", t = "ASSIST" },
    ["次级治疗术"] = { yards = "40", t = "ASSIST" },
    ["快速治疗"] = { yards = "40", t = "ASSIST" },
    ["强效治疗术"] = { yards = "40", t = "ASSIST" },
    ["恢复"] = { yards = "40", t = "ASSIST" },
    ["治疗之环"] = { yards = "40", t = "ASSIST" },
    ["联结治疗"] = { yards = "40", t = "ASSIST" },
  },

  ["WARLOCK"] = {
    ["恐惧"] = { yards = "20-1", t = "ATTACK" },
    ["虚弱诅咒"] = { yards = "30-1", t = "ATTACK" },
    ["腐蚀术"] = { yards = "30-1", t = "ATTACK" },
    ["痛苦诅咒"] = { yards = "30-1", t = "ATTACK" },
    ["吸取灵魂"] = { yards = "30-1", t = "ATTACK" },
    ["鲁莽诅咒"] = { yards = "30-1", t = "ATTACK" },
    ["舌之诅咒"] = { yards = "30-1", t = "ATTACK" },
    ["生命虹吸"] = { yards = "30-1", t = "ATTACK" },
    ["元素诅咒"] = { yards = "30-1", t = "ATTACK" },
    ["死亡缠绕"] = { yards = "30-1", t = "ATTACK" },
    ["阴影诅咒"] = { yards = "30-1", t = "ATTACK" },
    ["吸取生命"] = { yards = "30-1", t = "ATTACK" },
    ["吸取法力"] = { yards = "30-1", t = "ATTACK" },
    ["腐蚀之种"] = { yards = "30-1", t = "ATTACK" },
    ["痛苦无常"] = { yards = "30-1", t = "ATTACK" },
    ["暗影燃烧"] = { yards = "20-2", t = "ATTACK" },
    ["暗影灼烧"] = { yards = "20-2", t = "ATTACK" },
    ["暗影箭"] = { yards = "30-2", t = "ATTACK" },
    ["献祭"] = { yards = "30-2", t = "ATTACK" },
    ["灼热之痛"] = { yards = "30-2", t = "ATTACK" },
    ["灵魂之火"] = { yards = "30-2", t = "ATTACK" },
    ["燃烧"] = { yards = "30-2", t = "ATTACK" },
    ["烧尽"] = { yards = "30-2", t = "ATTACK" },
    ["无尽呼吸"] = { yards = "30", t = "ASSIST" },
    ["侦测次极隐形"] = { yards = "30", t = "ASSIST" },
    ["侦测隐形"] = { yards = "30", t = "ASSIST" },
    ["侦测高级隐形"] = { yards = "30", t = "ASSIST" },
  },
  ["SHAMAN"] = {
    ["闪电链"] = { yards = "30-1", t = "ATTACK" },
    ["闪电箭"] = { yards = "30-1", t = "ATTACK" },
    ["地震术"] = { yards = "20-1", t = "ATTACK" },
    ["烈焰震击"] = { yards = "20", t = "ATTACK" },
    ["冰霜震击"] = { yards = "20", t = "ATTACK" },
    ["净化术"] = { yards = "30", t = "ATTACK" },
    ["消毒术"] = { yards = "30", t = "ATTACK" },
    ["祛病术"] = { yards = "30", t = "ATTACK" },
    ["水下呼吸"] = { yards = "30", t = "ATTACK" },
    ["水上行走"] = { yards = "30", t = "ATTACK" },
    ["先祖之魂"] = { yards = "30", t = "ATTACK" },
    ["治疗波"] = { yards = "40", t = "ATTACK" },
    ["次级治疗波"] = { yards = "40", t = "ATTACK" },
    ["治疗链"] = { yards = "40", t = "ATTACK" },
    ["大地之盾"] = { yards = "40", t = "ATTACK" },
  },
  ["PALADIN"] = {
    ["制裁之锤"] = { yards = "10", t = "ATTACK" },
    ["审判"] = { yards = "10", t = "ATTACK" },
    -- ["忏悔"] = { yards = "20", t = "ATTACK" },
    ["神圣震击"] = { yards = "20", t = "ALL" },
    ["清洁术"] = { yards = "30", t = "ASSIST" },
    ["纯净术"] = { yards = "30", t = "ASSIST" },
    ["力量祝福"] = { yards = "30", t = "ASSIST" },
    ["智慧祝福"] = { yards = "30", t = "ASSIST" },
    ["庇护祝福"] = { yards = "30", t = "ASSIST" },
    ["自由祝福"] = { yards = "30", t = "ASSIST" },
    ["光明祝福"] = { yards = "30", t = "ASSIST" },
    ["王者祝福"] = { yards = "30", t = "ASSIST" },
    ["圣光术"] = { yards = "40", t = "ASSIST" },
    ["圣疗术"] = { yards = "40", t = "ASSIST" },
    ["圣光闪现"] = { yards = "40", t = "ASSIST" },
    -- ["正义壁垒"] = { yards = "5", t = "ATTACK" },
    ["十字军打击"] = { yards = "5", t = "ATTACK" },
  },
  ["WARRIOR"] = {
    ["致死打击"] = { yards = "5", t = "ATTACK" },
    ["破甲攻击"] = { yards = "5", t = "ATTACK" },
    ["断筋"] = { yards = "5", t = "ATTACK" },
    ["嘲讽"] = { yards = "5", t = "ATTACK" },
    ["压制"] = { yards = "5", t = "ATTACK" },
    ["盾击"] = { yards = "5", t = "ATTACK" },
    ["复仇"] = { yards = "5", t = "ATTACK" },
    ["惩戒痛击"] = { yards = "5", t = "ATTACK" },
    ["缴械"] = { yards = "5", t = "ATTACK" },
    ["斩杀"] = { yards = "5", t = "ATTACK" },
    ["盾牌猛击"] = { yards = "5", t = "ATTACK" },
    ["撕裂"] = { yards = "5", t = "ATTACK" },
    ["拳击"] = { yards = "5", t = "ATTACK" },
    ["嗜血"] = { yards = "5", t = "ATTACK" },
    ["震荡猛击"] = { yards = "5", t = "ATTACK" },
    ["猛击"] = { yards = "5", t = "ATTACK" },
    ["破胆怒吼"] = { yards = "10", t = "ATTACK" },
    ["冲锋"] = { yards = "8-25", t = "ATTACK" },
    ["拦截"] = { yards = "8-25", t = "ATTACK" },
    ["援护"] = { yards = "8-25", t = "ASSIST" },
    ["枪械射击"] = { yards = "8-30", t = "ATTACK" },
    ["弓射击"] = { yards = "8-30", t = "ATTACK" },
    ["弩射击"] = { yards = "8-30", t = "ATTACK" },
  },
  ["ROGUE"] = {
    ["割裂"] = { yards = "5", t = "ATTACK" },
    ["邪恶攻击"] = { yards = "5", t = "ATTACK" },
    ["背刺"] = { yards = "5", t = "ATTACK" },
    ["脚踢"] = { yards = "5", t = "ATTACK" },
    ["凿击"] = { yards = "5", t = "ATTACK" },
    ["刺骨"] = { yards = "5", t = "ATTACK" },
    ["锁喉"] = { yards = "5", t = "ATTACK" },
    ["绞杀"] = { yards = "5", t = "ATTACK" },
    ["偷袭"] = { yards = "5", t = "ATTACK" },
    ["卸甲"] = { yards = "5", t = "ATTACK" },
    ["破甲"] = { yards = "5", t = "ATTACK" },
    ["佯攻"] = { yards = "5", t = "ATTACK" },
    ["肾击"] = { yards = "5", t = "ATTACK" },
    ["伏击"] = { yards = "5", t = "ATTACK" },
    ["出血"] = { yards = "5", t = "ATTACK" },
    ["放血"] = { yards = "5", t = "ATTACK" },
    ["还击"] = { yards = "5", t = "ATTACK" },
    ["鬼魅攻击"] = { yards = "5", t = "ATTACK" },
    ["致盲"] = { yards = "10", t = "ATTACK" },
    ["枪械射击"] = { yards = "8-30", t = "ATTACK" },
    ["弓射击"] = { yards = "8-30", t = "ATTACK" },
    ["弩射击"] = { yards = "8-30", t = "ATTACK" },
    ["投掷"] = { yards = "8-30-1", t = "ATTACK" },
    ["致命投掷"] = { yards = "8-30-1", t = "ATTACK" },
  },
}

local otherDetectRangeActions = {
  ["地精火箭头盔"] = { yards = '30', t = "ATTACK" },
  ["侏儒撒网器"] = { yards = '30', t = "ATTACK" },
  ["侏儒缩小射线"] = { yards = '30', t = "ATTACK" },
  ["雪球"] = { yards = '30', t = "ALL" },
  ["亚麻绷带"] = { yards = '15', t = "ASSIST" },
  ["厚亚麻绷带"] = { yards = '15', t = "ASSIST" },
  ["绒线绷带"] = { yards = '15', t = "ASSIST" },
  ["厚绒线绷带"] = { yards = '15', t = "ASSIST" },
  ["丝质绷带"] = { yards = '15', t = "ASSIST" },
  ["厚丝质绷带"] = { yards = '15', t = "ASSIST" },
  ["魔纹绷带"] = { yards = '15', t = "ASSIST" },
  ["厚魔纹绷带"] = { yards = '15', t = "ASSIST" },
  ["符文布绷带"] = { yards = '15', t = "ASSIST" },
  ["厚符文布绷带"] = { yards = '15', t = "ASSIST" },
}

local cRange = function(eClass, talentName, baseRange, points)
  local rangeTalentMap = increaseRangeTalentMap[eClass]
  if rangeTalentMap then
    local talentInfo = rangeTalentMap[talentName]
    local tName = GetTalentInfo(talentInfo.pos[1], talentInfo.pos[2])
    if tName ~= talentName then
      local tab, index = findTalentPos(talentName)
      if tab then
        talentInfo.pos = { tab, index }
      end
    end

    if not points then
      points = getTalentPoints(talentInfo.pos[1], talentInfo.pos[2])
    end
    if points then
      local increase = talentInfo.inc[points]
      if increase then
        if increase < 1 then
          return baseRange * (1 + increase)
        else
          return baseRange + increase
        end
      end
    end
  end

  return baseRange
end

local updateDistanceTextColor = function(maxdis, mindis)
  local r, g, b
  if (DW_PLAYER_CLASS == "HUNTER") then
    if (maxdis <= 5) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 8) then
      r, g, b = 1, 0, 0
    elseif (maxdis <= cRange(DW_PLAYER_CLASS, "鹰眼", 15)) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 30) then
      r, g, b = 1, 0.5, 0
    elseif (maxdis <= cRange(DW_PLAYER_CLASS, "鹰眼", 35)) then
      r, g, b = 0, 1, 0
    else
      r, g, b = 0, 0.9, 0.9
    end
  elseif (DW_PLAYER_CLASS == "WARRIOR") then
    if (maxdis <= 5) then
      r, g, b = 0, 1, 0
    elseif (maxdis <= 8) then
      r, g, b = 1, 0, 0
    elseif (maxdis <= 25) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 41) then
      r, g, b = 1, 0, 0
    else
      r, g, b = 1, 0, 0
    end
  elseif (DW_PLAYER_CLASS == "ROGUE") then
    if (maxdis <= 8) then
      r, g, b = 0, 1, 0
    elseif (maxdis <= 20) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 41) then
      r, g, b = 1, 0, 0
    else
      r, g, b = 1, 0, 0
    end
  elseif (DW_PLAYER_CLASS == "MAGE") then
    if (maxdis <= 6) then
      r, g, b = 1, 0, 0
    elseif (maxdis <= 10) then
      r, g, b = 1, 0.5, 0
    elseif (maxdis <= 26) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 30) then
      r, g, b = 0, 1, 0
    elseif (maxdis <= 41) then
      r, g, b = 1, 1, 0
    else
      r, g, b = 0, 0.9, 0.9
    end
  elseif (DW_PLAYER_CLASS == "SHAMAN") then
    if (maxdis <= 5.55) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 20) then
      r, g, b = 0, 1, 0
    elseif (maxdis <= 30) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 41) then
      r, g, b = 1, 1, 0
    else
      r, g, b = 1, 0, 0
    end
  elseif (DW_PLAYER_CLASS == "DRUID") then
    if (maxdis <= 10) then
      r, g, b = 1, 0, 0
    elseif (maxdis <= 30) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 41) then
      r, g, b = 0, 1, 0
    else
      r, g, b = 0, 0.9, 0.9
    end
  elseif (DW_PLAYER_CLASS == "PALADIN") then
    if (maxdis <= 10) then
      r, g, b = 0, 1, 0
    elseif (maxdis <= 30) then
      r, g, b = 1, 1, 0
    elseif (maxdis <= 41) then
      r, g, b = 1, 0, 0
    else
      r, g, b = 1, 0, 0
    end
  elseif (DW_PLAYER_CLASS == "WARLOCK") then
    if (maxdis <= 10) then
      r, g, b = 1, 0, 0
    elseif (maxdis <= 24) then
      r, g, b = 0, 1, 0
    elseif (maxdis <= 41) then
      r, g, b = 1, 1, 0
    else
      r, g, b = 0, 0.9, 0.9
    end
  elseif (DW_PLAYER_CLASS == "PRIEST") then
    if (maxdis <= 10) then
      r, g, b = 1, 0, 0
    elseif (maxdis <= 24) then
      r, g, b = 0, 1, 0
    elseif (maxdis <= 41) then
      r, g, b = 1, 1, 0
    else
      r, g, b = 0, 0.9, 0.9
    end
  end

  frame.distanceText:SetTextColor(r, g, b)
end

local dwtooltip = CreateFrame("GameTooltip", "DWClassicGameTooltip", UIParent, "GameTooltipTemplate")
dwtooltip.ClearAllLines = function(self)
  self:ClearLines();
  for i = 1, 30 do
    local rightFontstring = getglobal(self:GetName() .. "TextRight" .. i)
    if not rightFontstring then
      return
    end
    rightFontstring:SetText("")
  end
end

-- dbg = dbg or {}
local getActionSpellInfo = function(slot)
  dwtooltip:SetOwner(UIParent, "ANCHOR_NONE")
  dwtooltip:ClearAllLines()
  dwtooltip:SetAction(slot)
  local fontstring = getglobal(dwtooltip:GetName() .. "TextLeft1")
  local spellName, ranges
  if fontstring then
    spellName = fontstring:GetText()
    -- table.insert(dbg, 'class:'..(DW_PLAYER_CLASS or 'nil')..', spellName:'..(spellName or 'nil'))

    if otherDetectRangeActions[spellName] then
      return spellName, { tonumber(otherDetectRangeActions[spellName].yards) }, otherDetectRangeActions[spellName].t,
          otherDetectRangeActions[spellName].yards
    end

    local detectSpellInfo = detectRangeSpells[DW_PLAYER_CLASS][spellName]

    if not DW_PLAYER_CLASS or not detectSpellInfo then return end
    for i = 1, 30 do
      local rightFontstring = getglobal(dwtooltip:GetName() .. "TextRight" .. i)
      if rightFontstring then
        local rightText = rightFontstring:GetText()
        if rightText then
          -- table.insert(dbg, rightText)
          local _, _, a, b = string.find(rightText, "(%d+)%s*-%s*(%d+)码距离")
          if a then
            ranges = { tonumber(b), tonumber(a) } -- 把最大距离放在前面，可以让逻辑更统一
            break
          else
            _, _, a = string.find(rightText, "(%d+)%s*码距离")
            if a then
              ranges = { tonumber(a) }
              break
            end
          end
        end
      end

      local leftFontstring = getglobal(dwtooltip:GetName() .. "TextLeft" .. i)
      if leftFontstring then
        local leftText = leftFontstring:GetText()
        if leftText then
          -- table.insert(dbg, leftText)
          local _, _, a, b = string.find(leftText, "(%d+)%s*-%s*(%d+)码距离")
          if a then
            ranges = { tonumber(b), tonumber(a) } -- 把最大距离放在前面，可以让逻辑更统一
            break
          else
            _, _, a = string.find(leftText, "(%d+)%s*码距离")
            if a then
              ranges = { tonumber(a) }
              break
            end
          end
        end
      end
    end
    -- table.insert(dbg, spellName .. ', rangeMax=' .. (ranges[1] or '404'))

    return spellName, ranges, detectSpellInfo.t, detectSpellInfo.yards
  else
    -- table.insert(dbg, 'nofontstring:'..slot)
  end
end

local testSlot = function(slot)
  -- table.insert(dbg, 'slot'..slot)
  -- 获取基本信息判定动作条按钮是否为技能
  local ico, lab = GetActionTexture(slot), GetActionText(slot);
  if not ico or lab then
    scanSlots[slot] = nil
    return
  end
  -- 获取动作条技能名称
  local spellName, ranges, t, yards = getActionSpellInfo(slot)
  -- 记录需要扫描的动作条编号
  if spellName and ranges then
    -- table.insert(dbg, 'slot'..slot..', spellName:'..spellName)
    scanSlots[slot] = {
      spellName = spellName,
      ranges = ranges,
      t = t,
      yards = yards
    }
  else
    scanSlots[slot] = nil
  end
end

local testAllSlots = function()
  for i = 1, 120 do
    testSlot(i)
  end
end

DWClassic.onActionbarSlotChanged = function(slot)
  if (DW_PLAYER_CLASS) then
    testSlot(slot)
  end
end

DWClassic.onTalentChanged = function()
  testAllSlots()
end

DWClassic.onPlayerEnteringWorld = function()
  if (DW_PLAYER_CLASS == nil) then
    _, DW_PLAYER_CLASS = UnitClass("player");
  end

  testAllSlots()

  -- frame.distanceText:SetTextColor(unpack(TargetDistanceCharDB.fontColor))
end

DWClassic.onPlayerTargetChanged = function()
  if (UnitExists("target")) then
    local melee_mod1, melee_mod2, range_mod1, range_mod2;
    if (UnitIsPlayer("target")) then
      if (UnitRace("target") == "牛头人") then
        melee_mod1 = 2.4;
        range_mod1 = 3.4;
      else
        melee_mod1 = 0;
        range_mod1 = 1;
      end
      if (UnitRace("player") == "牛头人") then
        melee_mod2 = 2.4;
        range_mod2 = 3.4;
      else
        melee_mod2 = 0;
        range_mod2 = 1;
      end
    else
      melee_mod1 = 0;
      range_mod1 = 0;
      melee_mod2 = 0;
      range_mod2 = 0;
    end
    DW_MELEE_MODIFYER = melee_mod1 + melee_mod2;
    DW_RANGE_MODIFYER = range_mod1 + range_mod2;
  else
    DW_MELEE_MODIFYER = 0
    DW_RANGE_MODIFYER = 0
    frame.distanceText:SetText("")
  end
end

DWClassic.onTick = function()
  if not UnitExists("target") then
    frame.distanceText:SetText("")
    return
  end

  -- 先确认大致范围
  if CheckInteractDistance("target", 3) then
    DWClassic.min = 0
    DWClassic.max = 10
  elseif CheckInteractDistance("target", 2) then
    DWClassic.min = 10
    DWClassic.max = 11
  elseif CheckInteractDistance("target", 4) then
    DWClassic.min = 11
    DWClassic.max = 30
  else
    DWClassic.min = 30
    DWClassic.max = 200
  end

  if DWClassic.max < 200 then
    if (DWClassic.max - DW_RANGE_MODIFYER <= 5) then
      DWClassic.max = DWClassic.max - DW_MELEE_MODIFYER;
    else
      DWClassic.max = DWClassic.max - DW_RANGE_MODIFYER;
    end
  end
  if (DWClassic.min - DW_RANGE_MODIFYER <= 5) then
    DWClassic.min = DWClassic.min - DW_MELEE_MODIFYER;
  else
    DWClassic.min = DWClassic.min - DW_RANGE_MODIFYER;
  end

  -- 经过以上步骤，30码以上的技能已经没有意义

  local canAttack = UnitCanAttack("player", "target")
  local canAssist = UnitCanAssist("player", "target")
  local tested = {}

  for slot, options in pairs(scanSlots) do
    -- {
    --   spellName = spellName,
    --   ranges = ranges
    -- }
    local inRange = IsActionInRange(slot)
    local isRange = table.getn(options.ranges) == 2
    -- local spellInfo = detectRangeSpells[DW_PLAYER_CLASS][options.spellName]

    if not tested[options.yards] and (
          (canAttack and (options.t == 'ATTACK' or options.t == 'ALL'))
          or
          (canAssist and (options.t == 'ASSIST' or options.t == 'ALL'))
        ) and (isRange or options.ranges[1] < DWClassic.max) then
      tested[options.yards] = 1
      if inRange then
        if inRange == 1 then
          -- 在距离内
          if isRange then
            -- 是范围型，例：8-30
            if DWClassic.max > options.ranges[1] then
              DWClassic.max = options.ranges[1]
            end
            if DWClassic.min > options.ranges[2] then
              DWClassic.min = options.ranges[2]
            end
          else
            -- 不是范围型
            if DWClassic.max > options.ranges[1] then
              DWClassic.max = options.ranges[1]
            end
          end
        else
          -- 不在距离内
          if isRange then
            -- 是范围型，例：8-30
            if DWClassic.min >= options.ranges[2] and DWClassic.min < options.ranges[1] then
              DWClassic.min = options.ranges[1]
            end
            if DWClassic.max <= options.ranges[1] and DWClassic.max > options.ranges[2] then
              DWClassic.max = options.ranges[2]
            end
          else
            if DWClassic.min < options.ranges[1] then
              DWClassic.min = options.ranges[1]
            end
          end
        end
      end
    end
  end

  -- 显示距离
  if DWClassic.min == 0 then
    frame.distanceText:SetText("< " .. DWClassic.max)
  elseif DWClassic.min == DWClassic.max then
    frame.distanceText:SetText(DWClassic.max .. "码")
  elseif DWClassic.max > 41 then
    frame.distanceText:SetText("> " .. DWClassic.min)
  else
    frame.distanceText:SetText(DWClassic.min .. " - " .. DWClassic.max)
  end

  updateDistanceTextColor(DWClassic.max, DWClassic.min)
end
