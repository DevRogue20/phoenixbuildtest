darkspirit = Creature:new {
	objectName = "",
	customName = "darkside essence",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 430,
	chanceHit = 300,
	damageMin = 1045,
	damageMax = 1800,
	baseXp = 26845,
	bonusType = "pve_xp",
	bonusXP = 1000,
	baseHAM = 1145253,
	baseHAMmax = 1154500,
	armor = 3,
	resists = {85,65,75,55,75,35,65,35,25},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/exar_kun.iff"},
	scale = 1.2,		
	lootGroups = {
		

		{
	        	groups = 
			{
				{group = "exar_kun", chance = 10000000},
			},
			lootChance = 10000000,
		},
		{
	        	groups = 
			{
				{group = "emp_hand", chance = 10000000},
			},
			lootChance = 10000000,
		},
		{
	        	groups = 
			{
				{group = "armor_attachments", chance = 4000000},
				{group = "clothing_attachments", chance = 6000000},
			},
			lootChance = 7500000,
		},
		{
			groups = {
				{group = "power_crystals", chance = 10000000},
			},
			lootChance = 8500000
		},
		{
			groups = {
				{group = "wearables_scarce", chance = 10000000},
			},
			lootChance = 8500000
		},
				
	},
	weapons = {"darth_vader_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(darkspirit, "darkspirit")
