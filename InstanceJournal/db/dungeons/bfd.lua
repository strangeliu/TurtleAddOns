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

local instanceMediaAcronym = "bfd\\"

local BFD = {}

BFD.Name = IJ_DB_DUNGEON_BFD_NAME
BFD.Story = IJ_DB_DUNGEON_BFD_STORY
BFD.Type = IJLib.InstanceType.Dungeon
BFD.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
BFD.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
BFD.MapId = IMI.BlackfathomDeeps
BFD.IconScale = 0.9
BFD.MinLevel = 22
BFD.MaxLevel = 31
BFD.Entrances = {
    [1] = {
        MapContinentId = IMI.Kalimdor,
        MapZoneId = IZI.Ashenvale,
        MapCoordinateX = 14.1,
        MapCoordinateY = 14.4,
    },
}
BFD.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "4887",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "ghamoora" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "ghamoora" .. IMPF,
        Name = IJ_DB_DUNGEON_BFD_BOSS_NAME_4887,
        Story = IJ_DB_DUNGEON_BFD_BOSS_STORY_4887,
        MapCoordinateX = 22.5,
        MapCoordinateY = 41.0,
        Loot = {
            [1] = {
                Id = "6907",
                Icon = "inv_shirt_06",
                Name = IJ_LOOT_NAME_6907,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Mail,
                DropChance = 50,
                LevelRequirement = 20,
            },
            [2] = {
                Id = "6908",
                Icon = "inv_belt_24",
                Name = IJ_LOOT_NAME_6908,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Waist,
                ItemType = IT.Cloth,
                DropChance = 50,
                LevelRequirement = 20,
            },
            [3] = {
                Id = "80718",
                Icon = "inv_shield_18",
                Name = IJ_LOOT_NAME_80718,
                Quality = IQ.Uncommon,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 35,
                LevelRequirement = 20,
            },
        }
    },
    [2] = { -- NOTE: Missing abilities
        Id = "4831",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "sarevess" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "sarevess" .. IMPF,
        Name = IJ_DB_DUNGEON_BFD_BOSS_NAME_4831,
        Story = IJ_DB_DUNGEON_BFD_BOSS_STORY_4831,
        MapCoordinateX = 6.7,
        MapCoordinateY = 25.8,
        Loot = {
            [1] = {
                Id = "888",
                Icon = "inv_gauntlets_13",
                Name = IJ_LOOT_NAME_888,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 22,
            },
            [2] = {
                Id = "3078",
                Icon = "inv_weapon_bow_04",
                Name = IJ_LOOT_NAME_3078,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Ranged,
                ItemType = IT.Bow,
                DropChance = 33,
                LevelRequirement = 21,
            },
            [3] = {
                Id = "11121",
                Icon = "inv_sword_36",
                Name = IJ_LOOT_NAME_11121,
                Quality = IQ.Uncommon,
                ItemSlot = IS.MainHand,
                ItemType = IT.Sword,
                DropChance = 33,
                LevelRequirement = 21,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "6243",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "gelihast" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "gelihast" .. IMPF,
        Name = IJ_DB_DUNGEON_BFD_BOSS_NAME_6243,
        Story = IJ_DB_DUNGEON_BFD_BOSS_STORY_6243,
        MapCoordinateX = 38.0,
        MapCoordinateY = 38.2,
        Loot = {
            [1] = {
                Id = "1470",
                Icon = "inv_misc_bag_05",
                Name = IJ_LOOT_NAME_1470,
                Quality = IQ.Common,
                ItemSlot = IS.Bag,
                DropChance = 15,
            },
            [2] = {
                Id = "80720",
                Icon = "inv_boots_05",
                Name = IJ_LOOT_NAME_80720,
                Quality = IQ.Rare,
                ItemSlot = IS.Feet,
                ItemType = IT.Cloth,
                DropChance = 35,
                LevelRequirement = 23,
            },
            [3] = {
                Id = "6906",
                Icon = "inv_gauntlets_10",
                Name = IJ_LOOT_NAME_6906,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Mail,
                DropChance = 50,
                LevelRequirement = 23,
            },
            [4] = {
                Id = "6905",
                Icon = "inv_weapon_halberd_06",
                Name = IJ_LOOT_NAME_6905,
                Quality = IQ.Uncommon,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedAxe,
                DropChance = 50,
                LevelRequirement = 22,
            },
        }
    },
    [4] = { -- NOTE: Missing abilities
        Id = "12902",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "jett" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "jett" .. IMPF,
        Name = IJ_DB_DUNGEON_BFD_BOSS_NAME_12902,
        Story = IJ_DB_DUNGEON_BFD_BOSS_STORY_12902,
        MapCoordinateX = 42.3,
        MapCoordinateY = 62.7,
    },
    [5] = { -- NOTE: Missing abilities
        Id = "62530",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "velthelaxx" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "velthelaxx" .. IMPF,
        Name = IJ_DB_DUNGEON_BFD_BOSS_NAME_62530,
        Story = IJ_DB_DUNGEON_BFD_BOSS_STORY_62530,
        MapCoordinateX = 55.3,
        MapCoordinateY = 63.6,
        Loot = {
            [1] = {
                Id = "58120",
                Icon = "inv_helmet_27",
                Name = IJ_LOOT_NAME_58120,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 24,
            },
            [2] = {
                Id = "58121",
                Icon = "inv_qirajidol_life",
                Name = IJ_LOOT_NAME_58121,
                Quality = IQ.Rare,
                ItemSlot = IS.Relic,
                ItemType = IT.Totem,
                DropChance = 25,
                LevelRequirement = 24,
            },
            [3] = {
                Id = "58122",
                Icon = "inv_bracer_07",
                Name = IJ_LOOT_NAME_58122,
                Quality = IQ.Rare,
                ItemSlot = IS.Wrist,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 24,
            },
            [4] = {
                Id = "58123",
                Icon = "inv_boots_03",
                Name = IJ_LOOT_NAME_58123,
                Quality = IQ.Rare,
                ItemSlot = IS.Feet,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 24,
            },
        }
    },
    [6] = { -- NOTE: Missing abilities
        Id = "4830",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "serrakis" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "serrakis" .. IMPF,
        Name = IJ_DB_DUNGEON_BFD_BOSS_NAME_4830,
        Story = IJ_DB_DUNGEON_BFD_BOSS_STORY_4830,
        MapCoordinateX = 53.4,
        MapCoordinateY = 78.3,
        Loot = {
            [1] = {
                Id = "6904",
                Icon = "inv_misc_monsterfang_01",
                Name = IJ_LOOT_NAME_6904,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
                DropChance = 33,
                LevelRequirement = 23,
            },
            [2] = {
                Id = "6902",
                Icon = "inv_bracer_08",
                Name = IJ_LOOT_NAME_6902,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Wrist,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 22,
            },
            [3] = {
                Id = "6901",
                Icon = "inv_misc_monsterscales_03",
                Name = IJ_LOOT_NAME_6901,
                Quality = IQ.Rare,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 24,
            },
        }
    },
    [7] = { -- NOTE: Missing abilities
        Id = "4832",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "kelris" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "kelris" .. IMPF,
        Name = IJ_DB_DUNGEON_BFD_BOSS_NAME_4832,
        Story = IJ_DB_DUNGEON_BFD_BOSS_STORY_4832,
        MapCoordinateX = 53.5,
        MapCoordinateY = 87.5,
        Loot = {
            [1] = {
                Id = "1155",
                Icon = "inv_staff_06",
                Name = IJ_LOOT_NAME_1155,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 50,
                LevelRequirement = 24,
            },
            [2] = {
                Id = "6903",
                Icon = "inv_pants_02",
                Name = IJ_LOOT_NAME_6903,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Legs,
                ItemType = IT.Cloth,
                DropChance = 35,
                LevelRequirement = 23,
            },
            [3] = {
                Id = "80719",
                Icon = "inv_jewelry_necklace_03",
                Name = IJ_LOOT_NAME_80719,
                Quality = IQ.Rare,
                ItemSlot = IS.Neck,
                DropChance = 15,
                LevelRequirement = 23,
            },
        }
    },
    [8] = { -- NOTE: Missing abilities
        Id = "4829",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "akumai" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "akumai" .. IMPF,
        Name = IJ_DB_DUNGEON_BFD_BOSS_NAME_4829,
        Story = IJ_DB_DUNGEON_BFD_BOSS_STORY_4829,
        MapCoordinateX = 77.8,
        MapCoordinateY = 91.1,
        Loot = {
            [1] = {
                Id = "6909",
                Icon = "inv_sword_42",
                Name = IJ_LOOT_NAME_6909,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedSword,
                DropChance = 33,
                LevelRequirement = 26,
            },
            [2] = {
                Id = "6910",
                Icon = "inv_pants_14",
                Name = IJ_LOOT_NAME_6910,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 26,
            },
            [3] = {
                Id = "6911",
                Icon = "inv_belt_25",
                Name = IJ_LOOT_NAME_6911,
                Quality = IQ.Rare,
                ItemSlot = IS.Waist,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 26,
            },
            [4] = {
                Id = "51217",
                Icon = "inv_misc_ribbon_01",
                Name = IJ_LOOT_NAME_51217,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Transmog,
                DropChance = 1,
            },
        }
    },
}

IJDB.DG.BFD = BFD
