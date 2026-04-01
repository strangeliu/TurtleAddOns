IJDB = IJDB or {}

local IS = IJLib.ItemSlot
local IT = IJLib.ItemType
local IQ = IJLib.Quality
local IC = IJLib.Challenges
local IMP = IJLib.MediaPath
local IMPD = IJLib.MediaPathDungeons
local IMPP = IJLib.MediaPathPortrait
local IMPF = IJLib.MediaPathFrame
local IMAF = IJLib.AbilityFlags
local IMI = IJLib.MapId
local IZI = IJLib.ZoneId

local instanceMediaAcronym = "rfc\\"

local RFC = {}

RFC.Name = IJ_DB_DUNGEON_RFC_NAME
RFC.Story = IJ_DB_DUNGEON_RFC_STORY
RFC.Type = IJLib.InstanceType.Dungeon
RFC.Background = IMP .. IMPD .. instanceMediaAcronym .. "background"
RFC.GridBackground = IMP .. IMPD .. instanceMediaAcronym .. "grid-background"
RFC.MapId = IMI.RagefireChasm
RFC.IconScale = 0.8
RFC.MinLevel = 13
RFC.MaxLevel = 19
RFC.Entrances = {
    [1] = {
        MapContinentId = IMI.Kalimdor,
        MapZoneId = IZI.Orgrimmar,
        MapCoordinateX = 53.0,
        MapCoordinateY = 48.6,
    },
}
RFC.Bosses = {
    [1] = {
        Id = "11517",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "oggleflint" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "oggleflint" .. IMPF,
        Name = IJ_DB_DUNGEON_RFC_BOSS_NAME_11517,
        Story = IJ_DB_DUNGEON_RFC_BOSS_STORY_11517,
        MapCoordinateX = 56.3,
        MapCoordinateY = 38.1,
        Abilities = {
            [1] = {
                Id = "845",
                Icon = "Ability_Warrior_Cleave",
                Name = IJ_DB_DUNGEON_RFC_BOSS_11517_ABILITY_NAME_845,
                Effect = IJ_DB_DUNGEON_RFC_BOSS_11517_ABILITY_EFFECT_845,
            },
        },
        Loot = {
            [1] = {
                Id = "80700",
                Icon = "INV_Misc_Bone_01",
                Name = IJ_LOOT_NAME_80700,
                Quality = IQ.Uncommon,
                ItemSlot = IS.MainHand,
                ItemType = IT.Mace,
                DropChance = 35,
                LevelRequirement = 13,
            },
            [2] = {
                Id = "80701",
                Icon = "INV_Pants_02",
                Name = IJ_LOOT_NAME_80701,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Legs,
                ItemType = IT.Leather,
                DropChance = 35,
                LevelRequirement = 13,
            },
            [3] = {
                Id = "80702",
                Icon = "INV_Shirt_05",
                Name = IJ_LOOT_NAME_80702,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 30,
                LevelRequirement = 13,
            },
            [4] = {
                Id = "17041",
                Icon = "INV_Mace_01",
                Name = IJ_LOOT_NAME_17041,
                Quality = IQ.Common,
                ItemSlot = IS.OneHand,
                ItemType = IT.Mace,
                DropChance = 30,
                LevelRequirement = 13,
                ChallengeRestriction = {
                    IC.LevelOneLunatic,
                },
            },
        },
    },
    [2] = {
        Id = "11520",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "taragaman" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "taragaman" .. IMPF,
        Name = IJ_DB_DUNGEON_RFC_BOSS_NAME_11520,
        Story = IJ_DB_DUNGEON_RFC_BOSS_STORY_11520,
        MapCoordinateX = 40.9,
        MapCoordinateY = 57.9,
        Abilities = {
            [1] = {
                Id = "11970",
                Icon = "Spell_Fire_SealOfFire",
                Name = IJ_DB_DUNGEON_RFC_BOSS_11520_ABILITY_NAME_11970,
                Effect = IJ_DB_DUNGEON_RFC_BOSS_11520_ABILITY_EFFECT_11970,
            },
            [2] = {
                Id = "18072",
                Icon = "INV_Gauntlets_05",
                Name = IJ_DB_DUNGEON_RFC_BOSS_11520_ABILITY_NAME_18072,
                Effect = IJ_DB_DUNGEON_RFC_BOSS_11520_ABILITY_EFFECT_18072,
            },
        },
        Loot = {
            [1] = {
                Id = "14145",
                Icon = "INV_Weapon_ShortBlade_12",
                Name = IJ_LOOT_NAME_14145,
                Quality = IQ.Uncommon,
                ItemSlot = IS.MainHand,
                ItemType = IT.Sword,
                DropChance = 33,
                LevelRequirement = 13,
            },
            [2] = {
                Id = "14148",
                Icon = "INV_Bracer_13",
                Name = IJ_LOOT_NAME_14148,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Wrist,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 13,
            },
            [3] = {
                Id = "14149",
                Icon = "INV_Misc_Cape_18",
                Name = IJ_LOOT_NAME_14149,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 13,
            },
            [4] = {
                Id = "64",
                Icon = "INV_Helmet_48",
                Name = IJ_LOOT_NAME_64,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Back,
                ItemType = IT.Cloth,
                DropChance = 25,
                ChallengeRestriction = {
                    IC.LevelOneLunatic,
                },
            },
        },
    },
    [3] = {
        Id = "11518",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "jergosh" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "jergosh" .. IMPF,
        Name = IJ_DB_DUNGEON_RFC_BOSS_NAME_11518,
        Story = IJ_DB_DUNGEON_RFC_BOSS_STORY_11518,
        MapCoordinateX = 34.1,
        MapCoordinateY = 81.5,
        Abilities = {
            [1] = {
                Id = "348",
                Icon = "Spell_Fire_Immolation",
                Name = IJ_DB_DUNGEON_RFC_BOSS_11518_ABILITY_NAME_348,
                Effect = IJ_DB_DUNGEON_RFC_BOSS_11518_ABILITY_EFFECT_348,
            },
            [2] = {
                Id = "702",
                Icon = "Spell_Shadow_CurseOfMannoroth",
                Name = IJ_DB_DUNGEON_RFC_BOSS_11518_ABILITY_NAME_702,
                Effect = IJ_DB_DUNGEON_RFC_BOSS_11518_ABILITY_EFFECT_702,
                Flags = { IMAF.Curse },
            },
        },
        Loot = {
            [1] = {
                Id = "14147",
                Icon = "INV_Bracer_07",
                Name = IJ_LOOT_NAME_14147,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Wrist,
                ItemType = IT.Mail,
                DropChance = 33,
                LevelRequirement = 13,
            },
            [2] = {
                Id = "14150",
                Icon = "INV_Chest_Cloth_24",
                Name = IJ_LOOT_NAME_14150,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 33,
                LevelRequirement = 13,
            },
            [3] = {
                Id = "14151",
                Icon = "INV_Weapon_ShortBlade_25",
                Name = IJ_LOOT_NAME_14151,
                Quality = IQ.Uncommon,
                ItemSlot = IS.OneHand,
                ItemType = IT.Dagger,
                DropChance = 33,
                LevelRequirement = 13,
            },
            [4] = {
                Id = "80111",
                Icon = "INV_Shirt_07",
                Name = IJ_LOOT_NAME_80111,
                Quality = IQ.Common,
                ItemSlot = IS.Chest,
                ItemType = IT.Cloth,
                DropChance = 25,
                ChallengeRestriction = {
                    IC.LevelOneLunatic,
                },
            },
            [5] = {
                Id = "55004",
                Icon = "INV_Jewelry_Talisman_01",
                Name = IJ_LOOT_NAME_55004,
                Quality = IQ.Poor,
                ItemSlot = IS.Neck,
                DropChance = 25,
                ChallengeRestriction = {
                    IC.LevelOneLunatic,
                },
            },
        },
    },
    [4] = {
        Id = "11519",
        Portrait = IMP .. IMPD .. instanceMediaAcronym .. "bazzalan" .. IMPP,
        Frame = IMP .. IMPD .. instanceMediaAcronym .. "bazzalan" .. IMPF,
        Name = IJ_DB_DUNGEON_RFC_BOSS_NAME_11519,
        Story = IJ_DB_DUNGEON_RFC_BOSS_STORY_11519,
        MapCoordinateX = 41.6,
        MapCoordinateY = 87.2,
        Abilities = {
            [1] = {
                Id = "744",
                Icon = "Spell_Nature_CorrosiveBreath",
                Name = IJ_DB_DUNGEON_RFC_BOSS_11519_ABILITY_NAME_744,
                Effect = IJ_DB_DUNGEON_RFC_BOSS_11519_ABILITY_EFFECT_744,
                Flags = { IMAF.Poison },
            },
            [2] = {
                Id = "14873",
                Icon = "Spell_Shadow_RitualOfSacrifice",
                Name = IJ_DB_DUNGEON_RFC_BOSS_11519_ABILITY_NAME_14873,
                Effect = IJ_DB_DUNGEON_RFC_BOSS_11519_ABILITY_EFFECT_14873,
            },
        },
        Loot = {
            [1] = {
                Id = "80703",
                Icon = "INV_Bracer_07",
                Name = IJ_LOOT_NAME_80703,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Waist,
                ItemType = IT.Leather,
                DropChance = 30,
                LevelRequirement = 13,
            },
            [2] = {
                Id = "80704",
                Icon = "INV_Chest_Chain",
                Name = IJ_LOOT_NAME_80704,
                Quality = IQ.Uncommon,
                ItemSlot = IS.Chest,
                ItemType = IT.Mail,
                DropChance = 30,
                LevelRequirement = 13,
            },
            [3] = {
                Id = "80705",
                Icon = "INV_Spear_08",
                Name = IJ_LOOT_NAME_80705,
                Quality = IQ.Uncommon,
                ItemSlot = IS.TwoHand,
                ItemType = IT.Polearm,
                DropChance = 30,
                LevelRequirement = 13,
            },
            [4] = {
                Id = "5235",
                Icon = "INV_Staff_02",
                Name = IJ_LOOT_NAME_5235,
                Quality = IQ.Common,
                ItemSlot = IS.Ranged,
                ItemType = IT.Wand,
                DropChance = 100,
                ChallengeRestriction = {
                    IC.LevelOneLunatic,
                },
            },
        },
    },
}

IJDB.DG.RFC = RFC
