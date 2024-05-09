spHelper = require("screenplayHelper")
local ObjectManager = require("managers.object.object_manager")  print("Object manager loaded for RESPEC")

respec = ScreenPlay:new {
	numberOfActs = 1,
  	questString = "respec",
  	states = {onleave = 1, overt = 2},
  	questdata = Object:new {
    	activePlayerName = "initial",
    	}
}
  
registerScreenPlay("respec", true)
  
function respec:start()
    	self:spawnActiveAreas()
end
  
function respec:spawnActiveAreas()
	local pSpawnArea = spawnSceneObject("umbra", "object/active_area.iff", 151.6, 25.0, 154.2, 0, 0, 0, 0, 0)
    
	if (pSpawnArea ~= nil) then
		local activeArea = LuaActiveArea(pSpawnArea)
	        activeArea:setCellObjectID(0)
	        activeArea:setRadius(128)
	        createObserver(ENTEREDAREA, "respec", "notifySpawnArea", pSpawnArea)
	        createObserver(EXITEDAREA, "respec", "notifySpawnAreaLeave", pSpawnArea)
	    end
end
 
--checks if player enters the zone, and what to do with them.
function respec:notifySpawnArea(pActiveArea, pMovingObject)
	
	if (not SceneObject(pMovingObject):isCreatureObject()) then
		return 0
	end
	
	return ObjectManager.withCreatureObject(pMovingObject, function(pPlayer)
		if (pPlayer:isAiAgent()) then
			return 0
		end
		
		if (pPlayer:isImperial() or pPlayer:isRebel() or pPlayer:isNeutral()) then
			createEvent(7200000, "respec", "removeFromLair", pMovingObject, "")
			createEvent(7200000, "respec", "removeFromLair", pPlayer, "")
			pPlayer:sendSystemMessage("You have entered the Respec Area, you have two hours to perform your task before you are removed from the area!-CAUTION- DO NOT LOG OUT UNTIL YOU ARE FINISHED-DO NOT GROUP WITH ANYONE-DO NOT ATTEMPT TO LEAVE THIS ENCLOSED AREA--this is a no pvp zone -if you die, you damage your respec attempt")
		else
			pPlayer:sendSystemMessage("You try to hack..u go home now!")
			createEvent(1, "respec", "removeFromLair", pPlayer, "")
		end
		return 0
	end)
end
function respec:removeFromLair(pPlayer)
	if (pPlayer == nil) then
		return 0
	end

	local playerID = SceneObject(pPlayer):getObjectID()

	if (CreatureObject(pPlayer):isGrouped()) then
		local groupSize = CreatureObject(pPlayer):getGroupSize()

		for i = 0, groupSize - 1, 1 do
			local pMember = CreatureObject(pPlayer):getGroupMember(i)
			if pMember ~= nil then
				if CreatureObject(pMember):getParentID() > 1 then
					createEvent(1, "respec", "teleportPlayer", pMember, "")
				end
			end
		end
	else
		createEvent(1, "respec", "teleportPlayer", pPlayer, "")
	end
	return 0
end

function respec:teleportPlayer(pPlayer)
	if (pPlayer == nil) then
		return 0
	end

	local creatureID = SceneObject(pPlayer):getObjectID()
	local parentID = SceneObject(pPlayer):getParentID()
	if (readData(creatureID .. ":teleportedFromLair") == 1) then
		return 0
	end

	writeData(creatureID .. ":teleportedFromLair", 1)
	CreatureObject(pPlayer):teleport(27.3, -4.2, -155.0, 281475145401486)
	return 0
end

--Simply sends a system message
function respec:notifySpawnAreaLeave(pActiveArea, pMovingObject)
	
	if (not SceneObject(pMovingObject):isCreatureObject()) then
		return 0
	end
	
	return ObjectManager.withCreatureObject(pMovingObject, function(pPlayer)
		if (pPlayer:isAiAgent()) then
			return 0
		end
		
		if (pPlayer:isImperial() or pPlayer:isRebel() or pPlayer:isNeutral()) then
			pPlayer:sendSystemMessage("You have TIMED OUT OF THE RESPEC AREA. If you are finished,you can use the teleport to leave,or if you are not done,submit a ticket,and a GM/DEV/CSR will be along to assist you.")
			pPlayer:teleport(27.3, -4.2, -155.0, 281475145401486)
		end
		return 0
	end)
end
