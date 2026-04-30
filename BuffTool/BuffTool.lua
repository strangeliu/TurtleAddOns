-- blend mode :DISABLE, BLEND, ALPHAKEY, ADD, MOD
BuffTool = CreateFrame('FRAME')
BuffTool:SetPoint('CENTER', UIParent, 'CENTER', 0, -30)
BuffTool:SetWidth(300)
BuffTool:SetHeight(300)
BuffTool:RegisterEvent('COMBAT_TEXT_UPDATE')
BuffTool:RegisterEvent('PLAYER_DEAD')
BuffTool:RegisterEvent('CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS')
BuffTool:RegisterEvent('CHAT_MSG_SPELL_SELF_DAMAGE')
BuffTool:RegisterEvent('CHAT_MSG_COMBAT_SELF_HITS')
BuffTool:RegisterEvent('CHAT_MSG_SPELL_ITEM_ENCHANTMENTS')
BuffTool:RegisterEvent('CHAT_MSG_SPELL_SELF_BUFF')
BuffTool:RegisterEvent('UNIT_PET')
BuffTool:RegisterEvent('UNIT_AURA')
BuffTool:RegisterEvent('PLAYER_ENTERING_WORLD')
BuffTool:RegisterEvent('PLAYER_TALENT_UPDATE')
BuffTool:RegisterEvent('CHARACTER_POINTS_CHANGED')
BuffTool:RegisterEvent('BIND_ENCHANT')

-- ===================== 配置系统 =====================
BuffToolConfig = BuffToolConfig or { enabled = {}, positions = {} }
local unlockMode = false
local auraFrames = {}          -- 存储所有特效容器 { frame, texture, timerText, info }
local auraTimers = {}          -- 计时器对象
local isDebug = false
local lastFunnelTime = 0
local lastFunnelRefresh = nil

-- ========== 前向声明（解决相互调用） ==========
local HandleAuraByName
local ShowTimer

-- ========== 提前定义 DebugLog（确保后续调用有效） ==========
local function DebugLog(message)  
    DEFAULT_CHAT_FRAME:AddMessage("BUFFTOOL: "..message)
end

local L = {}
local _,PlayerClass = UnitClass("player")
local playerName = UnitName("player")

local ArcaneSurgeTimer = nil

-- 释放潜能相关
local currentUPStacks = 0
local funnelActive = false
local funnelTickElapsed = 0
local hasUnleashedPotential = false
local isDemonologySpec = false

-- ===================== 语言表 =====================
L["Electrified"] = "Electrified"
L["Clearcasting"] = "Clearcasting"
L["Berserking"] = "Berserking"
L["Bonereaver's Edge"] = "Bonereaver's Edge"
L["Elemental Mastery"] = "Elemental Mastery"
L["Nature's Swiftness"] = "Nature's Swiftness"
L["Shadow Trance"] = "Shadow Trance"
L["Improved Soul Fire"] = "Improved Soul Fire"
L["Purifying Flames"] = "Purifying Flames"
L["Lightning Bolt"] = "Lightning Bolt"
L["Chain Lightning"] = "Chain Lightning"
L["resisted"] = "was resisted by"
L["Stormstrike"] = "Stormstrike"
L["Elemental Devastation"] = "Elemental Devastation"
L["Flurry"] = "Flurry"
L["Enlightened"] = "Enlightened"
L["Searing Light"] = "Searing Light"
L["Seeking Thunder"] = "Seeking Thunder"
L["Water Shield"] = "Water Shield"

-- Mage
L["Hot Streak"] = "Hot Streak"
L["Flash Freeze"] = "Flash Freeze"
L["Temporal Convergence"] = "Temporal Convergence"
L["Arcane Power"] = "Arcane Power"
L["Arcane Surge"] = "Arcane Surge"

-- Warlock
L["Unleashed Potential"] = "Unleashed Potential"

L["Surge_Casted_Token"] = "Your Arcane Surge"

-- Rogue
L["Relentless Strikes"] = "Relentless Strikes"

L["ARUAGET_TOKEN"] = "You gain "
L["You crit"] = "You crit "
L["SpellCrit_Token"] = "You crit "
L["AURASTACK_TOKEN"] = "%((%d+)%)"
L["resisted"] = "resisted"

-- Trinkets
L["The Eye of Diminution"] = "The Eye of Diminution"
L["The Eye of the Dead"] = "The Eye of the Dead"
L["Fever Dream"] = "Fever Dream"
L["Essence of Sapphiron"] = "Essence of Sapphiron"


if (GetLocale() == "zhCN") then
    L["Electrified"] = "充电"
    L["Clearcasting"] = "节能施法"
    L["Berserking"] = "狂暴(种族特长)"
    L["Bonereaver's Edge"] = "削骨之刃"
    L["Elemental Mastery"] = "元素掌握"
    L["Nature's Swiftness"] = "自然迅捷"
    L["Shadow Trance"] = "暗影冥思"
    L["Improved Soul Fire"] = "强化灵魂之火"
    L["Purifying Flames"] = "纯净火焰"
    L["Lightning Bolt"] = "闪电箭"
    L["Chain Lightning"] = "闪电链"
    L["resisted"] = "抵抗了"
    L["Stormstrike"] = "风暴打击"
    L["Elemental Devastation"] = "元素浩劫"
    L["Flurry"] = "乱舞"
    L["Enlightened"] = "启发"
    L["Searing Light"] = "灼热之光"
    L["Seeking Thunder"] = "Seeking Thunder"
    L["Water Shield"] = "水之护盾"
    L["Unleashed Potential"] = "释放潜能"

    -- 法师
    L["Hot Streak"] = "法术连击"
    L["Flash Freeze"] = "冰霜速冻"
    L["Temporal Convergence"] = "时间融合"
    L["Arcane Power"] = "奥术强化"
    L["Arcane Surge"] = "奥术涌动"

    L["Surge_Casted_Token"] = "你的奥术涌动"

    -- 盗贼
    L["Relentless Strikes"] = "无情打击"

    L["ARUAGET_TOKEN"] = "你获得了"
    L["You crit"] = "致命一击伤害"
    L["SpellCrit_Token"] = "致命一击对"
    L["AURASTACK_TOKEN"] = "（(%d+)）"
    L["resisted"] = "抵抗"

    L["Fever Dream"] = "狂热梦想"
    L["The Eye of Diminution"] = "衰落之眼"
    L["Essence of Sapphiron"] = "萨菲隆的精华"
    L["The Eye of the Dead"] = "亡者之眼"
end

-- ===================== BUFF配置表 =====================
local iconSize = 16;

local REFRESH_BUFF_BY_SPELL =
{
    [L["Stormstrike"]] = L["Stormstrike"],
    [L["Chain Lightning"]] = L["Electrified"],
    [L["Lightning Bolt"]] = L["Electrified"],
}
local REFRESH_BUFF_BY_HIT = {
    [L["You crit"]] = {
        L["Elemental Devastation"],
        L["Flurry"],
        L["Clearcasting"],
    }
}
local REFRESH_BUFF_BY_SPELL_CRIT = {
    [L["SpellCrit_Token"]] = {
        L["Elemental Devastation"],
        L["Flurry"],
        L["Clearcasting"],
        L["Searing Light"] 
    }
}

local BUFFTOOLTABLE = {
    -- Trinkets
    [L["Essence of Sapphiron"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\Aura72'},
        x = 0,
        y = 0,
        alpha = .8,
        width = 260,
        height = 130,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "CENTER",
        duration = 20,
        resistedfresh = false,
    },
    [L["The Eye of Diminution"]] = {
        canRefresh = false,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\Aura71'},
        x = 0,
        y = 20,
        alpha = 0.5,
        width = 300,
        height = 150,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "CENTER",
        duration = 20,
        resistedfresh = false,
    },
    [L["Electrified"]] = {
        canRefresh = true,
        texture = {
            'Interface\\AddOns\\BuffTool\\Images\\auraLighting',
            'Interface\\AddOns\\BuffTool\\Images\\auraLighting5',
        },
        x = -30,
        y = -30,
        alpha = 0.9,
        width = 130,
        height = 130,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        stack=true,
        duration = 15,
        resistedfresh = false,
    },
    [L["Bonereaver's Edge"]] = {
        canRefresh = true,
        texture =  {'Interface\\AddOns\\BuffTool\\Images\\auraLighting5'},
        x = -30,
        y = -30,
        alpha = 0.9,
        width = 130,
        height = 130,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        stack=false,
        duration = 10,
        resistedfresh = false,
    },
    [L["Seeking Thunder"]] = {
        canRefresh = true,
        texture = {
            'Interface\\AddOns\\BuffTool\\Images\\SeekingThunder',
        },
        x = -30,
        y = -60,
        alpha = 1.0,
        width = 100,
        height = 50,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOPLEFT",
        duration = 10,
        resistedfresh = false,
    },
    [L["Clearcasting"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\Lightning2'},
        x = 0,
        y = 90,
        alpha = 0.8,
        width = 64,
        height = 64,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        duration = 15,
        resistedfresh = false,
    },
    [L["Berserking"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\Aura226M'},
        x = 40,
        y = 0,
        alpha = 0.6,
        width = 100,
        height = 200,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "RIGHT",
        duration = 10,
        resistedfresh = false,
    },
    [L["Elemental Mastery"]] = {
        canRefresh = false,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\AuroCrys'},
        x = 0,
        y = -20,
        alpha = 0.7,
        width = 96,
        height = 96,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOP",
        duration = nil,
        resistedfresh = false,
    },
    [L["Nature's Swiftness"]] = {
        canRefresh = false,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\AuroCrys'},
        x = 0,
        y = -20,
        alpha = 0.8,
        width = 96,
        height = 96,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOP",
        duration = nil
    },
    [L["The Eye of the Dead"]] = {
        canRefresh = false,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\AuraWing'},
        x = 0,
        y = 20, 
        alpha = 0.4,
        width = 300,
        height = 150,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "CENTER",
        duration = 30
    },
    [L["Fever Dream"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\Aura198'},
        x = -20,
        y = 20,
        alpha = 0.6,
        width = 48,
        height = 48,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        duration = 20
    },
    [L["Stormstrike"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\Stormstrike'},
        x = 30,
        y = -30,
        alpha = 0.4,
        width = 48,
        height = 48,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOPLEFT",
        duration = 12
    },
    [L["Elemental Devastation"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\ElementalDevastation'},
        x = -35,
        y = -30,
        alpha = 0.4,
        width = 48,
        height = 48,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOPRIGHT",
        duration = 10
    },
    [L["Water Shield"]] = {
        canRefresh = false,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\WaterShield'},
        x = -50,
        y = -30,
        alpha = 0.6,
        width = 48,
        height = 48,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "RIGHT",
        duration = 10
    },
    
    -- warlock 
    [L["Shadow Trance"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\AruaUni'},
        x = -30,
        y = 20,
        alpha = 0.9,
        width = 150,
        height = 150,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        duration = 10
    },
    [L["Improved Soul Fire"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\FlameDragon'},
        x = -30,
        y = 20,
        alpha = 0.9,
        width = 100,
        height = 100,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        duration = 30
    },
    [L["Unleashed Potential"]] = {
        canRefresh = true,
        texture = {
            'Interface\\AddOns\\BuffTool\\Images\\HotStreak2',  -- 1层
            'Interface\\AddOns\\BuffTool\\Images\\HotStreak4',  -- 2层
            'Interface\\AddOns\\BuffTool\\Images\\HotStreak5',  -- 3层
        },
        x = -30,
        y = 20,
        alpha = 0.9,
        width = 130,
        height = 130,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        stack = true,
        duration = 20,
        resistedfresh = false,
    },
    
    -- priest
    [L["Purifying Flames"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\InnerFire'},
        x = -40,
        y = 0,
        alpha = 0.8,
        width = 80,
        height =160, 
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        duration = 10
    },
    [L["Enlightened"]] = {
        canRefresh = false,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\AuraCrys2'},
        x = 20,
        y = -30,
        alpha = 1.0,
        width = 80,
        height = 80,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOPLEFT",
        duration = 8
    },
    [L["Searing Light"]] = {
        canRefresh = true,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\AuroCrys'},
        x = 0,
        y = 20,
        alpha = 0.8,
        width = 120,
        height =120, 
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOP",
        duration = 8
    },
    
    -- Mage
    [L["Hot Streak"]] = {
        canRefresh = false,
        texture = {
            'Interface\\AddOns\\BuffTool\\Images\\HotStreak1',
            'Interface\\AddOns\\BuffTool\\Images\\HotStreak2',
            'Interface\\AddOns\\BuffTool\\Images\\HotStreak3',
            'Interface\\AddOns\\BuffTool\\Images\\HotStreak4',
            'Interface\\AddOns\\BuffTool\\Images\\HotStreak5',
        },
        x = -30,
        y = 20,
        alpha = 0.9,
        width = 130,
        height = 130,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        stack = true,
        duration = 20
    },
    [L["Flash Freeze"]] = {
        id = 28862,
        canRefresh = true,
        texture = {
            'Interface\\AddOns\\BuffTool\\Images\\FlashFreeze',
        },
        x = -30,
        y = 20,
        alpha = 0.9,
        width = 100,
        height = 200,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        stack = true,
        duration = 8
    },
    [L["Temporal Convergence"]] = {
        id = 51395,
        canRefresh = true,
        texture = {
            'Interface\\AddOns\\BuffTool\\Images\\auraLighting',
        },
        x = -30,
        y = -30,
        alpha = 0.9,
        width = 130,
        height = 130,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        stack=true,
        duration = 12
    },
    [L["Arcane Surge"]] = {
        id = 51395,
        canRefresh = true,
        texture = {
            'Interface\\AddOns\\BuffTool\\Images\\ArcaneSurge2',
        },
        x = 30,
        y = -20,
        alpha = 0.8,
        width = 64,
        height = 64,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOPLEFT",
        stack=false,
        duration = 4,
        resistedfresh = true,
    },

    [L["Arcane Power"]] = {
        canRefresh = false,
        texture = {'Interface\\AddOns\\BuffTool\\Images\\LightningBlue'},
        x = 0,
        y = 0,
        alpha = 0.9,
        width = 150,
        height = 75,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "TOP",
        duration = nil
    },

    -- Rogue
    [L["Relentless Strikes"]] = {
        id = 14179,
        canRefresh = false,
        texture = {
            'Interface\\AddOns\\BuffTool\\Images\\Relentless Strikes1',
            'Interface\\AddOns\\BuffTool\\Images\\Relentless Strikes2',
            'Interface\\AddOns\\BuffTool\\Images\\Relentless Strikes3',
            'Interface\\AddOns\\BuffTool\\Images\\Relentless Strikes4',
            'Interface\\AddOns\\BuffTool\\Images\\Relentless Strikes5',
        },
        x = -10,
        y = 20,
        alpha = 0.9,
        width = 80,
        height = 80,
        Blend = "ADD",
        Color = {1,1,1},
        Pos = "LEFT",
        stack = true,
        duration = 30
    },
}

-- ===================== 辅助函数（不依赖 HandleAuraByName） =====================
local function HasUnleashedPotential()
    if PlayerClass ~= "WARLOCK" then return false end
    local numTabs = GetNumTalentTabs()
    for t = 1, numTabs do
        local numTalents = GetNumTalents(t)
        for i = 1, numTalents do
            local name, iconTexture, tier, column, rank, maxRank = GetTalentInfo(t, i)
            if (name == "Unleashed Potential" or name == "释放潜能" or name == "释放潜力") and rank > 0 then
                return true
            end
        end
    end
    return false
end

local function IsDemonologySpecialization()
    if PlayerClass ~= "WARLOCK" then return false end
    local numTabs = GetNumTalentTabs()
    local maxPoints = 0
    local demonologyTab = -1
    local demonologyPoints = 0
    
    for t = 1, numTabs do
        local tabName, tabTexture, tabPointsSpent = GetTalentTabInfo(t)
        if tabName == "Demonology" or tabName == "恶魔学识" or tabName == "恶魔" then
            demonologyTab = t
            demonologyPoints = tabPointsSpent
        end
        maxPoints = math.max(maxPoints, tabPointsSpent)
    end
    
    return demonologyTab ~= -1 and demonologyPoints >= maxPoints
end

local function GetAuraStacks(message)
    if not message then return  nil end
    local stackStart, stackStop, stack= string.find(message, L["AURASTACK_TOKEN"])
    if stack then return tonumber(stack) end
    return nil
end

local function IsAuraActived(message)
    for spellName, _ in pairs(BUFFTOOLTABLE) do
        if string.find(message, L["ARUAGET_TOKEN"]..spellName) then
            return spellName, true 
        end
    end
    return nil, false
end

-- ===================== 框架初始化 =====================
local function InitializeFrames()
    for spellName, auraInfo in pairs(BUFFTOOLTABLE) do
        if not auraFrames[spellName] then
            -- 创建容器
            local frame = CreateFrame("Frame", nil, UIParent)
            frame:SetWidth(auraInfo.width)
            frame:SetHeight(auraInfo.height)

            -- 设置位置：优先使用保存的位置
            if BuffToolConfig.positions[spellName] then
                local pos = BuffToolConfig.positions[spellName]
                -- 确保所有字段都存在且坐标是数字
                local point = pos.point or "BOTTOMLEFT"
                local relativePoint = pos.relativePoint or "BOTTOMLEFT"
                local x = type(pos.x) == "number" and pos.x or 0
                local y = type(pos.y) == "number" and pos.y or 0
                frame:SetPoint(point, UIParent, relativePoint, x, y)
            else
                -- 临时锚定到BuffTool以计算绝对坐标
                frame:SetPoint(auraInfo.Pos, BuffTool, auraInfo.Pos, auraInfo.x, auraInfo.y)
                frame:Show()
                local left, bottom = frame:GetLeft(), frame:GetBottom()
                if left and bottom then
                    frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", left, bottom)
                    BuffToolConfig.positions[spellName] = { point = "BOTTOMLEFT", relativePoint = "BOTTOMLEFT", x = left, y = bottom }
                else
                    -- 保底：直接使用相对BuffTool的锚点（虽然不推荐，但可用）
                    frame:SetPoint(auraInfo.Pos, BuffTool, auraInfo.Pos, auraInfo.x, auraInfo.y)
                end
                frame:Hide()
            end

            -- 纹理
            local texture = frame:CreateTexture(nil, "ARTWORK")
            texture:SetAllPoints(frame)
            texture:SetAlpha(auraInfo.alpha)
            texture:SetBlendMode(auraInfo.Blend)
            texture:SetVertexColor(auraInfo.Color[1], auraInfo.Color[2], auraInfo.Color[3])

            -- 计时器文字
            local timerText = frame:CreateFontString(nil, "OVERLAY", "SubZoneTextFont")
            timerText:SetPoint("CENTER", frame, "CENTER")
            timerText:Hide()

            auraFrames[spellName] = {
                frame = frame,
                texture = texture,
                timerText = timerText,
                info = auraInfo,
            }

            -- 初始化启用状态
            if BuffToolConfig.enabled[spellName] == nil then
                BuffToolConfig.enabled[spellName] = true  -- 默认启用
            end
        end
    end
end

-- ===================== 显示计时器（修复版：释放潜能结束时直接处理） =====================
local function ShowTimer(spellName, duration, timerText)
    local frame = auraFrames[spellName].frame
    if auraTimers[spellName] then
        auraTimers[spellName]:SetScript('OnUpdate', nil)
        auraTimers[spellName] = nil
    end
    local timer = CreateFrame('FRAME')
    timer.start = GetTime()
    timer.duration = duration
    timer.sec = 0
    timer:SetScript('OnUpdate', function()
        if GetTime() >= (this.start + this.sec) then
            this.sec = this.sec + 1
            if this.sec <= duration then
                timerText:SetText(this.duration - this.sec)
                return
            end
            timerText:Hide()
            frame:Hide()

            -- 释放潜能：直接处理层数归零，避免调用 HandleAuraByName
            if spellName == L["Unleashed Potential"] then
                currentUPStacks = 0
                funnelActive = false
                funnelTickElapsed = 0
                if isDebug then DebugLog("释放潜能计时结束，层数清零") end
            end

            auraTimers[spellName] = nil
            this:SetScript('OnUpdate', nil)
            if isDebug then DebugLog(spellName .. ' timer ended') end
        end
    end)
    timerText:SetText(duration)
    timerText:Show()
    auraTimers[spellName] = timer
end

-- ===================== 释放潜能强制刷新 =====================
local function ForceRefreshUP()
    if currentUPStacks <= 0 then return end
    local auraData = auraFrames[L["Unleashed Potential"]]
    if not auraData then return end
    
    -- 停止旧计时器
    if auraTimers[L["Unleashed Potential"]] then
        auraTimers[L["Unleashed Potential"]]:SetScript('OnUpdate', nil)
        auraTimers[L["Unleashed Potential"]] = nil
    end
    
    -- 重新开始计时器
    ShowTimer(L["Unleashed Potential"], 20, auraData.timerText)
    if isDebug then DebugLog("强制重置释放潜能计时器，当前层数：" .. currentUPStacks) end
end

-- ===================== 检测生命通道（强化版） =====================
local function CheckFunnel()
    if PlayerClass ~= "WARLOCK" or not UnitExists("pet") or UnitIsDead("pet") or currentUPStacks == 0 then
        funnelActive = false
        funnelTickElapsed = 0
        return
    end

    local funnelFound = false
    local funnelIDs = {11695,11694,11693,3700,3699,3698,755,45911,45910} -- 所有可能的生命通道ID
    for i = 1, 32 do
        local _,_,idFunnel = UnitBuff("pet", i)
        if idFunnel then
            for _, id in ipairs(funnelIDs) do
                if idFunnel == id then
                    funnelFound = true
                    if isDebug then DebugLog("检测到生命通道，ID="..idFunnel) end
                    break
                end
            end
        end
        if funnelFound then break end
    end

    if funnelFound then
        funnelActive = true
        -- 刷新释放潜能计时器（频率控制）
        local now = GetTime()
        if now - lastFunnelTime >= 1 then
            lastFunnelTime = now
            ForceRefreshUP()
            if isDebug then DebugLog("生命通道触发强制刷新") end
        end
    else
        funnelActive = false
        funnelTickElapsed = 0
    end
end

-- ===================== 核心显示函数 =====================
local function HandleAuraByName(spellName, isActive, updateOnlyTimer, stack)
    local auraData = auraFrames[spellName]
    if not auraData then return end
    local frame = auraData.frame
    local texture = auraData.texture
    local timerText = auraData.timerText
    local auraInfo = auraData.info

    -- 未启用的特效在正常模式下不显示
    if isActive and not BuffToolConfig.enabled[spellName] and not unlockMode then
        return
    end

    -- 释放潜能层数记录
    if spellName == L["Unleashed Potential"] then
        if stack then
            currentUPStacks = tonumber(stack) or currentUPStacks
            if currentUPStacks > 3 then currentUPStacks = 3 end
        end
        if not isActive then
            currentUPStacks = 0
            funnelActive = false
            funnelTickElapsed = 0
        end
    end

    if not updateOnlyTimer then
        if auraInfo.stack and stack then
            local textureIndex = math.min(stack, table.getn(auraInfo.texture))
            texture:SetTexture(auraInfo.texture[textureIndex])
        else
            texture:SetTexture(auraInfo.texture[1])
        end
    end

    if isActive then
        if not updateOnlyTimer then
            frame:Show()
        end
        if timerText and auraInfo.duration and auraInfo.canRefresh then
            ShowTimer(spellName, auraInfo.duration, timerText)
        end
        if isDebug then DebugLog(spellName .. ' is active') end
    else
        if not updateOnlyTimer then
            frame:Hide()
        end
        if timerText then
            timerText:Hide()
        end
        if isDebug then DebugLog(spellName .. ' is over') end
    end
end

-- ===================== 依赖 HandleAuraByName 的辅助函数 =====================
local function RefreshTimeBySpell(CombatText)
    for spellName, auraName in pairs(REFRESH_BUFF_BY_SPELL) do
        if string.find(CombatText, spellName) then
            if not (string.find(CombatText, L["resisted"])) then
                HandleAuraByName(auraName, true, true)
            end
        end
    end
end

-- 修复：使用 ipairs 遍历数组
local function RefreshBuffByHit(CombatText, CheckTable)
    for HitToken, auraNames in pairs(CheckTable) do
        if HitToken then
            if string.find(CombatText, HitToken) then
                if isDebug then DebugLog(HitToken.." " .. CombatText) end
                for _, auraName in ipairs(auraNames) do
                    if isDebug then DebugLog(auraName.." getted") end
                    HandleAuraByName(auraName, true, true)
                end
            end
        end
    end
end

local function HandleSelfDestroyAura(spellName, delay)
    if not spellName or not delay then return end
    if ArcaneSurgeTimer then
        ArcaneSurgeTimer:SetScript('OnUpdate', nil)
        ArcaneSurgeTimer = nil
    end
    HandleAuraByName(spellName,true,false)
    
    local timer = CreateFrame('FRAME')
    timer.start = GetTime()
    ArcaneSurgeTimer = timer
    timer:SetScript('OnUpdate', function()
        if GetTime() >= (this.start + delay) then
            HandleAuraByName(spellName, false, false)
            this:SetScript('OnUpdate', nil)
        end
    end)
end

local function RefreshUPTimer()
    if currentUPStacks <= 0 or not hasUnleashedPotential or not isDemonologySpec then
        if isDebug then DebugLog("RefreshUPTimer 条件不满足，currentUPStacks=" .. currentUPStacks) end
        return
    end
    HandleAuraByName(L["Unleashed Potential"], true, false, currentUPStacks)
    if isDebug then DebugLog("RefreshUPTimer 调用了 HandleAuraByName") end
end

-- ===================== 其他功能函数 =====================
local function HideAllTextures()
    for spellName, auraData in pairs(auraFrames) do
        auraData.frame:Hide()
        if auraData.timerText then auraData.timerText:Hide() end
        if auraTimers[spellName] then
            auraTimers[spellName]:SetScript('OnUpdate', nil)
            auraTimers[spellName] = nil
        end
    end
    currentUPStacks = 0
    funnelActive = false
    funnelTickElapsed = 0
    if isDebug then DebugLog("All textures hidden") end
end

local function DebugAllBuffTexture()
    InitializeFrames()
    for spellName, auraData in pairs(auraFrames) do
        auraData.frame:Show()
        auraData.texture:SetTexture(auraData.info.texture[1])
        auraData.timerText:Hide()
        -- 不启用移动，仅显示
    end
end

local function EnterUnlockMode()
    if unlockMode then return end
    unlockMode = true
    InitializeFrames()
    for spellName, auraData in pairs(auraFrames) do
        -- 只显示已启用的特效
        if BuffToolConfig.enabled[spellName] then
            local frame = auraData.frame
            frame:Show()
            auraData.texture:SetTexture(auraData.info.texture[1])
            auraData.timerText:Hide()
            -- 添加拖动功能
            frame:SetMovable(true)
            frame:EnableMouse(true)
            frame:RegisterForDrag("LeftButton")
            frame:SetScript("OnDragStart", function() this:StartMoving() end)
            frame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
            -- 添加边框提示
            frame:SetBackdrop({edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16})
            frame:SetBackdropColor(0,0,0,0)
            frame:SetBackdropBorderColor(1,1,0,0.8)
        end
    end
    DEFAULT_CHAT_FRAME:AddMessage("BuffTool 移动模式开启，仅显示已启用的特效。拖动后使用 /bufftool lock 保存位置。")
end

local function ExitUnlockMode()
    if not unlockMode then return end
    unlockMode = false
    for spellName, auraData in pairs(auraFrames) do
        local frame = auraData.frame
        -- 移除拖动和边框
        frame:SetMovable(false)
        frame:EnableMouse(false)
        frame:SetScript("OnDragStart", nil)
        frame:SetScript("OnDragStop", nil)
        frame:SetBackdrop(nil)
        
        -- 仅当帧可见时更新其位置（用户实际拖动了它）
        if frame:IsShown() then
            local left, bottom = frame:GetLeft(), frame:GetBottom()
            if left and bottom then
                BuffToolConfig.positions[spellName] = { point = "BOTTOMLEFT", relativePoint = "BOTTOMLEFT", x = left, y = bottom }
            end
            -- 若获取不到坐标，则不更新（保留原有配置）
        end
        
        -- 隐藏所有帧
        frame:Hide()
    end
    DEFAULT_CHAT_FRAME:AddMessage("BuffTool 移动模式关闭，已启用特效的位置已保存，未启用的特效位置保持不变。")
end

-- ===================== 配置窗口 =====================
local ConfigFrame = nil
local function CreateConfigWindow()
    if ConfigFrame then
        ConfigFrame:Show()
        return
    end

    -- 主框架
    local frame = CreateFrame("Frame", "BuffToolConfigFrame", UIParent)
    frame:SetWidth(350)
    frame:SetHeight(450)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function() this:StartMoving() end)
    frame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)

    -- 标题
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", 0, -5)
    title:SetText("BuffTool 配置")

    -- 关闭按钮
    local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -5, -5)

    -- ========== 使用原生滚动条（必须指定名称） ==========
    local scrollFrame = CreateFrame("ScrollFrame", "BuffToolConfigScrollFrame", frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 17, -30)      -- 左边距从 10 → 17
    scrollFrame:SetPoint("BOTTOMRIGHT", -37, 60) -- 右边距从 -30 → -37
    scrollFrame:SetFrameStrata("DIALOG")  -- 确保滚动条层级正确

    -- 内容容器
    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetWidth(280)

    -- 计算内容高度
    local numEntries = 0
    for _ in pairs(BUFFTOOLTABLE) do
        numEntries = numEntries + 1
    end
    local contentHeight = numEntries * 30 + 10
    content:SetHeight(contentHeight)

    scrollFrame:SetScrollChild(content)
    scrollFrame:UpdateScrollChildRect()  -- 强制更新滚动区域

    -- ========== 生成复选框 ==========
    local yOffset = 0
    for spellName, _ in pairs(BUFFTOOLTABLE) do
        -- 复选框
        local cb = CreateFrame("CheckButton", nil, content)
        cb:SetWidth(24)
        cb:SetHeight(24)
        cb:SetPoint("TOPLEFT", 10, -yOffset)

        cb:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
        cb:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
        cb:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
        cb:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

        -- 标签
        local label = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        label:SetPoint("LEFT", cb, "RIGHT", 5, 0)
        label:SetText(spellName)

        -- 状态与点击
        cb:SetChecked(BuffToolConfig.enabled[spellName])
        cb.spellName = spellName
        cb:SetScript("OnClick", function()
            BuffToolConfig.enabled[this.spellName] = this:GetChecked() == 1
        end)

        yOffset = yOffset + 30
    end

    -- 应用按钮
    local applyBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    applyBtn:SetPoint("BOTTOMLEFT", 15, 15)
    applyBtn:SetWidth(80)
    applyBtn:SetHeight(25)
    applyBtn:SetText("应用")
    applyBtn:SetScript("OnClick", function() this:GetParent():Hide() end)

    -- 移动模式按钮
    local moveBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    moveBtn:SetPoint("BOTTOMRIGHT", -15, 15)
    moveBtn:SetWidth(120)
    moveBtn:SetHeight(25)
    moveBtn:SetText("进入移动模式")
    moveBtn:SetScript("OnClick", function()
        this:GetParent():Hide()
        EnterUnlockMode()
    end)

    ConfigFrame = frame
end

-- ===================== 性能优化：生命通道 ID 哈希集合 =====================
local funnelIDs = {11695,11694,11693,3700,3699,3698,755,45911,45910}
local funnelIDSet = {}
for _, id in ipairs(funnelIDs) do
    funnelIDSet[id] = true
end

-- 上次检测时间
local lastFunnelCheck = 0
local CHECK_INTERVAL = 0.2 -- 秒

BuffTool:SetScript("OnUpdate", function()
    if unlockMode then return end
    local now = GetTime()

    -- 只在术士、有释放潜能天赋、是恶魔天赋且当前有层数时处理
    if PlayerClass == "WARLOCK" and hasUnleashedPotential and isDemonologySpec and currentUPStacks > 0 then
        -- 限制检测频率
        if now - lastFunnelCheck < CHECK_INTERVAL then return end
        lastFunnelCheck = now

        -- 检测宠物是否有生命通道
        local funnelNow = false
        if UnitExists("pet") and not UnitIsDead("pet") then
            -- 只扫描前16个槽位（通常足够）
            for i = 1, 16 do
                local _, _, idFunnel = UnitBuff("pet", i)
                if idFunnel and funnelIDSet[idFunnel] then
                    funnelNow = true
                    break
                end
            end
        end

        if funnelNow then
            -- 如果距离上次刷新超过1秒，强制重置计时器
            if now - lastFunnelTime >= 1 then
                lastFunnelTime = now
                ForceRefreshUP()
                if isDebug then DebugLog("生命通道触发强制刷新") end
            end
        end
    end
end)

-- ===================== 事件处理 =====================
BuffTool:SetScript('OnEvent', function()
    -- 移动模式下忽略所有事件显示
    if unlockMode then return end

    -- 初始化/天赋更新
    if event == "PLAYER_ENTERING_WORLD" then
        -- 延迟检查天赋，确保信息加载完成
        C_Timer.After(0.5, function()
            hasUnleashedPotential = HasUnleashedPotential()
            isDemonologySpec = IsDemonologySpecialization()
            InitializeFrames()   -- 确保框架存在
            
            -- 扫描玩家身上已有的“释放潜能”Buff
            if PlayerClass == "WARLOCK" then
                local upName = L["Unleashed Potential"]
                for i = 1, 32 do
                    local name, _, _, _, _, _, _, _, _, _, stack = UnitBuff("player", i)
                    if name and (name == upName or name == "释放潜能" or name == "释放潜力") then
                        currentUPStacks = tonumber(stack) or 1
                        if currentUPStacks > 3 then currentUPStacks = 3 end
                        HandleAuraByName(upName, true, false, currentUPStacks)
                        break
                    end
                end
            end
        end)
        return
    end

    if event == "PLAYER_TALENT_UPDATE" or event == "CHARACTER_POINTS_CHANGED" then
        hasUnleashedPotential = HasUnleashedPotential()
        isDemonologySpec = IsDemonologySpecialization()
        InitializeFrames()
        return
    end

    if event == 'PLAYER_DEAD' then
        HideAllTextures()
    end

    if event == "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS" then
        if arg1 then
            local auraName, _ = IsAuraActived(arg1)
            local stack = GetAuraStacks(arg1)
            if auraName then
                if stack and isDebug then DebugLog("buffTool : " .. auraName .. " ".. stack) end
                HandleAuraByName(auraName, true, false, stack)
            end
            
            -- 检测宠物的释放潜能增益
            if PlayerClass == "WARLOCK" then
                local patterns = {
                    "(.+)%s%((.+)%) gains Unleashed Potential %((%d)%)",
                    "(.+)%s%((.+)%) gains 释放潜能 %((%d)%)",
                    "(.+)%s%((.+)%) gains 释放潜力 %((%d)%)",
                    "(.+)%((.+)%) gains 释放潜能 %((%d)%)",
                    "(.+)%((.+)%) gains 释放潜力 %((%d)%)",
                    "(.+)%((.+)%)获得了释放潜能的效果（(%d)）",
                    "(.+)%((.+)%)获得了释放潜力的效果（(%d)）",
                    "(.+)%s%((.+)%)获得了释放潜能的效果（(%d)）",
                    "(.+)%s%((.+)%)获得了释放潜力的效果（(%d)）",
                }
                
                for _, pattern in ipairs(patterns) do
                    local s, e, demonName, warlockName, stacks = string.find(arg1, pattern)
                    if s and warlockName == playerName and stacks then
                        currentUPStacks = tonumber(stacks) or currentUPStacks
                        if currentUPStacks > 3 then currentUPStacks = 3 end
                        HandleAuraByName(L["Unleashed Potential"], true, false, currentUPStacks)
                        break
                    end
                end
            end
        end
    end

    if event == 'UNIT_PET' and PlayerClass == "WARLOCK" then
        if not UnitExists("pet") or UnitIsDead("pet") then
            HandleAuraByName(L["Unleashed Potential"], false, false)
            currentUPStacks = 0
            funnelActive = false
            funnelTickElapsed = 0
        else
            CheckFunnel()
        end
    end

    if event == "UNIT_AURA" and arg1 == "pet" and PlayerClass == "WARLOCK" then
        CheckFunnel()
    end

    if event =='CHAT_MSG_COMBAT_SELF_HITS' then
        if arg1 then
            if isDebug then  DEFAULT_CHAT_FRAME:AddMessage(arg1) end
            RefreshBuffByHit(arg1, REFRESH_BUFF_BY_HIT)
        end
    end

    if event == 'BIND_ENCHANT' then
        if isDebug then DebugLog("buffTool : " .. arg1) end
        if arg1 then
            if isDebug then  DEFAULT_CHAT_FRAME:AddMessage(arg1) end
        end
    end

    if event == 'CHAT_MSG_SPELL_SELF_BUFF' then
        if arg1 then
            if isDebug then
                DebugLog("self_buff: "..arg1)
            end
        end
    end

    if event=='CHAT_MSG_SPELL_SELF_DAMAGE' then
        if arg1 then
            if isDebug then  DEFAULT_CHAT_FRAME:AddMessage(arg1) end
            RefreshTimeBySpell(arg1)
            RefreshBuffByHit(arg1, REFRESH_BUFF_BY_SPELL_CRIT)

            if(PlayerClass == "MAGE") then
                if string.find(arg1, L["resisted"]) then
                    HandleSelfDestroyAura(L["Arcane Surge"], 4)
                end
                if string.find(arg1, L["Surge_Casted_Token"]) then
                    HandleAuraByName(L["Arcane Surge"], false, false)
                end
            end
            
            -- 释放潜能：直接法术命中刷新（包括暴击，排除抵抗和物理攻击）
            if PlayerClass == "WARLOCK" and hasUnleashedPotential and isDemonologySpec and currentUPStacks > 0 then
                local isHit = string.find(arg1, " hits ") or string.find(arg1, "击中")
                local isCrit = string.find(arg1, " crits ") or string.find(arg1, "致命一击") or string.find(arg1, "暴击")
                local isResisted = string.find(arg1, L["resisted"])
                local isShoot = string.find(arg1, "Shoot") or string.find(arg1, "射击")
                
                -- 如果是命中（包括暴击）且未被抵抗且不是远程物理攻击，则刷新
                if (isHit or isCrit) and not isResisted and not isShoot then
                    RefreshUPTimer()
                end
            end
        end
    end

    if event == 'COMBAT_TEXT_UPDATE' then
        if BUFFTOOLTABLE[arg2] then
            if arg1 == 'AURA_END' then
                if isDebug then DEFAULT_CHAT_FRAME:AddMessage("buffTool : " .. arg2 .. " is over") end
                HandleAuraByName(arg2, false, false)
            end
        end
    end
end)

-- ===================== 命令处理 =====================
SLASH_BUFFTOOL1 = '/bufftool'
SlashCmdList['BUFFTOOL'] = function(msg)
    if msg == 'debug' then
        isDebug = not isDebug
        DEFAULT_CHAT_FRAME:AddMessage('isDebug set to ' .. tostring(isDebug))
    elseif msg == 'debugtexture' then
        -- 原调试功能：显示所有纹理（不带动画）
        if isDebugTexture == nil then isDebugTexture = false end
        isDebugTexture = not isDebugTexture
        DEFAULT_CHAT_FRAME:AddMessage('isDebugTexture set to ' .. tostring(isDebugTexture))
        if isDebugTexture then
            DebugAllBuffTexture()
        else
            HideAllTextures()
        end
    elseif msg == 'config' then
        CreateConfigWindow()
    elseif msg == 'unlock' then
        EnterUnlockMode()
    elseif msg == 'lock' then
        ExitUnlockMode()
    else
        DEFAULT_CHAT_FRAME:AddMessage('Usage: /bufftool [debug|debugtexture|config|unlock|lock]')
    end
end