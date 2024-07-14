
object_building_player_city_outpost_starport_npc = object_building_player_city_shared_outpost_starport_npc:new {
	lotSize = 0,
	allowedZones = {"dantooine", "lok", "tatooine"},
	length = 9,
	width = 9,
	--cityRankRequired = 6,
	gameObjectType = 521,
	planetMapCategory = "starport",
	uniqueStructure = true,
	cityMaintenanceBase = 25000,
	abilityRequired = "place_shuttleport",
	zoneComponent = "ShuttleInstallationZoneComponent",
	childObjects = {
		{templateFile = "object/tangible/terminal/terminal_travel.iff", x = -3.12, z = 0.14659503, y = -17.57, ox = 0, oy = 0.707107, oz = 0, ow = -0.707107, cellid = 1, containmentType = -1},
		{templateFile = "object/tangible/travel/ticket_collector/ticket_collector.iff", x = 1, z = 0, y = -10, ox = 0, oy = 0, oz = 0, ow = 1, cellid = -1, containmentType = -1},
		{templateFile = "object/mobile/player_transport.iff", x = 0, z = 7, y = 0, ox = 0, oy = 0.707107, oz = 0, ow = 0.707107, cellid = -1, containmentType = -1},
		{templateFile = "object/tangible/terminal/terminal_player_structure.iff", x = -7.38, z = 0.15, y = -15.46, ox = 0, oy = 1, oz = 0, ow = 0, cellid = 1, containmentType = -1}
	}
}

ObjectTemplates:addTemplate(object_building_player_city_outpost_starport_npc, "object/building/player/city/outpost_starport_npc.iff")
