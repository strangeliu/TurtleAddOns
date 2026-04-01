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

local instanceMediaAcronym = "rfd\\"

local RFD = {}

RFD.Name = IJ_DB_DUNGEON_RFD_NAME
RFD.Story = IJ_DB_DUNGEON_RFD_STORY
RFD.Type = IJLib.InstanceType.Dungeon
RFD.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
RFD.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
RFD.MapId = IMI.RazorfenDowns
RFD.IconScale = 0.9
RFD.MinLevel = 35
RFD.MaxLevel = 44
RFD.Entrances = {
    [1] = {
        MapContinentId = IMI.Kalimdor,
        MapZoneId = IZI.TheBarrens,
        MapCoordinateX = 49.6,
        MapCoordinateY = 94.5,
    },
}
RFD.Bosses = {
    [1] = { -- NOTE: Missing abilities
        Id = "7356",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "plaguemaw" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "plaguemaw" .. IMPF,
        Name = IJ_DB_DUNGEON_RFD_BOSS_NAME_7356,
        Story = IJ_DB_DUNGEON_RFD_BOSS_STORY_7356,
        MapCoordinateX = 36.3,
        MapCoordinateY = 17.8,
        Loot = {
            [1] = {
                Id = "10760",
                Icon = "inv_gauntlets_23",
                Name = IJ_LOOT_NAME_10760,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 35,
            },
            [2] = {
                Id = "10766",
                Icon = "inv_wand_03",
                Name = IJ_LOOT_NAME_10766,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Wand,
                DropChance = 33,
                LevelRequirement = 35,
            },
            [3] = {
                Id = "80744",
                Icon = "inv_staff_26",
                Name = IJ_LOOT_NAME_80744,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Staff,
                DropChance = 33,
                LevelRequirement = 35,
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
        Id = "7355",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "tutenkash" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "tutenkash" .. IMPF,
        Name = IJ_DB_DUNGEON_RFD_BOSS_NAME_7355,
        Story = IJ_DB_DUNGEON_RFD_BOSS_STORY_7355,
        MapCoordinateX = 46.1,
        MapCoordinateY = 26.9,
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
                Id = "10777",
                Icon = "inv_gauntlets_32",
                Name = IJ_LOOT_NAME_10777,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 37,
            },
            [3] = {
                Id = "10776",
                Icon = "inv_misc_cape_17",
                Name = IJ_LOOT_NAME_10776,
                Quality = IQ.Rare,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 35,
            },
            [4] = {
                Id = "10775",
                Icon = "inv_chest_plate08",
                Name = IJ_LOOT_NAME_10775,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Plate,
                DropChance = 33,
                LevelRequirement = 40,
            },
        }
    },
    [3] = { -- NOTE: Missing abilities
        Id = "7357",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "mordresh" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "mordresh" .. IMPF,
        Name = IJ_DB_DUNGEON_RFD_BOSS_NAME_7357,
        Story = IJ_DB_DUNGEON_RFD_BOSS_STORY_7357,
        MapCoordinateX = 66.4,
        MapCoordinateY = 37.1,
        Loot = {
            [1] = {
                Id = "10769",
                Icon = "inv_misc_orb_03",
                Name = IJ_LOOT_NAME_10769,
                Quality = IQ.Rare,
                ItemSlot = IS.Neck,
                DropChance = 33,
                LevelRequirement = 36,
            },
            [2] = {
                Id = "10770",
                Icon = "inv_misc_bone_elfskull_01",
                Name = IJ_LOOT_NAME_10770,
                Quality = IQ.Rare,
                ItemSlot = IS.HeldInOffHand,
                DropChance = 33,
                LevelRequirement = 36,
            },
            [3] = {
                Id = "10771",
                Icon = "inv_belt_24",
                Name = IJ_LOOT_NAME_10771,
                Quality = IQ.Rare,
                ItemSlot = IS.Waist,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 36,
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
        Id = "8567",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "glutton" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "glutton" .. IMPF,
        Name = IJ_DB_DUNGEON_RFD_BOSS_NAME_8567,
        Story = IJ_DB_DUNGEON_RFD_BOSS_STORY_8567,
        MapCoordinateX = 27.6,
        MapCoordinateY = 55.6,
        Loot = {
            [1] = {
                Id = "80745",
                Icon = "inv_weapon_crossbow_04",
                Name = IJ_LOOT_NAME_80745,
                Quality = IQ.Rare,
                ItemSlot = IS.Ranged,
                ItemType = IT.Crossbow,
                DropChance = 33,
                LevelRequirement = 37,
            },
            [2] = {
                Id = "10774",
                Icon = "inv_shoulder_28",
                Name = IJ_LOOT_NAME_10774,
                Quality = IQ.Rare,
                ItemSlot = IS.Shoulder,
                ItemType = IT.Leather,
                DropChance = 33,
                LevelRequirement = 37,
            },
            [3] = {
                Id = "10772",
                Icon = "inv_axe_23",
                Name = IJ_LOOT_NAME_10772,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Axe,
                DropChance = 33,
                LevelRequirement = 36,
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
    [5] = { -- NOTE: Missing abilities
        Id = "62679",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "rakameg" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "rakameg" .. IMPF,
        Name = IJ_DB_DUNGEON_RFD_BOSS_NAME_62679,
        Story = IJ_DB_DUNGEON_RFD_BOSS_STORY_62679,
        MapCoordinateX = 44.6,
        MapCoordinateY = 81.1,
        Loot = {
            [1] = {
                Id = "58172",
                Icon = "inv_weapon_shortblade_18",
                Name = IJ_LOOT_NAME_58172,
                Quality = IQ.Rare,
                ItemSlot = IS.MainHand,
                ItemType = IT.Dagger,
                DropChance = 25,
                LevelRequirement = 37,
            },
            [2] = {
                Id = "58173",
                Icon = "inv_gauntlets_17",
                Name = IJ_LOOT_NAME_58173,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 25,
                LevelRequirement = 37,
            },
            [3] = {
                Id = "58174",
                Icon = "inv_qirajidol_death",
                Name = IJ_LOOT_NAME_58174,
                Quality = IQ.Rare,
                ItemSlot = IS.Relic,
                ItemType = IT.Totem,
                DropChance = 25,
                LevelRequirement = 37,
            },
            [4] = {
                Id = "58175",
                Icon = "inv_misc_ahnqirajtrinket_03",
                Name = IJ_LOOT_NAME_58175,
                Quality = IQ.Rare,
                ItemSlot = IS.Trinket,
                DropChance = 25,
                LevelRequirement = 37,
            },
        }
    },
    [6] = { -- NOTE: Missing abilities
        Id = "7354",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "ragglesnout" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "ragglesnout" .. IMPF,
        Name = IJ_DB_DUNGEON_RFD_BOSS_NAME_7354,
        Story = IJ_DB_DUNGEON_RFD_BOSS_STORY_7354,
        MapCoordinateX = 27.9,
        MapCoordinateY = 47.3,
        IsRare = true,
        Loot = {
            [1] = {
                Id = "10758",
                Icon = "inv_sword_45",
                Name = IJ_LOOT_NAME_10758,
                Quality = IQ.Rare,
                ItemSlot = IS.TwoHand,
                ItemType = IT.TwoHandedSword,
                DropChance = 33,
                LevelRequirement = 35,
            },
            [2] = {
                Id = "10767",
                Icon = "inv_shield_17",
                Name = IJ_LOOT_NAME_10767,
                Quality = IQ.Rare,
                ItemSlot = IS.OffHand,
                ItemType = IT.Shield,
                DropChance = 33,
                LevelRequirement = 37,
            },
            [3] = {
                Id = "10768",
                Icon = "inv_belt_11",
                Name = IJ_LOOT_NAME_10768,
                Quality = IQ.Rare,
                ItemSlot = IS.Waist,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 37,
            },
        }
    },
    [7] = { -- NOTE: Missing abilities
        Id = "7358",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "amnennar" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "amnennar" .. IMPF,
        Name = IJ_DB_DUNGEON_RFD_BOSS_NAME_7358,
        Story = IJ_DB_DUNGEON_RFD_BOSS_STORY_7358,
        MapCoordinateX = 34.2,
        MapCoordinateY = 46.8,
        Loot = {
            [1] = {
                Id = "10761",
                Icon = "inv_sword_34",
                Name = IJ_LOOT_NAME_10761,
                Quality = IQ.Rare,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
                DropChance = 20,
                LevelRequirement = 39,
            },
            [2] = {
                Id = "10762",
                Icon = "inv_chest_cloth_17",
                Name = IJ_LOOT_NAME_10762,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 20,
                LevelRequirement = 39,
            },
            [3] = {
                Id = "10763",
                Icon = "inv_helmet_13",
                Name = IJ_LOOT_NAME_10763,
                Quality = IQ.Rare,
                ItemSlot = IS.Head,
                ItemType = IT.Plate,
                DropChance = 20,
                LevelRequirement = 40,
            },
            [4] = {
                Id = "10764",
                Icon = "inv_chest_plate12",
                Name = IJ_LOOT_NAME_10764,
                Quality = IQ.Rare,
                ItemSlot = IS.Chest,
                ItemType = IT.Mail,
                DropChance = 20,
                LevelRequirement = 39,
            },
            [5] = {
                Id = "10765",
                Icon = "inv_gauntlets_09",
                Name = IJ_LOOT_NAME_10765,
                Quality = IQ.Rare,
                ItemSlot = IS.Hands,
                ItemType = IT.Leather,
                DropChance = 20,
                LevelRequirement = 39,
            },
            [6] = {
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

IJDB.DG.RFD = RFD
