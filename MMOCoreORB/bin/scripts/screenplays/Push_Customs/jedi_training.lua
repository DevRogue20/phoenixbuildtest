spHelper = require("screenplayHelper")
local ObjectManager = require("managers.object.object_manager")  --print("Object manager loaded for jedi_training")

jedi_training = ScreenPlay:new {
    numberOfActs = 1,
    screenplayName = "jedi_training",
    states = {}
}
registerScreenPlay("jedi_training", true)

function jedi_training:start()
    local pActiveArea = spawnSceneObject("dungeon2", "object/active_area.iff", 28.0, -4.2, 590.3, 0, 0, 0, 0, 0)
    
    if pActiveArea ~= nil then
        local activeArea = LuaActiveArea(pActiveArea)
        activeArea:setCellObjectID(0)
        activeArea:setRadius(128)
        createObserver(ENTEREDAREA, "jedi_training", "onEnterActiveArea", pActiveArea)
    end
end

local cooldownTime = 60 * 60 * 1000 -- 60 minutes in milliseconds

local lastEntryTimes = {} -- Table to store last entry times for each player

function jedi_training:onEnterActiveArea(pActiveArea, pMovingObject)
    if not SceneObject(pMovingObject):isCreatureObject() then
        return 0
    end
    
    local pPlayer = CreatureObject(pMovingObject)
    
    if not pPlayer then
        print("Player object is nil")
        return 0
    end
    
    print("Player object created")
    
    -- Check if pPlayer has getPlayerObject method to verify it's a player object
    if not pPlayer:getPlayerObject() then
        print("Player is not a player object")
        return 0
    end
    
    print("Player is a player object and not an AI agent")

	local playerId = pPlayer:getObjectID()
    local playerLastEntryTime = lastEntryTimes[playerId] or 0
    local currentTime = os.time() * 1000 -- Convert current time to milliseconds
    
    -- Check if player is still in cooldown period
    if currentTime - playerLastEntryTime < cooldownTime then
        local remainingCooldown = cooldownTime - (currentTime - playerLastEntryTime)
        local remainingMinutes = math.ceil(remainingCooldown / (60 * 1000)) -- Convert remaining milliseconds to minutes and round up
        
        pPlayer:sendSystemMessage("You must wait " .. remainingMinutes .. " minutes before entering the Jedi Training Area again.")
		createEvent(1 * 3 * 1000, "jedi_training", "onCooldown", pMovingObject, "")
        return 0
    end
    
    -- Update last entry time for the player
    lastEntryTimes[playerId] = currentTime
    
    pPlayer:sendSystemMessage("You have entered the Jedi Training Area. You have 15 minutes to perform your task before you are removed from the area!")
    createEvent(15 * 60 * 1000, "jedi_training", "onLeaveActiveArea", pMovingObject, "")
    print("onLeaveActiveArea event created.")
    
    return 0
end

function jedi_training:onLeaveActiveArea(pPlayer)
    print("Entering onLeaveActiveArea function")

    CreatureObject(pPlayer):sendSystemMessage("You have TIMED OUT of the Jedi Training Area.")
    SceneObject(pPlayer):switchZone("corellia", -151.0, 28.0, -4723.0, 0) -- Switch the player to a different zone
    
    print("Exiting onLeaveActiveArea function")
    return 0
end

function jedi_training:onCooldown(pPlayer)

	SceneObject(pPlayer):switchZone("corellia", -151.0, 28.0, -4723.0, 0)

	return 0
end