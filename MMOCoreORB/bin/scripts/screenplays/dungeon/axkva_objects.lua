require('utils.player_switch_zone')
axkva_objects = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("axkva_objects", true)

spHelper = require("screenplayHelper")

local ObjectManager = require("managers.object.object_manager")

--------------------------------------
--   Initialize screenplay           -
--------------------------------------
function axkva_objects:start()
	if (not isZoneEnabled("dathomir")) then
		return 0
	end
	
--	self:spawnSceneObjects()
	self:spawnMobiles()
end

function axkva_objects:spawnMobiles()

	local pCollector1 = spawnMobile("dathomir", "eg6_port", 60, -90.5, -100.9, -99.5,170, 4115629)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	collector1:setCustomObjectName("\\#FF0000Enter the Prison")
	createObserver(OBJECTRADIALUSED, "axkva_objects", "teleportAxkva", pCollector1)
	--[[if (pCollecter1~= nil) then 
		return
	end]]

	local pCollector2 = spawnMobile("dungeon2", "eg6_port", 60, -84.2, 17.9, 16.4, 0, 14200004)
	local collector2 = LuaCreatureObject(pCollector2)
	collector2:setOptionsBitmask(264)
	collector2:setCustomObjectName("\\#FF0000Exit the Prison")
	createObserver(OBJECTRADIALUSED, "axkva_objects", "teleportNSCAVE", pCollector2)
	--[[if (pCollecter2~= nil) then 
		return
	end]]

	--Temporary for Testing
	local pPort = spawnMobile("corellia", "eg6_port", 1, -174.0, 28.0, -4734.0, 45, 0, "")
	local port = LuaCreatureObject(pPort)
	port:setOptionsBitmask(264)
	port:setCustomObjectName("\\#FF0000Axkva Min Dungeon")
	createObserver(OBJECTRADIALUSED, "axkva_objects", "teleporttest", pPort)
	if (pCollector1 or pCollector2 or pPort~= nil) then 
		return
	end

end

function axkva_objects:teleportAxkva(pCollector, pPlayer)
		playerSwitchZoneOutOfCombatRange(pPlayer, pCollector, 10 , "dungeon2", 33.6, 0.1, 0.3, 14200003)
	return 0
end

function axkva_objects:teleportNSCAVE(pCollector2, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, pCollector2, 10 ,"dathomir", -3959.0, 124.0, -55.0, 0)
	return 0
end

--Temporary for Testing
function axkva_objects:teleporttest(pCollector3, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, pCollector3, 10 ,"dathomir", -3959.0, 124.0, -55.0, 0)
	return 0
end

