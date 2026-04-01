IJDB = IJDB or {}

local IS = IJLib.ItemSlot
local IT = IJLib.ItemType
local IQ = IJLib.Quality
local IMP = IJLib.MediaPath
local IMPR = IJLib.MediaPathRaids
local IMPP = IJLib.MediaPathPortrait
local IMPF = IJLib.MediaPathFrame
local IMAF = IJLib.AbilityFlags
local IMCL = IJLib.Classes
local IMI = IJLib.MapId
local IZI = IJLib.ZoneId

local instanceMediaAcronym = "th\\"

local TH = {}

TH.Name = IJ_DB_RAID_TH_NAME
TH.Story = IJ_DB_RAID_TH_STORY
TH.Type = IJLib.InstanceType.Raid
TH.Background = IMP .. IMPR .. instanceMediaAcronym .. "background"
TH.GridBackground = IMP .. IMPR .. instanceMediaAcronym .. "grid-background"
TH.MapId = IMI.TimbermawHold
TH.IconScale = 0.7
TH.MinLevel = 60
TH.MaxLevel = 60
TH.Entrances = {
    [1] = {
        MapContinentId = IMI.Kalimdor,
        MapZoneId = IZI.TimbermawHold,
        MapCoordinateX = 16.8,
        MapCoordinateY = 43.2,
    },
}
TH.Bosses = {
    [1] = { -- NOTE: Missing abilities, Missing loot
        Id = "aaaaa",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "aaaaa" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "aaaaa" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_aaaaa,
        Story = IJ_DB_RAID_TH_BOSS_STORY_aaaaa,
        MapCoordinateX = 31.0,
        MapCoordinateY = 73.5,
    },
    [2] = { -- NOTE: Missing abilities, Missing loot
        Id = "bbbbb",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "bbbbb" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "bbbbb" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_bbbbb,
        Story = IJ_DB_RAID_TH_BOSS_STORY_bbbbb,
        MapCoordinateX = 15.1,
        MapCoordinateY = 59.3,
    },
    [3] = { -- NOTE: Missing abilities, Missing loot
        Id = "ccccc",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "ccccc" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "ccccc" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_ccccc,
        Story = IJ_DB_RAID_TH_BOSS_STORY_ccccc,
        MapCoordinateX = 14.7,
        MapCoordinateY = 50.0,
    },
    [4] = { -- NOTE: Missing abilities, Missing loot
        Id = "ddddd",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "ddddd" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "ddddd" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_ddddd,
        Story = IJ_DB_RAID_TH_BOSS_STORY_ddddd,
        MapCoordinateX = 32.4,
        MapCoordinateY = 36.3,
    },
    [5] = { -- NOTE: Missing abilities, Missing loot
        Id = "eeeee",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "eeeee" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "eeeee" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_eeeee,
        Story = IJ_DB_RAID_TH_BOSS_STORY_eeeee,
        MapCoordinateX = 54.7,
        MapCoordinateY = 64.7,
    },
    [6] = { -- NOTE: Missing abilities, Missing loot
        Id = "hhhhh",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "hhhhh" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "hhhhh" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_hhhhh,
        Story = IJ_DB_RAID_TH_BOSS_STORY_hhhhh,
        MapCoordinateX = 42.4,
        MapCoordinateY = 30.7,
    },
    [7] = { -- NOTE: Missing abilities, Missing loot
        Id = "iiiii",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "iiiii" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "iiiii" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_iiiii,
        Story = IJ_DB_RAID_TH_BOSS_STORY_iiiii,
        MapCoordinateX = 22.2,
        MapCoordinateY = 8.4,
    },
    [8] = { -- NOTE: Missing abilities, Missing loot
        Id = "fffff",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "fffff" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "fffff" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_fffff,
        Story = IJ_DB_RAID_TH_BOSS_STORY_fffff,
        MapCoordinateX = 45.7,
        MapCoordinateY = 58.4,
    },
    [9] = { -- NOTE: Missing abilities, Missing loot
        Id = "ggggg",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "ggggg" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "ggggg" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_ggggg,
        Story = IJ_DB_RAID_TH_BOSS_STORY_ggggg,
        MapCoordinateX = 49.5,
        MapCoordinateY = 37.8,
    },
    [10] = { -- NOTE: Missing abilities, Missing loot
        Id = "jjjjj",
        Portrait = IMP .. IMPR .. instanceMediaAcronym .. "jjjjj" .. IMPP,
        Frame = IMP .. IMPR .. instanceMediaAcronym .. "jjjjj" .. IMPF,
        Name = IJ_DB_RAID_TH_BOSS_NAME_jjjjj,
        Story = IJ_DB_RAID_TH_BOSS_STORY_jjjjj,
        MapCoordinateX = 49.5,
        MapCoordinateY = 37.8,
    },
}

IJDB.R.TH = TH
