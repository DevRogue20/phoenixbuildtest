require('utils.player_switch_zone')
twin_sabers_objects = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("twin_sabers_objects", true)

spHelper = require("screenplayHelper")

local ObjectManager = require("managers.object.object_manager")

--------------------------------------
--   Initialize screenplay           -
--------------------------------------
function twin_sabers_objects:start()
	if (not isZoneEnabled("tatooine")) then
		return 0
	end
	
--	self:spawnSceneObjects()
	self:spawnMobiles()
end

function twin_sabers_objects:spawnMobiles()

	local pCollector1 = spawnMobile("tatooine", "eg6_port", 1, -2598.5, -7.5, -5527.6, -46, 0)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	collector1:setCustomObjectName("\\#FF0000Twin Sabers Dungeon")
	createObserver(OBJECTRADIALUSED, "twin_sabers_objects", "teleportpalp", pCollector1)

	local pCollector2 = spawnMobile("tatooine", "eg6_port", 1, 1.1, 0.0, 1.3, 90, 609460014)
	local collector2 = LuaCreatureObject(pCollector2)
	collector2:setOptionsBitmask(264)
	collector2:setCustomObjectName("\\#FF0000Exit the Dungeon")
	createObserver(OBJECTRADIALUSED, "twin_sabers_objects", "teleportDFE", pCollector2)

	--Temporary for Testing
	local pCollector3 = spawnMobile("corellia", "eg6_port", 1, -177.0, 28.0, -4734.0, 45, 0)
	local collector3 = LuaCreatureObject(pCollector3)
	collector3:setOptionsBitmask(264)
	collector3:setCustomObjectName("\\#FF0000Twin Sabers Dungeon")
	createObserver(OBJECTRADIALUSED, "twin_sabers_objects", "teleportpalp", pCollector3)

	if (pCollector1 or pCollector2 or pCollector3~= nil) then
		return 1
	end

end

function twin_sabers_objects:teleportpalp(pCollector, pPlayer)
		playerSwitchZoneOutOfCombatRange(pPlayer, pCollector, 10 , "tatooine", 2.1, 0.0, 0.0, 609460014)
	return 0
end

function twin_sabers_objects:teleportDFE(pCollector2, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, pCollector2, 10 , "tatooine", -2582.3, 0.0, -5511.9, 0)
	return 0
end

