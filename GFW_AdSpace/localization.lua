------------------------------------------------------
-- localization.lua
-- English strings by default, localizations override with their own.
------------------------------------------------------

FAS_Localized = {};		-- this line doesn't need localization, it just lets us use FAS_Localized below.

	SOLD_FOR_PRICE_BY = "出售价格:%s 出自";					-- prefix to vendor info when price is shown
	SOLD_BY = "[出售者]";									-- prefix to vendor info when no price is shown
	RETURN_TO = "交给";								-- prefix to info for librams
	ARCANUM_FORMAT = "奖励: %s 附魔";				-- bonus info for librams
	VENDOR_LOCATION_FORMAT = "%s, %s";						-- format for showing vendor name and location
	FAS_FACTION_REWARDS = "%s 奖励:";
	FAS_FACTION_REWARDS_COUNT = "%d %s 奖励";
	FAS_TURNIN = "交声望";
	FAS_WITH = "还要求";
	
-- notes for other items
	DARKMOON = "暗月马戏团换取奖券";
	
-- notes for vendors with special availability
	SEASONAL_VENDOR = "(季节性的供应商)";
	SCHOLO_QUEST = "要求鬼灵精华";

-- non-nil note so vendors in instances are highlighted in a different color
-- but no actual note text because it'd be cheesy to give too much away...	
	BRD_BARKEEP = "";
	DM_LIBRARY = "";
	
-- non-nil note for faction recipes so it gets a different color
-- no actual note because it's part of the base tooltip now.
	REQ_FACTION = "";
	
-- notes for items only available once you have a certain reputation standing
	THORIUM_FRIENDLY = "要求瑟银兄弟会 - "..FACTION_STANDING_LABEL5;
	THORIUM_HONORED = "要求瑟银兄弟会 - "..FACTION_STANDING_LABEL6;
	THORIUM_REVERED = "要求瑟银兄弟会 - "..FACTION_STANDING_LABEL7;
	THORIUM_EXALTED = "要求瑟银兄弟会 - "..FACTION_STANDING_LABEL8;

	TIMBERMAW_FRIENDLY = "要求木喉熊怪 - "..FACTION_STANDING_LABEL5;

-- Faction names
	AD_FACTION = "银色黎明";
	ZG_FACTION = "赞达拉部族";
	AQ20_FACTION = "塞纳里奥议会";
	AQ40_FACTION = "诺兹多姆的子嗣";
	
-- localized class names
	PALADIN = "圣骑士";
	SHAMAN = "萨满祭司";
	MAGE = "法师";
	PRIEST = "牧师";
	WARLOCK = "术士";
	WARRIOR = "战士";
	HUNTER = "猎人";
	ROGUE = "盗贼";
	DRUID = "德鲁伊";

-- localized weapon types
	STAFF = "法杖";
	MACE = "锤";
	AXE = "斧";
	GUN = "枪";
	DAGGER = "匕首";
	SHIELD = "盾牌";
	SWORD = "剑";

FAS_OPTIONS = "AdSpace 设置";
FAS_OPTIONS_GENERAL = "在物品上添加提示信息:";
FAS_OPTION_RECIPES = "从NPC供应商处可获得的配方";
FAS_OPTION_RECIPE_COST = "显示供应商配方价格";
FAS_OPTION_LIBRAM = "圣契 (NPC和奖励信息)";
FAS_OPTION_DARKMOON = "暗月马戏团灰色物品奖励";
FAS_OPTION_AD = "黎明之印项目提交";

FAS_OPTIONS_RAID = "特殊团队拾取:";
FAS_OPTION_ZG = "祖尔格拉布";
FAS_OPTION_ZG_FACTION = "(赞达拉部族奖励)";
FAS_OPTION_ZG_PRENAXX = "(1.11版本任务要求)";
FAS_OPTION_AQ20 = "安其拉废墟";
FAS_OPTION_AQ20_FACTION = "(AQ20塞纳里奥议会奖励)";
FAS_OPTION_AQ40 = "安其拉";
FAS_OPTION_AQ40_FACTION = "(AQ40诺兹多姆的子嗣奖励)";
FAS_OPTION_POST_RAID = "发送到团队聊天,当通过 '/ads [link]' 得到的信息时";

-- localized zone names (only those that differ from the enUS version should be present)
	FAS_Localized["Alterac Mountains"] = "奥特兰克山脉";
	FAS_Localized["Arathi Highlands"] = "阿拉希高地";
	FAS_Localized["Ashenvale"] = "灰谷";
	FAS_Localized["Azshara"] = "艾萨拉";
	FAS_Localized["Badlands"] = "荒芜之地";
	FAS_Localized["Blackrock Depths"] = "黑石深渊";
	FAS_Localized["Blasted Lands"] = "诅咒之地";
	FAS_Localized["Burning Steppes"] = "燃烧平原";
	FAS_Localized["Darkshore"] = "黑海岸";
	FAS_Localized["Darnassus"] = "达纳苏斯";
	FAS_Localized["Desolace"] = "凄凉之地";
	FAS_Localized["Dire Maul"] = "厄运之槌";
	FAS_Localized["Dun Morogh"] = "丹莫罗";
	FAS_Localized["Durotar"] = "杜隆塔尔";
	FAS_Localized["Duskwood"] = "暮色森林";
	FAS_Localized["Eastern Plaguelands"] = "东瘟疫之地";
	FAS_Localized["Elwynn Forest"] = "艾尔文森林";
	FAS_Localized["Felwood"] = "费伍德森林";
	FAS_Localized["Feralas"] = "菲拉斯";
	FAS_Localized["Gnomeregan"] = "诺莫瑞根";
	FAS_Localized["Hillsbrad Foothills"] = "希尔斯布莱德丘陵";
	FAS_Localized["Ironforge"] = "铁炉堡";
	FAS_Localized["Loch Modan"] = "洛克莫丹";
	FAS_Localized["Moonglade"] = "月光林地";
	FAS_Localized["Mulgore"] = "莫高雷";
	FAS_Localized["Orgrimmar"] = "奥格瑞玛";
	FAS_Localized["Redridge Mountains"] = "赤脊山";
	FAS_Localized["Silithus"] = "希利苏斯";
	FAS_Localized["Silverpine Forest"] = "银松森林";
	FAS_Localized["Stonetalon Mountains"] = "石爪山脉";
	FAS_Localized["Stormwind City"] = "暴风城";
	FAS_Localized["Stranglethorn Vale"] = "荆棘谷";
	FAS_Localized["Swamp of Sorrows"] = "悲伤沼泽";
	FAS_Localized["Tanaris"] = "塔纳利斯";
	FAS_Localized["Teldrassil"] = "泰达希尔";
	FAS_Localized["The Barrens"] = "贫瘠之地";
	FAS_Localized["The Hinterlands"] = "辛特兰";
	FAS_Localized["Thousand Needles"] = "千针石林";
	FAS_Localized["Thunder Bluff"] = "雷霆崖";
	FAS_Localized["Tirisfal Glades"] = "提瑞斯法林地";
	FAS_Localized["Un'Goro Crater"] = "安戈洛环形山";
	FAS_Localized["Undercity"] = "幽暗城";
	FAS_Localized["Wailing Caverns"] = "哀嚎洞穴";
	FAS_Localized["Western Plaguelands"] = "西瘟疫之地";
	FAS_Localized["Westfall"] = "西部荒野";
	FAS_Localized["Wetlands"] = "湿地";

-- localized NPC names (only those that differ from the enUS version should be present)
	FAS_Localized["Abigail Shiel"] = "阿比盖尔·沙伊尔";
	FAS_Localized["Alchemist Pestlezugg"] = "炼金师匹斯特苏格";
	FAS_Localized["Alexandra Bolero"] = "亚历山德拉·波利罗";
	FAS_Localized["Algernon"] = "奥格诺恩";
	FAS_Localized["Amy Davenport"] = "艾米·达文波特";
	FAS_Localized["Andrew Hilbert"] = "安德鲁·希尔伯特";
	FAS_Localized["Androd Fadran"] = "安多德·法德兰";
	FAS_Localized["Argent Quartermaster Hasana"] = "银色黎明军需官哈萨娜";
	FAS_Localized["Argent Quartermaster Lightspark"] = "银色黎明军需官莱斯巴克";
	FAS_Localized["Balai Lok'Wein"] = "巴莱·洛克维";
	FAS_Localized["Bale"] = "拜尔";
	FAS_Localized["Banalash"] = "巴纳拉什";
	FAS_Localized["Blimo Gadgetspring"] = "布里莫";
	FAS_Localized["Blixrez Goodstitch"] = "布里克雷兹·古斯提";
	FAS_Localized["Bliztik"] = "布里兹提克";
	FAS_Localized["Bombus Finespindle"] = "伯布斯·钢轴";
	FAS_Localized["Borya"] = "博亚";
	FAS_Localized["Brienna Starglow"] = "布琳娜·星光";
	FAS_Localized["Bro'kin"] = "布洛金";
	FAS_Localized["Bronk"] = "布隆克";
	FAS_Localized["Catherine Leland"] = "凯瑟琳·利兰";
	FAS_Localized["Christoph Jeffcoat"] = "克里斯托弗·杰弗寇特";
	FAS_Localized["Clyde Ranthal"] = "克莱德·兰萨尔";
	FAS_Localized["Constance Brisboise"] = "康斯坦茨·布里斯博埃斯";
	FAS_Localized["Corporal Bluth"] = "布鲁斯下士";
	FAS_Localized["Cowardly Crosby"] = "怯懦的克罗斯比";
	FAS_Localized["Crazk Sparks"] = "克拉赛·斯巴克斯";
	FAS_Localized["Dalria"] = "达利亚";
	FAS_Localized["Daniel Bartlett"] = "丹尼尔·巴特莱特";
	FAS_Localized["Danielle Zipstitch"] = "丹尼勒·希普斯迪";
	FAS_Localized["Darian Singh"] = "达利安·辛格";
	FAS_Localized["Darnall"] = "旅店老板达纳尔";
	FAS_Localized["Defias Profiteer"] = "迪菲亚奸商";
	FAS_Localized["Deneb Walker"] = "德尼布·沃克";
	FAS_Localized["Derak Nightfall"] = "德拉克·奈特弗";
	FAS_Localized["Dirge Quikcleave"] = "迪尔格·奎克里弗";
	FAS_Localized["Drac Roughcut"] = "德拉克·卷刃";
	FAS_Localized["Drake Lindgren"] = "德拉克·林格雷";
	FAS_Localized["Drovnar Strongbrew"] = "德鲁纳·烈酒";
	FAS_Localized["Dustwallow Marsh"] = "尘泥沼泽";
	FAS_Localized["Elynna"] = "艾琳娜";
	FAS_Localized["Evie Whirlbrew"] = "埃文·维布鲁";
	FAS_Localized["Fradd Swiftgear"] = "弗拉德";
	FAS_Localized["Gagsprocket"] = "加格斯普吉特";
	FAS_Localized["Gearcutter Cogspinner"] = "考格斯宾";
	FAS_Localized["George Candarte"] = "乔治·坎达特";
	FAS_Localized["Gharash"] = "卡尔拉什";
	FAS_Localized["Ghok'kah"] = "格鲁克卡恩";
	FAS_Localized["Gigget Zipcoil"] = "吉盖特·火油";
	FAS_Localized["Gikkix"] = "吉科希斯";
	FAS_Localized["Gina MacGregor"] = "吉娜·马克葛瑞格";
	FAS_Localized["Glyx Brewright"] = "格里克斯·布鲁维特";
	FAS_Localized["Gnaz Blunderflame"] = "格纳兹·枪焰";
	FAS_Localized["Gretta Ganter"] = "格雷塔·甘特";
	FAS_Localized["Grimtak"] = "格瑞姆塔克";
	FAS_Localized["Hagrus"] = "哈格鲁斯";
	FAS_Localized["Hammon Karwn"] = "哈蒙·卡文";
	FAS_Localized["Harggan"] = "哈尔甘";
	FAS_Localized["Harklan Moongrove"] = "哈克兰·月林";
	FAS_Localized["Harlown Darkweave"] = "哈鲁恩·暗纹";
	FAS_Localized["Harn Longcast"] = "哈恩·长线";
	FAS_Localized["Heldan Galesong"] = "海尔丹·风歌";
	FAS_Localized["Helenia Olden"] = "海伦妮亚·奥德恩";
	FAS_Localized["Himmik"] = "西米克";
	FAS_Localized["Hula'mahi"] = "哈拉玛";
	FAS_Localized["Jabbey"] = "加贝";
	FAS_Localized["Jandia"] = "詹迪亚";
	FAS_Localized["Janet Hommers"] = "詹奈特·霍莫斯";
	FAS_Localized["Jangdor Swiftstrider"] = "杉多尔·迅蹄";
	FAS_Localized["Jannos Ironwill"] = "加诺斯·铁心";
	FAS_Localized["Jaquilina Dramet"] = "加奎琳娜·德拉米特";
	FAS_Localized["Jase Farlane"] = "贾斯·法拉恩";
	FAS_Localized["Jazzrik"] = "加兹里克";
	FAS_Localized["Jeeda"] = "基达";
	FAS_Localized["Jennabink Powerseam"] = "吉娜比克·铁线";
	FAS_Localized["Jessara Cordell"] = "杰萨拉·考迪尔";
	FAS_Localized["Jinky Twizzlefixxit"] = "金克·铁钩";
	FAS_Localized["Joseph Moore"] = "约瑟夫·摩尔";
	FAS_Localized["Jubie Gadgetspring"] = "朱比";
	FAS_Localized["Jun'ha"] = "祖恩哈";
	FAS_Localized["Jutak"] = "祖塔克";
	FAS_Localized["Kaita Deepforge"] = "凯塔·深炉";
	FAS_Localized["Kalldan Felmoon"] = "卡尔丹·暗月";
	FAS_Localized["Keena"] = "基纳";
	FAS_Localized["Kelsey Yance"] = "凯尔希·杨斯";
	FAS_Localized["Kendor Kabonka"] = "肯多尔·卡邦卡";
	FAS_Localized["Khara Deepwater"] = "卡拉·深水";
	FAS_Localized["Kiknikle"] = "吉克尼库";
	FAS_Localized["Killian Sanatha"] = "基利恩·萨纳森";
	FAS_Localized["Kilxx"] = "基尔克斯";
	FAS_Localized["Kireena"] = "基瑞娜";
	FAS_Localized["Kithas"] = "基萨斯";
	FAS_Localized["Knaz Blunderflame"] = "克纳兹·枪焰";
	FAS_Localized["Kor'geld"] = "考吉尔德";
	FAS_Localized["Kriggon Talsone"] = "克雷贡·塔尔松";
	FAS_Localized["Krinkle Goodsteel"] = "克林科·古德斯迪尔";
	FAS_Localized["Kulwia"] = "库尔维亚";
	FAS_Localized["Kzixx"] = "卡兹克斯";
	FAS_Localized["Laird"] = "莱尔德";
	FAS_Localized["Lardan"] = "拉尔丹";
	FAS_Localized["Leo Sarn"] = "雷欧·萨恩";
	FAS_Localized["Leonard Porter"] = "莱纳德·波特";
	FAS_Localized["Lilly"] = "莉蕾";
	FAS_Localized["Lindea Rabonne"] = "林迪·拉波尼";
	FAS_Localized["Lizbeth Cromwell"] = "莉兹白·克伦威尔";
	FAS_Localized["Logannas"] = "洛加纳斯";
	FAS_Localized["Lokhtos Darkbargainer"] = "罗克图斯·暗契";
	FAS_Localized["Lorekeeper Lydros"] = "博学者莱德罗斯";
	FAS_Localized["Lorelae Wintersong"] = "罗莱尔·冬歌";
	FAS_Localized["Magnus Frostwake"] = "玛格努斯·霜鸣";
	FAS_Localized["Mahu"] = "曼胡";
	FAS_Localized["Mallen Swain"] = "玛林·斯万";
	FAS_Localized["Malygen"] = "玛里甘";
	FAS_Localized["Maria Lumere"] = "玛丽亚·卢米尔";
	FAS_Localized["Martine Tramblay"] = "马丁·塔布雷";
	FAS_Localized["Masat T'andr"] = "马萨特·坦德";
	FAS_Localized["Mathredis Firestar"] = "玛瑟迪斯·火芒";
	FAS_Localized["Mavralyn"] = "马弗拉林";
	FAS_Localized["Mazk Snipeshot"] = "玛兹克·斯奈普沙特";
	FAS_Localized["Meilosh"] = "梅罗什";
	FAS_Localized["Micha Yance"] = "米沙·杨斯";
	FAS_Localized["Millie Gregorian"] = "米利尔·格里高利";
	FAS_Localized["Montarr"] = "莫塔尔";
	FAS_Localized["Muuran"] = "穆尔兰";
	FAS_Localized["Mythrin'dir"] = "迈斯林迪尔";
	FAS_Localized["Naal Mistrunner"] = "纳尔·迷雾行者";
	FAS_Localized["Namdo Bizzfizzle"] = "纳姆杜";
	FAS_Localized["Nandar Branson"] = "南达·布拉森";
	FAS_Localized["Narj Deepslice"] = "纳尔基·长刀";
	FAS_Localized["Narkk"] = "纳尔克";
	FAS_Localized["Nata Dawnstrider"] = "纳塔·黎明行者";
	FAS_Localized["Nergal"] = "奈尔加";
	FAS_Localized["Nerrist"] = "耐里斯特";
	FAS_Localized["Nessa Shadowsong"] = "尼莎·影歌";
	FAS_Localized["Nina Lightbrew"] = "妮娜·莱特布鲁";
	FAS_Localized["Nioma"] = "尼奥玛";
	FAS_Localized["Nyoma"] = "奈欧玛";
	FAS_Localized["Ogg'marr"] = "奥克玛尔";
	FAS_Localized["Old Man Heming"] = "老人海明威";
	FAS_Localized["Outfitter Eric"] = "埃瑞克";
	FAS_Localized["Plugger Spazzring"] = "普拉格";
	FAS_Localized["Pratt McGrubben"] = "普拉特·马克格鲁比";
	FAS_Localized["Qia"] = "琦亚";
	FAS_Localized["Quartermaster Miranda Breechlock"] = "军需官米兰达·布利洛克";
	FAS_Localized["Ranik"] = "拉尼克";
	FAS_Localized["Rann Flamespinner"] = "拉恩·火翼";
	FAS_Localized["Rartar"] = "拉尔塔";
	FAS_Localized["Rikqiz"] = "雷克奇兹";
	FAS_Localized["Rin'wosho the Trader"] = "商人林沃斯";
	FAS_Localized["Rizz Loosebolt"] = "里兹·飞矢";
	FAS_Localized["Ronald Burch"] = "罗纳德·伯奇";
	FAS_Localized["Ruppo Zipcoil"] = "鲁普·火油";
	FAS_Localized["Saenorion"] = "塞诺里奥";
	FAS_Localized["Sewa Mistrunner"] = "苏瓦·迷雾行者";
	FAS_Localized["Shandrina"] = "珊蒂瑞亚";
	FAS_Localized["Shankys"] = "山吉斯";
	FAS_Localized["Sheendra Tallgrass"] = "希恩德拉·深草";
	FAS_Localized["Shen'dralar Provisioner"] = "辛德拉圣职者";
	FAS_Localized["Sheri Zipstitch"] = "舍瑞·希普斯迪";
	FAS_Localized["Soolie Berryfizz"] = "苏雷·浆泡";
	FAS_Localized["Sovik"] = "索维克";
	FAS_Localized["Stuart Fleming"] = "斯图亚特·弗雷明";
	FAS_Localized["Sumi"] = "苏米";
	FAS_Localized["Kania"] = "卡妮亚";
	FAS_Localized["Super-Seller 680"] = "超级商人680型";
	FAS_Localized["Tamar"] = "达玛尔";
	FAS_Localized["Tansy Puddlefizz"] = "坦斯·泥泡";
	FAS_Localized["Tari'qa"] = "塔里查";
	FAS_Localized["Thaddeus Webb"] = "萨德乌斯·韦伯";
	FAS_Localized["Tharynn Bouden"] = "萨瑞恩·博丁";
	FAS_Localized["Tilli Thistlefuzz"] = "提尔利·草须";
	FAS_Localized["Truk Wildbeard"] = "特鲁克·蛮鬃";
	FAS_Localized["Tunkk"] = "吞克";
	FAS_Localized["Ulthaan"] = "尤萨恩";
	FAS_Localized["Ulthir"] = "尤希尔";
	FAS_Localized["Uthok"] = "尤索克";
	FAS_Localized["Vaean"] = "维安";
	FAS_Localized["Valdaron"] = "瓦尔达隆";
	FAS_Localized["Veenix"] = "维尼克斯";
	FAS_Localized["Vendor-Tron 1000"] = "贸易机器人1000型";
	FAS_Localized["Vharr"] = "维哈尔";
	FAS_Localized["Vivianna"] = "薇薇安娜";
	FAS_Localized["Vizzklick"] = "维兹格里克";
	FAS_Localized["Wenna Silkbeard"] = "温纳·银须";
	FAS_Localized["Werg Thickblade"] = "维尔格·厚刃";
	FAS_Localized["Wik'Tar"] = "维克塔";
	FAS_Localized["Winterspring"] = "冬泉谷";
	FAS_Localized["Worb Strongstitch"] = "沃尔布";
	FAS_Localized["Wrahk"] = "瓦尔克";
	FAS_Localized["Wulan"] = "乌兰";
	FAS_Localized["Wunna Darkmane"] = "温纳·黑鬃";
	FAS_Localized["Xandar Goodbeard"] = "山达·细须";
	FAS_Localized["Xizk Goodstitch"] = "希兹克·古斯提";
	FAS_Localized["Xizzer Fizzbolt"] = "希兹尔·菲兹波特";
	FAS_Localized["Yonada"] = "犹纳达";
	FAS_Localized["Yuka Screwspigot"] = "尤卡·斯库比格特";
	FAS_Localized["Zan Shivsproket"] = "萨恩·刀链";
	FAS_Localized["Zannok Hidepiercer"] = "扎诺克";
	FAS_Localized["Zansoa"] = "詹苏尔";
	FAS_Localized["Zarena Cromwind"] = "萨瑞娜·克罗姆温德";
	FAS_Localized["Zargh"] = "扎尔夫";
	FAS_Localized["Zixil"] = "吉克希尔";

-- localized libram descriptions
	FAS_Localized["+8 any single stat"] = "+8 任何单一属性";
	FAS_Localized["+100 Health"] = "+100 生命值";
	FAS_Localized["+150 Mana"] = "+150 法力值";
	FAS_Localized["+20 Fire Resistance"] = "+20 火焰抗性";
	FAS_Localized["+125 Armor"] = "+125 护甲";
	FAS_Localized["+1% Haste"] = "+1% 加速";
	FAS_Localized["+1% Dodge"] = "+1% 躲闪";
	FAS_Localized["+8 Spell damage/healing"] = "+8 法术伤害和治疗";

-- localized special raid loot tokens
	FAS_Localized["Zulian Coin"]		=	"祖利安硬币";
	FAS_Localized["Razzashi Coin"]		=	"拉扎什硬币";
	FAS_Localized["Hakkari Coin"]		=	"哈卡莱硬币";
	FAS_Localized["Gurubashi Coin"]		=	"古拉巴什硬币";
	FAS_Localized["Vilebranch Coin"]	=	"邪枝硬币";
	FAS_Localized["Witherbark Coin"]	=	"枯木硬币";
	FAS_Localized["Sandfury Coin"]		=	"沙怒硬币";
	FAS_Localized["Skullsplitter Coin"]	=	"碎颅硬币";
	FAS_Localized["Bloodscalp Coin"]	=	"血顶硬币";
            
	FAS_Localized["Red Hakkari Bijou"]		=	"红色哈卡莱宝石";
	FAS_Localized["Blue Hakkari Bijou"]		=	"蓝色哈卡莱宝石";
	FAS_Localized["Yellow Hakkari Bijou"]	=	"黄色哈卡莱宝石";
	FAS_Localized["Orange Hakkari Bijou"]	=	"橙色哈卡莱宝石";
	FAS_Localized["Green Hakkari Bijou"]	=	"绿色哈卡莱宝石";
	FAS_Localized["Purple Hakkari Bijou"]	=	"紫色哈卡莱宝石";
	FAS_Localized["Bronze Hakkari Bijou"]	=	"青铜哈卡莱宝石";
	FAS_Localized["Silver Hakkari Bijou"]	=	"银色哈卡莱宝石";
	FAS_Localized["Gold Hakkari Bijou"]		=	"金色哈卡莱宝石";
            
	FAS_Localized["Primal Hakkari Bindings"]	=	"原始哈卡莱护腕";
	FAS_Localized["Primal Hakkari Armsplint"]	=	"原始哈卡莱护臂";
	FAS_Localized["Primal Hakkari Stanchion"]	=	"原始哈卡莱直柱";
	FAS_Localized["Primal Hakkari Girdle"]		=	"原始哈卡莱束带";
	FAS_Localized["Primal Hakkari Sash"]		=	"原始哈卡莱腰带";
	FAS_Localized["Primal Hakkari Shawl"]		=	"原始哈卡莱披肩";
	FAS_Localized["Primal Hakkari Tabard"]		=	"原始哈卡莱徽章";
	FAS_Localized["Primal Hakkari Kossack"]		=	"原始哈卡莱套索";
	FAS_Localized["Primal Hakkari Aegis"]		=	"原始哈卡莱之盾";
            
	FAS_Localized["Qiraji Magisterial Ring"]	=	"其拉将领戒指";
	FAS_Localized["Qiraji Ceremonial Ring"]		=	"其拉典礼戒指";
	FAS_Localized["Qiraji Martial Drape"]		=	"其拉军用披风";
	FAS_Localized["Qiraji Regal Drape"]			=	"其拉帝王披风";
	FAS_Localized["Qiraji Spiked Hilt"]			=	"其拉尖刺刀柄";
	FAS_Localized["Qiraji Ornate Hilt"]			=	"其拉装饰刀柄";
            
	FAS_Localized["Imperial Qiraji Armaments"]	=	"其拉帝王武器";
	FAS_Localized["Imperial Qiraji Regalia"]	=	"其拉帝王徽记";
            
	FAS_Localized["Qiraji Bindings of Command"]		=	"其拉命令腕轮";
    FAS_Localized["Qiraji Bindings of Dominance"]	=	"其拉统御腕轮";
	FAS_Localized["Ouro's Intact Hide"]				=	"奥罗的外皮";
	FAS_Localized["Skin of the Great Sandworm"]		=	"巨型沙虫的皮";
	FAS_Localized["Vek'lor's Diadem"]				=	"维克洛尔的王冠";
	FAS_Localized["Vek'nilash's Circlet"]			=	"维克尼拉斯的头饰";
	FAS_Localized["Carapace of the Old God"]		=	"上古之神的甲壳";
	FAS_Localized["Husk of the Old God"]			=	"上古之神的外鞘";
            
	FAS_Localized["Stone Scarab"]	=	"岩石甲虫";
	FAS_Localized["Gold Scarab"]	=	"黄金甲虫";
	FAS_Localized["Silver Scarab"]	=	"银质甲虫";
	FAS_Localized["Bronze Scarab"]	=	"青铜甲虫";
	FAS_Localized["Crystal Scarab"]	=	"水晶甲虫";
	FAS_Localized["Clay Scarab"]	=	"陶土甲虫";
	FAS_Localized["Bone Scarab"]	=	"白骨甲虫";
	FAS_Localized["Ivory Scarab"]	=	"象牙甲虫";
            
	FAS_Localized["Azure Idol"]			=	"碧蓝雕像";
	FAS_Localized["Onyx Idol"]			=	"玛瑙雕像";
	FAS_Localized["Lambent Idol"]		=	"柔光雕像";
	FAS_Localized["Amber Idol"]			=	"琥珀雕像";
	FAS_Localized["Jasper Idol"]		=	"翠玉雕像";
	FAS_Localized["Obsidian Idol"]		=	"黑曜石雕像";
	FAS_Localized["Vermillion Idol"]	=	"朱红雕像";
	FAS_Localized["Alabaster Idol"]		=	"雪白雕像";
            
	FAS_Localized["Idol of the Sun"]	=	"太阳塑像";
	FAS_Localized["Idol of Night"]		=	"夜晚塑像";
	FAS_Localized["Idol of Death"]		=	"死亡塑像";
	FAS_Localized["Idol of the Sage"]	=	"先知塑像";
	FAS_Localized["Idol of Rebirth"]	=	"复生塑像";
	FAS_Localized["Idol of Life"]		=	"生命塑像";
	FAS_Localized["Idol of Strife"]		=	"征战塑像";
	FAS_Localized["Idol of War"]		=	"战争塑像";
