memorialguard = Creature:new {
	objectName = "@mob/creature_names:artisan",
	customName = "Memorial Guard",
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 250,
	chanceHit = 0.24,
	damageMin = 40,
	damageMax = 45,
	baseXp = 62,
	baseHAM = 11300,
	baseHAMmax = 13800,
	armor = 0,
	resists = {85,85,85,85,85,85,85,-1,-1},
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
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED + CONVERSABLE,
	diet = HERBIVORE,


	templates = {"object/mobile/royal_guard.iff"},
	scale = 1.0,				
	lootGroups = {},
	weapons = {},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(memorialguard, "memorialguard")
