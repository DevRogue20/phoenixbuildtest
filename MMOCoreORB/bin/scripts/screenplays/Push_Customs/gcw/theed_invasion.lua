-- BY: Smoked/Mindsoft/Heat											-- last edited: 4.12.2020	-- (this code belongs soley to BloodfinEMU)
spHelper = require("screenplayHelper")
local ObjectManager = require("managers.object.object_manager")
-----------------------------------------------(SCREENPLAY)

theed_invasion = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "theed_invasion",
	
}

registerScreenPlay("theed_invasion", true)

function theed_invasion:start()
	if (isZoneEnabled("naboo")) then
 		self:spawnActiveAreas()	
		self:spawnMobiles()
	end
end

function theed_invasion:spawnActiveAreas()
  local pSpawnArea = spawnSceneObject("naboo", "object/active_area.iff", -4864, 6, 4155, 0, 0, 0, 0, 0)
    
  if (pSpawnArea ~= nil) then
    local activeArea = LuaActiveArea(pSpawnArea)
          activeArea:setCellObjectID(0)
          activeArea:setRadius(90)
          createObserver(ENTEREDAREA, "theed_invasion", "notifySpawnAreaEnter", pSpawnArea)
          createObserver(EXITEDAREA, "theed_invasion", "notifySpawnAreaLeave", pSpawnArea)
      end
end
 
function theed_invasion:notifySpawnAreaEnter(pActiveArea, pMovingObject)
  if (not SceneObject(pMovingObject):isCreatureObject()) then
    return 0
  end

	return ObjectManager.withCreatureObject(pMovingObject, function(player)
		if (player:isAiAgent()) then
			return 0
		end 

		if (player:isImperial() or player:isRebel()) then
			player:sendSystemMessage("You have entered the Theed Alliance Invasion event!")
		else
			player:sendSystemMessage("You have entered the Theed Alliance Invasion event! You must be of Imperial faction to gain faction points for this event!")

		end
		return 0
	end)
end

function theed_invasion:notifySpawnAreaLeave(pActiveArea, pMovingObject)
  if (not SceneObject(pMovingObject):isCreatureObject()) then
    return 0
  end
  
  return ObjectManager.withCreatureObject(pMovingObject, function(player)
    if (player:isAiAgent()) then
      return 0
    end

    writeData(player:getObjectID() .. ":naboo_withinActiveArea", 0);
    
    if (player:isInCombat()) then
      player:sendSystemMessage("You have deserted in the heat of battle.")

    else
      player:sendSystemMessage("You are now leaving the area!")
    end           
    return 0
  end)
end

function theed_invasion:handlePvpZone(pPlayer)
	ObjectManager.withCreatureAndPlayerObject(pPlayer, function(player, playerObject)
		deleteData(player:getObjectID() .. ":changingFactionStatus")
		if (CreatureObject(pPlayer):isCovert() or CreatureObject(pPlayer):isOnLeave()) then
 		   player:sendSystemMessage("prepare for battle!")
    end
    

  end)
end

function theed_invasion:spawnMobiles() 

	local pTrigger = spawnMobile("naboo", "pylon_reb_support_a", 4000, -4878, 6, 4143, 173,0)


	if (pTrigger ~= nil ) then	
        createObserver(OBJECTDESTRUCTION, "theed_invasion", "notifyTriggerDead", pTrigger)

	end
	writeData("theed_invasion:spawnState",0)	
	return 0
end





function theed_invasion:despawnAdd(pAdd, pAddTwo, pAddThree, pAddFour, pAddFive, pAddSix, pAddSeven, pAddEight, pAddNine, pAddTen, pAddEleven, pAddTwelve, pAddThirteen, pAddFourteen, pAddFifteen, pAddSixteen, pAddSeventeen, pAddEighteen, pAddNineteen, pAddTwenty, pAddTwentyone, pAddTwentytwo, pAddTwentythree, pAddTwentyfour, pAddTwentyfive, player)

	forcePeace(pAdd)
	forcePeace(pAddTwo)
	forcePeace(pAddThree)
	forcePeace(pAddFour)
	forcePeace(pAddFive)
	forcePeace(pAddSix)
	forcePeace(pAddSeven)
	forcePeace(pAddEight)
	forcePeace(pAddNine)
	forcePeace(pAddTen)
	forcePeace(pAddEleven)
	forcePeace(pAddTwelve)
	forcePeace(pAddThirteen)
	forcePeace(pAddFourteen)
	forcePeace(pAddFifteen)
	forcePeace(pAddSixteen)
	forcePeace(pAddSeventeen)
	forcePeace(pAddEighteen)
	forcePeace(pAddNineteen)
	forcePeace(pAddTwenty)
	forcePeace(pAddTwentyone)
	forcePeace(pAddTwentytwo)
	forcePeace(pAddTwentythree)
	forcePeace(pAddTwentyfour)
	forcePeace(pAddTwentyfive)	
    spHelper.destroy(readData("countadd"),true)
	spHelper.destroy(readData("countadd2"),true)
	spHelper.destroy(readData("countadd3"),true)
	spHelper.destroy(readData("countadd4"),true)
	spHelper.destroy(readData("countadd5"),true)
	spHelper.destroy(readData("countadd6"),true)
	spHelper.destroy(readData("countadd7"),true)
	spHelper.destroy(readData("countadd8"),true)
	spHelper.destroy(readData("countadd9"),true)
	spHelper.destroy(readData("countadd10"),true)
	spHelper.destroy(readData("countadd11"),true)
	spHelper.destroy(readData("countadd12"),true)
	spHelper.destroy(readData("countadd13"),true)
	spHelper.destroy(readData("countadd14"),true)
	spHelper.destroy(readData("countadd15"),true)
	spHelper.destroy(readData("countadd16"),true)
	spHelper.destroy(readData("countadd17"),true)
	spHelper.destroy(readData("countadd18"),true)
	spHelper.destroy(readData("countadd19"),true)
	spHelper.destroy(readData("countadd20"),true)
	spHelper.destroy(readData("countadd21"),true)
	spHelper.destroy(readData("countadd22"),true)
	spHelper.destroy(readData("countadd23"),true)
	spHelper.destroy(readData("countadd24"),true)
	spHelper.destroy(readData("countadd25"),true)
	return 0
end


function theed_invasion:retreatPatrolDestReached(pMobile)
	--[[if AiAgent(pMobile):isInCombat() then

		if (pMobile ~= nil and CreatureObject(pMobile):isAiAgent()) then
			AiAgent(pMobile):setAiTemplate("")
		end
	end]]

	local curLoc = readData(SceneObject(pMobile):getObjectID() .. ":currentLoc")

	if (curLoc == 1) then
		writeData(SceneObject(pMobile):getObjectID() .. ":currentLoc", 2)
	else
		writeData(SceneObject(pMobile):getObjectID() .. ":currentLoc", 1)
	end

	createEvent(getRandomNumber(850,950) * 100, "theed_invasion", "droidPatrol", pMobile, "")

	return 0
end

function theed_invasion:droidPatrol(pMobile)
	--[[if AiAgent(pMobile):isInCombat() then

		if (pMobile ~= nil and CreatureObject(pMobile):isAiAgent()) then
			AiAgent(pMobile):setAiTemplate("")
		end
	end]]

	local name = readStringData(SceneObject(pMobile):getObjectID() .. ":name")
	local curLoc = readData(SceneObject(pMobile):getObjectID() .. ":currentLoc")
	local nextLoc

	if (name == "droid1") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4148.2, 0 }
		else
			nextLoc = { -4929.2, 6.0, 4068.2, 0 }
		end
	end

	if (name == "droid2") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4149.2, 0 }
		else
			nextLoc = { -4929.2, 6.0, 4069.2, 0 }
		end
	end

	if (name == "droid3") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4150.2, 0 }
		else
			nextLoc = { -4929.2, 6.0, 4070.2, 0 }
		end
	end
	
	if (name == "droid4") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4151.2, 0 }
		else
			nextLoc = { -4929.2, 6.0, 4071.2, 0 }
		end
	end
	
	if (name == "droid5") then
		if (curLoc == 1) then

			nextLoc = { -1274.2, 12.0, -3583.2, 0 }
		else
			nextLoc = { -4929.2, 6.0, 4072.2, 0 }
		end
	end
	
	if (name == "droid6") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4152.2, 0 } 
		else
			nextLoc = { -4961.2, 6.0, 4104.2, 0 }
		end
	end
	
	if (name == "droid7") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4153.2, 0 }
		else
			nextLoc = { -4961.2, 6.0, 4105.2, 0 }
		end
	end
	
	if (name == "droid8") then
		if (curLoc == 1) then

		    nextLoc = { -4861.2, 6.0, 4154.2, 0 }
		else
			nextLoc = { -4961.2, 6.0, 4106.2, 0 }
		end
	end
	
	if (name == "droid9") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4155.2, 0 }
		else
			nextLoc = { -4961.2, 6.0, 4107.2, 0 }
		end
	end

	if (name == "droid10") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4156.2, 0 }
		else
			nextLoc = { -4961.2, 6.0, 4108.2, 0 }
		end
	end

	if (name == "droid11") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4157.2, 0 }
		else
			nextLoc = { -4934.2, 6.0, 4197.2, 0 }
		end
	end
	
	if (name == "droid12") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4159.2, 0 }
		else
		    nextLoc = { -4934.2, 6.0, 4198.2, 0 }
		end
	end
	
	if (name == "droid13") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4160.2, 0 }
		else
			nextLoc = { -4934.2, 6.0, 4199.2, 0 }
		end
	end
	
	if (name == "droid14") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4161.2, 0 }
		else
			nextLoc = { -4934.2, 6.0, 4200.2, 0 }
		end
	end
	
	if (name == "droid15") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4162.2, 0 }
		else
			nextLoc = { -4934.2, 6.0, 4201.2, 0 }
		end
	end
	
	if (name == "droid16") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4163.2, 0 }
		else
			nextLoc = { -4802.2, 6.0, 4102.2, 0 }
		end
	end
	
	if (name == "droid17") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4164.2, 0 }
		else
			nextLoc = { -4802.2, 6.0, 4103.2, 0 }
		end
	end

	if (name == "droid18") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4165.2, 0 }
		else
			nextLoc = { -4802.2, 6.0, 4104.2, 0 }
		end
	end

	if (name == "droid19") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4166.2, 0 }
		else
			nextLoc = { -4802.2, 6.0, 4105.2, 0 }
		end
	end
	
	if (name == "droid20") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4167.2, 0 }
		else
			nextLoc = { -4802.2, 6.0, 4106.2, 0 }
    end
	end
	
	if (name == "droid21") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4168.2, 0 }
		else
			nextLoc = { -4837.2, 6.0, 4105.2, 0 }
		end
	end
	
	if (name == "droid22") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4169.2, 0 }
		else
			nextLoc = { -4837.2, 6.0, 4106.2, 0 }
		end
	end
	
	if (name == "droid23") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4170.2, 0 }
		else
			nextLoc = { -4837.2, 6.0, 4107.2, 0 }
		end
	end
	
	if (name == "droid24") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4171.2, 0 }
		else
			nextLoc = { -4837.2, 6.0, 4108.2, 0 }
		end
	end
	
	if (name == "droid25") then
		if (curLoc == 1) then

			nextLoc = { -4861.2, 6.0, 4172.2, 0 }
		else
			nextLoc = { -4837.2, 6.0, 4109.2, 0 }
		end
	end
	
	
    AiAgent(pMobile):stopWaiting()
	AiAgent(pMobile):setWait(0)
	AiAgent(pMobile):setNextPosition(nextLoc[1], nextLoc[2], nextLoc[3], nextLoc[4])
	AiAgent(pMobile):executeBehavior()

end

function theed_invasion:notifyTriggerDead(pTrigger, pPlayer)
			createEvent(6000, "theed_invasion", "notifyWaveone", pTrigger,"")
			createEvent(300000, "theed_invasion", "notifyWavetwo", pTrigger,"")
			createEvent(600000, "theed_invasion", "notifyWavethree", pTrigger,"")
			createEvent(900000, "theed_invasion", "notifyWavefour", pTrigger,"")
			createEvent(1200000, "theed_invasion", "notifyWavefive", pTrigger,"")
			createEvent(1200000, "theed_invasion", "spawnRey", pTrigger,"")



	return 0
end

function theed_invasion:notifyWaveone(pTrigger, pPlayer)

			local pAdd = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4068.2, -88, 0)
			writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid1")
			createEvent(290000, "theed_invasion", "despawnAdd", pAdd,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
			--AiAgent(pAdd):setAiTemplate("manualescortwalk")
			--AiAgent(pAdd):setFollowState(4)
			ObjectManager.withCreatureObject(pAdd, function(firstTime)
			writeData("countadd", firstTime:getObjectID())
				firstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAdd, "target locked")
			
			local pAddTwo = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4069.2, -88, 0)
			writeData(SceneObject(pAddTwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwo):getObjectID() .. ":name", "droid2")
			-- createEvent(360000, "theed_invasion", "despawnAddTwo", pAddTwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwo)
			--AiAgent(pAddTwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwo, function(secondTime)
			writeData("countadd2", secondTime:getObjectID())
				secondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwo, "target locked")
	
	        local pAddThree = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4070.2, -88, 0)
			writeData(SceneObject(pAddThree):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThree):getObjectID() .. ":name", "droid3")
			-- createEvent(360000, "theed_invasion", "despawnAddThree", pAddThree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThree)
			--AiAgent(pAddThree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThree, function(thirdTime)
			writeData("countadd3", thirdTime:getObjectID())
				thirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThree, "target locked")
			
		    local pAddFour = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4071.2, -88, 0)
			writeData(SceneObject(pAddFour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFour):getObjectID() .. ":name", "droid4")
			-- createEvent(360000, "theed_invasion", "despawnAddFour", pAddFour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFour)
			--AiAgent(pAddFour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFour, function(fourthTime)
			writeData("countadd4", fourthTime:getObjectID())
				fourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFour, "target locked")
			
		    local pAddFive = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4072.2, -88, 0)
			writeData(SceneObject(pAddFive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFive):getObjectID() .. ":name", "droid5")
			-- createEvent(360000, "theed_invasion", "despawnAddFive", pAddFive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFive)
			--AiAgent(pAddFive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFive, function(fifthTime)
			writeData("countadd5", fifthTime:getObjectID())
				fifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFive, "target locked")
			
			local pAddSix = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddSix):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSix):getObjectID() .. ":name", "droid6")
			-- createEvent(360000, "theed_invasion", "despawnAddSix", pAddSix,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSix, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSix)
			--AiAgent(pAddSix):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSix):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSix, function(sixthTime)
			writeData("countadd6", sixthTime:getObjectID())
				sixthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSix, "target locked")
			
			local pAddSeven = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddSeven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeven):getObjectID() .. ":name", "droid7")
			-- createEvent(360000, "theed_invasion", "despawnAddSeven", pAddSeven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeven)
			----AiAgent(pAddSeven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeven, function(seventhTime)
			writeData("countadd7", seventhTime:getObjectID())
				seventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeven, "target locked")
	
	        local pAddEight = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddEight):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEight):getObjectID() .. ":name", "droid8")
			-- createEvent(360000, "theed_invasion", "despawnAddEight", pAddEight,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEight, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEight)
			----AiAgent(pAddEight):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEight):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEight, function(eighthTime)
			writeData("countadd8", eighthTime:getObjectID())
				eighthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEight, "target locked")
			
		    local pAddNine = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddNine):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNine):getObjectID() .. ":name", "droid9")
			-- createEvent(360000, "theed_invasion", "despawnAddNine", pAddNine,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNine, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNine)
			--(pAddNine):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNine):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNine, function(ninthTime)
			writeData("countadd9", ninthTime:getObjectID())
				ninthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNine, "target locked")
			
		    local pAddTen = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTen):getObjectID() .. ":name", "droid10")
			-- createEvent(360000, "theed_invasion", "despawnAddTen", pAddTen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTen)
		--	--AiAgent(pAddTen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTen, function(tenthTime)
			writeData("countadd10", tenthTime:getObjectID())
				tenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTen, "target locked")
			
			local pAddEleven = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4197.2, -88, 0)
			writeData(SceneObject(pAddEleven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEleven):getObjectID() .. ":name", "droid11")
			-- createEvent(360000, "theed_invasion", "despawnAddEleven", pAddEleven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEleven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEleven)
			----AiAgent(pAddEleven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEleven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEleven, function(eleventhTime)
			writeData("countadd11", eleventhTime:getObjectID())
				eleventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEleven, "target locked")
			
			local pAddTwelve = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4198.2, -88, 0)
			writeData(SceneObject(pAddTwelve):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwelve):getObjectID() .. ":name", "droid12")
			-- createEvent(360000, "theed_invasion", "despawnAddTwelve", pAddTwelve,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwelve, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwelve)
			----AiAgent(pAddTwelve):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwelve):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwelve, function(twelfthTime)
			writeData("countadd12", twelfthTime:getObjectID())
				twelfthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwelve, "target locked")
	
	        local pAddThirteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4199.2, -88, 0)
			writeData(SceneObject(pAddThirteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThirteen):getObjectID() .. ":name", "droid13")
			-- createEvent(360000, "theed_invasion", "despawnAddThirteen", pAddThirteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThirteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThirteen)
			----AiAgent(pAddThirteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThirteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThirteen, function(thirteenthTime)
			writeData("countadd13", thirteenthTime:getObjectID())
				thirteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThirteen, "target locked")
			
		    local pAddFourteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4200.2, -88, 0)
			writeData(SceneObject(pAddFourteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFourteen):getObjectID() .. ":name", "droid14")
			-- createEvent(360000, "theed_invasion", "despawnAddFourteen", pAddFourteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFourteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFourteen)
			----
			--AiAgent(pAddFourteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFourteen, function(fourteenthTime)
			writeData("countadd14", fourteenthTime:getObjectID())
				fourteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFourteen, "target locked")
			
		    local pAddFifteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4201.2, -88, 0)
			writeData(SceneObject(pAddFifteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFifteen):getObjectID() .. ":name", "droid15")
			-- createEvent(360000, "theed_invasion", "despawnAddFifteen", pAddFifteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFifteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFifteen)
			----
			--AiAgent(pAddFifteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFifteen, function(fifteenthTime)
			writeData("countadd15", fifteenthTime:getObjectID())
				fifteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFifteen, "target locked")
			
			local pAddSixteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4102.2, -88, 0)
			writeData(SceneObject(pAddSixteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSixteen):getObjectID() .. ":name", "droid16")
			-- createEvent(360000, "theed_invasion", "despawnAddSixteen", pAddSixteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSixteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSixteen)
			----AiAgent(pAddSixteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSixteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSixteen, function(sixteenthTime)
			writeData("countadd16", sixteenthTime:getObjectID())
				sixteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSixteen, "target locked")
			
			local pAddSeventeen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4103.2, -88, 0)
			writeData(SceneObject(pAddSeventeen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeventeen):getObjectID() .. ":name", "droid17")
			-- createEvent(360000, "theed_invasion", "despawnAddSeventeen", pAddSeventeen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeventeen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeventeen)
			----AiAgent(pAddSeventeen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeventeen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeventeen, function(seventeenthTime)
			writeData("countadd17", seventeenthTime:getObjectID())
				seventeenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeventeen, "target locked")
	
	        local pAddEighteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddEighteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEighteen):getObjectID() .. ":name", "droid18")
			-- createEvent(360000, "theed_invasion", "despawnAddEighteen", pAddEighteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEighteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEighteen)
			--
			--AiAgent(pAddEighteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEighteen, function(eighteenthTime)
			writeData("countadd18", eighteenthTime:getObjectID())
				eighteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEighteen, "target locked")
			
		    local pAddNineteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddNineteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNineteen):getObjectID() .. ":name", "droid19")
			-- createEvent(360000, "theed_invasion", "despawnAddNineteen", pAddNineteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNineteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNineteen)
			----AiAgent(pAddNineteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNineteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNineteen, function(nineteenthTime)
			writeData("countadd19", nineteenthTime:getObjectID())
				nineteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNineteen, "target locked")
			
		    local pAddTwenty = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwenty):getObjectID() .. ":name", "droid20")
			-- createEvent(360000, "theed_invasion", "despawnAddTwenty", pAddTwenty,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwenty, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwenty)
			----AiAgent(pAddTwenty):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwenty):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwenty, function(twentiethTime)
			writeData("countadd20", twentiethTime:getObjectID())
				twentiethTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwenty, "target locked")
			
		    local pAddTwentyone = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddTwentyone):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyone):getObjectID() .. ":name", "droid21")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyone", pAddTwentyone,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyone, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyone)
			----AiAgent(pAddTwentyone):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyone):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyone, function(twentyfirstTime)
			writeData("countadd21", twentyfirstTime:getObjectID())
				twentyfirstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyone, "target locked")
			
		    local pAddTwentytwo = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwentytwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentytwo):getObjectID() .. ":name", "droid22")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentytwo", pAddTwentytwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentytwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentytwo)
			----AiAgent(pAddTwentytwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentytwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentytwo, function(twentysecondTime)
			writeData("countadd22", twentysecondTime:getObjectID())
				twentysecondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentytwo, "target locked")
			
		    local pAddTwentythree = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentythree):getObjectID() .. ":name", "droid23")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentythree", pAddTwentythree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentythree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentythree)
			----AiAgent(pAddTwentythree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentythree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentythree, function(twentythirdTime)
			writeData("countadd23", twentythirdTime:getObjectID())
				twentythirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentythree, "target locked")
			
		    local pAddTwentyfour = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTwentyfour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfour):getObjectID() .. ":name", "droid24")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfour", pAddTwentyfour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfour)
			----AiAgent(pAddTwentyfour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfour, function(twentyfourthTime)
			writeData("countadd24", twentyfourthTime:getObjectID())
				twentyfourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfour, "target locked")
			
			local pAddTwentyfive = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4109.2, -88, 0)
			writeData(SceneObject(pAddTwentyfive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfive):getObjectID() .. ":name", "droid25")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfive", pAddTwentyfive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfive)
			----AiAgent(pAddTwentyfive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfive, function(twentyfifthTime)
			writeData("countadd25", twentyfifthTime:getObjectID())
				twentyfifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfive, "target locked")
			
	
	return 0
end


function theed_invasion:notifyWavetwo(pTrigger, pPlayer)

      local pAdd = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4068.2, -88, 0)
			writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid1")
			createEvent(290000, "theed_invasion", "despawnAdd", pAdd,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
			--AiAgent(pAdd):setAiTemplate("manualescortwalk")
			--AiAgent(pAdd):setFollowState(4)
			ObjectManager.withCreatureObject(pAdd, function(firstTime)
			writeData("countadd", firstTime:getObjectID())
				firstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAdd, "target locked")
			
			local pAddTwo = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4069.2, -88, 0)
			writeData(SceneObject(pAddTwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwo):getObjectID() .. ":name", "droid2")
			-- createEvent(360000, "theed_invasion", "despawnAddTwo", pAddTwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwo)
			--AiAgent(pAddTwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwo, function(secondTime)
			writeData("countadd2", secondTime:getObjectID())
				secondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwo, "target locked")
	
      local pAddThree = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4070.2, -88, 0)
			writeData(SceneObject(pAddThree):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThree):getObjectID() .. ":name", "droid3")
			-- createEvent(360000, "theed_invasion", "despawnAddThree", pAddThree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThree)
			--AiAgent(pAddThree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThree, function(thirdTime)
			writeData("countadd3", thirdTime:getObjectID())
				thirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThree, "target locked")
			
      local pAddFour = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4071.2, -88, 0)
			writeData(SceneObject(pAddFour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFour):getObjectID() .. ":name", "droid4")
			-- createEvent(360000, "theed_invasion", "despawnAddFour", pAddFour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFour)
			--AiAgent(pAddFour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFour, function(fourthTime)
			writeData("countadd4", fourthTime:getObjectID())
				fourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFour, "target locked")
			
      local pAddFive = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4072.2, -88, 0)
			writeData(SceneObject(pAddFive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFive):getObjectID() .. ":name", "droid5")
			-- createEvent(360000, "theed_invasion", "despawnAddFive", pAddFive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFive)
			--AiAgent(pAddFive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFive, function(fifthTime)
			writeData("countadd5", fifthTime:getObjectID())
				fifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFive, "target locked")
			
			local pAddSix = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddSix):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSix):getObjectID() .. ":name", "droid6")
			-- createEvent(360000, "theed_invasion", "despawnAddSix", pAddSix,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSix, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSix)
			--AiAgent(pAddSix):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSix):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSix, function(sixthTime)
			writeData("countadd6", sixthTime:getObjectID())
				sixthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSix, "target locked")
			
			local pAddSeven = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddSeven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeven):getObjectID() .. ":name", "droid7")
			-- createEvent(360000, "theed_invasion", "despawnAddSeven", pAddSeven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeven)
			----AiAgent(pAddSeven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeven, function(seventhTime)
			writeData("countadd7", seventhTime:getObjectID())
				seventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeven, "target locked")
	
      local pAddEight = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddEight):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEight):getObjectID() .. ":name", "droid8")
			-- createEvent(360000, "theed_invasion", "despawnAddEight", pAddEight,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEight, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEight)
			----AiAgent(pAddEight):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEight):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEight, function(eighthTime)
			writeData("countadd8", eighthTime:getObjectID())
				eighthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEight, "target locked")
			
      local pAddNine = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddNine):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNine):getObjectID() .. ":name", "droid9")
			-- createEvent(360000, "theed_invasion", "despawnAddNine", pAddNine,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNine, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNine)
			----AiAgent(pAddNine):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNine):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNine, function(ninthTime)
			writeData("countadd9", ninthTime:getObjectID())
				ninthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNine, "target locked")
			
      local pAddTen = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTen):getObjectID() .. ":name", "droid10")
			-- createEvent(360000, "theed_invasion", "despawnAddTen", pAddTen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTen)
			----AiAgent(pAddTen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTen, function(tenthTime)
			writeData("countadd10", tenthTime:getObjectID())
				tenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTen, "target locked")
			
			local pAddEleven = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4197.2, -88, 0)
			writeData(SceneObject(pAddEleven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEleven):getObjectID() .. ":name", "droid11")
			-- createEvent(360000, "theed_invasion", "despawnAddEleven", pAddEleven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEleven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEleven)
			----AiAgent(pAddEleven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEleven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEleven, function(eleventhTime)
			writeData("countadd11", eleventhTime:getObjectID())
				eleventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEleven, "target locked")
			
			local pAddTwelve = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4198.2, -88, 0)
			writeData(SceneObject(pAddTwelve):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwelve):getObjectID() .. ":name", "droid12")
			-- createEvent(360000, "theed_invasion", "despawnAddTwelve", pAddTwelve,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwelve, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwelve)
			----AiAgent(pAddTwelve):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwelve):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwelve, function(twelfthTime)
			writeData("countadd12", twelfthTime:getObjectID())
				twelfthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwelve, "target locked")
	
      local pAddThirteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4199.2, -88, 0)
			writeData(SceneObject(pAddThirteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThirteen):getObjectID() .. ":name", "droid13")
			-- createEvent(360000, "theed_invasion", "despawnAddThirteen", pAddThirteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThirteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThirteen)
			--AiAgent(pAddThirteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThirteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThirteen, function(thirteenthTime)
			writeData("countadd13", thirteenthTime:getObjectID())
				thirteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThirteen, "target locked")
			
      local pAddFourteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4200.2, -88, 0)
			writeData(SceneObject(pAddFourteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFourteen):getObjectID() .. ":name", "droid14")
			-- createEvent(360000, "theed_invasion", "despawnAddFourteen", pAddFourteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFourteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFourteen)
			--AiAgent(pAddFourteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFourteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFourteen, function(fourteenthTime)
			writeData("countadd14", fourteenthTime:getObjectID())
				fourteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFourteen, "target locked")
			
      local pAddFifteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4201.2, -88, 0)
			writeData(SceneObject(pAddFifteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFifteen):getObjectID() .. ":name", "droid15")
			-- createEvent(360000, "theed_invasion", "despawnAddFifteen", pAddFifteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFifteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFifteen)
			--AiAgent(pAddFifteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFifteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFifteen, function(fifteenthTime)
			writeData("countadd15", fifteenthTime:getObjectID())
				fifteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFifteen, "target locked")
			
			local pAddSixteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4102.2, -88, 0)
			writeData(SceneObject(pAddSixteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSixteen):getObjectID() .. ":name", "droid16")
			-- createEvent(360000, "theed_invasion", "despawnAddSixteen", pAddSixteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSixteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSixteen)
			--AiAgent(pAddSixteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSixteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSixteen, function(sixteenthTime)
			writeData("countadd16", sixteenthTime:getObjectID())
				sixteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSixteen, "target locked")
			
			local pAddSeventeen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4103.2, -88, 0)
			writeData(SceneObject(pAddSeventeen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeventeen):getObjectID() .. ":name", "droid17")
			-- createEvent(360000, "theed_invasion", "despawnAddSeventeen", pAddSeventeen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeventeen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeventeen)
			--AiAgent(pAddSeventeen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeventeen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeventeen, function(seventeenthTime)
			writeData("countadd17", seventeenthTime:getObjectID())
				seventeenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeventeen, "target locked")
	
      local pAddEighteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddEighteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEighteen):getObjectID() .. ":name", "droid18")
			-- createEvent(360000, "theed_invasion", "despawnAddEighteen", pAddEighteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEighteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEighteen)
			--AiAgent(pAddEighteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEighteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEighteen, function(eighteenthTime)
			writeData("countadd18", eighteenthTime:getObjectID())
				eighteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEighteen, "target locked")
			
      local pAddNineteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddNineteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNineteen):getObjectID() .. ":name", "droid19")
			-- createEvent(360000, "theed_invasion", "despawnAddNineteen", pAddNineteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNineteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNineteen)
			--AiAgent(pAddNineteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNineteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNineteen, function(nineteenthTime)
			writeData("countadd19", nineteenthTime:getObjectID())
				nineteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNineteen, "target locked")
			
      local pAddTwenty = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwenty):getObjectID() .. ":name", "droid20")
			-- createEvent(360000, "theed_invasion", "despawnAddTwenty", pAddTwenty,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwenty, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwenty)
			--AiAgent(pAddTwenty):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwenty):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwenty, function(twentiethTime)
			writeData("countadd20", twentiethTime:getObjectID())
				twentiethTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwenty, "target locked")
			
      local pAddTwentyone = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddTwentyone):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyone):getObjectID() .. ":name", "droid21")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyone", pAddTwentyone,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyone, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyone)
			--AiAgent(pAddTwentyone):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyone):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyone, function(twentyfirstTime)
			writeData("countadd21", twentyfirstTime:getObjectID())
				twentyfirstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyone, "target locked")
			
      local pAddTwentytwo = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwentytwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentytwo):getObjectID() .. ":name", "droid22")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentytwo", pAddTwentytwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentytwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentytwo)
			----AiAgent(pAddTwentytwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentytwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentytwo, function(twentysecondTime)
			writeData("countadd22", twentysecondTime:getObjectID())
				twentysecondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentytwo, "target locked")
			
      local pAddTwentythree = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentythree):getObjectID() .. ":name", "droid23")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentythree", pAddTwentythree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentythree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentythree)
			----AiAgent(pAddTwentythree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentythree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentythree, function(twentythirdTime)
			writeData("countadd23", twentythirdTime:getObjectID())
				twentythirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentythree, "target locked")
			
      local pAddTwentyfour = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTwentyfour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfour):getObjectID() .. ":name", "droid24")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfour", pAddTwentyfour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfour)
			----AiAgent(pAddTwentyfour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfour, function(twentyfourthTime)
			writeData("countadd24", twentyfourthTime:getObjectID())
				twentyfourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfour, "target locked")
			
			local pAddTwentyfive = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4109.2, -88, 0)
			writeData(SceneObject(pAddTwentyfive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfive):getObjectID() .. ":name", "droid25")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfive", pAddTwentyfive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfive)
			----AiAgent(pAddTwentyfive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfive, function(twentyfifthTime)
			writeData("countadd25", twentyfifthTime:getObjectID())
				twentyfifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfive, "target locked")
			
	return 0
end


function theed_invasion:notifyWavethree(pTrigger, pPlayer)

local pAdd = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4068.2, -88, 0)
			writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid1")
			createEvent(290000, "theed_invasion", "despawnAdd", pAdd,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
			--AiAgent(pAdd):setAiTemplate("manualescortwalk")
			--AiAgent(pAdd):setFollowState(4)
			ObjectManager.withCreatureObject(pAdd, function(firstTime)
			writeData("countadd", firstTime:getObjectID())
				firstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAdd, "target locked")
			
			local pAddTwo = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4069.2, -88, 0)
			writeData(SceneObject(pAddTwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwo):getObjectID() .. ":name", "droid2")
			-- createEvent(360000, "theed_invasion", "despawnAddTwo", pAddTwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwo)
			--AiAgent(pAddTwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwo, function(secondTime)
			writeData("countadd2", secondTime:getObjectID())
				secondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwo, "target locked")
	
	        local pAddThree = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4070.2, -88, 0)
			writeData(SceneObject(pAddThree):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThree):getObjectID() .. ":name", "droid3")
			-- createEvent(360000, "theed_invasion", "despawnAddThree", pAddThree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThree)
			--AiAgent(pAddThree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThree, function(thirdTime)
			writeData("countadd3", thirdTime:getObjectID())
				thirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThree, "target locked")
			
		    local pAddFour = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4071.2, -88, 0)
			writeData(SceneObject(pAddFour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFour):getObjectID() .. ":name", "droid4")
			-- createEvent(360000, "theed_invasion", "despawnAddFour", pAddFour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFour)
			--AiAgent(pAddFour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFour, function(fourthTime)
			writeData("countadd4", fourthTime:getObjectID())
				fourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFour, "target locked")
			
		    local pAddFive = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4072.2, -88, 0)
			writeData(SceneObject(pAddFive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFive):getObjectID() .. ":name", "droid5")
			-- createEvent(360000, "theed_invasion", "despawnAddFive", pAddFive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFive)
			--AiAgent(pAddFive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFive, function(fifthTime)
			writeData("countadd5", fifthTime:getObjectID())
				fifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFive, "target locked")
			
			local pAddSix = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddSix):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSix):getObjectID() .. ":name", "droid6")
			-- createEvent(360000, "theed_invasion", "despawnAddSix", pAddSix,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSix, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSix)
			--AiAgent(pAddSix):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSix):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSix, function(sixthTime)
			writeData("countadd6", sixthTime:getObjectID())
				sixthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSix, "target locked")
			
			local pAddSeven = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddSeven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeven):getObjectID() .. ":name", "droid7")
			-- createEvent(360000, "theed_invasion", "despawnAddSeven", pAddSeven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeven)
			----AiAgent(pAddSeven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeven, function(seventhTime)
			writeData("countadd7", seventhTime:getObjectID())
				seventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeven, "target locked")
	
	        local pAddEight = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddEight):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEight):getObjectID() .. ":name", "droid8")
			-- createEvent(360000, "theed_invasion", "despawnAddEight", pAddEight,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEight, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEight)
			----AiAgent(pAddEight):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEight):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEight, function(eighthTime)
			writeData("countadd8", eighthTime:getObjectID())
				eighthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEight, "target locked")
			
		    local pAddNine = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddNine):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNine):getObjectID() .. ":name", "droid9")
			-- createEvent(360000, "theed_invasion", "despawnAddNine", pAddNine,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNine, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNine)
			----AiAgent(pAddNine):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNine):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNine, function(ninthTime)
			writeData("countadd9", ninthTime:getObjectID())
				ninthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNine, "target locked")
			
		    local pAddTen = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTen):getObjectID() .. ":name", "droid10")
			-- createEvent(360000, "theed_invasion", "despawnAddTen", pAddTen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTen)
			----AiAgent(pAddTen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTen, function(tenthTime)
			writeData("countadd10", tenthTime:getObjectID())
				tenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTen, "target locked")
			
			local pAddEleven = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4197.2, -88, 0)
			writeData(SceneObject(pAddEleven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEleven):getObjectID() .. ":name", "droid11")
			-- createEvent(360000, "theed_invasion", "despawnAddEleven", pAddEleven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEleven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEleven)
			----AiAgent(pAddEleven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEleven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEleven, function(eleventhTime)
			writeData("countadd11", eleventhTime:getObjectID())
				eleventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEleven, "target locked")
			
			local pAddTwelve = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4198.2, -88, 0)
			writeData(SceneObject(pAddTwelve):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwelve):getObjectID() .. ":name", "droid12")
			-- createEvent(360000, "theed_invasion", "despawnAddTwelve", pAddTwelve,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwelve, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwelve)
			----AiAgent(pAddTwelve):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwelve):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwelve, function(twelfthTime)
			writeData("countadd12", twelfthTime:getObjectID())
				twelfthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwelve, "target locked")
	
	        local pAddThirteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4199.2, -88, 0)
			writeData(SceneObject(pAddThirteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThirteen):getObjectID() .. ":name", "droid13")
			-- createEvent(360000, "theed_invasion", "despawnAddThirteen", pAddThirteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThirteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThirteen)
			--AiAgent(pAddThirteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThirteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThirteen, function(thirteenthTime)
			writeData("countadd13", thirteenthTime:getObjectID())
				thirteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThirteen, "target locked")
			
		    local pAddFourteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4200.2, -88, 0)
			writeData(SceneObject(pAddFourteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFourteen):getObjectID() .. ":name", "droid14")
			-- createEvent(360000, "theed_invasion", "despawnAddFourteen", pAddFourteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFourteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFourteen)
			--
			--AiAgent(pAddFourteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFourteen, function(fourteenthTime)
			writeData("countadd14", fourteenthTime:getObjectID())
				fourteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFourteen, "target locked")
			
		    local pAddFifteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4201.2, -88, 0)
			writeData(SceneObject(pAddFifteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFifteen):getObjectID() .. ":name", "droid15")
			-- createEvent(360000, "theed_invasion", "despawnAddFifteen", pAddFifteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFifteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFifteen)
			--
			--AiAgent(pAddFifteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFifteen, function(fifteenthTime)
			writeData("countadd15", fifteenthTime:getObjectID())
				fifteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFifteen, "target locked")
			
			local pAddSixteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4102.2, -88, 0)
			writeData(SceneObject(pAddSixteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSixteen):getObjectID() .. ":name", "droid16")
			-- createEvent(360000, "theed_invasion", "despawnAddSixteen", pAddSixteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSixteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSixteen)
			--AiAgent(pAddSixteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSixteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSixteen, function(sixteenthTime)
			writeData("countadd16", sixteenthTime:getObjectID())
				sixteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSixteen, "target locked")
			
			local pAddSeventeen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4103.2, -88, 0)
			writeData(SceneObject(pAddSeventeen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeventeen):getObjectID() .. ":name", "droid17")
			-- createEvent(360000, "theed_invasion", "despawnAddSeventeen", pAddSeventeen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeventeen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeventeen)
			--AiAgent(pAddSeventeen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeventeen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeventeen, function(seventeenthTime)
			writeData("countadd17", seventeenthTime:getObjectID())
				seventeenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeventeen, "target locked")
	
	        local pAddEighteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddEighteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEighteen):getObjectID() .. ":name", "droid18")
			-- createEvent(360000, "theed_invasion", "despawnAddEighteen", pAddEighteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEighteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEighteen)
			
			--AiAgent(pAddEighteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEighteen, function(eighteenthTime)
			writeData("countadd18", eighteenthTime:getObjectID())
				eighteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEighteen, "target locked")
			
		    local pAddNineteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddNineteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNineteen):getObjectID() .. ":name", "droid19")
			-- createEvent(360000, "theed_invasion", "despawnAddNineteen", pAddNineteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNineteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNineteen)
			--AiAgent(pAddNineteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNineteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNineteen, function(nineteenthTime)
			writeData("countadd19", nineteenthTime:getObjectID())
				nineteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNineteen, "target locked")
			
		    local pAddTwenty = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwenty):getObjectID() .. ":name", "droid20")
			-- createEvent(360000, "theed_invasion", "despawnAddTwenty", pAddTwenty,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwenty, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwenty)
			--AiAgent(pAddTwenty):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwenty):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwenty, function(twentiethTime)
			writeData("countadd20", twentiethTime:getObjectID())
				twentiethTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwenty, "target locked")
			
		    local pAddTwentyone = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddTwentyone):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyone):getObjectID() .. ":name", "droid21")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyone", pAddTwentyone,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyone, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyone)
			--AiAgent(pAddTwentyone):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyone):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyone, function(twentyfirstTime)
			writeData("countadd21", twentyfirstTime:getObjectID())
				twentyfirstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyone, "target locked")
			
		    local pAddTwentytwo = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwentytwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentytwo):getObjectID() .. ":name", "droid22")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentytwo", pAddTwentytwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentytwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentytwo)
			----AiAgent(pAddTwentytwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentytwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentytwo, function(twentysecondTime)
			writeData("countadd22", twentysecondTime:getObjectID())
				twentysecondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentytwo, "target locked")
			
		    local pAddTwentythree = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentythree):getObjectID() .. ":name", "droid23")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentythree", pAddTwentythree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentythree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentythree)
			----AiAgent(pAddTwentythree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentythree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentythree, function(twentythirdTime)
			writeData("countadd23", twentythirdTime:getObjectID())
				twentythirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentythree, "target locked")
			
		    local pAddTwentyfour = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTwentyfour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfour):getObjectID() .. ":name", "droid24")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfour", pAddTwentyfour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfour)
			----AiAgent(pAddTwentyfour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfour, function(twentyfourthTime)
			writeData("countadd24", twentyfourthTime:getObjectID())
				twentyfourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfour, "target locked")
			
			local pAddTwentyfive = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4109.2, -88, 0)
			writeData(SceneObject(pAddTwentyfive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfive):getObjectID() .. ":name", "droid25")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfive", pAddTwentyfive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfive)
			----AiAgent(pAddTwentyfive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfive, function(twentyfifthTime)
			writeData("countadd25", twentyfifthTime:getObjectID())
				twentyfifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfive, "target locked")
			
	return 0
end

function theed_invasion:notifyWavefour(pTrigger, pPlayer)

local pAdd = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4068.2, -88, 0)
			writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid1")
			createEvent(290000, "theed_invasion", "despawnAdd", pAdd,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
			--AiAgent(pAdd):setAiTemplate("manualescortwalk")
			--AiAgent(pAdd):setFollowState(4)
			ObjectManager.withCreatureObject(pAdd, function(firstTime)
			writeData("countadd", firstTime:getObjectID())
				firstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAdd, "target locked")
			
			local pAddTwo = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4069.2, -88, 0)
			writeData(SceneObject(pAddTwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwo):getObjectID() .. ":name", "droid2")
			-- createEvent(360000, "theed_invasion", "despawnAddTwo", pAddTwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwo)
			--AiAgent(pAddTwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwo, function(secondTime)
			writeData("countadd2", secondTime:getObjectID())
				secondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwo, "target locked")
	
	        local pAddThree = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4070.2, -88, 0)
			writeData(SceneObject(pAddThree):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThree):getObjectID() .. ":name", "droid3")
			-- createEvent(360000, "theed_invasion", "despawnAddThree", pAddThree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThree)
			--AiAgent(pAddThree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThree, function(thirdTime)
			writeData("countadd3", thirdTime:getObjectID())
				thirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThree, "target locked")
			
		    local pAddFour = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4071.2, -88, 0)
			writeData(SceneObject(pAddFour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFour):getObjectID() .. ":name", "droid4")
			-- createEvent(360000, "theed_invasion", "despawnAddFour", pAddFour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFour)
			--AiAgent(pAddFour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFour, function(fourthTime)
			writeData("countadd4", fourthTime:getObjectID())
				fourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFour, "target locked")
			
		    local pAddFive = spawnMobile("naboo", "specops_trooper", 0, -4929.2, 6.0, 4072.2, -88, 0)
			writeData(SceneObject(pAddFive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFive):getObjectID() .. ":name", "droid5")
			-- createEvent(360000, "theed_invasion", "despawnAddFive", pAddFive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFive)
			--AiAgent(pAddFive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFive, function(fifthTime)
			writeData("countadd5", fifthTime:getObjectID())
				fifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFive, "target locked")
			
			local pAddSix = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddSix):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSix):getObjectID() .. ":name", "droid6")
			-- createEvent(360000, "theed_invasion", "despawnAddSix", pAddSix,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSix, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSix)
			--AiAgent(pAddSix):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSix):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSix, function(sixthTime)
			writeData("countadd6", sixthTime:getObjectID())
				sixthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSix, "target locked")
			
			local pAddSeven = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddSeven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeven):getObjectID() .. ":name", "droid7")
			-- createEvent(360000, "theed_invasion", "despawnAddSeven", pAddSeven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeven)
			--AiAgent(pAddSeven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeven, function(seventhTime)
			writeData("countadd7", seventhTime:getObjectID())
				seventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeven, "target locked")
	
	        local pAddEight = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddEight):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEight):getObjectID() .. ":name", "droid8")
			-- createEvent(360000, "theed_invasion", "despawnAddEight", pAddEight,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEight, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEight)
			--AiAgent(pAddEight):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEight):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEight, function(eighthTime)
			writeData("countadd8", eighthTime:getObjectID())
				eighthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEight, "target locked")
			
		    local pAddNine = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddNine):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNine):getObjectID() .. ":name", "droid9")
			-- createEvent(360000, "theed_invasion", "despawnAddNine", pAddNine,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNine, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNine)
			--AiAgent(pAddNine):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNine):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNine, function(ninthTime)
			writeData("countadd9", ninthTime:getObjectID())
				ninthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNine, "target locked")
			
		    local pAddTen = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTen):getObjectID() .. ":name", "droid10")
			-- createEvent(360000, "theed_invasion", "despawnAddTen", pAddTen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTen)
			--AiAgent(pAddTen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTen, function(tenthTime)
			writeData("countadd10", tenthTime:getObjectID())
				tenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTen, "target locked")
			
			local pAddEleven = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4197.2, -88, 0)
			writeData(SceneObject(pAddEleven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEleven):getObjectID() .. ":name", "droid11")
			-- createEvent(360000, "theed_invasion", "despawnAddEleven", pAddEleven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEleven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEleven)
			--AiAgent(pAddEleven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEleven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEleven, function(eleventhTime)
			writeData("countadd11", eleventhTime:getObjectID())
				eleventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEleven, "target locked")
			
			local pAddTwelve = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4198.2, -88, 0)
			writeData(SceneObject(pAddTwelve):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwelve):getObjectID() .. ":name", "droid12")
			-- createEvent(360000, "theed_invasion", "despawnAddTwelve", pAddTwelve,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwelve, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwelve)
			--AiAgent(pAddTwelve):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwelve):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwelve, function(twelfthTime)
			writeData("countadd12", twelfthTime:getObjectID())
				twelfthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwelve, "target locked")
	
	        local pAddThirteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4199.2, -88, 0)
			writeData(SceneObject(pAddThirteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThirteen):getObjectID() .. ":name", "droid13")
			-- createEvent(360000, "theed_invasion", "despawnAddThirteen", pAddThirteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThirteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThirteen)
			--AiAgent(pAddThirteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThirteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThirteen, function(thirteenthTime)
			writeData("countadd13", thirteenthTime:getObjectID())
				thirteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThirteen, "target locked")
			
		    local pAddFourteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4200.2, -88, 0)
			writeData(SceneObject(pAddFourteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFourteen):getObjectID() .. ":name", "droid14")
			-- createEvent(360000, "theed_invasion", "despawnAddFourteen", pAddFourteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFourteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFourteen)
			--
			--AiAgent(pAddFourteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFourteen, function(fourteenthTime)
			writeData("countadd14", fourteenthTime:getObjectID())
				fourteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFourteen, "target locked")
			
		    local pAddFifteen = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4201.2, -88, 0)
			writeData(SceneObject(pAddFifteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFifteen):getObjectID() .. ":name", "droid15")
			-- createEvent(360000, "theed_invasion", "despawnAddFifteen", pAddFifteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFifteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFifteen)
			--
			--AiAgent(pAddFifteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFifteen, function(fifteenthTime)
			writeData("countadd15", fifteenthTime:getObjectID())
				fifteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFifteen, "target locked")
			
			local pAddSixteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4102.2, -88, 0)
			writeData(SceneObject(pAddSixteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSixteen):getObjectID() .. ":name", "droid16")
			-- createEvent(360000, "theed_invasion", "despawnAddSixteen", pAddSixteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSixteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSixteen)
			--AiAgent(pAddSixteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSixteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSixteen, function(sixteenthTime)
			writeData("countadd16", sixteenthTime:getObjectID())
				sixteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSixteen, "target locked")
			
			local pAddSeventeen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4103.2, -88, 0)
			writeData(SceneObject(pAddSeventeen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeventeen):getObjectID() .. ":name", "droid17")
			-- createEvent(360000, "theed_invasion", "despawnAddSeventeen", pAddSeventeen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeventeen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeventeen)
			--AiAgent(pAddSeventeen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeventeen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeventeen, function(seventeenthTime)
			writeData("countadd17", seventeenthTime:getObjectID())
				seventeenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeventeen, "target locked")
	
	        local pAddEighteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddEighteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEighteen):getObjectID() .. ":name", "droid18")
			-- createEvent(360000, "theed_invasion", "despawnAddEighteen", pAddEighteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEighteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEighteen)
			
			--AiAgent(pAddEighteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEighteen, function(eighteenthTime)
			writeData("countadd18", eighteenthTime:getObjectID())
				eighteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEighteen, "target locked")
			
		    local pAddNineteen = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddNineteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNineteen):getObjectID() .. ":name", "droid19")
			-- createEvent(360000, "theed_invasion", "despawnAddNineteen", pAddNineteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNineteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNineteen)
			--AiAgent(pAddNineteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNineteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNineteen, function(nineteenthTime)
			writeData("countadd19", nineteenthTime:getObjectID())
				nineteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNineteen, "target locked")
			
		    local pAddTwenty = spawnMobile("naboo", "specops_trooper", 0, -4802.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwenty):getObjectID() .. ":name", "droid20")
			-- createEvent(360000, "theed_invasion", "despawnAddTwenty", pAddTwenty,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwenty, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwenty)
			--AiAgent(pAddTwenty):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwenty):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwenty, function(twentiethTime)
			writeData("countadd20", twentiethTime:getObjectID())
				twentiethTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwenty, "target locked")
			
		    local pAddTwentyone = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddTwentyone):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyone):getObjectID() .. ":name", "droid21")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyone", pAddTwentyone,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyone, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyone)
			--AiAgent(pAddTwentyone):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyone):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyone, function(twentyfirstTime)
			writeData("countadd21", twentyfirstTime:getObjectID())
				twentyfirstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyone, "target locked")
			
		    local pAddTwentytwo = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwentytwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentytwo):getObjectID() .. ":name", "droid22")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentytwo", pAddTwentytwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentytwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentytwo)
			--AiAgent(pAddTwentytwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentytwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentytwo, function(twentysecondTime)
			writeData("countadd22", twentysecondTime:getObjectID())
				twentysecondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentytwo, "target locked")
			
		    local pAddTwentythree = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentythree):getObjectID() .. ":name", "droid23")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentythree", pAddTwentythree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentythree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentythree)
			--AiAgent(pAddTwentythree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentythree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentythree, function(twentythirdTime)
			writeData("countadd23", twentythirdTime:getObjectID())
				twentythirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentythree, "target locked")
			
		    local pAddTwentyfour = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTwentyfour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfour):getObjectID() .. ":name", "droid24")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfour", pAddTwentyfour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfour)
			--AiAgent(pAddTwentyfour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfour, function(twentyfourthTime)
			writeData("countadd24", twentyfourthTime:getObjectID())
				twentyfourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfour, "target locked")
			
			local pAddTwentyfive = spawnMobile("naboo", "specops_trooper", 0, -4837.2, 6.0, 4109.2, -88, 0)
			writeData(SceneObject(pAddTwentyfive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfive):getObjectID() .. ":name", "droid25")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfive", pAddTwentyfive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfive)
			--AiAgent(pAddTwentyfive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfive, function(twentyfifthTime)
			writeData("countadd25", twentyfifthTime:getObjectID())
				twentyfifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfive, "target locked")
			
	
	return 0
end

function theed_invasion:notifyWavefive(pTrigger, pPlayer)

			local pAdd = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4929.2, 6.0, 4068.2, -88, 0)
			writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid1")
			createEvent(2290000, "theed_invasion", "despawnAdd", pAdd,"")
			createEvent(3000000, "theed_invasion", "notifyTriggerDead", pTrigger,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
			--AiAgent(pAdd):setAiTemplate("manualescortwalk")
			--AiAgent(pAdd):setFollowState(4)
			ObjectManager.withCreatureObject(pAdd, function(firstTime)
			writeData("countadd", firstTime:getObjectID())
				firstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAdd, "target locked")
			
			local pAddTwo = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4929.2, 6.0, 4069.2, -88, 0)
			writeData(SceneObject(pAddTwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwo):getObjectID() .. ":name", "droid2")
			-- createEvent(360000, "theed_invasion", "despawnAddTwo", pAddTwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwo)
			--AiAgent(pAddTwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwo, function(secondTime)
			writeData("countadd2", secondTime:getObjectID())
				secondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwo, "target locked")
	
	        local pAddThree = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4929.2, 6.0, 4070.2, -88, 0)
			writeData(SceneObject(pAddThree):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThree):getObjectID() .. ":name", "droid3")
			-- createEvent(360000, "theed_invasion", "despawnAddThree", pAddThree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThree)
			--AiAgent(pAddThree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThree, function(thirdTime)
			writeData("countadd3", thirdTime:getObjectID())
				thirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThree, "target locked")
			
		    local pAddFour = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4929.2, 6.0, 4071.2, -88, 0)
			writeData(SceneObject(pAddFour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFour):getObjectID() .. ":name", "droid4")
			-- createEvent(360000, "theed_invasion", "despawnAddFour", pAddFour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFour)
			--AiAgent(pAddFour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFour, function(fourthTime)
			writeData("countadd4", fourthTime:getObjectID())
				fourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFour, "target locked")
			
		    local pAddFive = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4929.2, 6.0, 4072.2, -88, 0)
			writeData(SceneObject(pAddFive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFive):getObjectID() .. ":name", "droid5")
			-- createEvent(360000, "theed_invasion", "despawnAddFive", pAddFive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFive)
			--AiAgent(pAddFive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddFive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFive, function(fifthTime)
			writeData("countadd5", fifthTime:getObjectID())
				fifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFive, "target locked")
			
			local pAddSix = spawnMobile("naboo", "specops_trooper", 0, -4961.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddSix):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSix):getObjectID() .. ":name", "droid6")
			-- createEvent(360000, "theed_invasion", "despawnAddSix", pAddSix,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSix, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSix)
			--AiAgent(pAddSix):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSix):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSix, function(sixthTime)
			writeData("countadd6", sixthTime:getObjectID())
				sixthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSix, "target locked")
			
			local pAddSeven = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4961.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddSeven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeven):getObjectID() .. ":name", "droid7")
			-- createEvent(360000, "theed_invasion", "despawnAddSeven", pAddSeven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeven)
			--AiAgent(pAddSeven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeven, function(seventhTime)
			writeData("countadd7", seventhTime:getObjectID())
				seventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeven, "target locked")
	
	        local pAddEight = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4961.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddEight):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEight):getObjectID() .. ":name", "droid8")
			-- createEvent(360000, "theed_invasion", "despawnAddEight", pAddEight,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEight, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEight)
			--AiAgent(pAddEight):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEight):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEight, function(eighthTime)
			writeData("countadd8", eighthTime:getObjectID())
				eighthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEight, "target locked")
			
		    local pAddNine = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4961.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddNine):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNine):getObjectID() .. ":name", "droid9")
			-- createEvent(360000, "theed_invasion", "despawnAddNine", pAddNine,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNine, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNine)
			--AiAgent(pAddNine):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNine):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNine, function(ninthTime)
			writeData("countadd9", ninthTime:getObjectID())
				ninthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNine, "target locked")
			
		    local pAddTen = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4961.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTen):getObjectID() .. ":name", "droid10")
			-- createEvent(360000, "theed_invasion", "despawnAddTen", pAddTen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTen)
			--AiAgent(pAddTen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTen, function(tenthTime)
			writeData("countadd10", tenthTime:getObjectID())
				tenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTen, "target locked")
			
			local pAddEleven = spawnMobile("naboo", "specops_trooper", 0, -4934.2, 6.0, 4197.2, -88, 0)
			writeData(SceneObject(pAddEleven):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEleven):getObjectID() .. ":name", "droid11")
			-- createEvent(360000, "theed_invasion", "despawnAddEleven", pAddEleven,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEleven, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEleven)
			--AiAgent(pAddEleven):setAiTemplate("manualescortwalk")
			--AiAgent(pAddEleven):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEleven, function(eleventhTime)
			writeData("countadd11", eleventhTime:getObjectID())
				eleventhTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEleven, "target locked")
			
			local pAddTwelve = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4934.2, 6.0, 4198.2, -88, 0)
			writeData(SceneObject(pAddTwelve):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwelve):getObjectID() .. ":name", "droid12")
			-- createEvent(360000, "theed_invasion", "despawnAddTwelve", pAddTwelve,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwelve, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwelve)
			--AiAgent(pAddTwelve):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwelve):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwelve, function(twelfthTime)
			writeData("countadd12", twelfthTime:getObjectID())
				twelfthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwelve, "target locked")
	
	        local pAddThirteen = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4934.2, 6.0, 4199.2, -88, 0)
			writeData(SceneObject(pAddThirteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddThirteen):getObjectID() .. ":name", "droid13")
			-- createEvent(360000, "theed_invasion", "despawnAddThirteen", pAddThirteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddThirteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddThirteen)
			--AiAgent(pAddThirteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddThirteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddThirteen, function(thirteenthTime)
			writeData("countadd13", thirteenthTime:getObjectID())
				thirteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddThirteen, "target locked")
			
		    local pAddFourteen = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4934.2, 6.0, 4200.2, -88, 0)
			writeData(SceneObject(pAddFourteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFourteen):getObjectID() .. ":name", "droid14")
			-- createEvent(360000, "theed_invasion", "despawnAddFourteen", pAddFourteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFourteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFourteen)
			--
			--AiAgent(pAddFourteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFourteen, function(fourteenthTime)
			writeData("countadd14", fourteenthTime:getObjectID())
				fourteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFourteen, "target locked")
			
		    local pAddFifteen = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4934.2, 6.0, 4201.2, -88, 0)
			writeData(SceneObject(pAddFifteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddFifteen):getObjectID() .. ":name", "droid15")
			-- createEvent(360000, "theed_invasion", "despawnAddFifteen", pAddFifteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddFifteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddFifteen)
			--
			--AiAgent(pAddFifteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddFifteen, function(fifteenthTime)
			writeData("countadd15", fifteenthTime:getObjectID())
				fifteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddFifteen, "target locked")
			
			local pAddSixteen = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4931.2, 6, 4201, -88, 0)
			--writeData(SceneObject(pAddSixteen):getObjectID() .. ":currentLoc", 1)
			--writeStringData(SceneObject(pAddSixteen):getObjectID() .. ":name", "droid16")
			-- createEvent(360000, "theed_invasion", "despawnAddSixteen", pAddSixteen,"")
			--createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSixteen, "")
			--createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSixteen)
			----AiAgent(pAddSixteen):setAiTemplate("manualescortwalk")
			----AiAgent(pAddSixteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSixteen, function(sixteenthTime)
			writeData("countadd16", sixteenthTime:getObjectID())
				sixteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSixteen, "target locked")
			
			local pAddSeventeen = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4802.2, 6.0, 4103.2, -88, 0)
			writeData(SceneObject(pAddSeventeen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddSeventeen):getObjectID() .. ":name", "droid17")
			-- createEvent(360000, "theed_invasion", "despawnAddSeventeen", pAddSeventeen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddSeventeen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddSeventeen)
			--AiAgent(pAddSeventeen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddSeventeen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddSeventeen, function(seventeenthTime)
			writeData("countadd17", seventeenthTime:getObjectID())
				seventeenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddSeventeen, "target locked")
	
	        local pAddEighteen = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4802.2, 6.0, 4104.2, -88, 0)
			writeData(SceneObject(pAddEighteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddEighteen):getObjectID() .. ":name", "droid18")
			-- createEvent(360000, "theed_invasion", "despawnAddEighteen", pAddEighteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddEighteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddEighteen)
			
			--AiAgent(pAddEighteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddEighteen, function(eighteenthTime)
			writeData("countadd18", eighteenthTime:getObjectID())
				eighteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddEighteen, "target locked")
			
		    local pAddNineteen = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4802.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddNineteen):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddNineteen):getObjectID() .. ":name", "droid19")
			-- createEvent(360000, "theed_invasion", "despawnAddNineteen", pAddNineteen,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddNineteen, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddNineteen)
			--AiAgent(pAddNineteen):setAiTemplate("manualescortwalk")
			--AiAgent(pAddNineteen):setFollowState(4)
			ObjectManager.withCreatureObject(pAddNineteen, function(nineteenthTime)
			writeData("countadd19", nineteenthTime:getObjectID())
				nineteenthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddNineteen, "target locked")
			
		    local pAddTwenty = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4802.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwenty):getObjectID() .. ":name", "droid20")
			-- createEvent(360000, "theed_invasion", "despawnAddTwenty", pAddTwenty,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwenty, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwenty)
			--AiAgent(pAddTwenty):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwenty):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwenty, function(twentiethTime)
			writeData("countadd20", twentiethTime:getObjectID())
				twentiethTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwenty, "target locked")
			
		    local pAddTwentyone = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4837.2, 6.0, 4105.2, -88, 0)
			writeData(SceneObject(pAddTwentyone):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyone):getObjectID() .. ":name", "droid21")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyone", pAddTwentyone,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyone, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyone)
			--AiAgent(pAddTwentyone):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyone):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyone, function(twentyfirstTime)
			writeData("countadd21", twentyfirstTime:getObjectID())
				twentyfirstTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyone, "target locked")
			
		    local pAddTwentytwo = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4837.2, 6.0, 4106.2, -88, 0)
			writeData(SceneObject(pAddTwentytwo):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentytwo):getObjectID() .. ":name", "droid22")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentytwo", pAddTwentytwo,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentytwo, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentytwo)
			--AiAgent(pAddTwentytwo):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentytwo):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentytwo, function(twentysecondTime)
			writeData("countadd22", twentysecondTime:getObjectID())
				twentysecondTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentytwo, "target locked")
			
		    local pAddTwentythree = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4837.2, 6.0, 4107.2, -88, 0)
			writeData(SceneObject(pAddTwenty):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentythree):getObjectID() .. ":name", "droid23")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentythree", pAddTwentythree,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentythree, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentythree)
			--AiAgent(pAddTwentythree):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentythree):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentythree, function(twentythirdTime)
			writeData("countadd23", twentythirdTime:getObjectID())
				twentythirdTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentythree, "target locked")
			
		    local pAddTwentyfour = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4837.2, 6.0, 4108.2, -88, 0)
			writeData(SceneObject(pAddTwentyfour):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfour):getObjectID() .. ":name", "droid24")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfour", pAddTwentyfour,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfour, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfour)
			--AiAgent(pAddTwentyfour):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfour):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfour, function(twentyfourthTime)
			writeData("countadd24", twentyfourthTime:getObjectID())
				twentyfourthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfour, "target locked")
			
			local pAddTwentyfive = spawnMobile("naboo", "pylon_troop_reb_aa", 0, -4837.2, 6.0, 4109.2, -88, 0)
			writeData(SceneObject(pAddTwentyfive):getObjectID() .. ":currentLoc", 1)
			writeStringData(SceneObject(pAddTwentyfive):getObjectID() .. ":name", "droid25")
			-- createEvent(360000, "theed_invasion", "despawnAddTwentyfive", pAddTwentyfive,"")
			createEvent(getRandomNumber(350,450) * 100, "theed_invasion", "droidPatrol", pAddTwentyfive, "")
			createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAddTwentyfive)
			--AiAgent(pAddTwentyfive):setAiTemplate("manualescortwalk")
			--AiAgent(pAddTwentyfive):setFollowState(4)
			ObjectManager.withCreatureObject(pAddTwentyfive, function(twentyfifthTime)
			writeData("countadd25", twentyfifthTime:getObjectID())
				twentyfifthTime:engageCombat(pPlayer)
			end)
			spatialChat(pAddTwentyfive, "target locked")
			
  return 0
end

function theed_invasion:spawnRey()
	local rey = spawnMobile("naboo", "skywalker_pvp", 0, -4864, 6, 4155, -88, 0)
	if rey ~= nil then
		spatialChat(rey, "Be with me")
		createEvent(60 * 30 * 1000, "theed_invasion", "removeObject", rey, "")
	end
end

function theed_invasion:removeObject(pObject)
	if pObject ~= nil then
		destroyObjectFromWorld(pObject)
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--[[theed_invasion = ScreenPlay:new {
    numberOfActs = 1,
    screenplayName = "theed_invasion"
}

registerScreenPlay("theed_invasion", true)

function theed_invasion:start()
    if isZoneEnabled("naboo") then
        self:spawnSceneObjects()
        self:spawnMobiles()
    end
end

function theed_invasion:spawnSceneObjects()
    -- Add any scene objects if required
end

function theed_invasion:spawnMobiles()
    -- Initial spawn points and mobile setups
end

function theed_invasion:notifyWaveone(pTrigger, pPlayer)
    local positions = {{-4929.2, 6.0, 4068.2}, {-4929.2, 6.0, 4069.2}, {-4929.2, 6.0, 4070.2},
                       {-4929.2, 6.0, 4071.2}, {-4929.2, 6.0, 4072.2}, {-4961.2, 6.0, 4104.2},
                       {-4961.2, 6.0, 4105.2}, {-4961.2, 6.0, 4106.2}, {-4961.2, 6.0, 4107.2},
                       {-4961.2, 6.0, 4108.2}, {-4934.2, 6.0, 4197.2}, {-4934.2, 6.0, 4198.2},
                       {-4934.2, 6.0, 4199.2}, {-4934.2, 6.0, 4200.2}, {-4934.2, 6.0, 4201.2}}

    for i = 1, #positions do
        local pAdd = spawnMobile("naboo", "stormtrooper", 0, positions[i][1], positions[i][2], positions[i][3], -88, 0)
        writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
        writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid" .. i)
        createEvent(290000, "theed_invasion", "despawnAdd", pAdd, "")
        createEvent(getRandomNumber(350, 450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
        createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
        --AiAgent(pAdd):setAiTemplate("manualescortwalk")
        --AiAgent(pAdd):setFollowState(4)
        ObjectManager.withCreatureObject(pAdd, function(creature)
            writeData("countadd" .. i, creature:getObjectID())
            creature:engageCombat(pPlayer)
        end)
        spatialChat(pAdd, "target locked")
    end
    return 0
end

function theed_invasion:notifyWavetwo(pTrigger, pPlayer)
    local positions = {{-4929.2, 6.0, 4068.2}, {-4929.2, 6.0, 4069.2}, {-4929.2, 6.0, 4070.2},
                       {-4929.2, 6.0, 4071.2}, {-4929.2, 6.0, 4072.2}, {-4961.2, 6.0, 4104.2},
                       {-4961.2, 6.0, 4105.2}, {-4961.2, 6.0, 4106.2}, {-4961.2, 6.0, 4107.2},
                       {-4961.2, 6.0, 4108.2}, {-4934.2, 6.0, 4197.2}, {-4934.2, 6.0, 4198.2},
                       {-4934.2, 6.0, 4199.2}, {-4934.2, 6.0, 4200.2}, {-4934.2, 6.0, 4201.2}}

    for i = 1, #positions do
        local pAdd = spawnMobile("naboo", "stormtrooper_squad_leader", 0, positions[i][1], positions[i][2], positions[i][3], -88, 0)
        writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
        writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid" .. i)
        createEvent(290000, "theed_invasion", "despawnAdd", pAdd, "")
        createEvent(getRandomNumber(350, 450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
        createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
        --AiAgent(pAdd):setAiTemplate("manualescortwalk")
        --AiAgent(pAdd):setFollowState(4)
        ObjectManager.withCreatureObject(pAdd, function(creature)
            writeData("countadd" .. i, creature:getObjectID())
            creature:engageCombat(pPlayer)
        end)
        spatialChat(pAdd, "target locked")
    end
    return 0
end

function theed_invasion:notifyWavethree(pTrigger, pPlayer)
    local positions = {{-4929.2, 6.0, 4068.2}, {-4929.2, 6.0, 4069.2}, {-4929.2, 6.0, 4070.2},
                       {-4929.2, 6.0, 4071.2}, {-4929.2, 6.0, 4072.2}, {-4961.2, 6.0, 4104.2},
                       {-4961.2, 6.0, 4105.2}, {-4961.2, 6.0, 4106.2}, {-4961.2, 6.0, 4107.2},
                       {-4961.2, 6.0, 4108.2}, {-4934.2, 6.0, 4197.2}, {-4934.2, 6.0, 4198.2},
                       {-4934.2, 6.0, 4199.2}, {-4934.2, 6.0, 4200.2}, {-4934.2, 6.0, 4201.2},
                       {-4802.2, 6.0, 4102.2}, {-4802.2, 6.0, 4103.2}, {-4802.2, 6.0, 4104.2},
                       {-4802.2, 6.0, 4105.2}, {-4802.2, 6.0, 4106.2}}

    for i = 1, #positions do
        local pAdd = spawnMobile("naboo", "stormtrooper_commando", 0, positions[i][1], positions[i][2], positions[i][3], -88, 0)
        writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
        writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid" .. i)
        createEvent(290000, "theed_invasion", "despawnAdd", pAdd, "")
        createEvent(getRandomNumber(350, 450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
        createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
        --AiAgent(pAdd):setAiTemplate("manualescortwalk")
        --AiAgent(pAdd):setFollowState(4)
        ObjectManager.withCreatureObject(pAdd, function(creature)
            writeData("countadd" .. i, creature:getObjectID())
            creature:engageCombat(pPlayer)
        end)
        spatialChat(pAdd, "target locked")
    end
    return 0
end

function theed_invasion:notifyWavefour(pTrigger, pPlayer)
    local positions = {{-4929.2, 6.0, 4068.2}, {-4929.2, 6.0, 4069.2}, {-4929.2, 6.0, 4070.2},
                       {-4929.2, 6.0, 4071.2}, {-4929.2, 6.0, 4072.2}, {-4961.2, 6.0, 4104.2},
                       {-4961.2, 6.0, 4105.2}, {-4961.2, 6.0, 4106.2}, {-4961.2, 6.0, 4107.2},
                       {-4961.2, 6.0, 4108.2}, {-4934.2, 6.0, 4197.2}, {-4934.2, 6.0, 4198.2},
                       {-4934.2, 6.0, 4199.2}, {-4934.2, 6.0, 4200.2}, {-4934.2, 6.0, 4201.2},
                       {-4802.2, 6.0, 4102.2}, {-4802.2, 6.0, 4103.2}, {-4802.2, 6.0, 4104.2},
                       {-4802.2, 6.0, 4105.2}, {-4802.2, 6.0, 4106.2}, {-4837.2, 6.0, 4105.2},
                       {-4837.2, 6.0, 4106.2}, {-4837.2, 6.0, 4107.2}, {-4837.2, 6.0, 4108.2},
                       {-4837.2, 6.0, 4109.2}}

    for i = 1, #positions do
        local pAdd = spawnMobile("naboo", "specops_trooper", 0, positions[i][1], positions[i][2], positions[i][3], -88, 0)
        writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
        writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid" .. i)
        createEvent(290000, "theed_invasion", "despawnAdd", pAdd, "")
        createEvent(getRandomNumber(350, 450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
        createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
        --AiAgent(pAdd):setAiTemplate("manualescortwalk")
        --AiAgent(pAdd):setFollowState(4)
        ObjectManager.withCreatureObject(pAdd, function(creature)
            writeData("countadd" .. i, creature:getObjectID())
            creature:engageCombat(pPlayer)
        end)
        spatialChat(pAdd, "target locked")
    end
    return 0
end

function theed_invasion:notifyWavefive(pTrigger, pPlayer)
    local positions = {{-4929.2, 6.0, 4068.2}, {-4929.2, 6.0, 4069.2}, {-4929.2, 6.0, 4070.2},
                       {-4929.2, 6.0, 4071.2}, {-4929.2, 6.0, 4072.2}, {-4961.2, 6.0, 4104.2},
                       {-4961.2, 6.0, 4105.2}, {-4961.2, 6.0, 4106.2}, {-4961.2, 6.0, 4107.2},
                       {-4961.2, 6.0, 4108.2}, {-4934.2, 6.0, 4197.2}, {-4934.2, 6.0, 4198.2},
                       {-4934.2, 6.0, 4199.2}, {-4934.2, 6.0, 4200.2}, {-4934.2, 6.0, 4201.2},
                       {-4802.2, 6.0, 4102.2}, {-4802.2, 6.0, 4103.2}, {-4802.2, 6.0, 4104.2},
                       {-4802.2, 6.0, 4105.2}, {-4802.2, 6.0, 4106.2}, {-4837.2, 6.0, 4105.2},
                       {-4837.2, 6.0, 4106.2}, {-4837.2, 6.0, 4107.2}, {-4837.2, 6.0, 4108.2},
                       {-4837.2, 6.0, 4109.2}}

    for i = 1, #positions do
        local pAdd = spawnMobile("naboo", "pylon_troop_reb_aa", 0, positions[i][1], positions[i][2], positions[i][3], -88, 0)
        writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
        writeStringData(SceneObject(pAdd):getObjectID() .. ":name", "droid" .. i)
        createEvent(2290000, "theed_invasion", "despawnAdd", pAdd, "")
        createEvent(getRandomNumber(350, 450) * 100, "theed_invasion", "droidPatrol", pAdd, "")
        createObserver(DESTINATIONREACHED, "theed_invasion", "retreatPatrolDestReached", pAdd)
        --AiAgent(pAdd):setAiTemplate("manualescortwalk")
        --AiAgent(pAdd):setFollowState(4)
        ObjectManager.withCreatureObject(pAdd, function(creature)
            writeData("countadd" .. i, creature:getObjectID())
            creature:engageCombat(pPlayer)
        end)
        spatialChat(pAdd, "target locked")
    end
    createEvent(3000000, "theed_invasion", "notifyTriggerDead", pTrigger, "")
    return 0
end

function theed_invasion:spawnRey()
    local rey = spawnMobile("naboo", "skywalker_pvp", 0, -4864, 6, 4155, -88, 0)
    if rey ~= nil then
        spatialChat(rey, "Be with me")
        createEvent(60 * 30 * 1000, "theed_invasion", "removeObject", rey, "")
    end
end

function theed_invasion:removeObject(pObject)
    if pObject ~= nil then
        destroyObjectFromWorld(pObject)
    end
end

function theed_invasion:despawnAdd(pAdd)
    if pAdd ~= nil then
        destroyObjectFromWorld(pAdd)
    end
    return 0
end

function theed_invasion:retreatPatrolDestReached(pAdd)
    if pAdd ~= nil then
        local currentLoc = readData(SceneObject(pAdd):getObjectID() .. ":currentLoc")
        if currentLoc == 1 then
            writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 2)
            local patrolPoint = {-4859, 6, 4160}
            SceneObject(pAdd):travelTo(patrolPoint[1], patrolPoint[2], patrolPoint[3])
        else
            writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
            local patrolPoint = {-4929, 6, 4068}
            SceneObject(pAdd):travelTo(patrolPoint[1], patrolPoint[2], patrolPoint[3])
        end
    end
    return 0
end

function theed_invasion:droidPatrol(pAdd)
    if pAdd ~= nil then
        local currentLoc = readData(SceneObject(pAdd):getObjectID() .. ":currentLoc")
        local patrolPoint = {}
        if currentLoc == 1 then
            patrolPoint = {-4859, 6, 4160}
            writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 2)
        else
            patrolPoint = {-4929, 6, 4068}
            writeData(SceneObject(pAdd):getObjectID() .. ":currentLoc", 1)
        end
        SceneObject(pAdd):travelTo(patrolPoint[1], patrolPoint[2], patrolPoint[3])
    end
    return 0
end

function theed_invasion:notifyTriggerDead(pTrigger)
    if pTrigger ~= nil then
        destroyObjectFromWorld(pTrigger)
        spatialChat(pTrigger, "Trigger deactivated.")
    end
    return 0
end]]