-- 指令相关

BINDING_HEADER_CAT_PLUGINNAME = "Cat 喵！一键宏"


-- 注册猫德输出指令
function MPCatCommand()
    if MPPlayerClass ~= "DRUID" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPCat()
end
function MPCatAshamaneCommand()
    if MPPlayerClass ~= "DRUID" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	if MPDriudPrimalFury>=20 then  MPDuridCatFinishers=0 end

	MPCat()
end
function MPCatShredCommand()
    if MPPlayerClass ~= "DRUID" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPCat(2)
end
function MPBearCommand()
    if MPPlayerClass ~= "DRUID" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPBear()
end
function MPBearOneCommand()
    if MPPlayerClass ~= "DRUID" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPBear(1)
end
function MPCooCommand()
    if MPPlayerClass ~= "DRUID" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPCoo()
end
function MPDHealCommand()
    if MPPlayerClass ~= "DRUID" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPDriudAutoHealth()
end





function MPPaladinHealCommand()
    if MPPlayerClass ~= "PALADIN" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPPaladinAutoHealth()
end
function MPPaladinMeleeHealCommand()
    if MPPlayerClass ~= "PALADIN" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPPaladinAutoMeleeHealth()
end
function MPPaladinDPSSpellCommand()
    if MPPlayerClass ~= "PALADIN" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPPaladinCJSpell()
end
function MPPaladinTankCommand()
    if MPPlayerClass ~= "PALADIN" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPPallyTank()
end




function MPWarriorDPSCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."请使用新指令：/Arms or /Fury or /Evil")
end
function MPWarriorDPSOneCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."请使用新指令：/Armso or /Furyo or /Evilo")
end

function MPWarriorArmsCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPArmsDPS()
end
function MPWarriorArmsOneCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPArmsDPS(1)
end

function MPWarriorFuryCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPFuryDPS()
end
function MPWarriorFuryOneCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPFuryDPS(1)
end

function MPWarriorEvilCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPEvilDPS()
end
function MPWarriorEvilOneCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPEvilDPS(1)
end


function MPWarriorTankCommand()
    if MPPlayerClass ~= "WARRIOR" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPWarriorTank()
end




function MPRogueDPSCommand()
    if MPPlayerClass ~= "ROGUE" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPRogueDPS()
	--DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."请使用新指令！")
end

function MPRogueEnvenomCommand()
    if MPPlayerClass ~= "ROGUE" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPRogueEnvenomDPS()
end

function MPRogueCombatCommand()
    if MPPlayerClass ~= "ROGUE" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPRogueCombatDPS()
end

function MPRoguePJZCommand()
    if MPPlayerClass ~= "ROGUE" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPRoguePJZ()
end




function MPShamanHealCommand()
    if MPPlayerClass ~= "SHAMAN" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPShamanAutoHealth()
end
function MPShamanEnhanceCommand()
    if MPPlayerClass ~= "SHAMAN" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPShamanAutoEnhance()
end
function MPShamanFireCommand()
    if MPPlayerClass ~= "SHAMAN" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPShamanAutoFireSM()
end
function MPShamanElementalCommand()
    if MPPlayerClass ~= "SHAMAN" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPShamanAutoElemental()
end





function MPWarlockSDCommand()
    if MPPlayerClass ~= "WARLOCK" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPWarlockSD()
end
function MPWarlockFDCommand()
    if MPPlayerClass ~= "WARLOCK" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPWarlockFD()
end
function MPWarlockAffCommand()
    if MPPlayerClass ~= "WARLOCK" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPWarlockAff()
end
function MPWarlockDemoCommand()
    if MPPlayerClass ~= "WARLOCK" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPWarlockDemo()
end





function MPMageArcaneCommand()
    if MPPlayerClass ~= "MAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPMageArcaneAuto()
end
function MPMageFireCommand()
    if MPPlayerClass ~= "MAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPMageFireAuto()
end
function MPMageFrostCommand()
    if MPPlayerClass ~= "MAGE" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPMageFrostAuto()
end





function MPHolyPriestCommand()
    if MPPlayerClass ~= "PRIEST" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPPriestAutoHealth()
end
function MPShadowPriestCommand()
    if MPPlayerClass ~= "PRIEST" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPPriestShadow()
end
function MPDisciplinePriestCommand()
    if MPPlayerClass ~= "PRIEST" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPPriestDiscipline()
end





function MPHunterShotCommand()
    if MPPlayerClass ~= "HUNTER" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPHunterShotDPS()
end
function MPHunterBeastCommand()
    if MPPlayerClass ~= "HUNTER" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPHunterBeastDPS()
end
function MPHunterMeleeCommand()
    if MPPlayerClass ~= "HUNTER" then
		DEFAULT_CHAT_FRAME:AddMessage(MPTipsColor.."职业错误！")
		return
	end

	MPHunterMeleeDPS()
end





function MPINTCastCommand(arg1)
	if not arg1 or string.len(arg1)<1 then
		MPINTCast()
	else
		MPINTCast(arg1)
	end
end

function MPINTCastListCommand(arg1)
	MPINTCastList()
end

function MPMDotCommand(arg1)
	MPMuiltlineDot()
end

function MPPowerCommand(arg1)
	MPCatPower()
end

function MPElixirCommand(arg1)
	MPCatElixir()
end

function MPAutoLootCommand(arg1)
	MPAutoLoot()
end

function MPCatUICommand()

    MPCatSettingsCloseAll()
    CatUISettingsCatMenu:Show()

end

function MPCatUIResetCommand()
	MPResetAllSettings()
end



SlashCmdList['CAT1'] = MPCatCommand
SLASH_CAT11 = '/catdps'
SlashCmdList['CAT2'] = MPCatShredCommand
SLASH_CAT21 = '/catshred'
SlashCmdList['CAT3'] = MPCatAshamaneCommand
SLASH_CAT31 = '/catasm'
SlashCmdList['BEAR'] = MPBearCommand
SLASH_BEAR1 = '/beardps'
SlashCmdList['BEARONE'] = MPBearOneCommand
SLASH_BEARONE1 = '/bearone'
SlashCmdList['COO'] = MPCooCommand
SLASH_COO1 = '/coodps'
SlashCmdList['DHEAL'] = MPDHealCommand
SLASH_DHEAL1 = '/dheal'

SlashCmdList['PALADINHEAL'] = MPPaladinHealCommand
SLASH_PALADINHEAL1 = '/pheal'
SlashCmdList['PALADINMELEEHEAL'] = MPPaladinMeleeHealCommand
SLASH_PALADINMELEEHEAL1 = '/mpheal'
SlashCmdList['PALADINDPS'] = MPPaladinDPSSpellCommand
SLASH_PALADINDPS1 = '/paladindps_spell'
SLASH_PALADINDPS2 = '/pdps'
SlashCmdList['PALADINTANK'] = MPPaladinTankCommand
SLASH_PALADINTANK1 = '/ptank'


SlashCmdList['WARRIORDPS'] = MPWarriorDPSCommand
SLASH_WARRIORDPS1 = '/wdps'
SlashCmdList['WARRIORDPSONE'] = MPWarriorDPSOneCommand
SLASH_WARRIORDPSONE1 = '/wdpso'

SlashCmdList['WARRIORARMS'] = MPWarriorArmsCommand
SLASH_WARRIORARMS1 = '/arms'
SlashCmdList['WARRIORARMSONE'] = MPWarriorArmsOneCommand
SLASH_WARRIORARMSONE1 = '/armso'

SlashCmdList['WARRIORFURY'] = MPWarriorFuryCommand
SLASH_WARRIORFURY1 = '/fury'
SlashCmdList['WARRIORFURYONE'] = MPWarriorFuryOneCommand
SLASH_WARRIORFURYONE1 = '/furyo'

SlashCmdList['WARRIOREVIL'] = MPWarriorEvilCommand
SLASH_WARRIOREVIL1 = '/evil'
SlashCmdList['WARRIOREVILONE'] = MPWarriorEvilOneCommand
SLASH_WARRIOREVILONE1 = '/evilo'

SlashCmdList['WARRIORTANK'] = MPWarriorTankCommand
SLASH_WARRIORTANK1 = '/warriortank'
SLASH_WARRIORTANK2 = '/wtank'

SlashCmdList['ROGUEDPS'] = MPRogueDPSCommand
SLASH_ROGUEDPS1 = '/rdps'
SlashCmdList['ROGUEENVENOM'] = MPRogueEnvenomCommand
SLASH_ROGUEENVENOM1 = '/dsdps'
SlashCmdList['ROGUECOMBAT'] = MPRogueCombatCommand
SLASH_ROGUECOMBAT1 = '/zddps'
SlashCmdList['ROGUEPJZ'] = MPRoguePJZCommand
SLASH_ROGUEPJZ1 = '/pjz'

SlashCmdList['SHAMANHEAL'] = MPShamanHealCommand
SLASH_SHAMANHEAL1 = '/sheal'
SlashCmdList['SHAMANENHANCE'] = MPShamanEnhanceCommand
SLASH_SHAMANENHANCE1 = '/swdps'
SlashCmdList['SHAMANFIRE'] = MPShamanFireCommand
SLASH_SHAMANFIRE1 = '/fedps'
SlashCmdList['SHAMANELEMENTAL'] = MPShamanElementalCommand
SLASH_SHAMANELEMENTAL1 = '/sedps'

SlashCmdList['WARLOCKSD'] = MPWarlockSDCommand
SLASH_WARLOCKSD1 = '/ahdps'
SlashCmdList['WARLOCKFD'] = MPWarlockFDCommand
SLASH_WARLOCKFD1 = '/fhdps'
SlashCmdList['WARLOCKAFF'] = MPWarlockAffCommand
SLASH_WARLOCKAFF1 = '/tkdps'
SlashCmdList['WARLOCKDEMO'] = MPWarlockDemoCommand
SLASH_WARLOCKDEMO1 = '/dedps'


SlashCmdList['MAGEARCANE'] = MPMageArcaneCommand
SLASH_MAGEARCANE1 = '/madps'
SlashCmdList['MAGEFIRE'] = MPMageFireCommand
SLASH_MAGEFIRE1 = '/mhdps'
SlashCmdList['MAGEFROST'] = MPMageFrostCommand
SLASH_MAGEFROST1 = '/mfdps'


SlashCmdList['HOLYPRIEST'] = MPHolyPriestCommand
SLASH_HOLYPRIEST1 = '/mheal'
SlashCmdList['SHADOWPRIEST'] = MPShadowPriestCommand
SLASH_SHADOWPRIEST1 = '/amdps'
SlashCmdList['DISCIPLINEPRIEST'] = MPDisciplinePriestCommand
SLASH_DISCIPLINEPRIEST1 = '/jldps'


SlashCmdList['HUNTERSHOT'] = MPHunterShotCommand
SLASH_HUNTERSHOT1 = '/sjdps'
SlashCmdList['HUNTERBEAST'] = MPHunterBeastCommand
SLASH_HUNTERBEAST1 = '/hbdps'
SlashCmdList['HUNTERMELEE'] = MPHunterMeleeCommand
SLASH_HUNTERMELEE1 = '/hmdps'



SlashCmdList['INTCAST'] = MPINTCastCommand
SLASH_INTCAST1 = '/INTCast'

SlashCmdList['INTCASTLIST'] = MPINTCastListCommand
SLASH_INTCASTLIST1 = '/INTCastList'

SlashCmdList['MDOT'] = MPMDotCommand
SLASH_MDOT1 = '/mdot'

SlashCmdList['CATPOWER'] = MPPowerCommand
SLASH_CATPOWER1 = '/catp'
SLASH_CATPOWER2 = '/catpower'

SlashCmdList['CATELIXIR'] = MPElixirCommand
SLASH_CATELIXIR1 = '/cate'

SlashCmdList['AUTOLOOT'] = MPAutoLootCommand
SLASH_AUTOLOOT1 = '/catpick'

SlashCmdList['CATUI'] = MPCatUICommand
SLASH_CATUI1 = '/catui'
SLASH_CATUI2 = '/cat'
SlashCmdList['CATRESET'] = MPCatUIResetCommand
SLASH_CATRESET1 = '/catreset'
