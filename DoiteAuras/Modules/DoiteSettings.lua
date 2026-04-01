---------------------------------------------------------------
-- DoiteSettings.lua
-- DoiteAuras 的设置 UI
-- 请尊重许可说明：使用前请询问
-- WoW 1.12 | Lua 5.0
---------------------------------------------------------------

DoiteSettings = DoiteSettings or {}

local settingsFrame
----------------------------------------
-- 本地辅助函数
----------------------------------------
-- 匹配“最上层”行为
local function DS_MakeTopMost(frame)
    if not frame then return end
    frame:SetFrameStrata("TOOLTIP")
end

local function DS_CloseOtherWindows()
    local f

    f = _G["DoiteAurasImportFrame"]
    if f and f.IsShown and f:IsShown() then
        f:Hide()
    end

    f = _G["DoiteAurasExportFrame"]
    if f and f.IsShown and f:IsShown() then
        f:Hide()
    end
end

----------------------------------------
-- 框架
----------------------------------------
local function DS_CreateSettingsFrame()
    if settingsFrame then
        return
    end

    local f = CreateFrame("Frame", "DoiteAurasSettingsFrame", UIParent)
    settingsFrame = f

    -- 大小与导入框架相似，相同样式
    f:SetWidth(250)
    f:SetHeight(350)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    f:EnableMouse(true)
    f:SetMovable(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function()
        this:StartMoving()
    end)
    f:SetScript("OnDragStop", function()
        this:StopMovingOrSizing()
    end)

    f:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })
    f:SetBackdropColor(0, 0, 0, 1)
    f:SetBackdropBorderColor(1, 1, 1, 1)
    f:SetFrameStrata("TOOLTIP")
    f:Hide()

    -- 标题
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -15)
    title:SetText("|cff6FA8DCDoite 设置|r")

    -- 分隔线（与导出/导入相同思路）
    local sep = f:CreateTexture(nil, "ARTWORK")
    sep:SetHeight(1)
    sep:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -35)
    sep:SetPoint("TOPRIGHT", f, "TOPRIGHT", -20, -35)
    sep:SetTexture(1, 1, 1)
    if sep.SetVertexColor then
        sep:SetVertexColor(1, 1, 1, 0.25)
    end

    -- 关闭 X
    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -5, -5)
    close:SetScript("OnClick", function()
        f:Hide()
    end)

	-- 即将推出文本（中心主体）
    local coming = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    coming:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -100)
    coming:SetWidth(210)
    coming:SetJustifyH("LEFT")
    coming:SetJustifyV("TOP")
    coming:SetText("即将推出的设置：\n\n* 冷却即将结束（滑块范围和剩余时间）\n* 某些重建的刷新率（例如组）")

    ---------------------------------------------------------------
    -- pfUI 边框切换
    ---------------------------------------------------------------
    local pfuiBorderBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    pfuiBorderBtn:SetWidth(120)
    pfuiBorderBtn:SetHeight(20)
    pfuiBorderBtn:SetPoint("TOPLEFT", f, "TOPLEFT", 20, -50)

    local function DS_HasPfUI()
        if type(DoiteAuras_HasPfUI) == "function" then
            return DoiteAuras_HasPfUI() == true
        end
        return false
    end

    local function DS_UpdatePfUIButton()
        local hasPfUI = DS_HasPfUI()

		-- 如果 pfUI 存在且用户尚未保存选择，默认开启
		if hasPfUI and DoiteAurasDB and DoiteAurasDB.pfuiBorder == nil then
			DoiteAurasDB.pfuiBorder = true
		end

        -- 如果 pfUI 缺失：首先强制关闭
        if not hasPfUI then
            if DoiteAurasDB then
                DoiteAurasDB.pfuiBorder = false
            end
        end

        -- 根据最终状态设置标签
        if DoiteAurasDB and DoiteAurasDB.pfuiBorder == true then
            pfuiBorderBtn:SetText("pfUI 图标: 开")
        else
            pfuiBorderBtn:SetText("pfUI 图标: 关")
        end

        -- 当 pfUI 缺失时禁用并变灰
        if not hasPfUI then
            if pfuiBorderBtn.Disable then pfuiBorderBtn:Disable() end

            local fs = pfuiBorderBtn.GetFontString and pfuiBorderBtn:GetFontString()
            if fs and fs.SetTextColor then
                fs:SetTextColor(0.6, 0.6, 0.6)
            end
        else
            if pfuiBorderBtn.Enable then pfuiBorderBtn:Enable() end

            local fs = pfuiBorderBtn.GetFontString and pfuiBorderBtn:GetFontString()
            if fs and fs.SetTextColor then
                fs:SetTextColor(1, 0.82, 0)
            end
        end
    end

    pfuiBorderBtn:SetScript("OnClick", function()
        if not DS_HasPfUI() then
            return
        end

        DoiteAurasDB.pfuiBorder = not (DoiteAurasDB.pfuiBorder == true)
        DS_UpdatePfUIButton()

        if type(DoiteAuras_ApplyBorderToAllIcons) == "function" then
            DoiteAuras_ApplyBorderToAllIcons()
        end
        if DoiteAuras_RefreshIcons then
            pcall(DoiteAuras_RefreshIcons)
        end
    end)

    DS_UpdatePfUIButton()

    ---------------------------------------------------------------
    -- 物品工具提示切换
    ---------------------------------------------------------------
    local itemTooltipBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    itemTooltipBtn:SetWidth(120)
    itemTooltipBtn:SetHeight(20)
    itemTooltipBtn:SetPoint("TOPLEFT", pfuiBorderBtn, "BOTTOMLEFT", 0, -5)

    local function DS_UpdateItemTooltipButton()
        if not DoiteAurasDB then DoiteAurasDB = {} end

        -- 如果未设置，默认开启
        if DoiteAurasDB.showtooltip == nil then
            DoiteAurasDB.showtooltip = true
        end

        if DoiteAurasDB.showtooltip == true then
            itemTooltipBtn:SetText("物品提示信息: 开")
        else
            itemTooltipBtn:SetText("物品提示信息: 关")
        end

        -- 始终启用，匹配 pfUI 按钮“启用”颜色
        if itemTooltipBtn.Enable then itemTooltipBtn:Enable() end
        local fs = itemTooltipBtn.GetFontString and itemTooltipBtn:GetFontString()
        if fs and fs.SetTextColor then
            fs:SetTextColor(1, 0.82, 0)
        end
    end

    itemTooltipBtn:SetScript("OnClick", function()
        if not DoiteAurasDB then DoiteAurasDB = {} end
        DoiteAurasDB.showtooltip = not (DoiteAurasDB.showtooltip == true)
        DS_UpdateItemTooltipButton()

        -- 立即刷新，以便鼠标处理程序/工具提示脚本更新
        if DoiteAuras_RefreshIcons then
            pcall(DoiteAuras_RefreshIcons)
        end
    end)

    DS_UpdateItemTooltipButton()

    -- OnShow：强制独占 + 最上层
    f:SetScript("OnShow", function()
        DS_CloseOtherWindows()
        DS_MakeTopMost(f)
        DS_UpdatePfUIButton()
        DS_UpdateItemTooltipButton()
    end)

    DS_MakeTopMost(f)
end

-- 公共入口点，由 DoiteAuras.lua 中的设置按钮调用
function DoiteAuras_ShowSettings()
    if not settingsFrame then
        DS_CreateSettingsFrame()
    end

    -- 如果导入/导出打开，关闭它们，以便只有一个窗口可见
    DS_CloseOtherWindows()

    settingsFrame:Show()
end
----------------------------------------
-- 框架结束
----------------------------------------