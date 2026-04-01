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

local instanceMediaAcronym = "gnomeregan\\"

local GNOMEREGAN = {}

GNOMEREGAN.Name = IJ_DB_DUNGEON_GNOMEREGAN_NAME
GNOMEREGAN.Story = IJ_DB_DUNGEON_GNOMEREGAN_STORY
GNOMEREGAN.Type = IJLib.InstanceType.Dungeon
GNOMEREGAN.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
GNOMEREGAN.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
GNOMEREGAN.MapId = IMI.Gnomeregan
GNOMEREGAN.IconScale = 0.9
GNOMEREGAN.MinLevel = 28
GNOMEREGAN.MaxLevel = 37
GNOMEREGAN.Entrances = {
    [1] = {
        MapContinentId = IMI.EasternKingdoms,
        MapZoneId = IZI.Gnomeregan,
        MapCoordinateX = 29.5,
        MapCoordinateY = 74.8,
    },
    [2] = {
        MapContinentId = IMI.EasternKingdoms,
        MapZoneId = IZI.Gnomeregan,
        MapCoordinateX = 42.5,
        MapCoordinateY = 12.7,
    },
}
GNOMEREGAN.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "7361",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "grubbis" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "grubbis" .. IMPF,
        Name = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_NAME_7361,
        Story = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_STORY_7361,
        MapCoordinateX = 87.0,
        MapCoordinateY = 38.2,
        Loot = {
            [1] = {
                Id = "9445",
                Icon = "inv_gauntlets_17",
                Name = IJ_LOOT_NAME_9445,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [2] = {
                Id = "80737",
                Icon = "inv_jewelry_ring_11",
                Name = IJ_LOOT_NAME_80737,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [3] = {
                Id = "80738",
                Icon = "inv_boots_01",
                Name = IJ_LOOT_NAME_80738,
                Quality = IQ.Rare,
                ItemSlot = IS.Feet,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [4] = {
                Id = "80739",
                Icon = "inv_axe_19",
                Name = IJ_LOOT_NAME_80739,
                Quality = IQ.Rare,
                ItemSlot = IS.MainHand,
                ItemType = IT.Axe,
                DropChance = 25,
                LevelRequirement = 29,
            },
        }
    },
    [2] = { -- NOTE: Missing abilities
        Id = "7079",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "fallout" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "fallout" .. IMPF,
        Name = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_NAME_7079,
        Story = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_STORY_7079,
        MapCoordinateX = 65.6,
        MapCoordinateY = 29.9,
        Loot = {
            [1] = {
                Id = "9452",
                Icon = "inv_staff_15",
                Name = IJ_LOOT_NAME_9452,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 33,
                LevelRequirement = 27,
            },
            [2] = {
                Id = "9453",
                Icon = "inv_weapon_shortblade_02",
                Name = IJ_LOOT_NAME_9453,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
                DropChance = 33,
                LevelRequirement = 27,
            },
            [3] = {
                Id = "9454",
                Icon = "inv_boots_05",
                Name = IJ_LOOT_NAME_9454,
                Quality = IQ.Rare,
                ItemSlot = IS.Feet,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 27,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "6235",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "electrocutioner" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "electrocutioner" .. IMPF,
        Name = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_NAME_6235,
        Story = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_STORY_6235,
        MapCoordinateX = 32.6,
        MapCoordinateY = 41.4,
        Loot = {
            [1] = {
                Id = "9446",
                Icon = "inv_sword_30",
                Name = IJ_LOOT_NAME_9446,
                Quality = IQ.Rare,
                ItemSlot = IS.MainHand,
                ItemType = IT.Sword,
                DropChance = 33,
                LevelRequirement = 29,
            },
            [2] = {
                Id = "9447",
                Icon = "inv_misc_gear_04",
                Name = IJ_LOOT_NAME_9447,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 33,
                LevelRequirement = 29,
            },
            [3] = {
                Id = "9448",
                Icon = "inv_misc_bandage_09",
                Name = IJ_LOOT_NAME_9448,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Wrist,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 28,
            },
        }
    },
    [4] = { -- NOTE: Missing abilities
        Id = "6229",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "pummeler" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "pummeler" .. IMPF,
        Name = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_NAME_6229,
        Story = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_STORY_6229,
        MapCoordinateX = 44.7,
        MapCoordinateY = 88.5,
        Loot = {
            [1] = {
                Id = "9449",
                Icon = "inv_mace_14",
                Name = IJ_LOOT_NAME_9449,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedMace,
                DropChance = 33,
                LevelRequirement = 29,
            },
            [2] = {
                Id = "9450",
                Icon = "inv_boots_03",
                Name = IJ_LOOT_NAME_9450,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Feet,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 28,
            },
            [3] = {
                Id = "80740",
                Icon = "inv_gauntlets_11",
                Name = IJ_LOOT_NAME_80740,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.FistWeapon,
                DropChance = 33,
                LevelRequirement = 29,
            },
        }
    },
    [5] = { -- NOTE: Missing abilities
        Id = "6228",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "ambassador" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "ambassador" .. IMPF,
        Name = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_NAME_6228,
        Story = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_STORY_6228,
        IsRare = true,
        MapCoordinateX = 19.5,
        MapCoordinateY = 67.3,
        Loot = {
            [1] = {
                Id = "9455",
                Icon = "inv_bracer_09",
                Name = IJ_LOOT_NAME_9455,
                Quality = IQ.Rare,
                ItemSlot = IS.Wrist,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 28,
            },
            [2] = {
                Id = "9456",
                Icon = "inv_weapon_rifle_02",
                Name = IJ_LOOT_NAME_9456,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Gun,
                DropChance = 33,
                LevelRequirement = 30,
            },
            [3] = {
                Id = "9457",
                Icon = "inv_mace_08",
                Name = IJ_LOOT_NAME_9457,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Mace,
                DropChance = 33,
                LevelRequirement = 30,
            },
        }
    },
    [6] = { -- NOTE: Missing abilities
        Id = "7800",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "thermaplugg" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "thermaplugg" .. IMPF,
        Name = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_NAME_7800,
        Story = IJ_DB_DUNGEON_GNOMEREGAN_BOSS_STORY_7800,
        MapCoordinateX = 17.3,
        MapCoordinateY = 38.5,
        Loot = {
            [1] = {
                Id = "9458",
                Icon = "inv_shield_10",
                Name = IJ_LOOT_NAME_9458,
                Quality = IQ.Rare,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 25,
                LevelRequirement = 32,
            },
            [2] = {
                Id = "9459",
                Icon = "inv_axe_03",
                Name = IJ_LOOT_NAME_9459,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedAxe,
                DropChance = 25,
                LevelRequirement = 32,
            },
            [3] = {
                Id = "9461",
                Icon = "inv_misc_gear_01",
                Name = IJ_LOOT_NAME_9461,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 25,
                LevelRequirement = 32,
            },
            [4] = {
                Id = "9492",
                Icon = "inv_gizmo_01",
                Name = IJ_LOOT_NAME_9492,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 32,
            },
            [5] = {
                Id = "40084",
                Icon = "inv_scroll_03",
                Name = IJ_LOOT_NAME_40084,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Profession,
                ItemType = IT.Engineering,
                DropChance = 4,
            },
            [6] = {
                Id = "4411",
                Icon = "inv_scroll_03",
                Name = IJ_LOOT_NAME_4411,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Profession,
                ItemType = IT.Engineering,
                DropChance = 2,
            },
            [7] = {
                Id = "4413",
                Icon = "inv_scroll_06",
                Name = IJ_LOOT_NAME_4413,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Profession,
                ItemType = IT.Engineering,
                DropChance = 2,
            },
            [8] = {
                Id = "4415",
                Icon = "inv_scroll_03",
                Name = IJ_LOOT_NAME_4415,
                Quality = IQ.Rare,
                ItemSlot = IS.Profession,
                ItemType = IT.Engineering,
                DropChance = 2,
            },
            [9] = {
                Id = "7742",
                Icon = "inv_scroll_03",
                Name = IJ_LOOT_NAME_7742,
                Quality = IQ.Common,
                ItemSlot = IS.Profession,
                ItemType = IT.Engineering,
                DropChance = 2,
            },
            [10] = {
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

IJDB.DG.GNOMEREGAN = GNOMEREGAN
