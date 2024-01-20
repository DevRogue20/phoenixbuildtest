sher_kar_boss = Creature:new {
	customName = "Sher'kar",
	socialGroup = "rancor",
	pvpFaction = "",
	faction = "",
	mobType = MOB_NPC,
	level = 500,
	chanceHit = 500,
	damageMin = 2800,
	damageMax = 4600,
	baseXp = 79336,
	bonusType = "pve_xp",
	bonusXP = 1000,
	baseHAM = 4650000,
	baseHAMmax = 4700000,
	armor = 3,
	resists = {90,90,90,20,70,90,45,45,35},
	meatType = "meat_carnivore",
	meatAmount = 0,
	hideType = "hide_leathery",
	hideAmount = 0,
	boneType = "bone_mammal",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 15,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/som/sher_kar.iff"},
	scale = 1.0,
	lootGroups = {


		{
	        	groups =
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 9500000,
		},
		{
	        	groups =
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
	        	groups =
			{
				{group = "easter_common", chance = 10000000},
			},
			lootChance = 9500000,
		},
		{
	        	groups =
			{
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 7500000,
		},
		{
	        	groups =
			{
				{group = "musty_speeder", chance = 10000000},
			},
			lootChance = 10000000,
		},
		--[[{
	        	groups =
			{
				{group = "musty_coin_boss", chance = 10000000},
			},
			lootChance = 10000000,
		},]]
		{
	        	groups =
			{
				{group = "sher_kar_loot", chance = 10000000},
			},
			lootChance = 10000000,
		},
		{
	        	groups =
			{
				{group = "frost_crystal", chance = 10000000},
			},
			lootChance = 6000000,
		},
		{
			groups = {
				{group = "sher_kar_loot", chance = 9000000},
				{group = "sher_kar_loot", chance = 1000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "sher_kar_loot", chance = 9000000},
				{group = "frost_crystal", chance = 1000000},
			},
			lootChance = 10000000
		},

	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"stunattack","stunChance=100"},
		{"creatureareaknockdown","knockdownChance=100"}
	}
}

CreatureTemplates:addCreatureTemplate(sher_kar_boss, "sher_kar_boss")
