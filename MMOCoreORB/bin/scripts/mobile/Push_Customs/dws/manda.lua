manda = Creature:new {
  objectName = "",
  customName = "Mand'alor (the First)",
  socialGroup = "death_watch",
  pvpFaction = "death_watch",
  faction = "",
  level = 150,
  chanceHit = 190,
  damageMin = 945,
  damageMax = 1800,
  baseXp = 30948,
  bonusType = "pve_xp",
  bonusXP = 600,
  baseHAM = 100000,
  baseHAMmax = 105000,
  armor = 2,
  resists = {95,95,95,25,95,25,95,95,65},
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
  optionsBitmask = 128,
  diet = HERBIVORE,

  templates = {"object/mobile/dressed_death_watch_red.iff"},
	scale = 1.2,	
	lootGroups = {
		{
			groups = {
				{group = "test_loot_group", chance = 1000000},
				{group = "test_loot_group", chance = 2000000},
				{group = "dev", chance = 7000000},

			},
			lootChance = 9900000
		}
	},
  weapons = {"boba_fett_weapons"},
  conversationTemplate = "",
  attacks = merge(riflemanmaster,pistoleermaster,carbineermaster,brawlermaster)
}

CreatureTemplates:addCreatureTemplate(manda, "manda")
