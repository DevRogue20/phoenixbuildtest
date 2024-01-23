emptat = Creature:new {
	objectName = "",
	customName = "Essence of Palpatine",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 500,
	chanceHit = 200,
	damageMin = 2400,
	damageMax = 4275,
	baseXp = 12612,
	bonusType = "pve_xp",
	bonusXP = 1500,
	baseHAM = 3096000,
	baseHAMmax = 3100000,
	armor = 3,
	resists = {95,95,95,90,95,95,90,95,95},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	aggroRadius = 50,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK,
	optionsBitmask = 128,
	diet = HERBIVORE,
	scale = 1.0,

	templates = {"object/mobile/palpatine.iff"},

	lootGroups = {


		{
	        	groups =
			{
				{group = "elite_harvester_group", chance = 10000000},
			},
			lootChance = 9500000,
		},
		{
	        	groups =
			{
				{group = "elite_harvester_group", chance = 10000000},
			},
			lootChance = 9500000,
		},
		{
	        	groups =
			{
				{group = "palpatine_boss_loot", chance = 10000000},
			},
			lootChance = 9500000,
		},
		{
	        	groups =
			{
				{group = "palpatine_boss_loot", chance = 10000000},
			},
			lootChance = 9500000,
		},


	},

	weapons = {"darth_vader_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(emptat, "emptat")
