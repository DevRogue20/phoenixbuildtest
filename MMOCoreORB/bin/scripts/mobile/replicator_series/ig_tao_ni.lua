ig_tao_ni = Creature:new {
	objectName = "",
	customName = "Tao-Ni Security Elite Protector",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 240,
	chanceHit = 200,
	damageMin = 470,
	damageMax = 950,
	baseXp = 10081,
	baseHAM = 529000,
	baseHAMmax = 536000,
	armor = 2,
	resists = {55,55,40,45,55,70,55,35,50},
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/som/asn_121.iff"},
        --outfit = "ig_taoni_outfit",
	lootGroups = {

		--[[{
	        	groups =
			{
				{group = "bloodfin_token", chance = 10000000},
			},
			lootChance = 7500000,
		},]]
		{
			groups =
			{
				{group = "infiltrator_armor_loot",  chance = 4000000},
				{group = "spec_force_armor_loot",  chance = 6000000}
			},
			lootChance = 5000000,
		},
	},
	weapons = {"pylon_weapons_c"},
	conversationTemplate = "",
	attacks = merge(riflemanmaster,swordsmanmaster,brawlermaster,marksmanmaster)
}

CreatureTemplates:addCreatureTemplate(ig_tao_ni, "ig_tao_ni")
