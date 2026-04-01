local _G, _ = _G or getfenv()

-- 待办: 坦克模式消息 - 当GUID为目标时发送，用于坦克模式高亮
-- 待办: 为每个发送者保存TWT_SPEC，以便从其他人的观察中缓存

local __lower = string.lower
local __repeat = string.rep
local __strlen = string.len
local __find = string.find
local __substr = string.sub
local __parseint = tonumber
local __parsestring = tostring
local __getn = table.getn
local __tinsert = table.insert
local __tsort = table.sort
local __pairs = pairs
local __floor = math.floor
local __abs = abs
local __char = string.char

local function clearTable(t)
    for k in __pairs(t) do
        t[k] = nil
    end
    return t
end

local TWT = CreateFrame("Frame")
_G.TWT = TWT

local has_superwow = SUPERWOW_VERSION or SetAutoloot

TWT.addonVer = GetAddOnMetadata('TWThreat', 'Version')

TWT.threatApi = 'TWTv4=';
TWT.tankModeApi = 'TMTv1=';
TWT.UDTS = 'TWT_UDTSv4';

TWT.showedUpdateNotification = false
TWT.addonName = '|cffabd473TWT|cff11cc11 |cffcdfe00Sunelegy版'

TWT.prefix = 'TWT'
TWT.channel = 'RAID'

TWT.name = UnitName('player')
local _, cl = UnitClass('player')
TWT.class = __lower(cl)

TWT.lastAggroWarningSoundTime = 0
TWT.lastAggroWarningGlowTime = 0

TWT.AGRO = '-Pull Aggro at-'
TWT.threatsFrames = {}
TWT.barCache = {}
TWT.cachedSort = nil
TWT.lastAppliedFont = nil

TWT.threats = {}

TWT.targetName = ''
TWT.relayTo = {}
TWT.shouldRelay = false
TWT.inCombat = false
TWT.healerMasterTarget = ''

TWT.updateSpeed = 0.5

TWT.targetFrameVisible = false
TWT.PFUItargetFrameVisible = false

TWT.nameLimit = 30
TWT.windowStartWidth = 300
TWT.windowWidth = 300
TWT.minBars = 5
TWT.maxBars = 11

TWT.roles = {}
TWT.spec = {}
TWT.units = {}

TWT.tankModeThreats = {}

TWT.custom = {
    ['预言者斯克拉姆'] = 0
}

TWT.withAddon = 0
TWT.addonStatus = {}

TWT.classColors = {
    ["warrior"] = { r = 0.78, g = 0.61, b = 0.43, c = "|cffc79c6e" },
    ["mage"] = { r = 0.41, g = 0.8, b = 0.94, c = "|cff69ccf0" },
    ["rogue"] = { r = 1, g = 0.96, b = 0.41, c = "|cfffff569" },
    ["druid"] = { r = 1, g = 0.49, b = 0.04, c = "|cffff7d0a" },
    ["hunter"] = { r = 0.67, g = 0.83, b = 0.45, c = "|cffabd473" },
    ["shaman"] = { r = 0.14, g = 0.35, b = 1.0, c = "|cff0070de" },
    ["priest"] = { r = 1, g = 1, b = 1, c = "|cffffffff" },
    ["warlock"] = { r = 0.58, g = 0.51, b = 0.79, c = "|cff9482c9" },
    ["paladin"] = { r = 0.96, g = 0.55, b = 0.73, c = "|cfff58cba" },
    ["agro"] = { r = 0.96, g = 0.1, b = 0.1, c = "|cffff1111" }
}

TWT.classCoords = {
    ["priest"] = { 0.52, 0.73, 0.27, 0.48 },
    ["mage"] = { 0.23, 0.48, 0.02, 0.23 },
    ["warlock"] = { 0.77, 0.98, 0.27, 0.48 },
    ["rogue"] = { 0.48, 0.73, 0.02, 0.23 },
    ["druid"] = { 0.77, 0.98, 0.02, 0.23 },
    ["hunter"] = { 0.02, 0.23, 0.27, 0.48 },
    ["shaman"] = { 0.27, 0.48, 0.27, 0.48 },
    ["warrior"] = { 0.02, 0.23, 0.02, 0.23 },
    ["paladin"] = { 0.02, 0.23, 0.52, 0.73 },
}

TWT.fonts = {
    '吉祥宋', '简中楷', '粗圆',
    '朱雀仿宋', '正道体', '明锐体',
	'进步体', '手写楷体',
    '像素字体', '小新粗黑体', '圆体',
}


local function twtprint(a)
    if a == nil then
        DEFAULT_CHAT_FRAME:AddMessage('[TWT]|cff0070de:' .. GetTime() .. '|cffffffff 尝试打印一个nil值。')
        return false
    end
    DEFAULT_CHAT_FRAME:AddMessage(TWT.classColors[TWT.class].c .. "[TWT] |cffffffff" .. a)
end

local function twtdebug(a)
    local time = GetTime() + 0.0001
    if not TWT_CONFIG.debug then
        return false
    end
    if a == nil then
        twtprint('|cff0070de[TWT调试:' .. time .. ']|cffffffff 尝试打印一个nil值。')
        return
    end
    if type(a) == 'boolean' then
        if a then
            twtprint('|cff0070de[TWT调试:' .. time .. ']|cffffffff[真]')
        else
            twtprint('|cff0070de[TWT调试:' .. time .. ']|cffffffff[假]')
        end
        return true
    end
    twtprint('|cff0070de[调试:' .. time .. ']|cffffffff[' .. a .. ']')
end

SLASH_TWT1 = "/twt"
SlashCmdList["TWT"] = function(cmd)
    if cmd then
        if __substr(cmd, 1, 4) == 'show' then
            _G['TWTMain']:Show()
            TWT_CONFIG.visible = true
            return true
        end
        if __substr(cmd, 1, 4) == 'hide' then
            _G['TWTMain']:Hide()
            TWT_CONFIG.visible = false
            return true
        end
        if __substr(cmd, 1, 6) == 'toggle' then
            if TWT_CONFIG.visible then
                _G['TWTMain']:Hide()
                TWT_CONFIG.visible = false
            else
                _G['TWTMain']:Show()
                TWT_CONFIG.visible = true
            end
            return true
        end
        if __substr(cmd, 1, 8) == 'tankmode' then
            if TWT_CONFIG.tankMode then
                twtprint('坦克模式已启用。')
                return false
            else
                TWT_CONFIG.tankMode = true
                twtprint('坦克模式已开启。')
            end
            return true
        end
        if __substr(cmd, 1, 6) == 'skeram' then
            if TWT_CONFIG.skeram then
                TWT_CONFIG.skeram = false
                twtprint('斯克拉姆模块已禁用。')
                return true
            end
            TWT_CONFIG.skeram = true
            twtprint('斯克拉姆模块已启用。')
            return true
        end
        if __substr(cmd, 1, 5) == 'debug' then
            if TWT_CONFIG.debug then
                TWT_CONFIG.debug = false
                _G['pps']:Hide()
                twtprint('调试模式已关闭')
                return true
            end
            TWT_CONFIG.debug = true
            _G['pps']:Show()
            twtdebug('调试模式已开启')
            return true
        end

        if __substr(cmd, 1, 3) == 'who' then
            TWT.queryWho()
            return true
        end

        twtprint(TWT.addonName .. ' |cffabd473v' .. TWT.addonVer .. '|cffffffff 可用命令：')
        twtprint('/twt show - 显示主窗口（也可使用 /twtshow）')
        twtprint('/twt hide - 隐藏主窗口')
        twtprint('/twt toggle - 切换显示/隐藏主窗口')
    end
end

SLASH_TWTSHOW1 = "/twtshow"
SlashCmdList["TWTSHOW"] = function(cmd)
    if cmd then
        _G['TWTMain']:Show()
        TWT_CONFIG.visible = true
    end
end

SLASH_TWTDEBUG1 = "/twtdebug"
SlashCmdList["TWTDEBUG"] = function(cmd)
    if cmd then
        if TWT_CONFIG.debug then
            TWT_CONFIG.debug = false
            twtprint('调试模式已关闭')
            return true
        end
        TWT_CONFIG.debug = true
        twtdebug('调试模式已开启')
        return true
    end
end

TWT:RegisterEvent("ADDON_LOADED")
TWT:RegisterEvent("PLAYER_LOGIN")
TWT:RegisterEvent("CHAT_MSG_ADDON")
TWT:RegisterEvent("PLAYER_REGEN_DISABLED")
TWT:RegisterEvent("PLAYER_REGEN_ENABLED")
TWT:RegisterEvent("PLAYER_TARGET_CHANGED")
TWT:RegisterEvent("PLAYER_ENTERING_WORLD")
TWT:RegisterEvent("PARTY_MEMBERS_CHANGED")
if has_superwow then
    TWT:RegisterEvent("UNIT_MODEL_CHANGED")
end

TWT.threatQuery = CreateFrame("Frame")
TWT.threatQuery:Show()

local timeStart = GetTime()
local totalPackets = 0
local totalData = 0
local uiUpdates = 0

TWT:SetScript("OnEvent", function()
    if event then
        if event == 'UNIT_MODEL_CHANGED' then
            -- 是怪物吗？
            if __substr(arg1,3,3) ~= "F" then return end
            -- 服务器只发送ID的低低部分，我们用它来获取完整ID
            local low_id = tonumber(__substr(arg1,-4),16)
            if not low_id then return end
            for low,whole in pairs(TWT.units) do
                if not UnitExists(whole) then
                    TWT.units[low] = nil
                end
            end
            TWT.units[low_id] = arg1
            return
        end
        if event == 'ADDON_LOADED' and arg1 == 'TWThreat' then
            return TWT.init()
        end
        if event == "PLAYER_LOGIN" then
            _G['TWTMain']:ClearAllPoints()
            _G['TWTMain']:SetPoint(unpack(TWT_CONFIG.windowPoint))
            return
        end
        if event == "PARTY_MEMBERS_CHANGED" then
            return TWT.getClasses()
        end
        if event == "PLAYER_ENTERING_WORLD" then
            TWT.sendMyVersion()
            TWT.combatEnd()
            if UnitAffectingCombat('player') then
                TWT.combatStart(true)
            end
            return true
        end
        
        if event == 'CHAT_MSG_ADDON' and __find(arg2, TWT.threatApi, 1, true) then
            totalPackets = totalPackets + 1
            totalData = totalData + __strlen(arg2)

            local threatData = arg2
            if __find(threatData, '#') and __find(threatData, TWT.tankModeApi) then
                local packetEx = __explode(threatData, '#', __scratch_packet)
                if packetEx[1] and packetEx[2] then
                    threatData = packetEx[1]
                    TWT.handleTankModePacket(packetEx[2])
                end
            end

            return TWT.handleThreatPacket(threatData)
        end

        if event == 'CHAT_MSG_ADDON' and arg1 == TWT.prefix then
            if __substr(arg2, 1, 11) == 'TWTVersion:' and arg4 ~= TWT.name then
                if not TWT.showedUpdateNotification then
                    local verEx = __explode(arg2, ':')
                    if TWT.version(verEx[2]) > TWT.version(TWT.addonVer) then
                        twtprint('发现新版本 ' ..
                                TWT.classColors[TWT.class].c .. 'v' .. verEx[2] .. ' |cffffffff(当前版本' ..
                                TWT.classColors['paladin'].c .. 'v' .. TWT.addonVer .. '|cffffffff)')
                        twtprint('更新请访问' .. TWT.classColors[TWT.class].c .. 'KOOK：100000')
                        TWT.showedUpdateNotification = true
                    end
                end
                return true
            end

            if __substr(arg2, 1, 7) == 'TWT_WHO' then
                TWT.send('TWT_ME:' .. TWT.addonVer)
                return true
            end

            if __substr(arg2, 1, 15) == 'TWTRoleTexture:' then
                local tex = __explode(arg2, ':')[2] or ''
                TWT.roles[arg4] = tex
                return true
            end

            if __substr(arg2, 1, 7) == 'TWT_ME:' then

                if TWT.addonStatus[arg4] then

                    local msg = __explode(arg2, ':')[2]
                    local verColor = ""
                    if TWT.version(msg) == TWT.version(TWT.addonVer) then
                        verColor = TWT.classColors['hunter'].c
                    end
                    if TWT.version(msg) < TWT.version(TWT.addonVer) then
                        verColor = '|cffff1111'
                    end
                    if TWT.version(msg) + 1 == TWT.version(TWT.addonVer) then
                        verColor = '|cffff8810'
                    end

                    TWT.addonStatus[arg4]['v'] = '    ' .. verColor .. msg
                    TWT.withAddon = TWT.withAddon + 1

                    TWT.updateWithAddon()

                    return true
                end

                return false
            end

            return false

        end
        if event == "PLAYER_REGEN_DISABLED" then
            return TWT.combatStart(true)
        end
        if event == "PLAYER_REGEN_ENABLED" then
            return TWT.combatEnd()
        end
        if event == "PLAYER_TARGET_CHANGED" then

            if not TWT.targetChanged() then
                TWT.queue_hide = GetTime() * 1000
            end

            return true

        end
    end
end)

function QueryWho_OnClick()
    TWT.queryWho()
end

function TWT.queryWho()
    TWT.withAddon = 0
    TWT.addonStatus = {}
    for i = 0, GetNumRaidMembers() do
        if GetRaidRosterInfo(i) then
            local n, _, _, _, _, _, z = GetRaidRosterInfo(i);
            local _, class = UnitClass('raid' .. i)

            TWT.addonStatus[n] = {
                ['class'] = __lower(class),
                ['v'] = '|cff888888   -   '
            }
            if z == '离线' then
                TWT.addonStatus[n]['v'] = '|cffff0000离线'
            end
        end
    end
    twtprint('正在发送在线查询...')
    _G['TWTWithAddonList']:Show()
    TWT.send('TWT_WHO')
end

function TWT.updateWithAddon()

    local rosterList = ''
    local i = 0
    for n, data in next, TWT.addonStatus do
        i = i + 1
        rosterList = rosterList .. TWT.classColors[data['class']].c .. n .. __repeat(' ', 12 - __strlen(n)) .. ' ' .. data['v'] .. ' |cff888888'
        if i < 4 then
            rosterList = rosterList .. '| '
        end
        if i == 4 then
            rosterList = rosterList .. '\n'
            i = 0
        end
    end
    _G['TWTWithAddonListText']:SetText(rosterList)
    _G['TWTWithAddonListTitle']:SetText('插件团队状态 ' .. TWT.withAddon .. '/' .. GetNumRaidMembers())
end

TWT.glowFader = CreateFrame('Frame')
TWT.glowFader:Hide()

TWT.glowFader:SetScript("OnShow", function()
    this.startTime = GetTime() - 1
    this.dir = 10
    _G['TWTFullScreenGlow']:SetAlpha(0.01)
    _G['TWTFullScreenGlow']:Show()
end)
TWT.glowFader:SetScript("OnHide", function()
    this.startTime = GetTime()
end)
TWT.glowFader:SetScript("OnUpdate", function()
    local plus = 0.04
    local gt = GetTime() * 1000
    local st = (this.startTime + plus) * 1000
    if gt >= st then
        this.startTime = GetTime()

        if _G['TWTFullScreenGlow']:GetAlpha() >= 0.6 then
            this.dir = -1
        end

        _G['TWTFullScreenGlow']:SetAlpha(_G['TWTFullScreenGlow']:GetAlpha() + 0.03 * this.dir)

        if _G['TWTFullScreenGlow']:GetAlpha() <= 0 then
            TWT.glowFader:Hide()
        end


    end
end)

function TWT.init()

    local mainLevel = 50
    _G['TWTMain']:SetFrameLevel(mainLevel)
    local children = { _G['TWTMain']:GetChildren() }
    for _, child in __pairs(children) do
        child:SetFrameLevel(mainLevel + 1)
    end

    if not TWT_CONFIG then
        TWT_CONFIG = {
            visible = true,
            colTPS = true,
            colThreat = true,
            colPerc = true,
            labelRow = true,
            units = {}
        }
    end

    TWT_CONFIG.windowPoint = TWT_CONFIG.windowPoint or {"CENTER", "UIParent", "BOTTOMLEFT", unpack({UIParent:GetCenter()})}
    TWT_CONFIG.windowScale = TWT_CONFIG.windowScale or 1
    TWT_CONFIG.glow = TWT_CONFIG.glow or false
    TWT_CONFIG.perc = TWT_CONFIG.perc or false
    TWT_CONFIG.glowPFUI = TWT_CONFIG.glowPFUI or false
    TWT_CONFIG.percPFUI = TWT_CONFIG.percPFUI or false
    TWT_CONFIG.percPFUItop = TWT_CONFIG.percPFUItop or false
    TWT_CONFIG.percPFUIbottom = TWT_CONFIG.percPFUIbottom or false
    TWT_CONFIG.showInCombat = TWT_CONFIG.showInCombat or false
    TWT_CONFIG.hideOOC = TWT_CONFIG.hideOOC or false
    TWT_CONFIG.font = TWT_CONFIG.font or '圆体'
    TWT_CONFIG.barHeight = TWT_CONFIG.barHeight or 20
    TWT_CONFIG.visibleBars = TWT_CONFIG.visibleBars or TWT.minBars
    TWT_CONFIG.fullScreenGlow = TWT_CONFIG.fullScreenGlow or false
    TWT_CONFIG.aggroSound = TWT_CONFIG.aggroSound or false
    TWT_CONFIG.aggroThreshold = TWT_CONFIG.aggroThreshold or 85
    TWT_CONFIG.tankMode = TWT_CONFIG.tankMode or false
    TWT_CONFIG.tankModeStick = TWT_CONFIG.tankModeStick or '自由' -- 上, 右, 左, 右, 自由
    TWT_CONFIG.lock = TWT_CONFIG.lock or false
    TWT_CONFIG.visible = TWT_CONFIG.visible or false
    TWT_CONFIG.colTPS = TWT_CONFIG.colTPS or false
    TWT_CONFIG.colThreat = TWT_CONFIG.colThreat or false
    TWT_CONFIG.colPerc = TWT_CONFIG.colPerc or false
    TWT_CONFIG.labelRow = TWT_CONFIG.labelRow or false
    TWT_CONFIG.skeram = TWT_CONFIG.skeram or false

    TWT_CONFIG.combatAlpha = TWT_CONFIG.combatAlpha or 1
    TWT_CONFIG.oocAlpha = TWT_CONFIG.oocAlpha or 1

    -- if TWT.class ~= 'paladin' and TWT.class ~= 'warrior' and TWT.class ~= 'druid' then
    --     _G['TWTMainSettingsTankMode']:Disable()
    --     TWT_CONFIG.tankMode = false
    -- end

    TWT_CONFIG.debug = TWT_CONFIG.debug or false
    TWT_CONFIG.units = TWT_CONFIG.units or {}
    TWT.units = TWT_CONFIG.units

    if TWT_CONFIG.visible then
        _G['TWTMain']:Show()
    else
        _G['TWTMain']:Hide()
    end

    if TWT_CONFIG.tankMode then
        _G['TWTMainSettingsFullScreenGlow']:SetChecked(TWT_CONFIG.fullScreenGlow)
        _G['TWTMainSettingsFullScreenGlow']:Disable()
        _G['TWTMainSettingsAggroSound']:SetChecked(TWT_CONFIG.fullScreenGlow)
        _G['TWTMainSettingsAggroSound']:Disable()
    end

    if TWT_CONFIG.lock then
        _G['TWTMainLockButton']:SetNormalTexture('Interface\\addons\\TWThreat\\images\\icon_locked')
    else
        _G['TWTMainLockButton']:SetNormalTexture('Interface\\addons\\TWThreat\\images\\icon_unlocked')
    end

    _G['TWTFullScreenGlowTexture']:SetWidth(GetScreenWidth())
    _G['TWTFullScreenGlowTexture']:SetHeight(GetScreenHeight())

    _G['TWTMain']:SetHeight(TWT_CONFIG.barHeight * TWT_CONFIG.visibleBars + (TWT_CONFIG.labelRow and 40 or 20))

    _G['TWTMainSettingsFrameHeightSlider']:SetValue(TWT_CONFIG.barHeight) -- 调用 FrameHeightSlider_OnValueChanged()
    _G['TWTMainSettingsWindowScaleSlider']:SetValue(TWT_CONFIG.windowScale) -- 调用 FrameHeightSlider_OnValueChanged()

    _G['TWTMainSettingsCombatAlphaSlider']:SetValue(TWT_CONFIG.combatAlpha) -- 调用 CombatOpacitySlider_OnValueChanged()
    _G['TWTMainSettingsOOCAlphaSlider']:SetValue(TWT_CONFIG.oocAlpha) -- 调用 OOCombatSlider_OnValueChanged()

    _G['TWTMainSettingsAggroThresholdSlider']:SetValue(TWT_CONFIG.aggroThreshold) -- 调用 AggroThresholdSlider_OnValueChanged()

    _G['TWTMainSettingsFontButton']:SetText(TWT_CONFIG.font)

    _G['TWTMainSettingsTargetFrameGlow']:SetChecked(TWT_CONFIG.glow)
    _G['TWTMainSettingsTargetFrameGlowPFUI']:SetChecked(TWT_CONFIG.glowPFUI)
    _G['TWTMainSettingsPercNumbers']:SetChecked(TWT_CONFIG.perc)
    _G['TWTMainSettingsPercNumbersPFUI']:SetChecked(TWT_CONFIG.percPFUI)
    _G['TWTMainSettingsPercNumbersPFUItop']:SetChecked(TWT_CONFIG.percPFUItop)
    _G['TWTMainSettingsPercNumbersPFUIbottom']:SetChecked(TWT_CONFIG.percPFUIbottom)
    _G['TWTMainSettingsShowInCombat']:SetChecked(TWT_CONFIG.showInCombat)
    _G['TWTMainSettingsHideOOC']:SetChecked(TWT_CONFIG.hideOOC)
    _G['TWTMainSettingsFullScreenGlow']:SetChecked(TWT_CONFIG.fullScreenGlow)
    _G['TWTMainSettingsAggroSound']:SetChecked(TWT_CONFIG.aggroSound)
    _G['TWTMainSettingsTankMode']:SetChecked(TWT_CONFIG.tankMode)

    _G['TWTMainSettingsColumnsTPS']:SetChecked(TWT_CONFIG.colTPS)
    _G['TWTMainSettingsColumnsThreat']:SetChecked(TWT_CONFIG.colThreat)
    _G['TWTMainSettingsColumnsPercent']:SetChecked(TWT_CONFIG.colPerc)

    _G['TWTMainSettingsLabelRow']:SetChecked(TWT_CONFIG.labelRow)

    TWT.setColumnLabels()

    if TWT_CONFIG.labelRow then
        _G['TWTMainBarsBG']:SetPoint('TOPLEFT', 1, -40)
        _G['TWTMainNameLabel']:Show()
    else
        _G['TWTMainBarsBG']:SetPoint('TOPLEFT', 1, -20)
        _G['TWTMainNameLabel']:Hide()
        _G['TWTMainTPSLabel']:Hide()
        _G['TWTMainThreatLabel']:Hide()
        _G['TWTMainPercLabel']:Hide()
    end

    _G['TWTMainSettingsFontButtonNT']:SetVertexColor(0.4, 0.4, 0.4)

    local color = TWT.classColors[TWT.class]

    _G['TWTMainTitleBG']:SetVertexColor(color.r, color.g, color.b)
    _G['TWTMainSettingsTitleBG']:SetVertexColor(color.r, color.g, color.b)
    _G['TWTMainTankModeWindowTitleBG']:SetVertexColor(color.r, color.g, color.b)

    _G['TWThreatDisplayTarget']:SetScale(UIParent:GetScale())

    -- 字体
    local fontFrames = {}

    for i, font in TWT.fonts do
        fontFrames[i] = CreateFrame('Button', 'Font_' .. font, _G['TWTMainSettingsFontList'], 'TWTFontFrameTemplate')

        fontFrames[i]:SetPoint("TOPLEFT", _G["TWTMainSettingsFontList"], "TOPLEFT", 0, 17 - i * 17)

        _G['Font_' .. font]:SetID(i)
        _G['Font_' .. font .. 'Name']:SetFont("Interface\\addons\\TWThreat\\fonts\\" .. font .. ".ttf", 15)
        _G['Font_' .. font .. 'Name']:SetText(font)
        _G['Font_' .. font .. 'HT']:SetVertexColor(1, 1, 1, 0.5)

        fontFrames[i]:Show()
    end

    --UnitPopupButtons["INSPECT_TALENTS"] = { text = '观察天赋', dist = 0 }
    --
    --TWT.addInspectMenu("PARTY")
    --TWT.addInspectMenu("PLAYER")
    --TWT.addInspectMenu("RAID")
    --
    --TWT.hooksecurefunc("UnitPopup_OnClick", function()
    --    local button = this.value
    --    if button == "INSPECT_TALENTS" then
    --
    --        _G['TWTTalentFrame']:Hide()
    --
    --        TWT_SPEC = {
    --            class = UnitClass('target'),
    --            {
    --                name = '武器',
    --                iconTexture = 'interface\\icons\\ability_warrior_cleave',
    --                pointsSpent = 27,
    --                numTalents = 18
    --            },
    --            {
    --                name = '狂怒',
    --                iconTexture = 'interface\\icons\\ability_warrior_cleave',
    --                pointsSpent = 24,
    --                numTalents = 17
    --            },
    --            {
    --                name = '防护',
    --                iconTexture = 'interface\\icons\\ability_warrior_cleave',
    --                pointsSpent = 0,
    --                numTalents = 17
    --            }
    --        }
    --
    --        TWT.send('TWTShowTalents:' .. UnitName('target'))
    --
    --    end
    --end)
    --
    --UIParentLoadAddOn("Blizzard_TalentUI")

    TWT.updateTitleBarText()
    TWT.updateSettingsTabs(1)

    TWT.checkTargetFrames()

    print("|cff00ffff仇恨统计 已加载")
--	twtprint(TWT.addonName .. ' |cffabd473v' .. TWT.addonVer .. '|cffffffff 已加载。')
    return true
end

function TWT.updateSettingsTabs(tab)
    local color = TWT.classColors[TWT.class]
    _G['TWTMainSettingsTabsUnderline']:SetVertexColor(color.r, color.g, color.b)

    for i = 1, 3 do
        _G['TWTMainSettingsTab' .. i]:Hide()
        _G['TWTMainSettingsTab' .. i .. 'ButtonNT']:SetVertexColor(color.r, color.g, color.b, 0.4)
        _G['TWTMainSettingsTab' .. i .. 'ButtonHT']:SetVertexColor(color.r, color.g, color.b, 0.4)
        _G['TWTMainSettingsTab' .. i .. 'ButtonPT']:SetVertexColor(color.r, color.g, color.b, 0.4)
        _G['TWTMainSettingsTab' .. i .. 'ButtonText']:SetTextColor(0.4, 0.4, 0.4)
    end

    _G['TWTMainSettingsTab' .. tab .. 'ButtonNT']:SetVertexColor(color.r, color.g, color.b, 1)
    _G['TWTMainSettingsTab' .. tab .. 'ButtonText']:SetTextColor(1, 1, 1)

    _G['TWTMainSettingsTab' .. tab]:Show()

end

function TWTSettingsTab_OnClick(tab)
    TWT.updateSettingsTabs(tab)
end

function TWTHealerMasterTarget_OnClick()

    TWT.getClasses()

    if not UnitExists('target') or not UnitIsPlayer('target')
            or UnitName('target') == TWT.name then

        if TWT.healerMasterTarget == '' then
            twtprint('请选择一个坦克作为目标。')
        else
            TWT.removeHealerMasterTarget()
        end

        return false
    end

    if UnitName('target') == TWT.healerMasterTarget then
        return TWT.removeHealerMasterTarget()
    end

    TWT.send('TWT_HMT:' .. UnitName('target'))

    local color = TWT.classColors[TWT.getClass(UnitName('target'))]

    twtprint('尝试将治疗主目标设置为 ' .. color.c .. UnitName('target'))

end

function TWT.removeHealerMasterTarget()
    TWT.send('TWT_HMT_REM:' .. TWT.healerMasterTarget)

    twtprint('治疗主目标已清除。')

    TWT.healerMasterTarget = ''
    TWT.targetName = ''

    clearTable(TWT.threats)
    TWT.cachedSort = nil

    _G['TWTMainSettingsHealerMasterTargetButton']:SetText('从目标设置')
    _G['TWTMainSettingsHealerMasterTargetButtonNT']:SetVertexColor(1, 1, 1, 1)

    TWT.updateUI('removeHealerMasterTarget')

    return true
end

function TWT.addInspectMenu(to)
    local found = 0
    for i, j in UnitPopupMenus[to] do
        if j == "TRADE" then
            found = i
        end
    end
    if found ~= 0 then
        UnitPopupMenus[to][__getn(UnitPopupMenus[to]) + 1] = UnitPopupMenus[to][__getn(UnitPopupMenus[to])]
        for i = __getn(UnitPopupMenus[to]) - 1, found, -1 do
            UnitPopupMenus[to][i] = UnitPopupMenus[to][i - 1]
        end
    end
    UnitPopupMenus[to][found] = "INSPECT_TALENTS"
end

TWT.classes = {}

function TWT.getClass(name)
    return TWT.classes[name] or 'priest'
end

function TWT.getClasses()
    if TWT.channel == 'RAID' then
        for i = 0, GetNumRaidMembers() do
            if GetRaidRosterInfo(i) then
                local name = GetRaidRosterInfo(i)
                local _, raidCls = UnitClass('raid' .. i)
                TWT.classes[name] = __lower(raidCls)
            end
        end
    end
    if TWT.channel == 'PARTY' then
        if GetNumPartyMembers() > 0 then
            for i = 1, GetNumPartyMembers() do
                if UnitName('party' .. i) and UnitClass('party' .. i) then
                    local name = UnitName('party' .. i)
                    local _, raidCls = UnitClass('party' .. i)
                    TWT.classes[name] = __lower(raidCls)
                end
            end
        end
    end
    twtdebug('职业信息已保存')
    return true
end

TWT.history = {}

TWT.tankName = ''

function TWT.handleThreatPacket(packet)

    --twtdebug(packet)

    local playersString = __substr(packet, __find(packet, TWT.threatApi) + __strlen(TWT.threatApi), __strlen(packet))

    clearTable(TWT.threats)
    TWT.tankName = ''

    local players = __explode(playersString, ';', __scratch_players)

    for _, tData in players do

        local msgEx = __explode(tData, ':', __scratch_msg)

        -- udts 处理
        if msgEx[1] and msgEx[2] and msgEx[3] and msgEx[4] and msgEx[5] then

            local player = msgEx[1]
            local tank = msgEx[2] == '1'
            local threat = __parseint(msgEx[3])
            local perc = __parseint(msgEx[4])
            local melee = msgEx[5] == '1'

            if UnitName('target') and not UnitIsPlayer('target') and TWT.shouldRelay then
                --转发
                for i, name in TWT.relayTo do
                    twtdebug('转发给 ' .. i .. ' ' .. name)
                end
                TWT.send('TWTRelayV1' ..
                        ':' .. UnitName('target') ..
                        ':' .. player ..
                        ':' .. msgEx[3] ..
                        ':' .. threat ..
                        ':' .. perc ..
                        ':' .. msgEx[6]);
            end

            local time = time()

            if TWT.history[player] then
                TWT.history[player][time] = threat
            else
                TWT.history[player] = {}
            end

            TWT.threats[player] = {
                threat = threat,
                tank = tank,
                perc = perc,
                melee = melee,
                tps = TWT.calcTPS(player),
                class = TWT.getClass(player)
            }

            if tank then
                TWT.tankName = player
            end
        end
    end

    if not TWT.threats[TWT.name] then
        TWT.threats[TWT.name] = {
                threat = 0,
                tank = 0,
                perc = 0,
                melee = 0,
                tps = 0,
                class = __lower(UnitClass('player'))
            }
    end
    
    TWT.calcAGROPerc()

    TWT.updateUI()

end

function TWT.handleTankModePacket(packet)

    --twtdebug(msg)

    local playersString = __substr(packet, __find(packet, TWT.tankModeApi) + __strlen(TWT.tankModeApi), __strlen(packet))

    clearTable(TWT.tankModeThreats)

    local players = __explode(playersString, ';', __scratch_players)

    for _, tData in players do

        local msgEx = __explode(tData, ':', __scratch_msg)

        if msgEx[1] and msgEx[2] and msgEx[3] and msgEx[4] then

            local creature = msgEx[1]
            local guid = msgEx[2] --保持字符串
            local name = msgEx[3]
            local perc = __parseint(msgEx[4])

            TWT.tankModeThreats[guid] = {
                creature = creature,
                name = name,
                perc = perc
            }

            --TWT.updateUI('handleTMServerMSG')

        end

    end

end

function TWT.calcAGROPerc()

    local tankThreat = 0
    for _, data in next, TWT.threats do
        if data.tank then
            tankThreat = data.threat
            break
        end
    end

    TWT.threats[TWT.AGRO] = {
        class = 'agro',
        threat = 0,
        perc = 100,
        tps = '',
        history = {},
        tank = false,
        melee = false
    }

    if not TWT.threats[TWT.name] then
        twtdebug('威胁列表中的名字有问题')
        return false
    end

    TWT.threats[TWT.AGRO].threat = tankThreat * (TWT.threats[TWT.name].melee and 1.1 or 1.3)
    if TWT.threats[TWT.AGRO].threat == 0 then
        TWT.threats[TWT.AGRO].threat = 1
    end
    TWT.threats[TWT.AGRO].perc = TWT.threats[TWT.name].melee and 110 or 130

end

function TWT.combatStart(startforced)
    if TWT.inCombat == true and startforced ~= true then
        return
    end
    TWT.inCombat = true
    TWT.updateTargetFrameThreatIndicators(-1, '')
    timeStart = GetTime()
    totalPackets = 0
    totalData = 0

    --twtdebug('战斗开始时清空威胁列表')
    --TWT.threats = TWT.wipe(TWT.threats)
    --TWT.tankModeThreats = TWT.wipe(TWT.tankModeThreats)
    TWT.hideThreatFrames(true)
    TWT.shouldRelay = TWT.checkRelay()

    if GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 then
        return false
    end

    if TWT_CONFIG.showInCombat then
        _G['TWTMain']:Show()
    end

    TWT.spec = {}
    for t = 1, GetNumTalentTabs() do
        TWT.spec[t] = {
            talents = 0,
            texture = ''
        }
        for i = 1, GetNumTalents(t) do
            local _, _, _, _, currRank = GetTalentInfo(t, i);
            TWT.spec[t].talents = TWT.spec[t].talents + currRank
        end
    end

    local specIndex = 1
    for i = 2, 4 do
        local name, texture = GetSpellTabInfo(i);
        if name and texture then
            TWT.spec[specIndex].name = name
            texture = __explode(texture, '\\')
            texture = texture[__getn(texture)]
            TWT.spec[specIndex].texture = texture
            specIndex = specIndex + 1
        end
    end

    local sendTex = TWT.spec[1].texture
    if TWT.spec[2].talents > TWT.spec[1].talents and TWT.spec[2].talents > TWT.spec[3].talents then
        sendTex = TWT.spec[2].texture
    end
    if TWT.spec[3].talents > TWT.spec[1].talents and TWT.spec[3].talents > TWT.spec[2].talents then
        sendTex = TWT.spec[3].texture
    end

    if TWT.class == 'warrior' and __lower(sendTex) == 'ability_rogue_eviscerate' then
        sendTex = 'ability_warrior_savageblow' --武器战
    end

    TWT.send('TWTRoleTexture:' .. sendTex)

    TWT.getClasses()

    TWT.updateUI('combatStart')

    TWT.threatQuery:Show()
    TWT.barAnimator:Show()

    TWTTankModeWindowChangeStick_OnClick()

    _G['TWTMain']:SetAlpha(TWT_CONFIG.combatAlpha)

    return true
end

function TWT.combatEnd()
    TWT.inCombat = false
    TWT.updateTargetFrameThreatIndicators(-1, '')

    twtdebug('时间 = ' .. (TWT.round(GetTime() - timeStart)) .. '秒 数据包 = ' .. totalPackets .. ' ' ..
            totalPackets / (GetTime() - timeStart) .. ' 数据包/秒')

    timeStart = GetTime()
    totalPackets = 0
    totalData = 0

    twtdebug('战斗结束时清空威胁列表')

    clearTable(TWT.threats)
    clearTable(TWT.tankModeThreats)
    clearTable(TWT.history)
    TWT.cachedSort = nil

    if TWT_CONFIG.hideOOC then
        _G['TWTMain']:Hide()
    end

    TWT.updateUI('combatEnd')

    TWT.barAnimator:Hide()

    if TWT_CONFIG.tankMode then
        _G['TWTMainTankModeWindow']:Hide()
    end

    _G['TWTWarning']:Hide()

    TWT.updateTitleBarText()

    _G['TWTMain']:SetAlpha(TWT_CONFIG.oocAlpha)

    TWT.hideThreatFrames(true)

    return true

end

function TWT.checkRelay()

    if GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 then
        return false
    end

    if __getn(TWT.relayTo) == 0 then
        return false
    end

    -- 在团队中
    if TWT.channel == 'RAID' and GetNumRaidMembers() > 0 then
        for index, name in TWT.relayTo do
            local found = false
            for i = 0, GetNumRaidMembers() do
                if GetRaidRosterInfo(i) and UnitName('raid' .. i) == name then
                    found = true
                end
            end
            if not found then
                TWT.relayTo[index] = nil
                twtdebug(name .. ' 已从转发列表中移除')
            end
        end
    end
    if TWT.channel == 'PARTY' and GetNumPartyMembers() > 0 then
        for index, name in TWT.relayTo do
            local found = false
            for i = 1, GetNumPartyMembers() do
                if UnitName('party' .. i) == name then
                    found = true
                end
            end
            if not found then
                TWT.relayTo[index] = nil
                twtdebug(name .. ' 已从转发列表中移除')
            end
        end
    end

    if __getn(TWT.relayTo) == 0 then
        return false
    end

    return true
end

function TWT.checkTargetFrames()
    if _G['TargetFrame']:IsVisible() ~= nil then
        TWT.targetFrameVisible = true
    else
        TWT.targetFrameVisible = false
    end

    if _G['pfTarget'] and _G['pfTarget']:IsVisible() ~= nil then
        TWT.PFUItargetFrameVisible = true
    else
        TWT.PFUItargetFrameVisible = false
    end
end

function TWT.hideThreatFrames(force)
    if next(TWT.threats) ~= nil or force then
        for name in next, TWT.threatsFrames do
            TWT.threatsFrames[name]:Hide()
        end
    end
end

function TWT.targetChanged()

    if not UnitAffectingCombat('player') and _G['TWTMainSettings']:IsVisible() == 1 then
        return true
    end

    TWT.checkTargetFrames()

    TWT.channel = (GetNumRaidMembers() > 0) and 'RAID' or 'PARTY'

    if UIParent:GetScale() ~= _G['TWThreatDisplayTarget']:GetScale() then
        _G['TWThreatDisplayTarget']:SetScale(UIParent:GetScale())
    end

    if TWT.healerMasterTarget ~= '' then
        return true
    end

    TWT.targetName = ''
    TWT.updateTargetFrameThreatIndicators(-1)

    -- 失去目标
    if not UnitExists('target') then
        return false
    end

    -- 目标已死亡，不显示任何内容
    if UnitIsDead('target') then
        return false
    end

    -- 不显示任何内容
    if UnitIsPlayer('target') then
        return false
    end

    -- 非重要目标
    if UnitClassification('target') ~= 'worldboss' and UnitClassification('target') ~= 'elite' then
        return false
    end

    -- 没有团队或小队
    if GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 then
        return false
    end

    -- 不在战斗中
    if not UnitAffectingCombat('target') then
        return false
    end

    -- twtdebug('目标改变时清空')
    -- TWT.threats = TWT.wipe(TWT.threats)
    -- TWT.history = TWT.wipe(TWT.history)

    if TWT_CONFIG.skeram then
        -- 斯克拉姆特殊处理
        --预言者斯克拉姆
        --_G['TWTWarning']:Hide()
        --if UnitAffectingCombat('player') then
        --    if UnitName('target') == '预言者斯克拉姆' and TWT.custom['预言者斯克拉姆'] ~= 0 then

        --            _G['TWTWarningText']:SetText("|cff00ff00- 真身 -");
        --            _G['TWTWarning']:Show()
        --        else
        --            _G['TWTWarningText']:SetText("- 分身 -");
        --            _G['TWTWarning']:Show()
        --        end
        --    end
        --end
    end

    TWT.targetName = TWT.unitNameForTitle(UnitName('target'))

    TWT.updateTitleBarText(TWT.targetName)

    return true
end

function TWT.send(msg)
    SendAddonMessage(TWT.prefix, msg, TWT.channel)
end

function TWT.UnitDetailedThreatSituation(limit)
    SendAddonMessage(TWT.UDTS .. (TWT_CONFIG.tankMode and '_TM' or ''), "limit=" .. limit, TWT.channel)
end

function TWT.updateUI(from)

    --twtdebug('从 [' .. (from or '') .. '] 调用更新UI')

    if TWT_CONFIG.debug then
        _G['pps']:SetText('流量: ' .. TWT.round((totalPackets / (GetTime() - timeStart)) * 10) / 10
                .. '包/秒 (' .. TWT.round(totalData / (GetTime() - timeStart)) .. ' 字符/秒)'
                .. TWT.round(uiUpdates / (GetTime() - timeStart)) .. ' 更新/秒 ')
        _G['pps']:Show()
    else
        _G['pps']:Hide()
    end

    uiUpdates = uiUpdates + 1

    if not TWT.barAnimator:IsVisible() then
        TWT.barAnimator:Show()
    end

    TWT.hideThreatFrames()

    if TWT.inCombat ~= true and not _G['TWTMainSettings']:IsVisible() then
        TWT.updateTargetFrameThreatIndicators(-1)
        return false
    end

    if TWT.targetName == '' then
        return false
    end

    if _G['TWTMainSettings']:IsVisible() and not UnitAffectingCombat('player') then
        TWT.tankName = '坦克'
    end

    local index = 0

    -- 每次更新排序一次，缓存供updateTargetFrameThreatIndicators重用
    TWT.sortThreats(TWT.threats)

    -- 检查字体是否自上次应用后更改
    local fontChanged = TWT.lastAppliedFont ~= TWT_CONFIG.font
    if fontChanged then
        TWT.lastAppliedFont = TWT_CONFIG.font
        TWT.lastFontPath = "Interface\\addons\\TWThreat\\fonts\\" .. TWT_CONFIG.font .. ".ttf"
    end

    for name, data in TWT.iterCachedSort(TWT.threats) do

        if data and TWT.threats[TWT.name] and index < TWT_CONFIG.visibleBars then

            index = index + 1
            local bc = TWT.barCache[index]
            local newBar = false
            if not TWT.threatsFrames[index] then
                newBar = true
                TWT.threatsFrames[index] = CreateFrame('Frame', 'TWThreat' .. index, _G["TWTMain"], 'TWThreat')
                local prefix = 'TWThreat' .. index
                bc = {
                    frame = _G[prefix],
                    nameFs = _G[prefix .. 'Name'],
                    tpsFs = _G[prefix .. 'TPS'],
                    threatFs = _G[prefix .. 'Threat'],
                    percFs = _G[prefix .. 'Perc'],
                    bg = _G[prefix .. 'BG'],
                    role = _G[prefix .. 'Role'],
                    agro = _G[prefix .. 'AGRO'],
                }
                TWT.barCache[index] = bc
            end
            if not bc then
                newBar = true
                local prefix = 'TWThreat' .. index
                bc = {
                    frame = _G[prefix],
                    nameFs = _G[prefix .. 'Name'],
                    tpsFs = _G[prefix .. 'TPS'],
                    threatFs = _G[prefix .. 'Threat'],
                    percFs = _G[prefix .. 'Perc'],
                    bg = _G[prefix .. 'BG'],
                    role = _G[prefix .. 'Role'],
                    agro = _G[prefix .. 'AGRO'],
                }
                TWT.barCache[index] = bc
            end

            bc.frame:SetAlpha(TWT_CONFIG.combatAlpha)
            bc.frame:SetWidth(TWT.windowWidth - 2)

            if fontChanged or newBar then
                bc.nameFs:SetFont(TWT.lastFontPath, 15, "OUTLINE")
                bc.tpsFs:SetFont(TWT.lastFontPath, 15, "OUTLINE")
                bc.threatFs:SetFont(TWT.lastFontPath, 15, "OUTLINE")
                bc.percFs:SetFont(TWT.lastFontPath, 15, "OUTLINE")
            end

            bc.frame:SetHeight(TWT_CONFIG.barHeight - 1)
            bc.bg:SetHeight(TWT_CONFIG.barHeight - 2)

            TWT.threatsFrames[index]:ClearAllPoints()
            TWT.threatsFrames[index]:SetPoint("TOPLEFT", _G["TWTMain"], "TOPLEFT", 0,
                    (TWT_CONFIG.labelRow and -40 or -20) +
                            TWT_CONFIG.barHeight - 1 - index * TWT_CONFIG.barHeight)


            -- 图标
            bc.agro:Hide()
            bc.role:Show()
            if name ~= TWT.AGRO then

                bc.role:SetWidth(TWT_CONFIG.barHeight - 2)
                bc.role:SetHeight(TWT_CONFIG.barHeight - 2)
                bc.nameFs:SetPoint('LEFT', bc.role, 'RIGHT', 1 + (TWT_CONFIG.barHeight / 15), -1)
                if TWT.roles[name] then
                    bc.role:SetTexture('Interface\\Icons\\' .. TWT.roles[name])
                    bc.role:SetTexCoord(0.08, 0.92, 0.08, 0.92)
                    bc.role:Show()
                else
                    bc.role:SetTexture('Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes')
                    bc.role:SetTexCoord(unpack(TWT.classCoords[data.class]))
                end

            else
                bc.agro:Show()
                bc.role:Hide()
            end


            -- tps
            bc.tpsFs:SetText(data.tps)

            -- 标签
            TWT.setBarLabels(bc.percFs, bc.threatFs, bc.tpsFs)

            -- 百分比
            bc.percFs:SetText(TWT.round(data.perc) .. '%')

            if TWT.name ~= TWT.tankName and name == TWT.AGRO then
                bc.percFs:SetText(100 - TWT.round(TWT.threats[TWT.name].perc) .. '%')
            end

            -- 名字
            bc.nameFs:SetText(TWT.classColors['priest'].c .. name)

            -- 条宽度和颜色
            local color = TWT.classColors[data.class]

            if name == TWT.name then

                if UnitName('target') ~= '预言者斯克拉姆' then
                    if name == __char(77) .. __lower(__char(79, 77, 79)) and data.perc >= 95 then
                        _G['TWTWarningText']:SetText("- 停止输出 " .. __char(77) .. __lower(__char(79, 77, 79)) .. " -");
                        _G['TWTWarning']:Show()
                    else
                        _G['TWTWarning']:Hide()
                    end
                end

                if TWT_CONFIG.aggroSound and data.perc >= TWT_CONFIG.aggroThreshold and time() - TWT.lastAggroWarningSoundTime > 5
                        and not TWT_CONFIG.fullScreenGlow then
                    PlaySoundFile('Interface\\addons\\TWThreat\\sounds\\warn.ogg')
                    TWT.lastAggroWarningSoundTime = time()
                end

                if TWT_CONFIG.fullScreenGlow and data.perc >= TWT_CONFIG.aggroThreshold and time() - TWT.lastAggroWarningGlowTime > 5 then
                    TWT.glowFader:Show()
                    TWT.lastAggroWarningGlowTime = time()
                    if TWT_CONFIG.aggroSound then
                        PlaySoundFile('Interface\\addons\\TWThreat\\sounds\\warn.ogg')
                    end
                end

                TWT.updateTitleBarText(TWT.targetName .. ' (' .. TWT.round(data.perc) .. '%)')

                bc.threatFs:SetText(TWT.formatNumber(data.threat))

                if data.perc == 0 then TWT.barAnimator:animateTo(index, empty) else TWT.barAnimator:animateTo(index, data.perc) end

            elseif name == TWT.AGRO then

                TWT.barAnimator:animateTo(index, nil)

                bc.bg:SetWidth(TWT.windowWidth - 2)
                bc.threatFs:SetText('+' .. TWT.formatNumber(data.threat - TWT.threats[TWT.name].threat))

                local colorLimit = 50

                if TWT.threats[TWT.name].perc >= 0 and TWT.threats[TWT.name].perc < colorLimit then
                    bc.bg:SetVertexColor(TWT.threats[TWT.name].perc / colorLimit, 1, 0, 0.9)
                elseif TWT.threats[TWT.name].perc >= colorLimit then
                    bc.bg:SetVertexColor(1, 1 - (TWT.threats[TWT.name].perc - colorLimit) / colorLimit, 0, 0.9)
                end

                if TWT.tankName == TWT.name then
                    bc.bg:SetVertexColor(1, 0, 0, 1)
                    bc.percFs:SetText('')
                end

            else

                TWT.barAnimator:animateTo(index, data.perc)

                bc.threatFs:SetText(TWT.formatNumber(data.threat))
                bc.bg:SetVertexColor(color.r, color.g, color.b, 0.9)
            end

            if data.tank then

                TWT.barAnimator:animateTo(index, 100, true)

            end

            if name == TWT.name then
                bc.bg:SetVertexColor(1, 0.2, 0.2, 1)
                TWT.updateTargetFrameThreatIndicators(data.perc)
            end

            TWT.threatsFrames[index]:Show()

        end

    end

    if TWT_CONFIG.tankMode then

        _G['TMEF1']:Hide()
        _G['TMEF2']:Hide()
        _G['TMEF3']:Hide()
        _G['TMEF4']:Hide()
        _G['TMEF5']:Hide()

        _G['TWTMainTankModeWindow']:SetHeight(0)

        local tmCount = 0
        for _ in next, TWT.tankModeThreats do tmCount = tmCount + 1 end
        if tmCount > 1 then

            local i = 0
            for guid, data in next, TWT.tankModeThreats do

                i = i + 1
                if i > 5 then
                    break
                end
                _G['TWTMainTankModeWindow']:SetHeight(i * 25 + 23)

                _G['TMEF' .. i .. 'Target']:SetText(data.creature)
                _G['TMEF' .. i .. 'Player']:SetText(TWT.classColors[TWT.getClass(data.name)].c .. data.name)
                _G['TMEF' .. i .. 'Perc']:SetText(TWT.round(data.perc) .. '%')
                _G['TMEF' .. i .. 'TargetButton']:SetID(guid)
                _G['TMEF' .. i]:SetPoint("TOPLEFT", _G["TWTMainTankModeWindow"], "TOPLEFT", 0, -21 + 24 - i * 25)

                _G['TMEF' .. i .. 'RaidTargetIcon']:Hide()

                if data.perc >= 0 and data.perc < 50 then
                    _G['TMEF' .. i .. 'BG']:SetVertexColor(data.perc / 50, 1, 0, 0.5)
                else
                    _G['TMEF' .. i .. 'BG']:SetVertexColor(1, 1 - (data.perc - 50) / 50, 0, 0.5)
                end

                _G['TMEF' .. i]:Show()

                _G['TWTMainTankModeWindow']:Show()

            end

        else
            _G['TWTMainTankModeWindow']:Hide()
        end
    else
        _G['TWTMainTankModeWindow']:Hide()
    end

end

TWT.barAnimator = CreateFrame('Frame')
TWT.barAnimator:Hide()
TWT.barAnimator.frames = {}

function TWT.barAnimator:animateTo(index, perc, instant)
  local frameName = "TWThreat"..index.."BG"
  local bar = _G[frameName]
  if not bar then return end

  if perc == nil then
    -- 停止动画此条
    self.frames[frameName] = nil
    return
  end

  -- 计算绝对目标宽度（像素）
  local maxW = TWT.windowWidth - 2
  local targetW = math.floor(maxW * math.min(perc,100) / 100 + 0.5)

  if instant then
    bar:SetWidth(targetW)
    self.frames[frameName] = nil
  else
    -- 存储新目标
    self.frames[frameName] = targetW
  end
end

TWT.barAnimator:SetScript("OnShow", function()
  this.frames = {}
end)

TWT.barAnimator:SetScript("OnUpdate", function()
  -- 平滑系数：条追逐目标的速度（越高=越快）
  local SMOOTHING = 6
  local elapsed = arg1

  for frameName, targetW in pairs(this.frames) do
    local bar = _G[frameName]
    if bar then
      local current = bar:GetWidth()
      local diff = targetW - current
      if diff ~= 0 then
        -- 移动剩余距离的一部分
        local step = diff * math.min(1, SMOOTHING * elapsed)
        bar:SetWidth(current + step)
      end
      -- 如果在1像素内，对齐并清除
      if math.abs(diff) < 1 then
        bar:SetWidth(targetW)
        this.frames[frameName] = nil
      end
    else
      this.frames[frameName] = nil
    end
  end
end)

TWT.threatQuery:SetScript("OnShow", function()
    this.startTime = GetTime()
end)
TWT.threatQuery:SetScript("OnHide", function()
end)
TWT.threatQuery:SetScript("OnUpdate", function()
    if not this.startTime then this.startTime = GetTime() end
    local plus = TWT.updateSpeed
    local gt = GetTime() * 1000
    local st = (this.startTime + plus) * 1000
    -- 检查目标切换是否足够长以实际执行
    if TWT.queue_hide and (gt >= TWT.queue_hide + 100) then
        if not TWT.targetChanged() then
            TWT.hideThreatFrames(true)
        end
        TWT.queue_hide = nil
    end
    -- 主要工作
    if gt >= st then
        this.startTime = GetTime()
        if GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 then
            return false
        end
        if UnitAffectingCombat('target') then
            TWT.combatStart()
            if TWT.targetName == '' then
                twtdebug('威胁查询目标 = 空白 ')
                -- 尝试重新获取目标
                TWT.targetChanged()
                return false
            end

            if TWT_CONFIG.glow or TWT_CONFIG.perc or
                    TWT_CONFIG.glowPFUI or TWT_CONFIG.percPFUI or
                    TWT_CONFIG.fullScreenGlow or TWT_CONFIG.tankmode or
                    TWT_CONFIG.visible then
                if TWT.healerMasterTarget == '' then
                    TWT.UnitDetailedThreatSituation(TWT_CONFIG.visibleBars - 1)
                end
            else
                twtdebug('不询问威胁情况')
            end

        end
    end
end)

function TWT.calcTPS(name)

    local data = TWT.history[name]

    if not data then
        return 0
    end

    local now = time()

    -- 修剪超过10秒的条目
    for t in next, data do
        if now - t > 10 then
            data[t] = nil
        end
    end

    local tps = 0
    local mean = 0

    for i = 0, 9 do
        local cur = data[now - i]
        local prev = data[now - i - 1]
        if cur and prev then
            tps = tps + cur - prev
            mean = mean + 1
        end
    end

    if mean > 0 and tps > 0 then
        return TWT.round(tps / mean)
    end

    return 0

end

function TWT.updateTargetFrameThreatIndicators(perc)

    if TWT_CONFIG.fullScreenGlow then
        _G['TWTFullScreenGlow']:Show()
    else
        _G['TWTFullScreenGlow']:Hide()
    end

    if perc == -1 then
        TWT.updateTitleBarText()
        _G['TWThreatDisplayTarget']:Hide()
        _G['TWThreatDisplayTargetPFUI']:Hide()

        --TWT.hideThreatFrames()

        return false
    end

    if not TWT_CONFIG.glow and not TWT_CONFIG.perc and not TWT.targetFrameVisible then
        _G['TWThreatDisplayTarget']:Hide()
    end

    if not TWT_CONFIG.glowPFUI and not TWT_CONFIG.percPFUI and not TWT.PFUItargetFrameVisible then
        _G['TWThreatDisplayTargetPFUI']:Hide()
    end

    if not TWT.targetFrameVisible and not TWT.PFUItargetFrameVisible then
        return false
    end

    if TWT.targetFrameVisible then
        _G['TWThreatDisplayTarget']:Show()
    end
    if TWT.PFUItargetFrameVisible then
        _G['TWThreatDisplayTargetPFUI']:Show()
    end

    perc = TWT.round(perc)

    if TWT_CONFIG.glow then

        local unitClassification = UnitClassification('target')
        if unitClassification == 'worldboss' then
            unitClassification = 'elite'
        end

        _G['TWThreatDisplayTargetGlow']:SetTexture('Interface\\addons\\TWThreat\\images\\' .. unitClassification)

        if perc >= 0 and perc < 50 then
            _G['TWThreatDisplayTargetGlow']:SetVertexColor(perc / 50, 1, 0, perc / 50)
        elseif perc >= 50 then
            _G['TWThreatDisplayTargetGlow']:SetVertexColor(1, 1 - (perc - 50) / 50, 0, 1)
        end

        _G['TWThreatDisplayTargetGlow']:Show()
    else
        _G['TWThreatDisplayTargetGlow']:Hide()
    end

    if TWT_CONFIG.glowPFUI and _G['pfTarget'] then

        if perc >= 0 and perc < 50 then
            _G['TWThreatDisplayTargetPFUIGlow']:SetVertexColor(perc / 50, 1, 0, perc / 50)
        elseif perc >= 50 then
            _G['TWThreatDisplayTargetPFUIGlow']:SetVertexColor(1, 1 - (perc - 50) / 50, 0, 1)
        end

        _G['TWThreatDisplayTargetPFUIGlow']:Show()
    else
        _G['TWThreatDisplayTargetPFUIGlow']:Hide()
    end

    if TWT_CONFIG.perc then

        if TWT_CONFIG.tankMode then
            _G['TWThreatDisplayTargetNumericBG']:SetPoint('TOPLEFT', 24, -7)
            _G['TWThreatDisplayTargetNumericBG']:SetWidth(79)
            _G['TWThreatDisplayTargetNumericBorder']:SetPoint('TOPLEFT', 20, -3)
            _G['TWThreatDisplayTargetNumericBorder']:SetWidth(128)
            _G['TWThreatDisplayTargetNumericBorder']:SetTexture('Interface\\addons\\TWThreat\\images\\numericthreatborder_wide')
            _G['TWThreatDisplayTargetNumericPerc']:SetPoint('TOPLEFT', -1, 3)
            _G['TWThreatDisplayTargetNumericPerc']:SetWidth(128)
        else
            _G['TWThreatDisplayTargetNumericBG']:SetPoint('TOPLEFT', 44, -7)
            _G['TWThreatDisplayTargetNumericBG']:SetWidth(36)
            _G['TWThreatDisplayTargetNumericBorder']:SetPoint('TOPLEFT', 38, -3)
            _G['TWThreatDisplayTargetNumericBorder']:SetWidth(64)
            _G['TWThreatDisplayTargetNumericBorder']:SetTexture('Interface\\addons\\TWThreat\\images\\numericthreatborder')
            _G['TWThreatDisplayTargetNumericPerc']:SetPoint('TOPLEFT', 31, 3)
            _G['TWThreatDisplayTargetNumericPerc']:SetWidth(64)
        end

        local tankModePerc = 0

        local thirdEntry = TWT.cachedSort and TWT.cachedSort[3]

        if TWT_CONFIG.tankMode and thirdEntry then
            local second = ''
            tankModePerc = TWT.round(thirdEntry.perc)
            second = TWT.unitNameForTitle(thirdEntry.name, 6) .. ' ' .. tankModePerc .. '%'
            if second ~= '' then
                _G['TWThreatDisplayTargetNumericPerc']:SetText(second)
            else
                _G['TWThreatDisplayTargetNumericPerc']:SetText(perc .. '%')
            end
        else
            _G['TWThreatDisplayTargetNumericPerc']:SetText(perc .. '%')
        end

        if tankModePerc ~= 0 then
            perc = tankModePerc
        end

        if perc >= 0 and perc < 50 then
            _G['TWThreatDisplayTargetNumericBG']:SetVertexColor(perc / 50, 1, 0, 1)
        elseif perc >= 50 then
            _G['TWThreatDisplayTargetNumericBG']:SetVertexColor(1, 1 - (perc - 50) / 50, 0, 1)
        end

        _G['TWThreatDisplayTargetNumericPerc']:Show()
        _G['TWThreatDisplayTargetNumericBG']:Show()
        _G['TWThreatDisplayTargetNumericBorder']:Show()
    else
        _G['TWThreatDisplayTargetNumericPerc']:Hide()
        _G['TWThreatDisplayTargetNumericBG']:Hide()
        _G['TWThreatDisplayTargetNumericBorder']:Hide()
    end

    if TWT_CONFIG.percPFUI and _G['pfTarget'] then

        local offset = 0
        if TWT_CONFIG.percPFUIbottom then
            offset = -_G['pfTarget']:GetHeight() - 32 / 2
        end

        if TWT_CONFIG.tankMode then
            _G['TWThreatDisplayTargetPFUINumericBG']:SetPoint('TOPLEFT', 0, 18 + offset)
            _G['TWThreatDisplayTargetPFUINumericBG']:SetWidth(76)
            _G['TWThreatDisplayTargetPFUINumericBorder']:SetPoint('TOPLEFT', -6, 19 + offset)
            _G['TWThreatDisplayTargetPFUINumericBorder']:SetTexture('Interface\\addons\\TWThreat\\images\\numericthreatborder_pfui_wide')
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetPoint('TOPLEFT', -26, 25 + offset)
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetWidth(128)
        else
            _G['TWThreatDisplayTargetPFUINumericBG']:SetPoint('TOPLEFT', 0, 18 + offset)
            _G['TWThreatDisplayTargetPFUINumericBG']:SetWidth(37)
            _G['TWThreatDisplayTargetPFUINumericBorder']:SetPoint('TOPLEFT', -6, 19 + offset)
            _G['TWThreatDisplayTargetPFUINumericBorder']:SetTexture('Interface\\addons\\TWThreat\\images\\numericthreatborder_pfui')
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetPoint('TOPLEFT', -12, 25 + offset)
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetWidth(64)
        end

        local tankModePerc = 0

        local thirdEntry = TWT.cachedSort and TWT.cachedSort[3]

        if TWT_CONFIG.tankMode and thirdEntry then
            local second = ''
            tankModePerc = TWT.round(thirdEntry.perc)
            second = TWT.unitNameForTitle(thirdEntry.name, 6) .. ' ' .. tankModePerc .. '%'
            if second ~= '' then
                _G['TWThreatDisplayTargetPFUINumericPerc']:SetText(second)
            else
                _G['TWThreatDisplayTargetPFUINumericPerc']:SetText(perc .. '%')
            end
        else
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetText(perc .. '%')
        end

        if tankModePerc ~= 0 then
            perc = tankModePerc
        end

        if perc >= 0 and perc < 50 then
            _G['TWThreatDisplayTargetPFUINumericBG']:SetVertexColor(perc / 50, 1, 0, 1)
        elseif perc >= 50 then
            _G['TWThreatDisplayTargetPFUINumericBG']:SetVertexColor(1, 1 - (perc - 50) / 50, 0, 1)
        end

        _G['TWThreatDisplayTargetPFUINumericPerc']:Show()
        _G['TWThreatDisplayTargetPFUINumericBG']:Show()
        _G['TWThreatDisplayTargetPFUINumericBorder']:Show()
    else
        _G['TWThreatDisplayTargetPFUINumericPerc']:Hide()
        _G['TWThreatDisplayTargetPFUINumericBG']:Hide()
        _G['TWThreatDisplayTargetPFUINumericBorder']:Hide()
    end

end

function TWTMainWindow_Resizing()
    _G['TWTMain']:SetAlpha(0.4)
end

function TWTMainMainWindow_Resized()
    _G['TWTMain']:SetAlpha(UnitAffectingCombat('player') and TWT_CONFIG.combatAlpha or TWT_CONFIG.oocAlpha)

    TWT_CONFIG.visibleBars = TWT.round((_G['TWTMain']:GetHeight() - (TWT_CONFIG.labelRow and 40 or 20)) / TWT_CONFIG.barHeight)
    TWT_CONFIG.visibleBars = TWT_CONFIG.visibleBars < 4 and 4 or TWT_CONFIG.visibleBars

    FrameHeightSlider_OnValueChanged()
end

function FrameHeightSlider_OnValueChanged()
    TWT_CONFIG.barHeight = _G['TWTMainSettingsFrameHeightSlider']:GetValue()

    _G['TWTMain']:SetHeight(TWT_CONFIG.barHeight * TWT_CONFIG.visibleBars + (TWT_CONFIG.labelRow and 40 or 20))

    TWT.setMinMaxResize()
    TWT.updateUI('FrameHeightSlider_OnValueChanged')
end

function WindowScaleSlider_OnValueChanged()
    TWT_CONFIG.windowScale = _G['TWTMainSettingsWindowScaleSlider']:GetValue()

    local x, y = _G['TWTMain']:GetLeft(), _G['TWTMain']:GetTop()
    local sx, sy = _G['TWTMainTankModeWindow']:GetLeft(), _G['TWTMainTankModeWindow']:GetTop()
    local s = _G['TWTMain']:GetEffectiveScale()
    local ss = _G['TWTMainTankModeWindow']:GetEffectiveScale()
    local posX, posY
    local sposX, sposY

    if x and y and s then
        x, y = x * s, y * s
        posX = x
        posY = y
    end
    if sx and sy and ss then
        sx, sy = sx * ss, sy * ss
        sposX = sx
        sposY = sy
    end

    _G['TWTMain']:SetScale(TWT_CONFIG.windowScale)
    _G['TWTMainTankModeWindow']:SetScale(TWT_CONFIG.windowScale)

    s = _G['TWTMain']:GetEffectiveScale()
    ss = _G['TWTMainTankModeWindow']:GetEffectiveScale()
    posX, posY = posX / s, posY / s
    sposX, sposY = sposX / ss, sposY / ss
    _G['TWTMain']:ClearAllPoints()
    _G['TWTMainTankModeWindow']:ClearAllPoints()
    _G['TWTMain']:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", posX, posY)
    _G['TWTMainTankModeWindow']:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", sposX, sposY)

    if TWT_CONFIG.tankModeStick ~= '自由' then
        TWTTankModeWindowChangeStick_OnClick(TWT_CONFIG.tankModeStick)
    end
end

function CombatOpacitySlider_OnValueChanged()
    TWT_CONFIG.combatAlpha = _G['TWTMainSettingsCombatAlphaSlider']:GetValue()
    _G['TWTMain']:SetAlpha(UnitAffectingCombat('player') and TWT_CONFIG.combatAlpha or TWT_CONFIG.oocAlpha)
end

function OOCombatSlider_OnValueChanged()
    TWT_CONFIG.oocAlpha = _G['TWTMainSettingsOOCAlphaSlider']:GetValue()
    _G['TWTMain']:SetAlpha(UnitAffectingCombat('player') and TWT_CONFIG.combatAlpha or TWT_CONFIG.oocAlpha)
end

function AggroThresholdSlider_OnValueChanged()
    TWT_CONFIG.aggroThreshold = _G['TWTMainSettingsAggroThresholdSlider']:GetValue()
end

function TWTChangeSetting_OnClick(checked, code)
    if code == 'lock' then
        checked = not TWT_CONFIG[code]
        if checked then
            _G['TWTMainLockButton']:SetNormalTexture('Interface\\addons\\TWThreat\\images\\icon_locked')
        else
            _G['TWTMainLockButton']:SetNormalTexture('Interface\\addons\\TWThreat\\images\\icon_unlocked')
        end
    end
    TWT_CONFIG[code] = checked
    if code == 'tankMode' then
        if checked then
            TWT.testBars(true)
            TWT_CONFIG.fullScreenGlow = false
            TWT_CONFIG.aggroSound = false
            _G['TWTMainSettingsFullScreenGlow']:SetChecked(TWT_CONFIG.fullScreenGlow)
            _G['TWTMainSettingsFullScreenGlow']:Disable()
            _G['TWTMainSettingsAggroSound']:SetChecked(TWT_CONFIG.fullScreenGlow)
            _G['TWTMainSettingsAggroSound']:Disable()

            _G['TWTMainTankModeWindowStickTopButton']:Show()
            _G['TWTMainTankModeWindowStickRightButton']:Show()
            _G['TWTMainTankModeWindowStickBottomButton']:Show()
            _G['TWTMainTankModeWindowStickLeftButton']:Show()

            _G['TWTMainTankModeWindow']:Show()
        else
            _G['TWTMainSettingsFullScreenGlow']:Enable()
            _G['TWTMainSettingsAggroSound']:Enable()
            _G['TWTMainTankModeWindow']:Hide()
        end
    end
    if code == 'aggroSound' and checked and not UnitAffectingCombat('player') then
        PlaySoundFile('Interface\\addons\\TWThreat\\sounds\\warn.ogg')
    end

    if code == 'fullScreenGlow' and checked and not UnitAffectingCombat('player') then
        TWT.glowFader:Show()
    end

    if code == 'percPFUItop' then
        TWT_CONFIG.percPFUIbottom = false
        _G['TWTMainSettingsPercNumbersPFUIbottom']:SetChecked(TWT_CONFIG.percPFUIbottom)
    end
    if code == 'percPFUIbottom' then
        TWT_CONFIG.percPFUItop = false
        _G['TWTMainSettingsPercNumbersPFUItop']:SetChecked(TWT_CONFIG.percPFUItop)
    end

    TWT.setColumnLabels()

    if TWT_CONFIG.labelRow then
        _G['TWTMainBarsBG']:SetPoint('TOPLEFT', 1, -40)
        _G['TWTMainNameLabel']:Show()
    else
        _G['TWTMainBarsBG']:SetPoint('TOPLEFT', 1, -20)
        _G['TWTMainNameLabel']:Hide()
        _G['TWTMainTPSLabel']:Hide()
        _G['TWTMainThreatLabel']:Hide()
        _G['TWTMainPercLabel']:Hide()
    end

    FrameHeightSlider_OnValueChanged()

    TWT.updateUI('TWTChangeSetting_OnClick')
end

function TWT.setColumnLabels()
    _G['TWTMain']:SetWidth(TWT.windowStartWidth - 70 - 70 - 70)

    TWT.nameLimit = 5

    if TWT_CONFIG.colPerc then
        _G['TWTMainPercLabel']:Show()
        _G['TWTMain']:SetWidth(_G['TWTMain']:GetWidth() + 70)
        TWT.nameLimit = TWT.nameLimit + 8
    else
        _G['TWTMainPercLabel']:Hide()
    end

    if TWT_CONFIG.colThreat then
        _G['TWTMain']:SetWidth(_G['TWTMain']:GetWidth() + 70)
        TWT.nameLimit = TWT.nameLimit + 8

        if TWT_CONFIG.colPerc then
            _G['TWTMainThreatLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10 - 70 - 5, -21)
        else
            _G['TWTMainThreatLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10, -21)
        end

        _G['TWTMainThreatLabel']:Show()
    else
        _G['TWTMainThreatLabel']:Hide()
    end

    if TWT_CONFIG.colTPS then
        _G['TWTMain']:SetWidth(_G['TWTMain']:GetWidth() + 70)
        TWT.nameLimit = TWT.nameLimit + 8

        if TWT_CONFIG.colThreat then
            if TWT_CONFIG.colPerc then
                _G['TWTMainTPSLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10 - 70 - 70, -21)
            else
                _G['TWTMainTPSLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10 - 70, -21)
            end
        elseif TWT_CONFIG.colPerc then
            _G['TWTMainTPSLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10 - 70, -21)
        else
            _G['TWTMainTPSLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], 'TOPRIGHT', -10, -21)
        end

        _G['TWTMainTPSLabel']:Show()
    else
        _G['TWTMainTPSLabel']:Hide()
    end

    if TWT.nameLimit < 14 then
        TWT.nameLimit = 14
    end

    if _G['TWTMain']:GetWidth() < 190 then
        _G['TWTMain']:SetWidth(190)
    end

    TWT.windowWidth = _G['TWTMain']:GetWidth()

    TWT.setMinMaxResize()
end

function TWT.setMinMaxResize()
    _G['TWTMain']:SetMinResize(TWT.windowWidth, TWT_CONFIG.barHeight * TWT.minBars + (TWT_CONFIG.labelRow and 40 or 20))
    _G['TWTMain']:SetMaxResize(TWT.windowWidth, TWT_CONFIG.barHeight * TWT.maxBars + (TWT_CONFIG.labelRow and 40 or 20))
end

function TWT.setBarLabels(perc, threat, tps)

    if TWT_CONFIG.colPerc then
        perc:Show()
    else
        perc:Hide()
    end

    if TWT_CONFIG.colThreat then

        if TWT_CONFIG.colPerc then
            threat:SetPoint('RIGHT', -10 - 70 + 4, 0)
        else
            threat:SetPoint('RIGHT', -10 + 4, 0)
        end

        threat:Show()
    else
        threat:Hide()
    end

    if TWT_CONFIG.colTPS then

        if TWT_CONFIG.colThreat then
            if TWT_CONFIG.colPerc then
                tps:SetPoint('RIGHT', -10 - 70 - 70 + 4, 0)
            else
                tps:SetPoint('RIGHT', -10 - 70 + 4, 0)
            end
        elseif TWT_CONFIG.colPerc then
            tps:SetPoint('RIGHT', -10 - 70 + 4, 0)
        else
            tps:SetPoint('RIGHT', -10 + 4, 0)
        end

        tps:Show()
    else
        tps:Hide()
    end

end

function TWT.testBars(show)

    if UnitAffectingCombat('player') then
        return false
    end

    if show then
        TWT.roles['坦克'] = 'ability_warrior_defensivestance'
        TWT.roles['太阳挽歌'] = 'spell_holy_auraoflight'
        TWT.roles[TWT.name] = 'ability_hunter_pet_turtle'
        TWT.roles['柏拉图式纠结'] = 'ability_racial_bearform'
        TWT.roles['Jimmy'] = 'ability_backstab'
        TWT.roles['Miranda'] = 'spell_shadow_shadowwordpain'
        TWT.roles['Karen'] = 'spell_holy_powerinfusion'
        TWT.roles['Felix'] = 'spell_fire_sealoffire'
        TWT.roles['Tom'] = 'spell_shadow_shadowbolt'
        TWT.roles['Bill'] = 'ability_marksmanship'
        TWT.threats = {
            [TWT.AGRO] = {
                class = 'agro', threat = 1100, perc = 110, tps = '',
                history = {}, melee = true, tank = false
            },
            ['坦克'] = {
                class = 'warrior', threat = 1000, perc = 100, tps = 100,
                history = {}, melee = true, tank = true },
            ['太阳挽歌'] = {
                class = 'paladin', threat = 990, perc = 99, tps = 99,
                history = {}, melee = true, tank = false },
            [TWT.name] = {
                class = TWT.class, threat = 750, perc = 75, tps = 75,
                history = {}, melee = false, tank = false
            },
            ['柏拉图式纠结'] = {
                class = 'druid', threat = 700, perc = 70, tps = 70,
                history = {}, melee = true, tank = false
            },
            ['Jimmy'] = {
                class = 'rogue', threat = 500, perc = 50, tps = 50,
                history = {}, melee = true, tank = false
            },
            ['Miranda'] = {
                class = 'priest', threat = 450, perc = 45, tps = 45,
                history = {}, melee = false, tank = false
            },
            ['Karen'] = {
                class = 'priest', threat = 400, perc = 40, tps = 40,
                history = {}, melee = true, tank = false
            },
            ['Felix'] = {
                class = 'mage', threat = 350, perc = 35, tps = 35,
                history = {}, melee = false, tank = false
            },
            ['Tom'] = {
                class = 'warlock', threat = 250, perc = 25, tps = 25,
                history = {}, melee = false, tank = false
            },
            ['Bill'] = {
                class = 'hunter', threat = 100, perc = 10, tps = 10,
                history = {}, melee = false, tank = false
            }
        }

        TWT.tankModeThreats = {
            [1] = {
                creature = '感染的食尸鬼',
                name = 'Bob',
                perc = 78
            },
            [2] = {
                creature = '毒液追踪者',
                name = 'Alice',
                perc = 95
            },
            [3] = {
                creature = '活体怪物',
                name = '太阳挽歌',
                perc = 52
            },
            [4] = {
                creature = '死亡骑士队长',
                name = '柏拉图式纠结',
                perc = 81
            },
            [5] = {
                creature = '帕奇维克——测试',
                name = 'Jimmy',
                perc = 12
            },
        }

        TWT.targetChanged()

        TWT.targetName = "帕奇维克——测试模式"

        TWT.updateUI('testBars')
    else
        TWT.combatEnd()
    end
end
function TWTCloseButton_OnClick()
    _G['TWTMain']:Hide()
    twtprint('TWT窗口已关闭。输入|cff69ccf0/twt show|cffffffff或者|cff69ccf0/twtshow|cffffffff可以重新显示该窗口。')
    TWT_CONFIG.visible = false
end

function TWTTankModeWindowCloseButton_OnClick()
    twtprint('坦克模式已关闭。输入|cff69ccf0/twt tankmode|cffffffff可以重新开启或者设置该模式。')
    TWTChangeSetting_OnClick(false, 'tankMode')
    _G['TWTMainSettingsTankMode']:SetChecked(false)
end

function TWTTankModeWindowChangeStick_OnClick(to)
    if to then
        TWT_CONFIG.tankModeStick = to
    end
    if TWT_CONFIG.tankModeStick == '顶部' then
        _G['TWTMainTankModeWindow']:ClearAllPoints()
        _G['TWTMainTankModeWindow']:SetPoint('BOTTOMLEFT', _G['TWTMain'], 'TOPLEFT', 0, 1)
    elseif TWT_CONFIG.tankModeStick == '右侧' then
        _G['TWTMainTankModeWindow']:ClearAllPoints()
        _G['TWTMainTankModeWindow']:SetPoint('TOPLEFT', _G['TWTMain'], 'TOPRIGHT', 1, 0)
    elseif TWT_CONFIG.tankModeStick == '底部' then
        _G['TWTMainTankModeWindow']:ClearAllPoints()
        _G['TWTMainTankModeWindow']:SetPoint('TOPLEFT', _G['TWTMain'], 'BOTTOMLEFT', 0, -1)
    elseif TWT_CONFIG.tankModeStick == '左侧' then
        _G['TWTMainTankModeWindow']:ClearAllPoints()
        _G['TWTMainTankModeWindow']:SetPoint('TOPRIGHT', _G['TWTMain'], 'TOPLEFT', -1, 0)
    end
end

function TWTSettingsToggle_OnClick()
    if _G['TWTMainSettings']:IsVisible() == 1 then
        _G['TWTMainSettings']:Hide()
        TWT.testBars(false)

        _G['TWTMainTankModeWindowStickTopButton']:Hide()
        _G['TWTMainTankModeWindowStickRightButton']:Hide()
        _G['TWTMainTankModeWindowStickBottomButton']:Hide()
        _G['TWTMainTankModeWindowStickLeftButton']:Hide()

    else
        _G['TWTMainSettings']:Show()

        if TWT_CONFIG.tankMode then
            TWTTankModeWindowChangeStick_OnClick()
            _G['TWTMainTankModeWindowStickTopButton']:Show()
            _G['TWTMainTankModeWindowStickRightButton']:Show()
            _G['TWTMainTankModeWindowStickBottomButton']:Show()
            _G['TWTMainTankModeWindowStickLeftButton']:Show()
        end

        TWT.testBars(true)
    end
end

function TWTFontButton_OnClick()
    if _G['TWTMainSettingsFontList']:IsVisible() then
        _G['TWTMainSettingsFontList']:Hide()
    else
        _G['TWTMainSettingsFontList']:Show()
    end
end

function TWTFontSelect(id)
    TWT_CONFIG.font = TWT.fonts[id]
    _G['TWTMainSettingsFontButton']:SetText(TWT_CONFIG.font)
    TWT.updateUI('TWTFontSelect')
end

function TWTTargetButton_OnClick(index)

    if TWT.tankModeThreats[__parsestring(index)] then
        local unit = TWT.units[index]
        if has_superwow and unit then
            TargetUnit(unit)
        else
            AssistByName(TWT.tankModeThreats[__parsestring(index)].name)
        end
        return true
    end

    twtprint('无法选中坦克模式目标。')

    return false
end

local __scratch_players = {}
local __scratch_msg = {}
local __scratch_packet = {}

function __explode(str, delimiter, reuse)
    local result = reuse or {}
    local n = 0
    local from = 1
    local delim_from, delim_to = __find(str, delimiter, from, 1, true)
    while delim_from do
        n = n + 1
        result[n] = __substr(str, from, delim_from - 1)
        from = delim_to + 1
        delim_from, delim_to = __find(str, delimiter, from, true)
    end
    n = n + 1
    result[n] = __substr(str, from)
    -- 清除重用表中的旧条目
    if reuse then
        local old = n + 1
        while result[old] do
            result[old] = nil
            old = old + 1
        end
    end
    return result
end

local __sort_cache = {}

function TWT.sortThreats(t)
    local n = 0
    for name, l in __pairs(t) do
        n = n + 1
        local entry = __sort_cache[n]
        if not entry then
            entry = {}
            __sort_cache[n] = entry
        end
        entry.threat = l.threat
        entry.perc = l.perc
        entry.tps = l.tps
        entry.name = name
    end
    -- 清除剩余条目
    for i = n + 1, __getn(__sort_cache) do
        __sort_cache[i] = nil
    end
    __tsort(__sort_cache, function(b, c)
        return b.perc > c.perc
    end)
    TWT.cachedSort = __sort_cache
    return __sort_cache
end

function TWT.iterCachedSort(t)
    local a = TWT.cachedSort or TWT.sortThreats(t)
    local i = 0
    return function()
        i = i + 1
        local entry = a[i]
        if entry == nil then return nil end
        return entry.name, t[entry.name]
    end
end

function TWT.ohShitHereWeSortAgain(t, reverse)
    local a = {}
    for n, l in __pairs(t) do
        __tinsert(a, { ['threat'] = l.threat, ['perc'] = l.perc, ['tps'] = l.tps, ['name'] = n })
    end
    if reverse then
        __tsort(a, function(b, c)
            return b['perc'] > c['perc']
        end)
    else
        __tsort(a, function(b, c)
            return b['perc'] < c['perc']
        end)
    end

    local i = 0 -- 迭代器变量
    local iter = function()
        -- 迭代器函数
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i]['name'], t[a[i]['name']]
        end
    end
    return iter
end

function TWT.formatNumber(n)

    if n < 0 then
        n = 0
    end

    if n < 999 then
        return TWT.round(n)
    end
    if n < 999999 then
        return TWT.round(n / 10) / 100 .. 'K' or 0
    end
    --1,000,000
    return TWT.round(n / 10000) / 100 .. 'M' or 0
end

function TWT.tableSize(t)
    local size = 0
    for _, _ in next, t do
        size = size + 1
    end
    return size
end

function TWT.targetFromName(name)
    if name == TWT.name then
        return 'target'
    end
    if TWT.channel == 'RAID' then
        for i = 0, GetNumRaidMembers() do
            if GetRaidRosterInfo(i) then
                local n = GetRaidRosterInfo(i)
                if n == name then
                    return 'raid' .. i
                end
            end
        end
    end
    if TWT.channel == 'PARTY' then
        if GetNumPartyMembers() > 0 then
            for i = 1, GetNumPartyMembers() do
                if UnitName('party' .. i) then
                    if name == UnitName('party' .. i) then
                        return 'party' .. i
                    end
                end
            end
        end
    end

    return 'target'
end

function TWT.unitNameForTitle(name, limit)
    limit = limit or TWT.nameLimit
    if __strlen(name) > limit then
        return __substr(name, 1, limit) .. ' '
    end
    return name
end

function TWT.targetRaidIcon(iconIndex)

    for i = 1, GetNumRaidMembers() do
        if TWT.targetRaidSymbolFromUnit("raid" .. i, iconIndex) then
            return true
        end
    end
    for i = 1, GetNumPartyMembers() do
        if TWT.targetRaidSymbolFromUnit("party" .. i, iconIndex) then
            return true
        end
    end
    if TWT.targetRaidSymbolFromUnit("player", iconIndex) then
        return true
    end
    return false
end

function TWT.updateTitleBarText(text)
    if not text then
        _G['TWTMainTitle']:SetText(TWT.addonName .. ' |cffabd473v' .. TWT.addonVer)
        return true
    end
    _G['TWTMainTitle']:SetText(text)
end


-- https://github.com/shagu/pfUI/blob/master/api/api.lua#L596
function TWT.wipe(src)
    -- 注意: table.insert, table.remove 在使用这种方式清空的表时会有未定义行为
    -- 因为Lua会在不确定的时间后移除表中的nil条目
    -- 不要使用table.insert(t,v)，而使用t[table.getn(t)+1]=v，因为table.getn会折叠nil条目
    -- 哈希表没有问题，t[k]=v其中k不是数字时行为正常
    local mt = getmetatable(src) or {}
    if mt.__mode == nil or mt.__mode ~= "kv" then
        mt.__mode = "kv"
        src = setmetatable(src, mt)
    end
    for k in __pairs(src) do
        src[k] = nil
    end
    return src
end

TWT.hooks = {}
--https://github.com/shagu/pfUI/blob/master/compat/vanilla.lua#L37
function TWT.hooksecurefunc(name, func, append)
    if not _G[name] then
        return
    end

    TWT.hooks[__parsestring(func)] = {}
    TWT.hooks[__parsestring(func)]["old"] = _G[name]
    TWT.hooks[__parsestring(func)]["new"] = func

    if append then
        TWT.hooks[__parsestring(func)]["function"] = function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
            TWT.hooks[__parsestring(func)]["old"](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
            TWT.hooks[__parsestring(func)]["new"](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
        end
    else
        TWT.hooks[__parsestring(func)]["function"] = function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
            TWT.hooks[__parsestring(func)]["new"](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
            TWT.hooks[__parsestring(func)]["old"](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
        end
    end

    _G[name] = TWT.hooks[__parsestring(func)]["function"]
end

function TWT.pairsByKeys(t, f)
    local a = {}
    for n in __pairs(t) do
        __tinsert(a, n)
    end
    __tsort(a, function(a, b)
        return a < b
    end)
    local i = 0 -- 迭代器变量
    local iter = function()
        -- 迭代器函数
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

function TWT.round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return __floor(num * mult + 0.5) / mult
end

function TWT.version(ver)
    local verEx = __explode(ver, '.')

    if verEx[3] then
        -- 新的3位版本号
        return __parseint(verEx[1]) * 100 +
                __parseint(verEx[2]) * 10 +
                __parseint(verEx[3]) * 1
    end

    -- 旧的版本号
    return __parseint(verEx[1]) * 10 +
            __parseint(verEx[2]) * 1

end

function TWT.sendMyVersion()
    SendAddonMessage(TWT.prefix, "TWTVersion:" .. TWT.addonVer, "PARTY")
    SendAddonMessage(TWT.prefix, "TWTVersion:" .. TWT.addonVer, "GUILD")
    SendAddonMessage(TWT.prefix, "TWTVersion:" .. TWT.addonVer, "RAID")
    SendAddonMessage(TWT.prefix, "TWTVersion:" .. TWT.addonVer, "BATTLEGROUND")
end