object_building_player_yoda_house = object_building_player_shared_yoda_house:new {
	lotSize = 5,
	baseMaintenanceRate = 80,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine", "yavin4", "dathomir", "endor"},
	publicStructure = 0,
	constructionMarker = "object/building/player/construction/construction_player_house_corellia_small_style_02.iff",
	length = 2,
	width = 2,
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 5},
		{"private_safe_logout", 1},
	},
	childObjects = {
			{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = -1.90614, z = 1.09528, y = -4.99437, ow = -0.566406, ox = 0, oz = 0, oy = -0.824126, cellid = 1, containmentType = -1},
			{templateFile = "object/tangible/sign/streetsign_upright_style_01.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1}
	},
	shopSigns = {
			{templateFile = "object/tangible/sign/streetsign_upright_style_01.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
			{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "@player_structure:shop_sign1"},
			{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_02", suiItem = "@player_structure:shop_sign2"},
			{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_03", suiItem = "@player_structure:shop_sign3"},
			{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_04", suiItem = "@player_structure:shop_sign4"},
--Custom Signs
--Standing
		{templateFile = "object/tangible/tcg/series5/house_sign_tcg_standing.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "TCG - Diner Sign Standing"},
		{templateFile = "object/tangible/tcg/series3/house_sign_tcg_s02.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "TCG - Oval Standing"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_02.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Nightsister Banner Sign 1"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_03.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Nightsister Banner Sign 2"},
		{templateFile = "object/tangible/sign/player/wod_sm_banner_sign_01.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Nightsister Banner Sign 3"},
		{templateFile = "object/tangible/sign/player/wod_sm_standing_sign_01.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Nightsister Stone Sign Standing"},
		{templateFile = "object/tangible/sign/player/imperial_empire_day_2009_sign_standing.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Imperial Emblem Sign Standing"},
		{templateFile = "object/tangible/sign/player/rebel_remembrance_day_2009_sign_standing.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Rebel Sign Standing"},
		{templateFile = "object/tangible/sign/player/pgc_sign_standing.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Hologram Sign Standing"},
		{templateFile = "object/tangible/sign/player/efol_standing_sign_01.iff", x = -3.73448, z = 1.14202, y = 9.35295, ow = 1, ox = 0, oz = 0, oy = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "Heart Sign Standing"},
	},
}

ObjectTemplates:addTemplate(object_building_player_yoda_house, "object/building/player/yoda_house.iff")
