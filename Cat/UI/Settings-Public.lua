

-- 通用部分

function MPSettingPublic(frame)

local public = {}

local postion_y = -50

TitleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
TitleText:SetPoint("TOPLEFT", frame, "TOPLEFT", 540, postion_y)
TitleText:SetWidth(250)
TitleText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE") -- 使用OUTLINE参数
TitleText:SetTextColor(1, 0.8, 0)
TitleText:SetJustifyH("LEFT")
TitleText:SetText("通用配置")

postion_y = postion_y - 40

-- 创建单选框 - 上方饰品
local checkButton_Trinket_Upper = MPCreateCheckButton(frame, "CheckButton", 670, postion_y, "自动开启饰品(上)")
checkButton_Trinket_Upper:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Trinket_Upper = 1
    else
        MPDriudCatSaved.Trinket_Upper = 0
    end
end)
local checkButton_TUBoss = MPCreateCheckButton(frame, "CheckButton", 850, postion_y, "仅BOSS")
checkButton_TUBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.TUBoss = 1
    else
        MPDriudCatSaved.TUBoss = 0
    end
end)

postion_y = postion_y - 40

-- 创建单选框 - 下方饰品
local checkButton_Trinket_Below = MPCreateCheckButton(frame, "CheckButton", 670, postion_y, "自动开启饰品(下)")
checkButton_Trinket_Below:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.Trinket_Below = 1
    else
        MPDriudCatSaved.Trinket_Below = 0
    end
end)
local checkButton_TBBoss = MPCreateCheckButton(frame, "CheckButton", 850, postion_y, "仅BOSS")
checkButton_TBBoss:SetScript("OnClick", function(self)
    if this:GetChecked() then
        MPDriudCatSaved.TBBoss = 1
    else
        MPDriudCatSaved.TBBoss = 0
    end
end)

public.checkButton_Trinket_Upper = checkButton_Trinket_Upper
public.checkButton_TUBoss = checkButton_TUBoss
public.checkButton_Trinket_Below = checkButton_Trinket_Below
public.checkButton_TBBoss = checkButton_TBBoss

return public

end



