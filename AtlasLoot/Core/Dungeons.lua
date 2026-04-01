local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

function AtlasLoot_DungeonsMenu1()
	AtlasLoot_PrepMenu(nil, AL["Dungeons & Raids"])
	AtlasLootCharDB.LastBoss = "DUNGEONSMENU1"
	AtlasLootCharDB.LastBossText = AL["Dungeons & Raids"]
	AtlasLootItemsFrame_NEXT:Show()
    --RFC
    AtlasLootMenuItem_1_Name:SetText(AL["[13-18] Ragefire Chasm"]);
	AtlasLootMenuItem_1_Extra:SetText(AL["Orgrimmar"]);
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_1.lootpage="RFCTaragaman";
	AtlasLootMenuItem_1:Show();
	--霜鬃洞穴
	AtlasLootMenuItem_2_Name:SetText(AL["[13-20] Frostmane Hollow"]);
	AtlasLootMenuItem_2_Extra:SetText(AL["Dun Morogh"]);
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_2.lootpage="FMHNimbleTansha";
	AtlasLootMenuItem_2:Show();
	--WC
	AtlasLootMenuItem_3_Name:SetText(AL["[17-24] Wailing Caverns"]);
	AtlasLootMenuItem_3_Extra:SetText(AL["Barrens"]);
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_3.lootpage="WCLordCobrahn";
	AtlasLootMenuItem_3:Show();
	--DM
	AtlasLootMenuItem_4_Name:SetText(AL["[17-24] The Deadmines"]);
	AtlasLootMenuItem_4_Extra:SetText(AL["Westfall"]);
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_4.lootpage="DMRhahkZor";
	AtlasLootMenuItem_4:Show();
	--SFK
	AtlasLootMenuItem_5_Name:SetText(AL["[22-30] Shadowfang Keep"]);
	AtlasLootMenuItem_5_Extra:SetText(AL["Silverpine Forest"]);
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_5.lootpage="SFKRethilgore";
	AtlasLootMenuItem_5:Show();
	--BFD
	AtlasLootMenuItem_6_Name:SetText(AL["[23-32] Blackfathom Deeps"]);
	AtlasLootMenuItem_6_Extra:SetText(AL["Ashenvale"]);
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_6.lootpage="BFDGhamoora";
	AtlasLootMenuItem_6:Show();
	--Stockades
	AtlasLootMenuItem_7_Name:SetText(AL["[22-30] The Stockade"]);
	AtlasLootMenuItem_7_Extra:SetText(AL["Stormwind"]);
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_7.lootpage="SWStTargorr";
	AtlasLootMenuItem_7:Show();
	-- 风角峡谷
    AtlasLootMenuItem_8_Name:SetText(AL["[26-30] Windhorn Canyon"]); -- 等级范围你可改
    AtlasLootMenuItem_8_Extra:SetText(AL["Thousand Needles"]); -- 地图未知先占位，后续改
    AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
    AtlasLootMenuItem_8.lootpage="WSCPathunBuskhide";
    AtlasLootMenuItem_8:Show();
	-- Dragonmaw Retreat
	AtlasLootMenuItem_9_Name:SetText(AL["[26-35] Dragonmaw Retreat"]);
	AtlasLootMenuItem_9_Extra:SetText(AL["Wetlands"]);
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_9.lootpage="DMRGowlfang";
	AtlasLootMenuItem_9:Show();
	--Gnomer
	AtlasLootMenuItem_10_Name:SetText(AL["[29-38] Gnomeregan"]);
	AtlasLootMenuItem_10_Extra:SetText(AL["Dun Morogh"]);
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_10.lootpage="GnGrubbis";
	AtlasLootMenuItem_10:Show();
	--RFK
	AtlasLootMenuItem_11_Name:SetText(AL["[29-38] Razorfen Kraul"]);
	AtlasLootMenuItem_11_Extra:SetText(AL["Barrens"]);
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_11.lootpage="RFKAggem";
	AtlasLootMenuItem_11:Show();
	--Crescent Grove
	AtlasLootMenuItem_12_Name:SetText(AL["[32-38] The Crescent Grove"]);
	AtlasLootMenuItem_12_Extra:SetText(AL["Ashenvale"]);
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_12.lootpage="TCGGrovetenderEngryss";
	AtlasLootMenuItem_12:Show();
	--SM GY
	AtlasLootMenuItem_13_Name:SetText(AL["[27-36] Scarlet Monastery (Graveyard)"]);
	AtlasLootMenuItem_13_Extra:SetText(AL["Tirisfal Glades"]);
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_13.lootpage="SMVishas";
	AtlasLootMenuItem_13:Show();
	--SM Library
	AtlasLootMenuItem_14_Name:SetText(AL["[28-39] Scarlet Monastery (Library)"]);
	AtlasLootMenuItem_14_Extra:SetText(AL["Tirisfal Glades"]);
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_14.lootpage="SMHoundmasterLoksey";
	AtlasLootMenuItem_14:Show();
	--SM Armory
	AtlasLootMenuItem_15_Name:SetText(AL["[32-41] Scarlet Monastery (Armory)"]);
	AtlasLootMenuItem_15_Extra:SetText(AL["Tirisfal Glades"]);
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_15.lootpage="SMHerod";
	AtlasLootMenuItem_15:Show();
	--SM Cathedral
	AtlasLootMenuItem_16_Name:SetText(AL["[35-45] Scarlet Monastery (Cathedral)"]);
	AtlasLootMenuItem_16_Extra:SetText(AL["Tirisfal Glades"]);
	AtlasLootMenuItem_16_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_16.lootpage="SMFairbanks";
	AtlasLootMenuItem_16:Show();
	-- Stormwrought Ruins
	AtlasLootMenuItem_17_Name:SetText(AL["[32-44] Stormwrought Ruins"]);
	AtlasLootMenuItem_17_Extra:SetText(AL["Balor"]);
	AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_17.lootpage="SWROronok";
	AtlasLootMenuItem_17:Show();
	--RFD
	AtlasLootMenuItem_18_Name:SetText(AL["[36-46] Razorfen Downs"]);
	AtlasLootMenuItem_18_Extra:SetText(AL["Barrens"]);
	AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_18.lootpage="RFDTutenkash";
	AtlasLootMenuItem_18:Show();
	--Uldaman
	AtlasLootMenuItem_19_Name:SetText(AL["[40-51] Uldaman"]);
	AtlasLootMenuItem_19_Extra:SetText(AL["Badlands"]);
	AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_19.lootpage="UldBaelog";
	AtlasLootMenuItem_19:Show();
	--Gilneas
	AtlasLootMenuItem_20_Name:SetText(AL["[42-50] Gilneas City"]);
	AtlasLootMenuItem_20_Extra:SetText(AL["Gilneas"]);
	AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_20.lootpage="GCMatthiasHoltz";
	AtlasLootMenuItem_20:Show();
	--Mara
	AtlasLootMenuItem_21_Name:SetText(AL["[45-55] Maraudon"]);
	AtlasLootMenuItem_21_Extra:SetText(AL["Desolace"]);
	AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_21.lootpage="MaraNoxxion";
	AtlasLootMenuItem_21:Show();
	--ZF
	AtlasLootMenuItem_22_Name:SetText(AL["[44-54] Zul'Farrak"]);
	AtlasLootMenuItem_22_Extra:SetText(AL["Tanaris"]);
	AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_22.lootpage="ZFAntusul";
	AtlasLootMenuItem_22:Show();
	--ST
	AtlasLootMenuItem_23_Name:SetText(AL["[50-60] The Sunken Temple"]);
	AtlasLootMenuItem_23_Extra:SetText(AL["Swamp of Sorrows"]);
	AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_23.lootpage="STBalconyMinibosses";
	AtlasLootMenuItem_23:Show();
	--HFQ
	AtlasLootMenuItem_24_Name:SetText(AL["[50-60] Hateforge Quarry"]);
	AtlasLootMenuItem_24_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_24.lootpage="HQHighForemanBargulBlackhammer";
	AtlasLootMenuItem_24:Show();
	--BRD
	AtlasLootMenuItem_25_Name:SetText(AL["[52-60] Blackrock Depths"]);
	AtlasLootMenuItem_25_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_25_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_25.lootpage="BRDLordRoccor";
	AtlasLootMenuItem_25:Show();
	--DME
	AtlasLootMenuItem_26_Name:SetText(AL["[55-60] Dire Maul (East)"]);
	AtlasLootMenuItem_26_Extra:SetText(AL["Feralas"]);
	AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_26.lootpage="DMEPusillin";
	AtlasLootMenuItem_26:Show();
	--DMW
	AtlasLootMenuItem_27_Name:SetText(AL["[57-60] Dire Maul (West)"]);
	AtlasLootMenuItem_27_Extra:SetText(AL["Feralas"]);
	AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_27.lootpage="DMWTendrisWarpwood";
	AtlasLootMenuItem_27:Show();
	--DMN
	AtlasLootMenuItem_28_Name:SetText(AL["[57-60] Dire Maul (North)"]);
	AtlasLootMenuItem_28_Extra:SetText(AL["Feralas"]);
	AtlasLootMenuItem_28_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_28.lootpage="DMNGuardMoldar";
	AtlasLootMenuItem_28:Show();
	--Scholo
	AtlasLootMenuItem_29_Name:SetText(AL["[58-60] Scholomance"]);
	AtlasLootMenuItem_29_Extra:SetText(AL["Western Plaguelands"]);
	AtlasLootMenuItem_29_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_29.lootpage="SCHOLOKirtonostheHerald";
	AtlasLootMenuItem_29:Show();
	--Strat
	AtlasLootMenuItem_30_Name:SetText(AL["[58-60] Stratholme"]);
	AtlasLootMenuItem_30_Extra:SetText(AL["Eastern Plaguelands"]);
	AtlasLootMenuItem_30_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_30.lootpage="STRATSkull";
	AtlasLootMenuItem_30:Show();
	
end

function AtlasLoot_DungeonsMenu2()
	AtlasLoot_PrepMenu(nil, AL["Dungeons & Raids"])
	AtlasLootCharDB.LastBoss = "DUNGEONSMENU2"
	AtlasLootCharDB.LastBossText = AL["Dungeons & Raids"]
	AtlasLootItemsFrame_PREV:Show()
	--LBRS
	AtlasLootMenuItem_1_Name:SetText(AL["[55-60] Lower Blackrock Spire"]);
	AtlasLootMenuItem_1_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_1_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_1.lootpage="LBRSSpirestoneButcher";
	AtlasLootMenuItem_1:Show();
	--UBRS
	AtlasLootMenuItem_2_Name:SetText(AL["[58-60] Upper Blackrock Spire"]);
	AtlasLootMenuItem_2_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_2_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_2.lootpage="UBRSEmberseer";
	AtlasLootMenuItem_2:Show();
	--Kara crypt
	AtlasLootMenuItem_3_Name:SetText(AL["[58-60] Karazhan Crypt"]);
	AtlasLootMenuItem_3_Extra:SetText(AL["Deadwind Pass"]);
	AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_3.lootpage="KCMarrowspike";
	AtlasLootMenuItem_3:Show();
	--CoT:BM
	AtlasLootMenuItem_4_Name:SetText(AL["[60] Caverns of Time: Black Morass"]);
	AtlasLootMenuItem_4_Extra:SetText(AL["Tanaris"]);
	AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_4.lootpage="COTBMChronar";
	AtlasLootMenuItem_4:Show()
	--SWV
    AtlasLootMenuItem_5_Name:SetText(AL["[60] Stormwind Vault"]);
	AtlasLootMenuItem_5_Extra:SetText(AL["Stormwind"]);
	AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalIronForge");
	AtlasLootMenuItem_5.lootpage="SWVAszoshGrimflame";
	AtlasLootMenuItem_5:Show();
	--ZG
    AtlasLootMenuItem_6_Name:SetText(AL["[RAID] Zul'Gurub"]);
	AtlasLootMenuItem_6_Extra:SetText(AL["Stranglethorn Vale"]);
	AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_6.lootpage="ZGJeklik";
	AtlasLootMenuItem_6:Show();
	--AQ20
	AtlasLootMenuItem_7_Name:SetText(AL["[RAID] Ruins of Ahn'Qiraj"]);
	AtlasLootMenuItem_7_Extra:SetText(AL["Silithus"]);
	AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_7.lootpage="AQ20Kurinnaxx";
	AtlasLootMenuItem_7:Show();
	--MC
	AtlasLootMenuItem_8_Name:SetText(AL["[RAID] Molten Core"]);
	AtlasLootMenuItem_8_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_8_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_8.lootpage="MCIncindis";
	AtlasLootMenuItem_8:Show();
	--Ony
	AtlasLootMenuItem_9_Name:SetText(AL["[RAID] Onyxia's Lair"]);
	AtlasLootMenuItem_9_Extra:SetText(AL["Dustwallow Marsh"]);
	AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_9.lootpage="Onyxia";
	AtlasLootMenuItem_9:Show();
	--LKH
	AtlasLootMenuItem_10_Name:SetText(AL["[RAID] Lower Karazhan Halls"]);
	AtlasLootMenuItem_10_Extra:SetText(AL["Deadwind Pass"]);
	AtlasLootMenuItem_10_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_10.lootpage="LKHRolfen";
	AtlasLootMenuItem_10:Show();
	--木喉要塞
	AtlasLootMenuItem_11_Name:SetText(AL["[RAID] Timbermaw Hold"]);
	AtlasLootMenuItem_11_Extra:SetText(AL["Azshara"]);
	AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_11.lootpage="TMHKarrshtheSentinel";
	AtlasLootMenuItem_11:Show();

	--BWL
	AtlasLootMenuItem_12_Name:SetText(AL["[RAID] Blackwing Lair"]);
	AtlasLootMenuItem_12_Extra:SetText(AL["Burning Steppes"]);
	AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_12.lootpage="BWLRazorgore";
	AtlasLootMenuItem_12:Show();
	--ES
	AtlasLootMenuItem_13_Name:SetText(AL["[RAID] Emerald Sanctum"]);
	AtlasLootMenuItem_13_Extra:SetText(AL["Hyjal"]);
	AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_13.lootpage="ESErennius";
	AtlasLootMenuItem_13:Show();
	--AQ40
	AtlasLootMenuItem_14_Name:SetText(AL["[RAID] Temple of Ahn'Qiraj"]);
	AtlasLootMenuItem_14_Extra:SetText(AL["Silithus"]);
	AtlasLootMenuItem_14_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_14.lootpage="AQ40Skeram";
	AtlasLootMenuItem_14:Show();
	--Naxx
	AtlasLootMenuItem_15_Name:SetText(AL["[RAID] Naxxramas"]);
	AtlasLootMenuItem_15_Extra:SetText(AL["Eastern Plaguelands"]);
	AtlasLootMenuItem_15_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_15.lootpage="NAXPatchwerk";
	AtlasLootMenuItem_15:Show();
    --UKH
	AtlasLootMenuItem_16_Name:SetText(AL["[RAID] Upper Karazhan Halls"]);
	AtlasLootMenuItem_16_Extra:SetText(AL["Deadwind Pass"]);
	AtlasLootMenuItem_16_Icon:SetTexture("Interface\\Icons\\Spell_Arcane_PortalOrgrimmar");
	AtlasLootMenuItem_16.lootpage="UKHGnarlmoon";
	AtlasLootMenuItem_16:Show();
end