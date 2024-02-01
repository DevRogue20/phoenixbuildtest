hutt_guard = Creature:new {
	objectName = "",
	customName = "Golga the Hutt's Personal Guard",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 302,
	chanceHit = 30,
	damageMin = 1090,
	damageMax = 1400,
	baseXp = 28549,
	baseHAM = 485000,
	baseHAMmax = 571000,
	armor = 3,
	resists = {100,35,35,100,100,100,100,100,15},
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

	templates = {"object/mobile/gamorrean.iff"},
	scale = 1.1,
	lootGroups = {
		{
			groups = {
				{group = "dev", chance = 10000000},
			},
			lootChance = 10000000
		},
		
	},
	weapons = {"ubar_weapons"},
	conversationTemplate = "",
	attacks = merge(pikemanmaster,brawlermaster,fencermaster)
}

CreatureTemplates:addCreatureTemplate(hutt_guard, "hutt_guard")
