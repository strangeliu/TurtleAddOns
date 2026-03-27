
-- 定义插件名称
local ADDON_NAME = "CatUI-Elixir"

local redFont = "|cFFEE1111"
local greenFont = "|cFF22dd22"

CatElixir = CreateFrame("Frame", ADDON_NAME.."Frame", UIParent)
CatElixir:Hide()

-- 设置窗口基本属性
CatElixir:SetWidth(150)
CatElixir:SetHeight(40)
CatElixir:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
CatElixir:SetFrameLevel(1)

-- 创建Tooltip风格的背景和边框
CatElixir:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
CatElixir:SetBackdropColor(0.1, 0.1, 0.2, 0.7)
CatElixir:SetScale(0.8)

-- 使窗口可移动
CatElixir:EnableMouse(true)
CatElixir:SetMovable(true)
CatElixir:RegisterForDrag("LeftButton")
CatElixir:SetScript("OnDragStart", function()
    CatElixir:StartMoving()
end)
CatElixir:SetScript("OnDragStop", function()
    CatElixir:StopMovingOrSizing()
end)

local SetButton = CreateFrame("Button", nil, CatElixir, "UIPanelButtonTemplate")
SetButton:SetWidth(50)
SetButton:SetHeight(20)
SetButton:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
SetButton:SetPoint("TOPRIGHT", CatElixir, "TOPRIGHT", -35, -8)
SetButton:SetText("设置")
SetButton:SetScript("OnClick", function(self)
    MPCatSettingsCloseAll()
    CatUISettingsElixir:Show()
end)



-- 添加标题文字
local title = CatElixir:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOPLEFT", CatElixir, "TOPLEFT", 10, -10)
title:SetText("药剂")


-- 添加标准关闭按钮（精确对齐标题行）
local closeButton = CreateFrame("Button", nil, CatElixir, "UIPanelCloseButton")
closeButton:SetWidth(30)
closeButton:SetHeight(30)
closeButton:SetPoint("TOPRIGHT", CatElixir, "TOPRIGHT", -5, -4)  -- Y坐标调整为-10，与标题完全对齐
-- 设置点击事件
closeButton:SetScript("OnClick", function(self)
    CatElixir:Hide()
    MPPublicSaved.ElixirWindowDisplay = 0
end)

-- 添加分隔线
local divider = CatElixir:CreateTexture(nil, "ARTWORK")
divider:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
divider:SetTexCoord(0.81, 0.94, 0.5, 1)
divider:SetVertexColor(0.5, 0.5, 0.5)
divider:SetWidth(140)
divider:SetHeight(4)
divider:SetPoint("TOP", CatElixir, "TOP", 0, -30)


local height = 46
local postion = -40
local count = 1
local unknow = 0
MPCatElixirButton = {}

local function MPCreateBuff()

    MPCatElixirButton[count] = CreateFrame("Button", ADDON_NAME.."Button", CatElixir, "ActionButtonTemplate")

    MPCatElixirButton[count].buff = "null"
    MPCatElixirButton[count].item = "null"
    MPCatElixirButton[count].bufficon = nil
    MPCatElixirButton[count].buffid = -1

    MPCatElixirButton[count]:SetWidth(36)  -- 标准技能按钮大小
    MPCatElixirButton[count]:SetHeight(36)
    MPCatElixirButton[count]:SetPoint("TOPLEFT", CatElixir, "TOPLEFT", 12, postion)

    -- 隐藏模板自带的图标
    local defaultIcon = MPCatElixirButton[count]:GetNormalTexture()
    if defaultIcon then
        defaultIcon:SetTexture(nil)  -- 清空纹理
        defaultIcon:Hide()  -- 或者直接隐藏
    end

    MPCatElixirButton[count].icon = MPCatElixirButton[count]:CreateTexture("MySkillButtonIcon", "ARTWORK")
    MPCatElixirButton[count].icon:SetAllPoints(true)
    local tex = MPGetItemTexByName("null")
    if tex then
        MPCatElixirButton[count].icon:SetTexture(tex)
    else
        MPCatElixirButton[count].icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark") -- ?问号图标
        unknow = 1
    end
    MPCatElixirButton[count]:SetAlpha(1.0)
    MPCatElixirButton[count]:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")

    -- 添加按钮文本
    MPCatElixirButton[count].name = MPCatElixirButton[count]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    MPCatElixirButton[count].name:SetWidth(100)
    MPCatElixirButton[count].name:SetPoint("TOPLEFT", MPCatElixirButton[count], "TOPLEFT", 38, -2)
    MPCatElixirButton[count].name:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    MPCatElixirButton[count].name:SetTextColor(1, 1, 1)
    MPCatElixirButton[count].name:SetText("null")
    MPCatElixirButton[count].name:SetJustifyH("LEFT")

    MPCatElixirButton[count].time = MPCatElixirButton[count]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    MPCatElixirButton[count].time:SetWidth(100)
    MPCatElixirButton[count].time:SetPoint("LEFT", MPCatElixirButton[count], "LEFT", 38, -8)
    MPCatElixirButton[count].time:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    MPCatElixirButton[count].time:SetTextColor(1, 1, 1)
    MPCatElixirButton[count].time:SetText("20:00")
    MPCatElixirButton[count].time:SetJustifyH("LEFT")

    MPCatElixirButton[count].number = MPCatElixirButton[count]:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    MPCatElixirButton[count].number:SetWidth(100)
    MPCatElixirButton[count].number:SetPoint("TOPLEFT", MPCatElixirButton[count], "TOPLEFT", -66, -22)
    MPCatElixirButton[count].number:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
    MPCatElixirButton[count].number:SetTextColor(1, 1, 1)
    MPCatElixirButton[count].number:SetText("10")
    MPCatElixirButton[count].number:SetJustifyH("RIGHT")

    MPCatElixirButton[count]:Hide()

    postion = postion - 40
    count = count+1
end

-- 初始化
for i=1, 16 do
    MPCreateBuff("null", "null")
    MPCatElixirButton[i]:SetScript("OnClick", function(self)
    end)
end



local function MPAddBuff(buff, item, text, bufficon)

    MPCatElixirButton[count].buff = buff
    MPCatElixirButton[count].bufficon = bufficon or nil
    MPCatElixirButton[count].item = item

    MPCatElixirButton[count]:SetScript("OnClick", function(self)
        DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."使用："..item)
        MPUseItemByName(item)
    end)

    local tex = MPGetItemTexByName(item)
    if tex then
        MPCatElixirButton[count].icon:SetTexture(tex)
        MPCatElixirButton[count].number:SetText(MPGetItemByNameCount(item))
        MPCatElixirButton[count].number:Show()
    else
        MPCatElixirButton[count].icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark") -- ?问号图标
        MPCatElixirButton[count].number:Hide()
        unknow = 1
    end

    MPCatElixirButton[count].name:SetText(text)
    MPCatElixirButton[count]:Show()

    height = height + 40
    count = count+1
    CatElixir:SetHeight(height)
end

local function MPClearBuff()
    for i=1, 16 do
        MPCatElixirButton[i]:Hide()
    end
    height = 46
    CatElixir:SetHeight(height)
    count = 1
    unknow = 0
end



local CatElixirUIVersion = 1

function MPCatElixirReset()

    if not MPElixirSaved then
        return
    end

    MPClearBuff()



    if MPElixirSaved.ZanzaSpeed==1 then MPAddBuff("赞扎之速", "赞扎之速", "赞扎之速") end

    if MPElixirSaved.ZanzaSpirit==1 then MPAddBuff("赞扎之魂", "赞扎之魂", "赞扎之魂") end
    if MPElixirSaved.Fortitude==1 then MPAddBuff("生命 II", "坚韧药剂", "坚韧药剂") end
    if MPElixirSaved.MedivhWine==1 then MPAddBuff("麦迪文的葡萄酒", "麦迪文的葡萄酒", "麦迪文葡萄酒") end
    if MPElixirSaved.Cocktail==1 then MPAddBuff("野猪之魂", "肺片鸡尾酒", "肺片鸡尾酒") end
    if MPElixirSaved.TrollBlood==1 then MPAddBuff("回复", "特效巨魔之血药水", "巨魔之血药水") end
    if MPElixirSaved.Stoneshield==1 then MPAddBuff("强效护甲", "超强防御药剂", "超强防御药剂") end

    if MPElixirSaved.ArthasGift==1 then MPAddBuff("阿尔萨斯的礼物", "阿尔萨斯的礼物", "阿尔萨斯礼物") end

    if MPElixirSaved.DreamMongoose==1 then MPAddBuff("翡翠猫鼬药剂", "翡翠猫鼬药剂", "翡翠猫鼬药剂") end
    if MPElixirSaved.ArcaneGiants==1 then MPAddBuff("奥法巨人药剂", "奥法巨人药剂", "奥法巨人药剂") end
    if MPElixirSaved.DreamFirewater==1 then MPAddBuff("梦境火酒药剂", "梦境火酒药剂", "梦境火酒药剂") end

    if MPElixirSaved.Mongoose==1 then MPAddBuff("猫鼬药剂", "猫鼬药剂", "猫鼬药剂") end
    if MPElixirSaved.Giants==1 then MPAddBuff("巨人药剂", "巨人药剂", "巨人药剂") end
    if MPElixirSaved.HyenaStimulant==1 then MPAddBuff("远古之怒", "土狼兴奋剂", "土狼兴奋剂") end
    if MPElixirSaved.Encrusted==1 then MPAddBuff("厚甲蝎之击", "厚甲蝎药粉", "厚甲蝎药粉") end
    if MPElixirSaved.SoulEnergy==1 then MPAddBuff("魂能之力", "魂能之力", "魂能之力") end
    if MPElixirSaved.Firewater==1 then MPAddBuff("冬泉火酒", "冬泉火酒", "冬泉火酒") end
    if MPElixirSaved.SoulStrike==1 then MPAddBuff("魂能之击", "魂能之击", "魂能之击") end
    if MPElixirSaved.Demon==1 then MPAddBuff("屠魔药剂", "屠魔药剂", "屠魔药剂") end

    if MPElixirSaved.DreamEssence==1 then MPAddBuff("梦境精华药剂", "梦境精华药剂", "梦境精华药剂") end
    if MPElixirSaved.ArcanePower==1 then MPAddBuff("强效奥法药剂", "强效奥法药剂", "强效奥法药剂") end
    if MPElixirSaved.Dreamshire==1 then MPAddBuff("梦通", "梦境酊剂", "梦境酊剂") end
    if MPElixirSaved.CortexPotion==1 then MPAddBuff("坚定信念", "脑皮层混合饮料", "脑皮层饮料") end
    if MPElixirSaved.Intellect==1 then MPAddBuff("强效智力", "强效聪颖药剂", "强效聪颖药剂") end
    if MPElixirSaved.SoulTrickery==1 then MPAddBuff("魂能之诈", "魂能之诈", "魂能之诈") end

    if MPElixirSaved.Firepower==1 then MPAddBuff("强效火力", "强效火力药剂", "强效火力药剂") end
    if MPElixirSaved.ShadowPower==1 then MPAddBuff("暗影强化", "暗影之力药剂", "暗影之力药剂") end
    if MPElixirSaved.FrostPower==1 then MPAddBuff("强效冰霜之力", "强效冰霜之力药剂", "强效冰霜之力") end
    if MPElixirSaved.GreaterArcanePower==1 then MPAddBuff("强效奥术之力", "强效奥术之力药剂", "强效奥术之力") end
    if MPElixirSaved.NaturePower==1 then MPAddBuff("强效自然力量药剂", "强效自然之力药水", "强效自然之力") end
    if MPElixirSaved.FelMana==1 then MPAddBuff("法力回复", "魔血药水", "魔血药水", "Interface\\Icons\\INV_Potion_45") end -- Spell_Nature_MoonGlow   Interface\\Icons\\INV_Potion_45  Spell_Nature_Regeneration
    if MPElixirSaved.MedivhBlue==1 then MPAddBuff("麦迪文的蓝标葡萄酒", "麦迪文的蓝标葡萄酒", "麦迪文蓝标酒") end


    if MPElixirSaved.DesertDumplings==1 then MPAddBuff("进食充分", "沙漠肉丸子", "沙漠肉丸子") end
    if MPElixirSaved.Nutritious==1 then MPAddBuff("进食充分", "营养的魔法蘑菇", "营养魔法蘑菇") end
    if MPElixirSaved.BigFish==1 then MPAddBuff("进食充分", "大鱼片", "大鱼片") end

    if MPElixirSaved.GrilledSquid==1 then MPAddBuff("敏捷提高", "烤鱿鱼", "烤鱿鱼") end
    if MPElixirSaved.SweetBerries==1 then MPAddBuff("敏捷提高", "酸甜的山地浆果", "酸甜山地浆果") end
    if MPElixirSaved.Skewers==1 then MPAddBuff("进食充分", "鱿鱼鳗串", "鱿鱼鳗串") end

    if MPElixirSaved.TerrabeMood==1 then MPAddBuff("进食充分", "达农佐的泰拉比姆情调", "泰拉比姆情调") end
    if MPElixirSaved.TerrabeFun==1 then MPAddBuff("进食充分", "达农佐的泰拉比姆趣味", "泰拉比姆趣味") end
    if MPElixirSaved.TerrabeSurprise==1 then MPAddBuff("进食充分", "达农佐的泰拉比姆惊喜", "泰拉比姆惊喜") end

    if MPElixirSaved.NightfinSoup==1 then MPAddBuff("法力回复", "夜鳞鱼汤", "夜鳞鱼汤", "Interface\\Icons\\Spell_Nature_ManaRegenTotem") end   -- "Interface\\Icons\\Spell_Nature_ManaRegenTotem"
    if MPElixirSaved.SmokedPerch==1 then MPAddBuff("进食充分", "烟熏鲈鱼", "烟熏鲈鱼") end
    if MPElixirSaved.HerbSalad==1 then MPAddBuff("提高治疗", "强能草药沙拉", "强能草药沙拉") end

    if MPElixirSaved.Crispy==1 then MPAddBuff("耐力提高", "香脆的魔法蘑菇", "香脆魔法蘑菇") end
    if MPElixirSaved.Chimera==1 then MPAddBuff("强化耐力", "迪尔格的超美味奇美拉肉片", "奇美拉肉片") end
    if MPElixirSaved.Seafood==1 then MPAddBuff("进食充分", "深海炖菜", "深海炖菜") end

    if MPElixirSaved.CookedFish==1 then MPAddBuff("进食充分", "煮熟的光滑大鱼", "煮熟光滑大鱼") end
    if MPElixirSaved.Dragonbreath==1 then MPAddBuff("龙息红椒", "龙息红椒", "龙息红椒") end


    if MPElixirSaved.ElementalStone==1 then MPAddBuff("致命一击 %+2", "元素磨刀石", "元素磨刀石") end
    if MPElixirSaved.SacredStone==1 then MPAddBuff("攻击强度vs亡灵", "神圣磨刀石", "神圣磨刀石") end
    if MPElixirSaved.SacredOil==1 then MPAddBuff("法术伤害vs亡灵", "神圣巫师之油", "神圣巫师之油") end
    if MPElixirSaved.WizardOil==1 then MPAddBuff("卓越巫师之油", "卓越巫师之油", "卓越巫师之油") end
    if MPElixirSaved.ManaOil==1 then MPAddBuff("卓越法力之油", "卓越法力之油", "卓越法力之油") end

end

local function SecondsToTimeString(seconds)
    if not seconds or seconds <= 0 then
        return "00:00:00"
    end
    local hours = math.floor(seconds / 3600)
    local remaining = seconds - (hours * 3600)
    local minutes = math.floor(remaining / 60)
    local secs = remaining - (minutes * 60)
     
    return string.format("%02d:%02d:%02d", hours, minutes, secs)
end


local function ElixirEventPollingFunction()

    local min = MPElixirSaved.LeftTime * 60
	local Value = 0

    for i=1, count do

        Value = 0

        local tex = MPGetItemTexByName(MPCatElixirButton[i].item)
        local itemcount = MPGetItemByNameCount(MPCatElixirButton[i].item)
        if itemcount>0 then
            MPCatElixirButton[i].icon:SetTexture(tex)
            MPCatElixirButton[i].number:SetText(itemcount)
            MPCatElixirButton[i].number:Show()
        else
            MPCatElixirButton[i].icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark") -- ?问号图标
            MPCatElixirButton[i].number:Hide()
        end

        if MPCatElixirButton[i].item=="元素磨刀石" then

		    local fumo, text = MPIsItemEntry(16, "致命一击 %+2")
		    if text then
			    local str = MPMatch(text, "（(%d+)分钟）")
			    Value = MPToNumber( str ) * 60
		    end

            if Value>0 then
                if Value<min then
                    MPCatElixirButton[i].time:SetText(redFont..SecondsToTimeString(Value))
                else
                    MPCatElixirButton[i].time:SetText(greenFont..SecondsToTimeString(Value))
                end
            else
                MPCatElixirButton[i].time:SetText("|cFF888888未激活|r")
            end

        elseif MPCatElixirButton[i].item=="神圣磨刀石" then

		    local fumo, text = MPIsItemEntry(16, "攻击强度vs亡灵")
		    if text then
			    local str = MPMatch(text, "（(%d+)分钟）")
			    Value = MPToNumber( str ) * 60
		    end

            if Value>0 then
                if Value<min then
                    MPCatElixirButton[i].time:SetText(redFont..SecondsToTimeString(Value))
                else
                    MPCatElixirButton[i].time:SetText(greenFont..SecondsToTimeString(Value))
                end
            else
                MPCatElixirButton[i].time:SetText("|cFF888888未激活|r")
            end

        elseif MPCatElixirButton[i].item=="神圣巫师之油" then

		    local fumo, text = MPIsItemEntry(16, "法术伤害vs亡灵")
		    if text then
			    local str = MPMatch(text, "（(%d+)分钟）")
			    Value = MPToNumber( str ) * 60
		    end

            if Value>0 then
                if Value<min then
                    MPCatElixirButton[i].time:SetText(redFont..SecondsToTimeString(Value))
                else
                    MPCatElixirButton[i].time:SetText(greenFont..SecondsToTimeString(Value))
                end
            else
                MPCatElixirButton[i].time:SetText("|cFF888888未激活|r")
            end

        elseif MPCatElixirButton[i].item=="卓越巫师之油" then

		    local fumo, text = MPIsItemEntry(16, "卓越巫师之油")
		    if text then
			    local str = MPMatch(text, "（(%d+)分钟）")
			    Value = MPToNumber( str ) * 60
		    end

            if Value>0 then
                if Value<min then
                    MPCatElixirButton[i].time:SetText(redFont..SecondsToTimeString(Value))
                else
                    MPCatElixirButton[i].time:SetText(greenFont..SecondsToTimeString(Value))
                end
            else
                MPCatElixirButton[i].time:SetText("|cFF888888未激活|r")
            end

        elseif MPCatElixirButton[i].item=="卓越法力之油" then

		    local fumo, text = MPIsItemEntry(16, "卓越法力之油")
		    if text then
			    local str = MPMatch(text, "（(%d+)分钟）")
			    Value = MPToNumber( str ) * 60
		    end

            if Value>0 then
                if Value<min then
                    MPCatElixirButton[i].time:SetText(redFont..SecondsToTimeString(Value))
                else
                    MPCatElixirButton[i].time:SetText(greenFont..SecondsToTimeString(Value))
                end
            else
                MPCatElixirButton[i].time:SetText("|cFF888888未激活|r")
            end

        else

            local bufftime = 0
            if MPCatElixirButton[i].bufficon then
                -- 需要检测buff图标
                bufftime = MPBuffTimeFromTex(MPCatElixirButton[i].bufficon)
            else
                -- 无需判断buff图标
                bufftime = MPBuffTime(MPCatElixirButton[i].buff)
            end

            if bufftime>0 then
                if bufftime<min then
                    MPCatElixirButton[i].time:SetText(redFont..SecondsToTimeString(bufftime))
                else
                    MPCatElixirButton[i].time:SetText(greenFont..SecondsToTimeString(bufftime))
                end
            else
                MPCatElixirButton[i].time:SetText("|cFF888888未激活|r")
            end

        end
    end

end


local interval = 0.3  -- 轮询间隔（秒）
local elapsed = 0
local unknow_interval = 3.0
local unknow_elapsed = 0

local function OnUpdate()

    if not CatElixir:IsVisible() then
        return
    end

    elapsed = elapsed + arg1
    if elapsed >= interval then
        elapsed = 0  -- 重置计时器
        ElixirEventPollingFunction()  -- 调用轮询函数
    end

    --[[
    unknow_elapsed = unknow_elapsed + arg1
    if unknow_elapsed >= unknow_interval then
        unknow_elapsed = 0  -- 重置计时器
        if unknow==1 then
            MPCatElixirReset()
        end
    end
    ]]
end

CatElixir:SetScript("OnUpdate", OnUpdate)




