require('utils.player_switch_zone')
sher_kar_objects = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("sher_kar_objects", true)

spHelper = require("screenplayHelper")

local ObjectManager = require("managers.object.object_manager")

--------------------------------------
--   Initialize screenplay           -
--------------------------------------
function sher_kar_objects:start()
	if (not isZoneEnabled("dungeon2")) then
		return 0
	end
	
--	self:spawnSceneObjects()
	self:spawnMobiles()
end

function sher_kar_objects:spawnMobiles()

	local pCollector1 = spawnMobile("corellia", "eg6_port", 1, -166.0, 28.0, -4734.0, 90, 0)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	collector1:setCustomObjectName("\\#FF0000Sher'Kar Dungeon")
	createObserver(OBJECTRADIALUSED, "sher_kar_objects", "teleportsherkar", pCollector1)
	--if (pCollector1~= nil) then
	--	return
	--end

	local pCollector2 = spawnMobile("dungeon2", "eg6_port", 1, -84.2, -3.9, -202.2, -5, 14201897)
	local collector2 = LuaCreatureObject(pCollector2)
	collector2:setOptionsBitmask(264)
	collector2:setCustomObjectName("\\#FF0000Exit the Dungeon")
	createObserver(OBJECTRADIALUSED, "sher_kar_objects", "teleportDFE", pCollector2)
	if (pCollector1 or pCollector2~= nil) then
		return 1
	end

end

function sher_kar_objects:teleportsherkar(pCollector, pPlayer)
		playerSwitchZoneOutOfCombatRange(pPlayer, pCollector, 10 , "dungeon2", 2, 1, 2, 14201897)
	return 0
end

function sher_kar_objects:teleportDFE(pCollector2, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, pCollector2, 10 , "corellia", -151, 28, -4723.0, 0)
	return 0
end

