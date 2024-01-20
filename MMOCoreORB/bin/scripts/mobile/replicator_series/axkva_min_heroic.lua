axkva_min_heroic = Creature:new {
	objectName = "@mob/creature_names:axkva_min",
	socialGroup = "nightsister",
	faction = "nightsister",
	level = 500,
	chanceHit = 300,
	damageMin = 1600,
	damageMax = 2075,
	baseXp = 12612,
	bonusType = "pve_xp",
	bonusXP = 1500,
	baseHAM = 1896000,
	baseHAMmax = 1900000,
	armor = 3,
	resists = {55,55,40,60,30,35,40,35,55},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	aggroRadius = 130,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_nightsister_axkva.iff"},
	scale = 1.6,
	lootGroups = {
		{
			groups =
			{
				{group = "war_droid_loot", chance = 10000000},
			},
			lootChance = 3500000,
		},
		{
	        	groups =
			{
				{group = "nightsister_common", chance = 3000000},
				{group = "power_crystals", chance = 4000000},
				{group = "nightsister_rare", chance = 3000000},
			},
			lootChance = 9500000,
		},
		{
			groups = {
				{group = "axkva_min", chance = 10000000},
			},
			lootChance = 9000000
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(fencermaster,swordsmanmaster,tkamaster,pikemanmaster,brawlermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(axkva_min_heroic, "axkva_min_heroic")
