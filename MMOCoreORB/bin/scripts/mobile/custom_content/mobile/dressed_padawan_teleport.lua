dressed_padawan_teleport = Creature:new {
	customName = "",
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
		"object/mobile/dressed_padawan_female_bothan_01.iff",
		"object/mobile/dressed_padawan_female_bothan_02.iff",
		"object/mobile/dressed_padawan_female_ith_01.iff",
		"object/mobile/dressed_padawan_female_ith_02.iff",
		"object/mobile/dressed_padawan_female_trn_01.iff",
		"object/mobile/dressed_padawan_female_trn_02.iff",
		"object/mobile/dressed_padawan_female_wke_01.iff",
		"object/mobile/dressed_padawan_female_wke_02.iff",
		"object/mobile/dressed_padawan_female_wke_03.iff",
		"object/mobile/dressed_padawan_female_wke_04.iff",
		"object/mobile/dressed_padawan_male_bothan_01.iff",
		"object/mobile/dressed_padawan_male_bothan_02.iff",
		"object/mobile/dressed_padawan_male_ith_01.iff",
		"object/mobile/dressed_padawan_male_ith_02.iff",
		"object/mobile/dressed_padawan_male_sul_01.iff",
		"object/mobile/dressed_padawan_male_sul_02.iff",
		"object/mobile/dressed_padawan_male_trn_01.iff",
		"object/mobile/dressed_padawan_wke_01.iff",
		"object/mobile/dressed_padawan_wke_02.iff",
		"object/mobile/dressed_padawan_wke_03.iff"
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

CreatureTemplates:addCreatureTemplate(dressed_padawan_teleport, "dressed_padawan_teleport")