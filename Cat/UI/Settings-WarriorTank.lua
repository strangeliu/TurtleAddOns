
-- 定义插件名称
local ADDON_NAME = "Settings-WarriorTank"


-- 创建主框架
CatUISettingsWarriorTank = MPCreateFrame(ADDON_NAME.."Frame", 520, 660, "|cFFC79C6E设置 - 防战|r")

local postion_y = -50

-- 添加提示内容区域
local TipText = CatUISettingsWarriorTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 20, postion_y)
TipText:SetWidth(250)
TipText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText:SetTextColor(1, 0.8, 0)
TipText:SetJustifyH("LEFT")
TipText:SetText("基本配置")






local postion_y = postion_y-40


-- 创建单选框 - 防御姿态
local checkButton_Defensive = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "保持 防御姿态")
checkButton_Defensive:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Defensive = 1
    else
        MPWarriorTankSaved.Defensive = 0
    end
end)



-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Trinket_Upper = 1
    else
        MPWarriorTankSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.TUBoss = 1
    else
        MPWarriorTankSaved.TUBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 战斗怒吼
local checkButton_BattleShout = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "保持 战斗怒吼")
checkButton_BattleShout:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.BattleShout = 1
    else
        MPWarriorTankSaved.BattleShout = 0
    end
end)


-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Trinket_Below = 1
    else
        MPWarriorTankSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButtonSmall(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 520, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.TBBoss = 1
    else
        MPWarriorTankSaved.TBBoss = 0
    end
end)




postion_y = postion_y-30

-- 创建单选框 - 挫志怒吼
local checkButton_Demoralizing = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "保持 挫志怒吼")
checkButton_Demoralizing:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Demoralizing = 1
    else
        MPWarriorTankSaved.Demoralizing = 0
    end
end)


-- 创建单选框 - 自动锁敌
local checkButton_Target = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_Target:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
checkButton_Target:SetScale(0.8)

-- 添加文字标签
local checkText_Target = checkButton_Target:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Target:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Target:SetTextColor(1, 1, 1)
checkText_Target:SetPoint("LEFT", checkButton_Target, "LEFT", 34, 1)
checkText_Target:SetText("自动锁敌 (攻击最近的敌人)")

-- 设置点击事件
checkButton_Target:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Target = 1
    else
        MPWarriorTankSaved.Target = 0
    end
end)

postion_y = postion_y-30

-- 创建单选框 - 血性狂暴
local checkButton_BerserkerRage = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 血性狂暴")
checkButton_BerserkerRage:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.BerserkerRage = 1
    else
        MPWarriorTankSaved.BerserkerRage = 0
    end
end)





-- 创建单选框 - 单体/群体
local checkButton_NearbyEnemies = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_NearbyEnemies:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
checkButton_NearbyEnemies:SetScale(0.8)

-- 添加文字标签
local checkText_NearbyEnemies = checkButton_NearbyEnemies:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_NearbyEnemies:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_NearbyEnemies:SetTextColor(1, 1, 1)
checkText_NearbyEnemies:SetPoint("LEFT", checkButton_NearbyEnemies, "LEFT", 34, 1)
checkText_NearbyEnemies:SetText("自动判断 单体/群体 (SuperWoW)")

-- 设置点击事件
checkButton_NearbyEnemies:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.NearbyEnemies = 1
    else
        MPWarriorTankSaved.NearbyEnemies = 0
    end
end)



postion_y = postion_y-30

-- 创建单选框 - 雷霆一击
local checkButton_ThunderClap = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 雷霆一击")
checkButton_ThunderClap:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.ThunderClap = 1
    else
        MPWarriorTankSaved.ThunderClap = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 复仇
local checkButton_Revenge = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 复仇")
checkButton_Revenge:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Revenge = 1
    else
        MPWarriorTankSaved.Revenge = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 震荡猛击
local checkButton_Shockwave = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 震荡猛击")
checkButton_Shockwave:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Shockwave = 1
    else
        MPWarriorTankSaved.Shockwave = 0
    end
end)


postion_y = postion_y-30

-- 创建单选框 - 破甲攻击
local checkButton_SunderArmor = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "开启 破甲攻击")
checkButton_SunderArmor:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.SunderArmor = 1
    else
        MPWarriorTankSaved.SunderArmor = 0
    end
end)






-- 高级


postion_y = postion_y+20

-- 添加提示内容区域
local TipText1 = CatUISettingsWarriorTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText1:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 20, postion_y)
TipText1:SetWidth(250)
TipText1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TipText1:SetTextColor(1, 0.8, 0)
TipText1:SetJustifyH("LEFT")
TipText1:SetText("高级配置")


postion_y = postion_y-100


-- 创建单选框 - 自动打断
local checkButton_Interrupt = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "自动 打断读条 (SuperWoW)")
checkButton_Interrupt:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Interrupt = 1
    else
        MPWarriorTankSaved.Interrupt = 0
    end
end)



-- 创建单选框 - 治疗石
local checkButton_HealthStone = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_HealthStone:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
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
    MPWarriorTankSaved.HealthStone_Value = arg1
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorTankSaved.HealthStone_Value .."%|r")
end)

-- 设置点击事件
checkButton_HealthStone:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.HealthStone = 1
        color_HealthStone = "|cFFFFD100"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorTankSaved.HealthStone_Value .."%|r")
    else
        MPWarriorTankSaved.HealthStone = 0
        color_HealthStone = "|cFF888888"
        _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorTankSaved.HealthStone_Value .."%|r")
    end
end)



postion_y = postion_y-40


-- 创建单选框 - 压制
local checkButton_Overpower = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_Overpower:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 20, postion_y)
checkButton_Overpower:SetScale(0.8)

-- 添加文字标签
local checkText_Overpower = checkButton_Overpower:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Overpower:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Overpower:SetTextColor(1, 1, 1)
checkText_Overpower:SetPoint("LEFT", checkButton_Overpower, "LEFT", 34, 1)
checkText_Overpower:SetText("自动 压制")


local slider_Overpower = CreateFrame("Slider", ADDON_NAME.."Slider_Overpower", checkButton_Overpower, "OptionsSliderTemplate")
slider_Overpower:SetPoint("RIGHT", checkButton_Overpower, "RIGHT", 244, -2)
slider_Overpower:SetWidth(160) -- 拖动条长度
slider_Overpower:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Overpower:SetMinMaxValues(10, 100)
slider_Overpower:SetValueStep(1)
slider_Overpower:SetValue(90) -- 默认值
MPCatUISliderRegionHide(slider_Overpower)

local color_Overpower = "|cFFFFD100"

_G[slider_Overpower:GetName().."Text"]:SetText("")
_G[slider_Overpower:GetName().."Low"]:Hide()
_G[slider_Overpower:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Overpower:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorTankSaved.Overpower_Value = arg1
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. arg1)
end)

-- 设置点击事件
checkButton_Overpower:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Overpower = 1
        color_Overpower = "|cFFFFD100"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorTankSaved.Overpower_Value)
    else
        MPWarriorTankSaved.Overpower = 0
        color_Overpower = "|cFF888888"
        _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorTankSaved.Overpower_Value)
    end
end)


-- 创建单选框 - 草药茶
local checkButton_HerbalTea = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_HerbalTea:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
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
    MPWarriorTankSaved.HerbalTea_Value = arg1
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorTankSaved.HerbalTea_Value .."%|r")
end)

-- 设置点击事件
checkButton_HerbalTea:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.HerbalTea = 1
        color_HerbalTea = "|cFFFFD100"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorTankSaved.HerbalTea_Value .."%|r")
    else
        MPWarriorTankSaved.HerbalTea = 0
        color_HerbalTea = "|cFF888888"
        _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorTankSaved.HerbalTea_Value .."%|r")
    end
end)




postion_y = postion_y-40


-- 创建单选框 - 取消拯救
local checkButton_UnSalvation = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, postion_y, "自动取消 拯救祝福")
checkButton_UnSalvation:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.UnSalvation = 1
    else
        MPWarriorTankSaved.UnSalvation = 0
    end
end)



-- 创建单选框 - 鞭根块茎
local checkButton_Carrot = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_Carrot:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
checkButton_Carrot:SetScale(0.8)

-- 添加文字标签
local checkText_Carrot = checkButton_Carrot:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_Carrot:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_Carrot:SetTextColor(1, 1, 1)
checkText_Carrot:SetPoint("LEFT", checkButton_Carrot, "LEFT", 34, 1)
checkText_Carrot:SetText("自动 鞭根块茎")


local slider_Carrot = CreateFrame("Slider", ADDON_NAME.."Slider_Carrot", checkButton_Carrot, "OptionsSliderTemplate")
slider_Carrot:SetPoint("RIGHT", checkButton_Carrot, "RIGHT", 250, -2)
slider_Carrot:SetWidth(150) -- 拖动条长度
slider_Carrot:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_Carrot:SetMinMaxValues(0, 100)
slider_Carrot:SetValueStep(1)
slider_Carrot:SetValue(80) -- 默认值
MPCatUISliderRegionHide(slider_Carrot)

local color_Carrot = "|cFFFFD100"

_G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: 80%|r")
_G[slider_Carrot:GetName().."Low"]:Hide()
_G[slider_Carrot:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_Carrot:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorTankSaved.Carrot_Value = arg1
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorTankSaved.Carrot_Value .."%|r")
end)

-- 设置点击事件
checkButton_Carrot:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Carrot = 1
        color_Carrot = "|cFFFFD100"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorTankSaved.Carrot_Value .."%|r")
    else
        MPWarriorTankSaved.Carrot = 0
        color_Carrot = "|cFF888888"
        _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorTankSaved.Carrot_Value .."%|r")
    end
end)




postion_y = postion_y-40

-- 创建单选框 - 盾牌格挡
local checkButton_ShieldBlock = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_ShieldBlock:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
checkButton_ShieldBlock:SetScale(0.8)

-- 添加文字标签
local checkText_ShieldBlock = checkButton_ShieldBlock:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ShieldBlock:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ShieldBlock:SetTextColor(1, 1, 1)
checkText_ShieldBlock:SetPoint("LEFT", checkButton_ShieldBlock, "LEFT", 34, 1)
checkText_ShieldBlock:SetText("自动 盾牌格挡")


local slider_ShieldBlock = CreateFrame("Slider", ADDON_NAME.."Slider_ShieldBlock", checkButton_ShieldBlock, "OptionsSliderTemplate")
slider_ShieldBlock:SetPoint("RIGHT", checkButton_ShieldBlock, "RIGHT", 250, -2)
slider_ShieldBlock:SetWidth(150) -- 拖动条长度
slider_ShieldBlock:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_ShieldBlock:SetMinMaxValues(0, 100)
slider_ShieldBlock:SetValueStep(1)
slider_ShieldBlock:SetValue(80) -- 默认值
MPCatUISliderRegionHide(slider_ShieldBlock)

local color_ShieldBlock = "|cFFFFD100"

_G[slider_ShieldBlock:GetName().."Text"]:SetText(color_ShieldBlock.."血线: 80%|r")
_G[slider_ShieldBlock:GetName().."Low"]:Hide()
_G[slider_ShieldBlock:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_ShieldBlock:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorTankSaved.ShieldBlock_Value = arg1
    _G[slider_ShieldBlock:GetName().."Text"]:SetText(color_ShieldBlock.."血线: ".. MPWarriorTankSaved.ShieldBlock_Value .."%|r")
end)

-- 设置点击事件
checkButton_ShieldBlock:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.ShieldBlock = 1
        color_ShieldBlock = "|cFFFFD100"
        _G[slider_ShieldBlock:GetName().."Text"]:SetText(color_ShieldBlock.."血线: ".. MPWarriorTankSaved.ShieldBlock_Value .."%|r")
    else
        MPWarriorTankSaved.ShieldBlock = 0
        color_ShieldBlock = "|cFF888888"
        _G[slider_ShieldBlock:GetName().."Text"]:SetText(color_ShieldBlock.."血线: ".. MPWarriorTankSaved.ShieldBlock_Value .."%|r")
    end
end)




postion_y = postion_y-40

-- 创建单选框 - 破釜沉舟
local checkButton_LastStand = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_LastStand:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
checkButton_LastStand:SetScale(0.8)

-- 添加文字标签
local checkText_LastStand = checkButton_LastStand:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LastStand:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LastStand:SetTextColor(1, 1, 1)
checkText_LastStand:SetPoint("LEFT", checkButton_LastStand, "LEFT", 34, 1)
checkText_LastStand:SetText("自动 破釜沉舟")


local slider_LastStand = CreateFrame("Slider", ADDON_NAME.."Slider_LastStand", checkButton_LastStand, "OptionsSliderTemplate")
slider_LastStand:SetPoint("RIGHT", checkButton_LastStand, "RIGHT", 250, -2)
slider_LastStand:SetWidth(150) -- 拖动条长度
slider_LastStand:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_LastStand:SetMinMaxValues(0, 100)
slider_LastStand:SetValueStep(1)
slider_LastStand:SetValue(15) -- 默认值
MPCatUISliderRegionHide(slider_LastStand)

local color_LastStand = "|cFFFFD100"

_G[slider_LastStand:GetName().."Text"]:SetText(color_LastStand.."血线: 15%|r")
_G[slider_LastStand:GetName().."Low"]:Hide()
_G[slider_LastStand:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_LastStand:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorTankSaved.LastStand_Value = arg1
    _G[slider_LastStand:GetName().."Text"]:SetText(color_LastStand.."血线: ".. MPWarriorTankSaved.LastStand_Value .."%|r")
end)

-- 设置点击事件
checkButton_LastStand:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.LastStand = 1
        color_LastStand = "|cFFFFD100"
        _G[slider_LastStand:GetName().."Text"]:SetText(color_LastStand.."血线: ".. MPWarriorTankSaved.LastStand_Value .."%|r")
    else
        MPWarriorTankSaved.LastStand = 0
        color_LastStand = "|cFF888888"
        _G[slider_LastStand:GetName().."Text"]:SetText(color_LastStand.."血线: ".. MPWarriorTankSaved.LastStand_Value .."%|r")
    end
end)



postion_y = postion_y-40

-- 创建单选框 - 盾墙
local checkButton_ShieldWall = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_ShieldWall:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
checkButton_ShieldWall:SetScale(0.8)

-- 添加文字标签
local checkText_ShieldWall = checkButton_ShieldWall:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_ShieldWall:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_ShieldWall:SetTextColor(1, 1, 1)
checkText_ShieldWall:SetPoint("LEFT", checkButton_ShieldWall, "LEFT", 34, 1)
checkText_ShieldWall:SetText("自动 盾墙")


local slider_ShieldWall = CreateFrame("Slider", ADDON_NAME.."Slider_ShieldWall", checkButton_ShieldWall, "OptionsSliderTemplate")
slider_ShieldWall:SetPoint("RIGHT", checkButton_ShieldWall, "RIGHT", 250, -2)
slider_ShieldWall:SetWidth(150) -- 拖动条长度
slider_ShieldWall:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_ShieldWall:SetMinMaxValues(0, 100)
slider_ShieldWall:SetValueStep(1)
slider_ShieldWall:SetValue(20) -- 默认值
MPCatUISliderRegionHide(slider_ShieldWall)

local color_ShieldWall = "|cFFFFD100"

_G[slider_ShieldWall:GetName().."Text"]:SetText(color_ShieldWall.."血线: 20%|r")
_G[slider_ShieldWall:GetName().."Low"]:Hide()
_G[slider_ShieldWall:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_ShieldWall:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorTankSaved.ShieldWall_Value = arg1
    _G[slider_ShieldWall:GetName().."Text"]:SetText(color_ShieldWall.."血线: ".. MPWarriorTankSaved.ShieldWall_Value .."%|r")
end)

-- 设置点击事件
checkButton_ShieldWall:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.ShieldWall = 1
        color_ShieldWall = "|cFFFFD100"
        _G[slider_ShieldWall:GetName().."Text"]:SetText(color_ShieldWall.."血线: ".. MPWarriorTankSaved.ShieldWall_Value .."%|r")
    else
        MPWarriorTankSaved.ShieldWall = 0
        color_ShieldWall = "|cFF888888"
        _G[slider_ShieldWall:GetName().."Text"]:SetText(color_ShieldWall.."血线: ".. MPWarriorTankSaved.ShieldWall_Value .."%|r")
    end
end)


postion_y = postion_y-40

-- 创建单选框 - 生命宝石
local checkButton_LifeJewel = CreateFrame("CheckButton", ADDON_NAME.."CheckButton", CatUISettingsWarriorTank, "UICheckButtonTemplate")
checkButton_LifeJewel:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 340, postion_y)
checkButton_LifeJewel:SetScale(0.8)

-- 添加文字标签
local checkText_LifeJewel = checkButton_LifeJewel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
checkText_LifeJewel:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
checkText_LifeJewel:SetTextColor(1, 1, 1)
checkText_LifeJewel:SetPoint("LEFT", checkButton_LifeJewel, "LEFT", 34, 1)
checkText_LifeJewel:SetText("自动 生命宝石")


local slider_LifeJewel = CreateFrame("Slider", ADDON_NAME.."Slider_LifeJewel​", checkButton_LifeJewel, "OptionsSliderTemplate")
slider_LifeJewel:SetPoint("RIGHT", checkButton_LifeJewel, "RIGHT", 250, -2)
slider_LifeJewel:SetWidth(150) -- 拖动条长度
slider_LifeJewel:SetHeight(16) -- 拖动条高度

-- 设置数值范围（最小值0，最大值100，步长1）
slider_LifeJewel:SetMinMaxValues(0, 100)
slider_LifeJewel:SetValueStep(1)
slider_LifeJewel:SetValue(30) -- 默认值
MPCatUISliderRegionHide(slider_LifeJewel)

local color_LifeJewel = "|cFFFFD100"

_G[slider_LifeJewel:GetName().."Text"]:SetText(color_LifeJewel.."血线: 30%|r")
_G[slider_LifeJewel:GetName().."Low"]:Hide()
_G[slider_LifeJewel:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_LifeJewel:SetScript("OnValueChanged", function()
    --print("HerbalTea当前值:", arg1)
    MPWarriorTankSaved.LifeJewel_Value = arg1
    _G[slider_LifeJewel:GetName().."Text"]:SetText(color_LifeJewel.."血线: ".. MPWarriorTankSaved.LifeJewel_Value .."%|r")
end)

-- 设置点击事件
checkButton_LifeJewel:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.LifeJewel = 1
        color_LifeJewel = "|cFFFFD100"
        _G[slider_LifeJewel:GetName().."Text"]:SetText(color_LifeJewel.."血线: ".. MPWarriorTankSaved.LifeJewel_Value .."%|r")
    else
        MPWarriorTankSaved.LifeJewel = 0
        color_LifeJewel = "|cFF888888"
        _G[slider_LifeJewel:GetName().."Text"]:SetText(color_LifeJewel.."血线: ".. MPWarriorTankSaved.LifeJewel_Value .."%|r")
    end
end)


postion_y = postion_y - 40

-- 魂能之速
local checkButton_Soulspeed = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButtonSoulspeed", 340, postion_y, "自动 魂能之速 (BOSS时)")
checkButton_Soulspeed:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Soulspeed = 1
    else
        MPWarriorTankSaved.Soulspeed = 0
    end
end)


postion_y = postion_y - 40

-- 创建单选框 - 种族天赋
local checkButton_RacialTraits = MPCreateCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 340, postion_y, "自动 种族天赋 (爆发类)")
checkButton_RacialTraits:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.RacialTraits = 1
    else
        MPWarriorTankSaved.RacialTraits = 0
    end
end)



postion_y = postion_y+40+40+40+40+40+40+40

-- 英勇/顺劈
local slider_HeroicStrike = CreateFrame("Slider", ADDON_NAME.."SliderHeroicStrike", CatUISettingsWarriorTank, "OptionsSliderTemplate")
slider_HeroicStrike:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 20, postion_y)
slider_HeroicStrike:SetWidth(220) -- 拖动条长度
slider_HeroicStrike:SetHeight(16) -- 拖动条高度

slider_HeroicStrike:SetMinMaxValues(10, 100)
slider_HeroicStrike:SetValueStep(1)
slider_HeroicStrike:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_HeroicStrike)

_G[slider_HeroicStrike:GetName().."Text"]:SetText("")
_G[slider_HeroicStrike:GetName().."Low"]:Hide()
_G[slider_HeroicStrike:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_HeroicStrike:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    MPWarriorTankSaved.HeroicStrike = arg1
    _G[slider_HeroicStrike:GetName().."Text"]:SetText("英勇/顺劈 >"..arg1.." 怒气")
end)

postion_y = postion_y - 40


-- 破甲
local slider_SunderArmor = CreateFrame("Slider", ADDON_NAME.."SliderSunderArmor", CatUISettingsWarriorTank, "OptionsSliderTemplate")
slider_SunderArmor:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 20, postion_y)
slider_SunderArmor:SetWidth(220) -- 拖动条长度
slider_SunderArmor:SetHeight(16) -- 拖动条高度

slider_SunderArmor:SetMinMaxValues(1, 100)
slider_SunderArmor:SetValueStep(1)
slider_SunderArmor:SetValue(50) -- 默认值
MPCatUISliderRegionHide(slider_SunderArmor)

_G[slider_SunderArmor:GetName().."Text"]:SetText("")
_G[slider_SunderArmor:GetName().."Low"]:Hide()
_G[slider_SunderArmor:GetName().."High"]:Hide()

-- 值变化时的回调函数
slider_SunderArmor:SetScript("OnValueChanged", function()
    --print("Ferocious当前值:", arg1)
    MPWarriorTankSaved.SunderArmor_Value = arg1
    _G[slider_SunderArmor:GetName().."Text"]:SetText("破甲攻击 >"..arg1.." 怒气")
end)







-- 创建按钮
local myButton = CreateFrame("Button", ADDON_NAME.."ButtonReset", CatUISettingsWarriorTank, "UIPanelButtonTemplate")
myButton:SetPoint("TOPLEFT", CatUISettingsWarriorTank, "TOPLEFT", 120, -44)
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
    MPResetWarriorTankSettings()
    MPInitWarriorTankSettings()
end)




-- 添加分隔线
MPBottomLine(CatUISettingsWarriorTank)

local checkButton_Power = MPPublicCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 20, 40, "启动 功能药水")
checkButton_Power:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Power = 1
    else
        MPWarriorTankSaved.Power = 0
    end
end)

local ButtonPower = MPPublicButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", "设置", 150, 34, 80, 22)
ButtonPower:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingsPower:Show()
end)


local checkButton_Pick = MPPublicCheckButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", 340, 40, "启动 自动拾取")
checkButton_Pick:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPWarriorTankSaved.Pick = 1
    else
        MPWarriorTankSaved.Pick = 0
    end
end)

local ButtonPick = MPPublicButton(CatUISettingsWarriorTank, ADDON_NAME.."CheckButton", "设置", 405, 34, 80, 22)
ButtonPick:SetScript("OnClick", function()
    MPCatSettingsCloseAll()
    CatUISettingAutoLoot:Show()
end)


-- 添加提示内容区域
local TipText = CatUISettingsWarriorTank:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TipText:SetPoint("BOTTOM", CatUISettingsWarriorTank, "BOTTOM", 0, 9)
TipText:SetWidth(450)
TipText:SetTextColor(0.6, 0.6, 0.6)
TipText:SetJustifyH("CENTER")
TipText:SetText("宏命令 -  [ |cFFC79C6E/wtank|r ]")



-- 配置文件版本号
local WarriorTankSettingsUIVersion = 20

function MPResetWarriorTankSettings()

    MPWarriorTankSaved.Version = WarriorTankSettingsUIVersion

    -- 基本配置
    MPWarriorTankSaved.Defensive = 1
    MPWarriorTankSaved.BerserkerRage = 1
    MPWarriorTankSaved.BattleShout = 1
    MPWarriorTankSaved.Demoralizing = 1
    MPWarriorTankSaved.ThunderClap = 0
    MPWarriorTankSaved.Shockwave = 1
    MPWarriorTankSaved.Revenge = 1
    MPWarriorTankSaved.SunderArmor = 1

    MPWarriorTankSaved.Trinket_Upper = 1
    MPWarriorTankSaved.TUBoss = 0
    MPWarriorTankSaved.Trinket_Below = 1
    MPWarriorTankSaved.TBBoss = 0
    MPWarriorTankSaved.Target = 0
    MPWarriorTankSaved.NearbyEnemies = 1

    -- 高级配置
    MPWarriorTankSaved.HeroicStrike = 50
    MPWarriorTankSaved.SunderArmor_Value = 30

    MPWarriorTankSaved.Interrupt = 0
    MPWarriorTankSaved.RacialTraits = 0

    MPWarriorTankSaved.UnSalvation = 0

    -- 治疗石、糖水茶
    MPWarriorTankSaved.HealthStone = 1
    MPWarriorTankSaved.HealthStone_Value = 30
    MPWarriorTankSaved.HerbalTea = 1
    MPWarriorTankSaved.HerbalTea_Value = 20
    MPWarriorTankSaved.Carrot = 0
    MPWarriorTankSaved.Carrot_Value = 20
    MPWarriorTankSaved.Overpower = 0
    MPWarriorTankSaved.Overpower_Value = 30

    MPWarriorTankSaved.ShieldBlock = 1
    MPWarriorTankSaved.ShieldBlock_Value = 90
    MPWarriorTankSaved.LastStand = 0
    MPWarriorTankSaved.LastStand_Value = 10
    MPWarriorTankSaved.ShieldWall = 0
    MPWarriorTankSaved.ShieldWall_Value = 20
    MPWarriorTankSaved.LifeJewel = 0
    MPWarriorTankSaved.LifeJewel_Value = 30

    -- SuperWoW,UnitXP
    MPWarriorTankSaved.SuperWoW = 1
    MPWarriorTankSaved.UnitXP = 1

    MPWarriorTankSaved.Soulspeed = 0

    -- 通用
    MPWarriorTankSaved.Power = 0
    MPWarriorTankSaved.Pick = 0

end

local function ToBoolean(value)
    if value==1 then
        return true
    end

    return false
end

local function InitWarriorTankSettingsPart1()
    checkButton_Defensive:SetChecked(ToBoolean(MPWarriorTankSaved.Defensive))
    checkButton_BerserkerRage:SetChecked(ToBoolean(MPWarriorTankSaved.BerserkerRage))
    checkButton_BattleShout:SetChecked( ToBoolean(MPWarriorTankSaved.BattleShout) )
    checkButton_Demoralizing:SetChecked( ToBoolean(MPWarriorTankSaved.Demoralizing) )
    checkButton_ThunderClap:SetChecked( ToBoolean(MPWarriorTankSaved.ThunderClap) )
    checkButton_Shockwave:SetChecked( ToBoolean(MPWarriorTankSaved.Shockwave) )
    checkButton_Revenge:SetChecked( ToBoolean(MPWarriorTankSaved.Revenge) )
    checkButton_SunderArmor:SetChecked( ToBoolean(MPWarriorTankSaved.SunderArmor) )

    checkButton_Trinket_Upper:SetChecked(ToBoolean(MPWarriorTankSaved.Trinket_Upper))
    checkButton_TUBoss:SetChecked(ToBoolean(MPWarriorTankSaved.TUBoss))
    checkButton_Trinket_Below:SetChecked(ToBoolean(MPWarriorTankSaved.Trinket_Below))
    checkButton_TBBoss:SetChecked(ToBoolean(MPWarriorTankSaved.TBBoss))

    checkButton_Target:SetChecked(ToBoolean(MPWarriorTankSaved.Target))
    checkButton_NearbyEnemies:SetChecked(ToBoolean(MPWarriorTankSaved.NearbyEnemies))
    
    checkButton_Soulspeed:SetChecked(ToBoolean(MPWarriorTankSaved.Soulspeed))


end

local function InitWarriorTankSettingsPart2()
    checkButton_HealthStone:SetChecked(ToBoolean(MPWarriorTankSaved.HealthStone))
    slider_HealthStone:SetValue(MPWarriorTankSaved.HealthStone_Value)
    if MPWarriorTankSaved.HealthStone==1 then
        color_HealthStone = "|cFFFFD100"
    else
        color_HealthStone = "|cFF888888"
    end
    _G[slider_HealthStone:GetName().."Text"]:SetText(color_HealthStone.."血线: ".. MPWarriorTankSaved.HealthStone_Value .."%|r")

    checkButton_HerbalTea:SetChecked(MPWarriorTankSaved.HerbalTea)
    slider_HerbalTea:SetValue(MPWarriorTankSaved.HerbalTea_Value)
    if MPWarriorTankSaved.HerbalTea==1 then
        color_HerbalTea = "|cFFFFD100"
    else
        color_HerbalTea = "|cFF888888"
    end
    _G[slider_HerbalTea:GetName().."Text"]:SetText(color_HerbalTea.."血线: ".. MPWarriorTankSaved.HerbalTea_Value .."%|r")

    checkButton_Carrot:SetChecked(MPWarriorTankSaved.Carrot)
    slider_Carrot:SetValue(MPWarriorTankSaved.Carrot_Value)
    if MPWarriorTankSaved.Carrot==1 then
        color_Carrot = "|cFFFFD100"
    else
        color_Carrot = "|cFF888888"
    end
    _G[slider_Carrot:GetName().."Text"]:SetText(color_Carrot.."血线: ".. MPWarriorTankSaved.Carrot_Value .."%|r")

    checkButton_Overpower:SetChecked(MPWarriorTankSaved.Overpower)
    slider_Overpower:SetValue(MPWarriorTankSaved.Overpower_Value)
    if MPWarriorTankSaved.Overpower==1 then
        color_Overpower = "|cFFFFD100"
    else
        color_Overpower = "|cFF888888"
    end
    _G[slider_Overpower:GetName().."Text"]:SetText(color_Overpower.."怒气 < ".. MPWarriorTankSaved.Overpower_Value)

end

function MPInitWarriorTankSettings()
    if not MPWarriorTankSaved then
        MPWarriorTankSaved = {}
        MPResetWarriorTankSettings()
    end

    if MPWarriorTankSaved.Version ~= WarriorTankSettingsUIVersion then
        MPResetWarriorTankSettings()
    end

    InitWarriorTankSettingsPart1()
    InitWarriorTankSettingsPart2()


    checkButton_ShieldBlock:SetChecked(MPWarriorTankSaved.ShieldBlock)
    slider_ShieldBlock:SetValue(MPWarriorTankSaved.ShieldBlock_Value)
    if MPWarriorTankSaved.ShieldBlock==1 then
        color_ShieldBlock = "|cFFFFD100"
    else
        color_ShieldBlock = "|cFF888888"
    end
    _G[slider_ShieldBlock:GetName().."Text"]:SetText(color_ShieldBlock.."血线: ".. MPWarriorTankSaved.ShieldBlock_Value .."%|r")

    checkButton_LastStand:SetChecked(MPWarriorTankSaved.LastStand)
    slider_LastStand:SetValue(MPWarriorTankSaved.LastStand_Value)
    if MPWarriorTankSaved.LastStand==1 then
        color_LastStand = "|cFFFFD100"
    else
        color_LastStand = "|cFF888888"
    end
    _G[slider_LastStand:GetName().."Text"]:SetText(color_LastStand.."血线: ".. MPWarriorTankSaved.LastStand_Value .."%|r")


    checkButton_ShieldWall:SetChecked(MPWarriorTankSaved.ShieldWall)
    slider_ShieldWall:SetValue(MPWarriorTankSaved.ShieldWall_Value)
    if MPWarriorTankSaved.ShieldWall==1 then
        color_ShieldWall = "|cFFFFD100"
    else
        color_ShieldWall = "|cFF888888"
    end
    _G[slider_ShieldWall:GetName().."Text"]:SetText(color_ShieldWall.."血线: ".. MPWarriorTankSaved.ShieldWall_Value .."%|r")


    checkButton_LifeJewel:SetChecked(MPWarriorTankSaved.LifeJewel)
    slider_LifeJewel:SetValue(MPWarriorTankSaved.LifeJewel_Value)
    if MPWarriorTankSaved.LifeJewel==1 then
        color_LifeJewel = "|cFFFFD100"
    else
        color_LifeJewel = "|cFF888888"
    end
    _G[slider_LifeJewel:GetName().."Text"]:SetText(color_LifeJewel.."血线: ".. MPWarriorTankSaved.LifeJewel_Value .."%|r")


    slider_HeroicStrike:SetValue(MPWarriorTankSaved.HeroicStrike)
    _G[slider_HeroicStrike:GetName().."Text"]:SetText("英勇/顺劈 >"..MPWarriorTankSaved.HeroicStrike.." 怒气")

    slider_SunderArmor:SetValue(MPWarriorTankSaved.SunderArmor_Value)
    _G[slider_SunderArmor:GetName().."Text"]:SetText("破甲攻击 >"..MPWarriorTankSaved.SunderArmor_Value.." 怒气")


    checkButton_Interrupt:SetChecked(ToBoolean(MPWarriorTankSaved.Interrupt))
    checkButton_RacialTraits:SetChecked(ToBoolean(MPWarriorTankSaved.RacialTraits))
    checkButton_UnSalvation:SetChecked(ToBoolean(MPWarriorTankSaved.UnSalvation))

    checkButton_Power:SetChecked(ToBoolean(MPWarriorTankSaved.Power))
    checkButton_Pick:SetChecked(ToBoolean(MPWarriorTankSaved.Pick))
end

