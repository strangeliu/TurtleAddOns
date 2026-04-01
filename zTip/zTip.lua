local zAnchor
local zOffsetX
local zOffsetY
local zOrigPosX
local zOrigPosY
local zScale
local zGuildColorAlpha
local zFade
local zDisplayPvPRank
local zClassIcon
local zShowIsPlayer
local zDisplayFaction
local zTargetOfMouse
local zShowChallenges
local zShowResist
local zShowManaBar
local zColorHealthBar
local zHighlightOwnGuild
local zHidePvPLine
local zTip_Default = {
	["zAnchor"] = 3,
	["AnchorSlider"] = 3,
	["zOffsetXE"] = 50,
	["zOffsetYE"] = 50,
	["zOffsetX"] = 50,
	["zOffsetY"] = 50,
	["zOrigPos"] = 1,
	["zOrigPosXE"] = 100,
	["zOrigPosYE"] = 150,
	["zOrigPosX"] = 100,
	["zOrigPosY"] = 150,
	["zScale"] = false,
	["zScaleShow"] = false,
	["ScaleSlider"] = 10,
	["zGuildColorAlpha"] = 0.86,
	["zGuildColorAlphaShow"] = false,
	["GuildColorAlphaSlider"] = 86,
	["zFade"] = false,
	["zDisplayPvPRank"] = 3,
	["DisplayPvPRankSlider"] = 3,
	["zClassIcon"] = 1,
	["zShowIsPlayer"] = 1,
	["zDisplayFaction"] = 1,
	["zTargetOfMouse"] = 1,
	["zShowChallenges"] = 1,
	["zShowResist"] = 1,
	["zShowManaBar"] = 1,
	["zColorHealthBar"] = 1,
	["zHighlightOwnGuild"] = 1,
	["zHidePvPLine"] = 1,
}

local function zTip_CopyDefaults()
	for k, v in pairs(zTip_Default) do
		if zTip_Saved[k] == nil then
			zTip_Saved[k] = v
		end
	end
end

local function zTip_GetSavedNumber(key)
	local value = tonumber(zTip_Saved[key])
	if value == nil then
		value = zTip_Default[key]
		zTip_Saved[key] = value
	end
	return value
end

local function zTip_LoadSaved()
	if not zTip_Saved then
		zTip_Saved = {}
	end

	zTip_CopyDefaults()

	zAnchor = zTip_GetSavedNumber("zAnchor")
	zOffsetX = zTip_GetSavedNumber("zOffsetX")
	zOffsetY = zTip_GetSavedNumber("zOffsetY")
	zOrigPosX = zTip_GetSavedNumber("zOrigPosX")
	zOrigPosY = zTip_GetSavedNumber("zOrigPosY")
	zScale = zTip_Saved["zScale"]
	zGuildColorAlpha = tonumber(zTip_Saved["zGuildColorAlpha"]) or zTip_Default["zGuildColorAlpha"]
	zFade = zTip_Saved["zFade"]
	zDisplayPvPRank = zTip_GetSavedNumber("zDisplayPvPRank")
	zClassIcon = zTip_Saved["zClassIcon"]
	zShowIsPlayer = zTip_Saved["zShowIsPlayer"]
	zDisplayFaction = zTip_Saved["zDisplayFaction"]
	zTargetOfMouse = zTip_Saved["zTargetOfMouse"]
	zShowChallenges = zTip_Saved["zShowChallenges"]
	zShowResist = zTip_Saved["zShowResist"]
	zShowManaBar = zTip_Saved["zShowManaBar"]
	zColorHealthBar = zTip_Saved["zColorHealthBar"]
	zHighlightOwnGuild = zTip_Saved["zHighlightOwnGuild"]
	zHidePvPLine = zTip_Saved["zHidePvPLine"]
end

--加载配置
local zTipFrame = CreateFrame("Frame")
zTipFrame:RegisterEvent("VARIABLES_LOADED")
zTipFrame:SetScript("OnEvent",function()
	if ( event == "VARIABLES_LOADED" ) then
		zTip_LoadSaved()
	end
end)

--零部件
function editbox(parent,name) 
	this = CreateFrame("EditBox", name, parent)
	this:SetTextColor(1,1,1,1)
	this:SetJustifyH("RIGHT")
	this:SetTextInsets(5,5,5,5)
	this:SetWidth(40)
	this:SetHeight(20)
	this:SetFontObject(GameFontNormal)
	this:SetAutoFocus(false)
	this:SetMaxLetters(3)
	this:SetScript("OnEscapePressed", function(self)
		this:ClearFocus()
	end)
	this:SetBackdrop({
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
	tile = true, 
	tileSize = 12,
	edgeSize = 12,
	insets = {left = 2, right = 2, top = 2, bottom = 2},
	})

	return this
end
function editboxedit(name,savename)
        name:SetScript("OnTextChanged", function(self)
		local value = tonumber(name:GetText())
		if value ~= nil then
			zTip_Saved[savename] = value
		end
	end)
end
function slider(parent,textname,low,high,step) 
	this =  CreateFrame("Slider",textname,parent,"OptionsSliderTemplate")
	this.StepText = this:CreateFontString(nil,"ARTWORK","GameFontNormal")
	this.StepText:SetPoint("LEFT",this,"RIGHT",1,0)
	getglobal(this:GetName().."Text"):SetText(textname)
	getglobal(this:GetName().."Low"):SetText(low)
	getglobal(this:GetName().."High"):SetText(high)
	this:SetMinMaxValues(low, high)
	this:SetValueStep(step)
	this:SetScript("OnUpdate",function()
		this.StepText:SetText(this:GetValue())
	end)
	return this
end
function editslider(name,slidername,savename)
	name:SetScript("OnValueChanged",function()
		zTip_Saved[slidername] = name:GetValue()
		if savename == "zGuildColorAlpha" then
			zTip_Saved[savename] = name:GetValue()/100
		elseif savename == "zScale" then
			zTip_Saved[savename] = name:GetValue()/10
		else
			zTip_Saved[savename] = name:GetValue()
		end
	end)
end
function checkbutton(name,parent,textname) 
	this = CreateFrame("CheckButton",textname,parent,"OptionsCheckButtonTemplate")
	this:SetHitRectInsets(0, 0, 0, 0)
	getglobal(this:GetName().."Text"):SetText(textname)
	return this
end
function editcheckbutton(name,slidername,savename,type,xo,yo,sliderframename,slidernum)
name:SetScript("OnClick",function()
	if type == 1 then
		if name:GetChecked() == nil then
			zTip_Saved[savename] = false
		elseif name:GetChecked() == 1 then
			sliderframename:SetValue(zTip_Saved[slidername])
			zTip_Saved[savename] = zTip_Saved[slidername]
		end
	elseif type == 2 then
		if name:GetChecked() == nil then
			zTip_Saved[savename] = false
			zTip_Saved[savename.."XE"] = zTip_Saved[savename.."X"]
			zTip_Saved[savename.."YE"] = zTip_Saved[savename.."Y"]
			zTip_Saved[savename.."X"] = false
			zTip_Saved[savename.."Y"] = false
		elseif name:GetChecked() == 1 then
			zTip_Saved[savename] = 1
			getglobal(savename.."X"):SetText(zTip_Saved[savename.."XE"])
			getglobal(savename.."Y"):SetText(zTip_Saved[savename.."YE"])
			zTip_Saved[savename.."X"] = zTip_Saved[savename.."XE"]
			zTip_Saved[savename.."Y"] = zTip_Saved[savename.."YE"]
		end
	elseif type ==3 then
		if name:GetChecked() == nil then
			zTip_Saved[savename] = false
		elseif name:GetChecked() == 1 then
			zTip_Saved[savename] = 1
		end
	elseif type ==4 then
		if name:GetChecked() == nil then
			zTip_Saved[savename] = false
			zTip_Saved[xo.."E"] = zTip_Saved[xo]
			zTip_Saved[yo.."E"] = zTip_Saved[yo]
		elseif name:GetChecked() == 1 then
			sliderframename:SetValue(zTip_Saved[slidername])
			zTip_Saved[savename] = zTip_Saved[slidername]
			zTip_Saved[xo] = zTip_Saved[xo.."E"]
			zTip_Saved[yo] = zTip_Saved[yo.."E"]
			getglobal(xo):SetText(zTip_Saved[xo.."E"])
			getglobal(yo):SetText(zTip_Saved[yo.."E"])
		end
	elseif type ==5 then
		if name:GetChecked() == nil then
			zTip_Saved[savename] = false
		elseif name:GetChecked() == 1 then
			sliderframename:SetValue(zTip_Saved[slidernum])
			zTip_Saved[savename] = zTip_Saved[slidername]
		end
	end
end)
end
function gmtip(name,tip1,tip2)
	name:SetScript("OnEnter",function()
		GameTooltip:ClearLines();
		GameTooltip:SetOwner(name, "ANCHOR_TOPLEFT")
		GameTooltip:AddLine(tip1)
		GameTooltip:AddLine(tip2,1,1,1)
		GameTooltip:Show()
	end)
end

--设置面板
local setwindows = CreateFrame("Frame", nil, UIParent);
setwindows:SetPoint("CENTER",UIParent)
setwindows:SetHeight(600)
setwindows:SetWidth(540)
setwindows:SetMovable(true)
setwindows:SetClampedToScreen(true)
setwindows:Hide()
setwindows.border = CreateFrame("Frame", nil, setwindows);
setwindows.border:SetHeight(470)
setwindows.border:SetWidth(490)
setwindows.border:SetPoint("CENTER",setwindows)
setwindows.border:SetBackdrop({
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
	tile = true, 
	tileSize = 32,
	edgeSize = 32,
	insets = {left = 11, right = 12, top = 12, bottom = 11},
})
setwindows.Header = setwindows.border:CreateTexture(nil,"ARTWORK")
setwindows.Header:SetHeight(64)
setwindows.Header:SetWidth(256)
setwindows.Header:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
setwindows.Header:SetPoint("TOP",setwindows.border,0,12)
setwindows.HeaderText = setwindows.border:CreateFontString(nil, "ARTWORK", "GameFontNormal")
setwindows.HeaderText:SetText("zTip设置")
setwindows.HeaderText:SetPoint("TOP",setwindows.border)
setwindows.DragBar = CreateFrame("Frame", nil, setwindows.border)
setwindows.DragBar:SetPoint("TOPLEFT", setwindows.Header, "TOPLEFT", 0, 0)
setwindows.DragBar:SetPoint("BOTTOMRIGHT", setwindows.Header, "BOTTOMRIGHT", 0, 0)
setwindows.DragBar:EnableMouse(true)
setwindows.DragBar:SetScript("OnMouseDown", function()
	if arg1 == "LeftButton" then
		setwindows:StartMoving()
	end
end)
setwindows.DragBar:SetScript("OnMouseUp", function()
	setwindows:StopMovingOrSizing()
end)
setwindows.DragBar:SetScript("OnHide", function()
	setwindows:StopMovingOrSizing()
end)
gmtip(setwindows.DragBar, "拖动窗口", "按住标题区域左键可拖动 zTip 设置窗口")
setwindows.Close = CreateFrame("Button", nil, setwindows.border,"OptionsButtonTemplate");
setwindows.Close:SetPoint("BOTTOM",setwindows.border,"BOTTOM",50,15)
setwindows.Close:SetText("关闭")
setwindows.DefaultSet = CreateFrame("Button", nil, setwindows.border,"OptionsButtonTemplate");
setwindows.DefaultSet:SetPoint("BOTTOM",setwindows.border,"BOTTOM",-50,15)
setwindows.DefaultSet:SetText("默认设置")

setwindows.zAnchor = checkbutton(zAnchor,setwindows.border, "偏移设置")
setwindows.zAnchor:SetPoint("TOPLEFT",setwindows.border,20,-55)
gmtip(setwindows.zAnchor, "鼠标提示偏移设置", "[反选使用系统默认位置(屏幕右下角)]\n[1为人物信息跟随鼠标，非人物（按钮之类）使用默认位置（屏幕右下角）]\n[2为屏幕上方，注意用偏移量调整相对位置，非人物为默认位置（屏幕右下角）]\n[3为全部跟随鼠标，非人物(按钮之类)为对象右上]\n[4为屏幕上方，注意用偏移量调整相对位置，非人物为对象右上]\n[5为全部跟随鼠标，并向上延展，要正上方，将偏移量设置为0即可]")
setwindows.zAnchorSlider = slider(setwindows.zAnchor,"偏移设置参数",1,5,1)
setwindows.zAnchorSlider:SetPoint("LEFT",setwindows.zAnchor,"RIGHT",200,20)
setwindows.zOffset = setwindows.zAnchor:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
setwindows.zOffset:SetPoint("TOP",setwindows.zAnchorSlider,"BOTTOM",0,-2)
setwindows.zOffset:SetText("偏移量")
setwindows.zOffsetX = editbox(setwindows.zAnchor,"zOffsetX")
setwindows.zOffsetX:SetPoint("TOPLEFT",setwindows.zAnchorSlider,"BOTTOMLEFT",10,-15)
setwindows.zOffsetXtext = setwindows.zOffsetX:CreateFontString(nil,"ARTWORK","GameFontNormal")
setwindows.zOffsetXtext:SetText("X")
setwindows.zOffsetXtext:SetPoint("RIGHT",setwindows.zOffsetX,"LEFT")
setwindows.zOffsetY = editbox(setwindows.zAnchor,"zOffsetY")
setwindows.zOffsetY:SetPoint("TOPRIGHT",setwindows.zAnchorSlider,"BOTTOMRIGHT",0,-15)
setwindows.zOffsetYtext = setwindows.zOffsetY:CreateFontString(nil,"ARTWORK","GameFontNormal")
setwindows.zOffsetYtext:SetText("Y")
setwindows.zOffsetYtext:SetPoint("RIGHT",setwindows.zOffsetY,"LEFT")

setwindows.zOrigPos = checkbutton(zOrigPos,setwindows.border, "系统默认位置偏移量")
setwindows.zOrigPos:SetPoint("TOPLEFT",setwindows.border,20,-105)
gmtip(setwindows.zOrigPos, "系统默认位置偏移设置", "系统默认位置的偏移值，反选使用游戏默认设置")
setwindows.zOrigPosX = editbox(setwindows.zOrigPos,"zOrigPosX")
setwindows.zOrigPosX:SetPoint("LEFT",setwindows.zOrigPos,"RIGHT",210,0)
setwindows.zOrigPosXtext = setwindows.zOrigPosX:CreateFontString(nil,"ARTWORK","GameFontNormal")
setwindows.zOrigPosXtext:SetPoint("RIGHT",setwindows.zOrigPosX,"LEFT")
setwindows.zOrigPosXtext:SetText("X")
setwindows.zOrigPosY = editbox(setwindows.zOrigPos,"zOrigPosY")
setwindows.zOrigPosY:SetPoint("LEFT",setwindows.zOrigPosX,"RIGHT",20,0)
setwindows.zOrigPosYtext = setwindows.zOrigPosY:CreateFontString(nil,"ARTWORK","GameFontNormal")
setwindows.zOrigPosYtext:SetPoint("RIGHT",setwindows.zOrigPosY,"LEFT")
setwindows.zOrigPosYtext:SetText("Y")

setwindows.zScale = checkbutton(zScale,setwindows.border, "缩放")
setwindows.zScale:SetPoint("TOP",setwindows.zOrigPos,"BOTTOM",0,-2)
gmtip(setwindows.zScale, "提示框缩放设置", "提示框缩放，反选使用默认设置")
setwindows.zScaleSlider = slider(setwindows.zScale,"缩放参数",1,10,1)
setwindows.zScaleSlider:SetPoint("LEFT",setwindows.zScale,"RIGHT",200,0)


setwindows.zGuildColorAlpha = checkbutton(zGuildColorAlpha,setwindows.border, "公会明暗度")
setwindows.zGuildColorAlpha:SetPoint("TOP",setwindows.zScale,"BOTTOM",0,-2)
gmtip(setwindows.zGuildColorAlpha, "公会明暗度设置", "公会名的明暗度设置")
setwindows.zGuildColorAlphaSlider = slider(setwindows.zGuildColorAlpha,"明暗度参数",0,100,1)
setwindows.zGuildColorAlphaSlider:SetPoint("LEFT",setwindows.zGuildColorAlpha,"RIGHT",200,0)

setwindows.zDisplayPvPRank = checkbutton(zDisplayPvPRank,setwindows.border, "显示军衔")
setwindows.zDisplayPvPRank:SetPoint("TOP",setwindows.zGuildColorAlpha,"BOTTOM",0,-2)
gmtip(setwindows.zDisplayPvPRank, "显示军衔", "反选不显示，1显示文字，2显示图标，3显示文字和图标")
setwindows.zDisplayPvPRankSlider = slider(setwindows.zDisplayPvPRank,"军衔参数",1,3,1)
setwindows.zDisplayPvPRankSlider:SetPoint("LEFT",setwindows.zDisplayPvPRank,"RIGHT",200,0)

setwindows.zFade = checkbutton(zFade,setwindows.border, "是否渐隐")
setwindows.zFade:SetPoint("TOP",setwindows.zDisplayPvPRank,"BOTTOM",0,-2)
gmtip(setwindows.zFade, "鼠标提示渐隐设置", "勾选启用，反选禁用")

setwindows.zClassIcon = checkbutton(zClassIcon,setwindows.border, "是否显示职业图标")
setwindows.zClassIcon:SetPoint("LEFT",setwindows.zFade,"RIGHT",200,0)
gmtip(setwindows.zClassIcon, "显示职业图标", "反选不显示，勾选显示")

setwindows.zShowIsPlayer = checkbutton(zShowIsPlayer,setwindows.border, "等级行是否显示“玩家”字样")
setwindows.zShowIsPlayer:SetPoint("TOP",setwindows.zFade,"BOTTOM",0,-2)
gmtip(setwindows.zShowIsPlayer, "在等级行显示“玩家”字样", "反选不显示，勾选显示")

setwindows.zDisplayFaction = checkbutton(zDisplayFaction,setwindows.border, "是否显示NPC声望等级")
setwindows.zDisplayFaction:SetPoint("LEFT",setwindows.zShowIsPlayer,"RIGHT",200,0)
gmtip(setwindows.zDisplayFaction, "显示NPC声望等级", "是否显示NPC声望等级(注意如果声望面板中折叠了该阵营有可能无法区分崇敬和崇拜！)")

setwindows.zShowChallenges = checkbutton(zShowChallenges,setwindows.border, "显示挑战模式")
setwindows.zShowChallenges:SetPoint("TOP",setwindows.zShowIsPlayer,"BOTTOM",0,-2)
gmtip(setwindows.zShowChallenges, "显示挑战模式", "显示乌龟模式、硬核模式、流浪模式等玩家挑战状态")

setwindows.zTargetOfMouse = checkbutton(zTargetOfMouse,setwindows.border, "是否显示对象的目标")
setwindows.zTargetOfMouse:SetPoint("LEFT",setwindows.zShowChallenges,"RIGHT",200,0)
gmtip(setwindows.zTargetOfMouse, "显示鼠标对像的目标", "反选不显示，勾选显示")

setwindows.zShowResist = checkbutton(zShowResist,setwindows.border, "显示抗性与护甲")
setwindows.zShowResist:SetPoint("TOP",setwindows.zShowChallenges,"BOTTOM",0,-2)
gmtip(setwindows.zShowResist, "显示抗性与护甲", "显示目标的火抗、冰抗、自然抗、暗抗与护甲")

setwindows.zShowManaBar = checkbutton(zShowManaBar,setwindows.border, "显示法力能量条")
setwindows.zShowManaBar:SetPoint("LEFT",setwindows.zShowResist,"RIGHT",200,0)
gmtip(setwindows.zShowManaBar, "显示法力/能量条", "在鼠标提示底部显示目标的法力、能量或怒气条")

setwindows.zHighlightOwnGuild = checkbutton(zHighlightOwnGuild,setwindows.border, "高亮本公会名称")
setwindows.zHighlightOwnGuild:SetPoint("TOP",setwindows.zShowResist,"BOTTOM",0,-2)
gmtip(setwindows.zHighlightOwnGuild, "高亮本公会名称", "当目标与自己同公会时，使用更醒目的颜色显示公会行")

setwindows.zColorHealthBar = checkbutton(zColorHealthBar,setwindows.border, "血条随血量染色")
setwindows.zColorHealthBar:SetPoint("LEFT",setwindows.zHighlightOwnGuild,"RIGHT",200,0)
gmtip(setwindows.zColorHealthBar, "血条随血量染色", "按照目标当前血量百分比给 tooltip 血条着色")

setwindows.zHidePvPLine = checkbutton(zHidePvPLine,setwindows.border, "隐藏PVP状态行")
setwindows.zHidePvPLine:SetPoint("TOP",setwindows.zHighlightOwnGuild,"BOTTOM",0,-2)
gmtip(setwindows.zHidePvPLine, "隐藏PVP状态行", "隐藏系统原始的 PvP 状态文字，使 tooltip 信息更紧凑")

function LoadSet()

end
setwindows.Close:SetScript("OnClick",function()
	setwindows:Hide()
end)
setwindows.DefaultSet:SetScript("OnClick",function()
	zTip_Saved = {}
	zTip_LoadSaved()
	setwindows:Hide()
end)

setwindows:SetScript("OnShow",function()
	if zAnchor == false then
		setwindows.zAnchor:SetChecked(nil)
		setwindows.zAnchorSlider:Hide()
		setwindows.zOffset:Hide()
		setwindows.zOffsetX:Hide()
		setwindows.zOffsetY:Hide()
	else
		setwindows.zAnchor:SetChecked(1)
		setwindows.zAnchorSlider:Show()
		setwindows.zOffset:Show()
		setwindows.zOffsetX:Show()
		setwindows.zOffsetY:Show()
		setwindows.zOffsetX:SetText(zTip_Saved["zOffsetXE"])
		setwindows.zOffsetY:SetText(zTip_Saved["zOffsetYE"])
		setwindows.zAnchorSlider:SetValue(zTip_Saved["AnchorSlider"])
	end
	if zTip_Saved["zOrigPos"] == false then
		setwindows.zOrigPos:SetChecked(nil)
		setwindows.zOrigPosX:Hide()
		setwindows.zOrigPosY:Hide()
	else
		setwindows.zOrigPos:SetChecked(1)
		setwindows.zOrigPosX:Show()
		setwindows.zOrigPosY:Show()
		setwindows.zOrigPosX:SetText(zTip_Saved["zOrigPosXE"])
		setwindows.zOrigPosY:SetText(zTip_Saved["zOrigPosYE"])
	end
	if zTip_Saved["zScaleShow"] == false then
		setwindows.zScale:SetChecked(nil)
		setwindows.zScaleSlider:Hide()
	else
		setwindows.zScale:SetChecked(1)
		setwindows.zScaleSlider:Show()
		setwindows.zScaleSlider:SetValue(zTip_Saved["ScaleSlider"])
	end
	if zTip_Saved["zGuildColorAlphaShow"] == false then
		setwindows.zGuildColorAlpha:SetChecked(nil)
		setwindows.zGuildColorAlphaSlider:Hide()
	else
		setwindows.zGuildColorAlpha:SetChecked(1)
		setwindows.zGuildColorAlphaSlider:Show()
		setwindows.zGuildColorAlphaSlider:SetValue(zTip_Saved["GuildColorAlphaSlider"])
	end
	if zDisplayPvPRank == false then
		setwindows.zDisplayPvPRank:SetChecked(nil)
		setwindows.zDisplayPvPRankSlider:Hide()
	else
		setwindows.zDisplayPvPRank:SetChecked(1)
		setwindows.zDisplayPvPRankSlider:Show()
		setwindows.zDisplayPvPRankSlider:SetValue(zTip_Saved["DisplayPvPRankSlider"])
	end
	if zFade == false then
		setwindows.zFade:SetChecked(nil)
	else
		setwindows.zFade:SetChecked(1)
	end
	if zClassIcon == false then
		setwindows.zClassIcon:SetChecked(nil)
	else
		setwindows.zClassIcon:SetChecked(1)
	end
	if zShowIsPlayer == false then
		setwindows.zShowIsPlayer:SetChecked(nil)
	else
		setwindows.zShowIsPlayer:SetChecked(1)
	end
	if zDisplayFaction == false then
		setwindows.zDisplayFaction:SetChecked(nil)
	else
		setwindows.zDisplayFaction:SetChecked(1)
	end
	if zTargetOfMouse == false then
		setwindows.zTargetOfMouse:SetChecked(nil)
	else
		setwindows.zTargetOfMouse:SetChecked(1)
	end
	if zShowChallenges == false then
		setwindows.zShowChallenges:SetChecked(nil)
	else
		setwindows.zShowChallenges:SetChecked(1)
	end
	if zShowManaBar == false then
		setwindows.zShowManaBar:SetChecked(nil)
	else
		setwindows.zShowManaBar:SetChecked(1)
	end
	if zShowResist == false then
		setwindows.zShowResist:SetChecked(nil)
	else
		setwindows.zShowResist:SetChecked(1)
	end
	if zColorHealthBar == false then
		setwindows.zColorHealthBar:SetChecked(nil)
	else
		setwindows.zColorHealthBar:SetChecked(1)
	end
	if zHighlightOwnGuild == false then
		setwindows.zHighlightOwnGuild:SetChecked(nil)
	else
		setwindows.zHighlightOwnGuild:SetChecked(1)
	end
	if zHidePvPLine == false then
		setwindows.zHidePvPLine:SetChecked(nil)
	else
		setwindows.zHidePvPLine:SetChecked(1)
	end
end)
setwindows:SetScript("OnUpdate",function()
	if zAnchor == false then
		setwindows.zAnchorSlider:Hide()
		setwindows.zOffset:Hide()
		setwindows.zOffsetX:Hide()
		setwindows.zOffsetY:Hide()
	else
		setwindows.zAnchorSlider:Show()
		setwindows.zOffset:Show()
		setwindows.zOffsetX:Show()
		setwindows.zOffsetY:Show()
		zTip_Saved["zOffsetX"] = zTip_Saved["zOffsetXE"]
		zTip_Saved["zOffsetY"] = zTip_Saved["zOffsetYE"]
	end
	if zTip_Saved["zOrigPos"] == false then
		setwindows.zOrigPosX:Hide()
		setwindows.zOrigPosY:Hide()
	else
		setwindows.zOrigPosX:Show()
		setwindows.zOrigPosY:Show()
		zTip_Saved["zOrigPosX"] = zTip_Saved["zOrigPosXE"]
		zTip_Saved["zOrigPosY"] = zTip_Saved["zOrigPosYE"]
	end
	if zTip_Saved["zScaleShow"] == false then
		setwindows.zScaleSlider:Hide()
		zTip_Saved["zScale"] = 1
	else
		setwindows.zScaleSlider:Show()
		zTip_Saved["zScale"] = zTip_Saved["ScaleSlider"]/10
	end
	if zTip_Saved["zGuildColorAlphaShow"] == false then
		setwindows.zGuildColorAlphaSlider:Hide()
		zTip_Saved["zGuildColorAlpha"] = 1
	else
		setwindows.zGuildColorAlphaSlider:Show()
		zTip_Saved["zGuildColorAlpha"] = zTip_Saved["GuildColorAlphaSlider"]/100
	end
	if zDisplayPvPRank == false then
		setwindows.zDisplayPvPRankSlider:Hide()
	else
		setwindows.zDisplayPvPRankSlider:Show()
		setwindows.zDisplayPvPRankSlider:SetValue(zTip_Saved["DisplayPvPRankSlider"])
	end

	zAnchor = zTip_Saved["zAnchor"]
	zOffsetX = zTip_Saved["zOffsetX"]
	zOffsetY = zTip_Saved["zOffsetY"]
	zOrigPosX = zTip_Saved["zOrigPosX"]
	zOrigPosY = zTip_Saved["zOrigPosY"]
	zScale = zTip_Saved["zScale"]
	zGuildColorAlpha = zTip_Saved["zGuildColorAlpha"]
	zFade = zTip_Saved["zFade"]
	zDisplayPvPRank = zTip_Saved["zDisplayPvPRank"]
	zClassIcon = zTip_Saved["zClassIcon"]
	zShowIsPlayer = zTip_Saved["zShowIsPlayer"]
	zDisplayFaction = zTip_Saved["zDisplayFaction"]
	zTargetOfMouse = zTip_Saved["zTargetOfMouse"]
	zShowChallenges = zTip_Saved["zShowChallenges"]
	zShowResist = zTip_Saved["zShowResist"]
	zShowManaBar = zTip_Saved["zShowManaBar"]
	zColorHealthBar = zTip_Saved["zColorHealthBar"]
	zHighlightOwnGuild = zTip_Saved["zHighlightOwnGuild"]
	zHidePvPLine = zTip_Saved["zHidePvPLine"]
end)

editcheckbutton(setwindows.zAnchor,"AnchorSlider","zAnchor",4,"zOffsetX","zOffsetY",setwindows.zAnchorSlider)
editcheckbutton(setwindows.zOrigPos,nil,"zOrigPos",2)
editcheckbutton(setwindows.zScale,"ScaleSlider","zScaleShow",1,nil,nil,setwindows.zScaleSlider)
editcheckbutton(setwindows.zGuildColorAlpha,nil,"zGuildColorAlphaShow",5,nil,nil,setwindows.zGuildColorAlphaSlider,"GuildColorAlphaSlider")
editcheckbutton(setwindows.zDisplayPvPRank,"DisplayPvPRankSlider","zDisplayPvPRank",1,nil,nil,setwindows.zDisplayPvPRankSlider)
editcheckbutton(setwindows.zFade,nil,"zFade",3)
editcheckbutton(setwindows.zClassIcon,nil,"zClassIcon",3)
editcheckbutton(setwindows.zShowIsPlayer,nil,"zShowIsPlayer",3)
editcheckbutton(setwindows.zDisplayFaction,nil,"zDisplayFaction",3)
editcheckbutton(setwindows.zTargetOfMouse,nil,"zTargetOfMouse",3)
editcheckbutton(setwindows.zShowChallenges,nil,"zShowChallenges",3)
editcheckbutton(setwindows.zShowManaBar,nil,"zShowManaBar",3)
editcheckbutton(setwindows.zShowResist,nil,"zShowResist",3)
editcheckbutton(setwindows.zColorHealthBar,nil,"zColorHealthBar",3)
editcheckbutton(setwindows.zHighlightOwnGuild,nil,"zHighlightOwnGuild",3)
editcheckbutton(setwindows.zHidePvPLine,nil,"zHidePvPLine",3)

editslider(setwindows.zAnchorSlider,"AnchorSlider","zAnchor")
editslider(setwindows.zScaleSlider,"ScaleSlider","zScale")
editslider(setwindows.zGuildColorAlphaSlider,"GuildColorAlphaSlider","zGuildColorAlpha")
editslider(setwindows.zDisplayPvPRankSlider,"DisplayPvPRankSlider","zDisplayPvPRank")

editboxedit(setwindows.zOffsetX,"zOffsetXE")
editboxedit(setwindows.zOffsetY,"zOffsetYE")
editboxedit(setwindows.zOrigPosX,"zOrigPosXE")
editboxedit(setwindows.zOrigPosY,"zOrigPosYE")
--------------------------------------------------------------------
-- Don't change these locals here, change them below.
local locRare
local locTargeting
local locYOU
local locSelf
local locNotSpecified

-- Localization
local tmp = GetLocale()
if tmp == "zhCN" then
	locRare			= "稀有"
	locTargeting	= "目标"
	locYOU			= ">> 你 <<"
	locSelf			= "自己"
	locNotSpecified	= "未指定"
	locSpecified	= "变异生物"
elseif tmp == "zhTW" then
	locRare			= "稀有"
	locTargeting	= "目標"
	locYOU			= ">> 你 <<"
	locSelf			= "自己"
	locNotSpecified	= "未指定"
	locSpecified	= "變異生物"
elseif tmp == "enUS" then
	locRare			= "Rare"
	locTargeting	= "Targeting"
	locYOU			= ">> U <<"
	locSelf			= "Self"
	locNotSpecified	= "Not specified"
	locSpecified	= "Freak"
end

--[[
	file locals
--]]
-- translate a color object into hex color string
local function zGetHexColor(color)
	if not color then
		return "FFFFFF"
	else
		return string.format("%02x%02x%02x", color.r * 255, color.g * 255, color.b * 255)
	end
end
local function zGetUnitFaction(unit)
	local id = UnitReaction(unit, "player")
	if not id then return "" end
	if id > 6 then
		local label
		for i = GameTooltip:NumLines(), 1, -1 do
			label = getglobal("GameTooltipTextLeft"..i):GetText()
			if label and label ~= PVP_ENABLED then break end
		end
		local name, standingId, isHeader
		for i = 1, GetNumFactions() do
			name, _, standingId, _, _, _, _,_, isHeader, _, _ = GetFactionInfo(i)
			if isHeader == nil and name == label then
				id = standingId
				break
			end
		end
	end
	local ret = GetText("FACTION_STANDING_LABEL"..id, UnitSex("player"))
	if id == 5 then ret = format("|cff33CC33%s|r", ret)
	elseif id == 6 then ret = format("|cff33CCCC%s|r", ret)
	elseif id == 7 then ret = format("|cffFF6633%s|r", ret)
	elseif id == 8 then ret = format("|cffDD33DD%s|r", ret) end

	return ret
end
--[[ before show ]]
local z_ClassIcon, targetlinenum
local RankIcon --军衔图标
local targetlinetrue = 0 --显示目标
local ShowChallenges_timer = 0 --显示玩家挑战项目
local function zTipOnShow()
	local found
	local trueNum = GameTooltip:NumLines()
	for i = 3, trueNum do
		--~ 删除PVP字符
		if zHidePvPLine ~= false and getglobal("GameTooltipTextLeft"..i):GetText() == PVP_ENABLED then
			getglobal("GameTooltipTextLeft"..i):SetText()
			found = true
		end
	end
	--原目标显示位置注释掉
	--[[if not zTargetOfMouse then return end 
	targetlinenum = trueNum
	if not found then
		GameTooltip:AddLine("zTip -- target line")
		targetlinenum = targetlinenum + 1
	end
	tmp = getglobal("GameTooltipTextLeft"..targetlinenum)
	if tmp then
		tmp:SetText()
	else
		targetlinenum = nil
	end]]
end

--鼠标血条随着血量变化染色
function zTip_HealthBar_OnValueChanged(value, smooth)
	if not value then return end
	if zColorHealthBar == false then return end

	if this == GameTooltipStatusBar then
		this:SetStatusBarColor(SetPercentColor(UnitHealth("mouseover"), UnitHealthMax("mouseover")))
	end
end

hooksecurefunc("HealthBar_OnValueChanged", zTip_HealthBar_OnValueChanged, true)

--[[
	tip format
--]]
local tmp1, tmp2, tip, text, text1, text2, levelline		-- var continually used, local in file
function zTipFormat(unit)
--[[
	local values and initials
--]]
	local r, g, b
	local isplayer = UnitIsPlayer(unit)
	
	--~ 尸体，排除猎人假死
	local bdead = UnitHealth(unit) <= 0 and (not isplayer or UnitIsDeadOrGhost(unit))
	local tapped = UnitIsTapped(unit) and (not UnitIsTappedByPlayer(unit))
	
	-- 1 憎恶 2 敌对 3 不善 4 中立 5 友好 6 尊敬 7 崇拜 8 ？？
	local reaction = UnitReaction(unit, "player")
	
--[[
	New Way
--]]
	tip, text, levelline, tmp, tmp2 = nil
	
	--[[ Serch and Delete ]]
	for i = 2, GameTooltip:NumLines() do
		text = getglobal(GameTooltip:GetName().."TextLeft"..i)
		tip = text:GetText()
		if tip then
			--~ 查找等级行
			if string.find(tip, LEVEL) then
				if not levelline then
					levelline = i
				end
			-- 能否驯服
			elseif tip == TAMEABLE then
				text:SetText( format("|cff00FF00%s|r", tip) )
			elseif tip == NOT_TAMEABLE then
				text:SetText( format("|cffFF6035%s|r", tip) )
			end
		end
	end
	
	--[[ Level Line Rewrite ]]
	if levelline then
		-- level, and corpse if dead
		tmp = UnitLevel(unit)
		tmp2 = ""
		if bdead then
			if tmp > 0 then
				tmp2 = format("|cff888888等级 %d %s|r", tmp, CORPSE)
			else
				tmp2 = format("|cff888888等级 ?? %s|r", CORPSE)
			end
		elseif ( tmp > 0 ) then
			-- Color level number
			if UnitCanAttack("player", unit) or UnitCanAttack(unit, "player") then
				tmp2 = format("|cff%s等级 %d|r",zGetHexColor(GetDifficultyColor(tmp)),tmp)
			else
				-- normal color
				tmp2 = format("|cff3377CC等级 %d|r",tmp)
			end
		else
			-- Target is too high level to tell
			tmp2 = "|cffFF0000等级  ??|r"
		end
		
		-- race, class/ creature type/ creature family(pet)
		if UnitRace(unit) and isplayer then
			--race, it is a player
			if UnitFactionGroup(unit) == UnitFactionGroup("player") then
				tmp = "00FF33"
			else
				tmp = "FF3300"  -- 敌对阵营种族为暗红
			end
			tmp2 = format("%s |cff%s%s|r", tmp2, tmp, UnitRace(unit))
			-- 职业
			_, tmp = UnitClass(unit)
			tmp = zGetHexColor(RAID_CLASS_COLORS[(tmp or "")])
			tmp2 = format("%s |cff%s%s|r", tmp2, tmp, UnitClass(unit))
		elseif UnitPlayerControlled(unit) then
			--creature family, its is a pet
			-- 非战斗宠没有物种的用类型
			tmp2 = format("%s %s ",tmp2,(UnitCreatureFamily(unit) or UnitCreatureType(unit) or "") )
		elseif UnitCreatureType(unit) then
			--creature type, it is a mob or npc
			if zDisplayFaction and reaction and reaction > 4 then
				tmp2 = format("%s |cffFFFFFF%s|r %s ", tmp2, UnitCreatureType(unit), zGetUnitFaction(unit))
			elseif UnitCreatureType(unit) == locNotSpecified then
				tmp2 = format("%s %s ", tmp2, locSpecified)
			else
				tmp2 = format("%s %s ", tmp2, UnitCreatureType(unit))
			end
		else
			tmp2 = format("%s %s ",tmp2,UKNOWNBEING)
		end
		tip = tmp2
		
		-- special info
		tmp = nil
		tmp2 = ""
		if isplayer then
			if zShowIsPlayer then
				tmp2 = format("(%s)",PLAYER)
			end
		elseif not UnitPlayerControlled(unit) then
			tmp = UnitClassification(unit) -- Elite status
			if tmp and tmp ~= "normal" and UnitHealth(unit) > 0 then
				if tmp == "elite" then
					tmp2 = format("|cffFFFF33(%s)|r", ELITE)
				elseif tmp == "worldboss" then
					tmp2 = format("|cffFF0000(%s)|r", BOSS)
				elseif tmp == "rare" then
					tmp2 = format("|cffFF66FF(%s)|r", locRare)
				elseif tmp == "rareelite" then
					tmp2 = format("|cffFFAAFF(%s %s)|r", locRare, ELITE)
				else
					tmp2 = format("(%s)", tmp) -- unknown type
				end
			end
		end
		getglobal("GameTooltipTextLeft"..levelline):SetText( tip..tmp2 )
	end
	
	--[[ First Line ]]
	text = GameTooltipTextLeft1

	tip = text:GetText()
	if isplayer == 1 then
		--职业图标、军衔
		z_ClassIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
		local coord = CLASS_ICON_TCOORDS[select(2, UnitClass(unit))]
		if coord then
			z_ClassIcon:SetTexCoord(unpack(coord))
		end
		--新职业图标、军衔显示与隐藏
		tmp = UnitPVPRank(unit)
		tmp1, tmp2 = GetPVPRankInfo(tmp,unit)
		if zClassIcon == 1 then
			text1 = "    "
			z_ClassIcon:Show()
		else
			text1 = ""
			z_ClassIcon:Hide()
		end
		if zDisplayPvPRank and zDisplayPvPRank > 1 and tmp > 0 then --修复军衔显示设置为false报错
			text2 = "    "
			RankIcon:Show()
		else
			text2 = ""
			RankIcon:Hide()
		end	
		--获取目标头衔
		local titletext = UnitPVPName(unit)
		if titletext then
			if tmp>0 then
				titletext = string.gsub(titletext,tmp1,"")
			end
			titletext = string.gsub(titletext,UnitName(unit),"")
		else
			titletext = ""
		end

		if zDisplayPvPRank and zDisplayPvPRank == 2 then --修复军衔显示设置为false报错
			text:SetText(text1..text2..UnitName(unit)..titletext)
		elseif tmp >0 and zDisplayPvPRank and zDisplayPvPRank >= 1 then --修复军衔显示设置为false报错
			text:SetText(text1..text2..UnitName(unit).."|CFFCCCC33 ".. tmp1 .."|r"..titletext)
		else
			text:SetText(text1..text2..UnitName(unit)..titletext)
		end
		RankIcon:SetTexture(format("%s%02d","Interface\\PvPRankBadges\\PvPRank", tmp2))
		if tmp2 > 5 then RankIcon:SetAlpha(1) else RankIcon:SetAlpha(0.66) end
		--原军衔、职业显示注释掉
		--[[if zClassIcon == 1 and zDisplayPvPRank == 1 then
			if tmp > 0 then
				text:SetText("    "..UnitName(unit).."|CFFCCCC33 ".. tmp2 .."|r")
			else
				text:SetText("    "..UnitName(unit))
			end
			z_ClassIcon:Show()
		elseif zClassIcon == 1 and not zDisplayPvPRank then
			text:SetText("    "..UnitName(unit))
			z_ClassIcon:Show()
		elseif not zClassIcon and zDisplayPvPRank == 1 then
			text:SetText(UnitName(unit).."|CFFCCCC33 ".. tmp2 .. "|r")
			z_ClassIcon:Hide()
		elseif not zClassIcon and not zDisplayPvPRank then
			text:SetText(UnitName(unit))
			z_ClassIcon:Hide()
		end]]
	end
	
	--[[ Second Line Rewrite / Insert ]]
	tip = nil
	if isplayer then
		-- 工会
		tmp2 = GetGuildInfo(unit)
		if tmp2 then
			tip = "<"..tmp2..">"
		end
	end
	if tip then
		tmp = GameTooltip:NumLines()
		GameTooltip:AddLine("zTip -- this is Add Line")
		for i = tmp, 2, -1 do
			text = getglobal("GameTooltipTextLeft"..i+1)
			text:SetText(getglobal("GameTooltipTextLeft"..i):GetText())
		end
		GameTooltipTextLeft2:SetText(tip)
		--原目标显示位置注释掉
		--[[if zTargetOfMouse and targetlinenum then
			targetlinenum = targetlinenum + 1
		end]]
	end
	
	--显示抗性
	GetMouseOverResist()
	
	--[[ Colors ]]
--~ 第一行名字上色
	if tapped or bdead then
		r = 0.55;g = 0.55;b = 0.55
	elseif (UnitIsPlayer(unit) or UnitPlayerControlled(unit) ) then
		if ( UnitCanAttack(unit, "player") ) then
			if ( not UnitCanAttack("player", unit) ) then
				--purple, caution, only they can attack
				r = 1.0;g = 0.4;b = 1.0
			else
				-- Hostile players are red
				r = 1.0;g = 0.0;b = 0.0
			end
		elseif ( UnitCanAttack("player", unit) ) then
			-- Players we can attack but which are not hostile are yellow
			r = 1.0;g = 1.0;b = 0.0
		elseif ( UnitIsPVP(unit) ) then
			-- Players we can assist but are PvP flagged are green
			r = 0.0;g = 1.0;b = 0.0
		else
			-- All other players are blue (the usual state on the "blue" server)
			r = 0;g = 0.7;b = 1.0
		end
	elseif reaction then
		-- mob/npc use system default color
		if reaction < 4 then
			r,g,b = 1,0.3,0.22
		elseif reaction > 4 then
			r,g,b = 0,1,0
		else
			r,g,b = 1,1,0
		end
	else
		r,g,b = 1,1,1
	end

--~ 给第二行上色
	if tip or (levelline and levelline > 2) then
		if bdead or tapped then -- 尸体或已被攻击
			GameTooltipTextLeft2:SetTextColor(0.55,0.55,0.55)
		else
			GameTooltipTextLeft2:SetTextColor(r*zGuildColorAlpha,g*zGuildColorAlpha,b*zGuildColorAlpha)
		end
	end
--~ 标记本工会为亮色
	if zHighlightOwnGuild ~= false and isplayer and GetGuildInfo(unit) == GetGuildInfo("player") then
		GameTooltipTextLeft2:SetTextColor(0.9, 0.5, 0.9)
	end
	
--[[
	done
--]]

	GameTooltip:Show()
	
	return r, g, b
end

-----------------------------------------------------------------------
local zIsOnUnitFrame
local x, y, scale
local zOld_GameTooltip_SetDefaultAnchor
local function zTip_IsValidTooltipOwner(owner)
	if not owner then
		return nil
	end
	local ownerType = type(owner)
	if ownerType ~= "table" and ownerType ~= "userdata" then
		return nil
	end
	if type(owner.IsObjectType) == "function" and owner:IsObjectType("Frame") then
		return 1
	end
	return nil
end

local function zTip_NormalizeSetOwnerArgs(self, owner, anchor, x, y)
	local tooltip = self
	local tooltipOwner = owner
	local tooltipAnchor = anchor
	local tooltipX = x
	local tooltipY = y

	-- Some XML scripts still call GameTooltip.SetOwner(owner, anchor, x, y).
	if tooltip ~= GameTooltip then
		tooltipOwner = tooltip
		tooltipAnchor = owner
		tooltipX = anchor
		tooltipY = x
		tooltip = GameTooltip
	end

	if not zTip_IsValidTooltipOwner(tooltipOwner) then
		tooltipOwner = UIParent
	end
	if type(tooltipAnchor) ~= "string" then
		tooltipAnchor = nil
	end

	return tooltip, tooltipOwner, tooltipAnchor, tooltipX, tooltipY
end

local function SetDefaultAnchor(tooltip,owner)
	if tooltip ~= GameTooltip then -- debug message
		zOld_GameTooltip_SetDefaultAnchor(tooltip,owner)
		return
	end

	if not zTip_IsValidTooltipOwner(owner) then
		owner = UIParent
	end
		
	if owner == UIParent then
		if UnitExists("mouseover") then
			if zAnchor == 1 or zAnchor == 3 then -- follow cursor
				tooltip:SetOwner(owner, "ANCHOR_NONE")
			elseif zAnchor~=false then -- on top
				scale = UIParent:GetScale()
				if not scale or scale == 0 then scale = 1 end
				tmp = GameTooltip:GetScale() or 1
				x = zOffsetX / tmp / scale
				y = zOffsetY / tmp / scale
				tooltip:SetOwner(owner, "ANCHOR_NONE")
				tooltip:SetPoint("TOP",UIParent,"TOP", x, -y)
			end
		else -- not unit 熔炉，信箱等无生命的单位
			x,y = GetCursorPosition()
			scale = UIParent:GetScale()
			if(scale and scale ~= 0) then
				tmp = GameTooltip:GetScale() or 1
				x = (x + zOffsetX) / tmp / scale
				y = (y - zOffsetY) / tmp / scale
			end
			tooltip:SetOwner(owner, "ANCHOR_NONE")
			tooltip:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x, y)
		end
	else -- not a unit tip, buttons or other
		local ownerParent
		if type(owner.GetParent) == "function" then
			ownerParent = owner:GetParent()
		end
		if zAnchor~=false and (zAnchor > 2 or zIsOnUnitFrame or ownerParent == RaidFrame) then
			tooltip:SetOwner(owner,"ANCHOR_RIGHT")
		else
			zOld_GameTooltip_SetDefaultAnchor(tooltip,owner)
		end
	end
end

-----------------------------------------------------------------------
-- Overriden
--
local lastUpdate
local isUnitTipShown
local mouseTarget

-- Initial
GameTooltip:RegisterEvent("PLAYER_ENTERING_WORLD")

GameTooltip:RegisterEvent("ADDON_LOADED")
GameTooltip:SetScript("OnEvent", function()
	if ( event == "UPDATE_MOUSEOVER_UNIT" ) then
		getglobal(this:GetName().."TextLeft1"):SetTextColor(GameTooltip_UnitColor("mouseover"))
		GameTooltip.challenges = false
		GameTooltip.challengePending = nil
		targetlinetrue = 1 --目标显示
		ShowChallenges_timer = 0 --显示目标挑战项目
	elseif event == "PLAYER_ENTERING_WORLD" then
		--if zScale then GameTooltip:SetScale(zScale) end --修改
		GameTooltip_UnitColor = zTipFormat

		z_ClassIcon = GameTooltip:CreateTexture("z_ClassIcon","ARTWORK")
		z_ClassIcon:SetWidth(14) z_ClassIcon:SetHeight(14) 
		z_ClassIcon:SetPoint("TOPLEFT",GameTooltip,"TOPLEFT", 11, -11)

		RankIcon = GameTooltip:CreateTexture("RankIcon","ARTWORK")
		RankIcon:SetWidth(14) RankIcon:SetHeight(14) 
		--RankIcon:SetPoint("TOPLEFT",z_ClassIcon,"TOPRIGHT", 2, 0) --军衔位置修复

		GameTooltip.zoldSetOwner = GameTooltip.SetOwner
		function GameTooltip:SetOwner(owner,anchor,x,y)
			local tooltip, safeOwner, safeAnchor, safeX, safeY = zTip_NormalizeSetOwnerArgs(self, owner, anchor, x, y)
			if type(tooltip.zoldSetOwner) == "function" then
				tooltip.zoldSetOwner(tooltip, safeOwner, safeAnchor, safeX, safeY)
			end
			if safeOwner == UIParent and UnitExists("mouseover") then
				isUnitTipShown = true
			else
				isUnitTipShown = nil
			end
			if zDisplayPvPRank and zDisplayPvPRank > 1 then --军衔图标
				RankIcon:Hide()
			end
		end
		GameTooltip.zoldSetText = GameTooltip.SetText
		function GameTooltip:SetText(text,r,g,b,a,textWrap)
			local tooltip = self
			local tooltipText = text
			local textR, textG, textB, textA, wrap = r, g, b, a, textWrap

			-- Support accidental GameTooltip.SetText(text, ...) calls.
			if tooltip ~= GameTooltip then
				tooltipText = tooltip
				textR, textG, textB, textA, wrap = text, r, g, b, a
				tooltip = GameTooltip
			end

			if tooltipText == nil then
				tooltipText = ""
			elseif type(tooltipText) ~= "string" then
				tooltipText = tostring(tooltipText)
			end

			if type(tooltip.zoldSetText) == "function" then
				tooltip.zoldSetText(tooltip, tooltipText, textR, textG, textB, textA, wrap)
			end
		end
		function GetDifficultyColor(level)
			-- this function copyed from FastQuest
			local lDiff = level - UnitLevel("player");
			if (lDiff >= 0) then
				for i= 1.00, 0.10, -0.10 do
					color = {r = 1.00, g = i, b = 0.00};
					if ((i/0.10)==(10-lDiff)) then return color; end
				end
			elseif ( -lDiff < GetQuestGreenRange() ) then
				for i= 0.90, 0.10, -0.10 do
					color = {r = i, g = 1.00, b = 0.00};
					if ((9-i/0.10)==(-1*lDiff)) then return color; end
				end
			elseif ( -lDiff == GetQuestGreenRange() ) then
				color = {r = 0.50, g = 1.00, b = 0.50};
			else
				color = {r = 0.75, g = 0.75, b = 0.75};
			end
			return color;
		end
		local zOld_UnitFrame_OnEnter = UnitFrame_OnEnter
		UnitFrame_OnEnter = function()
			zIsOnUnitFrame = true
			local newbieTip = SHOW_NEWBIE_TIPS
			SHOW_NEWBIE_TIPS = "0"
			zOld_UnitFrame_OnEnter()
			SHOW_NEWBIE_TIPS = newbieTip
		end
		local zOld_UnitFrame_OnLeave = UnitFrame_OnLeave
		UnitFrame_OnLeave = function()
			zOld_UnitFrame_OnLeave()
			zIsOnUnitFrame = nil
			z_ClassIcon:Hide()
			if not zFade then GameTooltip:Hide() end
		end
		-- default anchor
		local func = GameTooltip_SetDefaultAnchor
		GameTooltip_SetDefaultAnchor = function(tooltip, parent)
			if not zOrigPosX or not zOrigPosY then
				func(tooltip, parent)
				return
			end
			local containerOffsetX = CONTAINER_OFFSET_X
			local containerOffsetY = CONTAINER_OFFSET_Y
			CONTAINER_OFFSET_X = zOrigPosX
			CONTAINER_OFFSET_Y = zOrigPosY
			func(tooltip, parent)
			CONTAINER_OFFSET_X = containerOffsetX
			CONTAINER_OFFSET_Y = containerOffsetY
		end
		if zAnchor ~= false then
			zOld_GameTooltip_SetDefaultAnchor = GameTooltip_SetDefaultAnchor
			GameTooltip_SetDefaultAnchor = SetDefaultAnchor
		else
			SetDefaultAnchor = nil
		end

		local zOld_GameTooltip_OnShow = GameTooltip:GetScript("OnShow") or function() end
		GameTooltip:SetScript("OnShow", function()
			zTipOnShow()
			zOld_GameTooltip_OnShow()
		end)
		this:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)

--挑战项目显示
function 	ShowChallenges_time()
	if ShowChallenges_timer<1 then
		ShowChallenges_timer = ShowChallenges_timer + 1
	end
end
local zTip_FallbackChallenges = {
	LEVELING_CHALLENGE_SLOWSTEADY,
	LEVELING_CHALLENGE_EXHAUSTION,
	LEVELING_CHALLENGE_WARMODE,
	LEVELING_CHALLENGE_HARDCORE,
	LEVELING_CHALLENGE_VAGRANT,
	LEVELING_CHALLENGE_BOARING,
	LEVELING_CHALLENGE_LUNATIC,
	LEVELING_CHALLENGE_CRAFTMASTER,
	LEVELING_CHALLENGE_BREWMASTER,
	LEVELING_CHALLENGE_HEROIC,
}

local function zTip_GetChallengeList()
	if Turtle_AvailableChallenges and table.getn(Turtle_AvailableChallenges) > 0 then
		return Turtle_AvailableChallenges
	end

	return zTip_FallbackChallenges
end

local function zTip_GetChallengeCache()
	local realm = GetRealmName()
	if not Turtle_ChallengesCache then
		Turtle_ChallengesCache = {}
	end
	if not Turtle_ChallengesCache[realm] then
		Turtle_ChallengesCache[realm] = {}
	end

	return Turtle_ChallengesCache[realm]
end

local function zTip_GetUnitGuid(unit)
	local exists, guid = UnitExists(unit)
	if exists then
		return guid
	end
end

local function zTip_AppendChallenges(mask)
	local challengeLines = {}
	local challengeMask = 1
	local isMouseoverTarget = UnitIsUnit("target", "mouseover")
	local challengeList = zTip_GetChallengeList()

	if zShowChallenges == false or GameTooltip.challenges or not mask or mask == 0 then
		return
	end

	for i = 1, table.getn(challengeList) do
		local challenge = challengeList[i]
		if mod(mask, challengeMask * 2) >= challengeMask then
			table.insert(challengeLines, challenge)
		end
		challengeMask = challengeMask * 2
	end

	if table.getn(challengeLines) == 0 then
		GameTooltip.challenges = 1
		return
	end

	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(ACTIVE_CHALLENGES)

	for i = 1, table.getn(challengeLines) do
		local challenge = challengeLines[i]
		if challenge == LEVELING_CHALLENGE_HARDCORE and isMouseoverTarget and TargetFrameTexture then
			TargetFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame_HC")
		end
		GameTooltip:AddLine(challenge, 1, 1, 1, 1)
	end

	GameTooltip.challenges = 1
	GameTooltip:Show()
end

local function zTip_UpdateChallenges(guid)
	local challengeCache = zTip_GetChallengeCache()
	local mask = challengeCache[guid]

	if mask and mask ~= 0 then
		zTip_AppendChallenges(mask)
	end
end

local function zTip_HandleChallengeResponse(message)
	local cache
	local guid
	local mask
	local mouseoverGuid
	local separator = strfind(message or "", ADDON_MSG_ARRAY_DELIMITER or ":", 1, true)

	if not separator then
		return
	end

	guid = strsub(message, 1, separator - 1)
	mask = tonumber(strsub(message, separator + 1))
	if not guid or not mask then
		return
	end

	cache = zTip_GetChallengeCache()
	cache[guid] = mask

	mouseoverGuid = zTip_GetUnitGuid("mouseover")
	if mouseoverGuid == guid then
		GameTooltip.challengePending = nil
		if mask == 0 then
			GameTooltip.challenges = 1
		else
			zTip_UpdateChallenges(guid)
		end
	end
end

local zTipChallengeFrame = CreateFrame("Frame")
zTipChallengeFrame:RegisterEvent("CHAT_MSG_ADDON")
zTipChallengeFrame:SetScript("OnEvent", function()
	if event == "CHAT_MSG_ADDON"
		and arg1 == "RESPONSE_PLAYER_CHALLENGES"
	then
		zTip_HandleChallengeResponse(arg2)
	end
end)

function zTip_CheckChallenges(unit)
	if PLAYER_CHALLENGES == "0"
	or not unit
	or not UnitIsPlayer(unit)
	or zShowChallenges == false
	or UnitIsUnit("target", "player") then return end

	local challengeCache = zTip_GetChallengeCache()
	local guid = zTip_GetUnitGuid(unit)
	if not guid then
		return
	end

	if challengeCache[guid] ~= nil then
		if challengeCache[guid] == 0 then
			if GameTooltip.challengePending ~= guid then
				GameTooltip.challenges = 1
			end
		else
			zTip_UpdateChallenges(guid)
		end
		return
	end

	GameTooltip.challengePending = guid
	if type(TargetFrame_CheckChallenges) == "function"
		and type(TargetFrame_HandleChallenges) == "function"
	then
		TargetFrame_CheckChallenges(unit)
		return
	end

	challengeCache[guid] = 0
	SendAddonMessage("TW_UI", "REQUEST_PLAYER_CHALLENGES;" .. guid, "GUILD")
end

-- New Update Way
local targetline
GameTooltip:SetScript("OnUpdate", function()
	if zScale and zScale ~= false then GameTooltip:SetScale(zScale) end --修改
	if RankIcon and z_ClassIcon and zClassIcon == false then --军衔位置修复
		RankIcon:SetPoint("TOPLEFT",z_ClassIcon,"TOPRIGHT", -14, 0)
	elseif RankIcon and z_ClassIcon then
		RankIcon:SetPoint("TOPLEFT",z_ClassIcon,"TOPRIGHT", 2, 0)
	end
	--增加的
	if ManaBar and zShowManaBar ~= false and GameTooltipStatusBar:IsShown() then
		ManaBar:Show()
	elseif ManaBar then
		ManaBar:Hide()
	end

	if z_ClassIcon and zClassIcon and this.unit and UnitIsPlayer(this.unit) and GameTooltipTextLeft1:GetText() and strfind(GameTooltipTextLeft1:GetText(), "    ") then
		z_ClassIcon:Show()
	elseif z_ClassIcon then
		z_ClassIcon:Hide()
	end
		
	if not UnitExists("mouseover") then
		if isUnitTipShown then
			if not zFade then
				GameTooltip:Hide()
			end
		end
		targetlinenum = nil
		mouseTarget = nil
		isUnitTipShown = nil
		GameTooltip.challenges = nil
		return
	end
	
	-- offset to mouse
	if zAnchor == 1 or zAnchor == 3 or zAnchor == 5 then
		x,y = GetCursorPosition()
		scale = UIParent:GetScale()
		if(scale and scale ~= 0) then
			tmp = GameTooltip:GetScale() or 1
			x = (x + zOffsetX) / tmp / scale
			if zAnchor == 5 then
				y = (y + zOffsetY) / tmp / scale
			else
				y = (y - zOffsetY) / tmp / scale
			end
		end
		GameTooltip:ClearAllPoints()
		if zAnchor == 5 then
			GameTooltip:SetPoint("BOTTOM", UIParent, "BOTTOMLEFT", x, y)
		else
			GameTooltip:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT", x, y)
		end
	end
	
	-- add target of mouse over unit
	if zTargetOfMouse == 1 then --目标显示（尽量在最后显示）
		if targetlinetrue == 1 then
			targetlinetrue = 0
			GameTooltip:AddLine(" ")
			targetlinenum = GameTooltip:NumLines()
		end
	end

	if zTargetOfMouse ~= false and targetlinenum then
		targetline = getglobal("GameTooltipTextLeft"..targetlinenum)
		if targetline then
			tip, tmp, tmp2 = nil, nil, nil
			if not UnitExists("mouseovertarget") then
				mouseTarget = nil
				targetline:SetText()
				GameTooltip:Show()
			elseif UnitName("mouseovertarget") ~= mouseTarget then
				mouseTarget = UnitName("mouseovertarget") or UNKNOWNOBJECT
				tip = format("|cffFFFF00%s [|r", locTargeting)
				-- 指向我自己
				if UnitIsUnit("mouseovertarget", "player") then
					tip = format("%s |c00FF0000%s|r", tip, locYOU)
				-- 指向他自己
				elseif UnitIsUnit("mouseovertarget", "mouseover") then
					tip = format("%s |cffFFFFFF%s|r", tip, locSelf)
				-- 指向其它玩家
				elseif UnitIsPlayer("mouseovertarget") then
					tmp, tmp2 = UnitClass("mouseovertarget")
					--鼠标玩家的目标
					tip = format("%s |cffFFFFFF%s|r |cff%s(%s)|r", tip,
						mouseTarget, zGetHexColor(RAID_CLASS_COLORS[(tmp2 or "")]), tmp)
				else
					tip = format("%s |cffFFFFFF%s|r", tip, mouseTarget)
				end
				tip = tip.." |cffFFFF00]|r"
				targetline:SetText(tip)
				GameTooltip:Show()
			end
		else
			targetlinenum = nil
		end
	end
	--显示目标挑战项目
	if zShowChallenges ~= false and ShowChallenges_timer == 1 and not GameTooltip.challenges then
		zTip_CheckChallenges("mouseover")
	else
		ShowChallenges_time()
	end
end)

--显示抗性、护甲（狗血编剧男）
function GetMouseOverResist()
	if zShowResist == false then
		return
	end

	local Moresist, mo = UnitResistance, "mouseover"
	local GetFire, GetFrost, GetNature, GetShadow, GetArmor = Moresist(mo,2), Moresist(mo,4), Moresist(mo,3), Moresist(mo,5), UnitArmor(mo)
	--火抗、冰抗
	if GetFire~=0 and GetFrost==0 then
		GameTooltip:AddLine("|cffFF0000火抗" .. GetFire)
	elseif GetFire==0 and GetFrost~=0 then
		GameTooltip:AddLine("|cff4AE8F5冰抗" .. GetFrost)
	elseif GetFire~=0 and GetFrost~=0 then
		GameTooltip:AddLine("|cffFF0000火抗" .. GetFire .. " " .. "|cff4AE8F5冰抗" .. GetFrost)
	end
	--自抗、暗抗
	if GetNature~=0 and GetShadow==0 then
		GameTooltip:AddLine("|cff00FF00自抗" .. GetNature)
	elseif GetNature==0 and GetShadow~=0 then
		GameTooltip:AddLine("|cffFF00FF暗抗" .. GetShadow)
	elseif GetNature~=0 and GetShadow~=0 then
		GameTooltip:AddLine("|cff00FF00自抗" .. GetNature .. " " .. "|cffFF00FF暗抗" .. GetShadow)
	end
	--护甲
	if GetArmor ~=0 then GameTooltip:AddLine("护甲" .. GetArmor) end
end

local acehook = {}
local _G = getfenv(0)
local GameTooltip, UIParent, GTStatusBar = _G.GameTooltip, _G.UIParent, _G.GameTooltipStatusBar

_G.TinyTip_Original_GameTooltip_SetUnit = nil
function TinyTip_SetUnit(this,unit,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)
	if unit ~= "mouseover" and _G.TinyTip_Original_GameTooltip_SetUnit then
		_G.TinyTip_Original_GameTooltip_SetUnit(this,unit,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)
	end
	GameTooltip.unit = unit
	GameTooltip.challenges = false
	GameTooltip.challengePending = nil
end

local function OnEvent()	
	if _G.event == "UPDATE_MOUSEOVER_UNIT" then
		GameTooltip.challenges = false
		GameTooltip.challengePending = nil
		if UnitExists("mouseover") then
			GameTooltip:SetUnit("mouseover")
		end
	end
end

EventFrame = _G.CreateFrame("Frame", "TinyTipEventFrame", GameTooltip)
EventFrame:SetScript("OnEvent", OnEvent)
EventFrame:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

if _G.AceLibrary and _G.AceLibrary:HasInstance("AceHook-2.0") then
	_G.AceLibrary:GetInstance("AceHook-2.0"):embed(acehook)
	if not acehook:IsHooked(GameTooltip, "SetUnit") then
		acehook:Hook(GameTooltip, "SetUnit", _G.TinyTip_SetUnit)
		_G.TinyTip_Original_GameTooltip_SetUnit = acehook.hooks[GameTooltip]["SetUnit"].orig
	end
end

local Original_GameTooltip_OnTooltipCleared
function TinyTip_OnTooltipCleared(this,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)
	if Original_GameTooltip_OnTooltipCleared then
		Original_GameTooltip_OnTooltipCleared(this,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)
	end
	GameTooltip.unit = nil
	GameTooltip.challenges = false
	GameTooltip.challengePending = nil
end

local Original_GameTooltip_OnTooltipCleared, OnTooltipCleared_IsHooked
local function OnTooltipCleared(this,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)
	if Original_GameTooltip_OnTooltipCleared then
		Original_GameTooltip_OnTooltipCleared(this,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)
	end

	_G.TinyTip_OnTooltipCleared(this,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)

	if ManaBar then
		UIParent.Hide(ManaBar)
	end
end

if acehook.IsHooked and not acehook:IsHooked(GameTooltip, "OnTooltipCleared") then -- most sure-fire way to hide something
	acehook:HookScript(GameTooltip, "OnTooltipCleared", OnTooltipCleared)
	Original_GameTooltip_OnTooltipCleared = acehook.hooks[GameTooltip]["OnTooltipCleared"].orig
end

local tmp

local function ManaBar_Init()
	if GameTooltip.unit then
		tmp = _G.UnitManaMax( GameTooltip.unit )
		ManaBar:SetMinMaxValues(0, tmp or 100)
		-- If disconnected
		if not _G.UnitIsConnected(GameTooltip.unit) then
			ManaBar:SetValue( tmp or 100 )
			ManaBar:SetStatusBarColor(0.5, 0.5, 0.5)
		else
			ManaBar:SetValue( _G.UnitMana( GameTooltip.unit ) or 100)
			tmp = _G.ManaBarColor[ _G.UnitPowerType( GameTooltip.unit ) ]
			if tmp then
				ManaBar:SetStatusBarColor( tmp.r, tmp.g, tmp.b )
			end
		end
	end
end

local function ManaBar_OnEvent()
	if _G.event == "UNIT_MANA" or _G.event == "UNIT_ENERGY" or _G.event == "UNIT_RAGE" then
		if _G.arg1 and _G.arg1 == GameTooltip.unit then
			ManaBar_Init()
		end
	elseif _G.event == "UNIT_DISPLAYPOWER" then
		if _G.arg1 and _G.arg1 == GameTooltip.unit and _G.UnitPowerType( GameTooltip.unit ) and _G.UnitPowerType( GameTooltip.unit ) > 0 then
			tmp = _G.ManaBarColor[ _G.UnitPowerType( GameTooltip.unit ) ]
			if tmp then
				ManaBar:SetStatusBarColor( tmp.r, tmp.g, tmp.b )
			end
		end
	end
end

local backdrop = {
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  tile = true, tileSize = 8, edgeSize = 12,
  insets = { left = 3, right = 3, top = 3, bottom = 3 }
}

if not ManaBar then
	ManaBar = _G.CreateFrame("StatusBar", "TinyTipExtras_ManaBar", GameTooltip)
	ManaBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-TargetingFrame-BarFill")
	ManaBar:SetHeight(8)
	ManaBar:SetPoint("TOPLEFT", GTStatusBar, "BOTTOMLEFT", 0, 0)
	ManaBar:SetPoint("TOPRIGHT", GTStatusBar, "BOTTOMRIGHT", 0, 0)
	ManaBar:SetScript("OnShow", ManaBar_Init)
	ManaBar:SetScript("OnEvent", ManaBar_OnEvent)
	ManaBar:RegisterEvent("UNIT_DISPLAYPOWER")
	ManaBar:RegisterEvent("UNIT_MANA")
	ManaBar:RegisterEvent("UNIT_ENERGY")
	ManaBar:RegisterEvent("UNIT_RAGE")
end

GameTooltipStatusBar:SetHeight(8)
GameTooltipStatusBar:ClearAllPoints()
GameTooltipStatusBar:SetPoint("TOPLEFT", GameTooltip, "BOTTOMLEFT", 4, -2)
GameTooltipStatusBar:SetPoint("TOPRIGHT", GameTooltip, "BOTTOMRIGHT", -4, 2)

SLASH_ZTIP1 = "/ztip"
SLASH_ZTIP2 = "/zTip"
SlashCmdList["ZTIP"] = function(msg)
	setwindows:Show()
end
