local IgnoredButtonPatterns = {"Note", "GatherNote", "MinimapIcon", "GatherMatePin", "QuestieNote", "MiniNotePOI", "CartographerNotesPOI", "RecipeRadarMinimapIcon", "MinimapZoomIn", "MinimapZoomOut"}

function KillFrame(frame)
    if not frame then return end
    if frame.UnregisterAllEvents then frame:UnregisterAllEvents() end
    if frame.Hide then frame:Hide() end
    if frame.SetParent then frame:SetParent(UIParent) end
    if frame.ClearAllPoints then frame:ClearAllPoints() end
    if frame.SetAlpha then frame:SetAlpha(0) end
    if frame.EnableMouse then frame:EnableMouse(false) end
    if frame.SetScript and pcall then
        pcall(frame.SetScript, frame, "OnEvent", nil)
        pcall(frame.SetScript, frame, "OnUpdate", nil)
        pcall(frame.SetScript, frame, "OnDragStart", nil)
        pcall(frame.SetScript, frame, "OnDragStop", nil)
        pcall(frame.SetScript, frame, "OnClick", nil)
        pcall(frame.SetScript, frame, "OnMouseDown", nil)
        pcall(frame.SetScript, frame, "OnMouseUp", nil)
    end
end

SuneBigFoot = {collector = nil, toggleButton = nil, dragStartIndex = nil, buttonOrder = {}, currentLayout = {}}

local Setup = {currentLayout = {}}

function Setup:CalculateLayout(totalButtons)
    local cols = 3
    local rows = math.ceil(totalButtons / cols)
    return cols, rows
end

function Setup:PositionAndResize(index, totalButtons)
    local cols, rows = self:CalculateLayout(totalButtons)
    
    local col = math.mod(index - 1, cols)
    local row = math.floor((index - 1) / cols)
    
    local x = 6 + (col * (24 + 4))
    local y = -6 - (row * (24 + 4))
    
    local width = math.max(40, 12 + (cols * (24 + 4)))
    local height = 12 + (rows * (24 + 4))
    
    return x, y, width, height, cols
end

function Setup:GetCurrentIndex(button)
    for i, btn in ipairs(self.buttonOrder) do
        if btn == button then return i end
    end
    return nil
end

function Setup:CleanupFrames()
    KillFrame(_G.MBB_MinimapButtonFrame)
    KillFrame(_G.MinimapButtonFrame)
    KillFrame(_G.MBFMiniButtonFrame)
end

function Setup:CollectorFrame()
    self.collector = CreateFrame("Frame", "SuneBigFootCollectorFrame", UIParent)
    self.collector:SetFrameStrata("MEDIUM")
    self.collector:SetPoint("TOPLEFT", SuneBigFoot.toggleButton, "BOTTOMLEFT", 0, 0)
    self.collector:SetPoint("TOPRIGHT", SuneBigFoot.toggleButton, "BOTTOMRIGHT", 0, 0)
    self.collector:SetWidth(40)
    self.collector:SetHeight(150)

    self.collector.bg = self.collector:CreateTexture(nil, "BACKGROUND")
    self.collector.bg:SetTexture("Interface\\Buttons\\WHITE8X8")
    self.collector.bg:SetAllPoints()
    self.collector.bg:SetGradientAlpha("VERTICAL", 0.1, 0.1, 0.1, 0, 0.1, 0.1, 0.1, 0.7)
end

function Setup:IsValidButton(frame)
    if frame == SuneBigFootMinimapIcon then return false end

    if not frame:GetName() or not frame:IsVisible() then return false end
    if frame:GetHeight() > 40 or frame:GetWidth() > 40 then return false end
    if not frame:IsObjectType("Button") and not frame:IsObjectType("Frame") then return false end

    local name = string.lower(frame:GetName())
    for _, pattern in ipairs(IgnoredButtonPatterns) do
        if string.find(name, string.lower(pattern)) then return false end
    end

    if frame:IsObjectType("Button") then
        return frame:GetScript("OnClick") or frame:GetScript("OnMouseDown") or frame:GetScript("OnMouseUp")
    else
        if (string.find(name, "icon") or string.find(name, "button")) and (frame:GetScript("OnMouseDown") or frame:GetScript("OnMouseUp")) then
            return true
        end
        local children = {frame:GetChildren()}
        for _, child in ipairs(children) do
            if child and child:IsObjectType("Button") then return true end
        end
    end
    return false
end

function Setup:FindButtons()
    local buttons = {}
    for _, child in ipairs({Minimap:GetChildren()}) do
        if child and self:IsValidButton(child) then tinsert(buttons, child) end
    end
    return buttons
end

function Setup:ArrangeButtons(buttons)
    self.buttonOrder = buttons
    local totalButtons = getn(buttons)
    
    for i, button in ipairs(buttons) do
        button:SetParent(self.collector)
        button:ClearAllPoints()
        local x, y, width, height, cols = self:PositionAndResize(i, totalButtons)
        
        if i == 1 then
            self.collector:SetWidth(width)
            self.collector:SetHeight(height)
            self.currentLayout.cols = cols
            self:UpdateToggleButtonWidth(width)
        end
        
        button:SetPoint("TOPLEFT", self.collector, "TOPLEFT", x, y)

        if not button.originalSetPoint then
            button.originalSetPoint = button.SetPoint
            button.SetPoint = function() end
        end

        self:EnableDrag(button, i)
    end
end

function Setup:UpdateToggleButtonWidth(width)
    if SuneBigFoot.toggleButton then
        SuneBigFoot.toggleButton:SetWidth(width)
        if SuneBigFoot.toggleButton.leftBorder then
            SuneBigFoot.toggleButton.leftBorder:SetPoint("TOPRIGHT", SuneBigFoot.toggleButton, "TOPLEFT", 0, 0)
            SuneBigFoot.toggleButton.leftBorder:SetPoint("BOTTOMRIGHT", SuneBigFoot.toggleButton, "BOTTOMLEFT", 0, 0)
        end
        if SuneBigFoot.toggleButton.rightBorder then
            SuneBigFoot.toggleButton.rightBorder:SetPoint("TOPLEFT", SuneBigFoot.toggleButton, "TOPRIGHT", 0, 0)
            SuneBigFoot.toggleButton.rightBorder:SetPoint("BOTTOMLEFT", SuneBigFoot.toggleButton, "BOTTOMRIGHT", 0, 0)
        end
    end
end

function Setup:AddBorders()
    local positions = {
        {point1="BOTTOMLEFT", point2="TOPLEFT", point3="BOTTOMRIGHT", point4="TOPRIGHT", width=nil, height=1, gradient=false},
        {point1="TOPRIGHT", point2="TOPLEFT", point3="BOTTOMRIGHT", point4="BOTTOMLEFT", width=1, height=nil, gradient=true},
        {point1="TOPLEFT", point2="TOPRIGHT", point3="BOTTOMLEFT", point4="BOTTOMRIGHT", width=1, height=nil, gradient=true}
    }
    local names = {"topBorder", "leftBorder", "rightBorder"}

    for i = 1, 3 do
        local border = self.collector:CreateTexture(nil, "OVERLAY")
        self.collector[names[i]] = border
        border:SetTexture("Interface\\Buttons\\WHITE8X8")
        border:SetPoint(positions[i].point1, self.collector, positions[i].point2, 0, 0)
        border:SetPoint(positions[i].point3, self.collector, positions[i].point4, 0, 0)
        if positions[i].width then border:SetWidth(positions[i].width) end
        if positions[i].height then border:SetHeight(positions[i].height) end
        border:SetVertexColor(1, 0.81, 0, 0.6)
        if positions[i].gradient then
            border:SetGradientAlpha("VERTICAL", 1, 0.81, 0, 0, 1, 0.81, 0, 0.6)
        end
    end
end

function Setup:CreateToggleButton()
    local toggleButton = CreateFrame("Button", "SuneBigFootToggleButton", UIParent)
    toggleButton:SetHeight(20)
    toggleButton:SetPoint("RIGHT", Minimap, "LEFT", 0, -62)
    
    toggleButton.bg = toggleButton:CreateTexture(nil, "BACKGROUND")
    toggleButton.bg:SetTexture("Interface\\Buttons\\WHITE8X8")
    toggleButton.bg:SetAllPoints()
    toggleButton.bg:SetVertexColor(0.1, 0.1, 0.1, 0.8)
    
    toggleButton.text = toggleButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    toggleButton.text:SetPoint("CENTER", toggleButton, "CENTER", 0, 0)
    toggleButton.text:SetText("Sune插件包")
    toggleButton.text:SetTextColor(1, 0.82, 0, 1)
    
    toggleButton:SetWidth(40)

    toggleButton.topBorder = toggleButton:CreateTexture(nil, "OVERLAY")
    toggleButton.topBorder:SetTexture("Interface\\Buttons\\WHITE8X8")
    toggleButton.topBorder:SetPoint("TOPLEFT", toggleButton, "TOPLEFT", 0, 0)
    toggleButton.topBorder:SetPoint("TOPRIGHT", toggleButton, "TOPRIGHT", 0, 0)
    toggleButton.topBorder:SetHeight(1)
    toggleButton.topBorder:SetVertexColor(1, 0.81, 0, 0.6)
    
    toggleButton.bottomBorder = toggleButton:CreateTexture(nil, "OVERLAY")
    toggleButton.bottomBorder:SetTexture("Interface\\Buttons\\WHITE8X8")
    toggleButton.bottomBorder:SetPoint("BOTTOMLEFT", toggleButton, "BOTTOMLEFT", 0, 0)
    toggleButton.bottomBorder:SetPoint("BOTTOMRIGHT", toggleButton, "BOTTOMRIGHT", 0, 0)
    toggleButton.bottomBorder:SetHeight(1)
    toggleButton.bottomBorder:SetVertexColor(1, 0.81, 0, 0.6)
    
    toggleButton.leftBorder = toggleButton:CreateTexture(nil, "OVERLAY")
    toggleButton.leftBorder:SetTexture("Interface\\Buttons\\WHITE8X8")
    toggleButton.leftBorder:SetPoint("TOPRIGHT", toggleButton, "TOPLEFT", 0, 0)
    toggleButton.leftBorder:SetPoint("BOTTOMRIGHT", toggleButton, "BOTTOMLEFT", 0, 0)
    toggleButton.leftBorder:SetWidth(1)
    toggleButton.leftBorder:SetVertexColor(1, 0.81, 0, 0.6)
    
    toggleButton.rightBorder = toggleButton:CreateTexture(nil, "OVERLAY")
    toggleButton.rightBorder:SetTexture("Interface\\Buttons\\WHITE8X8")
    toggleButton.rightBorder:SetPoint("TOPLEFT", toggleButton, "TOPRIGHT", 0, 0)
    toggleButton.rightBorder:SetPoint("BOTTOMLEFT", toggleButton, "BOTTOMRIGHT", 0, 0)
    toggleButton.rightBorder:SetWidth(1)
    toggleButton.rightBorder:SetVertexColor(1, 0.81, 0, 0.6)

    toggleButton:SetMovable(true)
    toggleButton:RegisterForDrag("LeftButton")
    toggleButton:EnableMouse(true)
    
    toggleButton:SetScript("OnDragStart", function()
        this:StartMoving()
        this.isMoving = true
    end)
    
    toggleButton:SetScript("OnDragStop", function()
        if this.isMoving then
            this:StopMovingOrSizing()
            this.isMoving = false
            
            local scale = this:GetEffectiveScale()
            local left = this:GetLeft() * scale
            local right = this:GetRight() * scale
            local top = this:GetTop() * scale
            local bottom = this:GetBottom() * scale
            
            local screenWidth = GetScreenWidth() * UIParent:GetEffectiveScale()
            local screenHeight = GetScreenHeight() * UIParent:GetEffectiveScale()
            
            local newX, newY = this:GetLeft(), this:GetTop()
            local needsReposition = false
            
            if left - 1 < 0 then
                newX = 1
                needsReposition = true
            elseif right + 1 > screenWidth then
                newX = (screenWidth / scale) - this:GetWidth() - 1
                needsReposition = true
            end
            
            if top > screenHeight then
                newY = screenHeight / scale
                needsReposition = true
            elseif bottom < 0 then
                newY = this:GetHeight()
                needsReposition = true
            end
            
            if needsReposition then
                this:ClearAllPoints()
                this:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", newX, newY)
            end
            
            SuneBigFootConfig = SuneBigFootConfig or {}
            SuneBigFootConfig.posX = this:GetLeft()
            SuneBigFootConfig.posY = this:GetTop()
        end
    end)

    toggleButton:SetScript("OnClick", function()
        if self.collector:IsVisible() then
            UIFrameFadeOut(self.collector, 0.3, 1, 0)
            self.collector.fadeInfo.finishedFunc = self.collector.Hide
            self.collector.fadeInfo.finishedArg1 = self.collector
        else
            self.collector:SetAlpha(0)
            self.collector:Show()
            UIFrameFadeIn(self.collector, 0.3, 0, 1)
        end
    end)

    SuneBigFoot.toggleButton = toggleButton
end

function Setup:CreateMinimapIcon()
    local button = CreateFrame("Button", "SuneBigFootMinimapIcon", Minimap)
    button:SetWidth(32)
    button:SetHeight(32)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)

    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetTexture("Interface\\Icons\\Spell_Holy_BlessingOfAgility")
    icon:SetWidth(20)
    icon:SetHeight(20)
    icon:SetPoint("TOPLEFT", button, "TOPLEFT", 6.5, -4)
    button.icon = icon

    local border = button:CreateTexture(nil, "OVERLAY")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetWidth(52)
    border:SetHeight(52)
    border:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
    button.border = border

    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    button:GetHighlightTexture():SetBlendMode("ADD")

    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:RegisterForDrag("LeftButton")

    button:SetScript("OnDragStart", function()
        this:LockHighlight()
        this.isDragging = true
    end)

    button:SetScript("OnDragStop", function()
        this:UnlockHighlight()
        this.isDragging = false
    end)

    button:SetScript("OnUpdate", function()
        if this.isDragging then
            local xpos, ypos = GetCursorPosition()
            local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom()
            local scale = UIParent:GetEffectiveScale()
            xpos = xpos / scale
            ypos = ypos / scale
            
            local dx = xpos - (xmin + Minimap:GetWidth() / 2)
            local dy = ypos - (ymin + Minimap:GetHeight() / 2)
            
            local angle = math.deg(math.atan2(dy, dx))
            if angle < 0 then angle = angle + 360 end
            
            SuneBigFootConfig = SuneBigFootConfig or {}
            SuneBigFootConfig.minimapPos = angle
            
            Setup:UpdateMinimapIconPosition()
        end
    end)

    button:SetScript("OnClick", function()
        local tb = SuneBigFoot.toggleButton
        local col = Setup.collector
        
        if tb:IsVisible() or (col and col:IsVisible()) then
            tb:Hide()
            if col and col:IsVisible() then
                UIFrameFadeOut(col, 0.3, 1, 0)
                if col.fadeInfo then
                    col.fadeInfo.finishedFunc = col.Hide
                    col.fadeInfo.finishedArg1 = col
                end
            end
        else
            tb:Show()
            if col and not col:IsVisible() then
                col:SetAlpha(0)
                col:Show()
                UIFrameFadeIn(col, 0.3, 0, 1)
            end
        end
    end)

    button:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_LEFT")
        GameTooltip:SetText("Sune插件包|cFFFFFFFF\n点击本图标：显示/隐藏插件收纳框\n点击框标题：展开/收起插件列表框")
        GameTooltip:Show()
    end)

    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    self:UpdateMinimapIconPosition()
end

function Setup:UpdateMinimapIconPosition()
    SuneBigFootConfig = SuneBigFootConfig or {}
    local angle = SuneBigFootConfig.minimapPos or 45
    local radius = 80
    local radian = math.rad(angle)
    
    local x = math.cos(radian) * radius
    local y = math.sin(radian) * radius
    
    if SuneBigFootMinimapIcon then
        SuneBigFootMinimapIcon:ClearAllPoints()
        SuneBigFootMinimapIcon:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end
end

function Setup:StartDelayedCollection()
    local timer = 0
    self.collector:SetScript("OnUpdate", function()
        timer = timer + arg1
        if timer > 0.1 then
            self:CleanupFrames()
            local buttons = self:FindButtons()
            if getn(buttons) == 0 then
                self.collector:Hide()
                SuneBigFoot.toggleButton:Hide()
                self.collector:SetScript("OnUpdate", nil)
                return
            end
            self:ArrangeButtons(buttons)
            self.collector:SetScript("OnUpdate", nil)
            self.collector:Hide()
        end
    end)
end

function Setup:RepositionAllButtons()
    if not self.buttonOrder or getn(self.buttonOrder) == 0 then return end
    
    local totalButtons = getn(self.buttonOrder)
    local _, _, width, height, cols = self:PositionAndResize(1, totalButtons)
    
    self.collector:SetWidth(width)
    self.collector:SetHeight(height)
    self.currentLayout.cols = cols
    
    self:UpdateToggleButtonWidth(width)
    
    for i, button in ipairs(self.buttonOrder) do
        button:ClearAllPoints()
        local x, y = self:PositionAndResize(i, totalButtons)
        button.originalSetPoint(button, "TOPLEFT", self.collector, "TOPLEFT", x, y)
    end
end

function Setup:FindDropPosition(button)
    if not self.buttonOrder or getn(self.buttonOrder) == 0 then return 1 end
    
    local cols = self.currentLayout.cols or 3
    local bx, by = button:GetLeft() + 12, button:GetTop() - 12
    local cx, cy = self.collector:GetLeft(), self.collector:GetTop()
    
    local relX = bx - cx
    local relY = cy - by
    
    local col = math.max(0, math.floor((relX - 3) / (24 + 4)))
    local row = math.max(0, math.floor((relY - 6) / (24 + 4)))
    
    col = math.min(col, cols - 1)
    
    local pos = (row * cols) + col + 1
    return math.min(pos, getn(self.buttonOrder))
end

function Setup:SnapBack(button)
    local left, right, top, bottom = self.collector:GetLeft(), self.collector:GetRight(), self.collector:GetTop(), self.collector:GetBottom()
    local bx, by = button:GetLeft(), button:GetBottom()
    return bx < left or bx > right or by < bottom or by > top
end

function Setup:ReorderButtons(fromIndex, toIndex)
    if fromIndex == toIndex then
        self:RepositionAllButtons()
        return
    end
    local temp = self.buttonOrder[fromIndex]
    tremove(self.buttonOrder, fromIndex)
    tinsert(self.buttonOrder, toIndex, temp)
    self:RepositionAllButtons()
end

function Setup:EnableDrag(button, index)
    local dragTarget = button
    if button:IsObjectType("Frame") then
        local children = {button:GetChildren()}
        for _, child in ipairs(children) do
            if child:IsObjectType("Button") then
                dragTarget = child
                break
            end
        end
    end

    dragTarget:RegisterForDrag("LeftButton")
    button:SetMovable(true)
    dragTarget:EnableMouse(true)

    dragTarget:SetScript("OnDragStart", function()
        self.dragStartIndex = index
        button:StartMoving()
    end)

    dragTarget:SetScript("OnDragStop", function()
        button:StopMovingOrSizing()
        if self:SnapBack(button) then
            local currentIndex = self:GetCurrentIndex(button)
            if currentIndex then
                button:ClearAllPoints()
                local x, y = self:PositionAndResize(currentIndex, getn(self.buttonOrder))
                button.originalSetPoint(button, "TOPLEFT", self.collector, "TOPLEFT", x, y)
            end
            return
        end

        local dropIndex = self:FindDropPosition(button)
        if self.dragStartIndex ~= dropIndex then
            self:ReorderButtons(self.dragStartIndex, dropIndex)
        else
            self:RepositionAllButtons()
        end
    end)
end

function Setup:Run()
    self:CleanupFrames()
    self:CreateToggleButton() 
    self:CreateMinimapIcon()          
    
    if SuneBigFootConfig and SuneBigFootConfig.posX and SuneBigFootConfig.posY then
        SuneBigFoot.toggleButton:ClearAllPoints()
        SuneBigFoot.toggleButton:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 
            SuneBigFootConfig.posX, SuneBigFootConfig.posY)
    end
    
    self:CollectorFrame()
    self:StartDelayedCollection()
    self:AddBorders()
end

SuneBigFoot.frame = CreateFrame("Frame", nil, UIParent)
SuneBigFoot.frame:RegisterEvent("ADDON_LOADED")
SuneBigFoot.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
SuneBigFoot.frame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" and arg1 == "SuneBigFoot" then
        if SuneBigFoot.initialized then return end
        Setup:Run()
        SuneBigFoot.initialized = true
    elseif event == "PLAYER_ENTERING_WORLD" then
        if SuneBigFoot.initialized and Setup.UpdateMinimapIconPosition then
            Setup:UpdateMinimapIconPosition()
        end
    end
end)