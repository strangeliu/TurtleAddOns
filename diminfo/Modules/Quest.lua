local diminfo_Quest = CreateFrame("Button", "diminfo_Quest", UIParent)
local Text = diminfo_Quest:CreateFontString(nil, "OVERLAY")
Text:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
Text:SetPoint("RIGHT", diminfo_RaidCD, "LEFT", -20, 0)
diminfo_Quest:SetAllPoints(Text)

-- 获取任务数量
local function GetQuestCount()
    local numQuests = GetNumQuestLogEntries()
    local acceptedQuests = 0
    
    for i = 1, numQuests do
        local questLogTitleText, _, _, isHeader = GetQuestLogTitle(i)
        if not isHeader and questLogTitleText then
            acceptedQuests = acceptedQuests + 1
        end
    end
    
    return acceptedQuests, 20  -- 任务上限固定为20
end

-- 更新任务显示
local function UpdateQuestDisplay()
    local current, max = GetQuestCount()
    Text:SetText("任务"..current.."/"..max)
end

-- 鼠标提示
diminfo_Quest:SetScript("OnEnter", function()
    local current, max = GetQuestCount()
    GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
    GameTooltip:ClearLines()
    GameTooltip:AddLine("任务信息")
    GameTooltip:AddLine("左键:打开任务日志", .3, 1, .6)
    GameTooltip:AddLine("右键:打开数据库查询", .3, 1, .6)
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("任务状态: "..current.." 个 / "..max.." 个")    
    
    local numQuests = GetNumQuestLogEntries()
    local displayed = 0
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("所有任务:")
    
    for i = 1, numQuests do
        if displayed >= 20 then break end
        
        local questLogTitleText, _, _, isHeader, _, isComplete, _, questID = GetQuestLogTitle(i)
        if not isHeader and questLogTitleText then
            local color = isComplete and "|cff00ff00" or "|cffff0000"
            local status = isComplete and "[完成]" or "[进行中]"
            GameTooltip:AddLine(color..questLogTitleText.." "..status.."|r")
            displayed = displayed + 1
        end
    end
    
    GameTooltip:Show()
end)

diminfo_Quest:SetScript("OnLeave", function() 
    GameTooltip:Hide() 
end)

diminfo_Quest:SetScript("OnMouseDown", function()
    if arg1 == "LeftButton" then
        ToggleQuestLog()
    elseif arg1 == "RightButton" then
        if pfQuestBrowser then
            if pfQuestBrowser:IsShown() then
                pfQuestBrowser:Hide()
            else
                pfQuestBrowser:Show()
            end
        else
            DEFAULT_CHAT_FRAME:AddMessage("提示: 请先加载pfQuest插件")
        end
    end
end)

-- 注册事件
diminfo_Quest:RegisterEvent("PLAYER_ENTERING_WORLD")
diminfo_Quest:RegisterEvent("QUEST_LOG_UPDATE")
diminfo_Quest:RegisterEvent("QUEST_WATCH_UPDATE")
diminfo_Quest:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
diminfo_Quest:SetScript("OnEvent", UpdateQuestDisplay)

-- 初始显示
UpdateQuestDisplay()