nightsister_doum = Creature:new {
	objectName = "@mob/creature_names:nightsister_ranger",
	customName = "Doum Cin",
	socialGroup = "nightsister",
	faction = "nightsister",
	level = 200,
	chanceHit = 200,
	damageMin = 555,
	damageMax = 820,
	baseXp = 7761,
	baseHAM = 312000,
	baseHAMmax = 315000,
	armor = 1,
	resists = {90,90,90,90,90,10,90,90,90},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	aggroRadius = 80,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_nightsister_ranger.iff"},
	lootGroups = {
		{
			groups = {
				{group = "ns_orb_loot", chance = 10000000},
			},
			lootChance = 5000000,
		},
		--[[{
			groups =

			{
				{group = "infiltrator_armor_loot",  chance = 4000000},
				{group = "spec_force_armor_loot",  chance = 6000000}
			},
			lootChance = 8500000,
		},]]
		{
	        	groups =
			{
				{group = "nightsister_common", chance = 3000000},
				{group = "crystals_premium", chance = 4000000},
				{group = "nightsister_rare", chance = 3000000},
			},
			lootChance = 10000000,
		}
	},
	weapons = {"mixed_force_weapons"},
	conversationTemplate = "",
	attacks = merge(fencermid,swordsmanmid,tkamid,pikemanmid,brawlermaster,forcewielder)
}

CreatureTemplates:addCreatureTemplate(nightsister_doum, "nightsister_doum")
