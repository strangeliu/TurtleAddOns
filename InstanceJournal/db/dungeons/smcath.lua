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

local instanceMediaAcronym = "smcath\\"

local SMCATH = {}

SMCATH.Name = IJ_DB_DUNGEON_SMCATH_NAME
SMCATH.Story = IJ_DB_DUNGEON_SMCATH_STORY
SMCATH.Type = IJLib.InstanceType.Dungeon
SMCATH.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
SMCATH.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
SMCATH.MapId = IMI.ScarletMonastery
SMCATH.ZoneId = IZI.SMCath
SMCATH.IconScale = 0.8
SMCATH.MinLevel = 35
SMCATH.MaxLevel = 45
SMCATH.Entrances = {
    [1] = {
        MapContinentId = IMI.EasternKingdoms,
        MapZoneId = IZI.ScarletMonastery,
        MapCoordinateX = 78.9,
        MapCoordinateY = 28.2,
        MapDestinationZoneId = IZI.SMCath
    },
}
SMCATH.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "4542",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "fairbanks" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "fairbanks" .. IMPF,
        Name = IJ_DB_DUNGEON_SMCATH_BOSS_NAME_4542,
        Story = IJ_DB_DUNGEON_SMCATH_BOSS_STORY_4542,
        MapCoordinateX = 55.5,
        MapCoordinateY = 25.2,
        MapId = IZI.SMCath,
        Loot = {
            [1] = {
                Id = "19507",
                Icon = "inv_shoulder_27",
                Name = IJ_LOOT_NAME_19507,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 36,
            },
            [2] = {
                Id = "19508",
                Icon = "inv_bracer_11",
                Name = IJ_LOOT_NAME_19508,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Wrist,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 36,
            },
            [3] = {
                Id = "19509",
                Icon = "inv_boots_chain_02",
                Name = IJ_LOOT_NAME_19509,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Feet,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 36,
            },
        }
    },
    [2] = { -- NOTE: Missing abilities
        Id = "3976",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "mograine" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "mograine" .. IMPF,
        Name = IJ_DB_DUNGEON_SMCATH_BOSS_NAME_3976,
        Story = IJ_DB_DUNGEON_SMCATH_BOSS_STORY_3976,
        MapCoordinateX = 49.1,
        MapCoordinateY = 27.7,
        MapId = IZI.SMCath,
        Loot = {
            [1] = {
                Id = "7723",
                Icon = "inv_mace_13",
                Name = IJ_LOOT_NAME_7723,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedMace,
                DropChance = 25,
                LevelRequirement = 39,
            },
            [2] = {
                Id = "7724",
                Icon = "inv_gauntlets_19",
                Name = IJ_LOOT_NAME_7724,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 39,
            },
            [3] = {
                Id = "7726",
                Icon = "inv_shield_05",
                Name = IJ_LOOT_NAME_7726,
                Quality = IQ.Rare,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 25,
                LevelRequirement = 39,
            },
            [4] = {
                Id = "10330",
                Icon = "inv_pants_03",
                Name = IJ_LOOT_NAME_10330,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 38,
            },
            [5] = {
                Id = "51804",
                Icon = "inv_misc_book_10",
                Name = IJ_LOOT_NAME_51804,
                Quality = IQ.Rare,
                ItemSlot = IS.Relic,
                ItemType = IT.Libram,
                DropChance = 8,
                LevelRequirement = 39,
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
        Id = "3977",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "whitemane" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "whitemane" .. IMPF,
        Name = IJ_DB_DUNGEON_SMCATH_BOSS_NAME_3977,
        Story = IJ_DB_DUNGEON_SMCATH_BOSS_STORY_3977,
        MapCoordinateX = 49.1,
        MapCoordinateY = 16.8,
        MapId = IZI.SMCath,
        Loot = {
            [1] = {
                Id = "7720",
                Icon = "inv_helmet_12",
                Name = IJ_LOOT_NAME_7720,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 39,
            },
            [2] = {
                Id = "7721",
                Icon = "inv_hammer_02",
                Name = IJ_LOOT_NAME_7721,
                Quality = IQ.Rare,
                ItemSlot = IS.MainHand,
                ItemType = IT.Mace,
                DropChance = 33,
                LevelRequirement = 39,
            },
            [3] = {
                Id = "7722",
                Icon = "inv_jewelry_amulet_01",
                Name = IJ_LOOT_NAME_7722,
                Quality = IQ.Rare,
                ItemSlot = IS.Neck,
                DropChance = 33,
                LevelRequirement = 39,
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

IJDB.DG.SMCATH = SMCATH
