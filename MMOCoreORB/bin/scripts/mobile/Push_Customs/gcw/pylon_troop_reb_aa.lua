pylon_troop_reb_aa = Creature:new {
	objectName = "",
	customName = "Alliane Elite Trooper",
	socialGroup = "rebel",
	pvpFaction = "rebel",
	faction = "rebel",
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

	templates = {"object/mobile/vendor/twilek_female.iff"},
	outfit = "reb_arm_vend",


	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 300000},
				{group = "junk", chance = 6000000},
				{group = "holocron_dark", chance = 150000},
				{group = "holocron_light", chance = 150000},
				{group = "weapons_all", chance = 1050000},
				{group = "armor_all", chance = 1050000},
				{group = "clothing_attachments", chance = 150000},
				{group = "armor_attachments", chance = 150000},
				{group = "wearables_all", chance = 1000000}
			}
		}
	},
	weapons = {"stormtrooper_weapons"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(pylon_troop_reb_aa, "pylon_troop_reb_aa")
