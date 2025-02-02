ig_mouse_droid = Creature:new {
	objectName = "",
	customName = "Mouse Droid",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 1,
	chanceHit = 0.26,
	damageMin = 55,
	damageMax = 265,
	baseXp = 1,
	baseHAM = 5,
	baseHAMmax = 50,
	armor = 0,
	resists = {10,10,10,10,10,10,10,10,10},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	diet = HERBIVORE,

	templates = {"object/mobile/mouse_droid.iff"},
	scale = 2.0,
	lootGroups = {},
	weapons = {"battle_droid_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,pistoleermaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(ig_mouse_droid, "ig_mouse_droid")
