sher_kar_karling = Creature:new {
	objectName = "@mob/creature_names:Sherkar",
	customName = "A Karling",
	socialGroup = "rancor",
	pvpFaction = "",
	faction = "",
	level = 295,
	chanceHit = 200,
	damageMin = 2200,
	damageMax = 3500,
	baseXp = 79336,
	baseHAM = 185000,
	baseHAMmax = 200000,
	armor = 3,
	resists = {35,20,35,70,70,90,15,45,25},
	meatType = "meat_carnivore",
	meatAmount = 180,
	hideType = "hide_leathery",
	hideAmount = 200,
	boneType = "bone_mammal",
	boneAmount = 50,
	milk = 0,
	tamingChance = 0,
	ferocity = 15,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/som/sher_kar.iff"},
	scale = 0.3,
	lootGroups = {

		{
			groups = {
				{group = "musty_coin_loot", chance = 10000000},
			},
			lootChance = 2500000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareattack",""},
		{"creatureareableeding",""}
	}
}

CreatureTemplates:addCreatureTemplate(sher_kar_karling, "sher_kar_karling")
