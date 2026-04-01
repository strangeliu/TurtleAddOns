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

local instanceMediaAcronym = "smarm\\"

local SMARM = {}

SMARM.Name = IJ_DB_DUNGEON_SMARM_NAME
SMARM.Story = IJ_DB_DUNGEON_SMARM_STORY
SMARM.Type = IJLib.InstanceType.Dungeon
SMARM.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
SMARM.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
SMARM.MapId = IMI.ScarletMonastery
SMARM.ZoneId = IZI.SMArm
SMARM.IconScale = 1.0
SMARM.MinLevel = 34
SMARM.MaxLevel = 42
SMARM.Entrances = {
    [1] = {
        MapContinentId = IMI.EasternKingdoms,
        MapZoneId = IZI.ScarletMonastery,
        MapCoordinateX = 84.1,
        MapCoordinateY = 44.2,
        MapDestinationZoneId = IZI.SMArm
    },
}
SMARM.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "61982",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "daghelm" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "daghelm" .. IMPF,
        Name = IJ_DB_DUNGEON_SMARM_BOSS_NAME_61982,
        Story = IJ_DB_DUNGEON_SMARM_BOSS_STORY_61982,
        MapCoordinateX = 57.4,
        MapCoordinateY = 38.5,
        MapId = IZI.SMArm,
        Loot = {
            [1] = {
                Id = "55474",
                Icon = "inv_throwingknife_02",
                Name = IJ_LOOT_NAME_55474,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.ThrownWeapon,
                DropChance = 25,
                LevelRequirement = 36,
            },
            [2] = {
                Id = "55475",
                Icon = "inv_bracer_09",
                Name = IJ_LOOT_NAME_55475,
                Quality = IQ.Rare,
                ItemSlot = IS.Wrist,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 36,
            },
            [3] = {
                Id = "55476",
                Icon = "inv_boots_05",
                Name = IJ_LOOT_NAME_55476,
                Quality = IQ.Rare,
                ItemSlot = IS.Feet,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 36,
            },
            [4] = {
                Id = "55477",
                Icon = "inv_jewelry_ring_13",
                Name = IJ_LOOT_NAME_55477,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 25,
                LevelRequirement = 36,
            },
        }
    },
    [2] = { -- NOTE: Missing abilities
        Id = "3975",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "herod" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "herod" .. IMPF,
        Name = IJ_DB_DUNGEON_SMARM_BOSS_NAME_3975,
        Story = IJ_DB_DUNGEON_SMARM_BOSS_STORY_3975,
        MapCoordinateX = 78.7,
        MapCoordinateY = IZI.SMArm,
        MapId = "1",
        Loot = {
            [1] = {
                Id = "7717",
                Icon = "inv_weapon_halberd_05",
                Name = IJ_LOOT_NAME_7717,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedAxe,
                DropChance = 25,
                LevelRequirement = 37,
            },
            [2] = {
                Id = "7718",
                Icon = "inv_shoulder_01",
                Name = IJ_LOOT_NAME_7718,
                Quality = IQ.Rare,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 37,
            },
            [3] = {
                Id = "7719",
                Icon = "inv_helmet_25",
                Name = IJ_LOOT_NAME_7719,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 37,
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

IJDB.DG.SMARM = SMARM
