golga_the_hutt = Creature:new {
	objectName = "@mob/creature_names:golga_the_hutt",
	customName = "Golga The Hutt <Boonta Eve Podrace Judge>",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 400,
	chanceHit = 300,
	damageMin = 2045,
	damageMax = 2500,
	baseXp = 296845,
	bonusType = "pve_xp",
	bonusXP = 600,
	baseHAM = 1306000,
	baseHAMmax = 1652000,
	armor = 3,
	resists = {65,55,85,75,75,55,45,45,45},
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
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/jabba_the_hutt.iff"},
	scale = 1.9,	
	lootGroups = {
		{
			groups = {
				{group = "podracer_loot", chance = 10000000},
			},
			lootChance = 10000000
		},
		
	},
	weapons = {"melee_weapons"},
	conversationTemplate = "",
	attacks = {
		{"defaultattack", ""},
		{"intimidationattack","intimidationChance=90"},
		{"knockdownattack","knockdownChance=99"}
	}
}

CreatureTemplates:addCreatureTemplate(golga_the_hutt, "golga_the_hutt")
