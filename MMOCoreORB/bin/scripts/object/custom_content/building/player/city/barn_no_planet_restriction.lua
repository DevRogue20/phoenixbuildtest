object_building_player_city_barn_no_planet_restriction = object_building_player_city_shared_barn_no_planet_restriction:new {
	lotSize = 2,
	baseMaintenanceRate = 50,
	allowedZones = {"corellia", "dantooine", "lok", "naboo", "rori", "talus", "tatooine"},
	publicStructure = 0,
	length = 4,
	width = 2,
	constructionMarker = "object/building/player/construction/construction_player_house_corellia_large_style_02.iff",
	skillMods = {
		{"private_medical_rating", 100},
		{"private_buff_mind", 100},
		{"private_med_battle_fatigue", 5},
		{"private_safe_logout", 1}
	},
	childObjects = {

		--{templateFile = "object/tangible/sign/player/house_address_naboo.iff", x = 8.8, z = 1, y = -8.4, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = 3, z = 1.8, y = 3, ox = 0, oy = 1, oz = 0, ow = 0, cellid = 1, containmentType = -1},
	},
}
ObjectTemplates:addTemplate(object_building_player_city_barn_no_planet_restriction, "object/building/player/city/barn_no_planet_restriction.iff")
