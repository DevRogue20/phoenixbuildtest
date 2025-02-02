novatrooper_commander_cor = Creature:new {
	objectName = "@mob/creature_names:stormtrooper",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 226,
	chanceHit = 130,
	damageMin = 645,
	damageMax = 770,
	baseXp = 17274,
	bonusType = "gcw_skill_xp",
	bonusXP = 250,
	baseHAM = 226000,
	baseHAMmax = 254000,
	armor = 0,
	resists = {65,65,80,30,0,0,30,45,-1},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_stormtrooper_commander_black_gold.iff"},
	scale = 1.2,	
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "clothing_attachments", chance = 7200000},
				{group = "rifles", chance = 550000},
				{group = "pistols", chance = 550000},
                {group = "melee_weapons", chance = 550000},
                {group = "carbines", chance = 550000},
				{group = "clothing_attachments", chance = 25000},
				{group = "armor_attachments", chance = 25000},
				{group = "imperial_officer_common", chance = 450000}
			},
			lootChance = 9800000
		}						
	},
	weapons = {"stormtrooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(novatrooper_commander_cor, "novatrooper_commander_cor")
