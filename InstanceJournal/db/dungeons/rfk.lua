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

local instanceMediaAcronym = "rfk\\"

local RFK = {}

RFK.Name = IJ_DB_DUNGEON_RFK_NAME
RFK.Story = IJ_DB_DUNGEON_RFK_STORY
RFK.Type = IJLib.InstanceType.Dungeon
RFK.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
RFK.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
RFK.MapId = IMI.RazorfenKraul
RFK.IconScale = 0.9
RFK.MinLevel = 29
RFK.MaxLevel = 36
RFK.Entrances = {
    [1] = {
        MapContinentId = IMI.Kalimdor,
        MapZoneId = IZI.TheBarrens,
        MapCoordinateX = 40.8,
        MapCoordinateY = 89.4,
    },
}
RFK.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "4428",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "jargba" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "jargba" .. IMPF,
        Name = IJ_DB_DUNGEON_RFK_BOSS_NAME_4428,
        Story = IJ_DB_DUNGEON_RFK_BOSS_STORY_4428,
        MapCoordinateX = 87.7,
        MapCoordinateY = 41.9,
        Loot = {
            [1] = {
                Id = "2816",
                Icon = "inv_mace_07",
                Name = IJ_LOOT_NAME_2816,
                Quality = IQ.Rare,
                ItemSlot = IS.MainHand,
                ItemType = IT.Mace,
                DropChance = 33,
                LevelRequirement = 28,
            },
            [2] = {
                Id = "6682",
                Icon = "inv_chest_cloth_20",
                Name = IJ_LOOT_NAME_6682,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 26,
            },
            [3] = {
                Id = "6685",
                Icon = "inv_shoulder_09",
                Name = IJ_LOOT_NAME_6685,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 25,
            },
        }
    },
    [2] = { -- NOTE: Missing abilities
        Id = "4424",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "aggem" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "aggem" .. IMPF,
        Name = IJ_DB_DUNGEON_RFK_BOSS_NAME_4424,
        Story = IJ_DB_DUNGEON_RFK_BOSS_STORY_4424,
        MapCoordinateX = 80.7,
        MapCoordinateY = 52.0,
        Loot = {
            [1] = {
                Id = "80732",
                Icon = "inv_gauntlets_05",
                Name = IJ_LOOT_NAME_80732,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 35,
                LevelRequirement = 29,
            },
            [2] = {
                Id = "80733",
                Icon = "inv_sword_19",
                Name = IJ_LOOT_NAME_80733,
                Quality = IQ.Rare,
                ItemSlot = IS.MainHand,
                ItemType = IT.Sword,
                DropChance = 35,
                LevelRequirement = 29,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "4420",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "ramtusk" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "ramtusk" .. IMPF,
        Name = IJ_DB_DUNGEON_RFK_BOSS_NAME_4420,
        Story = IJ_DB_DUNGEON_RFK_BOSS_STORY_4420,
        MapCoordinateX = 56.8,
        MapCoordinateY = 30.1,
        Loot = {
            [1] = {
                Id = "6686",
                Icon = "inv_helmet_09",
                Name = IJ_LOOT_NAME_6686,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Head,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 28,
            },
            [2] = {
                Id = "6687",
                Icon = "inv_weapon_halbard_01",
                Name = IJ_LOOT_NAME_6687,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedAxe,
                DropChance = 33,
                LevelRequirement = 29,
            },
            [3] = {
                Id = "80734",
                Icon = "inv_pants_03",
                Name = IJ_LOOT_NAME_80734,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 29,
            },
        }
    },
    [4] = { -- NOTE: Missing abilities
        Id = "4842",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "halmgar" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "halmgar" .. IMPF,
        Name = IJ_DB_DUNGEON_RFK_BOSS_NAME_4842,
        Story = IJ_DB_DUNGEON_RFK_BOSS_STORY_4842,
        MapCoordinateX = 48.5,
        MapCoordinateY = 45.1,
        IsRare = true,
        Loot = {
            [1] = {
                Id = "6688",
                Icon = "inv_helmet_17",
                Name = IJ_LOOT_NAME_6688,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Head,
                ItemType = IT.Leather,
                DropChance = 50,
                LevelRequirement = 27,
            },
            [2] = {
                Id = "6689",
                Icon = "inv_staff_01",
                Name = IJ_LOOT_NAME_6689,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 50,
                LevelRequirement = 27,
            },
        }
    },
    [5] = { -- NOTE: Missing abilities
        Id = "62503",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "rotthorn" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "rotthorn" .. IMPF,
        Name = IJ_DB_DUNGEON_RFK_BOSS_NAME_62503,
        Story = IJ_DB_DUNGEON_RFK_BOSS_STORY_62503,
        MapCoordinateX = 31.0,
        MapCoordinateY = 75.7,
        Loot = {
            [1] = {
                Id = "50800",
                Icon = "inv_belt_17",
                Name = IJ_LOOT_NAME_50800,
                Quality = IQ.Rare,
                ItemSlot = IS.Waist,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [2] = {
                Id = "58089",
                Icon = "inv_staff_02",
                Name = IJ_LOOT_NAME_58089,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Wand,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [3] = {
                Id = "58090",
                Icon = "inv_misc_root_02",
                Name = IJ_LOOT_NAME_58090,
                Quality = IQ.Rare,
                ItemSlot = IS.Trinket,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [4] = {
                Id = "58091",
                Icon = "spell_nature_naturetouchdecay",
                Name = IJ_LOOT_NAME_58091,
                Quality = IQ.Rare,
                ItemSlot = IS.Relic,
                ItemType = IT.Idol,
                DropChance = 25,
                LevelRequirement = 29,
            },
        }
    },
    [6] = { -- NOTE: Missing abilities
        Id = "4422",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "agathelos" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "agathelos" .. IMPF,
        Name = IJ_DB_DUNGEON_RFK_BOSS_NAME_4422,
        Story = IJ_DB_DUNGEON_RFK_BOSS_STORY_4422,
        MapCoordinateX = 8.2,
        MapCoordinateY = 68.4,
        Loot = {
            [1] = {
                Id = "6690",
                Icon = "inv_pants_14",
                Name = IJ_LOOT_NAME_6690,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Legs,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [2] = {
                Id = "6691",
                Icon = "inv_misc_bone_06",
                Name = IJ_LOOT_NAME_6691,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
                DropChance = 25,
                LevelRequirement = 30,
            },
            [3] = {
                Id = "80735",
                Icon = "inv_belt_09",
                Name = IJ_LOOT_NAME_80735,
                Quality = IQ.Rare,
                ItemSlot = IS.Waist,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [4] = {
                Id = "80736",
                Icon = "inv_chest_leather_04",
                Name = IJ_LOOT_NAME_80736,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 29,
            },
            [5] = {
                Id = "69170",
                Icon = "ability_hunter_pet_boar",
                Name = IJ_LOOT_NAME_69170,
                Quality = IQ.Epic,
                ItemSlot = IS.Mount,
                DropChance = 1,
            },
        }
    },
    [7] = { -- NOTE: Missing abilities
        Id = "4425",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "hunter" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "hunter" .. IMPF,
        Name = IJ_DB_DUNGEON_RFK_BOSS_NAME_4425,
        Story = IJ_DB_DUNGEON_RFK_BOSS_STORY_4425,
        MapCoordinateX = 12.3,
        MapCoordinateY = 32.5,
        IsRare = true,
        Loot = {
            [1] = {
                Id = "6695",
                Icon = "inv_jewelry_necklace_04",
                Name = IJ_LOOT_NAME_6695,
                Quality = IQ.Rare,
                ItemSlot = IS.Neck,
                DropChance = 33,
                LevelRequirement = 27,
            },
            [2] = {
                Id = "6696",
                Icon = "inv_weapon_bow_12",
                Name = IJ_LOOT_NAME_6696,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Bow,
                DropChance = 33,
                LevelRequirement = 27,
            },
            [3] = {
                Id = "6697",
                Icon = "inv_shoulder_05",
                Name = IJ_LOOT_NAME_6697,
                Quality = IQ.Rare,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 27,
            },
        }
    },
    [8] = { -- NOTE: Missing abilities
        Id = "4421",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "charlga" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "charlga" .. IMPF,
        Name = IJ_DB_DUNGEON_RFK_BOSS_NAME_4421,
        Story = IJ_DB_DUNGEON_RFK_BOSS_STORY_4421,
        MapCoordinateX = 21.8,
        MapCoordinateY = 30.9,
        Loot = {
            [1] = {
                Id = "6692",
                Icon = "inv_axe_18",
                Name = IJ_LOOT_NAME_6692,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Axe,
                DropChance = 33,
                LevelRequirement = 31,
            },
            [2] = {
                Id = "6693",
                Icon = "inv_misc_bone_05",
                Name = IJ_LOOT_NAME_6693,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 33,
                LevelRequirement = 31,
            },
            [3] = {
                Id = "6694",
                Icon = "inv_shield_02",
                Name = IJ_LOOT_NAME_6694,
                Quality = IQ.Rare,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 33,
                LevelRequirement = 31,
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

IJDB.DG.RFK = RFK
