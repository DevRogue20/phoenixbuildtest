shae_vizla = Creature:new {
	objectName = "",
	customName = "Shae Vizla",	
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 151,
	chanceHit = 300,
	damageMin = 1645,
	damageMax = 3000,
	baseXp = 28549,
	bonusType = "pve_xp",
	bonusXP = 200,
	baseHAM = 192000,
	baseHAMmax = 195000,
	armor = 3,
	resists = {10,35,35,100,100,100,100,10,45},
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
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_fs_village_enemy_kylaena.iff"},
	lootGroups = {
		{
			groups = {
				{group = "youngling_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(tkamaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(shae_vizla, "shae_vizla")
