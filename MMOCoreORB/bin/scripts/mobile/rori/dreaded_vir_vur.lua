dreaded_vir_vur = Creature:new {
	objectName = "@mob/creature_names:dreaded_vir_vir",
	socialGroup = "vir_vur",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 38,
	chanceHit = 0.44,
	damageMin = 370,
	damageMax = 450,
	baseXp = 3824,
	baseHAM = 8400,
	baseHAMmax = 10200,
	armor = 0,
	resists = {140,0,-1,-1,0,0,0,0,-1},
	meatType = "meat_avian",
	meatAmount = 25,
	hideType = "hide_wooly",
	hideAmount = 20,
	boneType = "bone_mammal",
	boneAmount = 16,
	milk = 0,
	tamingChance = 0.2,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/vir_vur_hue.iff"},
	hues = { 16, 17, 18, 19, 20, 21, 22, 23 },
	controlDeviceTemplate = "object/intangible/pet/vir_vur_hue.iff",
	scale = 1.35,
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"intimidationattack",""} },
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(dreaded_vir_vur, "dreaded_vir_vur")
