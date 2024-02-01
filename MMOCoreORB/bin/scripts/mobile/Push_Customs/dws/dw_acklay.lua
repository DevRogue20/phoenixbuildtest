dw_acklay = Creature:new {
	objectName = "",
	customName = "a baby Acklay",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 144,
	chanceHit = 92.5,
	damageMin = 1635,
	damageMax = 1980,
	baseXp = 0,
	baseHAM = 296000,
	baseHAMmax = 298000,
	armor = 2,
	resists = {20,45,55,55,55,55,40,40,40},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 25,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/acklay_hue.iff"},
	scale = .25,	
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 6000000},
				{group = "death_watch_bunker_lieutenants", chance = 4000000}
			},
			lootChance = 1000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo",""},
		{"posturedownattack","postureDownChance=50"}
	}
}

CreatureTemplates:addCreatureTemplate(dw_acklay, "dw_acklay")
