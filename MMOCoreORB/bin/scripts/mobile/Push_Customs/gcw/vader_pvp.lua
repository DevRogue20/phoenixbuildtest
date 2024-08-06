vader_pvp = Creature:new {
	objectName = "",
	customName = "Darth Vader",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 400,
	chanceHit = 300,
	damageMin = 500,
	damageMax = 1300,
	baseXp = 28549,
	bonusType = "gcw_skill_xp",
	bonusXP = 5000,
	baseHAM = 1406000,
	baseHAMmax = 1552000,
	armor = 3,
	resists = {40,40,40,40,40,40,40,40,40},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	aggroRadius = 25,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/darth_vader.iff"},
	scale = 1.4,
		lootGroups = {
		{
			groups = {
				{group = "avatar_boss", chance = 10000000},
			},
			lootChance = 9500000,
		},
		{
	        	groups = 
			{
				{group = "avatar_loot", chance = 10000000},

			},
			lootChance = 9500000,
		}
	},

	primaryWeapon = "darth_vader_weapons",
	conversationTemplate = "",
	primaryAttacks = merge(lightsabermaster,forcewielder)
}

CreatureTemplates:addCreatureTemplate(vader_pvp, "vader_pvp")
