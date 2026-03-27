-- 全局变量定义
local XyInProgress, NewDKP, IsLeader, NoXyList,curItem,rollEndTime,rollData,isRolling = false
local Xys = 0 -- 单独初始化Xys变量为0，避免nil值错误
local LeaderName = ""  -- 存储许愿权限拥有者名称
local playerName = UnitName("player")  -- 添加当前玩家名称变量

-- safeCleanString函数定义在文件第396行，用于安全清理字符串


local XyItemCount = {}  -- 新增：用于记录物品许愿次数
LootList = {}  -- 存储拾取列表数据（全局变量，用于保存）
LootSortField = "itemName"  -- 默认排序字段（改为全局变量）
LootSortOrder = 1  -- 1为升序，-1为降序（改为全局变量）
XY_BUTTON_HEIGHT = 25;
Xy_SortOptions = { ["method"] = "", ["itemway"] = "" };
UnitPopupButtons["GET_XY"] = { text = "查询许愿", dist = 0 };
-- 同步控制变量
local lastAutoSyncTime = nil  -- 上次自动同步时间（团长用）
local lastSyncRequestTime = nil  -- 上次请求同步时间（团员用）
-- 已移除加减分数按钮
UnitPopupButtons["ADD_DKP"] = { text = "增加分数", dist = 0, nested = 1 };
UnitPopupButtons["Minus_DKP"] = { text = "扣除分数", dist = 0, nested = 1 };

-- 已移除加减分数子菜单按钮
UnitPopupButtons["ADD_DKP_1"] = { text = "增加1分", dist = 0 };
UnitPopupButtons["ADD_DKP_2"] = { text = "增加2分", dist = 0 };
UnitPopupButtons["ADD_DKP_3"] = { text = "增加3分", dist = 0 };
UnitPopupButtons["ADD_DKP_4"] = { text = "增加4分", dist = 0 };
UnitPopupButtons["MINUS_DKP_1"] = { text = "扣除1分", dist = 0 };
UnitPopupButtons["MINUS_DKP_2"] = { text = "扣除2分", dist = 0 };
UnitPopupButtons["MINUS_DKP_3"] = { text = "扣除3分", dist = 0 };
UnitPopupButtons["MINUS_DKP_4"] = { text = "扣除4分", dist = 0 };

NewDKP = false

-- 宣言相关变量
local playerDeclaration = ""

-- 宣言功能函数
function XyTracker_OnDeclarationButtonClick()
    -- 打开独立宣言窗口
    local declarationWindow = getglobal("XyTrackerDeclarationFrame")
    local declarationEditBox = getglobal("XyTrackerDeclarationLargeEditBox")
    
    -- 确保宣言内容正确加载，优先使用XyTrackerOptions中的值
    if XyTrackerOptions and XyTrackerOptions.Declaration and XyTrackerOptions.Declaration ~= "" then
        declarationEditBox:SetText(XyTrackerOptions.Declaration)
    elseif playerDeclaration and playerDeclaration ~= "" then
        declarationEditBox:SetText(playerDeclaration)
    else
        declarationEditBox:SetText("")
    end
    
    declarationEditBox:SetFocus()
    
    -- 显示窗口
    declarationWindow:Show()
    
    -- 已移除调试信息
end

-- 保存宣言内容的函数
function XyTracker_SaveDeclaration()
    local declarationEditBox = getglobal("XyTrackerDeclarationLargeEditBox")
    local declarationWindow = getglobal("XyTrackerDeclarationFrame")
    
    -- 获取输入框中的内容
    local newDeclaration = declarationEditBox:GetText()
    
    -- 确保保存宣言内容到两个变量，确保通告功能能够正确读取
    playerDeclaration = newDeclaration
    
    -- 持久化保存到设置中，下次开团时自动加载
    if not XyTrackerOptions then
        XyTrackerOptions = {}
    end
    XyTrackerOptions.Declaration = newDeclaration
    
    -- 已移除确认消息和调试信息
    
    -- 隐藏窗口
    declarationWindow:Hide()
end

function XyTracker_OnAnnounceDeclarationButtonClick()
    -- 优先从XyTrackerOptions获取宣言内容，确保使用最新保存的值
    local declarationText = XyTrackerOptions and XyTrackerOptions.Declaration or playerDeclaration
    
    if declarationText and declarationText ~= "" then
        local lineCount = 0
        local startPos = 1
        local textLength = string.len(declarationText)
        
        while startPos <= textLength do
            -- 查找下一个换行符或字符串结束位置
            local endPos = string.find(declarationText, "\n", startPos)
            if not endPos then
                endPos = textLength + 1
            end
            
            -- 提取当前行文本
            local line = string.sub(declarationText, startPos, endPos - 1)
            if line and line ~= "" then
                lineCount = lineCount + 1
                if lineCount == 1 then
                    -- 第一行添加前缀
                    SendChatMessage("【团队宣言】" .. line, "RAID_WARNING", nil, nil)
                else
                    -- 后续行直接发送
                    SendChatMessage(line, "RAID_WARNING", nil, nil)
                end
            end
            
            -- 移动到下一行起始位置
            startPos = endPos + 1
        end
        
        -- 已移除确认消息
    else
        -- 已移除提示消息
    end
end

--新功能，roll点监控
function RollStart()
	rollData={}
	isRolling=true
	rollEndTime = GetTime()+tonumber(XyTrackerOptions.rollTime);
	SendChatMessage(curItem.."开始ROLL点，"..XyTrackerOptions.rollTime.."秒后自动结束", "RAID", this.language, nil)
end

function RollEnd()
	rollEndTime = GetTime()
	isRolling=false
	if getn(rollData)>0 then
		SendChatMessage(curItem.."ROLL点结束，胜利者为"..rollData[1]["name"].."点数为["..rollData[1]["roll"].."]", "RAID", this.language, nil)
	else
		SendChatMessage(curItem.."ROLL点结束，无人roll点", "RAID", this.language, nil)
	end
end

function RollMonitor_Clear()
	rollData={}
	RollMonitor_UpdateList()
	getglobal("RollMonitorFrame"):Hide();
end

-- 修改为记录多个玩家的发言
local raidMessages = {}  -- 用于存储所有玩家的发言记录
--自动扣分开关
function autoMin_OnClick()
    XyTrackerOptions.autoMinDkp = this:GetChecked()
end
-- 添加颜色模式切换函数
function greenMode_OnClick()
    XyTrackerOptions.greenModeEnabled = this:GetChecked()
end

function blueMode_OnClick()
    XyTrackerOptions.blueModeEnabled = this:GetChecked()
end

function purpleMode_OnClick()
    XyTrackerOptions.purpleModeEnabled = this:GetChecked()
end

function autoMode_OnClick()
    if this:GetChecked() then
        XyTrackerOptions.XyOnlyMode = 1
    else
        XyTrackerOptions.XyOnlyMode = 0
    end
end

function autoAnnounce_OnClick()
    if this:GetChecked() then
        XyTrackerOptions.AutoAnnounce = true
    else
        XyTrackerOptions.AutoAnnounce = false
    end
end

-- 调用默认DKP
function printDefaultDKP()
    getglobal("allDKPFrameTXT"):SetText(DefaultDKP);
end
-- 更新默认DKP
function NEWDefaultDKP()
    DefaultDKP = getglobal("allDKPFrameTXT"):GetNumber();
    NewDKP = true
    XyTracker_OnRefreshButtonClick()
    XyTracker_UpdateList() -- 更新DKP列表
    SendChatMessage("通知：当前默认DKP为每人" .. DefaultDKP .. "分，分数已初始化", "RAID", this.language, nil)
end
-- 检查列表中是否包含指定元素
function contain(v, l)
    if not l then
        return false
    end
    local n = getn(l)
    if n > 0 then
        for i = 1, n do
            local lv = l[i]
            if v == lv then
                return true
            end
        end
    end


    return false
end
-- 注册右键菜单权限控制按钮
function XyTracker_RegisterRightClickMenuButtons()
    if UnitPopupMenus["PARTY"] then
        if IsLeader then
            if not contain("ADD_DKP", UnitPopupMenus["PARTY"]) then
                table.insert(UnitPopupMenus["PARTY"], "ADD_DKP")
            end
            if not contain("Minus_DKP", UnitPopupMenus["PARTY"]) then
                table.insert(UnitPopupMenus["PARTY"], "Minus_DKP")
            end
        else
            -- 如果不是团长，移除这些按钮
            local index1 = nil
            local index2 = nil
            for i, v in ipairs(UnitPopupMenus["PARTY"]) do
                if v == "ADD_DKP" then
                    index1 = i
                elseif v == "Minus_DKP" then
                    index2 = i
                end
            end
            if index1 then
                table.remove(UnitPopupMenus["PARTY"], index1)
            end
            if index2 then
                table.remove(UnitPopupMenus["PARTY"], index2)
            end
        end
        if not contain("GET_XY", UnitPopupMenus["PARTY"]) then
            table.insert(UnitPopupMenus["PARTY"], "GET_XY")
        end
    end
end

-- 发送所有人的许愿
function XyTracker_AnnounceAllWishes()
    local n = getn(XyArray)
    if n > 0 then
        for i = 1, n do
            local info = XyArray[i]
            local name = info["name"]
            local xy = info["xy"] or "---未许愿---"
            if xy ~= "---未许愿---" and xy ~= "" then
                SendChatMessage(name .. " 许愿：" .. xy, "RAID", this.language, nil)
            end
        end
    end
end

-- 插件加载时的初始化函数
function XyTracker_OnLoad()
    -- 初始化IsLeader变量
    IsLeader = false
    
    -- 初始化拾取列表排序变量
    LootSortField = "timestamp" -- 默认按拾取时间排序
    LootSortOrder = 1 -- 默认升序（1表示升序，-1表示降序）
    
    -- 在单位弹出菜单中添加按钮
    XyTracker_RegisterRightClickMenuButtons()
    
    -- 初始化LootList为空表（如果不存在）
    if LootList == nil then
        LootList = {}
    end
    
    -- 初始化SavedLootList为空表（如果不存在）
    if SavedLootList == nil then
        SavedLootList = {}
    end
    
    -- 初始化SavedWishList为空表（如果不存在）
    if SavedWishList == nil then
        SavedWishList = {}
    end
    
    -- 加载保存的宣言内容 - 增强版，确保内容能够正确加载
    if XyTrackerOptions and XyTrackerOptions.Declaration and XyTrackerOptions.Declaration ~= "" then
        playerDeclaration = XyTrackerOptions.Declaration
    -- 否则回退到旧的存储方式
    elseif XyTrackerDeclaration and XyTrackerDeclaration ~= "" then
        playerDeclaration = XyTrackerDeclaration
    else
        -- 初始化默认宣言内容
        playerDeclaration = " 参与本次副本必须同意以下副本规则，参与活动表示接受：\n 1. 本次副本内装备分配以许愿5+4为准，歪歪：；\n 2. 考核数据以同职业的60%，未达标减ROLL点：每低1点减1ROLL点，有任务除外或按情况降低要求；\n 3. 打本有事离开打字请假，不得划水，挂机，多开。必须上YY服从指挥，完成分配任务，多次点名没反应，不能完成任务的，踢出队伍或减ROLL10-20点；\n 4. ADD或中常规技能死亡（裂隙，瓦解，黑水，冰龙炸弹等）扣ROLL5-10点，多次无故死亡会被踢出团队；\n 5. 本次副本内所有物品，不能代roll，不能roll中之后让给他人；\n 6. 在团长拍物品时专心出分ROLL点，错过拍分自负，如有分配出错请及时打字提醒，或者开麦指出；\n 7. 文明打本不得辱骂他人与团员发生争执，有问题在准备战斗前或者战斗结束后指出，不要打断指挥；\n 8. 如过许愿后无故跳车，自愿封号30天；\n 9. 如有违反，自愿接受GM处罚（包括不限于装备销毁/账号冻结）"
        if not XyTrackerOptions then
            XyTrackerOptions = {}
        end
        XyTrackerOptions.Declaration = playerDeclaration
    end
    
    -- 已移除加载记录调试信息

    -- 设置命令行指令
    SlashCmdList["XYTRACKER"] = XyTracker_OnSlashCommand
    SLASH_XYTRACKER1 = "/xyt"
    SLASH_XYTRACKER2 = "/Xytrack"
    -- 注册事件监听
    this:RegisterEvent("VARIABLES_LOADED")
    this:RegisterEvent("CHAT_MSG_SYSTEM")
    this:RegisterEvent("CHAT_MSG_PARTY")
    this:RegisterEvent("CHAT_MSG_RAID")
    this:RegisterEvent("CHAT_MSG_RAID_LEADER")
    this:RegisterEvent("CHAT_MSG_RAID_WARNING")
    this:RegisterEvent("CHAT_MSG_ADDON")
    this:RegisterEvent("CHAT_MSG_WHISPER")
    this:RegisterEvent("PLAYER_LOGOUT")
    this:RegisterEvent("CHAT_MSG_LOOT")
    this:RegisterEvent("LOOT_OPENED")
    this:RegisterEvent("LOOT_CLOSED")
    -- 【重要】添加PLAYER_LOGOUT事件监听，确保游戏退出时自动保存数据
    this:RegisterEvent("PLAYER_LOGOUT")
    

    -- 窗口颜色和拖动功能已在XML中设置，避免重复设置导致冲突
    -- 备份原始单位弹出窗口点击处理函数
    ori_unitpopup1 = UnitPopup_OnClick;
    -- 替换单位弹出窗口点击处理函数
    UnitPopup_OnClick = ple_unitpopup1;
    -- 初始化变量
	if not XyTrackerOptions then
		XyTrackerOptions={
			AutoAnnounce = false,
			greenModeEnabled = false,
			blueModeEnabled = false,
			purpleModeEnabled = true,  -- 默认紫色开启
			XyOnlyMode = 0,
			rollTime = 60,
			autoMinDkp = false
		}
	end
    if XyArray == nil then
        XyArray = {}
    end
    XyInProgress = false
    NoXyList = ""
    Xys = 0
    -- 用于控制接收同步数据时不发送公告
    IsReceivingSync = false

-- 全局安全字符串清理函数
-- 添加消息去重缓存，存储最近播报的消息和时间戳
sentMessages = {}  -- 键为消息内容，值为发送时间戳

-- 临时调试函数：重置指定玩家的许愿数据
slashcommands = {}
function slashcommands.resetxy(name, params)
    if not XyArray then
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 没有找到许愿数据")
        return
    end
    
    -- 如果没有提供参数，重置所有数据
    if not params or params == "" then
        XyArray = {}
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 已重置所有许愿数据")
        XyTracker_UpdateList()
        return
    end
    
    -- 重置指定玩家的数据
    local found = false
    for i = 1, getn(XyArray) do
        if XyArray[i]["name"] == params then
            XyArray[i]["xy"] = "---未许愿---"
            DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 已重置玩家 "..params.." 的许愿数据")
            found = true
            break
        end
    end
    
    -- 也检查displayArray（如果存在）
    if displayArray and type(displayArray) == "table" then
        for i = 1, getn(displayArray) do
            if displayArray[i]["name"] == params then
                displayArray[i]["xy"] = "---未许愿---"
                break
            end
        end
    end
    
    if not found then
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 未找到玩家 "..params)
    else
        XyTracker_UpdateList()
    end
end

function safeCleanString(str)
    if not str or type(str) ~= "string" then
        return ""
    end
    
    -- 移除颜色代码
    local cleanStr = string.gsub(str, "|c%x%x%x%x%x%x%x%x", "")
    cleanStr = string.gsub(cleanStr, "|r", "")
    
    -- 移除物品链接标记
    cleanStr = string.gsub(cleanStr, "|Hitem:.-|h", "")
    cleanStr = string.gsub(cleanStr, "|h", "")
    
    -- 移除方括号（物品名称通常用方括号包裹）
    cleanStr = string.gsub(cleanStr, "%[", "")
    cleanStr = string.gsub(cleanStr, "%]", "")
    
    -- 移除首尾空格和特殊字符，但保留中间的连字符等
    cleanStr = string.gsub(cleanStr, "^%s+", "")
    cleanStr = string.gsub(cleanStr, "%s+$", "")
    
    -- 转换为小写进行不区分大小写的比较
    cleanStr = string.lower(cleanStr)
    
    return cleanStr
end
    local autoModeButtons = getglobal("autoModeButtons");
    autoModeButtons:SetChecked(XyTrackerOptions.XyOnlyMode);
    getglobal("autoAnnounceButton"):SetChecked(XyTrackerOptions.AutoAnnounce); -- 设置勾选框状态
    XyTracker_UpdateList()
    SendAddonMessage("XY_SYNC_NEW", "", "RAID")
    -- 加载存储的数据
    if XyTrackerDB then
        for name, data in pairs(XyTrackerDB) do
            local info = getXyInfo(name)
            if info then
                info.dkp = data.dkp
            end
        end
    end

   
    
    -- 添加加减分数子菜单定义
    if not UnitPopupMenus["ADD_DKP"] then
        UnitPopupMenus["ADD_DKP"] = {
            "ADD_DKP_1",
            "ADD_DKP_2", 
            "ADD_DKP_3",
            "ADD_DKP_4"
        };
    end
    
    if not UnitPopupMenus["Minus_DKP"] then
        UnitPopupMenus["Minus_DKP"] = {
            "MINUS_DKP_1",
            "MINUS_DKP_2",
            "MINUS_DKP_3", 
            "MINUS_DKP_4"
        };
    end

	
--增强CML拾取大师
-- 	if CML_Vars and CML_Vars.Enabled then
-- 		if (XTY_ORGGROUPLOOTDROPDOWN == nil) then
-- 			XTY_ORGGROUPLOOTDROPDOWN = CML_InitDropDown;
-- 		end
-- 		UIDropDownMenu_Initialize(GroupLootDropDown, XYT_InitDropDown, "MENU");
-- 	else
-- 		if (XTY_ORGGROUPLOOTDROPDOWN == nil) then
-- 			XTY_ORGGROUPLOOTDROPDOWN = GroupLootDropDown_Initialize;
-- 		end
-- 		UIDropDownMenu_Initialize(GroupLootDropDown, XYT_InitDropDown, "MENU");
-- 	end
end

function XYT_InitDropDown()
	XTY_ORGGROUPLOOTDROPDOWN();
	if UIDROPDOWNMENU_MENU_LEVEL == 1 then
		UIDropDownMenu_AddButton {
			text = "许愿插件增强功能",
			notCheckable = 1,
			isTitle = 1,
		}
		UIDropDownMenu_AddButton {
			text = "出分",
			func = xytShowDKP,
		}
		UIDropDownMenu_AddButton {
			text = "ROLL",
			func = xytRoll,
		}
	end
end

function xytShowDKP()
	local item =ITEM_QUALITY_COLORS[LootFrame.selectedQuality].hex .. LootFrame.selectedItemName .. FONT_COLOR_CODE_CLOSE;
	SendChatMessage(item.."要的出分", "RAID", this.language, nil)
end

function xytRoll()
	curItem =ITEM_QUALITY_COLORS[LootFrame.selectedQuality].hex .. LootFrame.selectedItemName .. FONT_COLOR_CODE_CLOSE;
	getglobal("RollMonitorFrameTitle"):SetText("ROLL点监控:"..curItem);
	getglobal("xytRollTime"):SetText(XyTrackerOptions.rollTime);
	getglobal("RollMonitorFrame"):Show();
end


-- 替换后的单位弹出窗口点击处理函数
function ple_unitpopup1()
    local dropdownFrame = getglobal(UIDROPDOWNMENU_INIT_MENU);
    local button = this.value;
    local unit = dropdownFrame.unit;
    local name = dropdownFrame.name;
    local server = dropdownFrame.server;

    if (button == "GET_XY") then
        XyQuery(name);
    -- 处理增加分数的子菜单
    elseif button == "ADD_DKP_1" then
        XyAddDkp(name, 1);
    elseif button == "ADD_DKP_2" then
        XyAddDkp(name, 2);
    elseif button == "ADD_DKP_3" then
        XyAddDkp(name, 3);
    elseif button == "ADD_DKP_4" then
        XyAddDkp(name, 4);
    -- 处理扣除分数的子菜单
    elseif button == "MINUS_DKP_1" then
        XyMinusDkp(name, 1);
    elseif button == "MINUS_DKP_2" then
        XyMinusDkp(name, 2);
    elseif button == "MINUS_DKP_3" then
        XyMinusDkp(name, 3);
    elseif button == "MINUS_DKP_4" then
        XyMinusDkp(name, 4);
    else
        return ori_unitpopup1();
    end
    
    PlaySound("UChatScrollButton");
end

-- 获取指定名字的许愿信息
function getXyInfo(name)
    local n = getn(XyArray)
    if n > 0 then
        for i = 1, n do
            local info = XyArray[i]
            if info["name"] == name then
                info["dkp"] = tonumber(info["dkp"]) or DefaultDKP  -- 确保 DKP 是数字
                return info
            end
        end
    end
    --如果是新加入的成员。初始化该成员信息并返回 by 无道暴君20250217
    local totalMembers = GetNumRaidMembers()
    if totalMembers then
        for i = 1, totalMembers do
            local player, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
            if name==player then
                local info = {}
                info["name"] = name
                info["class"] = class
                info["xy"] = "---未许愿---"
                info["dkp"] = DefaultDKP
                table.insert(XyArray, info)
                NoXyList = NoXyList .. name .. " "
                return info;
            end
        end
    end
    return nil
end

-- 新增更新roll点信息
function RollMonitor_UpdateList()
	FauxScrollFrame_Update(RollListScrollFrame, 10, 10, 25);
	table.sort(rollData, Xy_CompareRolls);
	for i = 1, 10 do
		if i > getn(rollData) then
			getglobal("RollFrameListButton" .. i):Hide();
		else
			local v = rollData[i]
			getglobal("RollFrameListButton" .. i .. "Name"):SetText(v["name"]);
			getglobal("RollFrameListButton" .. i .. "Class"):SetText(v["class"]);
			getglobal("RollFrameListButton" .. i .. "Xy"):SetText(v["xy"]);
			getglobal("RollFrameListButton" .. i .. "DKP"):SetText(v["dkp"]);
			getglobal("RollFrameListButton" .. i .. "Roll"):SetText(v["roll"]);
			getglobal("RollFrameListButton" .. i):Show();
		end
	end
end

function Xy_CompareRolls(a1,a2)
    local c1, c2 = a1["roll"], a2["roll"];
	return tonumber(c1) > tonumber(c2);
end

-- 更新许愿者列表
function XyTracker_UpdateList()
    NoXyList = ""
    Xys = 0
    local totalMembers = GetNumRaidMembers()
    local currentRaidMembers = {}
    
    -- 获取当前团队成员列表
    if totalMembers then
        for i = 1, totalMembers do
            local name = GetRaidRosterInfo(i)
            currentRaidMembers[name] = true
        end
        
        -- 更新未许愿列表和许愿人数
        -- 先创建一个名字到索引的映射，用于快速查找
        local nameToIndex = {}
        local n = getn(XyArray)
        for i = 1, n do
            if XyArray[i] and XyArray[i]["name"] then
                nameToIndex[XyArray[i]["name"]] = i
            end
        end
        
        for i = 1, totalMembers do
            local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
            
            -- 使用映射表检查玩家是否存在
            local info = nil
            if nameToIndex[name] then
                info = XyArray[nameToIndex[name]]
            else
                -- 玩家不存在，添加新记录
                info = {}
                info["name"] = name
                info["class"] = class
                info["xy"] = "---未许愿---"
                info["dkp"] = DefaultDKP
                table.insert(XyArray, info)
                nameToIndex[name] = getn(XyArray)
            end
            
            if info then
                if IsLeader and NewDKP then 
                    info["dkp"] = DefaultDKP
                end
                if info["xy"] and info["xy"] ~= "---未许愿---" and info["xy"] ~= "" then
                    Xys = Xys + 1
                else
                    NoXyList = NoXyList .. name .. " "
                end
            end
        end
        
        -- 保留所有玩家记录，不在队伍中的玩家只是在UI中隐藏而不删除
        
        if IsLeader then
            NewDKP = false
        end
    end
    
    -- 确保总是显示未许愿人数，即使totalMembers为nil
    if totalMembers then
        XyTrackerFrameStatusText:SetText(XyTracker_If(Xys == totalMembers, "当前全部许愿", string.format("%d未许愿人数", totalMembers - Xys)))
    else
        XyTrackerFrameStatusText:SetText("当前不在团队中")
    end
    
    -- 确保文本框总是可见
    if XyTrackerFrameStatusText:IsVisible() == false then
        XyTrackerFrameStatusText:Show()
    end
    
    -- 创建一个只包含当前团队成员的临时数组用于显示
    local displayArray = {}
    if getn(XyArray) > 0 and totalMembers then
        for i = 1, getn(XyArray) do
            local info = XyArray[i]
            if currentRaidMembers[info["name"]] then
                table.insert(displayArray, info)
            end
        end
    end
    
    -- 更新滚动框
    FauxScrollFrame_Update(XyListScrollFrame, getn(displayArray), 18, 25);
    
    -- 显示当前团队成员的许愿信息
    if getn(displayArray) > 0 then
        local offset = FauxScrollFrame_GetOffset(XyListScrollFrame);
        for i = 1, 18 do
            k = offset + i;
            if k > getn(displayArray) then
                getglobal("XyFrameListButton" .. i):Hide();
            else
                v = displayArray[k]
                getglobal("XyFrameListButton" .. i .. "Name"):SetText(v["name"]);
                getglobal("XyFrameListButton" .. i .. "Class"):SetText(v["class"]);
                getglobal("XyFrameListButton" .. i .. "Xy"):SetText(v["xy"]);
                getglobal("XyFrameListButton" .. i .. "DKP"):SetText(v["dkp"]);
                getglobal("XyFrameListButton" .. i):Show();
                
                -- 显式显示加减按钮，仅在获得IsLeader权限时显示
                local addButton = getglobal("XyFrameListButton" .. i .. "AddDkp")
                local minusButton = getglobal("XyFrameListButton" .. i .. "MinusDkp")
                if IsLeader then
                    if addButton then
                        addButton:Show()
                    end
                    if minusButton then
                        minusButton:Show()
                    end
                else
                    if addButton then
                        addButton:Hide()
                    end
                    if minusButton then
                        minusButton:Hide()
                    end
                end
            end
        end
    else
        for i = 1, 18 do
            getglobal("XyFrameListButton" .. i):Hide();
        end
    end
end

function XyTracker_Print(msg)
    if DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker-Debug] "..msg)
    end
end

function XyTracker_If(expr, a, b)
    if expr then
        return a
    else
        return b
    end
end
function XyTracker_OnSlashCommand(msg)
    -- 仅保留显示/隐藏功能
    if msg == "debug" or msg == "export" then
        -- 已移除调试和导出功能的输出
    else
        -- 原有的显示/隐藏功能
        if XyTrackerFrame:IsVisible() then
            XyTracker_HideXyWindow()
        else
            XyTracker_ShowXyWindow()
        end
    end
end

function XyTracker_ShowXyWindow()
    if DefaultDKP == nil then
        DefaultDKP = 4
    end
    getglobal("autoModeButtons"):SetChecked(XyTrackerOptions.XyOnlyMode);
    getglobal("autoAnnounceButton"):SetChecked(XyTrackerOptions.AutoAnnounce);
    getglobal("autoMinButtons"):SetChecked(XyTrackerOptions.autoMinDkp);
    getglobal("greenModeButtons"):SetChecked(XyTrackerOptions.greenModeEnabled);
    getglobal("blueModeButtons"):SetChecked(XyTrackerOptions.blueModeEnabled);
    getglobal("purpleModeButtons"):SetChecked(XyTrackerOptions.purpleModeEnabled);
    
    -- 确保加载保存的宣言
    if not playerDeclaration or playerDeclaration == "" then
        playerDeclaration = XyTrackerDeclaration or ""
    end
    
    -- 宣言按钮显示控制
    if IsLeader then
        getglobal("XyTrackerFrameDeclarationButton"):Show()
        getglobal("XyTrackerFrameAnnounceDeclarationButton"):Show()
    else
        getglobal("XyTrackerFrameDeclarationButton"):Hide()
        getglobal("XyTrackerFrameAnnounceDeclarationButton"):Hide()
    end
    
    -- 强制更新许愿权限拥有者显示
    XyTracker_UpdateLeaderText()
    
    -- 再次确保文本可见（冗余保障）
    local leaderText = getglobal("XyTrackerLeaderText")
    if leaderText and not leaderText:IsVisible() then
        leaderText:Show()
    end
    
    -- 宣言内容现在在独立窗口中管理，不需要在这里设置
    
    ShowUIPanel(XyTrackerFrame)
end

function XyTracker_HideXyWindow()
    HideUIPanel(XyTrackerFrame)
end

function XyButton_UpdatePosition()
    XyButtonFrame:SetPoint(
            "TOPLEFT",
            "Minimap",
            "TOPLEFT",
            54 - (78 * cos(200)),
            (78 * sin(200)) - 55
    );
end

-- 检测聊天中的物品链接并通报许愿信息
function CheckItemAndAnnounceWish(msg, sender)
    -- 安全检查：确保参数有效
    if not msg or type(msg) ~= "string" then
        return
    end
    
    if not XyTrackerOptions.AutoAnnounce then 
        return 
    end  -- 移除XyInProgress条件，确保无论是否点击停止按钮都会播报
    
    -- 检查消息是否包含白名单标记"★播报许愿★"，如果是则不进行处理
    if string.find(msg, "★播报许愿★") then
        return
    end
    
    -- 只有团长和本人才处理通报
    if not IsLeader and sender ~= playerName then
        return
    end
    
    -- 提取消息中的所有物品链接
    local itemLinkFound = false
    local allItemLinks = {}
    
    for itemLink in string.gmatch(msg, "|Hitem:.-|h.-|h") do
        table.insert(allItemLinks, itemLink)
    end
    
    -- 逐个处理每个物品链接
    for itemIndex, itemLink in ipairs(allItemLinks) do
        itemLinkFound = true
        
        -- 使用pcall安全调用ExtractItemName函数
        local success, itemName = pcall(ExtractItemName, itemLink)
        if not success or type(itemName) ~= "string" then
            itemName = "" 
        end
        
        -- 使用全局的安全字符串清理函数
        local cleanItemName = safeCleanString(itemName)
        
        -- 判断是团长还是队员，执行不同的播报逻辑
        if IsLeader then
            -- 团长逻辑：显示所有实际许愿的玩家
            local wishPlayers = {}
            
            -- 遍历许愿列表，匹配有效许愿条目
            for i = 1, getn(XyArray) do
                local info = XyArray[i]
                if info and info["name"] and info["xy"] and info["xy"] ~= "---未许愿---" then
                    -- 使用pcall安全调用ExtractItemName函数
                    local success, primaryWishItem, allWishItems = pcall(ExtractItemName, info["xy"])
                    if not success or type(primaryWishItem) ~= "string" then
                        primaryWishItem = ""
                    end
                    
                    -- 使用安全的字符串清理函数处理主物品名称
                    local cleanPrimaryWishItem = safeCleanString(primaryWishItem)
                    
                    -- 【修复】使用严格的精确匹配，移除模糊匹配
                    local isMatched = false
                    
                    -- 检查主物品名称是否精确匹配
                    if cleanPrimaryWishItem ~= "" and cleanItemName ~= "" then
                        if cleanPrimaryWishItem == cleanItemName then
                            isMatched = true
                        else
                            -- 如果主物品不匹配，检查其他物品名称（同样使用精确匹配）
                            if type(allWishItems) == "table" and getn(allWishItems) > 1 then
                                for _, wishItem in ipairs(allWishItems) do
                                    local cleanWishItem = safeCleanString(wishItem)
                                    if cleanWishItem == cleanItemName then
                                        isMatched = true
                                        break
                                    end
                                end
                            end
                        end
                    end
                    
                    -- 如果匹配成功，添加到许愿玩家列表
                    if isMatched then
                        table.insert(wishPlayers, {name = info["name"], dkp = info["dkp"]})
                    end
                end
            end
            
            -- 为当前物品生成团长通报内容
            if type(wishPlayers) == "table" and getn(wishPlayers) > 0 then
                local announcement = "★"..itemName.."★共"..getn(wishPlayers).."人许愿："
                for idx = 1, getn(wishPlayers) do
                    local player = wishPlayers[idx]
                    if type(player) == "table" then
                        local name = player.name or "未知"
                        local dkp = player.dkp or "0"
                        announcement = announcement .. name .. "（" .. dkp .. "分）"
                        if idx < getn(wishPlayers) then
                            announcement = announcement .. "、"
                        end
                    end
                end
                
                local currentLanguage = GetDefaultLanguage("player")
                SendChatMessage(announcement, "RAID", currentLanguage, nil)
            end
        else
            -- 队员逻辑：只显示自己是否许愿了该物品
            local hasWished = false
            local myDkp = "0"
            
            -- 遍历许愿列表，检查自己是否许愿了该物品
            for i = 1, getn(XyArray) do
                local info = XyArray[i]
                if info and info["name"] == playerName and info["xy"] and info["xy"] ~= "---未许愿---" then
                    -- 使用pcall安全调用ExtractItemName函数
                    local success, primaryWishItem, allWishItems = pcall(ExtractItemName, info["xy"])
                    if not success or type(primaryWishItem) ~= "string" or primaryWishItem == "" then
                        primaryWishItem = ""
                        allWishItems = {}
                    end
                    
                    -- 使用安全的字符串清理函数处理主物品名称
                    local cleanPrimaryWishItem = safeCleanString(primaryWishItem)
                    
                    -- 【修复】使用严格的精确匹配
                    local isMatched = false
                    
                    if cleanPrimaryWishItem ~= "" and cleanItemName ~= "" then
                        if cleanPrimaryWishItem == cleanItemName then
                            isMatched = true
                        else
                            -- 如果主物品不匹配，检查其他物品名称
                            if type(allWishItems) == "table" and getn(allWishItems) > 1 then
                                for _, wishItem in ipairs(allWishItems) do
                                    local cleanWishItem = safeCleanString(wishItem)
                                    if cleanWishItem == cleanItemName then
                                        isMatched = true
                                        break
                                    end
                                end
                            end
                        end
                    end
                    
                    if isMatched then
                        hasWished = true
                        myDkp = info["dkp"] or "0"
                        break
                    end
                end
            end
            
            -- 为当前物品生成队员通报内容
            if hasWished then
                local announcement = "★"..itemName.."★我已许愿（"..myDkp.."分）"
                local currentLanguage = GetDefaultLanguage("player")
                SendChatMessage(announcement, "RAID", currentLanguage, nil)
            end
        end
    end
    
    -- 如果没有找到物品链接，尝试直接匹配物品名称
    if not itemLinkFound then
        local directCleanItemName = safeCleanString(msg)
        
        -- 判断是团长还是队员，执行不同的播报逻辑
        if IsLeader then
            -- 团长逻辑：显示所有实际许愿的玩家
            local directWishPlayers = {}
            for i = 1, getn(XyArray) do
                local info = XyArray[i]
                if info and info["xy"] and info["xy"] ~= "---未许愿---" then
                    local success, wishItem = pcall(ExtractItemName, info["xy"])
                    if success and type(wishItem) == "string" and wishItem ~= "" and wishItem ~= "---未许愿---" then
                        local cleanWishItem = safeCleanString(wishItem)
                        -- 【修复】使用精确匹配
                        if cleanWishItem == directCleanItemName then
                            table.insert(directWishPlayers, {name = info["name"], dkp = info["dkp"]})
                        end
                    end
                end
            end
            
            if type(directWishPlayers) == "table" and getn(directWishPlayers) > 0 then
                local announcement = "★"..msg.."★共"..getn(directWishPlayers).."人许愿："
                for idx = 1, getn(directWishPlayers) do
                    local player = directWishPlayers[idx]
                    if type(player) == "table" then
                        local name = player.name or "未知"
                        local dkp = player.dkp or "0"
                        announcement = announcement .. name .. "（" .. dkp .. "分）"
                        if idx < getn(directWishPlayers) then
                            announcement = announcement .. "、"
                        end
                    end
                end
                
                local currentLanguage = GetDefaultLanguage("player")
                SendChatMessage(announcement, "RAID", currentLanguage, nil)
            end
        else
            -- 队员逻辑：只显示自己是否许愿了该物品
            local hasWished = false
            local myDkp = "0"
            
            for i = 1, getn(XyArray) do
                local info = XyArray[i]
                if info and info["name"] == playerName and info["xy"] and info["xy"] ~= "---未许愿---" then
                    local success, wishItem = pcall(ExtractItemName, info["xy"])
                    if success and type(wishItem) == "string" and wishItem ~= "" and wishItem ~= "---未许愿---" then
                        local cleanWishItem = safeCleanString(wishItem)
                        -- 【修复】使用精确匹配
                        if directCleanItemName ~= "" and cleanWishItem == directCleanItemName then
                            hasWished = true
                            myDkp = info["dkp"] or "0"
                            break
                        end
                    end
                end
            end
            
            if hasWished then
                local announcement = "★"..msg.."★我已许愿（"..myDkp.."分）"
                local currentLanguage = GetDefaultLanguage("player")
                SendChatMessage(announcement, "RAID", currentLanguage, nil)
            end
        end
    end
end



-- 新增：从LOOT消息中提取物品和玩家信息
function XyTracker_ExtractLootInfo(message)
    if not message then
        return nil, nil
    end
    
    -- 尝试多种可能的LOOT消息格式
    -- 1. 物品被分配给玩家的格式
    local playerName, itemName = string.match(message, "(.-)获得了物品：(.-)。")
    if not (playerName and itemName) then
        playerName, itemName = string.match(message, "(.-)获得了物品：(.-)。")
    end
    if not (playerName and itemName) then
        playerName, itemName = string.match(message, "(.-)赢得了物品：(.-)。")
    end
    if not (playerName and itemName) then
        playerName, itemName = string.match(message, "(.-)赢得了物品：(.-)。")
    end
    if not (playerName and itemName) then
        playerName, itemName = string.match(message, "(.-) received item: (.-)%.")
    end
    
    -- 2. 从物品链接中提取物品名称
    if playerName and not itemName then
        itemName = string.match(message, "|h%[([^%]]+)%]|h")
    end

    
    return playerName, itemName
end


-- 修改：同步拾取信息给队友，直接发送原始拾取消息
function XyTracker_SyncLootInfo(assignment)
    if not assignment or not assignment.playerName or not assignment.originalMessage then
        return
    end
    
    -- 构建同步消息：玩家名称:原始拾取消息
    local syncMsg = assignment.playerName .. ":" .. assignment.originalMessage
    
    -- 发送同步消息到团队
    SendAddonMessage("XY_LOOT_SYNC", syncMsg, "RAID")
end

-- 用于跟踪已接收的拾取信息，防止重复处理
local recentLootMessages = {}

-- 检测是否为重复的拾取信息（10秒内）
function XyTracker_IsDuplicateLoot(msg)
    if not msg or msg == "" then
        return false
    end
    
    local currentTime = GetTime()
    
    -- 清理过期的记录（超过10秒）
    for storedMsg, timestamp in pairs(recentLootMessages) do
        if currentTime - timestamp > 10 then
            recentLootMessages[storedMsg] = nil
        end
    end
    
    -- 检查是否有重复
    if recentLootMessages[msg] then
        return true-- 消息相同，返回false
    end
    -- 添加新记录
    recentLootMessages[msg] = currentTime
    return false -- 消息不同，返回true
end

-- 修改：接收其他团队成员的拾取同步信息
function XyTracker_ReceiveLootSync(syncMsg, senderName)
    if not syncMsg or syncMsg == "" then
        return
    end
    
    -- 解析同步消息：玩家名称:原始拾取消息
    local playerName, originalMessage = string.match(syncMsg, "(.-):(.*)")
    if not (playerName and itemLink and timeStr) then
        -- 尝试解析旧格式的消息作为兼容
        local oldPlayer, oldItem, oldHour, oldMinute = string.match(syncMsg, "(.-):(.-):(.-):(.-)")
        if oldPlayer and oldItem then
            playerName = oldPlayer
            itemLink = oldItem
            timeStr = oldHour .. ":" .. oldMinute
        else
            return -- 消息格式错误
        end
    end
        
    -- 队员接收团长的完整同步信息，直接处理
    local extractedItemLink = itemLink
    
    -- 提取物品名称
    local itemName
    if extractedItemLink then
        itemName = string.match(extractedItemLink, "|h%[([^%]]+)%]|h") or extractedItemLink
    else
        itemName = itemLink
        -- 如果没有物品链接，创建一个模拟的链接
        extractedItemLink = "|cff0070dd|Hitem:0:0:0:0:0:0:0:0|h[" .. itemName .. "]|h|r"
    end
    
    -- 记录到拾取列表
    local info = getXyInfo(playerName)
    local isWishItem = false
    
    if info and info["xy"] and info["xy"] ~= "---未许愿---" then
        local success, primaryWishItem, allWishItems = pcall(ExtractItemName, info["xy"])
        if success then
            local function cleanString(str)
                if not str then return "" end
                str = string.gsub(str, "|c%x+", "")
                str = string.gsub(str, "|r", "")
                str = string.gsub(str, "%[([^%]]+)%]", "%1")
                str = string.lower(str)
                return str
            end
            
            local cleanItemName = cleanString(itemName)
            
            if primaryWishItem and primaryWishItem ~= "" then
                local cleanPrimaryWishItem = cleanString(primaryWishItem)
                if cleanPrimaryWishItem == cleanItemName then
                    isWishItem = true
                end
            end
            
            if not isWishItem and type(allWishItems) == "table" and getn(allWishItems) > 0 then
                for _, wishItem in ipairs(allWishItems) do
                    local cleanWishItem = cleanString(wishItem)
                    if cleanWishItem == cleanItemName then
                        isWishItem = true
                        break
                    end
                end
            end
        end
    end
    
    -- 提取物品信息来自动补齐分数和事件
    local itemID = ExtractItemID(extractedItemLink)
    local points = 0 -- 默认0分
    
    -- 如果物品信息可获取，尝试自动计算分数
    if itemID then
        local itemName, itemLink, quality, level, minLevel, type, subType, maxStack, equipLoc, texture, vendorPrice = GetItemInfo(itemID)
        if quality then
            -- 根据物品品质设置默认分数
            if quality >= 4 then -- 史诗
                points = 20
            elseif quality == 3 then -- 精良
                points = 10
            elseif quality == 2 then -- 优秀
                points = 5
            end
        end
    end
    
    -- 创建物品数据对象
    local lootItem = {
        itemName = tostring(itemName),
        itemLink = extractedItemLink and tostring(extractedItemLink) or "",
        playerName = playerName and tostring(playerName) or "未知玩家",
        points = points, -- 根据物品品质自动补齐分数
        isWish = isWishItem,
        timestamp = {
            hour = hour,
            minute = minute
        }
    }
    
    -- 添加到LootList并更新UI
    table.insert(LootList, lootItem)
    XyTracker_UpdateLootList()
    
    -- 处理拾取分配信息
    local assignment = {
        itemName = itemName,
        playerName = playerName,
        confirmed = true,
        timestamp = {hour = hour, minute = minute}
    }
    
    XyTracker_ProcessLootAssignment(assignment)
end

-- 处理团长发送的完整同步信息
function XyTracker_ReceiveCompleteLootSync(syncMsg, senderName)
    -- 只有非团长才处理完整同步信息
    if IsLeader then
        return
    end
    
    -- 检查发送者是否为团长
    local isLeader = UnitIsGroupLeader(senderName)
    if not isLeader then
        return -- 不是团长发送的信息，忽略
    end
    
    -- 调用现有的处理逻辑
    XyTracker_ReceiveLootSync(syncMsg, senderName)
end

-- 新增：处理拾取分配信息
function XyTracker_ProcessLootAssignment(assignment)
    if assignment.itemName and assignment.playerName then
        -- 标记为已确认
        assignment.confirmed = true
        
        -- 初始化物品链接变量
        local itemLink = nil
        
        -- 尝试从assignment中获取物品链接
        if assignment.itemLink then
            itemLink = assignment.itemLink
        else
            -- 如果没有链接，使用物品名称创建链接
            -- 默认使用蓝色作为物品颜色，确保自动扣分逻辑能触发
            itemLink = "|cff0070dd|Hitem:0:0:0:0:0:0:0:0|h[" .. assignment.itemName .. "]|h|r"
        end
        
        -- 处理自动扣分逻辑（如果需要）
        if XyTrackerOptions.autoMinDkp then
            -- 检查该玩家是否在1分钟内发过言
            local currentTime = GetTime()
            local playerMessage = raidMessages[assignment.playerName]
            
            if playerMessage and (currentTime - playerMessage.timestamp) <= 60 then
                -- 获取物品颜色
                local _, _, itemColor = string.find(itemLink, "|c(%x+)|H")
                local shouldDeduct = false
                
                -- 调试输出物品链接和颜色
                if XyTracker_Print then
                    XyTracker_Print("物品链接: "..itemLink)
                    XyTracker_Print("提取的颜色代码: "..(itemColor or "未找到"))
                end
                
                -- 无论物品颜色如何，都触发自动扣分逻辑
                -- 这确保了所有物品类型都会触发MarkItemAsCompleted函数
                shouldDeduct = true
                
                if shouldDeduct and IsLeader then
                    local info = getXyInfo(assignment.playerName)
                    if info then
                        local number = playerMessage.message
                        
                        -- 修改：支持多物品许愿，只标记已获得的物品为已完成
                        if info["xy"] == "|cFF00FFFF【已完成许愿】|r" then
                            -- 已完成许愿状态，直接扣分
                            info["dkp"] = tonumber(info["dkp"]) - number
                            -- 只有团长和本人才通报
                            if IsLeader or assignment.playerName == playerName then
                                SendChatMessage(assignment.playerName .. " 扣除" .. number .. "分，当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                            end
                        elseif info["xy"] and info["xy"] ~= "---未许愿---" then
                            -- 有许愿内容时的处理
                            if number == 0 then
                                -- 0分情况：标记物品为已完成，不扣分
                                info["xy"] = MarkItemAsCompleted(info["xy"], assignment.itemName)
                                -- 只有团长和本人才通报
                                if IsLeader or assignment.playerName == playerName then
                                    SendChatMessage(assignment.playerName .. " 已完成当前物品许愿，当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                end
                            elseif number == 5 then
                                -- 5分的情况：标记物品为已完成，不扣分
                                print("5分情况",info["xy"], assignment.itemName)
                                info["xy"] = MarkItemAsCompleted(info["xy"], assignment.itemName)
                                -- 只有团长和本人才通报
                                if IsLeader or assignment.playerName == playerName then
                                    SendChatMessage(assignment.playerName .. " 已完成当前物品许愿（出5分），当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                end
                            elseif number <= 4 then
                                -- 1-4分的情况：扣除相应分数
                                info["dkp"] = tonumber(info["dkp"]) - number
                                -- 只有团长和本人才通报
                                if IsLeader or assignment.playerName == playerName then
                                    SendChatMessage(assignment.playerName .. " 扣除" .. number .. "分，当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                end
                            else
                                -- 6分及以上的情况：标记物品为已完成并扣除相应分数
                                local deductPoints = number - 5
                                info["xy"] = MarkItemAsCompleted(info["xy"], assignment.itemName)
                                info["dkp"] = tonumber(info["dkp"]) - deductPoints
                                -- 只有团长和本人才通报
                                if IsLeader or assignment.playerName == playerName then
                                    SendChatMessage(assignment.playerName .. " 已完成当前物品许愿，并扣除" .. deductPoints .. "分（出" .. number .. "分-5分），当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                end
                            end
                        end
                        
                        XyTracker_UpdateList()
                        syncXy()
                        
                        -- 只清除获得物品玩家的发言记录
                        raidMessages[assignment.playerName] = nil
                    end
                end
            end
        end
        
        -- 记录所有拾取的物品到拾取列表，无论是否花费分数
        local itemName = assignment.itemName
        
        -- 获取玩家信息
        local info = getXyInfo(assignment.playerName)
        
        -- 确定物品是否为许愿物品
        local isWishItem = false
        if info and info["xy"] and info["xy"] ~= "---未许愿---" then
            -- 使用ExtractItemName检查玩家是否许愿了当前物品
            local success, primaryWishItem, allWishItems = pcall(ExtractItemName, info["xy"])
            if success then
                -- 使用我们优化的全局safeCleanString函数进行清理
                local cleanItemName = safeCleanString(itemName)
                
                -- 【修复】使用精确匹配
                -- 检查主物品名称是否匹配
                if primaryWishItem and primaryWishItem ~= "" then
                    local cleanPrimaryWishItem = safeCleanString(primaryWishItem)
                    if cleanPrimaryWishItem == cleanItemName then
                        isWishItem = true
                    end
                end
                
                -- 如果主物品不匹配，检查其他物品名称
                if not isWishItem and type(allWishItems) == "table" and getn(allWishItems) > 0 then
                    for _, wishItem in ipairs(allWishItems) do
                        local cleanWishItem = safeCleanString(wishItem)
                        if cleanWishItem == cleanItemName then
                            isWishItem = true
                            break
                        end
                    end
                end
            end
        end
        
        -- 确定扣除的分数（如果有）
        local pointsUsed = 0
        
        -- 加强数据验证和类型转换，确保添加的物品数据格式正确
        local hour, minute = GetGameTime()
        
        -- 确保player是有效的字符串
        local validPlayerName = assignment.playerName and tostring(assignment.playerName) or "未知玩家"
        
        -- 创建物品数据对象，确保所有字段类型正确
        local lootItem = {
            itemName = tostring(itemName),
            itemLink = itemLink and tostring(itemLink) or "",
            playerName = validPlayerName,
            points = type(pointsUsed) == "number" and pointsUsed or 0,
            isWish = type(isWishItem) == "boolean" and isWishItem or false,
            timestamp = {
                hour = type(hour) == "number" and hour or 0,
                minute = type(minute) == "number" and minute or 0
            }
        }
        
        -- 重要：只有团长才执行本地物品拾取逻辑并发送同步信息
        -- 团员将完全依赖团长同步的数据，确保所有人显示一致
        if IsLeader then
            -- 根据物品品质和设置决定是否添加到LootList
            local shouldAdd = false
            local itemQuality = 5 -- 默认紫色史诗
            local itemName, itemLink, quality = GetItemInfo(lootItem.itemLink)
            if quality and type(quality) == "number" then
                itemQuality = quality
            end
            
            -- 橙色物品(品质5)总是添加
            if itemQuality == 5 then
                shouldAdd = true
            -- 紫色物品(品质4)根据设置
            elseif itemQuality == 4 then
                shouldAdd = XyTrackerOptions.purpleModeEnabled
            -- 蓝色物品(品质3)根据设置
            elseif itemQuality == 3 then
                shouldAdd = XyTrackerOptions.blueModeEnabled
            -- 绿色物品(品质2)根据设置
            elseif itemQuality == 2 then
                shouldAdd = XyTrackerOptions.greenModeEnabled
            end
            
            -- 只有符合条件的物品才添加到LootList
            if shouldAdd then
                table.insert(LootList, lootItem)
            end
            
            -- 更新拾取列表UI
            XyTracker_UpdateLootList()
            
            -- 同步拾取列表给团队成员（只同步最新的物品）
            -- 确保拾取一件物品就发送一条同步信息
            syncLootList(true)
        end
        
        -- 自动刷新拾取列表
        XyTracker_UpdateLootList()
    end
end


-- 检测聊天中的物品链接并通报许愿信息
-- 重复的函数定义已被删除，保留第807行的修复版本


function XyTracker_OnEvent(event)
	-- 处理变量加载完成事件，确保在所有保存的变量加载后执行
	if event == "VARIABLES_LOADED" then
		XyTracker_LoadCustomStarttext()
		return
	end
	
	-- 处理玩家登出事件，确保在退出游戏时保存数据
	if event == "PLAYER_LOGOUT" then
		XyTracker_SaveCustomStarttext()
		return
	end
	
	if isRolling and GetTime() > rollEndTime then
		RollEnd()
	end
    if event == "CHAT_MSG_RAID" or event == "CHAT_MSG_RAID_LEADER" then
        -- 检查消息是否为1-9的数字
        local number = tonumber(arg1)
		
        if number and number >= 0 and number <= 9 then
            -- 更新玩家发言记录
            raidMessages[arg2] = {
                message = number,
                timestamp = GetTime()
            }
        end
        XyTracker_OnSystemMessage()  -- 添加这行来处理系统消息
    end
    
    -- 检测物品获取
    if event == "CHAT_MSG_LOOT" then
        local player, itemLink = string.match(arg1, "(.+)获得了物品：(.+)。")
        if player and player == "你" then
            player = UnitName("player")
        end
        -- 检查itemLink是否为nil，避免连接错误
        if player and itemLink then
            local msg = player.."获得了物品："..itemLink.."。"
      
        -- 先检查消息是否重复，不重复的才处理
        if not XyTracker_IsDuplicateLoot(msg) then
        
            XyTracker_CHATMSGLOOT(msg)
        end
        end
    end
        -- 新增：团队聊天中检测物品链接并通报（非许愿阶段）
    if (event == "CHAT_MSG_RAID" or event == "CHAT_MSG_RAID_LEADER" or event == "CHAT_MSG_RAID_WARNING") then
        CheckItemAndAnnounceWish(arg1, arg2)
    end
    
    --查询许愿
    if event == "CHAT_MSG_WHISPER" then
        if arg1 == "cxxy" then
            XyQuery(arg2)
        end
    end
    -- 团长点开始许愿,所有团员的禁用团长权限,离开队伍后恢复
    if event == "CHAT_MSG_ADDON" and arg1 == "XY_START" and not IsLeader then
        DisableLeaderOperation()
        LeaderName = arg4 
        XyTracker_UpdateLeaderText()  -- 更新UI显示
        -- 请求LootList同步数据
        SendAddonMessage("XY_LOOTLIST_SYNC_REQUEST", "", "RAID")
    end
    --发送许愿
    if event == "CHAT_MSG_ADDON" and arg1 == "XY_SYNC_NEW" and IsLeader then
        syncXy()
    end
    --同步许愿
    if event == "CHAT_MSG_ADDON" and arg1 == "XY_SYNC" and not IsLeader then
        receiveXySync(arg2)
        LeaderName = arg4  
        XyTracker_UpdateLeaderText()  -- 更新UI显示
    end
    -- 同步LootList数据
    if event == "CHAT_MSG_ADDON" and arg1 == "XY_LOOTLIST_SYNC" then
        -- 团长不接收XY_LOOTLIST_SYNC信息
        if not IsLeader then
            receiveLootListSync(arg2)
        end
    end
    -- 接收LootList同步请求
    if event == "CHAT_MSG_ADDON" and arg1 == "XY_LOOTLIST_SYNC_REQUEST" and IsLeader then
        -- 只有团长才响应LootList同步请求
        -- 修改：响应同步请求时也只同步最新物品，不同步所有数据
        if LootList and getn(LootList) > 0 then
            -- 获取最新的物品
            local latestItem = LootList[getn(LootList)]
            if latestItem then
                -- 构建并发送最新物品的同步消息
                local itemID = ExtractItemID(latestItem.itemLink)
                local points = latestItem.points or 0
                local isWish = latestItem.isWish and 1 or 0
                local safePlayerName = latestItem.playerName or ""
                local hour = latestItem.timestamp and latestItem.timestamp.hour or 0
                local minute = latestItem.timestamp and latestItem.timestamp.minute or 0
                
                safePlayerName = string.gsub(safePlayerName, "|", "||")
                local safeItemName = string.gsub(latestItem.itemName or "未知物品", "|", "||")
                
                -- 获取物品品质信息
                local itemQuality = 5 -- 默认紫色史诗
                local itemName, itemLink, quality = GetItemInfo(itemID)
                if quality and type(quality) == "number" then
                    itemQuality = quality
                end
                
                local chunkData = string.format(";i=%s,n=%s,f=%d,x=%d,p=%s,t=%02d:%02d,q=%d",
                    itemID,
                    safeItemName,
                    points,
                    isWish,
                    safePlayerName,
                    hour,
                    minute,
                    itemQuality
                )
                
                local message = string.format("%d:%d:%d%s",
                    getn(LootList),
                    getn(LootList),  -- 起始索引设为总物品数，确保只发送最新物品
                    getn(LootList),  -- 结束索引为总物品数
                    chunkData
                )
                
                SendAddonMessage("XY_LOOTLIST_SYNC", message, "RAID")
            end
        end
    end
    
    -- 处理队员发送的拾取信息（仅团长接收）
    if event == "CHAT_MSG_ADDON" and arg1 == "XY_MEMBER_LOOT" and IsLeader then
      if not XyTracker_IsDuplicateLoot(arg2) then     
            XyTracker_CHATMSGLOOT(arg2)
        end
    -- 处理团队成员同步的拾取信息
    elseif event == "CHAT_MSG_ADDON" and arg1 == "XY_LOOT_SYNC" then
        -- 所有玩家都接收XY_LOOT_SYNC消息（但团长不处理自己发送的）
        if not IsLeader then
            XyTracker_ReceiveLootSync(arg2, arg4) -- arg4是发送者名称
        end
    -- 处理团长发送的完整同步信息
    elseif event == "CHAT_MSG_ADDON" and arg1 == "XY_LOOT_COMPLETE_SYNC" then
        -- 接收团长发送的完整同步信息
        XyTracker_ReceiveCompleteLootSync(arg2, arg4)
    end
    --加入团队的时候请求同步数据
    if event == "CHAT_MSG_SYSTEM" and (arg1 == "你加入了一个团队。" or string.find(arg1, "加入了一个团队")) then
        -- 发送同步请求但保留现有LootList数据
        SendAddonMessage("XY_SYNC_NEW", "", "RAID")
        -- 发送LootList同步请求
        SendAddonMessage("XY_LOOTLIST_SYNC_REQUEST", "", "RAID")
        -- 确保更新拾取列表UI显示
        XyTracker_UpdateLootList()
    
    -- 监控玩家交易信息并在团队频道播报
    elseif event == "CHAT_MSG_SYSTEM" and string.find(arg1, "trades item") then
        -- 只有团长才进行播报
        if IsLeader then
            -- 延迟一小段时间确保消息准确获取
            local delayFrame = CreateFrame("Frame")
            delayFrame.elapsed = 0
            delayFrame.tradeMessage = arg1
            delayFrame.count = 0
            delayFrame:SetScript("OnUpdate", function()
          
                this.elapsed = this.elapsed + arg1
                if this.elapsed >= 0.5 and this.count < 3 then
                    this.elapsed = 0
                    this.count = this.count + 1
                    -- 在团队频道播报交易信息（红色文本）
                    SendChatMessage("|cffff0000[交易监控] " .. this.tradeMessage.."|r", "RAID", nil, nil)
                    
                    -- 如果已经播报了3次，移除OnUpdate处理
                    if this.count >= 3 then
                        this:SetScript("OnUpdate", nil)
                    end
                end
            end)
        end
    end
    
    -- 团队成员变动时的处理（当有新成员加入时）
    if event == "GROUP_ROSTER_UPDATE" then
        -- 对于团长：已移除定期广播LootList数据的逻辑，只在拾取时发送一次
        
        -- 对于团员：检查是否有LootList数据，如果没有则请求同步
        if not IsLeader then
            if LootList and getn(LootList) == 0 then
                -- 避免频繁请求，只在需要时发送请求
                local currentTime = GetTime()
                if not lastSyncRequestTime or (currentTime - lastSyncRequestTime) > 5 then
                    lastSyncRequestTime = currentTime
                    SendAddonMessage("XY_LOOTLIST_SYNC_REQUEST", "", "RAID")
                end
            end
        end
    end
    --离开队伍后恢复团长功能
    if event == "CHAT_MSG_SYSTEM" and arg1 == "你已经离开了这个团队" then
        IsLeader = false
        EnableLeaderOperation()
    end
    --删除新增的事件，没有用，并且会造成消息互相同步 by无道暴君 20250217
	--20250219增加记录监控roll点功能
	if event == "CHAT_MSG_SYSTEM" and isRolling and rollEndTime > GetTime() then
		local pattern = "(.+)掷出(%d+)（(%d+)-(%d+)）"
        if (string.find(arg1, pattern)) then
			--1 32 无道暴君 100 1 100
			local _, _, player, roll, min_roll, max_roll = string.find(arg1, pattern)
			if min_roll=="1" and max_roll=="100" then
				local exis = false
				local n = getn(rollData)
				if n > 0 then
					for i = 1, n do
						if rollData[i]["name"] == player then
							exis=true
						end
					end
				end
				
				if not exis then
					local xyInfo = getXyInfo(player)
					local curInfo = {
						name = player,
						roll = roll,
						class = xyInfo["class"],
						xy = xyInfo["xy"],
						dkp = xyInfo["dkp"]
					}
					table.insert(rollData,curInfo)
					RollMonitor_UpdateList()
				end
			end
		end
    end
end




    -- 检测物品获取
    function XyTracker_CHATMSGLOOT(msg)
        local player, itemLink = string.match(msg, "(.+)获得了物品：(.+)。")
        if player and itemLink then    
            -- 非团长玩家检测到拾取信息时，发送同步消息给团长
            if not IsLeader then
                -- 构建同步消息：原始拾取消息
                local syncMsg =  msg
                -- 发送同步消息到插件通讯频道（队员发送给团长）
                SendAddonMessage("XY_MEMBER_LOOT", syncMsg, "RAID")
            end
            
            -- 先处理自动扣分逻辑（如果需要）
            if XyTrackerOptions.autoMinDkp then
                -- 检查该玩家是否在1分钟内发过言
                local currentTime = GetTime()
                local playerMessage = raidMessages[player]
                
                if playerMessage and (currentTime - playerMessage.timestamp) <= 60 then
                    local _, _, itemColor = string.find(itemLink, "|c(%x+)|H")
                    local shouldDeduct = false
                    
                    if itemColor == "ffa335ee" and XyTrackerOptions.purpleModeEnabled then
                        shouldDeduct = true
                    elseif itemColor == "ff0070dd" and XyTrackerOptions.blueModeEnabled then
                        shouldDeduct = true
                    elseif itemColor == "ff1eff00" and XyTrackerOptions.greenModeEnabled then
                        shouldDeduct = true
                    end
                    
                    if shouldDeduct and IsLeader then  -- 额外添加 IsLeader 检查
                        local info = getXyInfo(player)
                        if info then
                            local number = playerMessage.message
                            
                            -- 修改：支持多物品许愿，使用MarkItemAsCompleted函数处理已完成许愿的显示逻辑
                            if info["xy"] == "|cFF00FFFF已完成许愿|r" then
                                -- 已完成许愿状态，直接扣分
                                info["dkp"] = tonumber(info["dkp"]) - number
                                -- 只有团长和本人才通报
                                if IsLeader or player == playerName then
                                    SendChatMessage(player .. " 扣除" .. number .. "分，当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                end
                            elseif info["xy"] and info["xy"] ~= "---未许愿---" then
                                -- 有许愿内容时的处理
                                if number == 0 or number == 5 or number > 5 then
                                    -- 提取物品名称（用于匹配）
                                    local itemName = string.match(itemLink, "|h%[(.-)%]|h")
                                    if not itemName then
                                        itemName = itemLink -- 如果无法提取物品名称，使用整个链接
                                    end
                                                             
                                    -- 调用MarkItemAsCompleted函数更新许愿状态
                                    local newWish = MarkItemAsCompleted(info["xy"], itemName)
                                    
                                    -- 如果许愿状态发生变化
                                    if newWish ~= info["xy"] then
                                        info["xy"] = newWish
                                        
                                        -- 根据不同情况发送相应的消息
                                        if number == 0 then
                                            -- 只有团长和本人才通报
                                            if IsLeader or player == playerName then
                                                SendChatMessage(player .. " 已完成当前物品许愿，当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                            end
                                        elseif number == 5 then
                                            -- 只有团长和本人才通报
                                            if IsLeader or player == playerName then
                                                SendChatMessage(player .. " 已完成当前物品许愿（出5分），当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                            end
                                        else
                                            local deductPoints = number - 5
                                            info["dkp"] = tonumber(info["dkp"]) - deductPoints
                                            -- 只有团长和本人才通报
                                            if IsLeader or player == playerName then
                                                SendChatMessage(player .. " 已完成当前物品许愿，并扣除" .. deductPoints .. "分（出" .. number .. "分-5分），当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                            end
                                        end
                                    else
                                        -- 如果没有匹配的物品，发送提示消息（只有团长）
                                        if IsLeader then
                                            SendChatMessage(player .. " 获得的物品不在许愿列表中", "RAID", this.language, nil)
                                        end
                                    end
                                elseif number <= 4 then
                                    -- 1-4分的情况：扣除相应分数
                                    info["dkp"] = tonumber(info["dkp"]) - number
                                    -- 只有团长和本人才通报
                                    if IsLeader or player == playerName then
                                        SendChatMessage(player .. " 扣除" .. number .. "分，当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                                    end
                                end
                            end
                            
                            XyTracker_UpdateList()
                            syncXy()
                            
                            -- 只清除获得物品玩家的发言记录
                            raidMessages[player] = nil
                            
                            -- 保存扣除的分数以便在拾取列表中显示
                            local deductedPoints = 0
                            if number <= 4 then
                                deductedPoints = number
                            else
                                deductedPoints = number - 5
                            end
                            
                            -- 存储在临时变量中，供下面的拾取列表使用
                            if not tempDeductedPoints then
                                tempDeductedPoints = {}
                            end
                            tempDeductedPoints[player] = deductedPoints
                        end
                    end
                end
            end
            
            -- 记录所有拾取的物品到拾取列表，无论是否花费分数
            local itemName = string.match(itemLink, "|h%[([^%]]+)%]|h")
            if itemName then
                -- 获取玩家信息
                local info = getXyInfo(player)
                
                -- 确定物品是否为许愿物品
                local isWishItem = false
                if info and info["xy"] and info["xy"] ~= "---未许愿---" then
                    -- 使用ExtractItemName检查玩家是否许愿了当前物品
                    local success, primaryWishItem, allWishItems = pcall(ExtractItemName, info["xy"])
                    if success then
                        -- 简单清理物品名称（去掉多余字符）
                        local function cleanString(str)
                            if not str then return "" end
                            str = string.gsub(str, "|c%x+", "")
                            str = string.gsub(str, "|r", "")
                            str = string.gsub(str, "%[([^%]]+)%]", "%1")
                            str = string.lower(str)
                            return str
                        end
                        
                        local cleanItemName = cleanString(itemName)
                        
                        -- 【修复】使用精确匹配
                        -- 检查主物品名称是否匹配，包括已完成许愿的情况
                        if primaryWishItem and primaryWishItem ~= "" then
                            local cleanPrimaryWishItem = cleanString(primaryWishItem)
                            if cleanPrimaryWishItem == cleanItemName then
                                isWishItem = true
                            end
                        end
                        
                        -- 额外检查是否已完成过该物品的许愿
                        if not isWishItem and string.find(info["xy"], "已完成许愿") then
                            -- 如果已经是已完成许愿状态，但当前物品未被匹配，也标记为许愿物品
                            isWishItem = true
                        end
                        
                        -- 如果主物品不匹配，检查其他物品名称
                        if not isWishItem and type(allWishItems) == "table" and getn(allWishItems) > 0 then
                            for _, wishItem in ipairs(allWishItems) do
                                local cleanWishItem = cleanString(wishItem)
                                if cleanWishItem == cleanItemName then
                                    isWishItem = true
                                    break
                                end
                            end
                        end
                    end
                end
                
                -- 确定扣除的分数（如果有）
                local pointsUsed = 0
                if tempDeductedPoints and tempDeductedPoints[player] then
                    pointsUsed = tempDeductedPoints[player]
                    -- 清除临时存储的分数，避免影响其他物品
                    tempDeductedPoints[player] = nil
                end
                
                -- 如果是许愿物品，无论玩家是否打数字，都自动标记为已许愿
                if isWishItem and info and info["xy"] and info["xy"] ~= "---未许愿---" and not string.find(info["xy"], "已完成许愿") then
                    -- 调用MarkItemAsCompleted函数更新许愿状态
                    local newWish = MarkItemAsCompleted(info["xy"], itemName)
                    
                    -- 如果许愿状态发生变化
                    if newWish ~= info["xy"] then
                        info["xy"] = newWish
                        
                        -- 如果没有打数字，发送已完成许愿的消息（只有团长和本人）
                        if not playerMessage then
                            if IsLeader or player == playerName then
                                SendChatMessage(player .. " 已完成当前物品许愿，当前剩余分数：[" .. info["dkp"] .. "]", "RAID", this.language, nil)
                            end
                            
                            -- 更新列表和同步
                            XyTracker_UpdateList()
                            syncXy()
                        end
                    end
                end
                

                    -- 只有在有IsLeader信息的情况下才自动记录拾取列表
                if IsLeader ~= nil then
                    -- 加强数据验证和类型转换，确保添加的物品数据格式正确
                    local hour, minute = GetGameTime()
                    
                    -- 确保player是有效的字符串
                    local validPlayerName = player and tostring(player) or "未知玩家"
                    
                    -- 创建物品数据对象，确保所有字段类型正确
                    local lootItem = {
                        itemName = tostring(itemName),
                        itemLink = itemLink and tostring(itemLink) or "",
                        playerName = validPlayerName,
                        points = type(pointsUsed) == "number" and pointsUsed or 0,
                        isWish = type(isWishItem) == "boolean" and isWishItem or false,
                        timestamp = {
                            hour = type(hour) == "number" and hour or 0,
                            minute = type(minute) == "number" and minute or 0
                        }
                    }
                    
                    -- 所有玩家都执行本地物品拾取逻辑，确保自己拾取的物品能被正常记录
                    -- 添加到LootList并更新UI
                    table.insert(LootList, lootItem)
                    
                    -- 更新拾取列表UI
                    XyTracker_UpdateLootList()
                    if IsLeader then
                        -- 传递当前lootItem对象，确保发送正确的物品信息
                        syncLootList(true, lootItem)
                    end
                end
            end
        end
    end
-- 处理系统消息，更新许愿信息
function XyTracker_OnSystemMessage()
    local values = {}
    for word in string.gmatch(arg1, "%S+") do
        table.insert(values, word)
    end
    
    -- 如果许愿未开始，直接返回
    if not XyInProgress then
        return
    end

    local val1 = values[1]
    
    -- 原有的许愿处理逻辑 - 修改为支持多物品许愿
    if val1 and string.lower(val1) == "xy" and getn(values) > 1 then
        -- 检查是否包含多个物品链接
        -- 安全地移除开头的XY命令
        local xyText = ""
        if type(arg1) == "string" then
            local success, result = pcall(function()
                return arg1:gsub("^[Xx][Yy]%s*", "")
            end)
            if success then
                xyText = result
            else
                xyText = arg1
            end
        end
        local hasMultipleItems = string.find(xyText, "|Hitem:.-|h.-|h.*|Hitem:.-|h.-|h")
        
        if hasMultipleItems then
            -- 处理多物品情况
            local itemCount = 0
            for itemLink in string.gmatch(xyText, "|Hitem:.-|h.-|h") do
                itemCount = itemCount + 1
                if itemCount > 1 then -- 跳过第一个物品，避免重复处理
                    XyTracker_OnXy(arg2, itemLink)
                end
            end
        end
        
        -- 处理第一个物品（保持原有逻辑）
        local Xy = values[2]
        XyTracker_OnXy(arg2, Xy)
        XyTracker_UpdateList()
        syncXy()
    elseif val1 and string.lower(val1) == "txy" and getn(values) > 2 then
        local player = values[2]
        local Xy = values[3]
        XyTracker_OnXy(player, Xy)
        XyTracker_UpdateList()
        syncXy()
    elseif XyTrackerOptions.XyOnlyMode == 0 and arg1 and string.find(arg1, "|Hitem:") then
        -- 检查是否包含多个物品链接
        local hasMultipleItems = string.find(arg1, "|Hitem:.-|h.-|h.*|Hitem:.-|h.-|h")
        
        if hasMultipleItems then
            -- 处理多物品情况
            local itemCount = 0
            for itemLink in string.gmatch(arg1, "|Hitem:.-|h.-|h") do
                itemCount = itemCount + 1
                if itemCount > 1 then -- 跳过第一个物品，避免重复处理
                    XyTracker_OnXy(arg2, itemLink)
                end
            end
        end
        
        -- 处理第一个物品（保持原有逻辑）
        local Xy = arg1
        XyTracker_OnXy(arg2, Xy)
        XyTracker_UpdateList()
        syncXy()
    end
end

function receiveXySync(msg)
    DisableLeaderOperation()
    -- 标记开始接收同步数据
    IsReceivingSync = true
    --获取同步开始
    for n, x in string.gfind(msg, "n=(.+),x=(.+)") do
        Xys = x
        XyArray = {}
        XyTracker_UpdateList()
        
        -- 【重要】设置数据变更标记，确保在游戏退出时自动保存
        _G["XyTracker_SavedWishList_LastUpdate"] = time()
        -- 记录当前XyArray的实际大小，用于验证
        _G["XyTracker_ArraySize_LastRecord"] = getn(XyArray)
        return
    end
    for p, c, x, s in string.gfind(msg, "p=(.+),c=(.+),x=(.+),s=(.+)") do
        -- 检查玩家是否已存在
        local playerExists = false
        local n = getn(XyArray)
        local oldXy = ""
        
        for i = 1, n do
            if XyArray[i]["name"] == p then
                playerExists = true
                oldXy = XyArray[i]["xy"] or ""
                -- 更新现有玩家的数据
                XyArray[i]["class"] = c
                if x == "---未许愿---" then
                    XyArray[i]["xy"] = ""
                else
                    XyArray[i]["xy"] = x
                end
                XyArray[i]["dkp"] = s
                break
            end
        end
        
        -- 如果玩家不存在，则添加新记录
        if not playerExists then
            local info = {}
            info["name"] = p
            info["class"] = c
            if x == "---未许愿---" then
                info["xy"] = ""
            else
                info["xy"] = x
            end
            info["dkp"] = s
            table.insert(XyArray, info)
        end
        
        -- 检查是否发生了许愿变更（从无到有或内容改变）
        -- 重要修复：在接收同步数据时不发送公告，避免重复公告
        if XyTrackerOptions.AutoAnnounce and x ~= "---未许愿---" and x ~= "" and x ~= oldXy and not IsReceivingSync then
            -- 触发重复许愿检查
            local itemName = ExtractItemName(x)
            local count = 0
            for i = 1, getn(XyArray) do
                local currentXY = ExtractItemName(XyArray[i]["xy"] or "")
                if currentXY == itemName then
                    count = count + 1
                end
            end
            
            if count >= 2 then
                -- 使用全局的安全字符串清理函数
                local cleanItemName = safeCleanString(itemName)
                local currentLanguage = GetDefaultLanguage("player")
                SendChatMessage("☆"..cleanItemName.."☆已有 "..count.." 人许愿！", "RAID", currentLanguage, nil)
            end
        end
        
        XyTracker_UpdateList()
        
        -- 【重要】设置数据变更标记，确保在游戏退出时自动保存
        _G["XyTracker_SavedWishList_LastUpdate"] = time()
        -- 记录当前XyArray的实际大小，用于验证
        _G["XyTracker_ArraySize_LastRecord"] = getn(XyArray)
    end
    
    -- 同步结束，重置标记
    IsReceivingSync = false
end

function syncXy()
    local n = getn(XyArray)
    local msg = "";
    if n > 0 then
        msg = "n=" .. n .. ",x=" .. Xys
        SendAddonMessage("XY_SYNC", msg, "RAID")
        for i = 1, n do
            local info = XyArray[i]
            local player = info["name"]
            local xy = info["xy"] or "---未许愿---"
            local dkp = info["dkp"] or 4
            local class = info["class"] or "无"
            msg = "p=" .. player .. ",c=" .. class .. ",x=" .. xy .. ",s=" .. dkp
            SendAddonMessage("XY_SYNC", msg, "RAID")
        end
    end
end

function DisableLeaderOperation()
    --这个必须保留，避免团员在进团之前开过许愿 by 无道暴君 20250217
    XyInProgress = false
    getglobal("XyTrackerFrameStartButton"):Hide();
    getglobal("XyTrackerFrameStopButton"):Hide();
    getglobal("XyTrackerFrameResetButton"):Hide();
    -- 隐藏编辑文本按钮（队员模式）
    if getglobal("XyTrackerFrameEditStarttextButton") then
        getglobal("XyTrackerFrameEditStarttextButton"):Hide();
    end
    -- 未许愿人数按钮在团员模式下也显示
    --getglobal("XyTrackerFrameAnnounceButton"):Hide();
    -- 导出许愿按钮在团员模式下也显示
    --getglobal("XyTrackerFrameExportButton"):Hide();
    getglobal("XyTrackerFrameChuShiHua_DKP"):Hide();
    -- 团员端隐藏宣言相关按钮
    getglobal("XyTrackerFrameDeclarationButton"):Hide();
    getglobal("XyTrackerFrameAnnounceDeclarationButton"):Hide();
    getglobal("XyTrackerDeclarationLargeEditBox"):Hide();
end

function EnableLeaderOperation()
    XyInProgress = false
    getglobal("XyTrackerFrameStartButton"):Show();
    getglobal("XyTrackerFrameResetButton"):Show();
    -- 显示编辑文本按钮（团长模式）
    if getglobal("XyTrackerFrameEditStarttextButton") then
        getglobal("XyTrackerFrameEditStarttextButton"):Show();
    end
    getglobal("XyTrackerFrameAnnounceButton"):Show();
    getglobal("XyTrackerFrameExportButton"):Show();
    getglobal("XyTrackerFrameChuShiHua_DKP"):Show();
    -- 团长端显示宣言按钮
    getglobal("XyTrackerFrameDeclarationButton"):Show();
    getglobal("XyTrackerFrameAnnounceDeclarationButton"):Show();
end

function XyQuery(player, dkpnumber)
    local n = getn(XyArray)
    for i = 1, n do
        local name = XyArray[i]["name"]
        local xy = XyArray[i]["xy"]
        local currentDKP = XyArray[i]["dkp"] -- 直接使用存储的值，不做任何转换或限制
        
        if not xy then
            xy = ""
        end
        if player == name then
            if dkpnumber and dkpnumber ~= 0 then
                if dkpnumber > 0 then
                    SendChatMessage(player .. " 增加[" .. dkpnumber .. "]分,当前剩余分数：[" .. currentDKP .. "]", "RAID", this.language, nil);
                else
                    SendChatMessage(player .. " 扣除[" .. 0 - dkpnumber .. "]分,当前剩余分数：[" .. currentDKP .. "]", "RAID", this.language, nil);
                end
            else
                SendChatMessage(player .. " 许愿[" .. xy .. "],当前剩余分数：[" .. currentDKP .. "]", "RAID", this.language, nil);
            end
            break -- 找到玩家后就退出循环
        end
    end
end


function XyTracker_OnXy(name, Xy)
    local info = getXyInfo(name)
    info["xy"] = Xy
    -- 只有团长端会弹出界面
    if IsLeader then
    XyTracker_ShowXyWindow()
    end
    
    -- 新增：重复许愿检查 - 移除XyInProgress条件，确保无论是否点击停止按钮都能播报重复警报
    local itemName = ExtractItemName(Xy)
    local count = 0
    local currentLanguage = this.language or GetDefaultLanguage("player") -- 确保有有效的语言设置
    for i = 1, getn(XyArray) do
        local currentXY = ExtractItemName(XyArray[i]["xy"] or "")
        if currentXY == itemName then
            count = count + 1
        end
    end
    if XyTrackerOptions.AutoAnnounce and count >= 2 then
        -- 确保在多物品许愿场景下，每个物品的重复检查都能独立进行
        -- 使用全局的安全字符串清理函数
        local cleanItemName = safeCleanString(itemName)
        SendChatMessage("☆"..cleanItemName.."☆已有 "..count.." 人许愿！", "RAID", currentLanguage, nil)
    end
    
    -- 【重要】设置数据变更标记，确保在游戏退出时自动保存
    _G["XyTracker_SavedWishList_LastUpdate"] = time()
    -- 记录当前XyArray的实际大小，用于验证
    _G["XyTracker_ArraySize_LastRecord"] = getn(XyArray)
end

function XyTracker_OnStartButtonClick()
    if GetNumRaidMembers() > 1 then
        IsLeader = true
        LeaderName = UnitName("player")  -- 记录当前玩家作为许愿权限拥有者
        XyTracker_UpdateLeaderText()  -- 更新UI显示

        local Starttext = XyTracker_GetCurrentStarttext()
	SendChatMessage(Starttext, "RAID", this.language, nil);
        XyInProgress = true
        
        -- 重新注册右键菜单按钮，确保团长权限按钮可见
        XyTracker_RegisterRightClickMenuButtons()
        
        -- 注释掉播报所有人许愿的代码
        -- XyTracker_AnnounceAllWishes()
        
        XyTracker_ShowXyWindow()
        --同步到团员端
        SendAddonMessage("XY_START", "", "RAID")
        -- 立即同步当前的LootList数据给所有团员
        XyTracker_UpdateList()
    end
end

-- 更新许愿权限拥有者显示文本
function XyTracker_UpdateLeaderText()
 
    local leaderText = getglobal("XyTrackerLeaderText")
    if leaderText then
        -- 确保文本元素可见
        leaderText:Show()
    
        -- 设置正确的显示文本
        if LeaderName and LeaderName ~= "" then
            leaderText:SetText("许愿权：" .. LeaderName)
        else
            leaderText:SetText("许愿权：无人")
        end
        
        -- 添加调试信息，帮助排查问题
        -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 更新许愿权限拥有者显示: " .. (LeaderName or "无人"))
    else
        -- 尝试动态创建元素，确保显示
        if XyTrackerFrame and XyTrackerFrameStatusText then
            leaderText = XyTrackerFrame:CreateFontString("XyTrackerLeaderText", "ARTWORK", "GameFontNormalSmall")
            leaderText:SetPoint("LEFT", XyTrackerFrameStatusText, "LEFT", 88, 0)
            leaderText:SetWidth(180)
            leaderText:SetHeight(16)
            leaderText:SetTextColor(1.0, 0.82, 0)
            leaderText:SetJustifyH("LEFT")
            leaderText:SetJustifyV("MIDDLE")
            leaderText:Show()
            
            -- 设置文本内容
            if LeaderName and LeaderName ~= "" then
                leaderText:SetText("许愿权：" .. LeaderName)
            else
                leaderText:SetText("许愿权：无人")
            end
        end
    end
end

function XyTracker_OnStopButtonClick()
    SendChatMessage("许愿结束，后续许愿无效", "RAID", this.language, nil)
    XyInProgress = false
end

-- 创建临时变量用于存储最近扣除的分数
local tempDeductedPoints = nil

function XyTracker_OnClearButtonClick()
    -- 弹出确认对话框
    StaticPopup_Show("XYTRACKER_CONFIRM_RESET")
end

-- 注册静态弹窗
StaticPopupDialogs["XYTRACKER_CONFIRM_RESET"] = {
    text = "确定要重置所有成员的许愿数据吗？",
    button1 = "确定",
    button2 = "取消",
    OnAccept = function()
        XyTracker_DoActualClear()  -- 实际执行重置
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true
}

function XyTracker_DoActualClear()
    XyArray = {}
    XyItemCount = {}  -- 新增：清空物品计数
    -- 注意：LootList 不会在这里清空，只有调用 XyTracker_ClearLootList() 才会清空拾取列表
    -- 这样可以确保数据保存直到手动按下清除按钮
    local totalMembers = GetNumRaidMembers()
    if totalMembers then
        for i = 1, totalMembers do
            local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
            info = {}
            info["name"] = name
            info["class"] = class
            info["dkp"] = 4
            info["xy"] = "---未许愿---"
            table.insert(XyArray, info)
            NoXyList = NoXyList .. name .. " "
        end
    end
    XyTracker_UpdateList()
    if IsLeader then
        syncXy()
    end
end

function XyTracker_OnRefreshButtonClick()
    local totalMembers = GetNumRaidMembers()
    if totalMembers then
        -- 创建一个临时表来存储现有的许愿信息，使用玩家名字作为索引
        local existingWishes = {}
        for i = 1, getn(XyArray) do
            local info = XyArray[i]
            existingWishes[info["name"]] = {
                index = i,
                xy = info["xy"],
                dkp = info["dkp"] or DefaultDKP,
                class = info["class"]
            }
        end
        
        -- 检查当前团队中的所有成员，确保他们在XyArray中有记录
        for i = 1, totalMembers do
            local name, rank, subgroup, level, class = GetRaidRosterInfo(i)
            
            -- 如果该玩家之前有许愿信息，则更新职业（可能有变化）
            if existingWishes[name] then
                XyArray[existingWishes[name].index]["class"] = class
            else
                -- 如果是新成员，添加到XyArray
                local info = {}
                info["name"] = name
                info["class"] = class
                info["xy"] = "---未许愿---"
                info["dkp"] = DefaultDKP or 4
                table.insert(XyArray, info)
            end
        end
        
        if IsLeader then
            -- 队长直接发布同步信息
            syncXy()
        else
            -- 队员请求队长发送同步信息（包括许愿和拾取数据）
            SendAddonMessage("XY_SYNC_NEW", "", "RAID")
            SendAddonMessage("XY_LOOTLIST_SYNC_REQUEST", "", "RAID")
        end
    end
    XyTracker_UpdateList()
end

-- 显示拾取列表窗口
function XyTracker_ShowLootListFrame()
    local lootFrame = getglobal("XyTrackerLootListFrame")
    if lootFrame then
        lootFrame:Show()
        XyTracker_UpdateLootList()
    end
end

-- 更新拾取列表
function XyTracker_UpdateLootList()
    -- 确保LootList存在
    if not LootList then
        LootList = {}
    end
    
    -- 对拾取列表进行排序
    XyLootSortList()
    
    local scrollFrame = getglobal("LootListScrollFrame")
    local numItems = getn(LootList)
    
    FauxScrollFrame_Update(scrollFrame, numItems, 16, 25)
    
    for i = 1, 16 do
        local button = getglobal("LootFrameListButton"..i)
        local index = i + FauxScrollFrame_GetOffset(scrollFrame)
        
        if index <= numItems then
            local lootItem = LootList[index]
            
            -- 加强数据验证，确保lootItem是有效表
            if not lootItem or type(lootItem) ~= "table" then
                button:Hide()
                -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 跳过无效的拾取列表项 (索引: " .. index .. ")")
            else
                -- 设置按钮可见
                button:Show()
                
                -- 设置物品名称并根据品质染色
                local nameText = getglobal(button:GetName().."Name")
                if nameText then
                    local safeItemName = lootItem.itemName and tostring(lootItem.itemName) or "未知物品"
                    local safeItemLink = lootItem.itemLink and tostring(lootItem.itemLink) or ""
                    
                    -- 安全地从物品链接中提取颜色代码
                    local itemColor = nil
                    if safeItemLink and safeItemLink ~= "" then
                        local success, _, _, color = pcall(string.find, safeItemLink, "|c(%x+)|H")
                        if success and color then
                            itemColor = color
                        end
                    end
                    
                    -- 应用颜色或使用默认颜色
                    if itemColor then
                        -- 确保颜色代码格式正确
                        if string.len(itemColor) == 8 then
                            nameText:SetText("|c"..itemColor..safeItemName.."|r")
                        else
                            nameText:SetText(safeItemName)
                        end
                    else
                        nameText:SetText(safeItemName)
                    end
                    nameText:SetWidth(100)  -- 缩短物品名称宽度
                end
                
                -- 设置拾取时间
                local timeText = getglobal(button:GetName().."Time")
                if timeText then
                    local safeTimestamp = lootItem.timestamp and type(lootItem.timestamp) == "table" and lootItem.timestamp or nil
                    local timeString = Xy_FormatTime(safeTimestamp)
                    timeText:SetText(timeString)
                    timeText:SetWidth(80)
                end
                
                -- 设置归属玩家
                local playerText = getglobal(button:GetName().."Xy")
                if playerText then
                    local safePlayerName = lootItem.playerName and tostring(lootItem.playerName) or "未知玩家"
                    playerText:SetText(safePlayerName)
                    playerText:SetWidth(80)
                end
                
                -- 设置使用分数
                local pointsText = getglobal(button:GetName().."DKP")
                if pointsText then
                    local safePoints = type(lootItem.points) == "number" and lootItem.points or 0
                    pointsText:SetText(safePoints)
                    pointsText:SetWidth(50)
                end
                
                -- 设置是否许愿
                local isWishText = getglobal(button:GetName().."IsWish")
                if isWishText then
                    local safeIsWish = type(lootItem.isWish) == "boolean" and lootItem.isWish or false
                    if safeIsWish then
                        -- 许愿成功，显示不同颜色和文字
                        isWishText:SetText("已许愿")
                        isWishText:SetTextColor(1, 0.5, 0, 1)  -- 橙色，代表许愿成功
                    else
                        isWishText:SetText("否")
                        isWishText:SetTextColor(1, 1, 1, 1)  -- 白色
                    end
                    isWishText:SetWidth(60)
                end
            end
            
            -- 设置背景颜色
            if math.mod(index, 2) == 0 then
                button:SetBackdropColor(0.1, 0.1, 0.1, 0.5)
            else
                button:SetBackdropColor(0, 0, 0, 0.5)
            end
            
            -- 禁用鼠标滑过操作
            button:SetScript("OnEnter", nil)
            button:SetScript("OnLeave", nil)
        else
            button:Hide()
        end
    end
end

-- 格式化时间戳或获取当前游戏时间
function Xy_FormatTime(timestamp)
    if timestamp then
        -- 有时间戳时使用时间戳
        if type(timestamp) == "table" and timestamp.hour and timestamp.minute then
            -- 处理新的{hour, minute}格式的时间戳
            return string.format("%02d:%02d", timestamp.hour, timestamp.minute)
        else
            -- 兼容旧的时间戳格式
            local hour, min = GetGameTime()
            return string.format("%02d:%02d", hour, min)
        end
    else
        -- 无时间戳时使用游戏时间
        local hour, min = GetGameTime()
        return string.format("%02d:%02d", hour, min)
    end
end

-- 从物品链接中提取物品品质的辅助函数
function GetItemQualityFromLink(itemLink)
    if not itemLink or type(itemLink) ~= "string" then
        return 0
    end
    
    -- 尝试从物品链接中提取品质信息
    -- 物品链接格式: |cffa335ee|Hitem:12345:0:0:0:0:0:0:0|h[物品名称]|h|r
    local qualityCode = string.match(itemLink, "|c(%x+)|Hitem")
    if not qualityCode then
        return 0
    end
    
    -- 根据颜色代码映射到品质等级
    local qualityMap = {
        ["ff9d9d9d"] = 0, -- 灰色/垃圾
        ["ffffffff"] = 1, -- 白色/普通
        ["ff1eff00"] = 2, -- 绿色/优秀
        ["ff0070dd"] = 3, -- 蓝色/精良
        ["ffa335ee"] = 4, -- 紫色/史诗
        ["ffff8000"] = 5, -- 橙色/传说
        ["ffe6cc80"] = 6  -- 金色/神器
    }
    
    return qualityMap[string.lower(qualityCode)] or 0
end

-- 对拾取列表进行排序
function XyLootSortList()
    -- 确保LootList是一个有效的表
    if not LootList or type(LootList) ~= "table" or getn(LootList) <= 1 then
        return
    end
    
    table.sort(LootList, function(a, b)
        -- 确保a和b是有效的表
        if not a or type(a) ~= "table" then
            return false
        end
        if not b or type(b) ~= "table" then
            return true
        end
        
        -- 获取排序字段的值
        local valA = a[LootSortField]
        local valB = b[LootSortField]
        
        -- 特殊处理物品名称排序：先按品质，再按ID
        if LootSortField == "itemName" then
            -- 获取物品品质
            local qualityA = GetItemQualityFromLink(a.itemLink or "")
            local qualityB = GetItemQualityFromLink(b.itemLink or "")
            
            -- 先按品质排序（高品质在前）
            if qualityA ~= qualityB then
                return qualityA * LootSortOrder > qualityB * LootSortOrder
            else
                -- 品质相同时，按物品ID排序
                local itemIDA = tonumber(ExtractItemID(a.itemLink or "")) or 0
                local itemIDB = tonumber(ExtractItemID(b.itemLink or "")) or 0
                return itemIDA * LootSortOrder < itemIDB * LootSortOrder
            end
        
        -- 如果两个值相等，按物品名称排序
        elseif valA == valB then
            return (a.itemName or "") < (b.itemName or "")
        else
            if LootSortField == "timestamp" then
                -- 处理timestamp字段，确保安全地获取和比较时间值
                local function getTimeValue(timeVal)
                    if not timeVal then
                        return 0
                    end
                    
                    -- 检查是否是表类型并包含hour和minute
                    if type(timeVal) == "table" and timeVal.hour and timeVal.minute then
                        -- 将时间转换为总分钟数进行比较
                        return timeVal.hour * 60 + timeVal.minute
                    
                    -- 检查是否是字符串格式的时间（时:分）
                    elseif type(timeVal) == "string" then
                        local hours, minutes = string.match(timeVal, "(%d+):(%d+)")
                        if hours and minutes then
                            return tonumber(hours) * 60 + tonumber(minutes)
                        end
                    
                    -- 尝试将其他类型转换为字符串并解析
                    else
                        local timeStr = tostring(timeVal)
                        local hours, minutes = string.match(timeStr, "(%d+):(%d+)")
                        if hours and minutes then
                            return tonumber(hours) * 60 + tonumber(minutes)
                        end
                    end
                    
                    return 0 -- 默认值
                end
                
                local t1 = getTimeValue(valA)
                local t2 = getTimeValue(valB)
                return t1 * LootSortOrder < t2 * LootSortOrder
            elseif LootSortField == "isWish" then
                -- 特殊处理是否许愿字段，已许愿的应该排在前面
                local wishA = valA and 1 or 0
                local wishB = valB and 1 or 0
                return wishA * LootSortOrder > wishB * LootSortOrder -- 注意这里是大于号，让已许愿的排在前面
            elseif type(valA) == "number" and type(valB) == "number" then
                return valA * LootSortOrder < valB * LootSortOrder
            else
                -- 对于字符串和其他类型，转换为字符串后比较
                return tostring(valA or "") < tostring(valB or "")
            end
        end
    end)
end

-- 设置排序字段
function XyLootSortOptions(field)
    -- 确保排序变量已初始化
    if not LootSortField then
        LootSortField = "timestamp"
    end
    if not LootSortOrder then
        LootSortOrder = 1
    end
    
    -- 更新排序字段和顺序
    if LootSortField == field then
        LootSortOrder = -LootSortOrder
    else
        LootSortField = field
        LootSortOrder = 1
    end
    
    -- 只对筛选后的列表进行排序，不再重新排序原始列表和重新应用筛选
    -- 确保即使在多次点击表头时，也只使用筛选后的列表，不会混入被筛选掉的物品
    
    -- 确保FilteredLootList和OriginalFilteredLootList存在
    if not _G["FilteredLootList"] or type(_G["FilteredLootList"]) ~= "table" then
        _G["FilteredLootList"] = {}
    end
    if not _G["OriginalFilteredLootList"] or type(_G["OriginalFilteredLootList"]) ~= "table" then
        _G["OriginalFilteredLootList"] = {}
    end
    
    -- 重新从OriginalFilteredLootList创建FilteredLootList，确保使用的是经过筛选的数据
    _G["FilteredLootList"] = {}
    for i = 1, getn(_G["OriginalFilteredLootList"]) do
        _G["FilteredLootList"][i] = _G["OriginalFilteredLootList"][i]
    end
    
    -- 强制刷新UI，XyTracker_UpdateLootList会使用FilteredLootList
    XyTracker_UpdateLootList()
    
    -- 重置滚动条位置，但只使用FilteredLootList
    local scrollFrame = getglobal("LootListScrollFrame")
    if scrollFrame then
        FauxScrollFrame_SetOffset(scrollFrame, 0)
        local filteredCount = getn(_G["FilteredLootList"] or {})
        FauxScrollFrame_Update(scrollFrame, filteredCount, 16, 25)
    end
    
    -- 强制重新布局，但只使用FilteredLootList
    local lootFrame = getglobal("XyTrackerLootListFrame")
    if lootFrame and lootFrame:IsVisible() then
        -- 先完全隐藏并重新显示框架，确保所有状态被重置
        lootFrame:Hide()
        
        -- 强制清空所有按钮，确保没有旧数据残留
        for i=1, 16 do
            local button = getglobal("LootFrameListButton"..i)
            if button then
                button:Hide()
            end
        end
        
        lootFrame:Show()
    end
    
    -- 再次调用XyTracker_UpdateLootList确保最新的筛选数据被正确显示
    XyTracker_UpdateLootList()
end

-- 清除拾取列表
function XyTracker_ClearLootList()
    -- 清空所有列表数据，包括原始列表和筛选后的临时表
    LootList = {}
    _G["OriginalFilteredLootList"] = {}
    _G["FilteredLootList"] = {}
    XyTracker_UpdateLootList()
end

-- 从物品链接中提取物品ID的辅助函数
function ExtractItemID(itemLink)
    if not itemLink or type(itemLink) ~= "string" then
        return "0"  -- 返回默认值而不是空字符串
    end
    
    -- 尝试从物品链接中提取物品ID
    local itemID = string.match(itemLink, "|Hitem:(%d+)")
    return itemID or "0"  -- 确保总是返回一个有效的字符串
end

-- 团长同步LootList数据给所有团员
-- 参数: onlyNewItem - 是否只同步最新拾取的物品（默认：false，同步全部）
-- 参数: specificItem - 可选，指定要同步的具体物品对象
function syncLootList(onlyNewItem, specificItem)
    onlyNewItem = onlyNewItem or false
    
    -- 检查LootList是否存在且有数据
    if not LootList or getn(LootList) == 0 then
        return
    end
    
    -- 分段发送LootList数据
    -- 由于AddonMessage有长度限制，我们需要确保每件物品单独发送
    local currentIndex = 1
    local chunkSize = 1  -- 每次只发送1个物品
    local totalItems = getn(LootList)
    
    -- 如果只同步最新物品
    if onlyNewItem then
        currentIndex = totalItems  -- 从最后一个物品开始
        chunkSize = 1  -- 每次只发送1个物品
        -- 只处理最新的一个物品，不进行批量处理
        local lootItem = specificItem or LootList[currentIndex]
        if lootItem then
            -- 从物品链接中提取物品ID，只发送关键信息
            local itemID = ExtractItemID(lootItem.itemLink)
            local points = lootItem.points or 0
            local isWish = lootItem.isWish and 1 or 0
            local safePlayerName = lootItem.playerName or ""
            local hour = lootItem.timestamp and lootItem.timestamp.hour or 0
            local minute = lootItem.timestamp and lootItem.timestamp.minute or 0
            
            -- 替换可能导致解析问题的特殊字符
            safePlayerName = string.gsub(safePlayerName, "|", "||")  -- 转义竖线
            local safeItemName = lootItem.itemName or "未知物品"
            safeItemName = string.gsub(safeItemName, "|", "||")  -- 转义物品名称中的竖线
            
            -- 确保itemID不为空
            if not itemID or itemID == "" then
                itemID = "0"
            end
            
            -- 获取物品品质信息
            local itemQuality = 5 -- 默认紫色史诗
            local itemName, itemLink, quality = GetItemInfo(itemID)
            if quality and type(quality) == "number" then
                itemQuality = quality
            end
            
            -- 使用新的格式序列化数据：物品ID、物品名称、玩家名称、分数、是否为许愿、时间戳、物品品质
                -- 使用分号代替竖线，避免与魔兽世界的转义代码冲突
                local chunkData = string.format(";i=%s,n=%s,f=%d,x=%d,p=%s,t=%02d:%02d,q=%d",
                    itemID,
                    safeItemName,
                    points,
                    isWish,
                    safePlayerName,
                    hour,
                    minute,
                    itemQuality
                )
            
            -- 发送当前批次数据，添加批次信息，使用冒号分隔批次信息
            -- 确保消息格式正确，让接收方能够正确解析为单个物品
            -- 修复：确保起始索引正确设置为最新物品的索引
            local message = string.format("%d:%d:%d%s",
                currentIndex,  -- 起始索引设为当前物品索引
                1,             -- 每次只发送1个物品
                totalItems,    -- 总物品数
                chunkData
            )
        
            SendAddonMessage("XY_LOOTLIST_SYNC", message, "RAID")
            
            -- 已移除：团长不再接收自己发送的数据
        end
        return  -- 发送单个物品后直接返回，不进行递归
    end
    
    -- 处理批量同步的情况
    while currentIndex <= totalItems do
        local chunkData = ""
        local itemsInChunk = 0
        
        -- 收集当前批次的数据（每次只发送一个物品）
        for i = currentIndex, math.min(currentIndex + chunkSize - 1, totalItems) do
            local lootItem = LootList[i]
            if lootItem then
                -- 从物品链接中提取物品ID，只发送关键信息
                local itemID = ExtractItemID(lootItem.itemLink)
                local points = lootItem.points or 0
                local isWish = lootItem.isWish and 1 or 0
                local safePlayerName = lootItem.playerName or ""
                local hour = lootItem.timestamp and lootItem.timestamp.hour or 0
                local minute = lootItem.timestamp and lootItem.timestamp.minute or 0
                
                -- 替换可能导致解析问题的特殊字符
                safePlayerName = string.gsub(safePlayerName, "|", "||")  -- 转义竖线
                local safeItemName = lootItem.itemName or "未知物品"
                safeItemName = string.gsub(safeItemName, "|", "||")  -- 转义物品名称中的竖线
                
                -- 确保itemID不为空
                if not itemID or itemID == "" then
                    itemID = "0"
                end
                
                -- 获取物品品质信息
                local itemQuality = 5 -- 默认紫色史诗
                local itemName, itemLink, quality = GetItemInfo(itemID)
                if quality and type(quality) == "number" then
                    itemQuality = quality
                end
                
                -- 使用新的格式序列化数据：物品ID、物品名称、玩家名称、分数、是否为许愿、时间戳、物品品质
                -- 使用分号代替竖线，避免与魔兽世界的转义代码冲突
                local itemData = string.format(";i=%s,n=%s,f=%d,x=%d,p=%s,t=%02d:%02d,q=%d",
                    itemID,
                    safeItemName,
                    points,
                    isWish,
                    safePlayerName,
                    hour,
                    minute,
                    itemQuality
                )
                
                chunkData = chunkData .. itemData
                itemsInChunk = itemsInChunk + 1
            end
        end
        
        -- 发送当前批次数据，添加批次信息，使用冒号分隔批次信息
        local message = string.format("%d:%d:%d%s",
            currentIndex,
            itemsInChunk,
            totalItems,
            chunkData
        )
   
        SendAddonMessage("XY_LOOTLIST_SYNC", message, "RAID")
        
        -- 已移除：团长不再接收自己发送的数据
        
        -- 移动到下一批次
        currentIndex = currentIndex + chunkSize
        
        -- 小延迟以避免消息丢失
        if currentIndex <= totalItems then
            local delayFrame = CreateFrame("Frame")
            delayFrame.elapsed = 0
            delayFrame:SetScript("OnUpdate", function()
                this.elapsed = this.elapsed + arg1
                if this.elapsed >= 0.1 then
                    this:SetScript("OnUpdate", nil)
                    syncLootListBatch(currentIndex, totalItems)
                end
            end)
            return
        end
    end
end

-- 批量同步辅助函数，用于递归发送后续批次数据
function syncLootListBatch(startIndex, totalItems)
    local currentIndex = startIndex or 1
    local chunkSize = 1  -- 每次只发送1个物品，避免数据过长导致错误
    
    while currentIndex <= totalItems do
        local chunkData = ""
        local itemsInChunk = 0
        
        -- 收集当前批次的数据（每次只发送一个物品）
        for i = currentIndex, math.min(currentIndex + chunkSize - 1, totalItems) do
            local lootItem = LootList[i]
            if lootItem then
                -- 从物品链接中提取物品ID，只发送关键信息
                local itemID = ExtractItemID(lootItem.itemLink)
                local points = lootItem.points or 0
                local isWish = lootItem.isWish and 1 or 0
                local safePlayerName = lootItem.playerName or ""
                local hour = lootItem.timestamp and lootItem.timestamp.hour or 0
                local minute = lootItem.timestamp and lootItem.timestamp.minute or 0
       
                safePlayerName = string.gsub(safePlayerName, "|", "||")  -- 转义竖线
                local safeItemName = string.gsub(lootItem.itemName or "未知物品", "|", "||")
                
                -- 获取物品品质信息
                local itemQuality = 5 -- 默认紫色史诗
                local itemName, itemLink, quality = GetItemInfo(itemID)
                if quality and type(quality) == "number" then
                    itemQuality = quality
                end
                
                local itemData = string.format(";i=%s,n=%s,f=%d,x=%d,p=%s,t=%02d:%02d,q=%d",
                    itemID,
                    safeItemName,
                    points,
                    isWish,
                    safePlayerName,
                    hour,
                    minute,
                    itemQuality
                )
                
                chunkData = chunkData .. itemData
                itemsInChunk = itemsInChunk + 1
            end
        end
        
        -- 发送当前批次数据，添加批次信息，使用冒号分隔批次信息
        local message = string.format("%d:%d:%d%s",
            currentIndex,
            itemsInChunk,
            totalItems,
            chunkData
        )
     
        SendAddonMessage("XY_LOOTLIST_SYNC",message, "RAID")
        
        -- 移动到下一批次
        currentIndex = currentIndex + chunkSize
        
        -- 小延迟以避免消息丢失
        if currentIndex <= totalItems then
            local delayFrame = CreateFrame("Frame")
            delayFrame.elapsed = 0
            delayFrame:SetScript("OnUpdate", function()
                this.elapsed = this.elapsed + arg1
                if this.elapsed >= 0.1 then
                    this:SetScript("OnUpdate", nil)
                    syncLootListBatch(currentIndex, totalItems)
                end
            end)
            return
        end
    end
end
-- 辅助函数：通过物品ID和品质创建物品链接
function CreateBasicItemLink(itemID, itemQuality)
    if not itemID or itemID == "" then
        return ""
    end
    
    -- 根据品质设置正确的颜色代码
    local qualityColor = "ffa335ee" -- 默认紫色
    
    if itemQuality == 5 then -- 橙色传说
        qualityColor = "ffff8000"
    elseif itemQuality == 4 then -- 紫色史诗
        qualityColor = "ffa335ee"
    elseif itemQuality == 3 then -- 蓝色精良
        qualityColor = "ff0070dd"
    elseif itemQuality == 2 then -- 绿色优秀
        qualityColor = "ff1eff00"
    elseif itemQuality == 1 then -- 白色普通
        qualityColor = "ffffffff"

    end
    
    -- 创建包含正确颜色的物品链接
    return "|c"..qualityColor.."|Hitem:"..itemID..":0:0:0|h[未知物品]|h|r"
end

-- LootList同步数据处理函数 - 所有玩家共用的统一逻辑
function receiveLootListSync(message)
    -- 解析消息头：起始索引:当前批次数量:总数量
    local startIndex, itemsCount, totalItems, itemData = string.match(message, "(%d+):(%d+):(%d+)(.*)")
    
    if not startIndex or not itemsCount or not totalItems then
        -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 同步数据格式错误！")
        return
    end
    
    startIndex = tonumber(startIndex)
    itemsCount = tonumber(itemsCount)
    totalItems = tonumber(totalItems)
    
    -- 确保LootList存在
    if not LootList then
        LootList = {}
    end
    
    -- 解析物品数据
    local itemsProcessed = 0
    
    -- 逐行解析物品数据块（以分号分隔）
    local pos = 1
    while pos <= string.len(itemData) do
        -- 查找下一个物品的起始位置
        local nextPos = string.find(itemData, ";", pos + 1)
        if not nextPos then
            -- 如果没有下一个分号，处理最后一个物品
            nextPos = string.len(itemData) + 1
        end
        
        -- 提取单个物品的数据块
        local itemDataBlock = string.sub(itemData, pos, nextPos - 1)
        pos = nextPos
        
        -- 尝试解析新格式的数据 (;i=物品ID,n=物品名称,f=分数,x=是否许愿,p=玩家名,t=时间戳)
        -- 处理可能以分号开头的情况
        local firstChar = string.sub(itemDataBlock, 1, 1)
        local secondChar = string.sub(itemDataBlock, 2, 2)
        
        if firstChar == "i" or (firstChar == ";" and secondChar == "i") then
            -- 如果以分号开头，跳过分号
            if firstChar == ";" then
                itemDataBlock = string.sub(itemDataBlock, 2)
            end
            -- 改进的解析逻辑，使用更可靠的方式提取各个字段
            local itemID = string.match(itemDataBlock, "i=([^,]+)")
            local itemName = string.match(itemDataBlock, "n=([^,]+)")
            local points = string.match(itemDataBlock, "f=(%d+)")
            local isWish = string.match(itemDataBlock, "x=(%d+)")
            local playerName = string.match(itemDataBlock, "p=([^,]+)")
            local timestamp = string.match(itemDataBlock, "t=(%d%d:%d%d)")
            
            if itemID and itemName and points and isWish and playerName and timestamp then
                -- 安全解码特殊字符
                playerName = string.gsub(playerName, "||", "|")
                points = tonumber(points) or 0
                isWish = tonumber(isWish) == 1
                
                -- 解析时间戳
                local hour, minute = string.match(timestamp, "(%d%d):(%d%d)")
                hour = tonumber(hour) or 0
                minute = tonumber(minute) or 0
                
                -- 解析物品品质信息（新增字段）
                local itemQuality = 5 -- 默认紫色史诗
                local qualityMatch = string.match(itemDataBlock, "q=(%d+)")
                if qualityMatch then
                    itemQuality = tonumber(qualityMatch) or 5
                end
                
                -- 创建包含正确颜色的物品链接
                local basicItemLink = CreateBasicItemLink(itemID, itemQuality)
                
                -- 完全按照团长发送的数据构建物品对象
                local lootItem = {
                    itemName = itemName,
                    itemLink = basicItemLink,
                    playerName = playerName,
                    points = points,
                    isWish = isWish,
                    timestamp = {hour = hour, minute = minute}
                }
                
                -- 增强版去重和更新逻辑：确保总是保存最新的拾取记录
                local isDuplicate = false
                local existingIndex = nil
                
                for i, existingItem in ipairs(LootList) do
                    -- 判断标准：物品ID、玩家名称和拾取时间都相同，增加物品名称比较确保准确性
                    local existingItemID = ExtractItemID(existingItem.itemLink)
                    local existingTimestamp = existingItem.timestamp
                    
                    if existingItemID == itemID and 
                       existingItem.playerName == playerName and 
                       existingTimestamp and 
                       existingTimestamp.hour == hour and 
                       existingTimestamp.minute == minute and 
                       existingItem.itemName == itemName then
                        -- 找到完全匹配的物品，但仍然更新，确保数据是最新的
                        isDuplicate = true
                        existingIndex = i
                        break
                    end
                end
                
                if isDuplicate and existingIndex then
                    -- 更新现有物品，确保数据是最新的
                    LootList[existingIndex] = lootItem
                    itemsProcessed = itemsProcessed + 1
                else
                    -- 如果不是重复数据，则添加到列表中
                    -- 根据起始索引添加物品到正确位置，确保同步顺序正确
                    local insertIndex = getn(LootList) + 1
                    if startIndex and startIndex > insertIndex then
                        insertIndex = startIndex
                    end
                    table.insert(LootList, insertIndex, lootItem)
                    itemsProcessed = itemsProcessed + 1
                end
            else
                -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 解析物品数据失败: " .. itemDataBlock)
            end
        -- 保持向后兼容性，支持旧格式的数据解析 (n=物品链接,f=分数,x=是否许愿,p=玩家名,t=时间戳)
        -- 注意：旧格式仍然使用竖线分隔
        elseif firstChar == "n" or (firstChar == ";" and secondChar == "n") then
            -- 如果以分号开头，跳过分号
            if firstChar == ";" then
                itemDataBlock = string.sub(itemDataBlock, 2)
            end
            -- 改进的解析逻辑，使用更可靠的方式提取各个字段
            local itemLink = string.match(itemDataBlock, "n=([^,]+)")
            local points = string.match(itemDataBlock, "f=(%d+)")
            local isWish = string.match(itemDataBlock, "x=(%d+)")
            local playerName = string.match(itemDataBlock, "p=([^,]+)")
            local timestamp = string.match(itemDataBlock, "t=(%d%d:%d%d)")
            
            if itemLink and points and isWish and playerName and timestamp then
                -- 安全解码特殊字符
                itemLink = string.gsub(itemLink, "||", "|")
                playerName = string.gsub(playerName, "||", "|")
                points = tonumber(points) or 0
                isWish = tonumber(isWish) == 1
                
                -- 解析时间戳
                local hour, minute = string.match(timestamp, "(%d%d):(%d%d)")
                hour = tonumber(hour) or 0
                minute = tonumber(minute) or 0
                
                -- 从物品链接中提取物品名称
                local itemName = ExtractItemName(itemLink)
                
                -- 完全按照团长发送的数据构建物品对象
                local lootItem = {
                    itemName = itemName,
                    itemLink = itemLink,
                    playerName = playerName,
                    points = points,
                    isWish = isWish,
                    timestamp = {hour = hour, minute = minute}
                }
                
                -- 增强版去重和更新逻辑：确保总是保存最新的拾取记录
                local isDuplicate = false
                local existingIndex = nil
                
                for i, existingItem in ipairs(LootList) do
                    -- 判断标准：物品ID、玩家名称和拾取时间都相同，增加物品名称比较确保准确性
                    local existingItemID = ExtractItemID(existingItem.itemLink)
                    local existingTimestamp = existingItem.timestamp
                    
                    if existingItemID == ExtractItemID(itemLink) and 
                       existingItem.playerName == playerName and 
                       existingTimestamp and 
                       existingTimestamp.hour == hour and 
                       existingTimestamp.minute == minute and 
                       existingItem.itemName == itemName then
                        -- 找到完全匹配的物品，但仍然更新，确保数据是最新的
                        isDuplicate = true
                        existingIndex = i
                        break
                    end
                end
                
                if isDuplicate and existingIndex then
                    -- 更新现有物品，确保数据是最新的
                    LootList[existingIndex] = lootItem
                    itemsProcessed = itemsProcessed + 1
                else
                    -- 如果不是重复数据，则添加到列表中
                    -- 根据起始索引添加物品到正确位置，确保同步顺序正确
                    local insertIndex = getn(LootList) + 1
                    if startIndex and startIndex > insertIndex then
                        insertIndex = startIndex
                    end
                    table.insert(LootList, insertIndex, lootItem)
                    itemsProcessed = itemsProcessed + 1
                end
            else
                -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 解析旧格式物品数据失败: " .. itemDataBlock)
            end
        end
    end
    
    -- 清理nil值，确保LootList是连续的
    local cleanLootList = {}
    for _, item in ipairs(LootList) do
        if item then
            table.insert(cleanLootList, item)
        end
    end
    LootList = cleanLootList
    
    -- 添加调试信息，帮助排查同步问题
    -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker调试] 处理批次: 起始索引="..startIndex..", 处理物品数="..itemsProcessed..", 总物品数="..totalItems)
    
    -- 检查是否已接收完所有数据
    local currentCount = getn(LootList)
    -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker调试] 当前LootList物品总数: "..currentCount)
    
    -- 如果已接收完所有数据或者当前索引已到达总数量，更新UI
    if currentCount >= totalItems or startIndex + itemsProcessed - 1 >= totalItems then
        -- 使用与团长完全相同的更新逻辑刷新UI
        XyTracker_UpdateLootList()
        -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 拾取列表已从团长同步！共"..currentCount.."个物品")
    end
end

-- 保存拾取列表到独立变量
function XyTracker_SaveLootList()
    -- 确保SavedLootList存在且是一个新的空表
    SavedLootList = {}
    
    -- 深拷贝当前LootList数据
    local savedCount = 0
    local lootCount = getn(LootList)
    for i = 1, lootCount do
        local lootItem = LootList[i]
        -- 只保存有效的物品数据
        if lootItem and type(lootItem) == "table" and 
           lootItem.itemName and type(lootItem.itemName) == "string" and lootItem.itemName ~= "" and 
           lootItem.playerName and type(lootItem.playerName) == "string" and lootItem.playerName ~= "" then
            
            -- 创建保存的物品数据
            local savedItem = {
                itemName = tostring(lootItem.itemName),
                itemLink = lootItem.itemLink and tostring(lootItem.itemLink) or "",
                playerName = tostring(lootItem.playerName),
                points = type(lootItem.points) == "number" and lootItem.points or 0,
                isWish = type(lootItem.isWish) == "boolean" and lootItem.isWish or false,
                timestamp = {}
            }
            
            -- 正确深拷贝timestamp字段
            if lootItem.timestamp and type(lootItem.timestamp) == "table" then
                savedItem.timestamp.hour = type(lootItem.timestamp.hour) == "number" and lootItem.timestamp.hour or 0
                savedItem.timestamp.minute = type(lootItem.timestamp.minute) == "number" and lootItem.timestamp.minute or 0
            else
                savedItem.timestamp.hour = 0
                savedItem.timestamp.minute = 0
            end
            
            -- 添加到SavedLootList并计数
            table.insert(SavedLootList, savedItem)
            savedCount = savedCount + 1
        end
    end
    
    -- 简单显示保存成功消息
    DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 已保存")
end

-- 从保存的变量恢复拾取列表
function XyTracker_RestoreLootList()
    -- 检查是否有保存的数据
    local hasData = false
    local validItems = {}
    
    -- 确保SavedLootList存在
    if SavedLootList and type(SavedLootList) == "table" then
        -- 使用pairs遍历SavedLootList，处理稀疏数组问题
        for k, v in pairs(SavedLootList) do
            -- 只处理数值键和有效的物品数据
            if type(k) == "number" and v and type(v) == "table" and 
               v.itemName and type(v.itemName) == "string" and v.itemName ~= "" and 
               v.playerName and type(v.playerName) == "string" and v.playerName ~= "" then
                table.insert(validItems, v)
                hasData = true
            end
        end
    else
        -- 简单显示恢复失败原因
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 恢复失败因为: SavedLootList不存在或不是有效的表")
        return
    end
    
    if hasData then
        -- 清空当前LootList
        LootList = {}
        
        -- 深拷贝保存的数据
        for i, savedItem in ipairs(validItems) do
            local lootItem = {
                itemName = tostring(savedItem.itemName),
                itemLink = savedItem.itemLink and tostring(savedItem.itemLink) or "",
                playerName = tostring(savedItem.playerName),
                points = type(savedItem.points) == "number" and savedItem.points or 0,
                isWish = type(savedItem.isWish) == "boolean" and savedItem.isWish or false,
                timestamp = {}
            }
            
            -- 正确深拷贝timestamp字段
            if savedItem.timestamp and type(savedItem.timestamp) == "table" then
                lootItem.timestamp.hour = type(savedItem.timestamp.hour) == "number" and savedItem.timestamp.hour or 0
                lootItem.timestamp.minute = type(savedItem.timestamp.minute) == "number" and savedItem.timestamp.minute or 0
            else
                lootItem.timestamp.hour = 0
                lootItem.timestamp.minute = 0
            end
            
            table.insert(LootList, lootItem)
        end
        
        -- 更新UI显示
        XyTracker_UpdateLootList()
        
        -- 简单显示恢复成功消息
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 已恢复")
    else
        -- 简单显示恢复失败原因
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 恢复失败因为: 没有找到已保存的拾取列表数据")
    end
end

-- 保存许愿信息到独立变量
function XyTracker_SaveWishList()
    -- 确保XyArray存在
    if not XyArray then
        return
    end
    
    -- 创建或重置SavedWishList
    if not _G["SavedWishList"] then
        _G["SavedWishList"] = {}
    elseif type(_G["SavedWishList"]) ~= "table" then
        _G["SavedWishList"] = {}
    end
    
    -- 本地引用，用于更快的访问
    local SavedWishList = _G["SavedWishList"]
    
    -- 清空SavedWishList中的所有元素
    for k in pairs(SavedWishList) do
        SavedWishList[k] = nil
    end
    
    -- 添加版本控制信息
    SavedWishList.version = "1.3"
    SavedWishList.saveTime = time()
    
    -- 获取成员数量
    local memberCount = getn(XyArray)
    
    -- 深拷贝当前XyArray中的许愿数据
    for i = 1, memberCount do
        local memberInfo = XyArray[i]
        -- 只保存有效的成员数据
        if memberInfo and type(memberInfo) == "table" then
            -- 确保name字段存在且为非空字符串
            local name = memberInfo.name and type(memberInfo.name) == "string" and memberInfo.name ~= "" and memberInfo.name or "未知玩家"
            
            -- 创建保存的成员数据
            local savedInfo = {
                name = tostring(name),
                xy = memberInfo.xy and tostring(memberInfo.xy) or "",
                class = memberInfo.class and tostring(memberInfo.class) or "",
                dkp = memberInfo.dkp and tostring(memberInfo.dkp) or "0"
            }
            
            -- 添加到SavedWishList
            table.insert(SavedWishList, savedInfo)
        end
    end
    
    -- 创建备份表
    if not _G["XyTrackerData"] then
        _G["XyTrackerData"] = {}
    end
    
    _G["XyTrackerData"]["WishListBackup"] = {}
    local backup = _G["XyTrackerData"]["WishListBackup"]
    
    -- 备份数据
    for i, savedInfo in ipairs(SavedWishList) do
        if type(i) == "number" and savedInfo then
            backup[i] = {
                name = savedInfo.name,
                xy = savedInfo.xy,
                class = savedInfo.class,
                dkp = savedInfo.dkp
            }
        end
    end
    
    -- 简单显示保存成功消息
    DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 已保存")
end

-- 从保存的变量恢复许愿信息
function XyTracker_RestoreWishList()
    -- 检查是否有保存的数据
    local hasData = false
    local validMembers = {}
    
    -- 尝试从多个来源恢复数据
    local wishList = nil
    
    -- 1. 首先尝试主数据
    if _G["SavedWishList"] and type(_G["SavedWishList"]) == "table" then
        local mainCount = 0
        for k, v in pairs(_G["SavedWishList"]) do
            if type(k) == "number" then
                mainCount = mainCount + 1
            end
        end
        
        if mainCount > 0 or (_G["SavedWishList"].version and _G["SavedWishList"].saveTime) then
            wishList = _G["SavedWishList"]
        end
    end
    
    -- 2. 如果主数据无效，尝试从备份中获取
    if not wishList then
        if _G["XyTrackerData"] and _G["XyTrackerData"]["WishListBackup"] and type(_G["XyTrackerData"]["WishListBackup"]) == "table" then
            local backupCount = 0
            for k, v in pairs(_G["XyTrackerData"]["WishListBackup"]) do
                if type(k) == "number" then
                    backupCount = backupCount + 1
                end
            end
            
            if backupCount > 0 then
                wishList = _G["XyTrackerData"]["WishListBackup"]
            end
        end
    end
    
    -- 检查数据有效性
    if not wishList or type(wishList) ~= "table" then
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 恢复失败因为: 无法获取有效数据")
        return
    end
    
    -- 遍历数据，处理稀疏数组问题
    for k, v in pairs(wishList) do
        -- 跳过元数据（如version和saveTime）
        if k ~= "version" and k ~= "saveTime" and k ~= "timestamp" and k ~= "metadata" and type(k) == "number" and v and type(v) == "table" then
            -- 放宽验证条件，确保能恢复尽可能多的数据
            local name = v.name and type(v.name) == "string" and v.name ~= "" and v.name or ("未知玩家_" .. tostring(k))
            
            table.insert(validMembers, {
                name = name,
                xy = v.xy and tostring(v.xy) or "",
                class = v.class and tostring(v.class) or "",
                dkp = v.dkp and tonumber(v.dkp) or 0
            })
            hasData = true
        end
    end
    
    if hasData then
        -- 创建名称到索引的映射，以便快速查找
        local nameToIndex = {}
        
        -- 确保XyArray存在
        if not XyArray then
            XyArray = {}
        end
        
        -- 建立现有成员的映射
        local existingCount = getn(XyArray)
        for i = 1, existingCount do
            local memberInfo = XyArray[i]
            if memberInfo and memberInfo.name then
                nameToIndex[memberInfo.name] = i
            end
        end
        
        -- 恢复许愿信息
        for i, savedInfo in ipairs(validMembers) do
            if savedInfo and savedInfo.name then
                local name = savedInfo.name
                
                if nameToIndex[name] then
                    -- 如果玩家已经在XyArray中，更新他们的许愿信息
                    local index = nameToIndex[name]
                    XyArray[index].xy = tostring(savedInfo.xy or "")
                    if savedInfo.class and savedInfo.class ~= "" then
                        XyArray[index].class = tostring(savedInfo.class)
                    end
                    if savedInfo.dkp and type(savedInfo.dkp) == "number" then
                        XyArray[index].dkp = savedInfo.dkp
                    end
                else
                    -- 如果玩家不在XyArray中，添加新记录
                    local newInfo = {
                        name = tostring(name),
                        xy = tostring(savedInfo.xy or ""),
                        class = tostring(savedInfo.class or ""),
                        dkp = savedInfo.dkp and type(savedInfo.dkp) == "number" and savedInfo.dkp or 0
                    }
                    table.insert(XyArray, newInfo)
                end
            end
        end
        
        -- 更新UI显示
        if getglobal("XyTrackerFrame") then
            XyTrackerFrame:Show()
        end
        XyTracker_UpdateList()
        
        -- 简单显示恢复成功消息
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 已恢复")
    else
        -- 简单显示恢复失败原因
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 恢复失败因为: 没有找到已保存的许愿信息数据")
    end
end
        

function XyTracker_OnAnnounceButtonClick()
    if NoXyList == "" then
        SendChatMessage("所有人都已经许愿", "RAID", this.language, nil);
    else
        SendChatMessage("以下人员未许愿，请尽快许愿：" .. NoXyList, "RAID", this.language, nil);
    end
end

-- 播报许愿信息的计时器
XyBroadcastTimer = nil
XyCurrentBroadcastIndex = 0
XyBroadcastList = {}

function XyTracker_OnBroadcastWishesButtonClick()
    -- 停止任何正在进行的播报
    if XyBroadcastTimer then
        XyBroadcastTimer:Cancel();
        XyBroadcastTimer = nil;
    end
    
    -- 保存当前语言设置，以便在计时器回调中使用
    local currentLanguage = this.language
    
    -- 准备要播报的列表（使用当前排序后的displayArray）
    local totalMembers = GetNumRaidMembers()
    local currentRaidMembers = {}
    
    if totalMembers then
        for i = 1, totalMembers do
            local name = GetRaidRosterInfo(i)
            currentRaidMembers[name] = true
        end
        
        -- 清空之前的列表
        XyBroadcastList = {}
        
        -- 创建一个只包含当前团队成员的临时数组（按当前排序顺序）
        if getn(XyArray) > 0 and totalMembers then
            for i = 1, getn(XyArray) do
                local info = XyArray[i]
                if currentRaidMembers[info["name"]] then
                    table.insert(XyBroadcastList, info)
                end
            end
        end
        
        -- 开始播报
        XyCurrentBroadcastIndex = 1
        -- 获取当前排序依据的中文描述
        local sortMethodText = "角色名"
        if Xy_SortOptions.method == "class" then
            sortMethodText = "职业"
        elseif Xy_SortOptions.method == "xy" then
            sortMethodText = "许愿"
        elseif Xy_SortOptions.method == "dkp" then
            sortMethodText = "分数"
        end
        -- 添加排序方向描述
        if Xy_SortOptions.itemway == "desc" then
            sortMethodText = sortMethodText .. "降序"
        else
            sortMethodText = sortMethodText .. "升序"
        end
        SendChatMessage("以|cffff0000" .. sortMethodText .. "|r顺序开始播报许愿：", "RAID", currentLanguage, nil);
        
        -- 创建计时器，每0.5秒发送一条消息
        XyBroadcastTimer = CreateFrame("Frame");
        XyBroadcastTimer.elapsed = 0;
        XyBroadcastTimer:SetScript("OnUpdate", function()
            this.elapsed = this.elapsed + arg1;
            if this.elapsed >= 0.5 then
                this.elapsed = 0;
                if XyCurrentBroadcastIndex <= getn(XyBroadcastList) then
                    local info = XyBroadcastList[XyCurrentBroadcastIndex]
                    if info and info["xy"] and info["xy"] ~= "---未许愿---" then
                        -- 按照角色名、职业、许愿、分数的格式播报，使用★播报许愿★格式避免重复警报
                        local msg = string.format("★播报许愿★%s(%s): %s [%s分]", info["name"], info["class"], info["xy"], info["dkp"]);
                        SendChatMessage(msg, "RAID", currentLanguage, nil);
                    end
                    XyCurrentBroadcastIndex = XyCurrentBroadcastIndex + 1;
                else
                    -- 播报完成
                    SendChatMessage("许愿信息播报完毕！", "RAID", currentLanguage, nil);
                    this:Cancel();
                end
            end
        end);
        
        XyBroadcastTimer.Cancel = function(self)
            self:SetScript("OnUpdate", nil);
            XyBroadcastTimer = nil;
        end;
    else
        SendChatMessage("你不在团队中，无法播报许愿信息！", "RAID", currentLanguage, nil);
    end
end

function XyTracker_OnExportButtonClick()
    -- 创建一个只包含当前团队成员的临时数组（与displayArray相同的逻辑）
    local totalMembers = GetNumRaidMembers()
    local currentRaidMembers = {}
    local displayArray = {}
    
    if totalMembers then
        for i = 1, totalMembers do
            local name = GetRaidRosterInfo(i)
            currentRaidMembers[name] = true
        end
        
        -- 从XyArray中筛选出当前团队成员
        if getn(XyArray) > 0 then
            for i = 1, getn(XyArray) do
                local info = XyArray[i]
                if currentRaidMembers[info["name"]] then
                    table.insert(displayArray, info)
                end
            end
        end
    end
    
    -- 如果没有团队成员，使用完整的XyArray
    if getn(displayArray) == 0 then
        displayArray = XyArray
    end
    
    -- 生成导出文本
    local csvText = ""
    local n = getn(displayArray)
    for i = 1, n do
        local xy = displayArray[i]["xy"]
        if not xy then
            xy = ""
        end
        csvText = csvText .. displayArray[i]["class"] .. "-" .. displayArray[i]["name"] .. "-" .. xy .. "-当前剩余:[" .. displayArray[i]["dkp"] .. "]分" .. "\n"
    end
    
    -- 设置导出文本并显示窗口
    getglobal("XyExportEdit"):SetText(csvText);
    getglobal("XyExportFrame"):Show();
end

function Xy_FixZero(num)
    if (num < 10) then
        return "0" .. num;
    else
        return num;
    end
end

function Xy_Date()
    local t = date("*t");

    return strsub(t.year, 3) .. "-" .. Xy_FixZero(t.month) .. "-" .. Xy_FixZero(t.day) .. " " .. Xy_FixZero(t.hour) .. ":" .. Xy_FixZero(t.min) .. ":" .. Xy_FixZero(t.sec);
end

-- 为指定玩家增加DKP点数
function XyAddDkp(player, score)
    -- 从UI元素获取玩家名称和分数（自定义分数增加功能）
    if not player then
        player = getglobal("XyAddMember"):GetText()
    end
    if not score then
        score = tonumber(getglobal("XyAddDkpFramePoint"):GetText())
    end
    
    if not player or not score then return end
    
    local info = getXyInfo(player)
    if info then
        info["dkp"] = tonumber(info["dkp"]) + score
        XyTracker_UpdateList()
        XyQuery(player, score)
        syncXy()
        
        -- 【重要】设置数据变更标记，确保在游戏退出时自动保存
        _G["XyTracker_SavedWishList_LastUpdate"] = time()
        -- 记录当前XyArray的实际大小，用于验证
        _G["XyTracker_ArraySize_LastRecord"] = getn(XyArray)
    end
end

-- 为指定玩家扣除DKP点数
function XyMinusDkp(player, score)
    -- 从UI元素获取玩家名称和分数（自定义分数扣除功能）
    if not player then
        player = getglobal("XyMinusMember"):GetText()
    end
    if not score then
        score = tonumber(getglobal("XyMinusDkpFramePoint"):GetText())
    end
    
    if not player or not score then return end
    
    local info = getXyInfo(player)
    if info then
        info["dkp"] = tonumber(info["dkp"]) - score
        XyTracker_UpdateList()
        XyQuery(player, -score)
        syncXy()
        
        -- 【重要】设置数据变更标记，确保在游戏退出时自动保存
        _G["XyTracker_SavedWishList_LastUpdate"] = time()
        -- 记录当前XyArray的实际大小，用于验证
        _G["XyTracker_ArraySize_LastRecord"] = getn(XyArray)
    end
end


-- 设置DKP排序选项
function XySortOptions(method)

    if (Xy_SortOptions.method and Xy_SortOptions.method == method) then
        if (Xy_SortOptions.itemway and Xy_SortOptions.itemway == "asc") then
            Xy_SortOptions.itemway = "desc";
        else
            Xy_SortOptions.itemway = "asc";
        end
    else
        Xy_SortOptions.method = method;
        Xy_SortOptions.itemway = "asc";
    end
    Xy_SortDkp();
    XyTracker_UpdateList();
end

function Xy_SortDkp()
    table.sort(XyArray, Xy_CompareDkps);
end

function Xy_CompareDkps(a1, a2)
    local method, way = Xy_SortOptions["method"], Xy_SortOptions["itemway"];
    local c1, c2 = a1[method], a2[method];
    
    -- 确保类型一致性，特别是对于dkp字段（可能从保存变量加载时变成了字符串）
    if method == "dkp" then
        -- 将可能是字符串的dkp值转换为数字
        c1 = tonumber(c1) or 0
        c2 = tonumber(c2) or 0
    end
    
    if (way == "asc") then
        return c1 < c2;
    else
        return c1 > c2;
    end
end

function ExtractItemName(xy)
    if not xy or type(xy) ~= "string" then
        return "", {}
    end
    
    -- 特殊处理：如果是未许愿状态，直接返回空字符串和空列表
    if xy == "---未许愿---" then
        return "", {}
    end
    
    -- 尝试提取所有物品名称
    local allItemNames = {}
    
    -- 检查是否包含物品链接
    if string.find(xy, "|Hitem:") then
        -- 提取物品链接中的物品名称
        for itemLink in string.gmatch(xy, "|Hitem:.-|h.-|h") do
            local itemName = string.match(itemLink, "|h%[(.-)%]|h")
            if itemName and itemName ~= "" then
                table.insert(allItemNames, itemName)
            end
        end
    else
        -- 处理非物品链接格式的许愿
        -- 1. 特别处理 [物品1][物品2] 这种常见格式
        local bracketPattern = "%[(.-)%]"
        local hasBracketItems = string.find(xy, bracketPattern)
        
        if hasBracketItems then
            for item in string.gmatch(xy, bracketPattern) do
                if item and item ~= "" then
                    table.insert(allItemNames, item)
                end
            end
        else
            -- 2. 处理其他分隔符的情况（逗号、顿号、空格等）
            local delimiters = {"，", ",", "、", " "} -- 支持常见的分隔符
            
            for _, delimiter in ipairs(delimiters) do
                if string.find(xy, delimiter) then
                    -- 分割字符串
                    local startIdx = 1
                    
                    while startIdx <= string.len(xy) do
                        local endIdx = string.find(xy, delimiter, startIdx)
                        if endIdx then
                            local item = string.sub(xy, startIdx, endIdx - 1)
                            item = string.trim(item)
                            if item and item ~= "" then
                                table.insert(allItemNames, item)
                            end
                            startIdx = endIdx + 1
                        else
                            local item = string.sub(xy, startIdx)
                            item = string.trim(item)
                            if item and item ~= "" then
                                table.insert(allItemNames, item)
                            end
                            break
                        end
                    end
                    
                    break -- 找到一个分隔符后就不再检查其他分隔符
                end
            end
        end
    end
    
    -- 如果找到了物品名称，返回第一个作为主物品名称，并返回所有物品名称列表
    if getn(allItemNames) > 0 then
        return allItemNames[1], allItemNames
    else
        -- 修复：如果没有找到任何物品名称，返回空字符串和空列表
        -- 避免返回原始xy字符串导致的误判
        return "", {}
    end
end


function string.trim(s)
    if type(s) ~= "string" then
        return s
    end
    return string.gsub(string.gsub(s, "^%s+", ""), "%s+$", "")
end

function MarkItemAsCompleted(originalWish, completedItemName)
    -- 测试调试函数是否正常工作

    
    if not originalWish or not completedItemName or type(originalWish) ~= "string" or type(completedItemName) ~= "string" then
        -- XyTracker_Print("无效的参数: originalWish="..tostring(originalWish)..", completedItemName="..tostring(completedItemName))
        return originalWish
    end
    
    -- 清理物品名称，用于比较
    local cleanedCompletedName = safeCleanString(completedItemName)
    -- XyTracker_Print("开始处理物品完成标记: 原始愿望="..originalWish..", 完成物品="..completedItemName..", 清理后="..cleanedCompletedName)
    
    local newWish = originalWish
    local foundMatch = false
    local remainingItems = {}
    
    -- 1. 先检查是否包含物品链接格式
    if string.find(originalWish, "|Hitem:") then
        -- XyTracker_Print("检测到物品链接格式")
        -- 物品链接提取正则表达式 - 优化支持所有颜色的物品
        local itemLinkPattern = "|c%x%x%x%x%x%x%x%x|Hitem:.-|h%[.-%]|h|r"
        local itemNamePattern = "|h%[(.-)%]|h"
        
        -- 收集所有物品链接，排除已完成的
        local startPos = 1
        local tempWish = originalWish
        local linkCount = 0
        
        while true do
            -- 查找下一个完整的物品链接（支持所有颜色）
            local linkStart, linkEnd = string.find(tempWish, itemLinkPattern, startPos)
            if not linkStart then
                -- 尝试更宽松的匹配模式
                -- XyTracker_Print("标准匹配模式失败，尝试宽松匹配")
                linkStart, linkEnd = string.find(tempWish, "|Hitem:.-|h%[.-%]|h", startPos)
                if not linkStart then
                    -- XyTracker_Print("宽松匹配模式也失败，没有更多链接了")
                    break -- 没有更多链接了
                end
            end
            
            local fullItemLink = string.sub(tempWish, linkStart, linkEnd)
            linkCount = linkCount + 1
            -- XyTracker_Print("找到物品链接 #"..linkCount..": "..fullItemLink)
            
            -- 提取物品名称
            local itemName = string.match(fullItemLink, itemNamePattern)
            if itemName then
                local cleanedItemName = safeCleanString(itemName)
                -- XyTracker_Print("提取物品名称: "..itemName..", 清理后: "..cleanedItemName)
                
                -- 使用模糊比较，增加匹配的可能性
                if cleanedItemName == cleanedCompletedName or 
                   string.find(cleanedItemName, cleanedCompletedName) or 
                   string.find(cleanedCompletedName, cleanedItemName) then
                    -- XyTracker_Print("找到匹配项: "..cleanedItemName.." == "..cleanedCompletedName)
                    foundMatch = true
                else
                    -- XyTracker_Print("未找到匹配项: "..cleanedItemName.." != "..cleanedCompletedName)
                    table.insert(remainingItems, fullItemLink)
                end
            else
                -- 如果无法提取物品名称，保留原始链接
                -- XyTracker_Print("无法提取物品名称，保留原始链接")
                table.insert(remainingItems, fullItemLink)
            end
            
            startPos = linkEnd + 1
        end
        
        -- XyTracker_Print("共找到 "..linkCount.." 个物品链接，剩余 "..table.getn(remainingItems).." 个未完成物品")
        
        -- 构建新的许愿字符串
        if foundMatch then
            -- XyTracker_Print("找到匹配的物品，构建新的许愿字符串")
            if table.getn(remainingItems) > 0 then
                newWish = "|cFF00FFFF【已完成许愿】|r" .. table.concat(remainingItems)
                -- XyTracker_Print("新的许愿字符串(有剩余物品): "..newWish)
            else
                newWish = "|cFF00FFFF【已完成许愿】|r"
                -- XyTracker_Print("新的许愿字符串(无剩余物品): "..newWish)
            end
        else
            -- XyTracker_Print("未找到匹配的物品")
        end
    else
        -- XyTracker_Print("未检测到物品链接格式")
        -- 2. 尝试处理 [物品1][物品2] 这种常见格式
        if not foundMatch then
            local itemPattern = "%[(.-)%]"
            local hasBracketItems = string.find(originalWish, itemPattern)
            
            if hasBracketItems then
                -- 收集所有中括号包裹的物品，排除已完成的
                for item in string.gmatch(originalWish, itemPattern) do
                    if item and item ~= "" then
                        local cleanedItemName = safeCleanString(item)
                        if cleanedItemName == cleanedCompletedName or 
                           string.find(cleanedItemName, cleanedCompletedName) or 
                           string.find(cleanedCompletedName, cleanedItemName) then
                            foundMatch = true
                        else
                            table.insert(remainingItems, "["..item.."]")
                        end
                    end
                end
                
                -- 构建新的许愿字符串
                if foundMatch then
                    if table.getn(remainingItems) > 0 then
                        newWish = "|cFF00FFFF【已完成许愿】|r" .. table.concat(remainingItems)
                    else
                        newWish = "|cFF00FFFF【已完成许愿】|r"
                    end
                end
            end
        end
        
        -- 3. 如果上面两种格式都没找到匹配，尝试处理其他分隔符的情况
        if not foundMatch then
            -- 分割许愿文本（支持多种分隔符）
            local delimiters = {"，", ",", "、", " "} -- 支持常见的分隔符
            local matchedDelimiter = nil
            
            -- 查找使用的分隔符
            for _, delimiter in ipairs(delimiters) do
                if string.find(originalWish, delimiter) then
                    matchedDelimiter = delimiter
                    break
                end
            end
            
            if matchedDelimiter then
                -- 分割字符串并收集未完成的物品
                local items = {}
                local startIdx = 1
                local tempStr = originalWish
                
                while startIdx <= string.len(tempStr) do
                    local endIdx = string.find(tempStr, matchedDelimiter, startIdx)
                    if endIdx then
                        local item = string.sub(tempStr, startIdx, endIdx - 1)
                        item = string.trim(item)
                        if item and item ~= "" then
                            table.insert(items, item)
                        end
                        startIdx = endIdx + 1
                    else
                        local item = string.sub(tempStr, startIdx)
                        item = string.trim(item)
                        if item and item ~= "" then
                            table.insert(items, item)
                        end
                        break
                    end
                end
                
                -- 过滤出未完成的物品
                for _, item in ipairs(items) do
                    local cleanedItemName = safeCleanString(item)
                    if cleanedItemName == cleanedCompletedName or 
                       string.find(cleanedItemName, cleanedCompletedName) or 
                       string.find(cleanedCompletedName, cleanedItemName) then
                        foundMatch = true
                    else
                        table.insert(remainingItems, item)
                    end
                end
                
                -- 构建新的许愿字符串
                if foundMatch then
                    if table.getn(remainingItems) > 0 then
                        newWish = "|cFF00FFFF【已完成许愿】|r" .. table.concat(remainingItems, matchedDelimiter)
                    else
                        newWish = "|cFF00FFFF【已完成许愿】|r"
                    end
                end
            end
        end
    end
    
    -- 返回修改后的许愿（如果有匹配的话），否则返回原始许愿
    -- XyTracker_Print("处理完成，返回结果: "..newWish)
    return foundMatch and newWish or originalWish
end

function string.trim(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- 安全的字符串清理函数（这是重复定义，已被重命名以避免冲突）
-- 主函数在文件前面已定义
function safeCleanString_duplicate(str)
    if not str or type(str) ~= "string" then
        return ""
    end
    
    -- 移除颜色代码
    local cleanStr = string.gsub(str, "|c%x%x%x%x%x%x%x%x", "")
    cleanStr = string.gsub(cleanStr, "|r", "")
    
    -- 移除空格和特殊字符
    cleanStr = string.gsub(cleanStr, "%s+", "")
    cleanStr = string.lower(cleanStr)
    
    return cleanStr
end

-- 合并 江湖任我行@乌龟服-拉&风 的修改
--加Atlas tooltip 提示许愿人数...
if AtlasLootTooltip then
    Xytooltip = CreateFrame("Frame", "Xytooltip", AtlasLootTooltip)
    Xytooltip:SetScript("OnShow", function(self)
        local Itemname = getglobal("AtlasLootTooltipTextLeft1"):GetText()
        local namelist
        if Itemname then 
        namelist = XYLIST1(Itemname)
        end
    
        if namelist then
            AtlasLootTooltip:AddLine(namelist)
        end
        AtlasLootTooltip:Show()
    end)

    Xytooltip:SetScript("OnHide", function()
        AtlasLootTooltip:Hide()
    end)
end
--加物品 Gametooltip 提示许愿人数和玩家许愿信息...
-- 修复GameTooltip绑定，保留对物品许愿信息的显示，并添加玩家许愿信息显示
if GameTooltip then
    Xytooltip2 = CreateFrame("Frame", "Xytooltip2", GameTooltip)
    Xytooltip2:SetScript("OnShow", function(self)
        -- 检查是否已经处理过，避免重复添加
        if GameTooltip.XYProcessed then
            return
        end
        
        local text = getglobal("GameTooltipTextLeft1"):GetText() or ""
        
        -- 添加辅助函数：清理字符串中的颜色代码
        local function stripColorCodes(str)
            if not str then return "" end
            -- 移除颜色代码 |cffRRGGBB
            str = string.gsub(str, "|c%x%x%x%x%x%x%x%x", "")
            -- 移除颜色结束标记 |r
            str = string.gsub(str, "|r", "")
            -- 移除其他可能的控制字符
            str = string.gsub(str, "|H.-|h", "")
            str = string.gsub(str, "|h", "")
            return str
        end
        
        -- 添加辅助函数：提取纯玩家名称，过滤掉军衔信息
        local function extractPlayerName(str)
            if not str then return "" end
            
            -- 首先移除颜色代码
            local cleanStr = stripColorCodes(str)
            
            -- 过滤掉军衔信息，格式如[中士]、[军士长]等
            -- 匹配[...]格式的内容并移除
            cleanStr = string.gsub(cleanStr, "%[.-%]", "")
            
            -- 移除前后空白字符
            cleanStr = string.gsub(cleanStr, "^%s*(.-)%s*$", "%1")
            
            return cleanStr
        end
        
        -- 首先尝试作为物品名查询许愿信息
        local namelist = XYLIST1(text)
        
        -- 如果没有找到物品的许愿信息，尝试作为玩家名查询
        if not namelist then
            -- 尝试从提示框中提取玩家名字
            local playerName = text
            
            -- 检查是否是玩家（通常会有职业、等级等信息）
            local isPlayer = false
            for i = 2, GameTooltip:NumLines() do
                local lineText = getglobal("GameTooltipTextLeft"..i):GetText() or ""
                -- 检查是否包含职业、等级等玩家特征信息
                if string.find(lineText, "战士") or string.find(lineText, "法师") or 
                   string.find(lineText, "牧师") or string.find(lineText, "猎人") or 
                   string.find(lineText, "盗贼") or string.find(lineText, "圣骑士") or 
                   string.find(lineText, "德鲁伊") or string.find(lineText, "萨满祭司") or 
                   string.find(lineText, "术士") then
                    isPlayer = true
                    break
                end
            end         
            -- 如果是玩家，查询并显示许愿信息
            if isPlayer then     
                -- 提取纯玩家名称，去除颜色代码和军衔信息
                local cleanPlayerName = extractPlayerName(playerName)
                namelist = XYLISTbyPlayer(cleanPlayerName)
            end
        end
        
        if namelist then
            GameTooltip:AddLine(namelist)
            GameTooltip:Show()
        end
        
        -- 设置处理标记，避免重复处理
        GameTooltip.XYProcessed = true
    end)

    Xytooltip2:SetScript("OnHide", function()
        -- 清除临时标记，允许下次查看时重新显示信息
        GameTooltip.XYProcessed = nil
    end)
end
--加点击物品 tooltip 提示许愿人数...
if ItemRefTooltip then
    Xytooltip3 = CreateFrame("Frame", "Xytooltip3", ItemRefTooltip)
    Xytooltip3:SetScript("OnShow", function(self)
        local Itemname = getglobal("ItemRefTooltipTextLeft1"):GetText()
        local namelist
        if Itemname then 
        namelist = XYLIST1(Itemname)
        end
        --print(Itemname)
        --print(namelist)
        if namelist then
            ItemRefTooltip:AddLine(namelist)
        end
        ItemRefTooltip:Show()
    end)

    Xytooltip3:SetScript("OnHide", function()
        ItemRefTooltip:Hide()
    end)
end

function ClasstoColor(class)
    if class =='战士' then return "|cffC79C6E"
    elseif  class =='萨满祭司' then return "|cff2773FF"
    elseif class =='德鲁伊' then return "|cffFF7D0A"
    elseif class =='盗贼' then return "|cffFFF569"
    elseif class =='法师' then return "|cff69CCFF"
    elseif class =='圣骑士' then return "|cffF58CBA"
    elseif class =='牧师' then return "|cffFFFFFF"
    elseif class =='术士' then return "|cff9482C9"
    elseif class =='猎人' then return "|cffABD473"
    end
  end
  
  
  function XYLIST(Iname)    
      --by qtz 非许愿模式下,贴装备,团队聊天窗口贴出许愿名单 ,返回许愿该装备的许愿名单.没有就返回nil   
      if XyArray ~=nil then
        local n = getn(XyArray)
        local i,name,xy,class,color
        local num = 0
        local itemname =""
        local XYID,NOW,xy_name
        --local itemtable = {}
              
        for i = 1, n do
          name = XyArray[i]["name"]
          xy = XyArray[i]["xy"] 
          if not xy then
            xy = ""
          end           
  
          --XYID,xy_name = string.match(xy, "item:(%d*):.-|h%[(.-)%]|h|r")
          xy_name = string.match(xy, "|h%[(.-)%]|h|r")          
          if xy_name then
            --if xy == arg1 or string.match(arg1, XYID) then 
            if xy_name == Iname then
              class = XyArray[i]["class"]
              color = ClasstoColor(XyArray[i]["class"]) 
              
              --itemname = itemname.. " ".. name..'-'..XyArray[i]["class"].."("..XyArray[i]["dkp"] .."分)"
              itemname = itemname.. " ".. color.. name.."|r("..XyArray[i]["dkp"] .."分)"
              NOW = xy_name
              num = num+1
            end
          end
        end
          --print(itemname)
        --if itemname ~="" and GetItemInfo(NOWID) and IsRaidOfficer() then
        if itemname ~="" and NOW then 
          --return "["..GetItemInfo(NOWID).."] ".."有:"..itemname.. ",共>"..num.."<人许愿."
          return "["..NOW.."]".. "|cffFFFF00("..num..")|r人许愿:"..itemname
          --SendChatMessage("["..GetItemInfo(NOWID).."] ".."有:"..itemname.. ",共>"..num.."<人许愿.", "SAY", this.language, nil);
          --SendChatMessage(xy_name.." 有:"..itemname.. ",共"..num.."人许愿.", "RAID", this.language, nil);
        else
          return nil
        end       
      end 
            -- qtz
  end
  
function XYLIST1(Iname)    
    --by qtz tooltip提示许愿人数 ,返回许愿该装备的许愿名单.没有就返回nil   
    if XyArray ~=nil and Iname and Iname ~= "" then
      local n = getn(XyArray)
      local i,name,xy,class,color
      local num = 0
      local p = 0
      local itemname = ""
      local XYID,NOW,xy_name
      
      -- 防止重复显示的临时标记
      if GameTooltip.XYProcessed and GameTooltip.XYProcessed == Iname then
        return nil
      end
      GameTooltip.XYProcessed = Iname
            
      for i = 1, n do
        name = XyArray[i]["name"]
        xy = XyArray[i]["xy"] 
        if not xy then
          xy = ""
        end            
        
        -- 修复：使用更可靠的方式检测物品是否被许愿
        local isWished = false
        
        -- 方式1：检查物品链接中的物品名称
        if xy and xy ~= "" and xy ~= "---未许愿---" then
          -- 从许愿内容中提取所有物品名称
          local success, primaryWishItem, allWishItems = pcall(ExtractItemName, xy)
          if success then
            -- 使用安全清理函数进行比较
            local cleanIname = safeCleanString(Iname)
            
            -- 【修复】使用精确匹配
            -- 检查主物品名称
            if primaryWishItem and primaryWishItem ~= "" then
              local cleanPrimaryWishItem = safeCleanString(primaryWishItem)
              if cleanPrimaryWishItem == cleanIname then
                isWished = true
              end
            end
            
            -- 检查其他物品名称
            if not isWished and type(allWishItems) == "table" and getn(allWishItems) > 0 then
              for _, wishItem in ipairs(allWishItems) do
                local cleanWishItem = safeCleanString(wishItem)
                if cleanWishItem == cleanIname then
                  isWished = true
                  break
                end
              end
            end
          end
        end
        
        if isWished then
          num = num+1            
          class = XyArray[i]["class"]
          color = ClasstoColor(XyArray[i]["class"]) 
          -- 安全获取dkp值，如果为nil则使用默认值0
          local dkpValue = XyArray[i]["dkp"] or 0
          
          if p == 3 then
            itemname = itemname.. "\n "..color..name .. "|r("..dkpValue .."分)"
            p=0
          else  
            itemname = itemname.. " "..color..name .. "|r("..dkpValue .."分)"
          end
          p = p+1
          NOW = Iname -- 设置为当前查询的物品名称
        end
      end
      
      if itemname ~="" then
        -- 修复：正确格式化输出字符串
        return "XY有:"..itemname.. "|cff9FFFA0\n--共("..num..")人许愿--|r"
      else
        -- 即使没有找到许愿信息，也要清除临时标记，避免影响下次显示
        GameTooltip.XYProcessed = nil
        return nil   
      end        
    end
    
    -- 如果XyArray为nil或没有找到玩家的许愿信息，返回nil
    return nil
end

  --通过玩家名字查询许愿和许愿人数
  
  -- 简单函数：直接返回玩家的许愿内容
  function XY_GetPlayerWish(playername)
      if XyArray ~= nil then
        local n = getn(XyArray)
        local i, name, xy
        
        -- 确保playername不为空
        if not playername or playername == "" then
          return nil
        end
        
        -- 移除可能的空格
        playername = string.match(playername, "(%S+)") or playername
        
        -- 查找指定玩家的许愿信息
        for i = 1, n do
          name = XyArray[i]["name"]
          if name == playername then
            xy = XyArray[i]["xy"]
            
            -- 直接返回玩家的许愿内容
            if xy and xy ~= "" and xy ~= "---未许愿---" then
              return xy
            else
              return nil
            end
          end
        end
      end
      
      -- 如果XyArray为nil或没有找到玩家的许愿信息，返回nil
      return nil
  end
  

function XYLISTbyPlayer(playername)    
    local n = getn(XyArray)
    for i = 1, n do
        local name = XyArray[i]["name"]
        local xy = XyArray[i]["xy"]
        local dkp = XyArray[i]["dkp"] or 0  -- 获取玩家分数，如果没有则默认为0

        if playername == name then
            if not xy or xy == "" or xy == "---未许愿---" then
            else
                -- 如果已许愿，显示许愿信息和分数
                return "许愿: " .. xy .. " 分数: " .. dkp
            end
            break 
        end
    end
    -- 如果没有找到玩家信息，返回nil
    return nil
end 

-- 全局变量存储自定义的Starttext
local CustomStarttext = nil

-- 初始化时从XyTrackerOptions加载自定义欢迎文本
function XyTracker_LoadCustomStarttext()
    if XyTrackerOptions and XyTrackerOptions.CustomStarttext then
        CustomStarttext = XyTrackerOptions.CustomStarttext
        -- 调试信息
        -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 成功加载自定义欢迎文本")
    end
end

-- 保存自定义欢迎文本到XyTrackerOptions
function XyTracker_SaveCustomStarttext()
    if CustomStarttext and CustomStarttext ~= "" then
        if not XyTrackerOptions then
            XyTrackerOptions = {}
        end
        XyTrackerOptions.CustomStarttext = CustomStarttext
        -- 调试信息
        -- DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 自定义欢迎文本已保存")
    end
end

-- 显示编辑Starttext的输入框
function XyTracker_ShowStarttextEditBox()
    -- 检查是否有权限（团长模式或未开团）
    if not IsLeader and XyInProgress then
        DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 只有团长或未开团时才能编辑欢迎文本")
        return
    end
    
    -- 创建或获取编辑框
    local editBox = getglobal("XyTrackerStarttextEditBox")
    if not editBox then
        -- 创建编辑框窗口
        local frame = CreateFrame("Frame", "XyTrackerStarttextEditBoxFrame", UIParent)
        frame:SetWidth(400)
        frame:SetHeight(250)
        frame:SetPoint("CENTER", 0, 0)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function()
        frame:StartMoving()
    end)
    frame:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
    end)
    
    -- 设置背景和边框，与主界面保持一致
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
        tileSize = 32,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    frame:SetBackdropColor(0, 0, 0); -- 纯黑色，与主界面保持一致
    frame:SetBackdropBorderColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, 1); -- 红色边框，与主界面保持一致
    
        
        -- 窗口标题
        local title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        title:SetPoint("TOP", frame, "TOP", 0, -30)
        title:SetText("编辑欢迎文本")
        
        -- 编辑框
        editBox = CreateFrame("EditBox", "XyTrackerStarttextEditBox", frame)
        editBox:SetWidth(360)
        editBox:SetHeight(150)
        editBox:SetPoint("TOP", frame, "TOP", 0, -50)
        editBox:SetMultiLine(true)
        editBox:SetAutoFocus(true)
        editBox:SetFontObject("ChatFontNormal")
        editBox:SetScript("OnEscapePressed", function() frame:Hide() end)
        
        -- 保存按钮
        local saveButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
        saveButton:SetWidth(80)
        saveButton:SetHeight(22)
        saveButton:SetPoint("BOTTOM", frame, "BOTTOM", -50, 15)
        saveButton:SetText("保存")
        saveButton:SetScript("OnClick", function() 
            local newText = editBox:GetText()
            if newText and newText ~= "" then
                CustomStarttext = newText
                -- 调用保存函数
                XyTracker_SaveCustomStarttext()
                DEFAULT_CHAT_FRAME:AddMessage("[XyTracker] 欢迎文本已更新并保存")
            end
            frame:Hide()
        end)
        
        -- 取消按钮
        local cancelButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
        cancelButton:SetWidth(80)
        cancelButton:SetHeight(22)
        cancelButton:SetPoint("BOTTOM", frame, "BOTTOM", 50, 15)
        cancelButton:SetText("取消")
        cancelButton:SetScript("OnClick", function() frame:Hide() end)
    end
    
    -- 设置编辑框的默认内容
    local defaultText = "欢迎来到许愿团，在团队频道输入【XY+空格+许愿装备】进行许愿"
    editBox:SetText(CustomStarttext or defaultText)
    
    -- 显示编辑框窗口
    getglobal("XyTrackerStarttextEditBoxFrame"):Show()
end

-- 获取当前的Starttext（自定义或默认）
function XyTracker_GetCurrentStarttext()
    -- 优先从XyTrackerOptions获取，确保使用最新保存的值
    local startText = XyTrackerOptions and XyTrackerOptions.CustomStarttext or CustomStarttext
    return startText or "欢迎来到许愿团，在团队频道输入【XY+空格+许愿装备】进行许愿"
end