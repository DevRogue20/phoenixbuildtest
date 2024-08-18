pylon_imp_support_a = Creature:new {
	objectName = "",
	customName = "Invasion Spy",
	socialGroup = "imperial",
	pvpFaction = "imperial",
	faction = "imperial",
	level = 20,
	chanceHit = 0.33,
	damageMin = 190,
	damageMax = 400,
	baseXp = 1805,
	baseHAM = 15000,
	baseHAMmax = 20000,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	aggroRadius = 5,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = INTERESTING,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_imperial_lieutenant_m.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 100000},
				{group = "junk", chance = 6200000},
				{group = "rifles", chance = 550000},
				{group = "pistols", chance = 550000},
				{group = "melee_weapons", chance = 550000},
				{group = "carbines", chance = 550000},
				{group = "clothing_attachments", chance = 25000},
				{group = "armor_attachments", chance = 25000},
				{group = "imperial_officer_common", chance = 450000},
				{group = "wearables_common", chance = 1000000}
			}
		}
	},
	weapons = {"pylon_weapons"},
	reactionStf = "@npc_reaction/military",
	personalityStf = "@hireling/hireling_military",
	attacks = merge(brawlermaster,marksmanmaster,tkamid)
}

CreatureTemplates:addCreatureTemplate(pylon_imp_support_a, "pylon_imp_support_a")
