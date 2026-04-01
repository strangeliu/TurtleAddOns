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

local instanceMediaAcronym = "wc\\"

local WC = {}

WC.Name = IJ_DB_DUNGEON_WC_NAME
WC.Story = IJ_DB_DUNGEON_WC_STORY
WC.Type = IJLib.InstanceType.Dungeon
WC.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
WC.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
WC.MapId = IMI.WailingCaverns
WC.IconScale = 0.9
WC.MinLevel = 16
WC.MaxLevel = 25
WC.Entrances = {
    [1] = {
        MapContinentId = IMI.Kalimdor,
        MapZoneId = IZI.WailingCaverns,
        MapCoordinateX = 54.9,
        MapCoordinateY = 66.7,
    },
}
WC.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "3653",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "kresh" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "kresh" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_3653,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_3653,
        MapCoordinateX = 44.3,
        MapCoordinateY = 28.5,
        Loot = {
            [1] = {
                Id = "13245",
                Icon = "inv_shield_18",
                Name = IJ_LOOT_NAME_13245,
                Quality = IQ.Rare,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 33,
                LevelRequirement = 15,
            },
            [2] = {
                Id = "80710",
                Icon = "inv_shoulder_18",
                Name = IJ_LOOT_NAME_80710,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 15,
            },
            [3] = {
                Id = "6447",
                Icon = "inv_shield_21",
                Name = IJ_LOOT_NAME_6447,
                Quality = IQ.Common,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 33,
                LevelRequirement = 15,
            },
        }
    },
    [2] = { -- NOTE: Missing abilities
        Id = "3669",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "cobrahn" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "cobrahn" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_3669,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_3669,
        MapCoordinateX = 32.5,
        MapCoordinateY = 45.3,
        Loot = {
            [1] = {
                Id = "6460",
                Icon = "inv_belt_03",
                Name = IJ_LOOT_NAME_6460,
                Quality = IQ.Rare,
                ItemSlot = IS.Waist,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 19,
            },
            [2] = {
                Id = "6465",
                Icon = "inv_chest_cloth_36",
                Name = IJ_LOOT_NAME_6465,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 17,
            },
            [3] = {
                Id = "10410",
                Icon = "inv_pants_11",
                Name = IJ_LOOT_NAME_10410,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 18,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "5912",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "deviate" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "deviate" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_5912,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_5912,
        MapCoordinateX = 73.7,
        MapCoordinateY = 29.8,
        IsRare = true,
        Loot = {
            [1] = {
                Id = "5243",
                Icon = "inv_wand_11",
                Name = IJ_LOOT_NAME_5243,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Wand,
                DropChance = 50,
                LevelRequirement = 15,
            },
            [2] = {
                Id = "6632",
                Icon = "inv_misc_cape_02",
                Name = IJ_LOOT_NAME_6632,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 50,
                LevelRequirement = 15,
            },
        }
    },
    [4] = { -- NOTE: Missing abilities
        Id = "61968",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "zandara" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "zandara" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_61968,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_61968,
        MapCoordinateX = 67.0,
        MapCoordinateY = 16.7,
        Loot = {
            [1] = {
                Id = "55371",
                Icon = "inv_belt_08",
                Name = IJ_LOOT_NAME_55371,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Waist,
                ItemType = IT.Cloth,
                DropChance = 50,
                LevelRequirement = 17,
            },
            [2] = {
                Id = "55369",
                Icon = "inv_gauntlets_24",
                Name = IJ_LOOT_NAME_55369,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 18,
            },
            [3] = {
                Id = "55370",
                Icon = "inv_wand_08",
                Name = IJ_LOOT_NAME_55370,
                Quality = IQ.Rare,
                ItemSlot = IS.Relic,
                ItemType = IT.Totem,
                DropChance = 25,
                LevelRequirement = 18,
            },
        }
    },
    [5] = { -- NOTE: Missing abilities
        Id = "3670",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "pythas" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "pythas" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_3670,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_3670,
        MapCoordinateX = 88.1,
        MapCoordinateY = 23.4,
        Loot = {
            [1] = {
                Id = "6472",
                Icon = "inv_wand_10",
                Name = IJ_LOOT_NAME_6472,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Mace,
                DropChance = 33,
                LevelRequirement = 19,
            },
            [2] = {
                Id = "6473",
                Icon = "inv_shirt_16",
                Name = IJ_LOOT_NAME_6473,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Chest,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 18,
            },
            [3] = {
                Id = "80711",
                Icon = "inv_bracer_12",
                Name = IJ_LOOT_NAME_80711,
                Quality = IQ.Rare,
                ItemSlot = IS.Wrist,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 18,
            },
        }
    },
    [6] = { -- NOTE: Missing abilities
        Id = "3674",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "skum" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "skum" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_3674,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_3674,
        MapCoordinateX = 93.8,
        MapCoordinateY = 63.1,
        Loot = {
            [1] = {
                Id = "6448",
                Icon = "inv_weapon_shortblade_10",
                Name = IJ_LOOT_NAME_6448,
                Quality = IQ.Uncommon,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
                DropChance = 33,
                LevelRequirement = 17,
            },
            [2] = {
                Id = "6449",
                Icon = "inv_chest_cloth_15",
                Name = IJ_LOOT_NAME_6449,
                Quality = IQ.Rare,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 17,
            },
            [3] = {
                Id = "80712",
                Icon = "inv_pants_08",
                Name = IJ_LOOT_NAME_80712,
                Quality = IQ.Rare,
                ItemSlot = IS.Legs,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 18,
            },
        }
    },
    [7] = { -- NOTE: Missing abilities
        Id = "61965",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "vangros" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "vangros" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_61965,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_61965,
        MapCoordinateX = 86.2,
        MapCoordinateY = 80.9,
        Loot = {
            [1] = {
                Id = "55374",
                Icon = "inv_belt_24",
                Name = IJ_LOOT_NAME_55374,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Waist,
                ItemType = IT.Leather,
                DropChance = 50,
                LevelRequirement = 17,
            },
            [2] = {
                Id = "55372",
                Icon = "inv_misc_bone_05",
                Name = IJ_LOOT_NAME_55372,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 25,
                LevelRequirement = 18,
            },
            [3] = {
                Id = "55373",
                Icon = "inv_gauntlets_07",
                Name = IJ_LOOT_NAME_55373,
                Quality = IQ.Rare,
                ItemSlot = IS.Relic,
                ItemType = IT.Idol,
                DropChance = 25,
                LevelRequirement = 18,
            },
        }
    },
    [8] = { -- NOTE: Missing abilities
        Id = "3673",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "serpentis" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "serpentis" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_3673,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_3673,
        MapCoordinateX = 69.0,
        MapCoordinateY = 42.9,
        Loot = {
            [1] = {
                Id = "10411",
                Icon = "inv_boots_04",
                Name = IJ_LOOT_NAME_10411,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Feet,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 18,
            },
            [2] = {
                Id = "6469",
                Icon = "inv_weapon_bow_10",
                Name = IJ_LOOT_NAME_6469,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Bow,
                DropChance = 25,
                LevelRequirement = 19,
            },
            [3] = {
                Id = "6459",
                Icon = "inv_boots_01",
                Name = IJ_LOOT_NAME_6459,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Feet,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 18,
            },
            [4] = {
                Id = "5970",
                Icon = "inv_gauntlets_19",
                Name = IJ_LOOT_NAME_5970,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Hands,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 18,
            },
        }
    },
    [9] = { -- NOTE: Missing abilities
        Id = "3671",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "anacondra" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "anacondra" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_3671,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_3671,
        MapCoordinateX = 50.5,
        MapCoordinateY = 25.0,
        Loot = {
            [1] = {
                Id = "5404",
                Icon = "inv_shoulder_08",
                Name = IJ_LOOT_NAME_5404,
                Quality = IQ.Rare,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 18,
            },
            [2] = {
                Id = "6446",
                Icon = "inv_misc_bag_12",
                Name = IJ_LOOT_NAME_6446,
                Quality = IQ.Common,
                ItemSlot = IS.Bag,
                DropChance = 25,
            },
            [3] = {
                Id = "10412",
                Icon = "inv_belt_30",
                Name = IJ_LOOT_NAME_10412,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Waist,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 16,
            },
            [4] = {
                Id = "80709",
                Icon = "inv_staff_28",
                Name = IJ_LOOT_NAME_80709,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 25,
                LevelRequirement = 16,
            },
            [5] = {
                Id = "23800",
                Icon = "ability_mount_raptor",
                Name = IJ_LOOT_NAME_23800,
                Quality = IQ.Rare,
                ItemSlot = IS.Mount,
                DropChance = 1,
                LevelRequirement = 20,
            },
        }
    },
    [10] = { -- NOTE: Missing abilities
        Id = "5775",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "verdan" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "verdan" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_5775,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_5775,
        MapCoordinateX = 64.2,
        MapCoordinateY = 37.5,
        Loot = {
            [1] = {
                Id = "6629",
                Icon = "inv_misc_cape_17",
                Name = IJ_LOOT_NAME_6629,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 18,
            },
            [2] = {
                Id = "6630",
                Icon = "inv_shield_10",
                Name = IJ_LOOT_NAME_6630,
                Quality = IQ.Rare,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 33,
                LevelRequirement = 20,
            },
            [3] = {
                Id = "6631",
                Icon = "inv_staff_25",
                Name = IJ_LOOT_NAME_6631,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 33,
                LevelRequirement = 20,
            },
        }
    },
    [11] = { -- NOTE: Missing abilities
        Id = "3654",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "mutanus" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "mutanus" .. IMPF,
        Name = IJ_DB_DUNGEON_WC_BOSS_NAME_3654,
        Story = IJ_DB_DUNGEON_WC_BOSS_STORY_3654,
        MapCoordinateX = 46.7,
        MapCoordinateY = 12.1,
        Loot = {
            [1] = {
                Id = "6461",
                Icon = "inv_shoulder_05",
                Name = IJ_LOOT_NAME_6461,
                Quality = IQ.Rare,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 22,
            },
            [2] = {
                Id = "6463",
                Icon = "inv_jewelry_ring_15",
                Name = IJ_LOOT_NAME_6463,
                Quality = IQ.Rare,
                ItemSlot = IS.Finger,
                DropChance = 25,
                LevelRequirement = 21,
            },
            [3] = {
                Id = "6627",
                Icon = "inv_chest_plate08",
                Name = IJ_LOOT_NAME_6627,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Mail,
                DropChance = 25,
                LevelRequirement = 23,
            },
            [4] = {
                Id = "81006",
                Icon = "inv_helmet_27",
                Name = IJ_LOOT_NAME_81006,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Cloth,
                DropChance = 25,
                LevelRequirement = 22,
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

IJDB.DG.WC = WC
