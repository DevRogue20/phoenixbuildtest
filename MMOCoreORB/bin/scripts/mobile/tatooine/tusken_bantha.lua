tusken_bantha = Creature:new {
	objectName = "@mob/creature_names:tusken_bantha",
	socialGroup = "tusken_raider",
	faction = "tusken_raider",
	mobType = MOB_HERBIVORE,
	level = 25,
	chanceHit = 0.36,
	damageMin = 260,
	damageMax = 270,
	baseXp = 2543,
	baseHAM = 6300,
	baseHAMmax = 7700,
	armor = 0,
	resists = {120,125,15,150,-1,-1,-1,-1,-1},
	meatType = "meat_domesticated",
	meatAmount = 475,
	hideType = "hide_wooly",
	hideAmount = 350,
	boneType = "bone_mammal",
	boneAmount = 375,
	milkType = "milk_domesticated",
	milk = 235,
	tamingChance = 0,
	ferocity = 2,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/bantha_saddle_hue.iff"},
	hues = { 8, 9, 10, 11, 12, 13, 14, 15 },
	scale = 1.25,
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	conversationTemplate = "",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"posturedownattack",""} },
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(tusken_bantha, "tusken_bantha")
