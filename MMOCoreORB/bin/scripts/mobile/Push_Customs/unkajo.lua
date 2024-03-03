unkajo = Creature:new {
	objectName = "@mob/creature_names:unkajo",
	customName = "Unkajo the Skullcrusher",
	socialGroup = "rancor",
	pvpFaction = "",
	faction = "",
	level = 300,
	chanceHit = 300,
	damageMin = 945,
	damageMax = 1450,
	baseXp = 296845,
	bonusType = "pve_xp",
	bonusXP = 800,
	baseHAM = 1250000, --2500000
	baseHAMmax = 1255000,--2550000
	armor = 3,
	resists = {50,75,85,50,100,75,75,40,25},
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

	templates = {"object/mobile/wampa.iff"},
	scale = 1.0,	
	lootGroups = {
		
		--[[{
	        	groups = 
			{
				{group = "hoth_rare", chance = 10000000},
			},
			lootChance = 7500000,
		},]]
		{
	        	groups = 
			{
				{group = "wampa_epic", chance = 10000000},
			},
			lootChance = 10000000,
		},
		
		--[[{
	        	groups = 
			{
				{group = "crovaxloot_group", chance = 10000000},
			},
			lootChance = 7500000,
		},]]
		--[[ {
	        	groups = 
			{
				{group = "easter_common", chance = 10000000},
			},
			lootChance = 7500000,
		}, ]]
		--[[{
			groups = {
				{group = "wearables_scarce", chance = 10000000},
			},
			lootChance = 8500000
		},]]
		{
			groups = {
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 5000000,
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 5000000,
		}
				
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareapoison"},
		{"creatureareaknockdown","knockdownChance=90"}
	}
}

CreatureTemplates:addCreatureTemplate(unkajo, "unkajo")
