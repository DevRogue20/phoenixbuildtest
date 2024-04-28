yoda_test = Creature:new {
	objectName = "",
	customName = "\\#00FF00Grand Master Yoda",
	socialGroup = "Townsperson",
	pvpFaction = "Townsperson",
	faction = "",
	level = 45,
	chanceHit = 0.47,
	damageMin = 395,
	damageMax = 500,
	baseXp = 4461,
	baseHAM = 9700,
	baseHAMmax = 11900,
	armor = 0,
	resists = {30,30,30,0,30,-1,30,-1,-1},
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
	creatureBitmask = PACK + HEALER,
	optionsBitmask = AIENABLED + INVULNERABLE + CONVERSABLE,
	diet = HERBIVORE,
	scale = 1.25,

	templates = {"object/mobile/yoda.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "yoda_test_convo_template",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(yoda_test, "yoda_test")