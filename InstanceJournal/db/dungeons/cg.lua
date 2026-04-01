IJDB = IJDB or {}

local IS = IJLib.ItemSlot
local IT = IJLib.ItemType
local IQ = IJLib.Quality
local IMP = IJLib.MediaPath
local IMPD = IJLib.MediaPathDungeons
local IMPP = IJLib.MediaPathPortrait
local IMPF = IJLib.MediaPathFrame
local IMAF = IJLib.AbilityFlags
local IMCL = IJLib.Classes
local IMI = IJLib.MapId
local IZI = IJLib.ZoneId

local instanceMediaAcronym = "cg\\"

local CG = {}

CG.Name = IJ_DB_DUNGEON_CG_NAME
CG.Story = IJ_DB_DUNGEON_CG_STORY
CG.Type = IJLib.InstanceType.Dungeon
CG.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
CG.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
CG.MapId = IMI.CrescentGrove
CG.IconScale = 0.9
CG.MinLevel = 33
CG.MaxLevel = 39
CG.Entrances = {
    [1] = {
        MapContinentId = IMI.Kalimdor,
        MapZoneId = IZI.Ashenvale,
        MapCoordinateX = 51.0,
        MapCoordinateY = 77.3,
    },
}
CG.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "92107",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "engryss" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "engryss" .. IMPF,
        Name = IJ_DB_DUNGEON_CG_BOSS_NAME_92107,
        Story = IJ_DB_DUNGEON_CG_BOSS_STORY_92107,
        MapCoordinateX = 52.1,
        MapCoordinateY = 36.7,
        Loot = {
            [1] = {
                Id = "83220",
                Icon = "inv_jewelry_necklace_09",
                Name = IJ_LOOT_NAME_83220,
                Quality = IQ.Rare,
                ItemSlot = IS.Neck,
                DropChance = 24,
                LevelRequirement = 34,
            },
            [2] = {
                Id = "83221",
                Icon = "inv_hammer_16",
                Name = IJ_LOOT_NAME_83221,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedMace,
                DropChance = 24,
                LevelRequirement = 34,
            },
            [3] = {
                Id = "83222",
                Icon = "inv_bracer_12",
                Name = IJ_LOOT_NAME_83222,
                Quality = IQ.Rare,
                ItemSlot = IS.Wrist,
                ItemType = IT.Cloth,
                DropChance = 24,
                LevelRequirement = 34,
            },
            [4] = {
                Id = "83223",
                Icon = "inv_gauntlets_24",
                Name = IJ_LOOT_NAME_83223,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 24,
                LevelRequirement = 34,
            },
            [5] = {
                Id = "83224",
                Icon = "inv_misc_horn_03",
                Name = IJ_LOOT_NAME_83224,
                Quality = IQ.Rare,
                ItemSlot = IS.Trinket,
                DropChance = 5,
                LevelRequirement = 34,
            },
            [6] = {
                Id = "51217",
                Icon = "inv_misc_ribbon_01",
                Name = IJ_LOOT_NAME_51217,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Transmog,
                DropChance = 1,
            },
        }
    },
    [2] = { -- NOTE: Missing abilities
        Id = "92109",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "ranathos" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "ranathos" .. IMPF,
        Name = IJ_DB_DUNGEON_CG_BOSS_NAME_92109,
        Story = IJ_DB_DUNGEON_CG_BOSS_STORY_92109,
        MapCoordinateX = 43.3,
        MapCoordinateY = 43.5,
        Loot = {
            [1] = {
                Id = "83225",
                Icon = "inv_weapon_bow_11",
                Name = IJ_LOOT_NAME_83225,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Bow,
                DropChance = 24,
                LevelRequirement = 35,
            },
            [2] = {
                Id = "83226",
                Icon = "inv_bracer_12",
                Name = IJ_LOOT_NAME_83226,
                Quality = IQ.Rare,
                ItemSlot = IS.Wrist,
                ItemType = IT.Leather,
                DropChance = 24,
                LevelRequirement = 35,
            },
            [3] = {
                Id = "83227",
                Icon = "inv_chest_cloth_27",
                Name = IJ_LOOT_NAME_83227,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 24,
                LevelRequirement = 35,
            },
            [4] = {
                Id = "83228",
                Icon = "inv_boots_03",
                Name = IJ_LOOT_NAME_83228,
                Quality = IQ.Rare,
                ItemSlot = IS.Feet,
                ItemType = IT.Mail,
                DropChance = 24,
                LevelRequirement = 35,
            },
            [5] = {
                Id = "83229",
                Icon = "inv_jewelry_ring_08",
                Name = IJ_LOOT_NAME_83229,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 5,
                LevelRequirement = 35,
            },
            [6] = {
                Id = "51217",
                Icon = "inv_misc_ribbon_01",
                Name = IJ_LOOT_NAME_51217,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Transmog,
                DropChance = 1,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "92108",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "alathea" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "alathea" .. IMPF,
        Name = IJ_DB_DUNGEON_CG_BOSS_NAME_92108,
        Story = IJ_DB_DUNGEON_CG_BOSS_STORY_92108,
        MapCoordinateX = 57.6,
        MapCoordinateY = 68.1,
        Loot = {
            [1] = {
                Id = "51217",
                Icon = "inv_misc_ribbon_01",
                Name = IJ_LOOT_NAME_51217,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Transmog,
                DropChance = 1,
            },
            [2] = {
                Id = "83210",
                Icon = "inv_weapon_shortblade_23",
                Name = IJ_LOOT_NAME_83210,
                Quality = IQ.Rare,
                ItemSlot = IS.Trinket,
                DropChance = 10,
                LevelRequirement = 33,
            },
            [3] = {
                Id = "83211",
                Icon = "inv_shoulder_05",
                Name = IJ_LOOT_NAME_83211,
                Quality = IQ.Rare,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Leather,
                DropChance = 30,
                LevelRequirement = 33,
            },
            [4] = {
                Id = "83209",
                Icon = "inv_axe_12",
                Name = IJ_LOOT_NAME_83209,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedAxe,
                DropChance = 30,
                LevelRequirement = 33,
            },
            [5] = {
                Id = "83208",
                Icon = "inv_belt_22",
                Name = IJ_LOOT_NAME_83208,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Cloth,
                DropChance = 30,
                LevelRequirement = 33,
            },
        }
    },
    [4] = { -- NOTE: Missing abilities
        Id = "92111",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "fenektis" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "fenektis" .. IMPF,
        Name = IJ_DB_DUNGEON_CG_BOSS_NAME_92111,
        Story = IJ_DB_DUNGEON_CG_BOSS_STORY_92111,
        MapCoordinateX = 44.0,
        MapCoordinateY = 78.9,
        Loot = {
            [1] = {
                Id = "83212",
                Icon = "inv_misc_orb_04",
                Name = IJ_LOOT_NAME_83212,
                Quality = IQ.Rare,
                ItemSlot = IS.HeldInOffHand,
                DropChance = 25,
                LevelRequirement = 34,
            },
            [2] = {
                Id = "83213",
                Icon = "inv_bracer_12",
                Name = IJ_LOOT_NAME_83213,
                Quality = IQ.Rare,
                ItemSlot = IS.Wrist,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 34,
            },
            [3] = {
                Id = "83214",
                Icon = "inv_weapon_shortblade_20",
                Name = IJ_LOOT_NAME_83214,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
                DropChance = 25,
                LevelRequirement = 34,
            },
            [4] = {
                Id = "83215",
                Icon = "inv_wand_01",
                Name = IJ_LOOT_NAME_83215,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Wand,
                DropChance = 25,
                LevelRequirement = 34,
            },
            [5] = {
                Id = "51217",
                Icon = "inv_misc_ribbon_01",
                Name = IJ_LOOT_NAME_51217,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Transmog,
                DropChance = 1,
            },
        }
    },
    [5] = { -- NOTE: Missing abilities
        Id = "92110",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "raxxieth" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "raxxieth" .. IMPF,
        Name = IJ_DB_DUNGEON_CG_BOSS_NAME_92110,
        Story = IJ_DB_DUNGEON_CG_BOSS_STORY_92110,
        MapCoordinateX = 60.3,
        MapCoordinateY = 88.6,
        Loot = {
            [1] = {
                Id = "60258",
                Icon = "inv_helmet_08",
                Name = IJ_LOOT_NAME_60258,
                Quality = IQ.Epic,
                ItemSlot = IS.Head,
                ItemType = IT.Leather,
                DropChance = 1,
                LevelRequirement = 35,
            },
            [2] = {
                Id = "51217",
                Icon = "inv_misc_ribbon_01",
                Name = IJ_LOOT_NAME_51217,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Transmog,
                DropChance = 5,
            },
            [3] = {
                Id = "83219",
                Icon = "inv_sword_18",
                Name = IJ_LOOT_NAME_83219,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Sword,
                DropChance = 25,
                LevelRequirement = 35,
            },
            [4] = {
                Id = "83218",
                Icon = "inv_misc_cape_19",
                Name = IJ_LOOT_NAME_83218,
                Quality = IQ.Rare,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 35,
            },
            [5] = {
                Id = "83217",
                Icon = "inv_jewelry_ring_16",
                Name = IJ_LOOT_NAME_83217,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 25,
                LevelRequirement = 35,
            },
            [6] = {
                Id = "83216",
                Icon = "inv_helmet_17",
                Name = IJ_LOOT_NAME_83216,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 35,
            },
        }
    },
}
IJDB.DG.CG = CG
