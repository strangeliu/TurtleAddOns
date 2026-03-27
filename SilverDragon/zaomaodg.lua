-- ZAOMAODG 功能整合到 SilverDragon
local ZAOMAODG = {}

ZAOMAODG.targetList = {
    -- 经典稀有怪 (基于60级版本)
    "卡扎克",
    "艾索雷葛斯",
    "艾莫莉丝",
    "雷索",
    "泰拉尔",
    "伊索德雷",
    "蛛怪监工",
    "黑暗掠夺者",
    "奥兹塔里亚斯",
    "空卡维斯",
    "哞",
    "十字军拉萨里斯",
    "火星",
    "巫医坦佐",
    "探索者尘须",
    "塔兰苟斯",
    "莱塔沙兹",
    "强大的玛贡",
    "石壳",
    "吒雷斯·恐怖利刃",
    "高原银背兽",
    "剑圣咖哥隆",
    "海军上将巴利安·西风",
    "蔚蓝喙",
    "树皮渔夫",
    "暗灭者歌利亚",
    "M-0L1Y",
    "纳兹加克王子",
    "纳瑞尔拉萨斯",
    
    -- 以下为补充的经典稀有怪
    "姆斯高格",
    "沮丧的斯卡尔",
    -- "霍格", ---测试用
    "拉扎尔",
    "铁背龟",
    "加林德·夏龙",
    "狂暴者雷瑟罗克",
    "附魔师米瑟雷希斯",
    "锋爪",
    "格瑞姆格斯",
    "海崖奔跳者",
    "漫步者维瑟哈特",
    "祖拉雷克",
    "哈尔伯·邪泉",
    "锐爪飞心",
    "不可战胜的铁眼",
    "邪刺恐蝎",
    "流放者阿切鲁斯",
    "吉比斯尼克",
    "雪爪灰熊怪",
    "嚎叫者米基尔",
    "拉克西里",
    "科巴塔恩将军",
    "埃苏罗斯",
    "劫掠者卡苏克",
    "尖石统帅",
    "乌洛克",
    "尖石屠夫",
    "班诺克·巨斧",
    "杰德",
    "军需官兹格雷斯",
    "燃烧恶魔卫士",
    "尖石首席法师",
    "水晶之牙",
    "霍克·巴什古德",
    "永醒的艾希尔",
    "死灵勇士",
    "铁脊死灵",
    "扎拉斯·枯木",
    "达贝尔·蒙特罗斯",
    "贝瑟隆·野语者", ---千针石林营地试用
    "地占师弗林塔格",
    "弗尔伯利",
    "考沃克",
    "碎骨者穆罗克",
    "歌唱者",
    "屠戮者尼玛尔",
    "布拉克",
    "莱布里萨斯",
    "斯拉克",
    "乌尔图斯",
    "掘地工头目",
    "死神4000型",
    "利爪队长",
    "拉姆布勒",
    "路障",
    "作战傀儡",
    "安纳塞姆斯",
    "暗炉指挥官",
    "7:XT",
    "扎里科特",
    "断牙",
    "卡尼沃斯",
    "残忍的弗拉格莫克",
    "莫嘉泽尔",
    "薇丝普拉",
    "影爪",
    "雌性森林陆行鸟",
    "利斯林",
    "辛斯雷尔",
    "召火者拉迪森",
    "玛高什",
    "大头目加尔高什",
    "摧毁者埃摩戈",
    "卡布",
    "格什哈尔迪",
    "纺织者杉达",
    "康达尔",
    "失落者奥姆高尔",
    "残忍的疱爪土狼",
    "余烬之翼",
    "疯狂的塞科洛克",
    "克雷格·尼哈鲁",
    "克莱吉拉克",
    "唤沙者辛萨拉",
    "穆亚德",
    "贝恩",
    "菲林森特的阴影",
    "痛苦的灵魂",
    "农夫索利丹",
    "迪布",
    "毒针雷萨恩",
    "瑟斯库克",
    "失落的灵魂",
    -- "下水道鳄鱼", ---这个老烦人，默认不近列表
    "达尔特",
    "贼眼",
    "咆哮者杜格斯",
    "雷普斯凯尔",
    "泥浆虫",
    "布雷姆戈",
    "安戈雷尔",
    "暗雾寡妇蛛",
    "哈尤克",
    "死亡毒蝎",
    "科提斯中士",
    "獠牙队长",
    "吉欧洛德·杂斑",
    "科卡尼斯",
    "斯考恩",
    "萨姆拉斯",
    "斯卡基尔",
    "塞菲莉斯",
    "洛巴尔克",
    "塔尔玛·雷矛",
    "克雷普塞斯",
    "泽基斯",
    "食尸者维萨克",
    "格雷瑟尔",
    "暮光之王艾沃兰",
    "哈瑞坎尼安",
    "苏尔拉",
    "瑟提斯",
    "拉普雷斯",
    "雷克斯·亚希尔",
    "格鲁布索尔",
    "克里拉克",
    "巨翼雄兽",
    "瑞雯",
    "工头里格尔",
    "哨兵阿玛拉珊",
    "狂怒的树人",
    "工头维普弗恩",
    "纳尔塔萨",
    "拉文诺克修士",
    "芬加特",
    "摩塔索恩",
    "维尔玛克中尉",
    "翡翠龙",
    "失落者酋长",
    "基摩里安",
    "失落者厨师",
    "鞭笞者特里高雷",
    "变异精灵龙",
    "博艾恩",
    "洛格罗什",
    "斯格霍尔",
    "格拉维斯·斯里诺特",
    "流血者吉米",
    "阿拉加",
    "暴躁的本希",
    "玛格拉克",
    "长者莫诺斯",
    "安提里奥斯",
    "鳞须海龟",
    "护门者拉格罗尔",
    "伊夫卡尔",
    "玛济斯·鹰盔",
    "瓦罗森的幽灵",
    "菲达雷德",
    "方弗罗将军",
    "瑟丝彼拉",
    "弗雷斯特恩",
    "悲惨的提米",
    "石脊",
    "斯库尔",
    "萨克拉希斯",
    "库尔莫克",
    "戈鲁格尔",
    "金鳞蜥蜴",
    "维里弗尼克斯",
    "瑞帕",
    "罗洛克",
    "莫什奥格屠夫",
    "督军塔雷金",
    "腐烂者海德姆什",
    "死亡猎人霍克斯比尔",
    "莉尼亚·阿比迪斯",
    "祖布林·扭枝",
    "僵硬的吉斯",
    "亡语者塞伦德",
    "黑暗镰刀",
    "杜甘·蛮锤",
    "鲁伯斯",
    "纳拉克西斯",
    "玛拉索姆公爵",
    "芬罗斯",
    "奈法鲁",
    "指挥官菲斯托姆",
    "收割者麦什洛克",
    "迷雾嚎叫者",
    "乌索洛克",
    "恐狼族长",
    "薇丝比娅",
    "药剂师法尔瑟斯",
    "橡爪",
    "玛戈芬",
    "洛吉什",
    "拉兹王子",
    "阿克瑞鲁斯",
    "埃卡洛姆",
    "钳枝沼泽兽",
    "挖掘专家舒尔弗拉格",
    "毁灭",
    "斯比弗雷尔",
    "死眼",
    "先知阿库巴尔",
    "格朗特",
    "扭曲者莫吉尔",
    "顽强的玛古诺斯",
    "德雷斯克恩",
    "掠夺者科拉克",
    "母蜘蛛",
    "费德菲尼尔",
    "狡猾的莫加尼",
    "索罗斯·莱特芬格",
    "格拉夫·疾齿",
    "监工纳尔格",
    "格鲁夫",
    "暴掠龙女王",
    "乌卡洛克",
    "萨瓦丝女王",
    "暴龙之王摩什",
    "执行者埃米尔冈德",
    "鬼嚎",
    "马兹拉纳其",
    "海特拉什",
    "断矛",
    "扫荡者",
    "暮色巡游者",
    "乌鲁森",
    "格雷莫尔",
    "瑟雷基尔",
    "恶臭的黑苔兽",
    "愤怒的谢尔达",
    "拉吉波尔",
    "智者奥尔姆",
    "莫戈雷斯",
    "奥辛尔·灵息",
    "伊姆拉图斯",
    "死亡之嚎",
    "迪塞库斯",
    "贝哈默斯",
    -- "裂盾军需官",
    "黑铁大使",
    "失控的掠夺者",
    "沃尔查",
    "高戈诺奇",
    "赫玛图斯",
    "格鲁克拉什",
    "特罗斯巴克",
    "萨里斯·巴加尔",
    "死亡之喉",
    "哈克佐尔",
    "玛达萨尔",
    "工头杰瑞斯",
    "弗曼恩",
    "血色高阶牧师",
    "哈斯克",
    "普特迪乌斯",
    "工头玛希瑞德",
    "血色铁匠",
    "血色法官",
    "血色质问者",
    "血色刽子手",
    "死亡之誓",
    "雷布查斯",
    "沉默的罗恩",
    "搜寻者埃库隆",
    "查特",
    "斯纳弗莱尔",
    "卡松",
    "斯奎迪克",
    "波德哈特",
    "刺喉雌龙",
    "米尔洛",
    "纳博恩",
    "马鲁克·龙鳞",
    "加内格·焦颅",
    "龙喉军官",
    "吸血寡妇",
    "被洗脑的贵族",
    "魔理莎·杜派格",
    "艾德温·范克里夫",
    "矿工约翰森",
    "剃刀沼泽刺鬃守卫",
    "盲眼猎手",
    "唤地者哈穆加",
    "血牙狼人",
    "维斯迦尔",
    "腐皮惩戒者",
    "斯纳麦恩",
    "安伯米尔书记员",
    "暗网编织者克雷希斯",
    "雷克提拉克",
    "斯卡尔德",
    "夏雷纳尔",
    "奴隶主黑心",
    "斯莫达尔",
    "玛斯托格",
    "未完善的作战傀儡",
    "基洛特",
    "钻石头",
    "滑翔者安蒂鲁斯",
    "潜行者布拉多尔",
    "纳尔利夫",
    "莎尔莱",
    "咆哮者",
    "阿拉瑟希斯",
    "灰腹老熊",
    "泽雷利斯",
    "哈格",
    "狮王休玛",
    "布拉德雷大使",
    "石臂",
    "赫金·石须",
    "技师维尔雷格",
    "跳跃者塔克",
    "莱丝塔伦",
    "矿工弗雷姆",
    "秘法师拉佐斯诺特",
    "石枪",
    "布隆塔斯",
    "格沙拉罕",
    "工头葛瑞尔斯",
    "玛尔金·麦酒",
    "迅鬃斑马",
    "拉索利安",
    "马库斯·拜尔",
    "雷蹄蜥蜴",
    "淤泥畸体",
    "天空之刃艾泽里",
    "土狼斯诺特",
    "艾恩·流水",
    "基洛戈·锤趾队长",
    "汉娜·刃叶",
    "迪舒",
    "土地祭司古科罗克",
    "斯文格加特·矛鬃",
    "索拉·羽月",
    "典狱官斯迪尔基斯",
    "无敌的潘佐尔",
    "洛考尔",
    "控火师罗格雷恩",
    "维雷克",
    "霜鬃长老",
    "游荡的冰爪熊",
    "饥饿的雪怪",
    "狂暴的冬狼",
    "吉波维特",
    "锤脊",
    "凯雷恩王子",
    "可憎的滑刃纳迦",
    "卡斯克",
    "基格勒尔",
    "西斯普拉克",
    "被诅咒的半人马",
    "鸦爪摄政者",
    
    -- 以下为新添加的稀有怪（从你提供的列表中筛选出的不重复目标）
    "霜鬃长老阿克提卡斯",
    "大型洛克鳄",
    "格瑞兹拉克",
    "欧加尔",
    "莱普利瑟斯",
    "怪笑者",
    "贪婪的哈尔卡",
    "吞噬者索利德",
    "巨型火鸟",
    "达拉然书记员",
    "游侠之王霍克斯比尔",
    "狂怒的石元素",
    "巴纳布斯",
    "雷克",
    "塔雷什森",
    "斯拉丁",
    "月凝女士",
    "灵狐",
    "裂鳞",
    "灰爪阿尔法",
    "古祖",
    "梁",
    "加比瑞",
    "唤地者雷森加尔",
    "暗影法师",
    "烬眼",
    "火法师鲁克索克",
    "男爵佩瑞诺德",
    "黎明嚎叫",
    "碎骨者",
    "暮掠者",
    "阿坎迪尔",
    "疯狂的卡尔曼提尔",
    "瓦妮莎·金钮",
    "故障的碎裂者1200型",
    "剪切者",
    "豹猫",
    "疯狂的泽布离鞍",
    "锋鳞",
    "月抚犸郎",
    "游荡骑士",
    "碎骨者",
    "亚奎图斯",
    "先知格鲁格索克",
    "嘉卡尔",
    "流浪骑士",
    "飞镖"
}

if not Screenshotoi then Screenshotoi=0 end

ZAOMAODG.globalTimeElapsed = 0
ZAOMAODG.lastUpdateTime = 0
ZAOMAODG.isActive = true  -- 默认开启
ZAOMAODG.whisperTarget = ""
ZAOMAODG.SFX_ALIVE = "Interface\\AddOns\\SilverDragon\\Music\\Item.mp3"

-- 主城和战场列表
ZAOMAODG.cityZones = {
    -- 阵营主城
    "暴风城",
    "铁炉堡",
    "达纳苏斯",
    "奥格瑞玛",
    "雷霆崖",
    "幽暗城",
    -- 节日地点
    "冬幕谷",
    -- 中立城市和重要地点
    "藏宝海湾",
    "棘齿城",
    "加基森",
    "永望镇",
    "诺达纳尔",
    "圣光之愿礼拜堂"
}

ZAOMAODG.battlegroundZones = {
    "战歌峡谷",
    "阿拉希盆地",
    "奥特兰克山谷",
    "血环竞技场",
    "阳光林地"
}

-- 检测是否在主城或战场中
function ZAOMAODG.isInCityOrBattleground()
    local zoneName = GetRealZoneText() or GetZoneText() or ""
    local subZoneName = GetSubZoneText() or ""
    
    if zoneName == "" then
        return false
    end
    
    -- 使用模糊匹配检查是否在主城（避免地图名称变化导致检测失败）
    for _, city in ipairs(ZAOMAODG.cityZones) do
        if strfind(strlower(zoneName), strlower(city)) or strfind(strlower(subZoneName), strlower(city)) then
            return true
        end
    end
    
    -- 使用模糊匹配检查是否在战场
    for _, bg in ipairs(ZAOMAODG.battlegroundZones) do
        if strfind(strlower(zoneName), strlower(bg)) or strfind(strlower(subZoneName), strlower(bg)) then
            return true
        end
    end
    
    -- 添加额外的安全检查，确保区域判定的准确性
    local playerInInstance, instanceType = IsInInstance()
    if playerInInstance and instanceType == "pvp" then
        return true
    end
    
    return false
end

-- 添加提示次数限制
ZAOMAODG.alertCounts = {} -- 记录每个目标的提示次数
ZAOMAODG.maxAlerts = 3 -- 每个目标最多提示3次
ZAOMAODG.musicTimers = {} -- 记录音乐播放计时器
ZAOMAODG.autoRestartTimer = nil -- 自动重启定时器

ZAOMAODG.alertFrame = CreateFrame("Frame", "ZAOMAODG_AlertFrame", UIParent)
ZAOMAODG.alertFrame:SetWidth(10)
ZAOMAODG.alertFrame:SetHeight(10)
ZAOMAODG.alertFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -10, -10)  
ZAOMAODG.alertFrame:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
    edgeSize = 1,
})
ZAOMAODG.alertFrame:SetBackdropColor(0, 1, 0, 1)
ZAOMAODG.alertFrame:SetBackdropBorderColor(0, 0, 0, 1)
ZAOMAODG.alertFrame:Hide()

function ZAOMAODG.toggleAlert(show)
    if show then
        ZAOMAODG.alertFrame:Show()
    else
        ZAOMAODG.alertFrame:Hide()
    end
end

-- 暂时关闭雷达5分钟的函数
function ZAOMAODG:CloseRadarTemporarily(reason)
    -- 关闭雷达
    ZAOMAODG.isActive = false
    ZAOMAODG.toggleButton:SetText("雷达 off")
    print("雷达已暂时关闭5分钟: " .. reason)
    PlayMusic("") -- 停止音乐
    ZAOMAODG.toggleAlert(false)
    
    -- 启动5分钟自动重启定时器
    if ZAOMAODG.autoRestartTimer then
        ZAOMAODG.autoRestartTimer:Cancel()
    end
    ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(300, function()
        if not ZAOMAODG.isActive then
            -- 重启前检查是否仍在主城或战场
            if not ZAOMAODG.isInCityOrBattleground() then
                ZAOMAODG.isActive = true
                ZAOMAODG.alertCounts = {}
                ZAOMAODG.toggleButton:SetText("雷达 on")
                print("雷达已自动重启")
                ZAOMAODG.globalTimeElapsed = 0
                ZAOMAODG.lastUpdateTime = GetTime()
                ZAOMAODG.selectFromList()
                Screenshotoi=0
            else
                -- 如果仍在主城或战场，等待下次检查
                ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(60, function()
                    ZAOMAODG:OnZoneChanged()
                end)
            end
            ZAOMAODG.autoRestartTimer = nil
        end
    end)
end

function ZAOMAODG.selectTargetByName(targetName)
    -- 检查目标名称是否在我们的目标列表中
    local isInTargetList = false
    for _, name in ipairs(ZAOMAODG.targetList) do
        if targetName == name then
            isInTargetList = true
            break
        end
    end
    
    if not isInTargetList then
        return false
    end
    
    -- 尝试选中目标
    TargetByName(targetName, true)
    
    if UnitExists("target") then
        local currentTargetName = UnitName("target")
        
        -- 再次确认名称匹配（避免重名但不是我们要找的目标）
        if currentTargetName ~= targetName then
            -- 目标名称不匹配时只返回false，不关闭雷达
            return false
        end
        
        -- 检查是否是玩家
        if UnitIsPlayer("target") then
            -- 使用关闭雷达代替取消选中
            ZAOMAODG:CloseRadarTemporarily("目标是玩家")
            return false
        end
        
        -- 检查是否是玩家的宠物（使用1.12版本可用的方法）
        -- 在1.12版本中，玩家宠物的特征是：由玩家控制但不是玩家本身
        local isPet = false
        
        if UnitPlayerControlled("target") and not UnitIsPlayer("target") then
            isPet = true
        end
        
        if isPet then
            -- 发现目标但不可被攻击，打印提示
            print("发现目标: " .. currentTargetName .. "，但它是玩家的宠物")
            
            -- 使用关闭雷达代替取消选中
            ZAOMAODG:CloseRadarTemporarily("目标是玩家的宠物")
            return false
        end
        
        -- 只要不是玩家的宠物且不是玩家，就返回true（不再检查是否可被攻击）
        return true
    end
    
    -- 如果不是有效目标，使用关闭雷达代替取消选中
    if UnitExists("target") then
        local currentTargetName = UnitName("target")
        if currentTargetName == targetName then
            ZAOMAODG:CloseRadarTemporarily("目标不是有效目标")
        end
    end
    
    return false
end

function ZAOMAODG.sendWhisper(targetFound)
    if ZAOMAODG.whisperTarget ~= "" then
        SendChatMessage("发现特定目标: "..targetFound, "WHISPER", nil, ZAOMAODG.whisperTarget)
    end
end

function ZAOMAODG.selectFromList()
    -- 首先检查是否在主城或战场区域
    if ZAOMAODG.isInCityOrBattleground() then
        -- 如果在主城或战场，关闭雷达并显示提示
        ZAOMAODG.isActive = false
        ZAOMAODG.toggleButton:SetText("雷达 off")
        print("当前在主城或战场区域，雷达已自动关闭")
        PlayMusic("") -- 停止音乐
        ZAOMAODG.toggleAlert(false)
        
        -- 启动5分钟自动重启定时器
        if ZAOMAODG.autoRestartTimer then
            ZAOMAODG.autoRestartTimer:Cancel()
        end
        ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(300, function()
            if not ZAOMAODG.isActive then
                -- 重启前检查是否仍在主城或战场
                if not ZAOMAODG.isInCityOrBattleground() then
                    ZAOMAODG.isActive = true
                    ZAOMAODG.alertCounts = {}
                    ZAOMAODG.toggleButton:SetText("雷达 on")
                    print("雷达已自动重启")
                    ZAOMAODG.globalTimeElapsed = 0
                    ZAOMAODG.lastUpdateTime = GetTime()
                    ZAOMAODG.selectFromList()
                    Screenshotoi=0
                else
                    -- 如果仍在主城或战场，等待下次检查
                    ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(60, function()
                        ZAOMAODG:OnZoneChanged()
                    end)
                end
                ZAOMAODG.autoRestartTimer = nil
            end
        end)
        return
    end
    
    if not ZAOMAODG.isActive then return end
    
    -- 再次检查是否在主城或战场，确保区域判定的准确性
    if ZAOMAODG.isInCityOrBattleground() then
        return -- 如果在限制区域，直接返回不执行后续操作
    end
    
    local targetFound = false
    for _, name in ipairs(ZAOMAODG.targetList) do
        if ZAOMAODG.selectTargetByName(name) then 
            local targetName = UnitName("target")
            
            -- 检查提示次数
            if not ZAOMAODG.alertCounts[targetName] then
                ZAOMAODG.alertCounts[targetName] = 0
            end
            
            -- 如果提示次数未达到上限，则提示
            if ZAOMAODG.alertCounts[targetName] < ZAOMAODG.maxAlerts then
                -- 再次检查是否在主城或战场（避免切换地图后仍继续搜索）
                if ZAOMAODG.isInCityOrBattleground() then
                    -- 如果在主城或战场，关闭雷达并显示提示
                    ZAOMAODG.isActive = false
                    ZAOMAODG.toggleButton:SetText("雷达 off")
                    print("当前在主城或战场区域，雷达已自动关闭")
                    PlayMusic("") -- 停止音乐
                    ZAOMAODG.toggleAlert(false)
                    
                    -- 启动5分钟自动重启定时器
                    if ZAOMAODG.autoRestartTimer then
                        ZAOMAODG.autoRestartTimer:Cancel()
                    end
                    ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(300, function()
                        if not ZAOMAODG.isActive then
                            -- 重启前检查是否仍在主城或战场
                            if not ZAOMAODG.isInCityOrBattleground() then
                                ZAOMAODG.isActive = true
                                ZAOMAODG.alertCounts = {}
                                ZAOMAODG.toggleButton:SetText("雷达 on")
                                print("雷达已自动重启")
                                ZAOMAODG.globalTimeElapsed = 0
                                ZAOMAODG.lastUpdateTime = GetTime()
                                ZAOMAODG.selectFromList()
                                Screenshotoi=0
                            else
                                -- 如果仍在主城或战场，等待下次检查
                                ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(60, function()
                                    ZAOMAODG:OnZoneChanged()
                                end)
                            end
                            ZAOMAODG.autoRestartTimer = nil
                        end
                    end)
                    return
                end
                
                if not UnitIsDead("target") then
                    -- 目标存活
                    print("发现目标:"..targetName)
                    SendChatMessage("发现目标:"..targetName,"CHANNEL",nil,GetChannelName("啊蹲boss"))
                    
                    -- 记录到历史
                    ZAOMAODG:RecordToHistory(targetName, false)
                    
                    -- 确保音乐计时器表已初始化
                    if not ZAOMAODG.musicTimers then
                        ZAOMAODG.musicTimers = {}
                    end
                    
                    -- 播放音乐但设置停止计时器
                    PlayMusic("Interface\\AddOns\\SilverDragon\\Music\\Item.mp3")
                    
                    -- 3秒后停止音乐
                    if ZAOMAODG.musicTimers[targetName] then
                        ZAOMAODG.musicTimers[targetName]:Cancel()
                    end
                    ZAOMAODG.musicTimers[targetName] = C_Timer.NewTimer(3, function()
                        PlayMusic("")
                    end)
                    
                    ZAOMAODG.sendWhisper(targetName)
                    ZAOMAODG.alertCounts[targetName] = ZAOMAODG.alertCounts[targetName] + 1
                    targetFound = true
                else
                    -- 目标死亡
                    print("发现稀有boss:"..targetName.."   可惜晚了一步..")
                    
                    -- 记录到历史
                    ZAOMAODG:RecordToHistory(targetName, true)
                    
                    ZAOMAODG.sendWhisper(targetName.." (已死亡)")
                    ZAOMAODG.alertCounts[targetName] = ZAOMAODG.alertCounts[targetName] + 1
                    targetFound = true
                end
                
                -- 检查是否达到最大提示次数，如果是则关闭雷达
                if ZAOMAODG.alertCounts[targetName] >= ZAOMAODG.maxAlerts then
                    ZAOMAODG.isActive = false
                    ZAOMAODG.toggleButton:SetText("雷达 off")
                    print("已找到目标，雷达已自动关闭，5分钟后将自动重启")
                    PlayMusic("") -- 停止音乐
                    ZAOMAODG.toggleAlert(false)
                    
                    -- 启动5分钟自动重启定时器
                    if ZAOMAODG.autoRestartTimer then
                        ZAOMAODG.autoRestartTimer:Cancel()
                    end
                    ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(300, function()
                        if not ZAOMAODG.isActive then
                            ZAOMAODG.isActive = true
                            ZAOMAODG.alertCounts = {}
                            ZAOMAODG.toggleButton:SetText("雷达 on")
                            print("雷达已自动重启")
                            ZAOMAODG.globalTimeElapsed = 0
                            ZAOMAODG.lastUpdateTime = GetTime()
                            ZAOMAODG.selectFromList()
                            Screenshotoi=0
                            ZAOMAODG.autoRestartTimer = nil
                        end
                    end)
                end

                -- 重置提示计时的定时器
                if ZAOMAODG.alertTimers and ZAOMAODG.alertTimers[targetName] then
                    ZAOMAODG.alertTimers[targetName]:Cancel()
                end
                
                -- 5分钟后重置该目标的提示计数
                if not ZAOMAODG.alertTimers then ZAOMAODG.alertTimers = {} end
                ZAOMAODG.alertTimers[targetName] = C_Timer.NewTimer(300, function()
                    ZAOMAODG.alertCounts[targetName] = nil
                end)
                
                break
            end
        end
    end
    ZAOMAODG.toggleAlert(targetFound)
end

ZAOMAODG.timerFrame = CreateFrame("Frame", "ZAOMAODG_TimerFrame")
ZAOMAODG.timerFrame:SetScript("OnUpdate", function()
    if not ZAOMAODG.isActive then return end
    
    -- 在主城或战场中不进行搜索
    if ZAOMAODG.isInCityOrBattleground() then
        return
    end
    
    local currentTime = GetTime()
    ZAOMAODG.globalTimeElapsed = ZAOMAODG.globalTimeElapsed + (currentTime - ZAOMAODG.lastUpdateTime)
    ZAOMAODG.lastUpdateTime = currentTime
    if ZAOMAODG.globalTimeElapsed >= 3 then
        ZAOMAODG.selectFromList()
        ZAOMAODG.globalTimeElapsed = ZAOMAODG.globalTimeElapsed - 3
    end
end)

-- 初始化禁用状态
ZAOMAODGDB = ZAOMAODGDB or {}
ZAOMAODGDB.disabled = ZAOMAODGDB.disabled or false
ZAOMAODG.disabled = ZAOMAODGDB.disabled

-- 初始化临时目标列表
if not ZAOMAODGDB.tempTargetList then
    ZAOMAODGDB.tempTargetList = {}
end

-- 将临时目标添加到主目标列表
for _, target in ipairs(ZAOMAODGDB.tempTargetList) do
    table.insert(ZAOMAODG.targetList, target)
end

-- 创建主框架来包含所有ZAOMAODG的UI元素
ZAOMAODG.mainFrame = CreateFrame("Frame", "ZAOMAODG_MainFrame", UIParent)
ZAOMAODG.mainFrame:SetWidth(272)  -- 增加宽度以容纳历史记录按钮
ZAOMAODG.mainFrame:SetHeight(40)
ZAOMAODG.mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
ZAOMAODG.mainFrame:Hide()

-- 添加移动按钮
ZAOMAODG.moveButton = CreateFrame("Button", "ZAOMAODG_MoveButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.moveButton:SetWidth(27)
ZAOMAODG.moveButton:SetHeight(27)
ZAOMAODG.moveButton:SetText("移")
ZAOMAODG.moveButton:SetPoint("LEFT", ZAOMAODG.mainFrame, "LEFT", 0, 0)

ZAOMAODG.toggleButton = CreateFrame("Button", "ZAOMAODG_ToggleButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.toggleButton:SetWidth(80)
ZAOMAODG.toggleButton:SetHeight(27)
ZAOMAODG.toggleButton:SetText("雷达 on")
ZAOMAODG.toggleButton:SetPoint("LEFT", ZAOMAODG.moveButton, "RIGHT", 5, 0)

ZAOMAODG.addButton = CreateFrame("Button", "ZAOMAODG_AddButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.addButton:SetWidth(27)
ZAOMAODG.addButton:SetHeight(27)
ZAOMAODG.addButton:SetText("+")
ZAOMAODG.addButton:SetPoint("LEFT", ZAOMAODG.toggleButton, "RIGHT", 5, 0)

-- 添加删除按钮
ZAOMAODG.removeButton = CreateFrame("Button", "ZAOMAODG_RemoveButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.removeButton:SetWidth(27)
ZAOMAODG.removeButton:SetHeight(27)
ZAOMAODG.removeButton:SetText("-")
ZAOMAODG.removeButton:SetPoint("LEFT", ZAOMAODG.addButton, "RIGHT", 5, 0)

-- 添加禁用按钮（替换原来的列表按钮）
ZAOMAODG.disableButton = CreateFrame("Button", "ZAOMAODG_DisableButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.disableButton:SetWidth(27)
ZAOMAODG.disableButton:SetHeight(27)
ZAOMAODG.disableButton:SetText(ZAOMAODG.disabled and "启" or "禁")
ZAOMAODG.disableButton:SetPoint("LEFT", ZAOMAODG.removeButton, "RIGHT", 5, 0)

-- 添加通知设置按钮
ZAOMAODG.notifyButton = CreateFrame("Button", "ZAOMAODG_NotifyButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.notifyButton:SetWidth(27)
ZAOMAODG.notifyButton:SetHeight(27)
ZAOMAODG.notifyButton:SetText("告")
ZAOMAODG.notifyButton:SetPoint("LEFT", ZAOMAODG.disableButton, "RIGHT", 5, 0)

-- 添加历史记录按钮
ZAOMAODG.historyButton = CreateFrame("Button", "ZAOMAODG_HistoryButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.historyButton:SetWidth(27)
ZAOMAODG.historyButton:SetHeight(27)
ZAOMAODG.historyButton:SetText("历")
ZAOMAODG.historyButton:SetPoint("LEFT", ZAOMAODG.notifyButton, "RIGHT", 5, 0)

-- 添加关闭按钮
ZAOMAODG.closeButton = CreateFrame("Button", "ZAOMAODG_CloseButton", ZAOMAODG.mainFrame, "UIPanelButtonTemplate")
ZAOMAODG.closeButton:SetWidth(27)
ZAOMAODG.closeButton:SetHeight(27)
ZAOMAODG.closeButton:SetText("×")
ZAOMAODG.closeButton:SetPoint("LEFT", ZAOMAODG.historyButton, "RIGHT", 5, 0)
ZAOMAODG.closeButton:SetScript("OnClick", function()
    ZAOMAODG.mainFrame:Hide()
end)

-- 为所有按钮添加悬停提示功能（经典旧世版本兼容）
local function AddTooltip(button, text)
    button:SetScript("OnEnter", function()
        GameTooltip:SetOwner(button, "ANCHOR_TOP")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(text, 1, 1, 1, 1)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
end

-- 为每个按钮添加悬停提示
AddTooltip(ZAOMAODG.moveButton, "按下后拖动到任意位置")
AddTooltip(ZAOMAODG.toggleButton, "点击开启/关闭搜索雷达")
AddTooltip(ZAOMAODG.addButton, "临时添加搜索目标")
AddTooltip(ZAOMAODG.removeButton, "临时删除搜索目标")
AddTooltip(ZAOMAODG.disableButton, "禁用/启用雷达，禁用时不受5分钟自动重启规则影响")
AddTooltip(ZAOMAODG.notifyButton, "设置找到目标后私聊告知的玩家")
AddTooltip(ZAOMAODG.closeButton, "隐藏窗口")

-- 设置主框架可拖动（使用移动按钮）
ZAOMAODG.moveButton:SetMovable(true)
ZAOMAODG.moveButton:EnableMouse(true)
ZAOMAODG.moveButton:RegisterForDrag("LeftButton")
ZAOMAODG.moveButton:SetScript("OnDragStart", function()
    ZAOMAODG.mainFrame:StartMoving()
end)
ZAOMAODG.moveButton:SetScript("OnDragStop", function()
    ZAOMAODG.mainFrame:StopMovingOrSizing()
    local centerX, centerY = ZAOMAODG.mainFrame:GetCenter()
    local screenWidth = UIParent:GetWidth()
    local screenHeight = UIParent:GetHeight()
    ZAOMAODGDB.x = (centerX - screenWidth/2) / screenWidth
    ZAOMAODGDB.y = (centerY - screenHeight/2) / screenHeight
end)

-- 确保主框架可移动
ZAOMAODG.mainFrame:SetMovable(true)
ZAOMAODG.mainFrame:EnableMouse(false) -- 禁用主框架的鼠标事件，只通过按钮移动

function ZAOMAODG.InitializePosition()
    if ZAOMAODGDB.x and ZAOMAODGDB.y then
        local screenWidth = UIParent:GetWidth()
        local screenHeight = UIParent:GetHeight()
        local x = ZAOMAODGDB.x * screenWidth + screenWidth/2
        local y = ZAOMAODGDB.y * screenHeight + screenHeight/2
        ZAOMAODG.mainFrame:ClearAllPoints()
        ZAOMAODG.mainFrame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x, y)
    else
        ZAOMAODG.mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    end
end

ZAOMAODG.InitializePosition()

ZAOMAODG.toggleButton:SetScript("OnClick", function()
    if ZAOMAODG.disabled then
        print("雷达处于禁用状态")
        return -- 禁用状态下无法操作
    end
    ZAOMAODG.isActive = not ZAOMAODG.isActive
    if ZAOMAODG.isActive then
        -- 取消自动重启定时器（如果存在）
        if ZAOMAODG.autoRestartTimer then
            ZAOMAODG.autoRestartTimer:Cancel()
            ZAOMAODG.autoRestartTimer = nil
        end
        
        -- 重置所有目标的提示次数
        ZAOMAODG.alertCounts = {}
        ZAOMAODG.toggleButton:SetText("雷达 on")
        print("雷达开启")
        ZAOMAODG.globalTimeElapsed = 0
        ZAOMAODG.lastUpdateTime = GetTime()
        
        -- 检查是否在主城或战场，只有在非限制区域才进行搜索
        if not ZAOMAODG.isInCityOrBattleground() then
            ZAOMAODG.selectFromList()
        else
            print("当前在主城或战场区域，雷达处于休眠状态")
        end
        Screenshotoi=0
    else
        ZAOMAODG.toggleButton:SetText("雷达 off")
        print("雷达关闭，5分钟后将自动重启")
        Screenshotoi=1
        PlayMusic("")
        ZAOMAODG.toggleAlert(false)
        
        -- 启动5分钟自动重启定时器
        if ZAOMAODG.autoRestartTimer then
            ZAOMAODG.autoRestartTimer:Cancel()
        end
        ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(300, function()
            if not ZAOMAODG.isActive and not ZAOMAODG.disabled then -- 禁用状态下不自动重启
                ZAOMAODG.isActive = true
                ZAOMAODG.alertCounts = {}
                ZAOMAODG.toggleButton:SetText("雷达 on")
                print("雷达已自动重启")
                ZAOMAODG.globalTimeElapsed = 0
                ZAOMAODG.lastUpdateTime = GetTime()
                
                -- 检查是否在主城或战场，只有在非限制区域才进行搜索
                if not ZAOMAODG.isInCityOrBattleground() then
                    ZAOMAODG.selectFromList()
                else
                    print("当前在主城或战场区域，雷达处于休眠状态")
                end
                Screenshotoi=0
                ZAOMAODG.autoRestartTimer = nil
            end
        end)
    end
end)

ZAOMAODG.addButton:SetScript("OnClick", function()
    StaticPopup_Show("ZAOMAODG_ADD_TARGET")
end)

-- 删除按钮功能
ZAOMAODG.removeButton:SetScript("OnClick", function()
    StaticPopup_Show("ZAOMAODG_REMOVE_TARGET")
end)

-- 禁用按钮功能
ZAOMAODG.disableButton:SetScript("OnClick", function()
    ZAOMAODG.disabled = not ZAOMAODG.disabled
    ZAOMAODGDB.disabled = ZAOMAODG.disabled -- 保存到数据库
    ZAOMAODG.disableButton:SetText(ZAOMAODG.disabled and "启" or "禁")
    
    if ZAOMAODG.disabled then
        -- 禁用时立即关闭雷达
        ZAOMAODG.isActive = false
        ZAOMAODG.toggleButton:SetText("雷达 off")
        print("雷达已禁用，不受5分钟自动重启规则影响")
        -- 取消任何正在运行的自动重启定时器
        if ZAOMAODG.autoRestartTimer then
            ZAOMAODG.autoRestartTimer:Cancel()
            ZAOMAODG.autoRestartTimer = nil
        end
    else
        print("雷达已启用，5分钟自动重启规则生效")
        -- 启用后可以手动开启雷达
    end
end)

-- 通知设置按钮功能
ZAOMAODG.notifyButton:SetScript("OnClick", function()
    StaticPopup_Show("ZAOMAODG_SET_NOTIFY")
end)

-- 显示/隐藏主窗口
function ZAOMAODG.toggleWindow()
    if ZAOMAODG.mainFrame:IsShown() then
        ZAOMAODG.mainFrame:Hide()
    else
        ZAOMAODG.mainFrame:Show()
    end
end

-- 打印目标列表函数
function ZAOMAODG.printTargetList()
    print("===== 当前搜索目标列表 =====")
    local count = 0
    for i, target in ipairs(ZAOMAODG.targetList) do
        print(i .. ". " .. target)
        count = count + 1
    end
    print("===== 共 " .. tostring(count) .. " 个目标 =====")
end

StaticPopupDialogs["ZAOMAODG_ADD_TARGET"] = {
    text = "输入临时添加的名称:",
    button1 = "添加",
    button2 = "取消",
    hasEditBox = true,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    OnShow = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            editBox:SetText("")
            editBox:SetFocus()
        end
    end,
    OnAccept = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            local targetName = editBox:GetText()
            if targetName and targetName ~= "" then
                table.insert(ZAOMAODG.targetList, targetName)
                table.insert(ZAOMAODGDB.tempTargetList, targetName)
                print("已添加新目标: " .. targetName)
                -- ZAOMAODG.printTargetList()
            end
        end
    end,
}

StaticPopupDialogs["ZAOMAODG_REMOVE_TARGET"] = {
    text = "输入要删除的目标名称:",
    button1 = "删除",
    button2 = "取消",
    hasEditBox = true,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    OnShow = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            editBox:SetText("")
            editBox:SetFocus()
        end
    end,
    OnAccept = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            local targetName = editBox:GetText()
            if targetName and targetName ~= "" then
                local found = false
                
                -- 从主目标列表中删除
                for i, name in ipairs(ZAOMAODG.targetList) do
                    if name == targetName then
                        table.remove(ZAOMAODG.targetList, i)
                        found = true
                        break
                    end
                end
                
                -- 从临时目标列表中删除
                if found then
                    for i, name in ipairs(ZAOMAODGDB.tempTargetList) do
                        if name == targetName then
                            table.remove(ZAOMAODGDB.tempTargetList, i)
                            break
                        end
                    end
                    print("已删除目标: " .. targetName)
                    -- ZAOMAODG.printTargetList()
                else
                    print("未找到目标: " .. targetName)
                end
            end
        end
    end,
}

StaticPopupDialogs["ZAOMAODG_SET_NOTIFY"] = {
    text = "输入私聊通知的目标玩家名称:",
    button1 = "设置",
    button2 = "取消",
    hasEditBox = true,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    OnShow = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            editBox:SetText(ZAOMAODG.whisperTarget or "")
            editBox:SetFocus()
        end
    end,
    OnAccept = function()
        local editBox = _G["StaticPopup1EditBox"]
        if editBox then
            ZAOMAODG.whisperTarget = editBox:GetText()
            if ZAOMAODG.whisperTarget ~= "" then
                print("已设置私聊通知目标: "..ZAOMAODG.whisperTarget)
            else
                print("已清除私聊通知目标")
            end
        end
    end,
}

SLASH_ZAOMAODG1 = "/zmdg"
SLASH_ZMSNAME1 = "/zmsname"
SlashCmdList["ZAOMAODG"] = function(msg)
    StaticPopup_Show("ZAOMAODG_ADD_TARGET")
end

SlashCmdList["ZMSNAME"] = function(msg)
    ZAOMAODG.whisperTarget = msg
    if ZAOMAODG.whisperTarget ~= "" then
        print("已设置私聊通知目标: "..ZAOMAODG.whisperTarget)
    else
        print("已清除私聊通知目标")
    end
end

-- 添加简化的SilverDragon整合命令
SLASH_SILVERDRAGONZDG1 = "/sdz"
SlashCmdList["SILVERDRAGONZDG"] = function(msg)
    if msg == "show" then
        ZAOMAODG.toggleWindow()
    elseif msg == "hide" then
        ZAOMAODG.mainFrame:Hide()
    elseif msg == "toggle" then
        ZAOMAODG.toggle()
    else
        ZAOMAODG.toggleWindow()
    end
end

-- 将ZAOMAODG附加到SilverDragon全局对象
SilverDragon.ZAOMAODG = ZAOMAODG

-- 插件加载后自动开启雷达
-- 添加地图切换事件监听
function ZAOMAODG:OnZoneChanged()
    -- 如果处于禁用状态，不执行任何操作
    if ZAOMAODG.disabled then
        return
    end
    
    -- 检查是否在主城或战场
    if ZAOMAODG.isInCityOrBattleground() then
        -- 如果在主城或战场且雷达处于开启状态，关闭雷达
        if ZAOMAODG.isActive then
            ZAOMAODG.isActive = false
            ZAOMAODG.toggleButton:SetText("雷达 off")
            print("进入主城或战场区域，雷达已自动关闭")
            PlayMusic("") -- 停止音乐
            ZAOMAODG.toggleAlert(false)
            
            -- 启动5分钟自动重启定时器
            if ZAOMAODG.autoRestartTimer then
                ZAOMAODG.autoRestartTimer:Cancel()
            end
            ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(300, function()
                if not ZAOMAODG.isActive and not ZAOMAODG.disabled then -- 禁用状态下不自动重启
                    -- 重启前检查是否仍在主城或战场
                    if not ZAOMAODG.isInCityOrBattleground() then
                        ZAOMAODG.isActive = true
                        ZAOMAODG.alertCounts = {}
                        ZAOMAODG.toggleButton:SetText("雷达 on")
                        print("雷达已自动重启")
                        ZAOMAODG.globalTimeElapsed = 0
                        ZAOMAODG.lastUpdateTime = GetTime()
                        -- 确保音乐计时器已初始化
                        if not ZAOMAODG.musicTimers then
                            ZAOMAODG.musicTimers = {}
                        end
                        ZAOMAODG.selectFromList()
                        Screenshotoi=0
                    else
                        -- 如果仍在主城或战场，等待下次检查
                        ZAOMAODG.autoRestartTimer = C_Timer.NewTimer(60, function()
                            ZAOMAODG:OnZoneChanged()
                        end)
                    end
                    ZAOMAODG.autoRestartTimer = nil
                end
            end)
        end
    else
        -- 如果不在主城或战场且雷达处于关闭状态，自动开启雷达
        if not ZAOMAODG.isActive and not ZAOMAODG.autoRestartTimer and not ZAOMAODG.disabled then
            ZAOMAODG.isActive = true
            ZAOMAODG.alertCounts = {}
            ZAOMAODG.toggleButton:SetText("雷达 on")
            print("离开主城或战场区域，雷达已自动开启")
            ZAOMAODG.globalTimeElapsed = 0
            ZAOMAODG.lastUpdateTime = GetTime()
            -- 确保音乐计时器已初始化
            if not ZAOMAODG.musicTimers then
                ZAOMAODG.musicTimers = {}
            end
            ZAOMAODG.selectFromList()
            Screenshotoi=0
        end
    end
end

local function InitializeZAOMAODG()
    -- 默认开启雷达
    ZAOMAODG.isActive = not ZAOMAODG.disabled -- 如果禁用状态为true，则初始为关闭
    ZAOMAODG.toggleButton:SetText(ZAOMAODG.isActive and "雷达 on" or "雷达 off")
    ZAOMAODG.globalTimeElapsed = 0
    ZAOMAODG.lastUpdateTime = GetTime()
    
    -- 注册地图切换事件
    ZAOMAODG.timerFrame:RegisterEvent("ZONE_CHANGED")
    ZAOMAODG.timerFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    ZAOMAODG.timerFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
    
    -- 设置事件处理函数
    ZAOMAODG.timerFrame:SetScript("OnEvent", function(self, event, ...)
        if event == "ZONE_CHANGED" or event == "ZONE_CHANGED_NEW_AREA" or event == "ZONE_CHANGED_INDOORS" then
            ZAOMAODG:OnZoneChanged()
        end
    end)
    
    -- 检查是否在主城或战场，只有在非限制区域才进行搜索
    if not ZAOMAODG.isInCityOrBattleground() and ZAOMAODG.isActive then
        ZAOMAODG.selectFromList()
    else
        print("当前在主城或战场区域，雷达处于休眠状态")
    end
    Screenshotoi=0
    
    -- print("ZAOMAODG 已加载到 SilverDragon 中")
    -- print("使用 /sdz 显示/隐藏 BOSS 雷达窗口")
    print("稀有BOSS雷达已默认开启")
end

-- 延迟初始化，确保所有元素已创建
C_Timer.After(1, InitializeZAOMAODG)


-- 初始化历史记录数据 
ZAOMAODGDB = ZAOMAODGDB or {}
ZAOMAODGDB.history = ZAOMAODGDB.history or {}
ZAOMAODGDB.lastRecorded = ZAOMAODGDB.lastRecorded or {}

-- 创建历史记录窗口
ZAOMAODG.historyFrame = CreateFrame("Frame", "ZAOMAODG_HistoryFrame", UIParent)
ZAOMAODG.historyFrame:SetWidth(500) -- 增加窗口宽度以适应新的滚动框
ZAOMAODG.historyFrame:SetHeight(500)
ZAOMAODG.historyFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
ZAOMAODG.historyFrame:Hide()
ZAOMAODG.historyFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 9, right = 9, top = 9, bottom = 9 }
})

-- 历史记录窗口标题
ZAOMAODG.historyTitle = ZAOMAODG.historyFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
ZAOMAODG.historyTitle:SetText("雷达探测历史")
ZAOMAODG.historyTitle:SetPoint("TOP", ZAOMAODG.historyFrame, "TOP", 0, -20)

-- 历史记录滚动框
ZAOMAODG.historyScrollFrame = CreateFrame("ScrollFrame", "ZAOMAODG_HistoryScrollFrame", ZAOMAODG.historyFrame, "UIPanelScrollFrameTemplate")
ZAOMAODG.historyScrollFrame:SetWidth(450) -- 增加宽度以避免重叠
ZAOMAODG.historyScrollFrame:SetHeight(400)
ZAOMAODG.historyScrollFrame:SetPoint("TOPLEFT", ZAOMAODG.historyFrame, "TOPLEFT", 25, -50)

-- 滚动框内容
ZAOMAODG.historyScrollChild = CreateFrame("Frame", "ZAOMAODG_HistoryScrollChild", ZAOMAODG.historyScrollFrame)
ZAOMAODG.historyScrollChild:SetWidth(430) -- 调整内容框宽度
ZAOMAODG.historyScrollChild:SetHeight(1)
ZAOMAODG.historyScrollFrame:SetScrollChild(ZAOMAODG.historyScrollChild)

-- 关闭历史记录窗口
ZAOMAODG.historyCloseButton = CreateFrame("Button", "ZAOMAODG_HistoryCloseButton", ZAOMAODG.historyFrame, "UIPanelButtonTemplate")
ZAOMAODG.historyCloseButton:SetWidth(27)
ZAOMAODG.historyCloseButton:SetHeight(27)
ZAOMAODG.historyCloseButton:SetText("×")
ZAOMAODG.historyCloseButton:SetPoint("TOPRIGHT", ZAOMAODG.historyFrame, "TOPRIGHT", -10, -10)
ZAOMAODG.historyCloseButton:SetScript("OnClick", function()
    ZAOMAODG.historyFrame:Hide()
end)

-- 添加清除历史记录按钮
ZAOMAODG.clearHistoryButton = CreateFrame("Button", "ZAOMAODG_ClearHistoryButton", ZAOMAODG.historyFrame, "UIPanelButtonTemplate")
ZAOMAODG.clearHistoryButton:SetWidth(120)
ZAOMAODG.clearHistoryButton:SetHeight(30)
ZAOMAODG.clearHistoryButton:SetText("清除历史记录")
ZAOMAODG.clearHistoryButton:SetPoint("BOTTOM", ZAOMAODG.historyFrame, "BOTTOM", 0, 20)
ZAOMAODG.clearHistoryButton:SetScript("OnClick", function()
    -- 确保全局数据库表存在
    ZAOMAODGDB = ZAOMAODGDB or {}
    
    -- 清空历史记录
    ZAOMAODGDB.history = {}
    ZAOMAODGDB.lastRecorded = {}
    
    -- 手动清除所有历史记录条目，确保显示正确
    if ZAOMAODG.historyScrollChild then
        local children = {ZAOMAODG.historyScrollChild:GetChildren()}
        for _, child in ipairs(children) do
            if child:GetObjectType() == "Frame" and child.text then
                child:Hide()
            end
        end
        -- 设置滚动框高度为最小
        ZAOMAODG.historyScrollChild:SetHeight(1)
    end
    
    -- 更新显示
    ZAOMAODG:UpdateHistoryDisplay()
    
    -- 显示清空提示
    print("雷达探测历史已清空")
end)

-- 为清除历史记录按钮添加悬停提示
AddTooltip(ZAOMAODG.clearHistoryButton, "清空所有雷达探测历史记录")

-- 记录稀有怪信息到历史
function ZAOMAODG:RecordToHistory(name, isDead)
    -- 确保全局数据库表存在
    ZAOMAODGDB = ZAOMAODGDB or {}
    ZAOMAODGDB.history = ZAOMAODGDB.history or {}
    ZAOMAODGDB.lastRecorded = ZAOMAODGDB.lastRecorded or {}
    
    local currentTime = time()
    -- 检查1小时内是否有重复记录
    if ZAOMAODGDB.lastRecorded[name] and (currentTime - ZAOMAODGDB.lastRecorded[name]) < 3600 then
        return -- 1小时内重复记录，跳过
    end
    -- 更新最后记录时间
    ZAOMAODGDB.lastRecorded[name] = currentTime
    -- 格式化时间
    local timeStr = date("%Y-%m-%d %H:%M:%S", currentTime)
    -- 创建记录条目
    local entry = {
        time = currentTime,
        timeStr = timeStr,
        name = name,
        dead = isDead
    }
    -- 插入到历史记录开头
    table.insert(ZAOMAODGDB.history, 1, entry)
    -- 限制最多100条记录 - 使用兼容的方式获取表长度
    local historyLength = 0
    for i, _ in ipairs(ZAOMAODGDB.history) do
        historyLength = i
    end
    if historyLength > 100 then
        table.remove(ZAOMAODGDB.history, 101)
    end
end

-- 更新历史记录显示
-- 确保ZAOMAODG.history存在
function ZAOMAODG:UpdateHistoryDisplay()
    -- 确保全局数据库表存在
    ZAOMAODGDB = ZAOMAODGDB or {}
    ZAOMAODGDB.history = ZAOMAODGDB.history or {}
    
    -- 确保所有必要的UI元素存在
    if not ZAOMAODG.historyScrollChild then
        print("错误：历史记录滚动框子元素未找到")
        return
    end
    
    -- 清除现有条目
    local children = ZAOMAODG.historyScrollChild:GetChildren()
    -- 使用安全的方式遍历子元素，避免ipairs(nil)错误
    if children then
        for i, child in ipairs(children) do
            child:Hide()
        end
    end
    -- 添加新条目
    for i, entry in ipairs(ZAOMAODGDB.history) do
        local line = CreateFrame("Frame", "ZAOMAODG_HistoryLine"..i, ZAOMAODG.historyScrollChild)
        line:SetWidth(430) -- 调整行宽度
        line:SetHeight(20)
        line:SetPoint("TOPLEFT", ZAOMAODG.historyScrollChild, "TOPLEFT", 0, -20*(i-1))
        line.entry = entry
        -- 条目文本
        local text = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetText(entry.timeStr .. ": " .. entry.name .. (entry.dead and " (尸体)" or ""))
        text:SetPoint("LEFT", line, "LEFT", 5, 0)
        text:SetWidth(350) -- 设置文本最大宽度，避免与按钮重叠
        text:SetJustifyH("LEFT")
        line.text = text
        -- 为每条记录添加独立的查询按钮
        local queryBtn = CreateFrame("Button", "ZAOMAODG_QueryButton"..i, line, "UIPanelButtonTemplate")
        queryBtn:SetWidth(60)
        queryBtn:SetHeight(18)
        queryBtn:SetText("查询")
        queryBtn:SetPoint("RIGHT", line, "RIGHT", -5, 0)
        queryBtn.entry = entry
        queryBtn:SetScript("OnClick", function()
            -- 在聊天框输入 /DB 怪物名称并提交
            if ChatFrameEditBox then
                ChatFrameEditBox:SetText("/DB " .. queryBtn.entry.name)
                ChatEdit_SendText(ChatFrameEditBox)
            else
                -- 备用方法：直接使用SendChatMessage
                SendChatMessage("/DB " .. queryBtn.entry.name)
            end
        end)
        queryBtn:SetScript("OnEnter", function()
            GameTooltip:SetOwner(queryBtn, "ANCHOR_RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:AddLine("查询: " .. queryBtn.entry.name, 1, 1, 1)
            GameTooltip:AddLine("点击自动输入 /DB 命令", 0.8, 0.8, 0.8)
            GameTooltip:Show()
        end)
        queryBtn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        line.queryButton = queryBtn
        -- 悬停效果
        line:SetScript("OnEnter", function()
            GameTooltip:SetOwner(line, "ANCHOR_RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:AddLine(entry.name, 1, 1, 1)
            GameTooltip:AddLine("记录于: " .. entry.timeStr, 0.8, 0.8, 0.8)
            GameTooltip:AddLine("状态: " .. (entry.dead and "已死亡" or "存活"), 0.8, 0.8, 0.8)
            GameTooltip:Show()
        end)
        line:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        line:Show()
    end
    -- 更新滚动框高度 - 使用兼容的方式获取表长度
    local scrollHeight = 1
    for i, _ in ipairs(ZAOMAODGDB.history) do
        scrollHeight = i
    end
    ZAOMAODG.historyScrollChild:SetHeight(math.max(scrollHeight*20, 1))
end

-- 历史记录按钮功能
ZAOMAODG.historyButton:SetScript("OnClick", function()
    ZAOMAODG:UpdateHistoryDisplay()
    ZAOMAODG.historyFrame:Show()
end)

-- 为历史记录按钮添加悬停提示
AddTooltip(ZAOMAODG.historyButton, "查看雷达探测历史")