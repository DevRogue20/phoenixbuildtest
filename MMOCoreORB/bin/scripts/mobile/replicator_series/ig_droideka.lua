ig_droideka = Creature:new {
	objectName = "@mob/creature_names:geonosian_droideka_crazed",
	customName = "IG-88 Droideka",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 300,
	chanceHit = 140,
	damageMin = 300,
	damageMax = 1350,
	baseXp = 22650,
	baseHAM = 226000,
	baseHAMmax = 256000,
	armor = 2,
	resists = {140,155,110,125,125,91,90,90,3},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/droideka.iff"},
	scale = 1.3,
	lootGroups = {
		{
	        	groups =
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 9500000,
		},
		{
	        	groups =
			{
				{group = "geo_crafting_jewelry_modified", chance = 10000000},
			},
			lootChance = 9500000,
		},
	 	{
	        	groups =
			{

				{group = "geonosian_relic", chance = 3500000},
				{group = "geonosian_common", chance = 5000000},
				{group = "mastery_geocave_jewelry", chance = 1500000},
			},
			lootChance = 9000000,
		},
	},
	defaultAttack = "creaturerangedattack",
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
}

CreatureTemplates:addCreatureTemplate(ig_droideka, "ig_droideka")
