
-- 定义插件名称
local ADDON_NAME = "Settings-ShamanHeal"



-- 创建主框架
CatUISettingsShamanHealWindow = MPCreateFrame(ADDON_NAME.."Frame", 520, 690, "|cFF0070DE设置 - 奶萨|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsShamanHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")


local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end




local postion_y = postion_y-40

-- 创建单选框 - 治疗波
local checkButton_Wave = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_Wave:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
checkButton_Wave:SetScale(0.8)

-- 添加文字标签
local checkText_Wave = checkButton_Wave:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Wave:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Wave:SetTextColor(1, 1, 1)
checkText_Wave:SetPoint("LEFT", checkButton_Wave, "LEFT", 34, 1)
checkText_Wave:SetText("开启 治疗波")

-- 设置点击事件
checkButton_Wave:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.Wave = 1
    else
        MPShamanHealSaved.Wave = 0
    end
end)


-- 创建单选框 - 优先治疗目标
local checkButton_TargetFirst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_TargetFirst:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 340, postion_y)
checkButton_TargetFirst:SetScale(0.8)

-- 添加文字标签
local checkText_TargetFirst = checkButton_TargetFirst:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_TargetFirst:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_TargetFirst:SetTextColor(1, 1, 1)
checkText_TargetFirst:SetPoint("LEFT", checkButton_TargetFirst, "LEFT", 34, 1)
checkText_TargetFirst:SetText("优先治疗 目标")

-- 设置点击事件
checkButton_TargetFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.TargetFirst = 1
    else
        MPShamanHealSaved.TargetFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 次级治疗波
local checkButton_SecondaryWave = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_SecondaryWave:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
checkButton_SecondaryWave:SetScale(0.8)

-- 添加文字标签
local checkText_SecondaryWave = checkButton_SecondaryWave:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SecondaryWave:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SecondaryWave:SetTextColor(1, 1, 1)
checkText_SecondaryWave:SetPoint("LEFT", checkButton_SecondaryWave, "LEFT", 34, 1)
checkText_SecondaryWave:SetText("开启 次级治疗波")

-- 设置点击事件
checkButton_SecondaryWave:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.SecondaryWave = 1
    else
        MPShamanHealSaved.SecondaryWave = 0
    end
end)

-- 创建单选框 - 优先治疗目标 的 目标
local checkButton_TargetTarget = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_TargetTarget:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 340, postion_y)
checkButton_TargetTarget:SetScale(0.8)

-- 添加文字标签
local checkText_TargetTarget = checkButton_TargetTarget:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_TargetTarget:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_TargetTarget:SetTextColor(1, 1, 1)
checkText_TargetTarget:SetPoint("LEFT", checkButton_TargetTarget, "LEFT", 34, 1)
checkText_TargetTarget:SetText("优先治疗 目标 的 目标")

-- 设置点击事件
checkButton_TargetTarget:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.TargetTarget = 1
    else
        MPShamanHealSaved.TargetTarget = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 治疗链
local checkButton_Chain = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_Chain:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
checkButton_Chain:SetScale(0.8)

-- 添加文字标签
local checkText_Chain = checkButton_Chain:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Chain:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Chain:SetTextColor(1, 1, 1)
checkText_Chain:SetPoint("LEFT", checkButton_Chain, "LEFT", 34, 1)
checkText_Chain:SetText("开启 治疗链 (自动扫描)")

-- 设置点击事件
checkButton_Chain:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.Chain = 1
    else
        MPShamanHealSaved.Chain = 0
    end
end)


-- 创建单选框 - 优先治疗自己
local checkButton_SelfFirst = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_SelfFirst:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 340, postion_y)
checkButton_SelfFirst:SetScale(0.8)

-- 添加文字标签
local checkText_SelfFirst = checkButton_SelfFirst:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_SelfFirst:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_SelfFirst:SetTextColor(1, 1, 1)
checkText_SelfFirst:SetPoint("LEFT", checkButton_SelfFirst, "LEFT", 34, 1)
checkText_SelfFirst:SetText("优先治疗 自己 (谨慎开启)")

-- 设置点击事件
checkButton_SelfFirst:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.SelfFirst = 1
    else
        MPShamanHealSaved.SelfFirst = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 水之护盾
local checkButton_WaterShield = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_WaterShield:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
checkButton_WaterShield:SetScale(0.8)

-- 添加文字标签
local checkText_WaterShield = checkButton_WaterShield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WaterShield:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WaterShield:SetTextColor(1, 1, 1)
checkText_WaterShield:SetPoint("LEFT", checkButton_WaterShield, "LEFT", 34, 1)
checkText_WaterShield:SetText("保持 水之护盾")

-- 设置点击事件
checkButton_WaterShield:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.WaterShield = 1
    else
        MPShamanHealSaved.WaterShield = 0
    end
end)


-- 创建单选框 - 治疗大团
local checkButton_ScanTeam = MPCreateCheckButton(CatUISettingsShamanHealWindow, ADDON_NAME.."CheckButton", 340, postion_y, "治疗大团")
checkButton_ScanTeam:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.ScanTeam = 1
    else
        MPShamanHealSaved.ScanTeam = 0
    end
end)

local checkButton_ScanTeam_Low = MPCreateCheckButtonSmall(CatUISettingsShamanHealWindow, ADDON_NAME.."CheckButton", 460, postion_y, "血量最低")
local checkButton_ScanTeam_Rand = MPCreateCheckButtonSmall(CatUISettingsShamanHealWindow, ADDON_NAME.."CheckButton", 560, postion_y, "随机")

checkButton_ScanTeam_Low:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.ScanTeam_Low = 1
        MPShamanHealSaved.ScanTeam_Rand = 0
    else
        MPShamanHealSaved.ScanTeam_Low = 0
        MPShamanHealSaved.ScanTeam_Rand = 1
    end
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPShamanHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPShamanHealSaved.ScanTeam_Rand))
end)
checkButton_ScanTeam_Rand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.ScanTeam_Rand = 1
        MPShamanHealSaved.ScanTeam_Low = 0
    else
        MPShamanHealSaved.ScanTeam_Rand = 0
        MPShamanHealSaved.ScanTeam_Low = 1
    end
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPShamanHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPShamanHealSaved.ScanTeam_Rand))
end)



postion_y = postion_y - 30

-- 创建单选框 - Tip
local checkButton_Tip = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_Tip:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 340, postion_y)
checkButton_Tip:SetScale(0.8)
checkButton_Tip:Hide()

-- 添加文字标签
local checkText_Tip = checkButton_Tip:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Tip:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Tip:SetTextColor(1, 1, 1)
checkText_Tip:SetPoint("LEFT", checkButton_Tip, "LEFT", 34, 1)
checkText_Tip:SetText("开启 提示信息")

-- 设置点击事件
checkButton_Tip:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.Tip = 1
    else
        MPShamanHealSaved.Tip = 0
    end
end)



postion_y = postion_y - 50 + 30

--起始治疗
local slider_Begin_Value = CreateFrame("Slider", ADDON_NAME.."SliderBegin_Value", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_Begin_Value:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y+40)
slider_Begin_Value:SetWidth(220) -- 拖动条长度
slider_Begin_Value:SetHeight(16) -- 拖动条高度

slider_Begin_Value:SetMinMaxValues(80, 100)
slider_Begin_Value:SetValueStep(0.5)
slider_Begin_Value:SetValue(99.5) -- 默认值
MPCatUISliderRegionHide(slider_Begin_Value)

_G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线：99.5%")
_G[slider_Begin_Value:GetName().."Low"]:Hide()
_G[slider_Begin_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Begin_Value:SetScript("OnValueChanged", function()
    _G[slider_Begin_Value:GetName().."Text"]:SetText("起始治疗 血线："..arg1.."%")
    MPShamanHealSaved.Begin_Value = arg1
end)








-- 图腾

postion_y = postion_y+10

-- 添加提示内容区域
local TipText2 = CatUISettingsShamanHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText2:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
TipText2:SetWidth(250)
TipText2:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText2:SetTextColor(1, 0.8, 0)
TipText2:SetJustifyH("LEFT")
TipText2:SetText("图腾配置")

postion_y = postion_y-80



-- 大地图腾
local checkButton_EarthTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_EarthTotem:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
checkButton_EarthTotem:SetScale(0.8)

-- 添加文字标签
local checkText_EarthTotem = checkButton_EarthTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_EarthTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_EarthTotem:SetTextColor(1, 1, 1)
checkText_EarthTotem:SetPoint("LEFT", checkButton_EarthTotem, "LEFT", 34, 1)
checkText_EarthTotem:SetText("大地图腾")

-- 设置点击事件
checkButton_EarthTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.EarthTotem = 1
    else
        MPShamanHealSaved.EarthTotem = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_EarthTotem = {
    [1] = {text = "大地之力图腾", value = 1},
    [2] = {text = "石肤图腾", value = 2},
    [3] = {text = "石爪图腾", value = 3},
    [4] = {text = "战栗图腾",   value = 4},
    [5] = {text = "地缚图腾",   value = 5},
}

-- 创建下拉菜单
local dropdown_EarthTotem = CreateFrame("Button", ADDON_NAME.."Dropdown_EarthTotem", checkButton_EarthTotem, "UIDropDownMenuTemplate")
dropdown_EarthTotem:SetPoint("TOPLEFT", checkButton_EarthTotem, "TOPLEFT", -12, -35)

-- 菜单初始化
local function Dropdown_Init_EarthTotem()
    for idx, data in pairs(modes_EarthTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, index)
                MPShamanHealSaved.EarthTotem_Value = modes_EarthTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_EarthTotem, Dropdown_Init_EarthTotem)
UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, 1) -- 默认选中第一项








-- 火焰图腾
local checkButton_FireTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_FireTotem:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 175, postion_y)
checkButton_FireTotem:SetScale(0.8)

-- 添加文字标签
local checkText_FireTotem = checkButton_FireTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_FireTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_FireTotem:SetTextColor(1, 1, 1)
checkText_FireTotem:SetPoint("LEFT", checkButton_FireTotem, "LEFT", 34, 1)
checkText_FireTotem:SetText("火焰图腾")

-- 设置点击事件
checkButton_FireTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.FireTotem = 1
    else
        MPShamanHealSaved.FireTotem = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_FireTotem = {
    [1] = {text = "火焰新星图腾", value = 1},
    [2] = {text = "灼热图腾", value = 2},
    [3] = {text = "熔岩图腾", value = 3},
    [4] = {text = "抗寒图腾",   value = 4},
    [5] = {text = "火舌图腾",   value = 5},
}

-- 创建下拉菜单
local dropdown_FireTotem = CreateFrame("Button", ADDON_NAME.."Dropdown_FireTotem", checkButton_FireTotem, "UIDropDownMenuTemplate")
dropdown_FireTotem:SetPoint("TOPLEFT", checkButton_FireTotem, "TOPLEFT", -12, -35)

-- 菜单初始化
local function Dropdown_Init_FireTotem()
    for idx, data in pairs(modes_FireTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_FireTotem, index)
                MPShamanHealSaved.FireTotem_Value = modes_FireTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_FireTotem, Dropdown_Init_FireTotem)
UIDropDownMenu_SetSelectedID(dropdown_FireTotem, 1) -- 默认选中第一项







-- 水之图腾
local checkButton_WaterTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_WaterTotem:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 330, postion_y)
checkButton_WaterTotem:SetScale(0.8)

-- 添加文字标签
local checkText_WaterTotem = checkButton_WaterTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WaterTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WaterTotem:SetTextColor(1, 1, 1)
checkText_WaterTotem:SetPoint("LEFT", checkButton_WaterTotem, "LEFT", 34, 1)
checkText_WaterTotem:SetText("水之图腾")

-- 设置点击事件
checkButton_WaterTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.WaterTotem = 1
    else
        MPShamanHealSaved.WaterTotem = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_WaterTotem = {
    [1] = {text = "抗火图腾", value = 1},
    [2] = {text = "治疗之泉图腾", value = 2},
    [3] = {text = "法力之泉图腾", value = 3},
    [4] = {text = "清毒图腾",   value = 4},
    [5] = {text = "祛病图腾",   value = 5},
}

-- 创建下拉菜单
local dropdown_WaterTotem = CreateFrame("Button", ADDON_NAME.."Dropdown_WaterTotem", checkButton_WaterTotem, "UIDropDownMenuTemplate")
dropdown_WaterTotem:SetPoint("TOPLEFT", checkButton_WaterTotem, "TOPLEFT", -12, -35)

-- 菜单初始化
local function Dropdown_Init_WaterTotem()
    for idx, data in pairs(modes_WaterTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, index)
                MPShamanHealSaved.WaterTotem_Value = modes_WaterTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_WaterTotem, Dropdown_Init_WaterTotem)
UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, 1) -- 默认选中第一项





-- 空气图腾
local checkButton_AirTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_AirTotem:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 485, postion_y)
checkButton_AirTotem:SetScale(0.8)

-- 添加文字标签
local checkText_AirTotem = checkButton_AirTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_AirTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_AirTotem:SetTextColor(1, 1, 1)
checkText_AirTotem:SetPoint("LEFT", checkButton_AirTotem, "LEFT", 34, 1)
checkText_AirTotem:SetText("空气图腾")

-- 设置点击事件
checkButton_AirTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.AirTotem = 1
    else
        MPShamanHealSaved.AirTotem = 0
    end
end)

-- 定义选项（带固定索引的表）
local modes_AirTotem = {
    [1] = {text = "根基图腾", value = 1},
    [2] = {text = "自然抗性图腾", value = 2},
    [3] = {text = "风之优雅图腾", value = 3},
    [4] = {text = "风墙图腾",   value = 4},
    [5] = {text = "风怒图腾",   value = 5},
    [6] = {text = "宁静之风图腾",   value = 6},
    -- 这里剔除了 岗哨图腾
}

-- 创建下拉菜单
local dropdown_AirTotem = CreateFrame("Button", ADDON_NAME.."Dropdown_AirTotem", checkButton_AirTotem, "UIDropDownMenuTemplate")
dropdown_AirTotem:SetPoint("TOPLEFT", checkButton_AirTotem, "TOPLEFT", -12, -35)

-- 菜单初始化
local function Dropdown_Init_AirTotem()
    for idx, data in pairs(modes_AirTotem) do
        local info = {}
        info.text = data.text
        info.value = data.value
        info.func = (function(index) 
            return function()
                -- 使用闭包保存的index
                UIDropDownMenu_SetSelectedID(dropdown_AirTotem, index)
                MPShamanHealSaved.AirTotem_Value = modes_AirTotem[index].text
            end
        end)(idx) -- 立即传入当前索引
        UIDropDownMenu_AddButton(info)
    end
end

-- 初始化菜单
UIDropDownMenu_Initialize(dropdown_AirTotem, Dropdown_Init_AirTotem)
UIDropDownMenu_SetSelectedID(dropdown_AirTotem, 1) -- 默认选中第一项




postion_y = postion_y-80

--[[
-- 创建单选框 - 图腾召回
local checkButton_RecallTotems = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_RecallTotems", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_RecallTotems:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
checkButton_RecallTotems:SetScale(0.8)

-- 添加文字标签
local checkText_RecallTotems = checkButton_RecallTotems:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_RecallTotems:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_RecallTotems:SetTextColor(1, 1, 1)
checkText_RecallTotems:SetPoint("LEFT", checkButton_RecallTotems, "LEFT", 34, 1)
checkText_RecallTotems:SetText("自动 图腾召回")


local slider_RecallTotems = CreateFrame("Slider", ADDON_NAME.."Slider_RecallTotems", checkButton_RecallTotems, "OptionsSliderTemplate")
slider_RecallTotems:SetPoint("RIGHT", checkButton_RecallTotems, "RIGHT", 260, -2)
slider_RecallTotems:SetWidth(150) -- 拖动条长度
slider_RecallTotems:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_RecallTotems:SetMinMaxValues(15, 100)
slider_RecallTotems:SetValueStep(1)
slider_RecallTotems:SetValue(30) -- 默认值
MPCatUISliderRegionHide(slider_RecallTotems)

local color_RecallTotems = "|cFFFFD100"

_G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.."30 码距离|r")
_G[slider_RecallTotems:GetName().."Low"]:Hide()
_G[slider_RecallTotems:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_RecallTotems:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPShamanHealSaved.RecallTotems_Value = arg1
    _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanHealSaved.RecallTotems_Value .." 码距离|r")
end)

-- 设置点击事件
checkButton_RecallTotems:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.RecallTotems = 1
        color_RecallTotems = "|cFFFFD100"
        _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanHealSaved.RecallTotems_Value .." 码距离|r")
    else
        MPShamanHealSaved.RecallTotems = 0
        color_RecallTotems = "|cFF888888"
        _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." "..MPShamanHealSaved.RecallTotems_Value .." 码距离|r")
    end
end)

]]

-- 创建单选框 - 强制图腾
local checkButton_ForceTotem = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForceTotem", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_ForceTotem:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 340, postion_y)
checkButton_ForceTotem:SetScale(0.8)

-- 添加文字标签
local checkText_ForceTotem = checkButton_ForceTotem:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ForceTotem:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ForceTotem:SetTextColor(1, 1, 1)
checkText_ForceTotem:SetPoint("LEFT", checkButton_ForceTotem, "LEFT", 34, 1)
checkText_ForceTotem:SetText("开启 强制图腾配置")

-- 设置点击事件
checkButton_ForceTotem:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.ForceTotem = 1
    else
        MPShamanHealSaved.ForceTotem = 0
    end
end)




-- 高级



postion_y = postion_y+50

-- 添加提示内容区域
local TipText1 = CatUISettingsShamanHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-110


-- 创建单选框 - 溢出治疗
local checkButton_Overflow = CreateFrame("CheckButton", ADDON_NAME.."CheckButtonForce", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_Overflow:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
checkButton_Overflow:SetScale(0.8)

-- 添加文字标签
local checkText_Overflow = checkButton_Overflow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Overflow:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Overflow:SetTextColor(1, 1, 1)
checkText_Overflow:SetPoint("LEFT", checkButton_Overflow, "LEFT", 34, 1)
checkText_Overflow:SetText("启用 溢出治疗时打断施法")

-- 设置点击事件
checkButton_Overflow:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.Overflow = 1
    else
        MPShamanHealSaved.Overflow = 0
    end
end)


-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HealthStone", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 340, postion_y)
checkButton_HealthStone:SetScale(0.8)

-- 添加文字标签
local checkText_HealthStone = checkButton_HealthStone:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HealthStone:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HealthStone:SetTextColor(1, 1, 1)
checkText_HealthStone:SetPoint("LEFT", checkButton_HealthStone, "LEFT", 34, 1)
checkText_HealthStone:SetText("自动 治疗石")


local slider_HealthStone = CreateFrame("Slider", ADDON_NAME.."Slider_HealthStone", checkButton_HealthStone, "OptionsSliderTemplate")
slider_HealthStone:SetPoint("RIGHT", checkButton_HealthStone, "RIGHT", 250, -2)
slider_HealthStone:SetWidth(150) -- 拖动条长度
slider_HealthStone:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HealthStone:SetMinMaxValues(0, 100)
slider_HealthStone:SetValueStep(1)
slider_HealthStone:SetValue(30) -- 默认值
MPCatUISliderRegionHide(slider_HealthStone)

local color_HealthStone = "|cFFFFD100"

_G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: 30%|r")
_G[slider_HealthStone:GetName().."Low"]:Hide()
_G[slider_HealthStone:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_HealthStone:SetScript("OnValueChanged", function()
    --print("HealthStone当前值:", arg1)
    MPShamanHealSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanHealSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanHealSaved.HealthStone_Value .."%|r")
    else
        MPShamanHealSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanHealSaved.HealthStone_Value .."%|r")
    end
end)


postion_y = postion_y-40


-- 创建单选框 - 水之护盾 级
local checkButton_WaterShieldLevel = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_WaterShieldLevel:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
checkButton_WaterShieldLevel:SetScale(0.8)

-- 添加文字标签
local checkText_WaterShieldLevel = checkButton_WaterShieldLevel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_WaterShieldLevel:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_WaterShieldLevel:SetTextColor(1, 1, 1)
checkText_WaterShieldLevel:SetPoint("LEFT", checkButton_WaterShieldLevel, "LEFT", 34, 1)
checkText_WaterShieldLevel:SetText("保持 水之护盾层级 (自动识别)")

-- 设置点击事件
checkButton_WaterShieldLevel:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.WaterShieldLevel = 1
    else
        MPShamanHealSaved.WaterShieldLevel = 0
    end
end)



-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTea", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 340, postion_y)
checkButton_HerbalTea:SetScale(0.8)

-- 添加文字标签
local checkText_HerbalTea = checkButton_HerbalTea:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HerbalTea:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HerbalTea:SetTextColor(1, 1, 1)
checkText_HerbalTea:SetPoint("LEFT", checkButton_HerbalTea, "LEFT", 34, 1)
checkText_HerbalTea:SetText("自动 草药茶")


local slider_HerbalTea = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTea", checkButton_HerbalTea, "OptionsSliderTemplate")
slider_HerbalTea:SetPoint("RIGHT", checkButton_HerbalTea, "RIGHT", 250, -2)
slider_HerbalTea:SetWidth(150) -- 拖动条长度
slider_HerbalTea:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HerbalTea:SetMinMaxValues(0, 100)
slider_HerbalTea:SetValueStep(1)
slider_HerbalTea:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTea)

local color_HerbalTea = "|cFFFFD100"

_G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: 20%|r")
_G[slider_HerbalTea:GetName().."Low"]:Hide()
_G[slider_HerbalTea:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_HerbalTea:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPShamanHealSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanHealSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanHealSaved.HerbalTea_Value .."%|r")
    else
        MPShamanHealSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanHealSaved.HerbalTea_Value .."%|r")
    end
end)



postion_y = postion_y - 40



-- 创建单选框 - 草药茶 蓝量
local checkButton_HerbalTeaMana = CreateFrame("CheckButton", ADDON_NAME.."CheckButton_HerbalTeaMana", CatUISettingsShamanHealWindow, "UICheckButtonTemplate")
checkButton_HerbalTeaMana:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 340, postion_y)
checkButton_HerbalTeaMana:SetScale(0.8)

-- 添加文字标签
local checkText_HerbalTeaMana = checkButton_HerbalTeaMana:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_HerbalTeaMana:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_HerbalTeaMana:SetTextColor(1, 1, 1)
checkText_HerbalTeaMana:SetPoint("LEFT", checkButton_HerbalTeaMana, "LEFT", 34, 1)
checkText_HerbalTeaMana:SetText("自动 草药茶")


local slider_HerbalTeaMana = CreateFrame("Slider", ADDON_NAME.."Slider_HerbalTeaMana", checkButton_HerbalTeaMana, "OptionsSliderTemplate")
slider_HerbalTeaMana:SetPoint("RIGHT", checkButton_HerbalTeaMana, "RIGHT", 250, -2)
slider_HerbalTeaMana:SetWidth(150) -- 拖动条长度
slider_HerbalTeaMana:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_HerbalTeaMana:SetMinMaxValues(0, 100)
slider_HerbalTeaMana:SetValueStep(1)
slider_HerbalTeaMana:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_HerbalTeaMana)

local color_HerbalTeaMana = "|cFFFFD100"

_G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: 20%|r")
_G[slider_HerbalTeaMana:GetName().."Low"]:Hide()
_G[slider_HerbalTeaMana:GetName().."High"]:Hide()
-- 值变化时的回调函数
slider_HerbalTeaMana:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPShamanHealSaved.HerbalTeaMana_Value = arg1
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanHealSaved.HerbalTeaMana_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTeaMana:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.HerbalTeaMana = 1
        color_HerbalTeaMana = "|cFFFFD100"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanHealSaved.HerbalTeaMana_Value .."%|r")
    else
        MPShamanHealSaved.HerbalTeaMana = 0
        color_HerbalTeaMana = "|cFF888888"
        _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanHealSaved.HerbalTeaMana_Value .."%|r")
    end
end)

postion_y = postion_y+40+40


-- 治疗波 血线
local slider_Wave_Value = CreateFrame("Slider", ADDON_NAME.."SliderWave_Value", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_Wave_Value:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
slider_Wave_Value:SetWidth(220) -- 拖动条长度
slider_Wave_Value:SetHeight(16) -- 拖动条高度

slider_Wave_Value:SetMinMaxValues(10, 99)
slider_Wave_Value:SetValueStep(1)
slider_Wave_Value:SetValue(60) -- 默认值
MPCatUISliderRegionHide(slider_Wave_Value)

_G[slider_Wave_Value:GetName().."Text"]:SetText("治疗波启动 血线: 60%|r")
_G[slider_Wave_Value:GetName().."Low"]:Hide()
_G[slider_Wave_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Wave_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_Wave_Value:GetName().."Text"]:SetText("治疗波启动 血线："..arg1.."%")
    MPShamanHealSaved.Wave_Value = arg1
end)


postion_y = postion_y-40

-- 次级治疗波 血线
local slider_SecondaryWave_Value = CreateFrame("Slider", ADDON_NAME.."SliderSecondaryWave_Value", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_SecondaryWave_Value:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
slider_SecondaryWave_Value:SetWidth(220) -- 拖动条长度
slider_SecondaryWave_Value:SetHeight(16) -- 拖动条高度

slider_SecondaryWave_Value:SetMinMaxValues(10, 99)
slider_SecondaryWave_Value:SetValueStep(1)
slider_SecondaryWave_Value:SetValue(60) -- 默认值
MPCatUISliderRegionHide(slider_SecondaryWave_Value)

_G[slider_SecondaryWave_Value:GetName().."Text"]:SetText("治疗波启动 血线: 60%|r")
_G[slider_SecondaryWave_Value:GetName().."Low"]:Hide()
_G[slider_SecondaryWave_Value:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_SecondaryWave_Value:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    _G[slider_SecondaryWave_Value:GetName().."Text"]:SetText("次级治疗波启动 血线："..arg1.."%")
    MPShamanHealSaved.SecondaryWave_Value = arg1
end)



postion_y = postion_y-40

-- 治疗链最低等级
local slider_ChainMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderChainMinLevel", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_ChainMinLevel:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
slider_ChainMinLevel:SetWidth(105) -- 拖动条长度
slider_ChainMinLevel:SetHeight(16) -- 拖动条高度

slider_ChainMinLevel:SetMinMaxValues(1, 3)
slider_ChainMinLevel:SetValueStep(1)
slider_ChainMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_ChainMinLevel)

_G[slider_ChainMinLevel:GetName().."Text"]:SetText("治疗链最低1级")

slider_ChainMinLevel:SetScript("OnValueChanged", function()
    MPShamanHealSaved.ChainMinLevel = arg1
    _G[slider_ChainMinLevel:GetName().."Text"]:SetText("治疗链最低"..arg1.."级")
end)
-- 治疗链最高等级
local slider_ChainMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderChainMaxLevel", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_ChainMaxLevel:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 135, postion_y)
slider_ChainMaxLevel:SetWidth(105) -- 拖动条长度
slider_ChainMaxLevel:SetHeight(16) -- 拖动条高度

slider_ChainMaxLevel:SetMinMaxValues(1, 3)
slider_ChainMaxLevel:SetValueStep(1)
slider_ChainMaxLevel:SetValue(3) -- 默认值
MPCatUISliderRegionHide(slider_ChainMaxLevel)

_G[slider_ChainMaxLevel:GetName().."Text"]:SetText("治疗链最高3级")

slider_ChainMaxLevel:SetScript("OnValueChanged", function()
    MPShamanHealSaved.ChainMaxLevel = arg1
    _G[slider_ChainMaxLevel:GetName().."Text"]:SetText("治疗链最高"..arg1.."级")
end)


postion_y = postion_y-40

-- 次级治疗波最低等级
local slider_SecondaryWaveMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderSecondaryWaveMinLevel", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_SecondaryWaveMinLevel:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
slider_SecondaryWaveMinLevel:SetWidth(105) -- 拖动条长度
slider_SecondaryWaveMinLevel:SetHeight(16) -- 拖动条高度

slider_SecondaryWaveMinLevel:SetMinMaxValues(1, 6)
slider_SecondaryWaveMinLevel:SetValueStep(1)
slider_SecondaryWaveMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_SecondaryWaveMinLevel)

_G[slider_SecondaryWaveMinLevel:GetName().."Text"]:SetText("次级波最低1级")

slider_SecondaryWaveMinLevel:SetScript("OnValueChanged", function()
    MPShamanHealSaved.SecondaryWaveMinLevel = arg1
    _G[slider_SecondaryWaveMinLevel:GetName().."Text"]:SetText("次级波最低"..arg1.."级")
end)
-- 次级治疗波最高等级
local slider_SecondaryWaveMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderSecondaryWaveMaxLevel", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_SecondaryWaveMaxLevel:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 135, postion_y)
slider_SecondaryWaveMaxLevel:SetWidth(105) -- 拖动条长度
slider_SecondaryWaveMaxLevel:SetHeight(16) -- 拖动条高度

slider_SecondaryWaveMaxLevel:SetMinMaxValues(1, 6)
slider_SecondaryWaveMaxLevel:SetValueStep(1)
slider_SecondaryWaveMaxLevel:SetValue(6) -- 默认值
MPCatUISliderRegionHide(slider_SecondaryWaveMaxLevel)

_G[slider_SecondaryWaveMaxLevel:GetName().."Text"]:SetText("次级波最高6级")

slider_SecondaryWaveMaxLevel:SetScript("OnValueChanged", function()
    MPShamanHealSaved.SecondaryWaveMaxLevel = arg1
    _G[slider_SecondaryWaveMaxLevel:GetName().."Text"]:SetText("次级波最高"..arg1.."级")
end)


postion_y = postion_y-40

-- 治疗波最低等级
local slider_WaveMinLevel = CreateFrame("Slider", ADDON_NAME.."SliderWaveMinLevel", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_WaveMinLevel:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 20, postion_y)
slider_WaveMinLevel:SetWidth(105) -- 拖动条长度
slider_WaveMinLevel:SetHeight(16) -- 拖动条高度

slider_WaveMinLevel:SetMinMaxValues(1, 10)
slider_WaveMinLevel:SetValueStep(1)
slider_WaveMinLevel:SetValue(1) -- 默认值
MPCatUISliderRegionHide(slider_WaveMinLevel)

_G[slider_WaveMinLevel:GetName().."Text"]:SetText("治疗波最低1级")

slider_WaveMinLevel:SetScript("OnValueChanged", function()
    MPShamanHealSaved.WaveMinLevel = arg1
    _G[slider_WaveMinLevel:GetName().."Text"]:SetText("治疗波最低"..arg1.."级")
end)
-- 治疗波最高等级
local slider_WaveMaxLevel = CreateFrame("Slider", ADDON_NAME.."SliderWaveMaxLevel", CatUISettingsShamanHealWindow, "OptionsSliderTemplate")
slider_WaveMaxLevel:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 135, postion_y)
slider_WaveMaxLevel:SetWidth(105) -- 拖动条长度
slider_WaveMaxLevel:SetHeight(16) -- 拖动条高度

slider_WaveMaxLevel:SetMinMaxValues(1, 10)
slider_WaveMaxLevel:SetValueStep(1)
slider_WaveMaxLevel:SetValue(10) -- 默认值
MPCatUISliderRegionHide(slider_WaveMaxLevel)

_G[slider_WaveMaxLevel:GetName().."Text"]:SetText("治疗波最高10级")

slider_WaveMaxLevel:SetScript("OnValueChanged", function()
    MPShamanHealSaved.WaveMaxLevel = arg1
    _G[slider_WaveMaxLevel:GetName().."Text"]:SetText("治疗波最高"..arg1.."级")
end)




-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsShamanHealWindow, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsShamanHealWindow, "TOPLEFT", 120, -44)
myButton:SetWidth(100)
myButton:SetHeight(22)
myButton:SetFont("Fonts\\FRIZQT__.TTF", 12)
myButton:SetText("恢复默认值")

-- 调整按钮纹理
myButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
myButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
myButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
myButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
-- 按钮点击事件
myButton:SetScript("OnClick", function()
    MPResetShamanHealSettings()
    MPInitShamanHealSettings()
end)



-- 添加分隔线
MPBottomLine(CatUISettingsShamanHealWindow)

local checkButton_Power = MPPublicCheckButton(CatUISettingsShamanHealWindow, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.Power = 1
    else
        MPShamanHealSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsShamanHealWindow, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsShamanHealWindow, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPShamanHealSaved.Pick = 1
    else
        MPShamanHealSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsShamanHealWindow, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)

-- 添加提示内容区域
local TipText = CatUISettingsShamanHealWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsShamanHealWindow, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFF0070DE/sheal|r ]")



-- 配置文件版本号
local ShamanHealSettingsUIVersion = 24

function MPResetShamanHealSettings()

    MPShamanHealSaved.Version = ShamanHealSettingsUIVersion

    -- 基本配置

    MPShamanHealSaved.Wave = 0
    MPShamanHealSaved.SecondaryWave = 0
    MPShamanHealSaved.Chain = 1
    MPShamanHealSaved.WaterShield = 1

    MPShamanHealSaved.Tip = 1
    MPShamanHealSaved.TargetFirst = 1
    MPShamanHealSaved.TargetTarget = 1
    MPShamanHealSaved.SelfFirst = 0
    MPShamanHealSaved.ScanTeam = 1
    MPShamanHealSaved.ScanTeam_Low = 1
    MPShamanHealSaved.ScanTeam_Rand = 0

    MPShamanHealSaved.Begin_Value = 99.5

    MPShamanHealSaved.EarthTotem = 1
    MPShamanHealSaved.EarthTotem_Value = "大地之力图腾"
    MPShamanHealSaved.FireTotem = 1
    MPShamanHealSaved.FireTotem_Value = "火舌图腾"
    MPShamanHealSaved.WaterTotem = 1
    MPShamanHealSaved.WaterTotem_Value = "法力之泉图腾"
    MPShamanHealSaved.AirTotem = 1
    MPShamanHealSaved.AirTotem_Value = "风怒图腾"

    MPShamanHealSaved.RecallTotems = 1
    MPShamanHealSaved.RecallTotems_Value = 40

    MPShamanHealSaved.ForceTotem = 0

    -- 高级配置

    -- 治疗石、糖水茶
    MPShamanHealSaved.HealthStone = 1
    MPShamanHealSaved.HealthStone_Value = 30
    MPShamanHealSaved.HerbalTea = 1
    MPShamanHealSaved.HerbalTea_Value = 20
    MPShamanHealSaved.HerbalTeaMana = 0
    MPShamanHealSaved.HerbalTeaMana_Value = 20

    -- SuperWoW,UnitXP
    MPShamanHealSaved.SuperWoW = 1
    MPShamanHealSaved.UnitXP = 1

    MPShamanHealSaved.Overflow = 0

    MPShamanHealSaved.Wave_Value = 60
    MPShamanHealSaved.SecondaryWave_Value = 90
    MPShamanHealSaved.WaterShieldLevel = 0

    MPShamanHealSaved.ChainMinLevel = 1
    MPShamanHealSaved.ChainMaxLevel = 3
    MPShamanHealSaved.SecondaryWaveMinLevel = 1
    MPShamanHealSaved.SecondaryWaveMaxLevel = 6
    MPShamanHealSaved.WaveMinLevel = 1
    MPShamanHealSaved.WaveMaxLevel = 10

    -- 通用
    MPShamanHealSaved.Power = 0
    MPShamanHealSaved.Pick = 0

end


function InitShamanHealSettingsPart1()
    checkButton_Wave:SetChecked(ToBoolean(MPShamanHealSaved.Wave))
    checkButton_SecondaryWave:SetChecked( ToBoolean(MPShamanHealSaved.SecondaryWave) )
    checkButton_Chain:SetChecked( ToBoolean(MPShamanHealSaved.Chain) )
    checkButton_WaterShield:SetChecked( ToBoolean(MPShamanHealSaved.WaterShield) )

    checkButton_TargetFirst:SetChecked(ToBoolean(MPShamanHealSaved.TargetFirst))
    checkButton_TargetTarget:SetChecked(ToBoolean(MPShamanHealSaved.TargetTarget))
    checkButton_SelfFirst:SetChecked(ToBoolean(MPShamanHealSaved.SelfFirst))
    checkButton_ScanTeam:SetChecked(ToBoolean(MPShamanHealSaved.ScanTeam))
    checkButton_ScanTeam_Low:SetChecked(ToBoolean(MPShamanHealSaved.ScanTeam_Low))
    checkButton_ScanTeam_Rand:SetChecked(ToBoolean(MPShamanHealSaved.ScanTeam_Rand))
    checkButton_Tip:SetChecked(ToBoolean(MPShamanHealSaved.Tip))

    checkButton_Overflow:SetChecked(ToBoolean(MPShamanHealSaved.Overflow))
    checkButton_WaterShieldLevel:SetChecked(ToBoolean(MPShamanHealSaved.WaterShieldLevel))

    checkButton_Power:SetChecked(ToBoolean(MPShamanHealSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPShamanHealSaved.Pick))

    slider_ChainMinLevel:SetValue(MPShamanHealSaved.ChainMinLevel)
    slider_ChainMaxLevel:SetValue(MPShamanHealSaved.ChainMaxLevel)
    slider_SecondaryWaveMinLevel:SetValue(MPShamanHealSaved.SecondaryWaveMinLevel)
    slider_SecondaryWaveMaxLevel:SetValue(MPShamanHealSaved.SecondaryWaveMaxLevel)
    slider_WaveMinLevel:SetValue(MPShamanHealSaved.WaveMinLevel)
    slider_WaveMaxLevel:SetValue(MPShamanHealSaved.WaveMaxLevel)
end

function MPInitShamanHealSettings()
    if not MPShamanHealSaved then
        MPShamanHealSaved = {}
        MPResetShamanHealSettings()
    end

    if MPShamanHealSaved.Version ~= ShamanHealSettingsUIVersion then
        MPResetShamanHealSettings()
    end

    InitShamanHealSettingsPart1()

    checkButton_HealthStone:SetChecked(ToBoolean(MPShamanHealSaved.HealthStone))
    slider_HealthStone:SetValue(MPShamanHealSaved.HealthStone_Value)
    if MPShamanHealSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPShamanHealSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPShamanHealSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPShamanHealSaved.HerbalTea_Value)
    if MPShamanHealSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPShamanHealSaved.HerbalTea_Value .."%|r")

    checkButton_HerbalTeaMana:SetChecked(MPShamanHealSaved.HerbalTeaMana)
    slider_HerbalTeaMana:SetValue(MPShamanHealSaved.HerbalTeaMana_Value)
    if MPShamanHealSaved.HerbalTeaMana==1 then
        color_HerbalTeaMana = "|cFFFFD100"
    else
        color_HerbalTeaMana = "|cFF888888"
    end
    _G[slider_HerbalTeaMana:GetName().."Text"]:SetText(color_HerbalTeaMana.."蓝量: ".. MPShamanHealSaved.HerbalTeaMana_Value .."%|r")



    slider_Wave_Value:SetValue(MPShamanHealSaved.Wave_Value)
    slider_SecondaryWave_Value:SetValue(MPShamanHealSaved.SecondaryWave_Value)


    checkButton_EarthTotem:SetChecked(ToBoolean(MPShamanHealSaved.EarthTotem))
    for idx_EarthTotem, data_EarthTotem in pairs(modes_EarthTotem) do
        if string.find(data_EarthTotem.text, MPShamanHealSaved.EarthTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_EarthTotem, data_EarthTotem.value)
            _G[dropdown_EarthTotem:GetName().."Text"]:SetText(data_EarthTotem.text)
        end
    end

    checkButton_FireTotem:SetChecked(ToBoolean(MPShamanHealSaved.FireTotem))
    for idx_FireTotem, data_FireTotem in pairs(modes_FireTotem) do
        if string.find(data_FireTotem.text, MPShamanHealSaved.FireTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_FireTotem, data_FireTotem.value)
            _G[dropdown_FireTotem:GetName().."Text"]:SetText(data_FireTotem.text)
        end
    end

    checkButton_WaterTotem:SetChecked(ToBoolean(MPShamanHealSaved.WaterTotem))
    for idx_WaterTotem, data_WaterTotem in pairs(modes_WaterTotem) do
        if string.find(data_WaterTotem.text, MPShamanHealSaved.WaterTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_WaterTotem, data_WaterTotem.value)
            _G[dropdown_WaterTotem:GetName().."Text"]:SetText(data_WaterTotem.text)
        end
    end

    checkButton_AirTotem:SetChecked(ToBoolean(MPShamanHealSaved.AirTotem))
    for idx_AirTotem, data_AirTotem in pairs(modes_AirTotem) do
        if string.find(data_AirTotem.text, MPShamanHealSaved.AirTotem_Value) then
            UIDropDownMenu_SetSelectedID(dropdown_AirTotem, data_AirTotem.value)
            _G[dropdown_AirTotem:GetName().."Text"]:SetText(data_AirTotem.text)
        end
    end


    --[[]
    checkButton_RecallTotems:SetChecked(MPShamanHealSaved.RecallTotems)
    slider_RecallTotems:SetValue(MPShamanHealSaved.RecallTotems_Value)
    if MPShamanHealSaved.RecallTotems==1 then
        color_RecallTotems = "|cFFFFD100"
    else
        color_RecallTotems = "|cFF888888"
    end
    _G[slider_RecallTotems:GetName().."Text"]:SetText(color_RecallTotems.." ".. MPShamanHealSaved.RecallTotems_Value .." 码距离|r")
    ]]

    checkButton_ForceTotem:SetChecked(ToBoolean(MPShamanHealSaved.ForceTotem))

    slider_Begin_Value:SetValue(MPShamanHealSaved.Begin_Value)


end

