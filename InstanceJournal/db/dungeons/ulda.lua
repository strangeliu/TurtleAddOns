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

local instanceMediaAcronym = "ulda\\"

local ULDA = {}

ULDA.Name = IJ_DB_DUNGEON_ULDA_NAME
ULDA.Story = IJ_DB_DUNGEON_ULDA_STORY
ULDA.Type = IJLib.InstanceType.Dungeon
ULDA.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
ULDA.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
ULDA.MapId = IMI.Uldaman
ULDA.IconScale = 0.8
ULDA.MinLevel = 41
ULDA.MaxLevel = 50
ULDA.Entrances = {
    [1] = {
        MapContinentId = IMI.EasternKingdoms,
        MapZoneId = IZI.Uldaman,
        MapCoordinateX = 36.8,
        MapCoordinateY = 28.1,
    },
    [2] = {
        MapContinentId = IMI.EasternKingdoms,
        MapZoneId = IZI.Badlands,
        MapCoordinateX = 65.5,
        MapCoordinateY = 43.4,
    },
}
ULDA.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "6906",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "dwarves" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "dwarves" .. IMPF,
        Name = IJ_DB_DUNGEON_ULDA_BOSS_NAME_6906,
        Story = IJ_DB_DUNGEON_ULDA_BOSS_STORY_6906,
        MapCoordinateX = 58.7,
        MapCoordinateY = 92.2,
        Loot = {
            [1] = {
                Id = "9399",
                Icon = "inv_ammo_arrow_01",
                Name = IJ_LOOT_NAME_9399,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Projectile,
                ItemType = IT.Arrow,
                DropChance = 100,
                LevelRequirement = 35,
            },
            [2] = {
                Id = "9401",
                Icon = "inv_sword_24",
                Name = IJ_LOOT_NAME_9401,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Sword,
                DropChance = 50,
                LevelRequirement = 38,
            },
            [3] = {
                Id = "9400",
                Icon = "inv_weapon_bow_11",
                Name = IJ_LOOT_NAME_9400,
                Quality = IQ.Common,
                ItemSlot = IS.Ranged,
                ItemType = IT.Bow,
                DropChance = 50,
                LevelRequirement = 36,
            },
            [4] = {
                Id = "9394",
                Icon = "inv_helmet_25",
                Name = IJ_LOOT_NAME_9394,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Plate,
                DropChance = 50,
                LevelRequirement = 40,
            },
            [5] = {
                Id = "9398",
                Icon = "inv_boots_02",
                Name = IJ_LOOT_NAME_9398,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Feet,
                ItemType = IT.Leather,
                DropChance = 50,
                LevelRequirement = 35,
            },
            [6] = {
                Id = "9403",
                Icon = "inv_shield_07",
                Name = IJ_LOOT_NAME_9403,
                Quality = IQ.Uncommon,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 50,
                LevelRequirement = 35,
            },
            [7] = {
                Id = "9404",
                Icon = "inv_shield_02",
                Name = IJ_LOOT_NAME_9404,
                Quality = IQ.Rare,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 50,
                LevelRequirement = 37,
            },
        }
    },
    [2] = { -- NOTE: Missing abilities
        Id = "6910",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "revelosh" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "revelosh" .. IMPF,
        Name = IJ_DB_DUNGEON_ULDA_BOSS_NAME_6910,
        Story = IJ_DB_DUNGEON_ULDA_BOSS_STORY_6910,
        MapCoordinateX = 53.2,
        MapCoordinateY = 72.5,
        Loot = {
            [1] = {
                Id = "9387",
                Icon = "inv_boots_plate_06",
                Name = IJ_LOOT_NAME_9387,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Feet,
                ItemType = IT.Plate,
                DropChance = 25,
                LevelRequirement = 40,
            },
            [2] = {
                Id = "9388",
                Icon = "inv_bracer_16",
                Name = IJ_LOOT_NAME_9388,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Wrist,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 35,
            },
            [3] = {
                Id = "9389",
                Icon = "inv_shoulder_25",
                Name = IJ_LOOT_NAME_9389,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 36,
            },
            [4] = {
                Id = "9390",
                Icon = "inv_gauntlets_17",
                Name = IJ_LOOT_NAME_9390,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Hands,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 35,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "7228",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "ironaya" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "ironaya" .. IMPF,
        Name = IJ_DB_DUNGEON_ULDA_BOSS_NAME_7228,
        Story = IJ_DB_DUNGEON_ULDA_BOSS_STORY_7228,
        MapCoordinateX = 37.0,
        MapCoordinateY = 73.8,
        Loot = {
            [1] = {
                Id = "9407",
                Icon = "inv_pants_01",
                Name = IJ_LOOT_NAME_9407,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 35,
            },
            [2] = {
                Id = "9408",
                Icon = "inv_staff_28",
                Name = IJ_LOOT_NAME_9408,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 33,
                LevelRequirement = 37,
            },
            [3] = {
                Id = "9409",
                Icon = "inv_bracer_19",
                Name = IJ_LOOT_NAME_9409,
                Quality = IQ.Rare,
                ItemSlot = IS.Wrist,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 37,
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
    [4] = { -- NOTE: Missing abilities
        Id = "7023",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "sentinel" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "sentinel" .. IMPF,
        Name = IJ_DB_DUNGEON_ULDA_BOSS_NAME_7023,
        Story = IJ_DB_DUNGEON_ULDA_BOSS_STORY_7023,
        MapCoordinateX = 29.1,
        MapCoordinateY = 60.0,
        -- NOTE: No unique loot?
    },
    [5] = { -- NOTE: Missing abilities
        Id = "7206",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "keeper" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "keeper" .. IMPF,
        Name = IJ_DB_DUNGEON_ULDA_BOSS_NAME_7206,
        Story = IJ_DB_DUNGEON_ULDA_BOSS_STORY_7206,
        MapCoordinateX = 47.5,
        MapCoordinateY = 44.3,
        Loot = {
            [1] = {
                Id = "9410",
                Icon = "inv_gauntlets_12",
                Name = IJ_LOOT_NAME_9410,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Plate,
                DropChance = 50,
                LevelRequirement = 40,
            },
            [2] = {
                Id = "9411",
                Icon = "inv_shoulder_02",
                Name = IJ_LOOT_NAME_9411,
                Quality = IQ.Rare,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Mail,
                DropChance = 35,
                LevelRequirement = 40,
            },
            [3] = {
                Id = "80746",
                Icon = "inv_shield_03",
                Name = IJ_LOOT_NAME_80746,
                Quality = IQ.Rare,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 15,
                LevelRequirement = 40,
            },
        }
    },
    [6] = { -- NOTE: Missing abilities
        Id = "7291",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "galgann" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "galgann" .. IMPF,
        Name = IJ_DB_DUNGEON_ULDA_BOSS_NAME_7291,
        Story = IJ_DB_DUNGEON_ULDA_BOSS_STORY_7291,
        MapCoordinateX = 26.6,
        MapCoordinateY = 32.6,
        Loot = {
            [1] = {
                Id = "11311",
                Icon = "inv_misc_cape_08",
                Name = IJ_LOOT_NAME_11311,
                Quality = IQ.Rare,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 41,
            },
            [2] = {
                Id = "11310",
                Icon = "inv_shoulder_05",
                Name = IJ_LOOT_NAME_11310,
                Quality = IQ.Rare,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 42,
            },
            [3] = {
                Id = "9419",
                Icon = "inv_hammer_17",
                Name = IJ_LOOT_NAME_9419,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Mace,
                DropChance = 25,
                LevelRequirement = 41,
            },
            [4] = {
                Id = "9412",
                Icon = "inv_weapon_rifle_07",
                Name = IJ_LOOT_NAME_9412,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Gun,
                DropChance = 25,
                LevelRequirement = 42,
            },
        }
    },
    [7] = { -- NOTE: Missing abilities
        Id = "4854",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "grimlok" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "grimlok" .. IMPF,
        Name = IJ_DB_DUNGEON_ULDA_BOSS_NAME_4854,
        Story = IJ_DB_DUNGEON_ULDA_BOSS_STORY_4854,
        MapCoordinateX = 22.1,
        MapCoordinateY = 26.0,
        Loot = {
            [1] = {
                Id = "9414",
                Icon = "inv_pants_06",
                Name = IJ_LOOT_NAME_9414,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 41,
            },
            [2] = {
                Id = "9415",
                Icon = "inv_shirt_05",
                Name = IJ_LOOT_NAME_9415,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 42,
            },
            [3] = {
                Id = "9416",
                Icon = "inv_spear_08",
                Name = IJ_LOOT_NAME_9416,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Polearm,
                DropChance = 33,
                LevelRequirement = 42,
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
    [8] = { -- NOTE: Missing abilities
        Id = "2748",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "archaedas" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "archaedas" .. IMPF,
        Name = IJ_DB_DUNGEON_ULDA_BOSS_NAME_2748,
        Story = IJ_DB_DUNGEON_ULDA_BOSS_STORY_2748,
        MapCoordinateX = 41.6,
        MapCoordinateY = 16.6,
        MapIsBelow = true,
        Loot = {
            [1] = {
                Id = "9413",
                Icon = "inv_hammer_12",
                Name = IJ_LOOT_NAME_9413,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedMace,
                DropChance = 33,
                LevelRequirement = 44,
            },
            [2] = {
                Id = "9418",
                Icon = "inv_sword_47",
                Name = IJ_LOOT_NAME_9418,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedSword,
                DropChance = 33,
                LevelRequirement = 44,
            },
            [3] = {
                Id = "11118",
                Icon = "inv_stone_15",
                Name = IJ_LOOT_NAME_11118,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 33,
                LevelRequirement = 42,
            },
            [4] = {
                Id = "51217",
                Icon = "inv_misc_ribbon_01",
                Name = IJ_LOOT_NAME_51217,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Transmog,
                DropChance = 5,
            },
        }
    },
}
IJDB.DG.ULDA = ULDA
