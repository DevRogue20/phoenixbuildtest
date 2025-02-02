dressed_dark_jedi_transport = Creature:new {
	customName = "dressed_dark_jedi_transport",
	socialGroup = "townsperson",
	faction = "",
	mobType = MOB_NPC,
	level = 100,
	chanceHit = 1,
	damageMin = 645,
	damageMax = 1000,
	baseXp = 9429,
	baseHAM = 24000,
	baseHAMmax = 30000,
	armor = 0,
	resists = {0, 0, 0, 0, 0, 0, 0, 0, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/dressed_dark_jedi_elder_female_bothan_01.iff",
		"object/mobile/dressed_dark_jedi_elder_female_bothan_02.iff",
		"object/mobile/dressed_dark_jedi_elder_female_bothan_03.iff",
		"object/mobile/dressed_dark_jedi_elder_female_human_01.iff",
		"object/mobile/dressed_dark_jedi_elder_female_human_02.iff",
		"object/mobile/dressed_dark_jedi_elder_female_human_03.iff",
		"object/mobile/dressed_dark_jedi_elder_female_rodian_01.iff",
		"object/mobile/dressed_dark_jedi_elder_female_rodian_02.iff",
		"object/mobile/dressed_dark_jedi_elder_female_rodian_03.iff",
		"object/mobile/dressed_dark_jedi_elder_female_rodian_04.iff",
		"object/mobile/dressed_dark_jedi_elder_female_rodian_05.iff",
		"object/mobile/dressed_dark_jedi_elder_male_bothan_01.iff",
		"object/mobile/dressed_dark_jedi_elder_male_bothan_02.iff",
		"object/mobile/dressed_dark_jedi_elder_male_bothan_03.iff",
		"object/mobile/dressed_dark_jedi_elder_male_devorian_01.iff",
		"object/mobile/dressed_dark_jedi_elder_male_devorian_02.iff",
		"object/mobile/dressed_dark_jedi_elder_male_gran_01.iff",
		"object/mobile/dressed_dark_jedi_elder_male_human_01.iff",
		"object/mobile/dressed_dark_jedi_elder_male_human_02.iff",
		"object/mobile/dressed_dark_jedi_elder_male_human_03.iff",
		"object/mobile/dressed_dark_jedi_elder_male_human_04.iff",
		"object/mobile/dressed_dark_jedi_elder_male_rodian_01.iff",
		"object/mobile/dressed_dark_jedi_elder_male_rodian_02.iff",
		"object/mobile/dressed_dark_jedi_elder_male_rodian_03.iff",
		"object/mobile/dressed_dark_jedi_female_human_01.iff",
		"object/mobile/dressed_dark_jedi_female_human_02.iff",
		"object/mobile/dressed_dark_jedi_female_human_03.iff",
		"object/mobile/dressed_dark_jedi_female_human_04.iff",
		"object/mobile/dressed_dark_jedi_female_marauder_01.iff",
		"object/mobile/dressed_dark_jedi_female_singingmtnclan_01.iff",
		"object/mobile/dressed_dark_jedi_female_singingmtnclan_02.iff",
		"object/mobile/dressed_dark_jedi_female_twk_01.iff",
		"object/mobile/dressed_dark_jedi_female_twk_02.iff",
		"object/mobile/dressed_dark_jedi_female_twk_03.iff",
		"object/mobile/dressed_dark_jedi_female_zab_01.iff",
		"object/mobile/dressed_dark_jedi_female_zab_02.iff",
		"object/mobile/dressed_dark_jedi_female_zab_03.iff",
		"object/mobile/dressed_dark_jedi_male_human_01.iff",
		"object/mobile/dressed_dark_jedi_male_human_02.iff",
		"object/mobile/dressed_dark_jedi_male_human_03.iff",
		"object/mobile/dressed_dark_jedi_male_human_04.iff",
		"object/mobile/dressed_dark_jedi_male_human_05.iff",
		"object/mobile/dressed_dark_jedi_male_human_06.iff",
		"object/mobile/dressed_dark_jedi_male_marauder_01.iff",
		"object/mobile/dressed_dark_jedi_male_twk_01.iff",
		"object/mobile/dressed_dark_jedi_male_twk_02.iff",
		"object/mobile/dressed_dark_jedi_male_twk_03.iff",
		"object/mobile/dressed_dark_jedi_male_zab_01.iff",
		"object/mobile/dressed_dark_jedi_male_zab_02.iff",
		"object/mobile/dressed_dark_jedi_male_zab_03.iff",

	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = {},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(dressed_dark_jedi_transport, "dressed_dark_jedi_transport")