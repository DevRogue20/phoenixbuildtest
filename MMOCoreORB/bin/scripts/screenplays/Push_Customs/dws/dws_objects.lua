require('utils.player_switch_zone')

dws_objects = ScreenPlay:new {
        numberOfActs = 1,

        screenplayName = "dws_objects",
}

registerScreenPlay("dws_objects", true)
local ObjectManager = require("managers.object.object_manager")

function dws_objects:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()
	end
end

function dws_objects:spawnMobiles()

	local pCollector1 = spawnMobile("tatooine", "port", 120, 3480.1, 5.0, -4841.8, 157, 0)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	collector1:setCustomObjectName("\\#FF0000Travel to DWS")
	createObserver(OBJECTRADIALUSED, "dws_objects", "teleportDWS", pCollector1)

end

function dws_objects:teleportDWS(pCollector, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, pCollector, 10 , "rori", 4835.1, 76.3, -1090.9, 57)
	return 0
end