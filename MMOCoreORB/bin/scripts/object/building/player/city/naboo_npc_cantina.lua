
object_building_player_city_naboo_npc_cantina = object_building_player_city_shared_naboo_npc_cantina:new {
	lotSize = 5,
	baseMaintenanceRate = 50,
	allowedZones = {"dantooine", "naboo", "rori"},
	length = 7,
	width = 7,
	planetMapCategory = "cantina",
	--cityRankRequired = 2,
	--limitToOnePerCity = 1,
	skillMods = {
		{"private_buff_mind", 100},
		{"private_medical_rating", 100},
		{"private_med_battle_fatigue", 5},
		{"private_safe_logout", 1}
	},
	zoneComponent = "StructureZoneComponent",
	childObjects = {
		--{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_cantina.iff", x = 47.5, z = 2.0, y = -4.947, ox = 0, oy = 0, oz = 0, ow = 0, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = -30.6054, z = -0.52, y = 14.8464, ox = 0, oy = 1, oz = 0, ow = 0, cellid = 13, containmentType = -1}
	},
	--[[shopSigns = {
		{templateFile = "object/tangible/sign/municipal/municipal_sign_hanging_cantina.iff", x = 5, z = 3, y = 11.95, ox = 0, oy = 1, oz = 0, ow = 0, cellid = -1, containmentType = -1, requiredSkill = "", suiItem = "@player_structure:house_address"},
		{templateFile = "object/tangible/sign/player/shop_sign_s01.iff", x = 10, z = 0.5, y = 15, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_01", suiItem = "@player_structure:shop_sign1"},
		{templateFile = "object/tangible/sign/player/shop_sign_s02.iff", x = 10, z = 0.5, y = 15, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_02", suiItem = "@player_structure:shop_sign2"},
		{templateFile = "object/tangible/sign/player/shop_sign_s03.iff", x = 10, z = 0.5, y = 15, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_03", suiItem = "@player_structure:shop_sign3"},
		{templateFile = "object/tangible/sign/player/shop_sign_s04.iff", x = 10, z = 0.5, y = 15, ox = 0, oy = 0, oz = 0, ow =  1, cellid = -1, containmentType = -1, requiredSkill = "crafting_merchant_management_04", suiItem = "@player_structure:shop_sign4"},
	},]]
}

ObjectTemplates:addTemplate(object_building_player_city_naboo_npc_cantina, "object/building/player/city/naboo_npc_cantina.iff")
