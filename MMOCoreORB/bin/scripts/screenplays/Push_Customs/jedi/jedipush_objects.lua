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

	if (pCollector1 or pCollector2 ~= nil) then
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

