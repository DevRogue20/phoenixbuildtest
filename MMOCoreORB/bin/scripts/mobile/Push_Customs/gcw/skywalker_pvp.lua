skywalker_pvp = Creature:new {
	objectName = "",
	customName = "Rey Skywalker",
	socialGroup = "rebel",
	pvpFaction = "rebel",
	faction = "rebel",
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

	templates = {"object/mobile/dressed_commoner_old_human_female_02.iff"},
	scale = 1.0,
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
	primaryWeapon = "luke_skywalker_weapons",
	conversationTemplate = "",
	primaryAttacks = merge(lightsabermaster,forcepowermaster)
}


CreatureTemplates:addCreatureTemplate(skywalker_pvp, "skywalker_pvp")
