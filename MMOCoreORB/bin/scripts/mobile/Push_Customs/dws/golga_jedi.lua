golga_jedi = Creature:new {
	objectName = "",
	customName = "Golga's Hired Fallen Jedi",
	socialGroup = "death_watch",
	pvpFaction = "death_watch",
	faction = "death_watch",
	level = 300,
	chanceHit = 150,
	damageMin = 845,
	damageMax = 1700,
	baseXp = 26845,
	baseHAM = 140600,
	baseHAMmax = 175200,
	armor = 3,
	resists = {95,95,95,95,95,95,95,95,30},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK + HERD + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_jedi_trainer_old_human_male_01.iff",
		"object/mobile/dressed_jedi_trainer_chiss_male_01.iff",
		"object/mobile/dressed_jedi_trainer_nikto_male_01.iff",
		"object/mobile/dressed_jedi_trainer_twilek_female_01.iff",
		"object/mobile/dressed_tiberus_anderlock.iff",
		"object/mobile/dressed_neja_bertolo.iff"},
	lootGroups = {
		{
			groups = {
				{group = "dev", chance = 10000000}
			},
			lootChance = 10000000
		}
	},
	weapons = {"light_jedi_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(golga_jedi, "golga_jedi")
