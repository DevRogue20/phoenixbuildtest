require('utils.player_switch_zone')
jedipush_objects = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("jedipush_objects", true)

spHelper = require("screenplayHelper")

local ObjectManager = require("managers.object.object_manager")

--------------------------------------
--   Initialize screenplay           -
--------------------------------------
function jedipush_objects:start()
	if (not isZoneEnabled("dungeon2")) then
		return 0
	end
	
--	self:spawnSceneObjects()
	self:spawnMobiles()
end

function jedipush_objects:spawnMobiles()

	local pCollector1 = spawnMobile("dungeon2", "aurora_sunrider", 1, 41.4, -4.2, -159.3, -90, 14201899)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportaurora", pCollector1)

	local pCollector2 = spawnMobile("corellia", "malakai_vorn", 1, 13.6, -4.2, -159.3, 90, 14201899)
	local collector2 = LuaCreatureObject(pCollector2)
	collector2:setOptionsBitmask(264)
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportmalakai", pCollector2)

	local ptransport1 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 24.9, -4.2, -152.8, 180, 14201901)
	local transport1 = LuaCreatureObject(ptransport1)
	transport1:setOptionsBitmask(264)
    transport1:setCustomObjectName("Imperial Outpost")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportimpoutpost", ptransport1)

    local ptransport2 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 29.4, -4.2, -152.8, 180, 14201901)
	local transport2 = LuaCreatureObject(ptransport2)
	transport2:setOptionsBitmask(264)
    transport2:setCustomObjectName("Abandoned Rebel Base")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportrebbase", ptransport2)

    local ptransport3 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 20.8, -4.2, -169.9, 0, 14201901)
	local transport3 = LuaCreatureObject(ptransport3)
	transport3:setOptionsBitmask(264)
    transport3:setCustomObjectName("Imperial Base")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportimpbase", ptransport3)

    local ptransport4 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 33.6, -4.2, -169.9, 0, 14201901)
	local transport4 = LuaCreatureObject(ptransport4)
	transport4:setOptionsBitmask(264)
    transport4:setCustomObjectName("Anchorhead")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportanchorhead", ptransport4)

	local ptransport5 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 27.5, -4.2, -153.2, 180, 14201901)
	self:setMoodString(ptransport5, "npc_sitting_chair")
	local transport5 = LuaCreatureObject(ptransport5)
	transport5:setOptionsBitmask(264)
    transport5:setCustomObjectName("Aurillia")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportaurillia", ptransport5)

    if (pCollector1 or pCollector2 or ptransport1 or ptransport2 or ptransport3 or ptransport4 or ptransport5 ~= nil) then
		return 1
	end
end

function jedipush_objects:teleportaurora(pCollector1, pPlayer)
		playerSwitchZoneOutOfCombatRange(pPlayer, pCollector1, 10 , "corellia", -27.6, -0.9, -0.8, 2625362)
	return 0
end

function jedipush_objects:teleportmalakai(pCollector2, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, pCollector2, 10 , "corellia", -31.5, -0.5, 6.7, 3075439)
	return 0
end

function jedipush_objects:teleportanchorhead(ptransport1, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport1, 10 , "tatooine", 7.8, -3.4, 5.8, 1213350)
	return 0
end

function jedipush_objects:teleportrebbase(ptransport2, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport2, 10 , "dantooine", 3.7, 0.1, -4.0, 8855669)
	return 0
end

function jedipush_objects:teleportimpbase(ptransport3, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport3, 10 , "rori", 4.0, 0.1, -2.5, 3475368)
	return 0
end

function jedipush_objects:teleportimpoutpost(ptransport4, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport4, 10 , "lok", 3.8, 0.1, -2.4, 8615436)
	return 0
end

function jedipush_objects:teleportaurillia(ptransport5, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport5, 10 , "dathomir", 0.3, 1.2, -0.5, 14976)
	return 0
end