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

local instanceMediaAcronym = "smlib\\"

local SMLIB = {}

SMLIB.Name = IJ_DB_DUNGEON_SMLIB_NAME
SMLIB.Story = IJ_DB_DUNGEON_SMLIB_STORY
SMLIB.Type = IJLib.InstanceType.Dungeon
SMLIB.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
SMLIB.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
SMLIB.MapId = IMI.ScarletMonastery
SMLIB.ZoneId = IZI.SMLib
SMLIB.IconScale = 1.0
SMLIB.MinLevel = 32
SMLIB.MaxLevel = 40
SMLIB.Entrances = {
    [1] = {
        MapContinentId = IMI.EasternKingdoms,
        MapZoneId = IZI.ScarletMonastery,
        MapCoordinateX = 79.2,
        MapCoordinateY = 60.2,
        MapDestinationZoneId = IZI.SMLib
    },
}
SMLIB.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "3974",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "loksey" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "loksey" .. IMPF,
        Name = IJ_DB_DUNGEON_SMLIB_BOSS_NAME_3974,
        Story = IJ_DB_DUNGEON_SMLIB_BOSS_STORY_3974,
        MapCoordinateX = 29.4,
        MapCoordinateY = 84.4,
        MapId = IZI.SMLib,
        Loot = {
            [1] = {
                Id = "7710",
                Icon = "inv_staff_18",
                Name = IJ_LOOT_NAME_7710,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 33,
                LevelRequirement = 31,
            },
            [2] = {
                Id = "3456",
                Icon = "ability_hunter_beastcall",
                Name = IJ_LOOT_NAME_3456,
                Quality = IQ.Rare,
                ItemSlot = IS.Trinket,
                DropChance = 33,
                LevelRequirement = 25,
            },
            [3] = {
                Id = "7756",
                Icon = "inv_gauntlets_07",
                Name = IJ_LOOT_NAME_7756,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 29,
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
    [2] = { -- NOTE: Missing abilities
        Id = "61983",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "wystan" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "wystan" .. IMPF,
        Name = IJ_DB_DUNGEON_SMLIB_BOSS_NAME_61983,
        Story = IJ_DB_DUNGEON_SMLIB_BOSS_STORY_61983,
        MapCoordinateX = 71.8,
        MapCoordinateY = 40.8,
        MapId = IZI.SMLib,
        Loot = {
            [1] = {
                Id = "55470",
                Icon = "inv_misc_book_08",
                Name = IJ_LOOT_NAME_55470,
                Quality = IQ.Rare,
                ItemSlot = IS.Relic,
                ItemType = IT.Libram,
                DropChance = 25,
                LevelRequirement = 34,
            },
            [2] = {
                Id = "55471",
                Icon = "spell_holy_fistofjustice",
                Name = IJ_LOOT_NAME_55471,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.FistWeapon,
                DropChance = 25,
                LevelRequirement = 34,
            },
            [3] = {
                Id = "55472",
                Icon = "inv_pants_06",
                Name = IJ_LOOT_NAME_55472,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 34,
            },
            [4] = {
                Id = "55473",
                Icon = "inv_jewelry_necklace_02",
                Name = IJ_LOOT_NAME_55473,
                Quality = IQ.Rare,
                ItemSlot = IS.Neck,
                DropChance = 25,
                LevelRequirement = 34,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "6487",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "doan" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "doan" .. IMPF,
        Name = IJ_DB_DUNGEON_SMLIB_BOSS_NAME_6487,
        Story = IJ_DB_DUNGEON_SMLIB_BOSS_STORY_6487,
        MapCoordinateX = 83.4,
        MapCoordinateY = 74.6,
        MapId = IZI.SMLib,
        Loot = {
            [1] = {
                Id = "7711",
                Icon = "inv_chest_cloth_25",
                Name = IJ_LOOT_NAME_7711,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 33,
            },
            [2] = {
                Id = "7712",
                Icon = "inv_shoulder_05",
                Name = IJ_LOOT_NAME_7712,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 33,
            },
            [3] = {
                Id = "7713",
                Icon = "inv_wand_04",
                Name = IJ_LOOT_NAME_7713,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 25,
                LevelRequirement = 34,
            },
            [4] = {
                Id = "7714",
                Icon = "inv_weapon_shortblade_07",
                Name = IJ_LOOT_NAME_7714,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
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
}

IJDB.DG.SMLIB = SMLIB
