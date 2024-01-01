ig88_npc_boss = Creature:new {
	objectName = "@mob/creature_names:ig_88",
	customName = "IG-88",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 500,
	chanceHit = 200,
	damageMin = 900,
	damageMax = 2375,
	baseXp = 12612,
	bonusType = "pve_xp",
	bonusXP = 1500,
	baseHAM = 2196000,
	baseHAMmax = 2200000,
	armor = 3,
	resists = {55,55,40,60,30,35,40,35,35},
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
	creatureBitmask = PACK,
	optionsBitmask = 128,
	diet = HERBIVORE,
	scale = 2.5,

	templates = {"object/mobile/dressed_droid_enemy_01.iff"},
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
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 9500000,
		},
		{
			groups = {
				{group = "elite_ranged_schems_01", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "elite_melee_schems_01", chance = 10000000},
			},
			lootChance = 10000000
		},
				
	},

	weapons = {"kirana_ti_weapons"},
	conversationTemplate = "",
	attacks = merge(swordsmanmaster,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(ig88_npc_boss, "ig88_npc_boss")
