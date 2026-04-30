-- 确保即使AutoMarkerLocale未定义也能正常工�?
local L = AutoMarkerLocale or setmetatable({}, {
    __index = function(t, k)
        -- 如果键不存在，直接返回键本身作为默认�?
        return k
    end
})
local SKULL    = 8
local CROSS    = 7
local SQUARE   = 6
local MOON     = 5
local TRIANGLE = 4
local DIAMOND  = 3
local CIRCLE   = 2
local STAR     = 1
local UNMARKED = 0
defaultNpcsToMark = {}
orderedPacks = {}
--[[
一�?ID，例�?Anub 的小怪、Raz 的小怪、Faerlina 的小怪和 Buru 的小怪，是有趣且特殊的�?
事实上，它们彼此之间是特别的，每�?Boss �?ID 的一致性方面都有不同的行为�?
�?Buru 的蛋在战斗中死亡时，ID 计数会多次增加。死亡后不久，会创建一�?ID 高一的生成器，当蛋再次生成时，它�?ID 将高于生成器�?ID。如果多个蛋同时死亡，这�?ID 的增加可能会被扩展并变得有些不可预测�?
一个机制可以检测标记蛋的死亡顺序，并按照最终重生的顺序重新应用标记�?
Anub'rekhan 的小怪在每次副本开始时总是�?ID，而并不一致。当战斗重置时，它们将再次是新的�?
一个机制可以检测到他的两个小怪重新生成的情况�?
Raz 的小怪在副本开始时有一个一致的标记，但每次战斗重置时，小怪都会一个一个以顺时针的顺序重新生成新的 ID�?
一个机制可以检测到他的四个小怪重新生成的情况�?
Skeram 在进行三路分裂时会生成克隆，但他自己�?ID 从未改变�?
一个机制可以检测到他的三个小怪重新生成的情况，因为它们都共享相同的名称�?
Arlokk 并没有确切的小怪可以标记，但她在战斗中会消失�?
用于检测一个小怪重新生成的机制被用来重新标记她�?
Faerlina 的小怪如果没有死亡，则在战斗重置时不会重新生成，也不会获得新�?ID，它们只是回到起始位置，
然而，死亡的小怪将获得新的 ID�?
一个类似于 Buru 蛋的机制可以用来更新它们，跟踪标记死亡的顺序，假设它们在标记未释放时重新生成�?
如果 它们的新 ID 之间有任何一致性，可以使用复合方法�?
我们可以在房间中复活时进行排队，或在我们跑回她那里时检测小怪的 ID，并利用�?ID 较高的事实，
可以基于识别缺少标记的小怪重新标记，然后比较它们的死亡顺序与已排序的 ID�?
或者，我们可以每次看到新的小怪时进行一次全面的重新标记，尽管标记不会保持一致�?
--]]
-- Function to add entries while maintaining order
function addToDefaultNpcsToMark(instance, packName, npcs)
    if not defaultNpcsToMark[instance] then
        defaultNpcsToMark[instance] = {}
    end
    defaultNpcsToMark[instance][packName] = npcs
    table.insert(orderedPacks, {instance = instance, packName = packName})
end
addToDefaultNpcsToMark("Orgrimmar", "org_dummies", {
  ["0xF13000C55326FDD0"] = SKULL,
  ["0xF13000C55226FDCE"] = SQUARE,
  ["0xF13000C55426FE5A"] = CROSS,
})
--/////////////// Naxxramas ///////////////
defaultNpcsToMark[L["Naxxramas"]] = {}
--/////////////// SPIDER ///////////////
addToDefaultNpcsToMark(L["Naxxramas"], "spider_entrance_patrol", {
  ["0xF130003E69269C39"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C38"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C37"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C36"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C35"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C34"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C33"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C32"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C05"] = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C0F"] = STAR, -- Infectious Skitterer
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_entrance_right", {
  ["0xF130003E680158F6"]  = SKULL, -- Venom Stalker
  ["0xF130003E6601590E"]  = CROSS, -- Dread Creeper
  ["0xF130003E6601590F"]  = SQUARE, -- Dread Creeper
  ["0xF130003E670158F4"]  = MOON, -- Carrion Spinner
  ["0xF130003E670158F5"]  = TRIANGLE, -- Carrion Spinner
  ["0xF130003E670158F3"]  = DIAMOND, -- Carrion Spinner
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_entrance_left", {
  ["0xF130003E680158F7"]  = SKULL, -- Venom Stalker
  ["0xF130003E66015911"]  = CROSS, -- Dread Creeper
  ["0xF130003E66015910"]  = SQUARE, -- Dread Creeper
  ["0xF130003E670158F9"]  = MOON, -- Carrion Spinner
  ["0xF130003E670158FA"]  = TRIANGLE, -- Carrion Spinner
  ["0xF130003E670158F8"]  = DIAMOND, -- Carrion Spinner
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_anubrekhan_hallway", {
  ["0xF130003E68015917"]  = SKULL, -- Venom Stalker
  ["0xF130003E66015912"]  = CROSS, -- Dread Creeper
  ["0xF130003E66015913"]  = SQUARE, -- Dread Creeper
  ["0xF130003E67015914"]  = MOON, -- Carrion Spinner
  ["0xF130003E67015915"]  = TRIANGLE, -- Carrion Spinner
  ["0xF130003E67015916"]  = DIAMOND, -- Carrion Spinner
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_anubrekhan", {
  ["0xF130003E5401591A"]  = SKULL, -- Anub'Rekhan
  ["0xF1300040BD04B2DF"]  = CROSS, -- Crypt Guard
  ["0xF1300040BD04B2DE"]  = SQUARE, -- Crypt Guard
  ["0xF1300040BD2787BC"]  = TRIANGLE, -- Crypt Guard
  ["0xF1300040BD2787BB"]  = DIAMOND, -- Crypt Guard
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_central_right", {
  ["0xF130003E6A0159DF"]  = SKULL, -- Crypt Reaver
  ["0xF130003E67269C2D"]  = CROSS, -- Carrion Spinner
  ["0xF130003E67269C2C"]  = SQUARE, -- Carrion Spinner
  ["0xF130003E67269C2B"]  = TRIANGLE, -- Carrion Spinner
  ["0xF130003E67269C2A"]  = DIAMOND, -- Carrion Spinner
  ["0xF130003E670159F3"]  = MOON, -- Carrion Spinner
  ["0xF130003E670159F4"]  = CIRCLE, -- Carrion Spinner
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_central_patrol", {
  ["0xF130003E69269C0B"]  = STAR, -- Infectious Skitterer
  ["0xF130003E69269C0C"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C13"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C12"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C11"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C10"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C0E"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69269C0D"]  = UNMARKED, -- Infectious Skitterer
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_necro_1", {
  ["0xF130004045015A20"]  = SKULL, -- Necro Stalker
  ["0xF130004045015A1F"]  = CROSS, -- Necro Stalker
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_necro_2", {
  ["0xF130004045269C25"]  = SKULL, -- Necro Stalker
  ["0xF130004045269C24"]  = CROSS, -- Necro Stalker
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_faerlina_patrol", {
  ["0xF130003E69049D6A"]  = STAR, -- Infectious Skitterer
  ["0xF130003E69049D6B"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69049D6C"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69049D69"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69049D68"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69049D67"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69049D66"]  = UNMARKED, -- Infectious Skitterer
  ["0xF130003E69049D65"]  = UNMARKED, -- Infectious Skitterer
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_faerlina_left_1", {
  ["0xF130003E6D269BFD"] = CROSS, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269C02"] = CIRCLE,-- 纳克萨玛斯信徒z
  -- ["0xF130003E6C269BFE"] = TRIANGLE,-- 纳克萨玛斯信�?
  ["0xF130003E6D269C01"] = MOON, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BFC"] = STAR,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BFB"] = SQUARE, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269C00"] = DIAMOND,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BFF"] = SKULL, -- 纳克萨玛斯侍�?
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_faerlina_left_2", {
  ["0xF130003E6D269BFA"] = MOON, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BF5"] = CIRCLE, -- 纳克萨玛斯信�?
  -- ["0xF130003E6C269BF3"] = TRIANGLE,-- 纳克萨玛斯信�?
  -- ["0xF130003E6C269BF7"] = DIAMOND,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BF8"] = SQUARE, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BF9"] = STAR,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BF4"] = SKULL, -- 纳克萨玛斯侍�?
  ["0xF130003E6D269BF6"] = CROSS, -- 纳克萨玛斯侍�?
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_faerlina_left_3", {
  -- ["0xF130003E6C269BDA"] = STAR,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BD9"] = SQUARE, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BD8"] = DIAMOND,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BD7"] = SKULL, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BD6"] = CIRCLE,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BD5"] = CROSS, -- 纳克萨玛斯侍�?
  ["0xF130003E6D269BD4"] = MOON, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BD3"] = TRIANGLE,-- 纳克萨玛斯信�?
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_faerlina_right_1", {
  ["0xF130003E6D269BE2"] = SQUARE, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BE1"] = DIAMOND,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BE0"] = CROSS, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BDF"] = TRIANGLE,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BDE"] = MOON, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BDD"] = CIRCLE,-- 纳克萨玛斯信�?
  -- ["0xF130003E6C269BDC"] = STAR,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BDB"] = SKULL, -- 纳克萨玛斯侍�?
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_faerlina_right_2", {
  -- ["0xF130003E6C269BE3"] = CIRCLE,-- 纳克萨玛斯信�?
  -- ["0xF130003E6C269BE5"] = DIAMOND,-- 纳克萨玛斯信�?
  -- ["0xF130003E6C269BE7"] = STAR,-- 纳克萨玛斯信�?
  -- ["0xF130003E6C269BE9"] = TRIANGLE,-- 纳克萨玛斯信�?
  ["0xF130003E6D269BE8"] = CROSS, -- 纳克萨玛斯侍�?
  ["0xF130003E6D269BE6"] = UNMARKED, -- 纳克萨玛斯侍�?
  ["0xF130003E6D269BEA"] = SQUARE, -- 纳克萨玛斯侍�?

  ["0xF130003E6D269BE4"] = SKULL, -- 纳克萨玛斯侍�?
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_faerlina_right_3", {
  ["0xF130003E6D269BED"] = SQUARE, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BF0"] = DIAMOND, -- 纳克萨玛斯信�?
  ["0xF130003E6D269BF1"] = MOON, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BF2"] = STAR, -- 纳克萨玛斯信�?
  ["0xF130003E6D269BEB"] = SKULL, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BEC"] = TRIANGLE, -- 纳克萨玛斯信�?
  ["0xF130003E6D269BEF"] = CROSS, -- 纳克萨玛斯侍�?
  -- ["0xF130003E6C269BEE"] = CIRCLE, -- 纳克萨玛斯信�?
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_faerlina", {
  ["0xF130003E510159B0"] = TRIANGLE, -- Grand Widow Faerlina

  ["0xF1300040792787B5"] = SKULL, -- Naxxramas Follower (组内序号1)
  ["0xF1300040792787B6"] = CROSS, -- Naxxramas Follower (组内序号2)
  ["0xF13000407A2787B8"] = SQUARE, -- Naxxramas Worshipper (组内序号3)
  ["0xF13000407A2787B7"] = CIRCLE, -- Naxxramas Worshipper (组内序号4)
  ["0xF13000407A2787B9"] = MOON, -- Naxxramas Worshipper (组内序号5)
  ["0xF13000407A2787BA"] = STAR, -- Naxxramas Worshipper (组内序号6)
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_final", {
  ["0xF130003E66269C1A"] = CROSS, -- Dread Creeper
  ["0xF130003E66269C18"] = TRIANGLE, -- Dread Creeper
  ["0xF130003E66015A2F"] = SQUARE, -- Dread Creeper
  ["0xF130003E66269C19"] = MOON, -- Dread Creeper
  ["0xF130003E6B01F3EE"] = SKULL, -- Tomb Horror
})
addToDefaultNpcsToMark(L["Naxxramas"],"spider_ring_ghouls_1", {
  ["0xF13000403F269C03"] = SKULL,
  ["0xF13000403F269C04"] = SQUARE,
  ["0xF13000403F269C06"] = CROSS,
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_ring_pats", {
  ["0xF130003FF0015AD7"] = CROSS, -- Necropolis Acolyte
  ["0xF130003FF0015AD8"] = SKULL, -- Necropolis Acolyte
  ["0xF130004045269C07"] = CIRCLE, -- Necro Stalker
  ["0xF130004045269C08"] = UNMARKED, -- Necro Stalker
  ["0xF130004045269C09"] = UNMARKED, -- Necro Stalker
  ["0xF130004045269C0A"] = STAR, -- Necro Stalker
  ["0xF13000403E269C44"] = UNMARKED, -- Plagued Gargoyle
  ["0xF13000403E269C45"] = TRIANGLE, -- Plagued Gargoyle
  ["0xF13000403E269C43"] = DIAMOND, -- Plagued Gargoyle
  ["0xF13000403E015B18"] = UNMARKED, -- Plagued Gargoyle
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_ring_acolyte_2", {
  ["0xF130003FF0015AD5"] = CROSS, -- Necropolis Acolyte
  ["0xF130003FF0015AD6"] = SKULL, -- Necropolis Acolyte
})
addToDefaultNpcsToMark(L["Naxxramas"], "spider_ring_acolyte_3", {
  ["0xF130003FF0015AD4"]  = SKULL, -- Necropolis Acolyte
  ["0xF130003FF0015AD3"]  = CROSS, -- Necropolis Acolyte
})
----/////////////// MILITARY ///////////////
addToDefaultNpcsToMark(L["Naxxramas"], "military_entrance_middle", {
  ["0xF130003F1101594B"]  = SKULL, -- Deathknight Captain
  ["0xF130003F1101594C"]  = CROSS, -- Deathknight Captain
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_entrance_left", {
  ["0xF130003F1201594A"]  = SKULL, -- Deathknight
  ["0xF130003F1A015950"]  = CROSS, -- Risen Deathknight
  ["0xF130003F1A015951"]  = SQUARE, -- Risen Deathknight
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_entrance_right", {
  ["0xF130003F12015949"]  = SKULL, -- Deathknight
  ["0xF130003F1A015953"]  = CROSS, -- Risen Deathknight
  ["0xF130003F1A015952"]  = SQUARE, -- Risen Deathknight
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_entrance_patrol", {
  ["0xF130003F2401594D"]  = SKULL, -- Shade of Naxxramas
  ["0xF130003F2501594F"]  = CROSS, -- Necro Knight
  ["0xF130003F2501594E"]  = SQUARE, -- Necro Knight
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_static_1", {
  ["0xF130003F12015967"]  = SKULL, -- Deathknight
  ["0xF130003F1C015956"]  = CROSS, -- Dark Touched Warrior
  ["0xF130003F1E015955"]  = SQUARE, -- Death Touched Warrior
  ["0xF130003F11015954"]  = MOON, -- Deathknight Captain
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_forge_captains", {
  ["0xF130003F11015968"]  = SKULL, -- 死亡骑士队长
  ["0xF130003F11015969"]  = CROSS, -- 死亡骑士队长
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_forge_shade_patrol", {
  ["0xF130003F24015957"]  = STAR, -- Shade of Naxxramas
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_forge_shades", {
  ["0xF130003F24015961"]  = SKULL, -- 纳克萨玛斯之�?
  ["0xF130003F24015960"]  = CROSS, -- 纳克萨玛斯之�?
  ["0xF130003F2501596A"]  = SQUARE, -- 死灵骑士
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_forge_constructs", {
  ["0xF130003F27015962"]  = SKULL, -- 白骨构造体
  ["0xF130003F27015963"]  = CROSS, -- 白骨构造体
  ["0xF130003F27015964"]  = SQUARE, -- 白骨构造体
  ["0xF130003F27015965"]  = MOON, -- 白骨构造体
  ["0xF130003F27015966"]  = TRIANGLE, -- 白骨构造体
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_forge_smiths", {
  ["0xF130003F4101595A"]  = SKULL, -- 骷髅铁匠
  ["0xF130003F41015958"]  = CROSS, -- 骷髅铁匠
  ["0xF130003F41015959"]  = SQUARE, -- 骷髅铁匠
  ["0xF130003F4101595B"]  = MOON, -- 骷髅铁匠
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_static_2", {
  ["0xF130003F1201595E"]  = SKULL, -- Deathknight
  ["0xF130003F1201595D"]  = CROSS, -- Deathknight
  ["0xF130003F1101595C"]  = SQUARE, -- Deathknight Captain
  ["0xF130003F1101595F"]  = MOON, -- Deathknight Captain
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_static_3", {
  ["0xF130003F1201596E"]  = SKULL, -- Deathknight
  ["0xF130003F1C01596B"]  = CROSS, -- Dark Touched Warrior
  ["0xF130003F1D01596C"]  = SQUARE, -- Doom Touched Warrior
  ["0xF130003F1101596D"]  = MOON, -- Deathknight Captain
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_upper_patrol", {
  ["0xF130003F12015978"]  = SKULL, -- Deathknight
  ["0xF130003F1E01597A"]  = CROSS, -- Death Touched Warrior
  ["0xF130003F1E015979"]  = SQUARE, -- Death Touched Warrior
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_static_4", {
  ["0xF130003F12015973"]  = SKULL, -- Deathknight
  ["0xF130003F12015972"]  = CROSS, -- Deathknight
  ["0xF130003F1101596F"]  = SQUARE, -- Deathknight Captain
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_static_5", {
  ["0xF130003F12015975"]  = SKULL, -- Deathknight
  ["0xF130003F12015974"]  = CROSS, -- Deathknight
  ["0xF130003F11015970"]  = SQUARE, -- Deathknight Captain
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_static_6", {
  ["0xF130003F12015977"]  = SKULL, -- Deathknight
  ["0xF130003F12015976"]  = CROSS, -- Deathknight
  ["0xF130003F11015971"]  = SQUARE, -- Deathknight Captain
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_static_7", {
  ["0xF130003F1201597C"]  = SKULL, -- Deathknight
  ["0xF130003F1E01597B"]  = CROSS, -- Death Touched Warrior
  ["0xF130003F1D01597E"]  = SQUARE, -- Doom Touched Warrior
  ["0xF130003F1101597D"]  = MOON, -- Deathknight Captain
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_horse_duo", {
  ["0xF130003F23269C6E"]  = SKULL, -- Deathknight Cavalier
  ["0xF130003F23269C6D"]  = CROSS, -- Deathknight Cavalier
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_horse_1", {
  ["0xF130003F2301597F"]  = SKULL, -- Deathknight Cavalier
  ["0xF130003F1E015982"]  = CROSS, -- Death Touched Warrior
  ["0xF130003F1E015981"]  = SQUARE, -- Death Touched Warrior
  ["0xF130003F1E015989"]  = MOON, -- Death Touched Warrior
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_horse_2", {
  ["0xF130003F23015980"]  = SKULL, -- Deathknight Cavalier
  ["0xF130003F1C015983"]  = CROSS, -- Dark Touched Warrior
  ["0xF130003F1C015984"]  = SQUARE, -- Dark Touched Warrior
  ["0xF130003F1D015985"]  = MOON, -- Doom Touched Warrior
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_horse_3", {
  ["0xF130003F23269C6C"]  = SKULL, -- Deathknight Cavalier
  ["0xF130003F1C015988"]  = CROSS, -- Dark Touched Warrior
  ["0xF130003F1A015987"]  = SQUARE, -- Risen Deathknight
  ["0xF130003F1A015986"]  = MOON, -- Risen Deathknight
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_horse_trio", {
  ["0xF1300041DD082208"]  = SKULL, -- Death Lord
  ["0xF130003F23015992"]  = CROSS, -- Deathknight Cavalier
  ["0xF130003F23015991"]  = SQUARE, -- Deathknight Cavalier
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_horse_4", {
  ["0xF130003F23015993"]  = SKULL, -- Deathknight Cavalier
  ["0xF130003F1C01598A"]  = CROSS, -- Dark Touched Warrior
  ["0xF130003F1C01598B"]  = SQUARE, -- Dark Touched Warrior
  ["0xF130003F1D01598C"]  = MOON, -- Doom Touched Warrior
})

addToDefaultNpcsToMark(L["Naxxramas"], "military_weps_1", {
  ["0xF130003F4201F334"]  = SKULL, -- Unholy Axe
  ["0xF130003F4201F335"]  = CROSS, -- Unholy Axe
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_weps_2", {
  ["0xF130003F5801F350"]  = SKULL, -- Unholy Swords
  ["0xF130003F4201F336"]  = CROSS, -- Unholy Axe
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_weps_3", {
  ["0xF130003F5801F34F"]  = SKULL, -- Unholy Swords
  ["0xF130003F4201F337"]  = CROSS, -- Unholy Axe
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_weps_4", {
  ["0xF130003F5701F34A"]  = SKULL, -- Unholy Staff
  ["0xF130003F4201F333"]  = CROSS, -- Unholy Axe
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_weps_5", {
  ["0xF130003F5701F34B"]  = SKULL, -- Unholy Staff
  ["0xF130003F57269C68"]  = CROSS, -- Unholy Staff
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_gothik_horses", {
  ["0xF130003F2301599A"]  = SKULL, -- Deathknight Cavalier
  ["0xF130003F23015999"]  = CROSS, -- Deathknight Cavalier
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_gothik_shade", {
  ["0xF130003F24015996"]  = SKULL, -- Shade of Naxxramas
  ["0xF130003F25015998"]  = CROSS, -- Necro Knight
  ["0xF130003F25015997"]  = SQUARE, -- Necro Knight
})
addToDefaultNpcsToMark(L["Naxxramas"], "gothick_ring_ghouls", {
  ["0xF13000403F015B30"] = SQUARE, -- Plagued Ghoul
  ["0xF13000403F015B33"] = SKULL, -- Plagued Ghoul
  ["0xF13000403F015B31"] = MOON, -- Plagued Ghoul
  ["0xF13000403F015B32"] = CROSS, -- Plagued Ghoul
})
addToDefaultNpcsToMark(L["Naxxramas"], "gothick_ring_horse", {
  ["0xF130004044015ADC"] = SKULL, -- Necro Knight
  ["0xF130004044015ADD"] = CROSS, -- Necro Knight
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_ring_acolyte_1", {
  ["0xF130003FF0015AD9"]  = SKULL, -- Necropolis Acolyte
  ["0xF130003FF0015ADA"]  = CROSS, -- Necropolis Acolyte
  ["0xF130004043015ADB"]  = DIAMOND, -- Deathknight Vindicator
  ["0xF13000403E015B42"]  = TRIANGLE, -- Plagued Gargoyle
  ["0xF13000403E269C6F"]  = UNMARKED, -- Plagued Gargoyle
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_ring_acolyte_2", {
  ["0xF130003FF0015ADE"]  = SKULL, -- Necropolis Acolyte
  ["0xF130003FF0015ADF"]  = CROSS, -- Necropolis Acolyte
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_ring_acolyte_3", {
  ["0xF130003FF0015AE0"]  = SKULL, -- Necropolis Acolyte
  ["0xF130003FF0015AE1"]  = CROSS, -- Necropolis Acolyte
})
addToDefaultNpcsToMark(L["Naxxramas"], "military_ring_four_horsemen", {
  ["0xF130003EBE015AB3"]  = SKULL, -- Highlord Mograine
  ["0xF130003EC0015AB0"]  = CROSS, -- Thane Korth'azz
  ["0xF130003EBF015AB2"]  = SQUARE, -- Sir Zeliak
  ["0xF130003EC1015AB1"]  = MOON, -- Lady Blaumeux
})
----/////////////// PLAGUE ///////////////
addToDefaultNpcsToMark(L["Naxxramas"], "plague_1", {
  ["0xF130003F2801581F"] = CIRCLE, -- Stoneskin Gargoyle (patrol)
  ["0xF130003F74015811"] = SQUARE, -- Infectious Ghoul
  ["0xF130003F74015813"] = CROSS, -- Infectious Ghoul
  ["0xF130003F74015812"] = SKULL, -- Infectious Ghoul
  ["0xF130003F73015810"] = MOON, -- Plague Slime
  ["0xF130003F7301580F"] = STAR, -- Plague Slime
})
addToDefaultNpcsToMark(L["Naxxramas"], "plague_2", {
  ["0xF130003F73015817"] = MOON, -- Plague Slime
  ["0xF130003F73015816"] = STAR, -- Plague Slime
  ["0xF130003F74015814"] = SQUARE, -- Infectious Ghoul
  ["0xF130003F74015815"] = CROSS, -- Infectious Ghoul
  ["0xF130003F74015818"] = SKULL, -- Infectious Ghoul
})
addToDefaultNpcsToMark(L["Naxxramas"], "plague_gargs", {
  ["0xF130003F2801581E"] = STAR, -- pat
  ["0xF130003F2801581C"] = SKULL, -- stone1_right
  ["0xF130003F2801581D"] = CROSS,
  ["0xF130003F28015820"] = SQUARE, -- stone2_right
  ["0xF130003F28015821"] = MOON,
  ["0xF130003F28015822"] = TRIANGLE, -- stone3_right
  ["0xF130003F28015823"] = DIAMOND,
})
----/////////////// CONSTRUCT ///////////////
addToDefaultNpcsToMark(L["Naxxramas"], "construct_entrance", {
  ["0xF130003E910158C7"]  = SKULL, -- Patchwork Golem
  ["0xF130003E910158C6"]  = CROSS, -- Patchwork Golem
  ["0xF130003E910158C5"]  = SQUARE, -- Patchwork Golem
  ["0xF130003E910158C8"]  = MOON, -- Patchwork Golem
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_entrance_patrol", {
  ["0xF130003E920158CD"]  = TRIANGLE, -- Bile Retcher
  ["0xF130003E920158CE"]  = DIAMOND, -- Bile Retcher
  ["0xF130003E9D015A90"]  = CIRCLE, -- Sludge Belcher
  ["0xF130003E9D015A91"]  = STAR, -- Sludge Belcher
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_central_left", {
  ["0xF130003E920158CF"]  = SKULL, -- Bile Retcher
  ["0xF130003E910158CA"]  = CROSS, -- Patchwork Golem
  ["0xF130003E910158C9"]  = SQUARE, -- Patchwork Golem
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_central_right", {
  ["0xF130003E920158D0"]  = SKULL, -- Bile Retcher
  ["0xF130003E910158CB"]  = CROSS, -- Patchwork Golem
  ["0xF130003E910158CC"]  = SQUARE, -- Patchwork Golem
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_central", {
  ["0xF130003E910158D8"]  = SKULL, -- Patchwork Golem
  ["0xF130003E910158D7"]  = CROSS, -- Patchwork Golem
  ["0xF130003E910158D6"]  = SQUARE, -- Patchwork Golem
  ["0xF130003E910158D9"]  = MOON, -- Patchwork Golem
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_patchwerk_patrol", {
  ["0xF130003E92015A93"]  = SKULL, -- Bile Retcher
  ["0xF130003E92015A8E"]  = TRIANGLE, -- Bile Retcher
  ["0xF130003E9D015A92"]  = CIRCLE, -- Sludge Belcher
  ["0xF130003E92015A8F"]  = STAR, -- Bile Retcher
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_scientist_1", {
  ["0xF130003E95269C46"] = SKULL, -- Living Monstrosity
  ["0xF130003E94269C4B"] = MOON, -- Mad Scientist
  ["0xF130003E94269C4C"] = SQUARE, -- Mad Scientist
  ["0xF130003E94269C4D"] = CROSS, -- Mad Scientist
  ["0xF130003E94269C4E"] = DIAMOND, -- Mad Scientist
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_scientist_2", {
  ["0xF130003E95269C4F"] = SKULL, -- Living Monstrosity
  ["0xF130003E94015AA1"] = MOON, -- Mad Scientist
  ["0xF130003E94015AA0"] = SQUARE, -- Mad Scientist
  ["0xF130003E94015A9F"] = CROSS, -- Mad Scientist
  ["0xF130003E94015A9E"] = DIAMOND, -- Mad Scientist
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_patchwerk", {
  ["0xF130003E91015A96"]  = SKULL, -- Patchwork Golem
  ["0xF130003E91015A94"]  = CROSS, -- Patchwork Golem
  ["0xF130003E91015A97"]  = SQUARE, -- Patchwork Golem
  ["0xF130003E91015A95"]  = MOON, -- Patchwork Golem
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_scientist_3", {
  ["0xF130003E95269C54"] = SKULL, -- Living Monstrosity
  ["0xF130003E94269C5C"] = MOON, -- Mad Scientist
  ["0xF130003E94269C5B"] = SQUARE, -- Mad Scientist
  ["0xF130003E94269C59"] = CROSS, -- Mad Scientist
  ["0xF130003E94269C5A"] = DIAMOND, -- Mad Scientist
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_scientist_4", {
  ["0xF130003E95269C5D"]  = SKULL, -- Living Monstrosity
  ["0xF130003E94269C61"]  = MOON, -- Mad Scientist
  ["0xF130003E94269C60"]  = SQUARE, -- Mad Scientist
  ["0xF130003E94269C5F"]  = CROSS, -- Mad Scientist
  ["0xF130003E94269C5E"]  = DIAMOND, -- Mad Scientist
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_scientist_5", {
  ["0xF130003E95269C66"] = SKULL, -- Living Monstrosity
  ["0xF130003E94015A85"] = MOON, -- Mad Scientist
  ["0xF130003E94015A86"] = SQUARE, -- Mad Scientist
  ["0xF130003E94015A87"] = CROSS, -- Mad Scientist
  ["0xF130003E94015A88"] = DIAMOND, -- Mad Scientist
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_grobb_entrance", {
  ["0xF130003E990158F2"]  = SKULL, -- Stitched Spewer
  ["0xF130003E990158F1"]  = CROSS, -- Stitched Spewer
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_grobb_left", {
  ["0xF130003E990158EC"]  = SKULL, -- Stitched Spewer
  ["0xF130003E990158EB"]  = CROSS, -- Stitched Spewer
})
addToDefaultNpcsToMark(L["Naxxramas"], "construct_grobb_far", {
  ["0xF130003E990158ED"]  = SKULL, -- Stitched Spewer
  ["0xF130003E99269D08"]  = CROSS, -- Stitched Spewer -- is this changing weekly?
  ["0xF130003E990158EE"]  = SQUARE, -- Stitched Spewer
})
--/////////////// AQ40 ///////////////
defaultNpcsToMark[L["Ahn'Qiraj"]] = {}
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "entrance_1", {
  ["0xF130003BA0015613"]  = SKULL, -- Anubisath Sentinel
  ["0xF130003BA0015610"]  = MOON, -- Anubisath Sentinel
  ["0xF130003BA0015611"]  = SQUARE, -- Anubisath Sentinel
  ["0xF130003BA0015612"]  = CROSS, -- Anubisath Sentinel
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "entrance_2", {
  ["0xF130003BA001560C"]  = SKULL, -- Anubisath Sentinel
  ["0xF130003BA001560D"]  = CROSS, -- Anubisath Sentinel
  ["0xF130003BA001560F"]  = MOON, -- Anubisath Sentinel
  ["0xF130003BA001560E"]  = SQUARE, -- Anubisath Sentinel
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "entrance_patrols", {
  ["0xF130003B9E130799"] = STAR, -- Obsidian Eradicator
  ["0xF130003B9E01580A"] = TRIANGLE, -- Obsidian Eradicator
  ["0xF130003B9E13079A"] = DIAMOND, -- Obsidian Eradicator
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "skeram", {
  ["0xF130003B9F01580B"]  = SQUARE, -- Skeram
  ["0xF130003B9F04A65A"]  = CROSS, -- Clone
  ["0xF130003B9F04A659"]  = SKULL, -- Clone
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "brainwasher_1", {
  ["0xF130003B8F01562D"] = SKULL, -- Qiraji Brainwasher
  ["0xF130003B8101562C"] = SQUARE, -- Vekniss Guardian
  ["0xF130003B8101562B"] = CROSS, -- Vekniss Guardian
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "warrior_1", {
  ["0xF130003B7E01567A"] = TRIANGLE, -- Vekniss Warrior
  ["0xF130003B7E015679"] = UNMARKED, -- Vekniss Warrior
  ["0xF130003B7E015678"] = UNMARKED -- Vekniss Warrior
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "brainwasher_2", {
  ["0xF130003B81015630"]  = MOON, -- Vekniss Guardian
  ["0xF130003B8101562F"]  = SQUARE, -- Vekniss Guardian
  ["0xF130003B81015677"]  = CROSS, -- Vekniss Guardian
  ["0xF130003B8F01562E"]  = SKULL, -- Qiraji Brainwasher
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "brainwasher_left", {
  ["0xF130003B8101563A"]  = SQUARE, -- Vekniss Guardian
  ["0xF130003B8F015636"]  = CROSS, -- Qiraji Brainwasher
  ["0xF130003B81015639"]  = MOON, -- Vekniss Guardian
  ["0xF130003B81015638"]  = TRIANGLE, -- Vekniss Guardian
  ["0xF130003B8F015637"]  = SKULL, -- Qiraji Brainwasher
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "brainwasher_right", {
  ["0xF130003B8101563C"]  = MOON, -- Vekniss Guardian
  ["0xF130003B8F015634"]  = SKULL, -- Qiraji Brainwasher
  ["0xF130003B8101563D"]  = TRIANGLE, -- Vekniss Guardian
  ["0xF130003B8101563B"]  = SQUARE, -- Vekniss Guardian
  ["0xF130003B8F015635"]  = CROSS, -- Qiraji Brainwasher
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "warrior_2", {
  ["0xF130003B7E049CA2"]  = STAR, -- Vekniss Warrior
  ["0xF130003B7E049CA4"]  = UNMARKED, -- Vekniss Warrior
  ["0xF130003B7E049CA3"]  = UNMARKED, -- Vekniss Warrior
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "guardian_1", {
  ["0xF130003B81015644"]  = SQUARE, -- Vekniss Guardian
  ["0xF130003B81015645"]  = DIAMOND, -- Vekniss Guardian
  ["0xF130003B8113079F"]  = CROSS, -- Vekniss Guardian
  ["0xF130003B81015642"]  = SKULL, -- Vekniss Guardian
  ["0xF130003B81015643"]  = MOON, -- Vekniss Guardian
  ["0xF130003B81015641"]  = TRIANGLE, -- Vekniss Guardian
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "guardian_2", {
  ["0xF130003B81015648"]  = CROSS, -- Vekniss Guardian
  ["0xF130003B81015649"]  = TRIANGLE, -- Vekniss Guardian
  ["0xF130003B81015647"]  = SQUARE, -- Vekniss Guardian
  ["0xF130003B8101564A"]  = MOON, -- Vekniss Guardian
  ["0xF130003B81015646"]  = DIAMOND, -- Vekniss Guardian
  ["0xF130003B8101564B"]  = SKULL, -- Vekniss Guardian
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "guardian_3", {
  ["0xF130003B8101564E"]  = SQUARE, -- Vekniss Guardian
  ["0xF130003B8101564F"]  = SKULL, -- Vekniss Guardian
  ["0xF130003B8101564C"]  = CROSS, -- Vekniss Guardian
  ["0xF130003B81015650"]  = DIAMOND, -- Vekniss Guardian
  ["0xF130003B8101564D"]  = TRIANGLE, -- Vekniss Guardian
  ["0xF130003B81015651"]  = MOON, -- Vekniss Guardian
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "guardian_4", {
  ["0xF130003B8101565B"]  = TRIANGLE, -- Vekniss Guardian
  ["0xF130003B81015657"]  = CROSS, -- Vekniss Guardian
  ["0xF130003B8101565A"]  = DIAMOND, -- Vekniss Guardian
  ["0xF130003B81015658"]  = SQUARE, -- Vekniss Guardian
  ["0xF130003B8101565C"]  = MOON, -- Vekniss Guardian
  ["0xF130003B81015659"]  = SKULL, -- Vekniss Guardian
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "sartura", {
  ["0xF130003E70015662"]  = CROSS, -- Sartura's Royal Guard
  ["0xF130003E70015661"]  = SQUARE, -- Sartura's Royal Guard
  ["0xF130003E70015663"]  = MOON, -- Sartura's Royal Guard
  ["0xF130003C9C015660"]  = SKULL, -- Battleguard Sartura
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "soldiers", {
  ["0xF130003B7D015762"]  = SKULL, -- Vekniss Soldier
  ["0xF130003B7D01575D"]  = TRIANGLE, -- Vekniss Soldier
  ["0xF130003B7D01575F"]  = SQUARE, -- Vekniss Soldier
  ["0xF130003B7D015760"]  = CROSS, -- Vekniss Soldier
  ["0xF130003B7D01575E"]  = MOON, -- Vekniss Soldier
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "scorpions", {
  ["0xF130003B88015798"]  = SKULL, -- Vekniss Hive Crawler
  ["0xF130003B88015799"]  = CROSS, -- Vekniss Hive Crawler
  ["0xF130003B881307A3"]  = MOON, -- Vekniss Hive Crawler
  ["0xF130003B881307A4"]  = SQUARE, -- Vekniss Hive Crawler
  ["0xF130003B8801578F"]  = DIAMOND, -- Vekniss Hive Crawler
  ["0xF130003B8801578E"]  = CIRCLE, -- Vekniss Hive Crawler
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "lashers", {
  ["0xF130003B910157BF"]  = MOON, -- Qiraji Lasher
  ["0xF130003B910157C3"]  = CROSS, -- Qiraji Lasher
  ["0xF130003B910157C0"]  = UNMARKED, -- Vekniss Wasp
  ["0xF130003B910157C1"]  = UNMARKED, -- Vekniss Wasp
  ["0xF130003B910157C2"]  = SQUARE, -- Qiraji Lasher
  ["0xF130003B910157C8"]  = SKULL, -- Qiraji Lasher
  ["0xF130003B910157BC"]  = TRIANGLE, -- Qiraji Lasher
  ["0xF130003B830157B6"]  = DIAMOND, -- Vekniss Stinger
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "defenders", {
  ["0xF130003BAD0157CF"] = SKULL, -- Anubisath Defender
  ["0xF130003BAD0157D1"] = CROSS, -- Anubisath Defender
  ["0xF130003BAD0157D2"] = SQUARE, -- Anubisath Defender
  ["0xF130003BAD0157D0"] = MOON, -- Anubisath Defender
  ["0xF130003BAD0157D3"] = TRIANGLE -- Anubisath Defender
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "champions", {
  ["0xF130003B940157E7"] = SQUARE, -- Qiraji Champion
  ["0xF130003B940157E5"] = DIAMOND, -- Qiraji Champion
  ["0xF130003B940157E6"] = CIRCLE, -- Qiraji Champion
  ["0xF130003B940157F9"] = CROSS, -- Qiraji Champion
  ["0xF130003B940157E4"] = MOON, -- Qiraji Champion
  ["0xF130003B940157FA"] = TRIANGLE, -- Qiraji Champion
  ["0xF130003B940157E3"] = SKULL, -- Qiraji Champion
  ["0xF130003B940157DE"] = STAR, -- Qiraji Champion
})
--/////////////// ZG ///////////////
defaultNpcsToMark[L["Zul'Gurub"]] = {}
--/////////////// Entrance to Jindo ///////////////
addToDefaultNpcsToMark(L["Zul'Gurub"], "entrance_snakes_left_1", {
  ["0xF130002C6C00BFC2"] = SKULL,
  ["0xF130002C6B00BFC3"] = CROSS,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "entrance_priest_left", {
  ["0xF130002E3600BFDB"] = SKULL,
  ["0xF130002C5600BFDA"] = MOON,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "jindo_entrance_patrols", {
  ["0xF1300039E911E65A"] = UNMARKED,
  ["0xF130002E36016542"] = DIAMOND,
  ["0xF1300039E911E65D"] = STAR,
  ["0xF130002C5800CAEC"] = SKULL,
  ["0xF1300039E911E65C"] = UNMARKED,
  ["0xF1300039E911E65B"] = UNMARKED,
  ["0xF130002C57016541"] = TRIANGLE,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "jindo_misress_1_patrol", {
  ["0xF1300039E911E657"] = STAR,
  ["0xF1300039E900C0F6"] = UNMARKED,
  ["0xF1300039E900C0F5"] = UNMARKED,
  ["0xF1300039E911E658"] = UNMARKED,
  ["0xF1300039E911E659"] = UNMARKED,
  ["0xF130003A2200C0F7"] = UNMARKED,
  ["0xF1300039E911E656"] = UNMARKED,
  ["0xF130003A2200C0F8"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "jindo_mistress_2", {
  ["0xF130003A2300C0DB"] = MOON,
  ["0xF1300039E900C0D5"] = UNMARKED,
  ["0xF1300039E900C0D6"] = UNMARKED,
  ["0xF130003A2300C0DA"] = SKULL,
  ["0xF130003A2200C0D8"] = UNMARKED,
  ["0xF130003A2200C0D9"] = UNMARKED,
  ["0xF130003A2300C0DC"] = SQUARE,
  ["0xF1300039E900C0D3"] = UNMARKED,
  ["0xF130003A2200C0D7"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "jindo_boss_pack", {
  ["0xF1300039E900C1A5"] = UNMARKED,
  ["0xF1300039E900C0FA"] = UNMARKED,
  ["0xF130003A2200C1A7"] = UNMARKED,
  ["0xF130002C7400C1F7"] = SKULL,
  ["0xF1300039E900C0FB"] = UNMARKED,
  ["0xF130003A2200C1A8"] = UNMARKED,
  ["0xF130003A2200C1A9"] = CIRCLE,
  ["0xF1300039E900C10D"] = UNMARKED,
  ["0xF130003A2300C1F2"] = SQUARE,
  ["0xF130003A2200C1A6"] = UNMARKED,
  ["0xF130003A2300C1C9"] = MOON,
})
--/////////////// Marli(Bat) ///////////////
addToDefaultNpcsToMark(L["Zul'Gurub"], "hill_bottom_priest", {
  ["0xF130002C6B00BFC9"] = UNMARKED,
  ["0xF130002C6C00BFC8"] = UNMARKED,
  ["0xF130002E3600C25A"] = SKULL,
  ["0xF130002C5800C261"] = STAR,
  ["0xF130002C5600C259"] = CROSS,
})
bat1= {}
bat1["bat_one_rider_1"] = {
  ["0xF13000399E00BFFB"] = STAR,
  ["0xF130002C6800BFF7"] = UNMARKED,
  ["0xF130002C6800BFF9"] = UNMARKED,
  ["0xF130002C6800BFF8"] = UNMARKED,
  ["0xF130002C6800BFFA"] = UNMARKED,
}
bat1["bat_one_rider_2"] = {
  ["0xF130002C6800C024"] = UNMARKED,
  ["0xF130002C6800C023"] = UNMARKED,
  ["0xF130002C6800BFFF"] = UNMARKED,
  ["0xF130002C6800C001"] = UNMARKED,
  ["0xF13000399E00C025"] = TRIANGLE,
}
bat1["bat_two_rider_1"] = {
  ["0xF130002C6800C004"] = UNMARKED,
  ["0xF130002C6800C009"] = UNMARKED,
  ["0xF13000399E00C003"] = CIRCLE, -- rider
  ["0xF130002C6800C007"] = UNMARKED,
  ["0xF130002C6800BFEF"] = UNMARKED,
  ["0xF13000399E00C002"] = DIAMOND, -- rider
}
bat1["bat_headhunter_1"] = {
  ["0xF130002E3700BFF0"] = SKULL, -- witchdoctor
  ["0xF130002C5700BFEE"] = CROSS,
  ["0xF130002C5700BFEF"] = UNMARKED,
}
local cbat = {}
for _,pack in pairs(bat1) do
  for guid,mark in pairs(pack) do
    cbat[guid] = mark
  end
end
addToDefaultNpcsToMark(L["Zul'Gurub"], "consolidated_bat_1", cbat)
bat2 = {}
bat2["bat_two_rider_rtv"] = {
  ["0xF130002C6800BFF2"] = UNMARKED,
  ["0xF130002C6800BFF3"] = UNMARKED,
  ["0xF13000399E00BFF5"] = MOON,
  ["0xF13000399E00BFF6"] = SQUARE,
  ["0xF130002C6800BFF1"] = UNMARKED,
}
bat2["bat_two_rider_2"] = {
  ["0xF130002C6800BFE8"] = UNMARKED,
  ["0xF130002C6800BFE7"] = UNMARKED,
  ["0xF130002C6800BFE3"] = UNMARKED,
  ["0xF130002C6800BFE5"] = UNMARKED,
  ["0xF130002C6800BFE4"] = UNMARKED,
  ["0xF13000399E00BFEA"] = CIRCLE,
  ["0xF13000399E00BFE9"] = DIAMOND,
}
bat2["bat_two_rider_3"] = {
  ["0xF130002C6800BFF4"] = UNMARKED,
  ["0xF130002C6800C022"] = UNMARKED,
  ["0xF13000399E00C021"] = STAR,
  ["0xF130002C6800C006"] = UNMARKED,
  ["0xF13000399E00C00F"] = TRIANGLE,
  ["0xF130002C6800C005"] = UNMARKED,
}
bat2["bat_headhunter_2"] = {
  ["0xF130002C5700BFED"] = UNMARKED,
  ["0xF130002E3700BFEB"] = CROSS, -- witchdoctor
  ["0xF130002E3700BFEC"] = SKULL, -- witchdoctor
}
local cbat = {}
for _,pack in pairs(bat2) do
  for guid,mark in pairs(pack) do
    cbat[guid] = mark
  end
end
addToDefaultNpcsToMark(L["Zul'Gurub"], "consolidated_bat_2", cbat)
--/////////////// Venoxis ///////////////
addToDefaultNpcsToMark(L["Zul'Gurub"], "venoxis_two_axethrower", {
  ["0xF130002C5600BFD1"] = MOON,
  ["0xF130002C5600BFD0"] = SKULL,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "venoxis_priest_pat", {
  ["0xF130002C6C00C8FB"] = UNMARKED,
  ["0xF130002E3600C258"] = SKULL, -- priest
  ["0xF130002C6B00C8FC"] = UNMARKED,
  ["0xF130002C5600C257"] = MOON, -- axethrower
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "venoxis_room", {
  ["0xF130002C5600C248"] = MOON,
  ["0xF130002C6C00BFCB"] = UNMARKED,
  ["0xF130002C6C00BFD3"] = UNMARKED,
  ["0xF130002E3600C249"] = SKULL,
  ["0xF130002C6C00BFCC"] = UNMARKED,
  ["0xF130002C6B00BFD7"] = UNMARKED,
  ["0xF130002C6B00BFD9"] = UNMARKED,
  ["0xF130002C6C00BFD2"] = UNMARKED,
  ["0xF130002C6C00BFD6"] = UNMARKED,
  ["0xF130002C6B00BFCD"] = UNMARKED,
  ["0xF130002C7B00C24A"] = UNMARKED,
  ["0xF130002C6B00BFD8"] = UNMARKED,
  ["0xF130002C6C00BFCA"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "venoxis_exit_snake_1", {
  ["0xF130002C6B00C250"] = UNMARKED,
  ["0xF130002C6B00C251"] = UNMARKED,
  ["0xF130002C6C00C252"] = SKULL,
  ["0xF130002C6B00C24F"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "venoxis_exit_snake_2", {
  ["0xF130002C6C00BFC7"] = SKULL, -- adder
  ["0xF130002C6B00BFC6"] = UNMARKED,
  ["0xF130002C6B00BFC5"] = UNMARKED,
  ["0xF130002C6B00BFC4"] = UNMARKED,
})
--/////////////// Mandokir //////////////
addToDefaultNpcsToMark(L["Zul'Gurub"], "zanza_tower_zerks", {
  ["0xF130002C5800CAFA"] = TRIANGLE,
  ["0xF130002C5800CAEB"] = DIAMOND,
  ["0xF130002C58016565"] = CIRCLE,
  ["0xF130002C5800C222"] = STAR,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "mandokir_entrance_and_zerk", {
  ["0xF130002E3600C278"] = SKULL,
  ["0xF130002C5900C280"] = UNMARKED,
  ["0xF130002C5900C27F"] = SQUARE,
  ["0xF130002C5900C271"] = UNMARKED,
  ["0xF130002E3600C279"] = CROSS,
  ["0xF130002C5900C270"] = MOON,
  ["0xF130002C5800C229"] = STAR,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "mandokir_room", {
  ["0xF130002E3600C287"] = SKULL, -- priest
  ["0xF130002C5900C285"] = MOON, -- blooddrinker
  ["0xF130002C5C00C282"] = STAR, -- guardian, pat
  ["0xF130002C5C00C283"] = UNMARKED, -- guardian
  ["0xF130002C5C00C281"] = UNMARKED, -- guardian
  ["0xF130002C5C00CB5B"] = UNMARKED, -- guardian
  ["0xF130002C5C00C284"] = UNMARKED, -- guardian
  ["0xF130002C5C00CB88"] = UNMARKED, -- guardian
  ["0xF1300039E500C974"] = UNMARKED, -- raptors
  ["0xF1300039E500CB00"] = UNMARKED, -- raptors
  ["0xF1300039E500C972"] = UNMARKED, -- raptors
  ["0xF1300039E500C973"] = UNMARKED, -- raptors
  ["0xF1300039E500CAFF"] = UNMARKED, -- raptors
  ["0xF1300039E500CB01"] = UNMARKED, -- raptors
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "zanaz_witchdoctor_rtv", {
  ["0xF130002C6100CAF2"] = UNMARKED,
  ["0xF130002E37016557"] = SKULL,
  ["0xF130002C6100CAF1"] = UNMARKED,
  ["0xF130002C56016556"] = MOON,
})
--/////////////// Madness /////////////
addToDefaultNpcsToMark(L["Zul'Gurub"], "madness1", {
  ["0xF130003B0700BFA4"] = DIAMOND,
  ["0xF130003B0700BFA3"] = SKULL,
  ["0xF130003B0700BFA5"] = CROSS,
  ["0xF130000B6200BF8D"] = UNMARKED,
  ["0xF130003B0700BFA0"] = CIRCLE,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "madness2", {
  ["0xF130003B0700BF9F"] = DIAMOND,
  ["0xF130003B0700BFA1"] = CROSS,
  ["0xF130003B0700BF9D"] = SKULL,
  ["0xF130003B0700BF9E"] = TRIANGLE,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "madness3", {
  ["0xF130003B0700BFAA"] = CROSS,
  ["0xF130003B0700BFA9"] = DIAMOND,
  ["0xF130003B0700BFAB"] = TRIANGLE,
  ["0xF130002C4C00BF9B"] = SKULL,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "madness4", {
  ["0xF130002C4C00BF9C"] = SKULL,
  ["0xF130003B0700BFA8"] = DIAMOND,
  ["0xF130003B0700BFA6"] = TRIANGLE,
  ["0xF130003B0700BFA7"] = CROSS,
})
--/////////////// Thekal //////////////
addToDefaultNpcsToMark(L["Zul'Gurub"], "thekal_pack", {
  ["0xF13000390700C09E"] = DIAMOND,
  ["0xF130002C5300C0A2"] = SQUARE,
  ["0xF130002C5400C0A1"] = TRIANGLE,
  ["0xF130002C6100C08D"] = UNMARKED, -- tiger
  ["0xF130002C6100C08A"] = UNMARKED, -- tiger
  ["0xF130002C6100C089"] = UNMARKED, -- tiger
  ["0xF130002C6100C08E"] = UNMARKED, -- tiger
  ["0xF130002C6100C08C"] = UNMARKED, -- tiger
  ["0xF130002C6100C08B"] = UNMARKED, -- tiger
  ["0xF130002C6000C09A"] = UNMARKED, -- tiger cub
  ["0xF130002C6000C098"] = UNMARKED, -- tiger cub
  ["0xF130002C6000C97C"] = UNMARKED, -- tiger cub
  ["0xF130002C6000C97D"] = UNMARKED, -- tiger cub
  ["0xF130002C6000C288"] = UNMARKED, -- tiger cub
  ["0xF130002C6000C292"] = UNMARKED, -- tiger cub
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "gaz_fish", {
  ["0xF130002C6E00C242"] = TRIANGLE,
  ["0xF130002C6E00BFAD"] = CIRCLE,
  ["0xF130002C6E00C8F4"] = DIAMOND,
  ["0xF130002C6E00C23E"] = STAR,
  ["0xF130002C6E00BFAF"] = CROSS,
  ["0xF130003AC300C22C"] = UNMARKED, -- croc
  ["0xF130003AC300C22D"] = UNMARKED, -- croc
  ["0xF130003AC300C22B"] = SKULL, -- croc
  ["0xF130003AC300C22A"] = UNMARKED, -- croc
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "thekal_zerk_panther", {
  ["0xF130002C5801652B"] = STAR,
  ["0xF130002C6500C0A6"] = UNMARKED,
  ["0xF130002C6500C0A7"] = UNMARKED,
  ["0xF130002C6500C0A8"] = CIRCLE,
})
--/////////////// Arlok ///////////////
addToDefaultNpcsToMark(L["Zul'Gurub"], "arlok_1", {
  ["0xF130002C4B00C899"] = UNMARKED,
  ["0xF130002C4B00C8A4"] = SKULL,
  ["0xF130002C4B00C89A"] = CROSS,
  ["0xF130002C4B00C8A3"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "arlok_2", {
  ["0xF130002C6500C0C2"] = UNMARKED,
  ["0xF130002C6500C0C1"] = UNMARKED,
  ["0xF130002C5900C98B"] = MOON,
  ["0xF130002C5900C98A"] = SQUARE,
  ["0xF130002C6500C0C0"] = UNMARKED,
  ["0xF130002C6500C0BF"] = SKULL,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "arlok_3", {
  ["0xF130002C6500C0BD"] = UNMARKED, -- panther
  ["0xF130002C6500C0BE"] = SKULL, -- panther
  ["0xF130002C4B00C0B1"] = TRIANGLE, -- shadow hunter
  ["0xF130002C6500C0BB"] = UNMARKED, -- panther
  ["0xF130002C6500C0BC"] = UNMARKED, -- panther
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "arlok_4", {
  ["0xF130002C6500C8B7"] = UNMARKED,
  ["0xF130002C6500C8B5"] = SKULL,
  ["0xF130002C6500C8AF"] = UNMARKED,
  ["0xF130002C4B00C8A5"] = DIAMOND, -- shadow hunter
  ["0xF130002C6500C8B6"] = UNMARKED,
  ["0xF130002C4B00C8A6"] = TRIANGLE, -- shadow hunter
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "arlokk", {
  ["0xF1300038B3276EF0"] = CIRCLE,
})
--/////////////// Hakkar ///////////////
addToDefaultNpcsToMark(L["Zul'Gurub"], "hakkar_bottom", {
  ["0xF130003AC300C231"] = CROSS, -- left zerk
  ["0xF130002C5800C8C3"] = STAR, -- crocs
  ["0xF130002C5800C8C4"] = SKULL, -- right zerk
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "hakkar_sons", {
  ["0xF130002C5D00BF8A"] = DIAMOND,
  ["0xF130002C5D00BF89"] = CIRCLE,
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "hakkar_soulflayer_1", {
  ["0xF130002C5F00C8E0"] = MOON, -- son
  ["0xF130002C5D00C8E2"] = SKULL, -- flayer
  ["0xF130002C5D00C8E1"] = CROSS, -- son
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "hakkar_soulflayer_2", {
  ["0xF130002C5D00C8E4"] = CROSS, -- son
  ["0xF130002C5D00C8E5"] = SKULL, -- flayer
  ["0xF130002C5F00C8E3"] = MOON, -- son
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "hakkar_large_1", {
  ["0xF130002C5F00C8D7"] = MOON, -- soulflayer
  ["0xF130002C5800C204"] = UNMARKED,
  ["0xF130002E3600C8D6"] = SKULL, -- priest
  ["0xF130002C5C00C8D8"] = UNMARKED,
  ["0xF130002E3600C8D9"] = CROSS, -- priest
  ["0xF130002C5F11E679"] = SQUARE, -- soulflayer
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "hakkar_large_2", {
  ["0xF130002C5F11F381"] = SQUARE, -- soulflayer
  ["0xF130002E3611F383"] = SKULL, -- priest
  ["0xF130002E3611F384"] = CROSS, -- priest
  ["0xF130002C5F11F380"] = MOON, -- soulflayer
  ["0xF130002C4C11F37E"] = UNMARKED,
  ["0xF130002C5C11F382"] = UNMARKED,
})
--/////////////// ES ///////////////
local errenius = "0xF13000ED4B2739FA"
local errenius_mark = CIRCLE
addToDefaultNpcsToMark(L["Emerald Sanctum"], "entrance", {
  ["0xF13000ED482739F2"] = SQUARE, -- sancutum wyrm pat
  ["0xF13000ED4A273A45"] = MOON, -- sancutum scalebane pat
  ["0xF13000ED4A273A43"] = TRIANGLE, -- sancutum scalebane pat
  ["0xF13000ED462739E2"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739E3"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739E4"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739E5"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739E6"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739E7"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739E8"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739E9"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739EB"] = UNMARKED, -- sanctum dreamer, left
  ["0xF13000ED462739F1"] = UNMARKED, -- sanctum dreamer, right
  ["0xF13000ED462739F0"] = UNMARKED, -- sanctum dreamer, right
  ["0xF13000ED462739EF"] = UNMARKED, -- sanctum dreamer, right
  ["0xF13000ED462739EE"] = UNMARKED, -- sanctum dreamer, right
  ["0xF13000ED472739ED"] = SKULL, -- sanctum dragonkin, right
  ["0xF13000ED472739EA"] = CROSS, -- sanctum dragonkin, right
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "wyrmkin_pack_right_2", {
  ["0xF13000ED492739F3"] = SKULL, -- sanctum wyrmkin
  ["0xF13000ED492739F4"] = CROSS, -- sanctum wyrmkin
  ["0xF13000ED472739F5"] = SQUARE, -- sanctum dragonkin
  ["0xF13000ED462739F6"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462739F7"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462739F8"] = UNMARKED, -- sanctum dreamer
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "dreamer_pack_left_2", {
  ["0xF13000ED49273A17"] = SKULL, -- sanctum wyrmkin
  ["0xF13000ED46273A16"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A15"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A14"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A12"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A10"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A0F"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A0D"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A0C"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A0B"] = UNMARKED, -- sanctum dreamer
  [errenius] = errenius_mark, -- increase chance of spotting him early
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "wyrmkin_pack_left_1", {
  ["0xF13000ED47273A1C"] = SQUARE, -- sanctum dragonkin
  ["0xF13000ED4A273A1A"] = MOON, -- sanctum scalebane
  ["0xF13000ED49273A18"] = CROSS, -- sanctum wyrmkin
  ["0xF13000EF1C275495"] = SKULL, -- sanctum supressor
  ["0xF13000ED47273A1E"] = STAR, -- sanctum dragonkin
  [errenius] = errenius_mark, -- increase chance of spotting him early
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "wyrmkin_pack_left_2", {
  ["0xF13000ED46273A26"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A1F"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED49273A25"] = SKULL, -- sanctum wyrmkin
  ["0xF13000ED49273A24"] = STAR, -- sanctum wyrmkin
  ["0xF13000ED46273A20"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A27"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED48273A19"] = CROSS, -- sanctum wrym
  [errenius] = errenius_mark, -- increase chance of spotting him early
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "dreamer_pack_right_1", {
  ["0xF13000ED462754A3"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462754A4"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462754A5"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462754A6"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462754A7"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462754A8"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462754A9"] = UNMARKED, -- sanctum dreamer
  [errenius] = errenius_mark, -- increase chance of spotting him early
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "wyrmkin_pack_left_3", {
  ["0xF13000ED46273A4B"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A4C"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A54"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A56"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A57"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A58"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A59"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED4A273A48"] = CROSS, -- sanctum scalebane
  ["0xF13000ED4A273A49"] = SKULL, -- sanctum scalebane
  ["0xF13000ED49273A47"] = STAR, -- sanctum wyrmkin -- ??
  [errenius] = errenius_mark, -- increase chance of spotting him early
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "dreamer_pack_end", {
  ["0xF13000ED47273A46"] = CROSS, -- sanctum dragonkin
  ["0xF13000ED46273A28"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A29"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A2A"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A2B"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A2C"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A2D"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A2E"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A2F"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED46273A31"] = UNMARKED, -- sanctum dreamer
  ["0xF13000EF1C275497"] = SKULL, -- sanctum supressor
  [errenius] = errenius_mark, -- increase chance of spotting him early
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "wyrmkin_pack_right_3", {
  ["0xF13000ED462754A2"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED4627549E"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462754A0"] = UNMARKED, -- sanctum dreamer
  ["0xF13000ED462754A1"] = UNMARKED, -- sanctum dreamer
  ["0xF13000EF1C275499"] = SKULL, -- sanctum supressor
  ["0xF13000ED4727549C"] = STAR, -- sanctum dragonkin
  ["0xF13000ED4A27549D"] = CROSS, -- sanctum scalebane
  ["0xF13000ED4A27549B"] = SQUARE, -- sanctum scalebane
})
addToDefaultNpcsToMark(L["Emerald Sanctum"], "solnius", {
  ["0xF13000ED4C2739E1"] = UNMARKED, -- solnius
})
--/////////////// MC ///////////////
addToDefaultNpcsToMark(L["Molten Core"], "giants1", {
  ["0xF130002D8A00DD81"] = CROSS,
  ["0xF130002D8A00DD80"] = SKULL,
})
addToDefaultNpcsToMark(L["Molten Core"], "pats1", {
  ["0xF130002D9900DE21"] = MOON,
  ["0xF130002F4500DE0C"] = TRIANGLE,
  ["0xF130002F4500DE07"] = CIRCLE,
  ["0xF130002D9900DE15"] = STAR,
  ["0xF130002D9900DE13"] = CROSS,
  ["0xF130002D9900DE14"] = SQUARE,
  ["0xF130002D9900DE16"] = DIAMOND,
})
addToDefaultNpcsToMark(L["Molten Core"], "giants2", {
  ["0xF130002D8A00DD8C"] = CROSS,
  ["0xF130002D8A00DD8D"] = SKULL,
})
addToDefaultNpcsToMark(L["Molten Core"], "lucifron", {
  ["0xF130002F5700DD1F"] = CROSS,
  ["0xF130002F5600DD1D"] = SKULL,
  ["0xF130002F5700DD1E"] = SQUARE,
})
addToDefaultNpcsToMark(L["Molten Core"], "imp_surgers", {
  ["0xF130002F4500DE0A"] = DIAMOND,
  ["0xF130002F4500DE0B"] = TRIANGLE,
  ["0xF130002F4500DE08"] = SKULL,
  ["0xF130002F4500DE09"] = CROSS,
})
addToDefaultNpcsToMark(L["Molten Core"], "giants3", {
  ["0xF130002D8A00DD83"] = CROSS,
  ["0xF130002D8A00DD82"] = SKULL,
})
addToDefaultNpcsToMark(L["Molten Core"], "gehennas", {
  ["0xF130002D8D00DDA2"] = CROSS,
  ["0xF130002D8D00DDA3"] = SQUARE,
  ["0xF130002FE300DDA1"] = SKULL,
})
addToDefaultNpcsToMark(L["Molten Core"], "giants4", {
  ["0xF130002D8A00DD86"] = SKULL,
  ["0xF130002D8B00DD87"] = CROSS, -- destroyer
})
addToDefaultNpcsToMark(L["Molten Core"], "pats2", {
  ["0xF130002D9900DE1E"] = CIRCLE,
  ["0xF130002D9900DE1A"] = TRIANGLE,
  ["0xF130002D9900DE20"] = DIAMOND,
  ["0xF130002D9900DE17"] = CROSS,
  ["0xF130002F4500DE11"] = STAR,
  ["0xF130002D9900DE19"] = SKULL,
  ["0xF130002F4500DE10"] = MOON,
  ["0xF130002D9900DE18"] = SQUARE,
})
addToDefaultNpcsToMark(L["Molten Core"], "giants5", {
  ["0xF130002D8B00DD7D"] = CROSS, -- destroyer
  ["0xF130002D8B00DD7C"] = SKULL, -- destroyer
})
addToDefaultNpcsToMark(L["Molten Core"], "garr", {
  ["0xF130002F4300DD28"] = STAR,
  ["0xF130002F4300DD2E"] = CIRCLE,
  ["0xF130002F4300DD2C"] = SQUARE,
  ["0xF130002F4300DD34"] = DIAMOND,
  ["0xF130002F4300DD2B"] = SKULL,
  ["0xF130002F4300DD32"] = CROSS,
  ["0xF130002F4300DD33"] = MOON,
  ["0xF130002F4300DD22"] = TRIANGLE,
})
addToDefaultNpcsToMark(L["Molten Core"], "baron_pack_1", {
  ["0xF130002D93016498"] = CROSS,
  ["0xF130002F2C016497"] = CIRCLE,
  ["0xF130002D92016496"] = SKULL,
  ["0xF130002F2C016499"] = DIAMOND,
})
addToDefaultNpcsToMark(L["Molten Core"], "baron_pack_2", {
  ["0xF130002F2C016480"] = CIRCLE,
  ["0xF130002F2C01647E"] = DIAMOND,
  ["0xF130002D9301647F"] = CROSS,
  ["0xF130002D9201647D"] = SKULL,
  ["0xF130002F1800DD4F"] = STAR, -- baron
})
addToDefaultNpcsToMark(L["Molten Core"], "baron_pack_3", {
  ["0xF130002D9301649C"] = CROSS,
  ["0xF130002D9201649A"] = SKULL,
  ["0xF130002F4401649B"] = CIRCLE,
  ["0xF130002FE800DD20"] = STAR, -- shazzrah
})
addToDefaultNpcsToMark(L["Molten Core"], "baron_pack_4", {
  ["0xF130002D9200DD92"] = SKULL,
  ["0xF130002F4400DD93"] = CIRCLE,
  ["0xF130002D9300DD94"] = CROSS,
})
addToDefaultNpcsToMark(L["Molten Core"], "baron_pack_5", {
  ["0xF130002F2C00DDD9"] = CIRCLE,
  ["0xF130002D9300DDDA"] = CROSS,
  ["0xF130002D9200DDD8"] = SKULL,
  ["0xF130002F2C00DDDB"] = DIAMOND,
})
addToDefaultNpcsToMark(L["Molten Core"], "sulfuron", {
  ["0xF130002D8E00DD69"] = MOON,
  ["0xF130002D8E00DD66"] = SQUARE,
  ["0xF130002D8E00DD67"] = CROSS,
  ["0xF130002F4200DD65"] = TRIANGLE,
  ["0xF130002D8E00DD6A"] = SKULL,
})
addToDefaultNpcsToMark(L["Molten Core"], "domo", {
  ["0xF130002D8F276EDC"] = CROSS, -- healer
  ["0xF130002D8F276EDB"] = MOON, -- healer
  ["0xF130002D8F276EDA"] = SQUARE, -- healer
  ["0xF130002D8F276ED9"] = SKULL, -- healer
  ["0xF130002D90276ED8"] = TRIANGLE, -- elite
  ["0xF130002D90276ED7"] = CIRCLE, -- elite
  ["0xF130002D90276ED6"] = STAR, -- elite
  ["0xF130002D90276ED5"] = DIAMOND, -- elite
  ["0xF130002EF2276ED4"] = UNMARKED, -- domo
})
--/////////////// AQ20 ///////////////
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "entrance", {
  ["0xF130003BEF11FB53"] = TRIANGLE,
  ["0xF130003BDC0155E6"] = CIRCLE,
  ["0xF130003BDC11FAC8"] = SKULL,
})
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "entrance_pats", {
  ["0xF130003BDF0155DA"] = STAR,
  ["0xF130003BDD11FAD8"] = UNMARKED,
  ["0xF130003BDD11FAD7"] = UNMARKED,

  ["0xF130003BDD11FADF"] = UNMARKED,
  ["0xF130003BDD11FAD6"] = UNMARKED,
  ["0xF130003BDD11FAD5"] = UNMARKED,
  ["0xF130003BEF11FB4D"] = CIRCLE,
  ["0xF130003BDD11FADB"] = UNMARKED,
  ["0xF130003BDD11FADA"] = UNMARKED,
  ["0xF130003BDD11FADE"] = UNMARKED,
  ["0xF130003BDD11FAD4"] = UNMARKED,
  ["0xF130003BDF0155DB"] = SQUARE,
  ["0xF130003BEF11FAE1"] = DIAMOND,
  ["0xF130003BDF11FAE0"] = SKULL,
  ["0xF130003BDD11FAD3"] = UNMARKED,
  ["0xF130003BEF11FAE2"] = TRIANGLE,
  ["0xF130003BDF11FADD"] = MOON,
  ["0xF130003BDF11FB4E"] = CROSS,
})
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "entrance_pats_2", {

  ["0xF130003BDD11FAF7"] = UNMARKED,
  ["0xF130003BDD11FAEF"] = UNMARKED,
  ["0xF130003BDF11FAF5"] = SQUARE,
  ["0xF130003BDD11FAFA"] = UNMARKED,
  ["0xF130003BDD11FAF4"] = UNMARKED,
  ["0xF130003BDF11FAF0"] = DIAMOND,
  ["0xF130003BDF11FAF2"] = MOON,
  ["0xF130003BDF11FAF8"] = CROSS,
  ["0xF130003BF40162B5"] = TRIANGLE, -- kurinaxx
  ["0xF130003BDD11FAF6"] = UNMARKED,
  ["0xF130003BDD11FAF1"] = UNMARKED,
  ["0xF130003BDD11FAF9"] = UNMARKED,
  ["0xF130003BDC11FACA"] = CIRCLE,
  ["0xF130003BDC11FAC9"] = SKULL,
  ["0xF130003BDD11FB50"] = UNMARKED,
  ["0xF130003BDF11FB4F"] = STAR,
  ["0xF130003BDD11FB52"] = UNMARKED,
  ["0xF130003BDD11FAF3"] = UNMARKED, -- 佐拉黄蜂
})
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "general_rajaxx", {
  ["0xF130003C1B11FB5A"] = UNMARKED,
  ["0xF130003BF011FB71"] = UNMARKED,
  ["0xF130003C1B11FB57"] = UNMARKED,
  ["0xF130003BF011FB5C"] = UNMARKED,
  ["0xF130003BF011FB72"] = UNMARKED,
  ["0xF130003C1C11FC00"] = CIRCLE,
  ["0xF130003C1B11FB6D"] = UNMARKED,
  ["0xF130003BF011FB89"] = UNMARKED,
  ["0xF130003C1911FBFF"] = DIAMOND,
  ["0xF130003C1B11FB84"] = UNMARKED,
  ["0xF130003C1B11FB7D"] = UNMARKED,
  ["0xF130003BF011FB6F"] = UNMARKED,
  ["0xF130003BF011FB78"] = UNMARKED,
  ["0xF130003BF011FB66"] = UNMARKED,
  ["0xF130003BF011FB79"] = UNMARKED,
  ["0xF130003C1B11FB7F"] = UNMARKED,
  ["0xF130003C1B11FB6B"] = UNMARKED,
  ["0xF130003C1D11FBFD"] = CROSS,
  ["0xF130003BF011FB80"] = UNMARKED,
  ["0xF130003BF011FB64"] = UNMARKED,
  ["0xF130003C1B11FB59"] = UNMARKED,
  ["0xF130003C1B11FB5F"] = UNMARKED,
  ["0xF130003BF011FB77"] = UNMARKED,
  ["0xF130003C1B11FB60"] = UNMARKED,
  ["0xF130003BF011FB68"] = UNMARKED,
  ["0xF130003BF011FB62"] = UNMARKED,
  ["0xF130003C1F11FB5D"] = SKULL,
  ["0xF130003C2011FB5E"] = SQUARE,
  ["0xF130003BF011FB76"] = UNMARKED,
  ["0xF130003BF011FB81"] = UNMARKED,
  ["0xF130003BF011FB5B"] = UNMARKED,
  ["0xF130003C1B11FB61"] = UNMARKED,
  ["0xF130003C1B11FB58"] = UNMARKED,
  ["0xF130003BF011FB63"] = UNMARKED,
  ["0xF130003C1B11FB69"] = UNMARKED,
  ["0xF130003C1B11FB6A"] = UNMARKED,
  ["0xF130003BF011FB67"] = UNMARKED,
  ["0xF130003C1E11FC01"] = MOON,
  ["0xF130003C1B11FB85"] = UNMARKED,
  ["0xF130003BED0162F7"] = UNMARKED,
  ["0xF130003BF011FB82"] = UNMARKED,
  ["0xF130003C1A11FBFE"] = TRIANGLE,
  ["0xF130003BF011FB87"] = UNMARKED,
  ["0xF130003BF011FB70"] = UNMARKED,
  ["0xF130003C1B11FB86"] = UNMARKED,
  ["0xF130003C1B11FB7E"] = UNMARKED,
  ["0xF130003BF011FB6E"] = UNMARKED,
  ["0xF130003C1B11FB7A"] = UNMARKED,
  ["0xF130003C1B11FB88"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "buru_path", {
  ["0xF130003BE7014F7D"] = STAR,
  ["0xF130003BDC11FACC"] = CIRCLE,
  ["0xF130003BDC11FACD"] = SKULL,
  ["0xF130003BDB11FB96"] = TRIANGLE,
})
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "buru_eggs", {
  ["0xF130003C9A276DE0"] = CIRCLE, -- egg
  ["0xF130003C9A276DE1"] = DIAMOND, -- egg
  ["0xF130003C9A276DE2"] = TRIANGLE, -- egg
  ["0xF130003C9A276DE3"] = MOON, -- egg
  ["0xF130003C9A276DE4"] = SQUARE, -- egg
  ["0xF130003C9A276DE5"] = STAR, -- egg
  ["0xF130003C0A0162F9"] = UNMARKED, -- buru
  ["0xF130003BE711FE02"] = CROSS, -- slime
  ["0xF130003BE711FB9F"] = SKULL, -- slime
})
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "resevoir", {
  ["0xF130003BE711FC27"] = SQUARE,
  ["0xF130003BEA11FC12"] = DIAMOND,
  ["0xF130003BEA0153E5"] = MOON,
  ["0xF130003BDC11FACE"] = SKULL,
  ["0xF130003BEA11FC39"] = TRIANGLE,
  ["0xF130003BDC11FACF"] = CIRCLE,
  ["0xF130003BE711FC2B"] = STAR,
})
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ossirian_room", {
  ["0xF130003BFB11FBDC"] = CROSS,
  ["0xF130003BFB11FBDD"] = SKULL,
  ["0xF130003BFB0155C3"] = SQUARE,
  ["0xF130003BFB11FBE0"] = TRIANGLE,
  ["0xF130003BFB11FBDF"] = STAR,
  ["0xF130003BFB11FBDB"] = DIAMOND,
  ["0xF130003BFB11FBDE"] = CIRCLE,
  ["0xF130003BFB11FBE1"] = MOON,
})
--/////////////// BWL ///////////////
addToDefaultNpcsToMark(L["Blackwing Lair"], "bwl_razor", {
  ["0xF1300030930149A4"] = STAR, -- razorgore
  ["0xF13000310D0149A5"] = SKULL, -- grethok
  ["0xF1300038780149A7"] = UNMARKED,
  ["0xF1300038780149A6"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "vael", {
  ["0xF1300032DC014A20"] = STAR,
  ["0xF1300036AC104CD6"] = CROSS,
  ["0xF1300036AC104CD5"] = SQUARE,
  ["0xF1300036AC104CD4"] = MOON,
  ["0xF1300036AC104DD3"] = TRIANGLE,
  ["0xF1300036AC104DD2"] = DIAMOND,
  ["0xF1300036AC104DD1"] = CIRCLE,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "wrym1", {
  ["0xF1300030B1014A2E"] = SQUARE,
  ["0xF1300030B1014A2D"] = MOON,
  ["0xF1300030B3014A27"] = STAR,
  ["0xF1300030B0014A2C"] = SKULL,
  ["0xF1300030B0014A2B"] = CROSS,
  ["0xF1300030AF014A33"] = DIAMOND,
  ["0xF1300030AF014A34"] = CIRCLE,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "wrym2", {
  ["0xF1300030B1014A30"] = MOON,
  ["0xF1300030B1014A2F"] = SQUARE,
  ["0xF1300030B3014A28"] = STAR,
  ["0xF1300030B0014A29"] = SKULL,
  ["0xF1300030B0014A2A"] = CROSS,
  ["0xF1300030AF014A31"] = DIAMOND,
  ["0xF1300030AF014A32"] = CIRCLE,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "supress1", {
  ["0xF1300030AA104BD1"] = CROSS, -- taskmaster
  ["0xF1300030AA104BD0"] = SQUARE, -- taskmaster
  ["0xF1300030AA104BCF"] = SKULL, -- taskmaster
  ["0xF1300030B40BA218"] = UNMARKED, -- hatcher
  ["0xF1300030B40BA216"] = UNMARKED, -- hatcher
  ["0xF1300030B40BA08B"] = UNMARKED, -- hatcher
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "supress1_2", {
  ["0xF1300030AA104BD5"] = CROSS, -- taskmaster
  ["0xF1300030AA104BD4"] = SQUARE, -- taskmaster
  ["0xF1300030AA104BD3"] = SKULL, -- taskmaster
  ["0xF1300030B40BA43A"] = UNMARKED, -- hatcher
  ["0xF1300030B40BA3BF"] = UNMARKED, -- hatcher
  ["0xF1300030B40BA395"] = UNMARKED, -- hatcher
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "supress2", {
  ["0xF1300030AA104BD8"] = CROSS, -- taskmaster
  ["0xF1300030AA104BD7"] = SQUARE, -- taskmaster
  ["0xF1300030AA104BD6"] = SKULL, -- taskmaster
  ["0xF1300030B40BA632"] = UNMARKED, -- hatcher
  ["0xF1300030B40BA630"] = UNMARKED, -- hatcher
  ["0xF1300030B40BA62E"] = UNMARKED, -- hatcher
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "supress2_2", {
  ["0xF1300030AA104BDB"] = CROSS, -- taskmaster
  ["0xF1300030AA104BDA"] = SQUARE, -- taskmaster
  ["0xF1300030AA104BD9"] = SKULL, -- taskmaster
  ["0xF1300030B40BA441"] = UNMARKED, -- hatcher
  ["0xF1300030B40BA43F"] = UNMARKED, -- hatcher
  ["0xF1300030B40BA43D"] = UNMARKED, -- hatcher
  ["0xF130002EF10149A3"] = UNMARKED, -- lashlayer
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "lab1", {
  ["0xF1300036AC11F796"] = UNMARKED,
  ["0xF1300036AC014A3C"] = UNMARKED,
  ["0xF1300036AC11F797"] = UNMARKED,
  ["0xF1300036AC014A37"] = UNMARKED,
  ["0xF1300036AC014A3B"] = UNMARKED,
  ["0xF1300036AC014A38"] = UNMARKED,
  ["0xF1300030AB014A3E"] = CROSS,
  ["0xF1300030AB014A3D"] = SKULL,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "lab2", {
  ["0xF1300036AC11F79B"] = UNMARKED,
  ["0xF1300030A9014A44"] = DIAMOND,
  ["0xF1300036AC014A4A"] = UNMARKED,
  ["0xF1300036AC11F79A"] = UNMARKED,
  ["0xF1300036AC014A47"] = UNMARKED,
  ["0xF1300036AC014A46"] = UNMARKED,
  ["0xF1300030AB014A42"] = SKULL,
  ["0xF1300030AB014A49"] = CROSS,
  ["0xF1300036AC014A48"] = UNMARKED,
  ["0xF1300036AC014A4B"] = UNMARKED,
  ["0xF1300030AD014A4D"] = CIRCLE,
  ["0xF130002ECF014A5C"] = TRIANGLE, -- firemaw
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "lab3", {
  ["0xF1300036AC014A53"] = UNMARKED,
  ["0xF1300030A911F78B"] = DIAMOND,
  ["0xF1300036AC014A55"] = UNMARKED,
  ["0xF1300036AC014A5A"] = UNMARKED,
  ["0xF1300030AB014A51"] = CROSS,
  ["0xF1300036AC11F79D"] = UNMARKED,
  ["0xF1300030AD014A4E"] = CIRCLE,
  ["0xF1300030AB014A50"] = SKULL,
  ["0xF1300036AC014A56"] = UNMARKED,
  ["0xF1300036AC014A54"] = UNMARKED,
  ["0xF1300036AC014A58"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "wyrmguard1", {
  ["0xF1300030AD014A6D"] = DIAMOND,
  ["0xF1300030AC014A70"] = SKULL,
  ["0xF1300030AD014A6E"] = CROSS,
  ["0xF1300030AD014A6F"] = CIRCLE,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "lab4", {
  ["0xF1300030A911F78C"] = DIAMOND,
  ["0xF1300036AC014A7D"] = UNMARKED,
  ["0xF1300036AC014A87"] = UNMARKED,
  ["0xF1300030AB014A77"] = CROSS,
  ["0xF1300030AB014A76"] = SKULL,
  ["0xF1300036AC014A8B"] = UNMARKED,
  ["0xF1300030AD014A91"] = CIRCLE,
  ["0xF1300036AC014A7E"] = UNMARKED,
  ["0xF1300036AC11F799"] = UNMARKED,
  ["0xF1300036AC014A86"] = UNMARKED,
  ["0xF1300036AC11F798"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "lab5", {
  ["0xF1300036AC014B1A"] = UNMARKED,
  ["0xF1300036AC014AAE"] = UNMARKED,
  ["0xF1300030AB014AAD"] = SKULL,
  ["0xF1300036AC014AD1"] = UNMARKED,
  ["0xF1300030AD014B68"] = CIRCLE,
  ["0xF1300036AC014AD0"] = UNMARKED,
  ["0xF1300036AC014AD3"] = UNMARKED,
  ["0xF1300030A911F78D"] = DIAMOND,
  ["0xF1300036AC11F791"] = UNMARKED,
  ["0xF1300036AC014B1B"] = UNMARKED,
  ["0xF1300036AC014B19"] = UNMARKED,
  ["0xF1300030AB014AAC"] = CROSS,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "lab6", {
  ["0xF1300030A9014EFE"] = DIAMOND,
  ["0xF1300036AC11F794"] = UNMARKED,
  ["0xF1300036AC014F07"] = UNMARKED,
  ["0xF1300036AC014F06"] = UNMARKED,
  ["0xF1300036AC014F00"] = UNMARKED,
  ["0xF1300036AC014F0C"] = UNMARKED,
  ["0xF1300036AC014F0D"] = UNMARKED,
  ["0xF1300036AC014F04"] = UNMARKED,
  ["0xF1300030A9014F08"] = STAR,
  ["0xF1300030AD11F78F"] = CIRCLE,
  ["0xF1300036AC11F795"] = UNMARKED,
  ["0xF1300030AB014EFD"] = SKULL,
  ["0xF1300030AB014F0F"] = CROSS,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "lab7", {
  ["0xF1300036AC014E77"] = UNMARKED,
  ["0xF1300030AB014E61"] = CROSS,
  ["0xF1300030A9014E6D"] = STAR,
  ["0xF1300036AC11F792"] = UNMARKED,
  ["0xF1300030A9014E75"] = DIAMOND,
  ["0xF1300036AC014E79"] = UNMARKED,
  ["0xF1300036AC014E69"] = UNMARKED,
  ["0xF1300036AC014E74"] = UNMARKED,
  ["0xF1300036AC014E6C"] = UNMARKED,
  ["0xF1300036AC014E6B"] = UNMARKED,
  ["0xF1300036AC014E70"] = UNMARKED,
  ["0xF1300030AB014E4D"] = SKULL,
  ["0xF1300030AD11F78E"] = CIRCLE,
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "wyrmguard2", {
  ["0xF1300030AC014A9B"] = SKULL,
  ["0xF1300030AC014A9A"] = CROSS,
  ["0xF1300030AC014A94"] = CIRCLE,
  ["0xF130003841014A93"] = MOON,
  ["0xF130002ECD014F17"] = SQUARE, -- flamegor
  ["0xF130003909014F14"] = TRIANGLE, -- ebonroc
})
addToDefaultNpcsToMark(L["Blackwing Lair"], "wyrmguard3", {
  ["0xF1300030AC014A9F"] = CIRCLE,
  ["0xF1300030AC014AAA"] = SKULL,
  ["0xF1300030AC014AA8"] = CROSS,
  ["0xF1300036C4014F18"] = TRIANGLE, -- chromag
})
--/////////////// KARA10 ///////////////
addToDefaultNpcsToMark(L["Tower of Karazhan"], "kara1", {
  ["0xF13000EF0A2747D1"] = UNMARKED,
  ["0xF13000EF082747D2"] = CROSS,
  ["0xF13000EF0A2747D0"] = UNMARKED,
  ["0xF13000EF092747CF"] = UNMARKED,
  ["0xF13000EF082747D3"] = SKULL,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "kara2", {
  ["0xF13000EF082747C1"] = SKULL,
  ["0xF13000EF082747C9"] = CROSS,
  ["0xF13000EF092747C7"] = UNMARKED,
  ["0xF130003A212755AA"] = UNMARKED,
  ["0xF13000EF0A2747C4"] = UNMARKED,
  ["0xF13000EF0A2747C6"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "kara3", {
  ["0xF13000EF0A2747AD"] = UNMARKED,
  ["0xF13000EF0A2747AE"] = UNMARKED,
  ["0xF13000EF072747AA"] = STAR,
  ["0xF13000EF082747B3"] = SKULL,
  ["0xF13000EF0A2747AF"] = UNMARKED,
  ["0xF130000FEB2755A4"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "kara4", {
  ["0xF13000EF082747A9"] = CROSS,
  ["0xF13000EF0A2747A8"] = UNMARKED,
  ["0xF13000EF092747AB"] = UNMARKED,
  ["0xF13000EF082747AC"] = SKULL,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "rider", {
  ["0xF13000EF1B274792"] = CROSS,
  ["0xF13000EF1427470C"] = TRIANGLE,
  ["0xF13000EF13277329"] = UNMARKED,
  ["0xF13000EF1327732A"] = UNMARKED,
  ["0xF13000EF12274794"] = DIAMOND,
  ["0xF13000EF1B274795"] = SQUARE,
  ["0xF13000EF1B2747A2"] = SKULL,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "kara5", {
  ["0xF13000EF152756BF"] = SKULL,
  ["0xF13000EF102756C0"] = UNMARKED,
  ["0xF13000EF102747BD"] = UNMARKED,
  ["0xF13000EF102747BE"] = UNMARKED,
  ["0xF13000EF152756BE"] = CROSS,
  ["0xF13000EF072747D4"] = TRIANGLE,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "kara6", {
  ["0xF13000EF082747EB"] = CROSS,
  ["0xF13000EF082747E7"] = SKULL,
  ["0xF13000EF0A2747E8"] = UNMARKED,
  ["0xF13000EF0A2747E9"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "kara7", {
  ["0xF13000EF0A2747DD"] = UNMARKED,
  ["0xF13000EF082747DE"] = SKULL,
  ["0xF13000EF082747DC"] = CROSS,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "kara8", {
  ["0xF13000EF082747DA"] = CROSS,
  ["0xF13000EF0A2747DB"] = UNMARKED,
  ["0xF13000EF082747D9"] = SKULL,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "imps1", {
  ["0xF13000EF0C274822"] = UNMARKED,
  ["0xF13000EF102747F0"] = SQUARE,
  ["0xF13000EF182747F4"] = TRIANGLE,
  ["0xF13000EF102747F1"] = UNMARKED,
  ["0xF13000EF102747E5"] = UNMARKED,
  ["0xF13000EF0B274824"] = SKULL,
  ["0xF13000EF102747E4"] = CROSS,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "imps2", {
  ["0xF13000EF0C274808"] = UNMARKED,
  ["0xF13000EF0B274802"] = MOON,
  ["0xF13000EF0B274801"] = SQUARE,
  ["0xF13000EF0B274803"] = CROSS,
  ["0xF13000EF0B274806"] = SKULL,
  ["0xF13000EF0D274809"] = UNMARKED,
  ["0xF13000EF0D274804"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "imps3", {
  ["0xF13000EF0D27480F"] = UNMARKED,
  ["0xF13000EF0C274812"] = UNMARKED,
  ["0xF13000EF0B27480D"] = CROSS,
  ["0xF13000EF0B274811"] = SKULL,
  ["0xF13000EF0D27480E"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "imps4", {
  ["0xF13000EF0B27481B"] = SQUARE,
  ["0xF13000EF0B27481C"] = SKULL,
  ["0xF13000EF0B274819"] = CROSS,
  ["0xF13000EF0C274815"] = UNMARKED,
  ["0xF130003A212755AD"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "imps5", {
  ["0xF13000EF0C2747F9"] = UNMARKED,
  ["0xF13000EF0B2747F7"] = SKULL,
  ["0xF13000EF0D2747FB"] = UNMARKED,
  ["0xF130000FEB2755AE"] = UNMARKED,
  ["0xF13000EF0C274800"] = UNMARKED,
  ["0xF13000EF0C2747F8"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "imps6", {
  ["0xF13000EF0D27481F"] = UNMARKED,
  ["0xF13000EF0C274823"] = UNMARKED,
  ["0xF13000EF0D274814"] = UNMARKED,
  ["0xF13000EF0D27481A"] = TRIANGLE,
  ["0xF13000EF0C27481D"] = UNMARKED,
  ["0xF13000EF0D274817"] = UNMARKED,
  ["0xF13000EF0D274818"] = UNMARKED,
  ["0xF13000EF0B274820"] = SKULL,
  ["0xF13000EF0C27481E"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "imps7", {
  ["0xF13000EF0C2747FD"] = UNMARKED,
  ["0xF13000EF0B2747FA"] = SKULL,
  ["0xF13000EF0D2747FE"] = UNMARKED,
  ["0xF13000EF0B2747FC"] = CROSS,
  ["0xF13000EF0C2747FF"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "spiderpats", {
  ["0xF130003A212755BA"] = UNMARKED,
  ["0xF13000EF16274778"] = UNMARKED,
  ["0xF13000EF1927477B"] = UNMARKED,
  ["0xF13000EF16274776"] = UNMARKED,
  ["0xF13000EF152756C3"] = CROSS,
  ["0xF13000EF1627477E"] = UNMARKED,
  ["0xF13000EF16274772"] = UNMARKED,
  ["0xF13000EF19274775"] = UNMARKED,
  ["0xF13000EF1827477A"] = SKULL,
  ["0xF13000EF1827475C"] = SQUARE,
  ["0xF13000EF18274753"] = CIRCLE,
  ["0xF13000EF19274774"] = UNMARKED,
  ["0xF13000EF16274777"] = UNMARKED,
  ["0xF130003A212755B3"] = UNMARKED,
  ["0xF13000EF1627477F"] = UNMARKED,
  ["0xF13000EF19274773"] = UNMARKED,
  ["0xF130003A212755B2"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "moroes1", {
  ["0xF13000EF072747D5"] = SKULL, -- alpha
  ["0xF13000EF0A2747D7"] = UNMARKED,
  ["0xF13000EF082747EF"] = CROSS, -- darkcaster
  ["0xF13000EF0F2756DE"] = CIRCLE, -- magiskull
  ["0xF13000EF0A2747D6"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "moroes2", {
  ["0xF13000EF0F2756DD"] = CROSS,
  ["0xF13000EF0F2756E3"] = DIAMOND,
  ["0xF13000EF0F2756E4"] = TRIANGLE,
  ["0xF13000EF0F2756DC"] = SKULL,
  })
addToDefaultNpcsToMark(L["Tower of Karazhan"], "moroes3", {
  ["0xF13000EF0E274841"] = UNMARKED,
  ["0xF13000EF0E27483D"] = UNMARKED,
  ["0xF13000EF1027484C"] = CROSS,
  ["0xF13000EF0E274842"] = UNMARKED,
  ["0xF13000EF0E27483E"] = UNMARKED,
  ["0xF13000EF10274840"] = UNMARKED,
  ["0xF13000EF0827483C"] = SKULL,
  ["0xF13000EF0F27482A"] = CIRCLE,
  ["0xF13000EF0E27483F"] = STAR,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "moroes4", {
  ["0xF13000EF15274838"] = TRIANGLE,
  ["0xF13000EF19274828"] = UNMARKED,
  ["0xF13000EF15274839"] = SKULL,
  ["0xF13000EF1027483A"] = UNMARKED,
  ["0xF13000EF16274826"] = UNMARKED,
  ["0xF13000EF15274832"] = DIAMOND,
  ["0xF13000EF15274837"] = CROSS,
  ["0xF13000EF16274827"] = UNMARKED,
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "moroes5", {
  ["0xF13000EF15274845"] = SKULL,
  ["0xF13000EF10274849"] = UNMARKED,
  ["0xF13000EF15274847"] = CROSS,
})
--/////////////// Stratholme ///////////////
addToDefaultNpcsToMark(L["Stratholme"], "live_pats", {
  ["0xF1300028AB11E66A"] = STAR, -- Eye of Naxxramas
  ["0xF1300028AB11E66B"] = TRIANGLE, -- Eye of Naxxramas
  ["0xF1300028AE00D2C1"] = SQUARE, -- "Patchwork Horror"
  ["0xF1300028AE00D2C2"] = CIRCLE, -- "Patchwork Horror"
  ["0xF1300028AE00D2B7"] = DIAMOND, -- "Patchwork Horror"
})
addToDefaultNpcsToMark(L["Stratholme"], "dead_pats", {
  ["0xF1300028A800D22E"] = SKULL,-- Rockwing Gargoyle
  ["0xF1300028A800D22B"] = CROSS,-- Rockwing Gargoyle
  ["0xF1300028A800D229"] = SQUARE,-- Rockwing Screecher
  ["0xF1300028A800D227"] = MOON,-- Rockwing Gargoyle
  ["0xF1300028A800D225"] = TRIANGLE,-- Rockwing Screecher
  ["0xF1300028A800D223"] = DIAMOND,-- Rockwing Screecher
  ["0xF1300028A800D221"] = CIRCLE,-- Rockwing Gargoyle
  ["0xF1300028AB11E66C"] = STAR,-- Eye of Naxxramas
})
--/////////////// Tower of Karazhan - Guardian's Library ///////////////
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_1", {
  ["0xF13000F1F72783E5"] = SKULL, --魔鳞抑法�?
  ["0xF13000F1F8276BC0"] = CROSS, --魔鳞织法�?
  ["0xF13000F1F82783E8"] = SQUARE, --魔鳞织法�?
  ["0xF13000F1F62783E9"] = MOON, --魔鳞护龙�?
  ["0xF13000F1F62783E7"] = TRIANGLE, --魔鳞护龙�?
})
-- Molten Core NPC 数据
addToDefaultNpcsToMark(L["Molten Core"], "group_422", {
  ["0xF130002D9100DDCC"] = SQUARE, --熔岩歼灭�?
  ["0xF130002D9100DDCA"] = MOON, --火焰之王
})
-- Outland-荒芜王座 NPC 数据 (属于卡拉赞副�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "荒芜王座_423", {
  ["0xF130016C9A278BFE"] = SKULL, --地狱之怒碎�?
  ["0xF130016C9A278BF9"] = CROSS, --地狱之怒碎�?
  ["0xF130016C9A278BFD"] = SQUARE, --地狱之怒碎�?
  ["0xF130016C9A278BFC"] = MOON, --地狱之怒碎�?
  ["0xF130016C9A278BFA"] = TRIANGLE, --地狱之怒碎�?
  ["0xF130016C9A278BFB"] = DIAMOND, --地狱之怒碎�?
})
-- Outland-荒芜巨岩 NPC 数据
-- Ahn'Qiraj NPC 数据
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "group_425", {
  ["0xF130003B830157B8"] = CROSS, --维克尼斯鞭笞�?
  ["0xF130003B8401579D"] = SQUARE, --维克尼斯黄蜂
  ["0xF130003B8401579F"] = MOON, --维克尼斯黄蜂
  ["0xF130003B8401579E"] = TRIANGLE, --维克尼斯黄蜂
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "group_426", {
  ["0xF130003B840157C0"] = CROSS, --维克尼斯黄蜂
  ["0xF130003B840157C1"] = SQUARE, --维克尼斯黄蜂
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "group_427", {
  ["0xF130003B840157B4"] = CROSS, --维克尼斯黄蜂
  ["0xF130003B840157B3"] = SQUARE, --维克尼斯黄蜂
  ["0xF130003B840157B5"] = MOON, --维克尼斯黄蜂
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "group_428", {
  ["0xF130003B830157C6"] = CROSS, --维克尼斯鞭笞�?
  ["0xF130003B830157C7"] = SQUARE, --维克尼斯鞭笞�?
  ["0xF130003B840157C5"] = MOON, --维克尼斯黄蜂
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "group_430", {
  ["0xF130003B830157BE"] = CROSS, --维克尼斯鞭笞�?
  ["0xF130003B840157B2"] = SQUARE, --维克尼斯黄蜂
  ["0xF130003B840157B0"] = MOON, --维克尼斯黄蜂
  ["0xF130003B840157B1"] = TRIANGLE, --维克尼斯黄蜂
})
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "group_432", {
  ["0xF130003B830157CD"] = SKULL, --维克尼斯鞭笞�?
  ["0xF130003B830157CC"] = CROSS, --维克尼斯鞭笞�?
  ["0xF130003B830157CB"] = SQUARE, --维克尼斯鞭笞�?
  ["0xF130003B840157CA"] = TRIANGLE, --维克尼斯黄蜂
})
-- 卡拉�?守护者的图书�?NPC 数据
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_2", {
  ["0xF13000F1F7276BAF"] = SKULL, --魔鳞抑法�?
  ["0xF13000F1F8276BB0"] = CROSS, --魔鳞织法�?
  ["0xF13000F1F6276BB2"] = SQUARE, --魔鳞护龙�?
  ["0xF13000F1F6276BB1"] = MOON, --魔鳞护龙�?
  ["0xF13000F1F4276BAE"] = TRIANGLE, --魔鳞巨龙
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_3", {
  ["0xF13000F1F7276BC3"] = SKULL, --魔鳞抑法�?
  ["0xF13000F1F7276BC2"] = CROSS, --魔鳞抑法�?
  ["0xF13000F1FC2783E4"] = SQUARE, --不稳定的奥术元素
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_4", {
  ["0xF13000F1F7276BCB"] = SKULL, --魔鳞抑法�?
  ["0xF13000F1FB276BCC"] = CROSS, --溢出的法�?
  ["0xF13000F1FB276BCF"] = SQUARE, --溢出的法�?
  ["0xF13000F1FC276BCE"] = MOON, --不稳定的奥术元素
  ["0xF13000F1FC2783E3"] = TRIANGLE, --不稳定的奥术元素
  ["0xF13000F1FB276BCD"] = DIAMOND, --溢出的法�?
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_5", {
  ["0xF13000F1FD2783E1"] = SKULL, --破碎的奥术元�?
  ["0xF13000F1FB276BDD"] = CROSS, --溢出的法�?
  ["0xF13000F1FB276BDF"] = SQUARE, --溢出的法�?
  ["0xF13000F1FB276BE1"] = MOON, --溢出的法�?
  ["0xF13000F1FC276BDE"] = TRIANGLE, --不稳定的奥术元素
  ["0xF13000F1FE276BE0"] = DIAMOND, --异常的法�?
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_6", {
  ["0xF13000F204276D36"] = SKULL, --徘徊的占星家
  ["0xF13000F203276D37"] = CROSS, --徘徊的工�?
  ["0xF13000F202276D35"] = SQUARE, --徘徊的魔术师
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_7", {
  ["0xF13000F204276D3B"] = SKULL, --徘徊的占星家
  ["0xF13000F202276D38"] = CROSS, --徘徊的魔术师
  ["0xF13000F202276D3A"] = SQUARE, --徘徊的魔术师
  ["0xF13000F205276D39"] = MOON, --徘徊的魔法师
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_8", {
  ["0xF13000F203276D2F"] = SKULL, --徘徊的工�?
  ["0xF13000F204276D32"] = CROSS, --徘徊的占星家
  ["0xF13000F205276D33"] = SQUARE, --徘徊的魔法师
  ["0xF13000F202276D31"] = MOON, --徘徊的魔术师
  ["0xF13000F202276D30"] = TRIANGLE, --徘徊的魔术师
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "守护者的图书馆_9", {
  ["0xF13000F204276D2B"] = SKULL, --徘徊的占星家
  ["0xF13000F203276D2D"] = CROSS, --徘徊的工�?
  ["0xF13000F205276D2C"] = SQUARE, --徘徊的魔法师
  ["0xF13000F200276D63"] = MOON, --摇摇欲坠的保护�?
})
-- Outland-荒芜巨岩 NPC 数据
-- Outland-阿卡莎神�?NPC 数据
addToDefaultNpcsToMark(L["Outland"], "阿卡莎神庙_1", {
  ["0xF13000F244276CD8"] = MOON, --被流放的食魂�?
  ["0xF13000F245276CD7"] = STAR, --德莱尼黑暗缚灵�?
})
addToDefaultNpcsToMark(L["Outland"], "阿卡莎神庙_2", {
  ["0xF13000F245276C92"] = SKULL, --德莱尼黑暗缚灵�?
  ["0xF13000F244276C94"] = CROSS, --被流放的食魂�?
  ["0xF13000F246276C84"] = CROSS, --德莱尼信�?
  ["0xF13000F246276C7E"] = SQUARE, --德莱尼信�?
})
addToDefaultNpcsToMark(L["Outland"], "阿卡莎神庙_3", {
  ["0xF13000F246276C91"] = SKULL, --德莱尼信�?
  ["0xF13000F246276C90"] = CROSS, --德莱尼信�?
  ["0xF13000F244276C8D"] = SQUARE, --被流放的食魂�?
  ["0xF13000F245276C8E"] = MOON, --德莱尼黑暗缚灵�?
  ["0xF13000F245276C8F"] = TRIANGLE, --德莱尼黑暗缚灵�?
})
addToDefaultNpcsToMark(L["Outland"], "阿卡莎神庙_4", {
  ["0xF13000F246276C8B"] = SKULL, --德莱尼信�?
  ["0xF13000F246276C8C"] = CROSS, --德莱尼信�?
  ["0xF13000F244276C88"] = SQUARE, --被流放的食魂�?
  ["0xF13000F245276C86"] = MOON, --德莱尼黑暗缚灵�?
  ["0xF13000F245276C87"] = TRIANGLE, --德莱尼黑暗缚灵�?
})
addToDefaultNpcsToMark(L["Outland"], "阿卡莎神庙_5", {
  ["0xF13000EA4D05DA44"] = SKULL, --桑夫·塔斯达尔
  ["0xF13000EA4C05DA46"] = CROSS, --德莱尼朝圣�?
  ["0xF13000EA4C05DA45"] = SQUARE, --德莱尼朝圣�?
})

-- Outland-荒芜巨岩 NPC 数据
addToDefaultNpcsToMark(L["Outland"], "荒芜巨岩_1", {
  ["0xF13000F240276CB6"] = STAR, --末日守卫歼灭者
  ["0xF13000F244276CB4"] = CIRCLE, --被流放的食魂者
  ["0xF13000F245276CB3"] = MOON, --德莱尼黑暗缚灵者
})

addToDefaultNpcsToMark(L["Outland"], "荒芜巨岩_2", {
  ["0xF13000F241276D09"] = SKULL, --地狱火毁灭者
})

addToDefaultNpcsToMark(L["Outland"], "荒芜巨岩_3", {
  ["0xF13000F241276D0A"] = SKULL, --地狱火毁灭者
})

addToDefaultNpcsToMark(L["Outland"], "荒芜巨岩_4", {
  ["0xF13000F243276D0F"] = SKULL, --战争使者监军
  ["0xF13000F240276D11"] = CROSS, --末日守卫歼灭者
  ["0xF13000F240276D10"] = SQUARE, --末日守卫歼灭者
})

-- Outland-荒芜王座 NPC 数据
addToDefaultNpcsToMark(L["Tower of Karazhan"], "荒芜王座_1", {
  ["0xF13000F23F276D12"] = STAR, --恐惧魔王末日搜寻者
  ["0xF13000F23F276D17"] = CIRCLE, --恐惧魔王末日搜寻者
  ["0xF13000F23F276D13"] = MOON, --恐惧魔王末日搜寻者
  ["0xF13000F23F276D14"] = TRIANGLE, --恐惧魔王末日搜寻者
  ["0xF13000F23F276D15"] = DIAMOND, --恐惧魔王末日搜寻者
  ["0xF13000F23F276D16"] = CROSS, --恐惧魔王末日搜寻者
})

addToDefaultNpcsToMark(L["Tower of Karazhan"], "荒芜王座_2", {
  ["0xF13000EA562797AF"] = SKULL, --虛空地狱火
})

addToDefaultNpcsToMark(L["Tower of Karazhan"], "兽栏_1", {
  ["0xF13000EF0E27472E"] = SKULL,    -- 碎笼矛兵
  ["0xF13000EF10274727"] = CROSS,    -- 幻影守卫
  ["0xF13000EF12274728"] = SQUARE,   -- 闹鬼铁匠
  ["0xF13000EF0E27472D"] = MOON,     -- 碎笼矛兵
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "兽栏_2", {
  ["0xF13000EF0E27472C"] = SKULL,    -- 碎笼矛兵
  ["0xF13000EF0E27472B"] = CROSS,    -- 碎笼矛兵
  ["0xF13000EF1027472A"] = SQUARE,   -- 幻影守卫
  ["0xF13000EF10274729"] = MOON,     -- 幻影守卫
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "兽栏_3", {
  ["0xF13000EF13278B79"] = CROSS,    -- 黑暗骑士学徒
  ["0xF13000EF13278B7A"] = SQUARE,   -- 黑暗骑士学徒
  ["0xF13000EF13278B78"] = SQUARE,   -- 黑暗骑士学徒（组内序号重复，按规则分配相同标记）
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "兽栏_4", {
  ["0xF13000EF1027471C"] = SKULL,    -- 幻影守卫
  ["0xF13000EF122746FE"] = CROSS,    -- 闹鬼铁匠
  ["0xF13000EF122746FF"] = SQUARE,   -- 闹鬼铁匠
  ["0xF13000EF12274785"] = MOON,     -- 闹鬼铁匠
  ["0xF13000EF12274702"] = TRIANGLE, -- 闹鬼铁匠
  ["0xF13000EF12274786"] = DIAMOND,  -- 闹鬼铁匠
})
addToDefaultNpcsToMark(L["Tower of Karazhan"], "兽栏_5", {
  ["0xF13000EF0F274715"] = SKULL,    -- 碎笼骨法�?
  ["0xF13000EF0E274716"] = CROSS,    -- 碎笼矛兵
  ["0xF13000EF0E274718"] = SQUARE,   -- 碎笼矛兵
  ["0xF13000EF0E27471A"] = MOON,     -- 碎笼矛兵
})
-- Molten Core-玛格曼达洞穴场景（组ID�?5-39�?
addToDefaultNpcsToMark(L["Molten Core"], "玛格曼达洞穴_1", {
  ["0xF130002D9700DD3A"] = SKULL,    -- 熔火恶犬
  ["0xF130002D9700DD3D"] = CROSS,    -- 熔火恶犬
  ["0xF130002D9700DD3C"] = SQUARE,   -- 熔火恶犬
  ["0xF130002D9700DD3B"] = MOON,     -- 熔火恶犬
  ["0xF130002D9700DD3E"] = TRIANGLE, -- 熔火恶犬
})
addToDefaultNpcsToMark(L["Molten Core"], "玛格曼达洞穴_2", {
  ["0xF130002D9700DD37"] = SKULL,    -- 熔火恶犬
  ["0xF130002D9700DD39"] = CROSS,    -- 熔火恶犬
  ["0xF130002D9700DD35"] = SQUARE,   -- 熔火恶犬
  ["0xF130002D9700DD36"] = MOON,     -- 熔火恶犬
  ["0xF130002D9700DD38"] = TRIANGLE, -- 熔火恶犬
})
addToDefaultNpcsToMark(L["Molten Core"], "玛格曼达洞穴_3", {
  ["0xF130002D9700DD41"] = SKULL,    -- 熔火恶犬
  ["0xF130002D9700DD40"] = CROSS,    -- 熔火恶犬
  ["0xF130002D9700DD3F"] = SQUARE,   -- 熔火恶犬
  ["0xF130002D9700DD42"] = MOON,     -- 熔火恶犬
  ["0xF130002D9700DD43"] = TRIANGLE, -- 熔火恶犬
})
addToDefaultNpcsToMark(L["Molten Core"], "玛格曼达洞穴_4", {
  ["0xF130002D9700DD4B"] = SKULL,    -- 熔火恶犬
  ["0xF130002D9700DD4E"] = CROSS,    -- 熔火恶犬
  ["0xF130002D9700DD4D"] = SQUARE,   -- 熔火恶犬
  ["0xF130002D9700DD4A"] = MOON,     -- 熔火恶犬
  ["0xF130002D9700DD4C"] = TRIANGLE, -- 熔火恶犬
})
addToDefaultNpcsToMark(L["Molten Core"], "玛格曼达洞穴_5", {
  ["0xF130002D9700DD48"] = SKULL,    -- 熔火恶犬
  ["0xF130002D9700DD44"] = CROSS,    -- 熔火恶犬
  ["0xF130002D9700DD49"] = SQUARE,   -- 熔火恶犬
  ["0xF130002D9700DD46"] = MOON,     -- 熔火恶犬
  ["0xF130002D9700DD47"] = TRIANGLE, -- 熔火恶犬
})
-- Outland-荒芜王座场景（组ID�?23�?05�?
addToDefaultNpcsToMark(L["Outland"], "荒芜王座_2", {
  ["0xF13000F23F276D12"] = SKULL,    -- 恐惧魔王末日搜寻�?
  ["0xF13000F23F276D17"] = CROSS,    -- 恐惧魔王末日搜寻�?
  ["0xF13000F23F276D13"] = SQUARE,   -- 恐惧魔王末日搜寻�?
  ["0xF13000F23F276D14"] = MOON,     -- 恐惧魔王末日搜寻�?
  ["0xF13000F23F276D15"] = TRIANGLE, -- 恐惧魔王末日搜寻�?
  ["0xF13000F23F276D16"] = DIAMOND,  -- 恐惧魔王末日搜寻�?
})
-- Ahn'Qiraj场景（组ID�?25-433�?
-- 卡拉�?守护者的图书馆场景（组ID�?0-17�?
-- Outland-荒芜巨岩场景（组ID�?-4�?
addToDefaultNpcsToMark(L["Outland"], "荒芜巨岩_1", {
  ["0xF13000EA38073D37"] = SKULL,    -- 摇摇欲坠的流放�?
  ["0xF13000EA38073D36"] = CROSS,    -- 摇摇欲坠的流放�?
  ["0xF13000EA38073D38"] = SQUARE,   -- 摇摇欲坠的流放�?
  ["0xF13000EA38073D39"] = MOON,     -- 摇摇欲坠的流放�?
  ["0xF13000EA39073D35"] = TRIANGLE, -- 破碎者鲁普图�?
})
addToDefaultNpcsToMark(L["Outland"], "荒芜巨岩_2", {
  ["0xF13000F246276CA8"] = SKULL,    -- 德莱尼信�?
  ["0xF13000F245276CAA"] = STAR,     -- 德莱尼黑暗缚灵者（组内序号8，对应STAR�?
  ["0xF13000F245276CA7"] = CROSS,    -- 德莱尼黑暗缚灵�?
  ["0xF13000F244276CB8"] = SQUARE,   -- 被流放的食魂�?
  ["0xF13000F245276CAB"] = MOON,     -- 德莱尼黑暗缚灵�?
  ["0xF13000F244276CA9"] = TRIANGLE, -- 被流放的食魂�?
})
addToDefaultNpcsToMark(L["Outland"], "荒芜巨岩_3", {
  ["0xF13000EA35278D9B"] = SKULL,    -- 鲁普图兰的碎�?
  ["0xF13000EA35278D9A"] = CROSS,    -- 鲁普图兰的碎�?
  ["0xF13000EA35278D99"] = SQUARE,   -- 鲁普图兰的碎�?
})
addToDefaultNpcsToMark(L["Outland"], "荒芜巨岩_4", {
  ["0xF13000F243276CB0"] = SKULL,    -- 战争使者监�?
  ["0xF13000F246276CAF"] = CROSS,    -- 德莱尼信�?
  ["0xF13000F245276CAD"] = SQUARE,   -- 德莱尼黑暗缚灵�?
  ["0xF13000F245276CAC"] = MOON,     -- 德莱尼黑暗缚灵�?
  ["0xF13000F244276CAE"] = TRIANGLE, -- 被流放的食魂�?
})


addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_2", {
  ["0xF130002D9401648A"] = SKULL,    -- 火焰之王
  ["0xF130002D9100DD9D"] = CROSS,    -- 熔岩歼灭�?
  ["0xF130002D9400DDC9"] = SQUARE,   -- 熔岩歼灭�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_3", {
  ["0xF130002D8A00DD8A"] = SKULL,    -- 熔核巨人
  ["0xF130002D8A00DD8B"] = CROSS,    -- 熔核巨人
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_4", {
  ["0xF130002D94016490"] = SKULL,    -- 熔岩歼灭�?
  ["0xF130002D91016489"] = CROSS,    -- 熔岩歼灭�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_5", {
  ["0xF130002D8A00DDAB"] = SKULL,    -- 熔核巨人
  ["0xF130002D8B00DDAC"] = CROSS,    -- 熔核摧毁�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_7", {
  ["0xF130002D9100DDA0"] = SKULL,    -- 火焰之王
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_9", {
  ["0xF130002D8B00DD7F"] = SKULL,    -- 熔核摧毁�?
  ["0xF130002D8A00DD7E"] = CROSS,    -- 熔核巨人
  ["0xF130002D9400DD91"] = SQUARE,   -- 熔岩歼灭�?
  ["0xF130002D91016493"] = MOON,     -- 熔岩歼灭�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_13", {
  ["0xF130002D8A00DD84"] = SKULL,    -- 熔核巨人
  ["0xF130002D8B00DD85"] = CROSS,    -- 熔核摧毁�?
  ["0xF130002D9100DDD4"] = SQUARE,   -- 熔岩歼灭�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_14", {
  ["0xF130002D9100DD9E"] = SKULL,    -- 火焰之王
  ["0xF130002D9100DDD7"] = CROSS,    -- 熔岩歼灭�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_15", {
  ["0xF130002D8B00DD8F"] = SKULL,    -- 熔核摧毁�?
  ["0xF130002D8A00DD8E"] = CROSS,    -- 熔核巨人
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_16", {
  ["0xF130002D9100DD97"] = TRIANGLE, -- 火焰之王
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_21", {
  ["0xF130002D9201648D"] = SKULL,    -- 火焰行�?
  ["0xF130002D9301648F"] = CROSS,    -- 烈焰守卫
  ["0xF130002F4401648E"] = SQUARE,   -- 熔岩掠夺�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_23", {
  ["0xF130002D9200DDCD"] = SKULL,    -- 火焰行�?
  ["0xF130002D9300DDCF"] = CROSS,    -- 烈焰守卫
  ["0xF130002F4400DDCE"] = SQUARE,   -- 熔岩掠夺�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_24", {
  ["0xF130002D92016481"] = SKULL,    -- 火焰行�?
  ["0xF130002D93016483"] = CROSS,    -- 烈焰守卫
  ["0xF130002F44016482"] = SQUARE,   -- 熔岩掠夺�?
  ["0xF130002D9400DDD3"] = MOON,     -- 火焰之王
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_25", {
  ["0xF130002D9301647B"] = CROSS,    -- 烈焰守卫（组内序�?重复，对应CROSS�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_26", {
  ["0xF130002D92016479"] = SKULL,    -- 火焰行�?
  ["0xF130002F2C01647C"] = SQUARE,   -- 熔岩元素
  ["0xF130002F2C01647A"] = MOON,     -- 熔岩元素
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_27", {
  ["0xF130002D9200DD99"] = SKULL,    -- 火焰行�?
  ["0xF130002D9300DD9B"] = CROSS,    -- 烈焰守卫
  ["0xF130002F2C00DD9A"] = SQUARE,   -- 熔岩元素
  ["0xF130002F2C00DD9C"] = MOON,     -- 熔岩元素
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_29", {
  ["0xF130002D9200DDAE"] = SKULL,    -- 火焰行�?
  ["0xF130002D9300DDC7"] = CROSS,    -- 烈焰守卫
  ["0xF130002F2C00DDAF"] = SQUARE,   -- 熔岩元素
  ["0xF130002F2C00DDC8"] = MOON,     -- 熔岩元素
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_30", {
  ["0xF130002D9200DDDD"] = SKULL,    -- 火焰行�?
  ["0xF130002D9300DDDF"] = CROSS,    -- 烈焰守卫
  ["0xF130002F4400DDDE"] = SQUARE,   -- 熔岩掠夺�?
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_31", {
  ["0xF130002ED400DD6C"] = SKULL,    -- 焚化者古雷曼�?
  ["0xF130002D9800DD7B"] = CROSS,    -- 熔火怒犬
  ["0xF130002D9800DD6D"] = SQUARE,   -- 熔火怒犬
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_32", {
  ["0xF130002D9400DDD0"] = SKULL,    -- 熔岩歼灭�?
  ["0xF130002D9100DDD6"] = CROSS,    -- 火焰之王
})
addToDefaultNpcsToMark(L["Molten Core"], "Molten Core_33", {
  ["0xF130002D90278C54"] = SKULL,    -- 烈焰行者精�?
  ["0xF130002D90278C56"] = CROSS,    -- 烈焰行者精�?
  ["0xF130002D90278C55"] = SQUARE,   -- 烈焰行者精�?
  ["0xF130002D90278C57"] = MOON,     -- 烈焰行者精�?
  ["0xF130002D8F278C59"] = TRIANGLE, -- 烈焰行者医�?
  ["0xF130002D8F278C5A"] = DIAMOND,  -- 烈焰行者医�?
  ["0xF130002D8F278C5B"] = STAR,     -- 烈焰行者医师（组内序号7，对应STAR�?
})
-- 纳克萨玛斯场景（组ID�?18-321�?48-351�?
addToDefaultNpcsToMark(L["Naxxramas"], "纳克萨玛斯_348", {
  ["0xF1300040BD278B84"] = CROSS,    -- 地穴卫士
  ["0xF1300040BD278B83"] = SQUARE,   -- 地穴卫士
})
addToDefaultNpcsToMark(L["Naxxramas"], "纳克萨玛斯_349", {
  ["0xF130004079278B7D"] = SKULL,    -- 纳克萨玛斯追随�?
  ["0xF130004079278B7E"] = CROSS,    -- 纳克萨玛斯追随�?
  ["0xF13000407A278B80"] = SQUARE,   -- 纳克萨玛斯信奉�?
  ["0xF13000407A278B7F"] = MOON,     -- 纳克萨玛斯信奉�?
  ["0xF13000407A278B81"] = TRIANGLE, -- 纳克萨玛斯信奉�?
  ["0xF13000407A278B82"] = DIAMOND,  -- 纳克萨玛斯信奉�?
})
addToDefaultNpcsToMark(L["Naxxramas"], "纳克萨玛斯_350", {
  ["0xF1300041A3278B88"] = SKULL,    -- 死亡骑士学员
  ["0xF1300041A3278B87"] = CROSS,    -- 死亡骑士学员
  ["0xF1300041A3278B85"] = SQUARE,   -- 死亡骑士学员
  ["0xF1300041A3278B86"] = MOON,     -- 死亡骑士学员
})
-- 祖尔格拉布场景（组内序号映射补充�?
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_163", {
  ["0xF130002C5600C245"] = SKULL,    -- 古拉巴什掷斧�?
  ["0xF130002C5600C244"] = CROSS,    -- 古拉巴什掷斧�?
  ["0xF130002C5600BFCE"] = SQUARE,   -- 古拉巴什掷斧�?
  ["0xF130002C5600BFCF"] = MOON,     -- 古拉巴什掷斧�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_164", {
  ["0xF130002C6C00BFDF"] = SKULL,    -- 拉札希奎�?
  ["0xF130002C6B00BFDC"] = CROSS,    -- 拉扎什毒蛇
  ["0xF130002C6B00BFDD"] = SQUARE,   -- 拉扎什毒蛇
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_165", {
  ["0xF130002C6C00C24B"] = SKULL,    -- 拉札希奎�?
  ["0xF130002C6C00C24C"] = CROSS,    -- 拉札希奎�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_166", {
  ["0xF130002C6C00BFC0"] = SKULL,    -- 拉札希奎�?
  ["0xF130002C6B00BFC1"] = CROSS,    -- 拉扎什毒蛇
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_167", {
  ["0xF130002C5600C24D"] = SKULL,    -- 古拉巴什掷斧�?
  ["0xF130002E3600C24E"] = CROSS,    -- 哈卡莱祭�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_170", {
  ["0xF130002C6C00C253"] = SKULL,    -- 拉札希奎�?
  ["0xF130002C6C00C254"] = CROSS,    -- 拉札希奎�?
  ["0xF130002C6B00C256"] = SQUARE,   -- 拉扎什毒蛇
  ["0xF130002C6C00C255"] = MOON,     -- 拉札希奎�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_171", {
  ["0xF130003AC301655C"] = SKULL,    -- 祖利安鳄�?
  ["0xF130003AC3016559"] = CROSS,    -- 祖利安鳄�?
  ["0xF130003AC301655A"] = SQUARE,   -- 祖利安鳄�?
  ["0xF130003AC3016558"] = MOON,     -- 祖利安鳄�?
  ["0xF130003AC301655B"] = TRIANGLE, -- 祖利安鳄�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_173", {
  ["0xF130002C5700BFE0"] = SKULL,    -- 古拉巴什猎头�?
  ["0xF130002C5700BFE1"] = CROSS,    -- 古拉巴什猎头�?
  ["0xF130002E3700BFE2"] = SQUARE,   -- 哈卡莱巫�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_174", {
  ["0xF13000399E00C029"] = SKULL,    -- 古拉巴什蝙蝠骑士
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_183", {
  ["0xF130003AC300C22E"] = SKULL,    -- 祖利安鳄�?
  ["0xF130003AC300C22F"] = CROSS,    -- 祖利安鳄�?
  ["0xF130003AC300C230"] = SQUARE,   -- 祖利安鳄�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_184", {
  ["0xF130003AC3016560"] = SKULL,    -- 祖利安鳄�?
  ["0xF130003AC301655F"] = CROSS,    -- 祖利安鳄�?
  ["0xF130003AC301655D"] = SQUARE,   -- 祖利安鳄�?
  ["0xF130003AC3016561"] = MOON,     -- 祖利安鳄�?
  ["0xF130003AC301655E"] = TRIANGLE, -- 祖利安鳄�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_188", {
  ["0xF1300038AB00C02A"] = SKULL,    -- 高阶祭司温诺希斯
  ["0xF130002C6D00C02C"] = CROSS,    -- 拉扎什眼镜�?
  ["0xF130002C6D00C02B"] = SQUARE,   -- 拉扎什眼镜�?
  ["0xF130002C6D00C02E"] = MOON,     -- 拉扎什眼镜�?
  ["0xF130002C6D00C02D"] = TRIANGLE, -- 拉扎什眼镜�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_192", {
  ["0xF130002C6A00C062"] = TRIANGLE, -- 拉札希寡妇蜘蛛（组内序号2，补充标记）
  ["0xF130002C6A00C067"] = DIAMOND,  -- 拉札希寡妇蜘蛛（组内序号3，补充标记）
  ["0xF130002C4A00C042"] = STAR,     -- 哈卡莱暗影法师（组内序号4，补充标记）
  ["0xF130002C4A00C052"] = CIRCLE,   -- 哈卡莱暗影法师（组内序号2，补充标记）
  ["0xF130002C4A00C053"] = UNMARKED, -- 哈卡莱暗影法师（组内序号3，补充标记）
  ["0xF130002C6A00C26A"] = UNMARKED, -- 拉札希寡妇蜘蛛（组内序号4，补充标记）
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_193", {
  ["0xF130003A2000C032"] = SKULL,    -- 拉札希诱捕�?
  ["0xF130003A2000C267"] = STAR,     -- 拉札希诱捕者（组内序号8，对应STAR�?
  ["0xF130003A2000C266"] = MOON,     -- 拉札希诱捕者（组内序号7，对应MOON�?
  ["0xF130002C6A00C058"] = CROSS,    -- 拉札希寡妇蜘�?
  ["0xF130002C6A00C05D"] = SQUARE,   -- 拉札希寡妇蜘�?
  ["0xF130002C6A00C04C"] = CROSS,    -- 拉札希寡妇蜘蛛（组内序号2，重复标记）
  ["0xF130002C6A00C051"] = SQUARE,   -- 拉札希寡妇蜘蛛（组内序号3，重复标记）
  ["0xF130002C4A00C043"] = MOON,     -- 哈卡莱暗影法�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_196", {
  ["0xF130002E3600C274"] = SKULL,    -- 哈卡莱祭�?
  ["0xF130002C5900C272"] = CROSS,    -- 古拉巴什饮血�?
  ["0xF130002C5900C273"] = SQUARE,   -- 古拉巴什饮血�?
  ["0xF1300039E500CB09"] = MOON,     -- 拉札希迅猛龙
  ["0xF130002E3600CB12"] = TRIANGLE, -- 哈卡莱祭司（组内序号5，补充标记）
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_197", {
  ["0xF130002C5C00CB06"] = SKULL,    -- 古拉巴什勇士
  ["0xF130002C5C00C904"] = CROSS,    -- 古拉巴什勇士
  ["0xF130002C5C00CB05"] = SQUARE,   -- 古拉巴什勇士
  ["0xF130002C5C00C905"] = MOON,     -- 古拉巴什勇士
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_199", {
  ["0xF130002C5C00C286"] = SQUARE,   -- 古拉巴什勇士
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_201", {
  ["0xF1300039E500C07C"] = SKULL,    -- 拉札希迅猛龙
  ["0xF1300039E500C96C"] = CROSS,    -- 拉札希迅猛龙
  ["0xF1300039E500C07A"] = SQUARE,   -- 拉札希迅猛龙
  ["0xF1300039E500C96D"] = MOON,     -- 拉札希迅猛龙
  ["0xF1300039E500C07B"] = TRIANGLE, -- 拉札希迅猛龙
  ["0xF1300039E500C906"] = DIAMOND,  -- 拉札希迅猛龙
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_202", {
  ["0xF130002E3600C081"] = SKULL,    -- 哈卡莱祭�?
  ["0xF130002C5C00C080"] = CROSS,    -- 古拉巴什勇士
  ["0xF130002C5C00C077"] = SQUARE,   -- 古拉巴什勇士
  ["0xF130002C5C00C076"] = MOON,     -- 古拉巴什勇士
  ["0xF130002C5900C07F"] = TRIANGLE, -- 古拉巴什饮血�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_203", {
  ["0xF1300039E500C8FD"] = SKULL,    -- 拉札希迅猛龙
  ["0xF1300039E500C8FF"] = CROSS,    -- 拉札希迅猛龙
  ["0xF1300039E500CB0B"] = SQUARE,   -- 拉札希迅猛龙
  ["0xF1300039E500C8FE"] = MOON,     -- 拉札希迅猛龙
  ["0xF1300039E500CB0C"] = TRIANGLE, -- 拉札希迅猛龙
  ["0xF1300039E500CB0A"] = DIAMOND,  -- 拉札希迅猛龙
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_204", {
  ["0xF130002C6B00C25E"] = SKULL,    -- 拉扎什毒蛇
  ["0xF130002C6C00C25B"] = CROSS,    -- 拉札希奎�?
  ["0xF130002C6B00C25D"] = SQUARE,   -- 拉扎什毒蛇
  ["0xF130002C6B00C25F"] = MOON,     -- 拉扎什毒蛇
  ["0xF130002C6C00C25C"] = TRIANGLE, -- 拉札希奎�?
  ["0xF130002C6B00C260"] = DIAMOND,  -- 拉扎什毒蛇
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_206", {
  ["0xF130002C6B00C246"] = SKULL,    -- 拉扎什毒蛇
  ["0xF130002C6B00C247"] = CROSS,    -- 拉扎什毒蛇
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_211", {
  ["0xF130003AC300CAF9"] = SKULL,    -- 祖利安鳄�?
  ["0xF130003AC300CAF3"] = CROSS,    -- 祖利安鳄�?
  ["0xF130003AC300CAF8"] = SQUARE,   -- 祖利安鳄�?
  ["0xF130003AC300CAF5"] = MOON,     -- 祖利安鳄�?
  ["0xF130003AC300CAF4"] = TRIANGLE, -- 祖利安鳄�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_212", {
  ["0xF130003AC300C238"] = SKULL,    -- 祖利安鳄�?
  ["0xF130003AC300C237"] = CROSS,    -- 祖利安鳄�?
  ["0xF130003AC300C239"] = SQUARE,   -- 祖利安鳄�?
  ["0xF130003AC300C236"] = MOON,     -- 祖利安鳄�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_213", {
  ["0xF130002C5600C096"] = SKULL,    -- 古拉巴什掷斧�?
  ["0xF130002C5600C095"] = CROSS,    -- 古拉巴什掷斧�?
  ["0xF130002C6100C982"] = SQUARE,   -- 祖利安猛�?
  ["0xF130002C6100C981"] = MOON,     -- 祖利安猛�?
  ["0xF130002C6100C983"] = TRIANGLE, -- 祖利安猛�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_215", {
  ["0xF130002C5600C893"] = SKULL,    -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C5600C891"] = CROSS,    -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C6100C291"] = SQUARE,   -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C290"] = MOON,     -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C28F"] = TRIANGLE, -- 祖利安猛虎（希瓦拉尔之角�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_216", {
  ["0xF130002C5600C980"] = SKULL,    -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C5600C97F"] = CROSS,    -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C5600C97E"] = SQUARE,   -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C6100C289"] = MOON,     -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C28B"] = TRIANGLE, -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C28C"] = DIAMOND,  -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C28D"] = STAR,     -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C28A"] = CIRCLE,   -- 祖利安猛虎（希瓦拉尔之角�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_217", {
  ["0xF130002C5600C09D"] = SKULL,    -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C5600C09C"] = CROSS,    -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C5600C09B"] = SQUARE,   -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C6100C093"] = MOON,     -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C094"] = TRIANGLE, -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C090"] = DIAMOND,  -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C091"] = STAR,     -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C092"] = CIRCLE,   -- 祖利安猛虎（希瓦拉尔之角�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_218", {
  ["0xF130002C6100C09F"] = MOON,     -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C0A0"] = TRIANGLE, -- 祖利安猛虎（希瓦拉尔之角�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_219", {
  ["0xF130002C5600C295"] = SKULL,    -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C5600C294"] = CROSS,    -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C5600C293"] = SQUARE,   -- 古拉巴什掷斧者（希瓦拉尔之角�?
  ["0xF130002C6100C898"] = MOON,     -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C896"] = TRIANGLE, -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C897"] = DIAMOND,  -- 祖利安猛虎（希瓦拉尔之角�?
  ["0xF130002C6100C895"] = STAR,     -- 祖利安猛虎（希瓦拉尔之角�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_220", {
  ["0xF130002C6C00CAEE"] = SKULL,    -- 拉札希奎蛇（希瓦拉尔之角�?
  ["0xF130002C6C00CAED"] = CROSS,    -- 拉札希奎蛇（希瓦拉尔之角�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_222", {
  ["0xF130002E36016578"] = SKULL,    -- 哈卡莱祭�?
  ["0xF130002C56016577"] = CROSS,    -- 古拉巴什掷斧�?
  ["0xF130002C6100C234"] = SQUARE,   -- 祖利安猛�?
  ["0xF130002C6100C235"] = MOON,     -- 祖利安猛�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_223", {
  ["0xF130002E37016549"] = SKULL,    -- 哈卡莱巫�?
  ["0xF130002C56016548"] = CROSS,    -- 古拉巴什掷斧�?
  ["0xF130002C6100C224"] = SQUARE,   -- 祖利安猛�?
  ["0xF130002C6100C223"] = MOON,     -- 祖利安猛�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_224", {
  ["0xF130002C6500C0A5"] = MOON,     -- 祖利安雌猎虎（贝瑟克神庙�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_225", {
  ["0xF130002C6500C0A4"] = CROSS,    -- 祖利安雌猎虎（贝瑟克神庙�?
  ["0xF130002C6500C0A3"] = SQUARE,   -- 祖利安雌猎虎（贝瑟克神庙�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_226", {
  ["0xF130002E36016555"] = SKULL,    -- 哈卡莱祭司（贝瑟克神庙）
  ["0xF130002C56016554"] = CROSS,    -- 古拉巴什掷斧者（贝瑟克神庙）
  ["0xF130002C6C00BF97"] = SQUARE,   -- 拉札希奎蛇（贝瑟克神庙）
  ["0xF130002C6B00BF98"] = MOON,     -- 拉扎什毒蛇（贝瑟克神庙�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_227", {
  ["0xF130002E3600C226"] = SKULL,    -- 哈卡莱祭�?
  ["0xF130002C5700C225"] = CROSS,    -- 古拉巴什猎头�?
  ["0xF1300039E5016564"] = SQUARE,   -- 拉札希迅猛龙
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_228", {
  ["0xF130002C4B00C227"] = SKULL,    -- 哈卡莱暗影猎�?
  ["0xF130002C5900C228"] = CROSS,    -- 古拉巴什饮血�?
  ["0xF130002C6B00CAF0"] = SQUARE,   -- 拉扎什毒蛇
  ["0xF130002C6C00CAEF"] = MOON,     -- 拉札希奎�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_229", {
  ["0xF130002E36016531"] = SKULL,    -- 哈卡莱祭�?
  ["0xF130002C57016530"] = CROSS,    -- 古拉巴什猎头�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_230", {
  ["0xF130002C5900C988"] = SKULL,    -- 古拉巴什饮血者（贝瑟克神庙）
  ["0xF130002C5900C989"] = CROSS,    -- 古拉巴什饮血者（贝瑟克神庙）
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_231", {
  ["0xF130002C5900C8A8"] = SKULL,    -- 古拉巴什饮血者（贝瑟克神庙）
  ["0xF130002C5900C8A7"] = CROSS,    -- 古拉巴什饮血者（贝瑟克神庙）
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_237", {
  ["0xF130003A2300C0E5"] = SKULL,    -- 巫毒奴隶（血火之池）
  ["0xF130003A2300C0E6"] = CROSS,    -- 巫毒奴隶（血火之池）
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_239", {
  ["0xF130003A2300C0F4"] = SKULL,    -- 巫毒奴隶（血火之池）
  ["0xF130003A2300C0F3"] = CROSS,    -- 巫毒奴隶（血火之池）
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_240", {
  ["0xF130002E3600CAA8"] = SKULL,    -- 哈卡莱祭�?
  ["0xF130002C5700CAA3"] = CROSS,    -- 古拉巴什猎头�?
  ["0xF1300038C4016536"] = SQUARE,   -- 拉札希毒液蜘�?
  ["0xF1300038C4016535"] = MOON,     -- 拉札希毒液蜘�?
})
addToDefaultNpcsToMark(L["Zul'Gurub"], "祖尔格拉布_244", {
  ["0xF130002C4C00C8CB"] = CROSS,    -- 哈卡莱鲜血祭司（血神祭坛）
})

--/////////////// Tower of Karazhan ///////////////
-- 注意：不要重置defaultNpcsToMark[L["Tower of Karazhan"]]，否则会清除之前的配�?

-- 卡拉�?破碎阶梯1
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_broken_stair1", {
  ["0xF13000F1EE276B21"] = SKULL,    -- 幽灵工人（破碎阶梯）
  ["0xF13000F1EE276B1F"] = CROSS,    -- 幽灵工人（破碎阶梯）
  ["0xF13000F1EE276B20"] = SQUARE,   -- 幽灵工人（破碎阶梯）
})

-- 卡拉�?破碎阶梯2  
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_broken_stair2", {
  ["0xF13000F1F1276B23"] = SKULL,    -- 影爪狼人（破碎阶梯）
  ["0xF13000F1F1276B24"] = CROSS,    -- 影爪狼人（破碎阶梯）
  ["0xF13000F1EE276B25"] = SQUARE,   -- 幽灵工人（破碎阶梯）
  ["0xF13000F1F2276B2C"] = STAR,     -- 影爪狂暴者（破碎阶梯�?
})

-- 卡拉�?破碎阶梯3
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_broken_stair3", {
  ["0xF13000F1F0276B28"] = SKULL,    -- 影爪暗行者（破碎阶梯�?
  ["0xF13000F1F1276B29"] = CROSS,    -- 影爪狼人（破碎阶梯）
  ["0xF13000F1F2276B26"] = SQUARE,   -- 影爪狂暴者（破碎阶梯�?
  ["0xF13000F1F1276B27"] = MOON,     -- 影爪狼人（破碎阶梯）
  ["0xF13000F1F1276B57"] = TRIANGLE, -- 影爪狼人（破碎阶梯）
  ["0xF13000F1F1276B2B"] = DIAMOND,  -- 影爪狼人（破碎阶梯）
})

-- 卡拉�?破碎阶梯4
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_broken_stair4", {
  ["0xF13000F1F0276B33"] = SKULL,    -- 影爪暗行者（破碎阶梯�?
  ["0xF13000F1F2276B31"] = CROSS,    -- 影爪狂暴者（破碎阶梯�?
  ["0xF13000F1F1276B32"] = SQUARE,   -- 影爪狼人（破碎阶梯）
  ["0xF13000F1F1276B30"] = MOON,     -- 影爪狼人（破碎阶梯）
  ["0xF13000F1EF276B36"] = TRIANGLE, -- 暮牙爬行者（破碎阶梯�?
  ["0xF13000F1ED276B2E"] = DIAMOND,  -- 大型暗翼（破碎阶梯）
  ["0xF13000F1ED276B2F"] = STAR,    -- 大型暗翼（破碎阶梯）
  ["0xF13000F1EC276B2D"] = CIRCLE,   -- 吸血暗翼（破碎阶梯）
})

-- 卡拉�?破碎阶梯5
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_broken_stair5", {
  ["0xF13000F1EE276B34"] = SKULL,    -- 幽灵工人（破碎阶梯）
})

-- 卡拉�?破碎阶梯6
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_broken_stair6", {
  ["0xF13000F1ED276B39"] = SKULL,    -- 大型暗翼（破碎阶梯）
  ["0xF13000F1EE276B37"] = CROSS,    -- 幽灵工人（破碎阶梯）
  ["0xF13000F1EE276B38"] = SQUARE,   -- 幽灵工人（破碎阶梯）
})

-- 卡拉�?破碎阶梯7
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_broken_stair7", {
  ["0xF13000F1EE276B3B"] = SKULL,    -- 幽灵工人（破碎阶梯）
  ["0xF13000F1F1276B3A"] = CROSS,    -- 影爪狼人（破碎阶梯）
})

-- 卡拉�?破碎阶梯8
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_broken_stair8", {
  ["0xF13000F1F0276B40"] = SKULL,    -- 影爪暗行者（破碎阶梯�?
  ["0xF13000F1F2276B41"] = CROSS,    -- 影爪狂暴者（破碎阶梯�?
  ["0xF13000F1F2276B42"] = SQUARE,   -- 影爪狂暴者（破碎阶梯�?
  ["0xF13000F1F1276B3E"] = MOON,     -- 影爪狼人（破碎阶梯）
  ["0xF13000F1F1276B3D"] = TRIANGLE, -- 影爪狼人（破碎阶梯）
  ["0xF13000F1F0276B43"] = DIAMOND,  -- 影爪暗行者（破碎阶梯�?
})

-- 卡拉�?怪物展览�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_bestiary1", {
  ["0xF13000F1F0276B4A"] = SKULL,    -- 影爪暗行者（怪物展览馆）
  ["0xF13000F1F1276B46"] = CROSS,    -- 影爪狼人（怪物展览馆）
})

-- 卡拉�?怪物展览�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_bestiary2", {
  ["0xF13000F1F0276B48"] = SKULL,    -- 影爪暗行者（怪物展览馆）
  ["0xF13000F1EC276B44"] = CROSS,    -- 吸血暗翼（怪物展览馆）
})

-- 卡拉�?怪物展览�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_bestiary3", {
  ["0xF13000F1F0276B4D"] = SKULL,    -- 影爪暗行者（怪物展览馆）
})

-- 卡拉�?怪物展览�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_bestiary4", {
  ["0xF13000F1F0276B50"] = SKULL,    -- 影爪暗行者（怪物展览馆）
  ["0xF13000F1F0276B4F"] = CROSS,    -- 影爪暗行者（怪物展览馆）
  ["0xF13000F1F0276B53"] = SQUARE,   -- 影爪暗行者（怪物展览馆）
  ["0xF13000F1F1276B54"] = MOON,     -- 影爪狼人（怪物展览馆）
  ["0xF13000F1F2276B52"] = TRIANGLE, -- 影爪狂暴者（怪物展览馆）
  ["0xF13000F1F2276B51"] = DIAMOND,  -- 影爪狂暴者（怪物展览馆）
  ["0xF13000F1F1276B55"] = STAR,    -- 影爪狼人（怪物展览馆）
})

-- 卡拉�?怪物展览�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_bestiary5", {
  ["0xF13000F1F7276B9E"] = SKULL,    -- 魔鳞抑法者（怪物展览馆）
  ["0xF13000F1F8276B9C"] = CROSS,    -- 魔鳞织法者（怪物展览馆）
  ["0xF13000F1F6276B9B"] = SQUARE,   -- 魔鳞护龙者（怪物展览馆）
  ["0xF13000F1F8276B9F"] = MOON,     -- 魔鳞织法者（怪物展览馆）
})

-- 卡拉�?守护者的图书�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library1", {
  ["0xF13000F1F7276B70"] = SKULL,    -- 魔鳞抑法者（守护者的图书馆）
  ["0xF13000F1F8276B97"] = CROSS,    -- 魔鳞织法者（守护者的图书馆）
})

-- 卡拉�?守护者的图书�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library2", {
  ["0xF13000F1F8276B62"] = SKULL,    -- 魔鳞织法者（守护者的图书馆）
  ["0xF13000F1F8276B61"] = CROSS,    -- 魔鳞织法者（守护者的图书馆）
  ["0xF13000F1F6276B60"] = SQUARE,   -- 魔鳞护龙者（守护者的图书馆）
})

-- 卡拉�?守护者的图书�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library3", {
  ["0xF13000EA55278B79"] = SKULL,    -- 魔鳞魔网搜寻者（守护者的图书馆）
  ["0xF13000EA55278B7B"] = CROSS,    -- 魔鳞魔网搜寻者（守护者的图书馆）
  ["0xF13000EA55278B7C"] = SQUARE,   -- 魔鳞魔网搜寻者（守护者的图书馆）
  ["0xF13000EA55278B7A"] = MOON,     -- 魔鳞魔网搜寻者（守护者的图书馆）
})

-- 卡拉�?守护者的图书�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library4", {
  ["0xF13000F1FD276BDA"] = SKULL,    -- 破碎的奥术元素（守护者的图书馆）
  ["0xF13000F1FC276BDC"] = CROSS,    -- 不稳定的奥术元素（守护者的图书馆）
  ["0xF13000F1FC276BD9"] = SQUARE,   -- 不稳定的奥术元素（守护者的图书馆）
  ["0xF13000F1FB276BDB"] = MOON,     -- 溢出的法力（守护者的图书馆）
  ["0xF13000F1FB276BD8"] = TRIANGLE, -- 溢出的法力（守护者的图书馆）
  ["0xF13000F1FB2783E2"] = DIAMOND,  -- 溢出的法力（守护者的图书馆）
})

-- 卡拉�?守护者的图书�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library5", {
  ["0xF13000F1FE276D4D"] = CROSS,    -- 异常的法力（守护者的图书馆）
  ["0xF13000F205276D44"] = SKULL,    -- 徘徊的魔法师（守护者的图书馆）
})





-- 卡拉赞之塔
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library7", {
  ["0xF13000F1FB276D47"] = TRIANGLE, -- 溢出的法力（卡拉赞之塔）
  ["0xF13000F200276D64"] = SQUARE,   -- 摇摇欲坠的保护者（卡拉赞之塔）
  ["0xF13000F205276D44"] = SKULL,    -- 徘徊的魔法师（卡拉赞之塔）
  ["0xF13000F201276D65"] = MOON,     -- 卡拉赞守护魔像（卡拉赞之塔）
  ["0xF13000F204276D43"] = CROSS,    -- 徘徊的占星家（卡拉赞之塔）
})

-- 卡拉赞之塔1
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library8", {
  ["0xF13000F1FD2783E0"] = SQUARE,   -- 破碎的奥术元素（卡拉赞之塔）
  ["0xF13000F204276D4A"] = SKULL,    -- 徘徊的占星家（卡拉赞之塔）
  ["0xF13000F202276D49"] = CROSS,    -- 徘徊的魔术师（卡拉赞之塔）
})

-- 卡拉�?象棋大厅1
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_chess_hall1", {
  ["0xF13000EA42276C07"] = SKULL,    -- 战车（象棋大厅）
  ["0xF13000EA40276C08"] = CROSS,    -- 骑士（象棋大厅）
  ["0xF13000EA3F276C05"] = SQUARE,   -- 国王（象棋大厅）
  ["0xF13000BF76278777"] = MOON,     -- 失控的骑士（象棋大厅�?
  ["0xF13000BF74278778"] = TRIANGLE, -- 损坏的战车（象棋大厅�?
  ["0xF13000BF75278779"] = DIAMOND,  -- 干枯的主教（象棋大厅�?
  ["0xF13000EA43276C06"] = STAR,     -- 主教（象棋大厅）
})

-- 卡拉�?象棋大厅2
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_chess_hall2", {
  ["0xF13000F204276D56"] = SKULL,    -- 徘徊的占星家（象棋大厅）
  ["0xF13000F203276D54"] = CROSS,    -- 徘徊的工匠（象棋大厅�?
  ["0xF13000F202276D53"] = SQUARE,   -- 徘徊的魔术师（象棋大厅）
  ["0xF13000F205276D55"] = MOON,     -- 徘徊的魔法师（象棋大厅）
})

-- 卡拉�?象棋大厅3
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_chess_hall3", {
  ["0xF13000F204276D58"] = SKULL,    -- 徘徊的占星家（象棋大厅）
  ["0xF13000F203276D5B"] = CROSS,    -- 徘徊的工匠（象棋大厅�?
  ["0xF13000F205276D5A"] = SQUARE,   -- 徘徊的魔法师（象棋大厅）
  ["0xF13000F202276D57"] = MOON,     -- 徘徊的魔术师（象棋大厅）
})

-- 卡拉�?被遗忘的回响1
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_forgotten_echo1", {
  ["0xF13000F48F278746"] = SKULL,    -- 被遗忘的回响
  ["0xF13000F48F278747"] = CROSS,    -- 被遗忘的回响
})

-- 卡拉�?被遗忘的回响2
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_forgotten_echo2", {
  ["0xF13000F48F278741"] = SKULL,    -- 被遗忘的回响
  ["0xF13000F48F278740"] = CROSS,    -- 被遗忘的回响
  ["0xF13000F48F27873F"] = SQUARE,   -- 被遗忘的回响
})

-- 卡拉�?荒芜的入侵�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_desolate_invader1", {
  ["0xF13000F48C278724"] = SKULL,    -- 荒芜的入侵�?
  ["0xF13000F48D278726"] = CROSS,    -- 荒芜的毁灭�?
  ["0xF13000F48C278725"] = SQUARE,   -- 荒芜的入侵�?
})

-- 卡拉�?虚空异界1
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_void_otherworld1", {
  ["0xF13000F48C278714"] = SKULL,    -- 荒芜的入侵者（虚空异界�?
  ["0xF13000F48C278713"] = CROSS,    -- 荒芜的入侵者（虚空异界�?
  ["0xF13000F48D278715"] = SQUARE,   -- 荒芜的毁灭者（虚空异界�?
})

-- 卡拉�?虚空异界2
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_void_otherworld2", {
  ["0xF13000F48C278711"] = SKULL,    -- 荒芜的入侵者（虚空异界�?
  ["0xF13000F48D278712"] = CROSS,    -- 荒芜的毁灭者（虚空异界�?
  ["0xF13000F48C278710"] = SQUARE,   -- 荒芜的入侵者（虚空异界�?
})

-- 卡拉�?虚空异界3
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_void_otherworld3", {
  ["0xF13000F48E27870B"] = SKULL,    -- 伊玛高尔，荒芜的先驱（虚空异界）
  ["0xF13000F48D27870D"] = CROSS,    -- 荒芜的毁灭者（虚空异界�?
  ["0xF13000F48C27870F"] = SQUARE,   -- 荒芜的入侵者（虚空异界�?
  ["0xF13000F48D27870C"] = MOON,     -- 荒芜的毁灭者（虚空异界�?
})

-- 卡拉�?守护者的图书�?

-- 卡拉�?守护者的图书�?

-- 卡拉�?守护者的图书�?
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library9", {
  ["0xF13000F1FE2783E6"] = SKULL,    -- 异常的法力（守护者的图书馆）
})

-- 卡拉�?守护者的图书�?0
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_guardian_library10", {
  ["0xF13000F1FD2783DF"] = SKULL,    -- 破碎的奥术元素（守护者的图书馆）
})

-- 卡拉�?守护者的图书�?1

-- 卡拉�?守护者的图书�?2

-- 卡拉�?守护者的图书�?3

-- 卡拉�?守护者的图书�?4

-- 卡拉�?守护者的图书�?5

-- 卡拉�?虚空异界3

-- 卡拉�?兽栏1

-- 卡拉�?兽栏2

-- 卡拉�?舞厅1

-- 卡拉�?舞厅2
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_ballroom2", {
  ["0xF13000EF102756C3"] = SKULL,    -- 幻影守卫（舞厅）
  ["0xF13000EF152756C1"] = CROSS,    -- 幻影仆从（舞厅）
  ["0xF13000EF152756C2"] = SQUARE,   -- 幻影仆从（舞厅）
  ["0xF13000EF072747D6"] = MOON,     -- 影刺前锋（舞厅）
  ["0xF13000EF072747D7"] = DIAMOND,  -- 影刺前锋（舞厅）
})

-- 卡拉�?舞厅3
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_ballroom3", {
  ["0xF13000EF102756C6"] = SKULL,    -- 幻影守卫（舞厅）
  ["0xF13000EF152756C4"] = CROSS,    -- 幻影仆从（舞厅）
  ["0xF13000EF152756C5"] = SQUARE,   -- 幻影仆从（舞厅）
  ["0xF13000EF072747DA"] = MOON,     -- 影刺前锋（舞厅）
  ["0xF13000EF072747D8"] = TRIANGLE, -- 影刺前锋（舞厅）
  ["0xF13000EF072747D9"] = DIAMOND,  -- 影刺前锋（舞厅）
})

-- 卡拉�?舞厅4
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_ballroom4", {
  ["0xF13000EF102756C9"] = SKULL,    -- 幻影守卫（舞厅）
  ["0xF13000EF152756C7"] = CROSS,    -- 幻影仆从（舞厅）
  ["0xF13000EF152756C8"] = SQUARE,   -- 幻影仆从（舞厅）
  ["0xF13000EF072747DD"] = MOON,     -- 影刺前锋（舞厅）
  ["0xF13000EF072747DB"] = TRIANGLE, -- 影刺前锋（舞厅）
  ["0xF13000EF072747DC"] = DIAMOND,  -- 影刺前锋（舞厅）
})

-- 卡拉�?舞厅5
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_ballroom5", {
  ["0xF13000EF102756CC"] = SKULL,    -- 幻影守卫（舞厅）
  ["0xF13000EF152756CA"] = CROSS,    -- 幻影仆从（舞厅）
  ["0xF13000EF152756CB"] = SQUARE,   -- 幻影仆从（舞厅）
})

-- 卡拉�?舞厅6
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_ballroom6", {
  ["0xF13000EF102756CF"] = SKULL,    -- 幻影守卫（舞厅）
  ["0xF13000EF152756CD"] = CROSS,    -- 幻影仆从（舞厅）
  ["0xF13000EF152756CE"] = SQUARE,   -- 幻影仆从（舞厅）
  ["0xF13000EF072747E2"] = MOON,     -- 影刺前锋（舞厅）
  ["0xF13000EF072747E0"] = TRIANGLE, -- 影刺前锋（舞厅）
  ["0xF13000EF072747E1"] = DIAMOND,  -- 影刺前锋（舞厅）
})

-- 卡拉�?舞厅7
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_ballroom7", {
  ["0xF13000EF102756D2"] = SKULL,    -- 幻影守卫（舞厅）
  ["0xF13000EF152756D0"] = CROSS,    -- 幻影仆从（舞厅）
  ["0xF13000EF152756D1"] = SQUARE,   -- 幻影仆从（舞厅）
  ["0xF13000EF072747E5"] = MOON,     -- 影刺前锋（舞厅）
  ["0xF13000EF072747E3"] = TRIANGLE, -- 影刺前锋（舞厅）
  ["0xF13000EF072747E4"] = DIAMOND,  -- 影刺前锋（舞厅）
})

-- 卡拉�?舞厅8
addToDefaultNpcsToMark(L["Tower of Karazhan"], "karazhan_ballroom8", {
  ["0xF13000EF102756D5"] = SKULL,    -- 幻影守卫（舞厅）
  ["0xF13000EF152756D3"] = CROSS,    -- 幻影仆从（舞厅）
  ["0xF13000EF152756D4"] = SQUARE,   -- 幻影仆从（舞厅）
  ["0xF13000EF072747E8"] = MOON,     -- 影刺前锋（舞厅）
  ["0xF13000EF072747E6"] = TRIANGLE, -- 影刺前锋（舞厅）
  ["0xF13000EF072747E7"] = DIAMOND,  -- 影刺前锋（舞厅）
})

-- 安其�?

-- 安其�?

-- 安其�?

-- 安其�?

-- 安其�?

-- 安其�?

-- 安其�?

-- 安其�?

-- 安其�?

-- 安其�?0

-- 安其�?1

-- 安其�?2
addToDefaultNpcsToMark(L["Ahn'Qiraj"], "ahnqiraj12", {
  ["0xF130003CB7015631"] = SKULL,    -- 亚尔基公�?
  ["0xF130003C97015632"] = CROSS,    -- 克里勋爵
  ["0xF130003CB8015633"] = SQUARE,   -- 维姆
})

-- 安其�?3

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins1", {
  ["0xF130003D1001567D"] = SKULL,    -- 佐拉钉刺�?
  ["0xF130003D1001567C"] = CROSS,    -- 佐拉钉刺�?
  ["0xF130003D1001567B"] = SQUARE,   -- 佐拉钉刺�?
  ["0xF130003D1001567E"] = MOON,     -- 佐拉钉刺�?
})

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins2", {
  ["0xF130003D1001568A"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015689"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015688"] = SQUARE,   -- 佐拉黄蜂
  ["0xF130003D1001568B"] = MOON,     -- 佐拉黄蜂
})

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins3", {
  ["0xF130003D1001568E"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001568F"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015690"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins4", {
  ["0xF130003D10015691"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015692"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015693"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins5", {
  ["0xF130003D10015694"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015695"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015696"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins6", {
  ["0xF130003D10015697"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015698"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015699"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins7", {
  ["0xF130003D1001569A"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001569B"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001569C"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins8", {
  ["0xF130003D1001569D"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001569E"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001569F"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins9", {
  ["0xF130003D100156A0"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156A1"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156A2"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins10", {
  ["0xF130003D100156A3"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156A4"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156A5"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins11", {
  ["0xF130003D100156A6"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156A7"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156A8"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins12", {
  ["0xF130003D100156A9"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156AA"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156AB"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins13", {
  ["0xF130003D100156AC"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156AD"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156AE"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins14", {
  ["0xF130003D100156AF"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156B0"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156B1"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins15", {
  ["0xF130003D100156B2"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156B3"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156B4"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins16", {
  ["0xF130003D100156B5"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156B6"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156B7"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins17", {
  ["0xF130003D100156B8"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156B9"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156BA"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins18", {
  ["0xF130003D100156BB"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156BC"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156BD"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins19", {
  ["0xF130003D100156BE"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156BF"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156C0"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins20", {
  ["0xF130003D100156C1"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156C2"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156C3"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins21", {
  ["0xF130003D100156C4"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156C5"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156C6"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins22", {
  ["0xF130003D100156C7"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156C8"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156C9"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins23", {
  ["0xF130003D100156CA"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156CB"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156CC"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins24", {
  ["0xF130003D100156CD"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156CE"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156CF"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins25", {
  ["0xF130003D100156D0"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156D1"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156D2"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins26", {
  ["0xF130003D100156D3"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156D4"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156D5"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins27", {
  ["0xF130003D100156D6"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156D7"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156D8"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins28", {
  ["0xF130003D100156D9"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156DA"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156DB"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins29", {
  ["0xF130003D100156DC"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156DD"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156DE"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins30", {
  ["0xF130003D100156DF"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156E0"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156E1"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins31", {
  ["0xF130003D100156E2"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156E3"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156E4"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins32", {
  ["0xF130003D100156E5"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156E6"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156E7"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins33", {
  ["0xF130003D100156E8"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156E9"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156EA"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins34", {
  ["0xF130003D100156EB"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156EC"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156ED"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins35", {
  ["0xF130003D100156EE"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156EF"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156F0"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins36", {
  ["0xF130003D100156F1"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156F2"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156F3"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins37", {
  ["0xF130003D100156F4"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156F5"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156F6"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins38", {
  ["0xF130003D100156F7"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156F8"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156F9"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins39", {
  ["0xF130003D100156FA"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156FB"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156FC"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins40", {
  ["0xF130003D100156FD"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100156FE"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100156FF"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins41", {
  ["0xF130003D10015700"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015701"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015702"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins42", {
  ["0xF130003D10015703"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015704"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015705"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins43", {
  ["0xF130003D10015706"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015707"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015708"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins44", {
  ["0xF130003D10015709"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001570A"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001570B"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins45", {
  ["0xF130003D1001570C"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001570D"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001570E"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins46", {
  ["0xF130003D1001570F"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015710"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015711"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins47", {
  ["0xF130003D10015712"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015713"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015714"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins48", {
  ["0xF130003D10015715"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015716"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015717"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins49", {
  ["0xF130003D10015718"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015719"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001571A"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins50", {
  ["0xF130003D1001571B"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001571C"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001571D"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins51", {
  ["0xF130003D1001571E"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001571F"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015720"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins52", {
  ["0xF130003D10015721"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015722"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015723"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins53", {
  ["0xF130003D10015724"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015725"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015726"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins54", {
  ["0xF130003D10015727"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015728"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015729"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins55", {
  ["0xF130003D1001572A"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001572B"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001572C"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins56", {
  ["0xF130003D1001572D"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001572E"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001572F"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins57", {
  ["0xF130003D10015730"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015731"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015732"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins58", {
  ["0xF130003D10015733"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015734"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015735"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins59", {
  ["0xF130003D10015736"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015737"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015738"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins60", {
  ["0xF130003D10015739"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001573A"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001573B"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins61", {
  ["0xF130003D1001573C"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001573D"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001573E"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins62", {
  ["0xF130003D1001573F"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015740"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015741"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins63", {
  ["0xF130003D10015742"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015743"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015744"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins64", {
  ["0xF130003D10015745"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015746"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015747"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins65", {
  ["0xF130003D10015748"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015749"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001574A"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins66", {
  ["0xF130003D1001574B"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001574C"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001574D"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins67", {
  ["0xF130003D1001574E"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001574F"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015750"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins68", {
  ["0xF130003D10015751"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015752"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015753"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins69", {
  ["0xF130003D10015754"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015755"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015756"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins70", {
  ["0xF130003D10015757"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015758"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015759"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins71", {
  ["0xF130003D1001575A"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001575B"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001575C"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins72", {
  ["0xF130003D1001575D"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001575E"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001575F"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins73", {
  ["0xF130003D10015760"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015761"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015762"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins74", {
  ["0xF130003D10015763"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015764"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015765"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins75", {
  ["0xF130003D10015766"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015767"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015768"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins76", {
  ["0xF130003D10015769"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001576A"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001576B"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins77", {
  ["0xF130003D1001576C"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001576D"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001576E"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins78", {
  ["0xF130003D1001576F"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015770"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015771"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins79", {
  ["0xF130003D10015772"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015773"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015774"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins80", {
  ["0xF130003D10015775"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015776"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015777"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins81", {
  ["0xF130003D10015778"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015779"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001577A"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins82", {
  ["0xF130003D1001577B"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001577C"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001577D"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins83", {
  ["0xF130003D1001577E"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001577F"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015780"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins84", {
  ["0xF130003D10015781"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015782"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015783"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins85", {
  ["0xF130003D10015784"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015785"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015786"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins86", {
  ["0xF130003D10015787"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015788"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015789"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins87", {
  ["0xF130003D1001578A"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001578B"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001578C"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins88", {
  ["0xF130003D1001578D"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001578E"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001578F"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins89", {
  ["0xF130003D10015790"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015791"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015792"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?0
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins90", {
  ["0xF130003D10015793"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015794"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015795"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?1
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins91", {
  ["0xF130003D10015796"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D10015797"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D10015798"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?2
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins92", {
  ["0xF130003D10015799"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001579A"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001579B"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?3
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins93", {
  ["0xF130003D1001579C"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D1001579D"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D1001579E"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?4
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins94", {
  ["0xF130003D1001579F"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100157A0"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100157A1"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?5
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins95", {
  ["0xF130003D100157A2"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100157A3"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100157A4"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?6
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins96", {
  ["0xF130003D100157A5"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100157A6"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100157A7"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?7
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins97", {
  ["0xF130003D100157A8"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100157A9"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100157AA"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?8
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins98", {
  ["0xF130003D100157AB"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100157AC"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100157AD"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?9
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins99", {
  ["0xF130003D100157AE"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100157AF"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100157B0"] = SQUARE,   -- 佐拉黄蜂
})

-- 安其拉废�?00
addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins100", {
  ["0xF130003D100157B1"] = SKULL,    -- 佐拉黄蜂
  ["0xF130003D100157B2"] = CROSS,    -- 佐拉黄蜂
  ["0xF130003D100157B3"] = SQUARE,   -- 佐拉黄蜂
})


-- 熔火之心39
addToDefaultNpcsToMark(L["Molten Core"], "molten_core39", {
  ["0xF130002D8B00DD89"] = SKULL,    -- 熔核摧毁�?
  ["0xF130002D8B00DD88"] = CROSS,    -- 熔核摧毁�?
})




-- 纳克萨玛�?5
addToDefaultNpcsToMark(L["Naxxramas"], "naxxramas15", {
  ["0xF13000403F269C07"] = MOON,     -- 疫病食尸�?
})



-- 纳克萨玛�?6
addToDefaultNpcsToMark(L["Naxxramas"], "naxxramas46", {
  ["0xF1300041A32787C0"] = SKULL,    -- 死亡骑士学员
  ["0xF1300041A32787BF"] = CROSS,    -- 死亡骑士学员
  ["0xF1300041A32787BE"] = SQUARE,   -- 死亡骑士学员
  ["0xF1300041A32787BD"] = MOON,     -- 死亡骑士学员
  ["0xF130003EBD01598C"] = STAR,     --  教官拉苏维奥斯 
})



-- 纳克萨玛�?3
addToDefaultNpcsToMark(L["Naxxramas"], "naxxramas53", {
  ["0xF130003F25269C6A"] = SKULL,    -- 死灵骑士
  ["0xF130003F25269C69"] = CROSS,    -- 死灵骑士
  ["0xF130003F1101599B"] = SQUARE,   -- 死亡骑士队长
  ["0xF130003F11269C6B"] = MOON,     -- 死亡骑士队长
})


-- 纳克萨玛�?0
addToDefaultNpcsToMark(L["Naxxramas"], "naxxramas80", {
  ["0xF130003EC3269C70"] = SKULL,    -- 骷髅骏马
  ["0xF130003EC3015993"] = CROSS,    -- 骷髅骏马
})

-- 纳克萨玛�?1
addToDefaultNpcsToMark(L["Naxxramas"], "naxxramas81", {
  ["0xF130003EC3015A63"] = SKULL,    -- 骷髅骏马
  ["0xF130003EC3015A64"] = CROSS,    -- 骷髅骏马
})

-- 纳克萨玛�?2
addToDefaultNpcsToMark(L["Naxxramas"], "naxxramas82", {
  ["0xF130003EC3269C72"] = SKULL,    -- 骷髅骏马
  ["0xF130003F1A269C71"] = CROSS,    -- 复活的死亡骑�?
})


addToDefaultNpcsToMark(L["Ruins of Ahn'Qiraj"], "ahnqiraj_ruins129", {
  ["0xF130003BEF11FB54"] = CIRCLE,   -- 其拉虫群卫士
})
