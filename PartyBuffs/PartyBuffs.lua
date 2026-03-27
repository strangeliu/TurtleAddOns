-- === 配置 ===
CT_NUM_PARTY_BUFFS = 14
CT_NUM_PARTY_DEBUFFS = 6
CT_NUM_PET_BUFFS = 9
CT_NUM_SHOWN_PARTY_BUFFS = 14
CT_NUM_SHOWN_PET_BUFFS = 9

CT_ShowPartyBuffs = 1
CT_ShowPetBuffs = 1
CT_ShowHealthPercentage = 1

CT_HealthTextSize = 10
CT_HealthTextColor = { r = 1, g = 1, b = 1 }

-- === 工具函数 ===
local function pb_msg(text)
    if DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[PartyBuffs]|r " .. (text or ""))
    end
end

local function parse_cmd(msg)
    msg = tostring(msg or "")
    local _, _, cmd, rest = string.find(msg, "^(%S+)%s*(.*)$")
    cmd = string.lower(cmd or "")
    rest = string.lower(rest or "")
    return cmd, rest
end

-- === 血量百分比更新函数 ===
function CT_PartyBuffs_UpdateHealthText(id)
    if CT_ShowHealthPercentage == 0 then
        local healthText = getglobal("PartyMemberFrame"..id.."HealthText")
        if healthText then
            healthText:Hide()
        end
        return
    end
    
    local unit = "party"..id
    local healthText = getglobal("PartyMemberFrame"..id.."HealthText")
    
    -- 确保文本对象存在
    if not healthText then
        healthText = getglobal("PartyMemberFrame"..id):CreateFontString("PartyMemberFrame"..id.."HealthText", "OVERLAY")
        healthText:SetFont("Fonts\\ARIALN.TTF", CT_HealthTextSize, "OUTLINE")
        healthText:SetTextColor(CT_HealthTextColor.r, CT_HealthTextColor.g, CT_HealthTextColor.b)
        healthText:SetJustifyH("RIGHT")
        healthText:SetPoint("RIGHT", getglobal("PartyMemberFrame"..id.."HealthBar"), "RIGHT", 25, 0)
    else
        healthText:SetFont("Fonts\\ARIALN.TTF", CT_HealthTextSize, "OUTLINE")
        healthText:SetTextColor(CT_HealthTextColor.r, CT_HealthTextColor.g, CT_HealthTextColor.b)
    end
    
    -- 检查单位是否存在且血量有效
    if UnitExists(unit) and UnitHealthMax(unit) > 0 then
        local health = UnitHealth(unit)
        local maxHealth = UnitHealthMax(unit)
        local percent = math.floor((health / maxHealth) * 100 + 0.5)
        healthText:SetText(percent.."%")
    else
        healthText:SetText("?%") -- 单位不存在或血量无效时显示"?%"
    end
    
    healthText:Show()
end

-- === 队友 Buff/DeBuff 刷新 ===
function CT_PartyBuffs_RefreshBuffs(elapsed)
    this.update = this.update + elapsed
    if (this.update > 0.5) then
        this.update = 0
        local id = this:GetID()
        local partyFrame = getglobal("PartyMemberFrame" .. id)

        if (not partyFrame or not partyFrame:IsShown()) or CT_ShowPartyBuffs == 0 then
            for i = 1, CT_NUM_PARTY_BUFFS do
                local b = getglobal(this:GetName() .. "Buff" .. i)
                if b then b:Hide() end
            end
            for i = 1, CT_NUM_PARTY_DEBUFFS do
                local d = getglobal(this:GetName() .. "Debuff" .. i)
                if d then d:Hide() end
            end
            return
        end

        CT_PartyBuffs_UpdateHealthText(id)

        for i = 1, CT_NUM_PARTY_BUFFS do
            local btn = getglobal(this:GetName() .. "Buff" .. i)
            if btn then
                btn:SetParent(partyFrame) 
                if (i > CT_NUM_SHOWN_PARTY_BUFFS) then
                    btn:Hide()
                else
                    local tex = UnitBuff("party" .. id, i)
                    if tex then
                        getglobal(btn:GetName() .. "Icon"):SetTexture(tex)
                        btn:Show()
                    else
                        btn:Hide()
                    end
                end
            end
        end

        for i = 1, CT_NUM_PARTY_DEBUFFS do
            local btn = getglobal(this:GetName() .. "Debuff" .. i)
            if btn then
                btn:SetParent(partyFrame) 
                local tex, stacks = UnitDebuff("party" .. id, i)
                if tex then
                    getglobal(btn:GetName() .. "Icon"):SetTexture(tex)
                    if (stacks and stacks > 1) then
                        getglobal(btn:GetName() .. "Count"):SetText(stacks)
                    else
                        getglobal(btn:GetName() .. "Count"):SetText("")
                    end
                    btn:Show()
                    local native = getglobal("PartyMemberFrame" .. id .. "Debuff" .. i)
                    if native and i <= 4 then native:Hide() end
                else
                    btn:Hide()
                end
            end
        end
    end
end

-- === 宠物 Buff 刷新 ===
function CT_PartyBuffs_RefreshPetBuffs(elapsed)
    this.update = this.update + elapsed
    if (this.update > 0.5) then
        this.update = 0
        local petFrame = PetFrame

        if (not petFrame or not petFrame:IsShown()) or CT_ShowPetBuffs == 0 then
            for i = 1, CT_NUM_PET_BUFFS do
                local b = getglobal(this:GetName() .. "Buff" .. i)
                if b then b:Hide() end
            end
            return
        end

        for i = 1, CT_NUM_PET_BUFFS do
            local btn = getglobal(this:GetName() .. "Buff" .. i)
            if btn then
                btn:SetParent(petFrame) 
                if (i > CT_NUM_SHOWN_PET_BUFFS) then
                    btn:Hide()
                else
                    local tex = UnitBuff("pet", i)
                    if tex then
                        getglobal(btn:GetName() .. "Icon"):SetTexture(tex)
                        btn:Show()
                    else
                        btn:Hide()
                    end
                end
            end
        end
    end
end

-- === 命令行 ===
SlashCmdList = SlashCmdList or {}
SlashCmdList["PARTYBUFFS"] = function(msg)
    local cmd, arg = parse_cmd(msg)

    if cmd == "party" or cmd == "队友" then
        if arg == "on" or arg == "开" or arg == "启用" then
            CT_ShowPartyBuffs = 1
            pb_msg("队友增益：|cff00ff00已开启|r")
        elseif arg == "off" or arg == "关" or arg == "禁用" then
            CT_ShowPartyBuffs = 0
            pb_msg("队友增益：|cffff0000已关闭|r")
        else
            pb_msg("用法：/pb party on|off （开/关队友增益）")
        end

    elseif cmd == "pet" or cmd == "宠物" then
        if arg == "on" or arg == "开" or arg == "启用" then
            CT_ShowPetBuffs = 1
            pb_msg("宠物增益：|cff00ff00已开启|r")
        elseif arg == "off" or arg == "关" or arg == "禁用" then
            CT_ShowPetBuffs = 0
            pb_msg("宠物增益：|cffff0000已关闭|r")
        else
            pb_msg("用法：/pb pet on|off （开/关宠物增益）")
        end

    elseif cmd == "number" or cmd == "num" or cmd == "数量" then
        local n = tonumber(arg)
        if n and n >= 4 and n <= CT_NUM_PARTY_BUFFS then
            CT_NUM_SHOWN_PARTY_BUFFS = n
            CT_NUM_SHOWN_PET_BUFFS = math.min(n, CT_NUM_PET_BUFFS)
            local rows = math.ceil(n / 7)
            pb_msg("每个队友最多显示 |cffffff00" .. n .. "|r 个增益（" .. rows .. "行，每行最多7个，宠物最多9个）")
        else
            pb_msg("用法：/pb number 4-14  或  /pb 数量 4-14")
        end
        
    elseif cmd == "health" or cmd == "hp" or cmd == "血量" then
        if arg == "on" or arg == "开" or arg == "启用" then
            CT_ShowHealthPercentage = 1
            pb_msg("血量百分比：|cff00ff00已开启|r")
            for i = 1, 4 do
                CT_PartyBuffs_UpdateHealthText(i)
            end
        elseif arg == "off" or arg == "关" or arg == "禁用" then
            CT_ShowHealthPercentage = 0
            pb_msg("血量百分比：|cffff0000已关闭|r")
            for i = 1, 4 do
                local healthText = getglobal("PartyMemberFrame"..i.."HealthText")
                if healthText then
                    healthText:Hide()
                end
            end
        else
            pb_msg("用法：/pb health on|off （开/关血量百分比显示）")
        end

    elseif cmd == "hpsize" or cmd == "字体" then
        local n = tonumber(arg)
        if n and n >= 8 and n <= 20 then
            CT_HealthTextSize = n
            pb_msg("血量文字大小已设置为 |cffffff00" .. n .. "|r")
            for i = 1, 4 do
                CT_PartyBuffs_UpdateHealthText(i)
            end
        else
            pb_msg("用法：/pb hpsize 8-20  （设置血量文字大小）")
        end

    elseif cmd == "hpc" or cmd == "颜色" then
        local r, g, b = string.match(arg, "([%d%.]+)%s+([%d%.]+)%s+([%d%.]+)")
        r, g, b = tonumber(r), tonumber(g), tonumber(b)
        if r and g and b and r >= 0 and r <= 1 and g >= 0 and g <= 1 and b >= 0 and b <= 1 then
            CT_HealthTextColor = { r = r, g = g, b = b }
            pb_msg(string.format("血量文字颜色已设置为 |cff%02x%02x%02x●|r", r*255, g*255, b*255))
            for i = 1, 4 do
                CT_PartyBuffs_UpdateHealthText(i)
            end
        else
            pb_msg("用法：/pb hpc R G B （0-1 之间，例如 1 0 0 = 红色）")
        end

    else
        pb_msg("命令列表：")
        pb_msg("/pb party on|off   - 开/关队友增益")
        pb_msg("/pb pet on|off     - 开/关宠物增益")
        pb_msg("/pb health on|off  - 开/关血量百分比")
        pb_msg("/pb number N       - 设置每人最多显示N个增益（4-14，每行7个）")
        pb_msg("/pb hpsize N       - 设置血量文字大小（8-20）")
        pb_msg("/pb hpc R G B  - 设置血量文字颜色（0-1 范围）")
    end
end
SLASH_PARTYBUFFS1 = "/pb"

for i = 1, 4 do
    local healthText = getglobal("PartyMemberFrame"..i.."HealthText")
    if not healthText then
        healthText = getglobal("PartyMemberFrame"..i):CreateFontString("PartyMemberFrame"..i.."HealthText", "OVERLAY")
        healthText:SetFont("Fonts\\ARIALN.TTF", CT_HealthTextSize, "OUTLINE")
        healthText:SetTextColor(CT_HealthTextColor.r, CT_HealthTextColor.g, CT_HealthTextColor.b)
        healthText:SetJustifyH("RIGHT")
        healthText:SetPoint("RIGHT", getglobal("PartyMemberFrame"..i.."HealthBar"), "RIGHT", 25, 0)
    end
end