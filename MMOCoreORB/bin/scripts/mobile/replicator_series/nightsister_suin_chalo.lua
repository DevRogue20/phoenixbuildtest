nightsister_suin_chalo = Creature:new {
	objectName = "@mob/creature_names:nightsister_elder",
	customName = "Suin Chalo The Ravager",
	socialGroup = "nightsister",
	faction = "nightsister",
	level = 378,
	chanceHit = 27.25,
	damageMin = 1020,
	damageMax = 1850,
	baseXp = 26654,
	baseHAM = 781000,
	baseHAMmax = 792000,
	armor = 3,
	resists = {71,60,47,44,45,40,42,50,40},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	aggroRadius = 80,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_nightsister_protector.iff"},
	scale = 1.2,
	lootGroups = {
		{
	        	groups =
			{
				{group = "crystals_premium", chance = 500000},
				{group = "color_crystals", chance = 500000},
				{group = "nightsister_common", chance = 2000000},
				{group = "armor_attachments", chance = 250000},
				{group = "clothing_attachments", chance = 250000},
				{group = "melee_weapons", chance = 2500000},
				{group = "rifles", chance = 1000000},
				{group = "pistols", chance = 1000000},
				{group = "carbines", chance = 1000000},
				{group = "wearables_common", chance = 500000},
				{group = "tailor_components", chance = 500000}
			},
			lootChance = 8500000,
		},
		{
	        	groups =
			{
				{group = "geo_jawa_crystal", chance = 10000000},
			},
			lootChance = 6500000,
		},
		{
			groups =
			{
				{group = "infiltrator_armor_loot",  chance = 4000000},
				{group = "spec_force_armor_loot",  chance = 6000000}
			},
			lootChance = 6000000,
		}
	},
	weapons = {"ubar_weapons"},
	conversationTemplate = "",
	attacks = merge(swordsmanmaster,forcewielder)
}

CreatureTemplates:addCreatureTemplate(nightsister_suin_chalo, "nightsister_suin_chalo")
