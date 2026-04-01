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

local instanceMediaAcronym = "smgy\\"

local SMGY = {}

SMGY.Name = IJ_DB_DUNGEON_SMGY_NAME
SMGY.Story = IJ_DB_DUNGEON_SMGY_STORY
SMGY.Type = IJLib.InstanceType.Dungeon
SMGY.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
SMGY.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
SMGY.MapId = IMI.ScarletMonastery
SMGY.ZoneId = IZI.SMGy
SMGY.IconScale = 0.9
SMGY.MinLevel = 30
SMGY.MaxLevel = 37
SMGY.Entrances = {
    [1] = {
        MapContinentId = IMI.EasternKingdoms,
        MapZoneId = IZI.ScarletMonastery,
        MapCoordinateX = 68.3,
        MapCoordinateY = 21.1,
        MapDestinationZoneId = IZI.SMGy,
    },
}
SMGY.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "3983",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "vishas" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "vishas" .. IMPF,
        Name = IJ_DB_DUNGEON_SMGY_BOSS_NAME_3983,
        Story = IJ_DB_DUNGEON_SMGY_BOSS_STORY_3983,
        MapCoordinateX = 72.1,
        MapCoordinateY = 59.8,
        MapId = IZI.SMGy,
        Loot = {
            [1] = {
                Id = "7682",
                Icon = "inv_spear_01",
                Name = IJ_LOOT_NAME_7682,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [2] = {
                Id = "7683",
                Icon = "inv_gauntlets_11",
                Name = IJ_LOOT_NAME_7683,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.FistWeapon,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [3] = {
                Id = "80741",
                Icon = "inv_belt_32",
                Name = IJ_LOOT_NAME_80741,
                Quality = IQ.Rare,
                ItemSlot = IS.Waist,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [4] = {
                Id = "80742",
                Icon = "inv_helmet_34",
                Name = IJ_LOOT_NAME_80742,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 29,
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
    [2] = { -- NOTE: Missing abilities
        Id = "61972",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "dreadmoore" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "dreadmoore" .. IMPF,
        Name = IJ_DB_DUNGEON_SMGY_BOSS_NAME_61972,
        Story = IJ_DB_DUNGEON_SMGY_BOSS_STORY_61972,
        MapCoordinateX = 77.6,
        MapCoordinateY = 38.2,
        MapId = IZI.SMGy,
        Loot = {
            [1] = {
                Id = "55386",
                Icon = "inv_belt_26",
                Name = IJ_LOOT_NAME_55386,
                Quality = IQ.Rare,
                ItemSlot = IS.Waist,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 30,
            },
            [2] = {
                Id = "55388",
                Icon = "inv_jewelry_ring_27",
                Name = IJ_LOOT_NAME_55388,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 25,
                LevelRequirement = 30,
            },
            [3] = {
                Id = "55387",
                Icon = "inv_misc_book_05",
                Name = IJ_LOOT_NAME_55387,
                Quality = IQ.Rare,
                ItemSlot = IS.Trinket,
                DropChance = 25,
                LevelRequirement = 30,
            },
            [4] = {
                Id = "55389",
                Icon = "inv_boots_05",
                Name = IJ_LOOT_NAME_55389,
                Quality = IQ.Rare,
                ItemSlot = IS.Feet,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 30,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "6489",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "ironspine" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "ironspine" .. IMPF,
        Name = IJ_DB_DUNGEON_SMGY_BOSS_NAME_6489,
        Story = IJ_DB_DUNGEON_SMGY_BOSS_STORY_6489,
        MapCoordinateX = 48.9,
        MapCoordinateY = 66.2,
        MapId = IZI.SMGy,
        IsRare = true,
        Loot = {
            [1] = {
                Id = "7688",
                Icon = "inv_chest_plate15",
                Name = IJ_LOOT_NAME_7688,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 30,
            },
            [2] = {
                Id = "7687",
                Icon = "inv_hammer_19",
                Name = IJ_LOOT_NAME_7687,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Mace,
                DropChance = 33,
                LevelRequirement = 30,
            },
            [3] = {
                Id = "7686",
                Icon = "inv_jewelry_ring_04",
                Name = IJ_LOOT_NAME_7686,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 33,
                LevelRequirement = 30,
            },
        }
    },
    [4] = { -- NOTE: Missing abilities
        Id = "6490",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "azshir" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "azshir" .. IMPF,
        Name = IJ_DB_DUNGEON_SMGY_BOSS_NAME_6490,
        Story = IJ_DB_DUNGEON_SMGY_BOSS_STORY_6490,
        MapCoordinateX = 41.1,
        MapCoordinateY = 46.6,
        MapId = IZI.SMGy,
        IsRare = true,
        Loot = {
            [1] = {
                Id = "7708",
                Icon = "inv_wand_04",
                Name = IJ_LOOT_NAME_7708,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Wand,
                DropChance = 33,
                LevelRequirement = 30,
            },
            [2] = {
                Id = "7709",
                Icon = "inv_pants_07",
                Name = IJ_LOOT_NAME_7709,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 30,
            },
            [3] = {
                Id = "7731",
                Icon = "inv_jewelry_necklace_06",
                Name = IJ_LOOT_NAME_7731,
                Quality = IQ.Rare,
                ItemSlot = IS.Neck,
                DropChance = 33,
                LevelRequirement = 30,
            },
        }
    },
    [5] = { -- NOTE: Missing abilities
        Id = "6488",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "champion" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "champion" .. IMPF,
        Name = IJ_DB_DUNGEON_SMGY_BOSS_NAME_6488,
        Story = IJ_DB_DUNGEON_SMGY_BOSS_STORY_6488,
        MapCoordinateX = 26.3,
        MapCoordinateY = 45.7,
        MapId = IZI.SMGy,
        IsRare = true,
        Loot = {
            [1] = {
                Id = "7689",
                Icon = "inv_sword_12",
                Name = IJ_LOOT_NAME_7689,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedSword,
                DropChance = 33,
                LevelRequirement = 30,
            },
            [2] = {
                Id = "7690",
                Icon = "inv_gauntlets_32",
                Name = IJ_LOOT_NAME_7690,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 30,
            },
            [3] = {
                Id = "7691",
                Icon = "inv_helmet_28",
                Name = IJ_LOOT_NAME_7691,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 30,
            },
        }
    },
    [6] = { -- NOTE: Missing abilities
        Id = "4543",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "thalnos" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "thalnos" .. IMPF,
        Name = IJ_DB_DUNGEON_SMGY_BOSS_NAME_4543,
        Story = IJ_DB_DUNGEON_SMGY_BOSS_STORY_4543,
        MapCoordinateX = 24.3,
        MapCoordinateY = 56.2,
        MapId = IZI.SMGy,
        MapIsBelow = true,
        Loot = {
            [1] = {
                Id = "7685",
                Icon = "inv_misc_orb_02",
                Name = IJ_LOOT_NAME_7685,
                Quality = IQ.Rare,
                ItemSlot = IS.HeldInOffHand,
                DropChance = 50,
                LevelRequirement = 33,
            },
            [2] = {
                Id = "7684",
                Icon = "inv_shoulder_05",
                Name = IJ_LOOT_NAME_7684,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Cloth,
                DropChance = 35,
                LevelRequirement = 30,
            },
            [3] = {
                Id = "80743",
                Icon = "inv_gauntlets_22",
                Name = IJ_LOOT_NAME_80743,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Cloth,
                DropChance = 15,
                LevelRequirement = 30,
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

IJDB.DG.SMGY = SMGY
