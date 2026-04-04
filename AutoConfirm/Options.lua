local checkButtons = {
    -- 任务操作
    { text = "自动接受任务",             variable = "acceptQuest" },
    { text = "自动完成任务",           variable = "completeQuest" },
    { text = "放弃任务时自动确认",            variable = "abandonQuest" },
    { text = "自动接受共享任务",        variable = "acceptSharedQuest" },

    -- 小队/公会内操作
    { text = "自动接受队伍邀请",      variable = "partyInvite" },
    { text = "自动拒绝队伍邀请",     variable = "declinePartyInvite" },
    { text = "自动接受被术士拉",            variable = "summon" },
    { text = "自动接受复活",         variable = "acceptResurrect" },
    { text = "自动拒绝工会邀请",     variable = "declineGuildInvite" },

    -- 拾取操作
    { text = "|CFF00FF00点贪婪/需求时提示绑定 - 自动确认",    variable = "lootRoll" },
    { text = "拾取物品时提示绑定 - 自动确认",    variable = "lootBind" },
    { text = "提示装备后绑定时 - 自动确认",            variable = "equipBind" },
    { text = "提示使用后绑定时 - 自动确认",              variable = "useBind" },
    { text = "自动贪婪一切物品 - |cffff0000最好只三选一",               variable = "autoGreed" },
    { text = "自动需求一切物品 - |cffff0000最好只三选一",                variable = "autoNeed" },
    { text = "自动放弃一切物品 - |cffff0000最好只三选一",                variable = "autoPass" },
    { text = "Distribute Loot",          variable = "lootDistribution" },

    -- 附魔操作
    { text = "提示附魔后绑定 - 自动确认",             variable = "enchantBind" },
    { text = "替换附魔时 - 自动确认",          variable = "replaceEnchant" },
    { text = "交易时提示替换附魔 - 自动确认",    variable = "replaceTradeEnchant" },

    -- 战场副本操作
    { text = "提示是否进入战场 - 自动确认",       variable = "battlefieldEntry" },
    { text = "提示是否重置副本 - 自动确认",          variable = "resetInstances" },

    --炉石/复活操作
    { text = "炉石绑定提示 - 自动确认",         variable = "bindHearthstone" },
    { text = "自动释放灵魂",           variable = "releaseSpirit" },

    -- 杂项
    { text = "野外挂机时（自动取消系统小退）", variable = "antiAfk" },
    { text = "摧毁时自动输入Delete",         variable = "typeDelete" },
    { text = "摧毁物品自动确认|cffff0000（危险）",    variable = "deleteItem" },
}

local AutoConfirmPanel = CreateFrame("Frame", "AutoConfirmPanel", UIParent)
AutoConfirmPanel:SetWidth(300)
AutoConfirmPanel:SetHeight(400)
AutoConfirmPanel:SetPoint("CENTER", nil, "CENTER")
AutoConfirmPanel:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
AutoConfirmPanel:SetBackdropColor(0, 0, 0, 1)
AutoConfirmPanel:Hide()

local scrollFrame = CreateFrame("ScrollFrame", "AutoConfirmScrollFrame", AutoConfirmPanel, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", AutoConfirmPanel, 8, -40)
scrollFrame:SetPoint("BOTTOMRIGHT", AutoConfirmPanel, -30, 10)

local content = CreateFrame("Frame", nil, scrollFrame)
content:SetWidth(240)
content:SetHeight(28 * table.getn(checkButtons) + 20)
scrollFrame:SetScrollChild(content)

local title = AutoConfirmPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOP", AutoConfirmPanel, 0, -16)
title:SetText("Auto Confirmations")

local closeButton = CreateFrame("Button", nil, AutoConfirmPanel, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", AutoConfirmPanel, -4, -4)
closeButton:SetScript("OnClick", function() AutoConfirmPanel:Hide() end)


local function CreateCheckButton(parent, yOffset, text, variable)
    local button = CreateFrame("CheckButton", nil, parent, "OptionsCheckButtonTemplate")
    button:SetPoint("TOPLEFT", parent, 0, yOffset)
    button:SetWidth(24)
    button:SetHeight(24)
    button.text = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    button.text:SetPoint("LEFT", button, "RIGHT", 4, 0)
    button.text:SetText(text)
    button:SetScript("OnClick", function()
        AutoConfirmationSettings[variable] = button:GetChecked() and 1 or nil
    end)
    return button
end

for i, buttonInfo in ipairs(checkButtons) do
    local yOffset = -10 - 28 * (i - 1)
    buttonInfo.button = CreateCheckButton(content, yOffset, buttonInfo.text, buttonInfo.variable)
end

local function InitOptions()
    for _, buttonInfo in ipairs(checkButtons) do
        buttonInfo.button:SetChecked(AutoConfirmationSettings[buttonInfo.variable])
    end
end

AutoConfirmPanel:SetScript("OnShow", InitOptions)

SLASH_AUTOCONFIRM1 = "/autoconfirm"
SLASH_AUTOCONFIRM2 = "/ac"
SlashCmdList["AUTOCONFIRM"] = function(msg)
    if AutoConfirmPanel:IsShown() then
        AutoConfirmPanel:Hide()
    else
        AutoConfirmPanel:Show()
    end
end
