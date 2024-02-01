bounty_tracker = Creature:new {
	objectName = "",
	customName = "Bounty Tracker Droid",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "",
	level = 150,
	chanceHit = 100,
	damageMin = 50,
	damageMax = 150,
	baseXp = 0,
	baseHAM = 40000,
	baseHAMmax = 50000,
	armor = 2,
	resists = {20,20,20,20,20,20,20,20,20},
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/darth_maul_probe_droid.iff"},
	lootGroups = {
		{
			groups = {
				{group = "crafter_drop", chance = 10000000}
			},
			lootChance = 99500000
		}
	},
	weapons = {"object/weapon/ranged/droid/droid_droideka_ranged.iff"},
	conversationTemplate = "",
	attacks = {
                {"creaturerangedattack",""},
                {"creatureareaknockdown","knockdownChance=80"}
	}
}

CreatureTemplates:addCreatureTemplate(bounty_tracker, "bounty_tracker")
