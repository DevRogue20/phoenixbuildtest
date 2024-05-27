spHelper = require("screenplayHelper")
local ObjectManager = require("managers.object.object_manager")  --print("Object manager loaded for jedi_training")

jedi_training = ScreenPlay:new {
    numberOfActs = 1,
    screenplayName = "jedi_training",
    states = {},
    defaultX = 28.0,
    defaultZ = -4.2,
    defaultY = -159.0,
    radius = 128 -- Radius for checking if player is within the active area
}
registerScreenPlay("jedi_training", true)

function jedi_training:start()
    local activeAreas = {
        { x = 28.0, y = -4.2, z = 590.3 },
        { x = 28.0, y = -4.2, z = 1591.3 },
        { x = 28.0, y = -4.2, z = 6841.3 }
    }

    for _, coords in ipairs(activeAreas) do
        local pActiveArea = spawnSceneObject("dungeon2", "object/active_area.iff", coords.x, coords.y, coords.z, 0, 0, 0, 0, 0)
        if pActiveArea ~= nil then
            local activeArea = LuaActiveArea(pActiveArea)
            activeArea:setCellObjectID(0)
            activeArea:setRadius(self.radius)
            createObserver(ENTEREDAREA, "jedi_training", "onEnterActiveArea", pActiveArea)
        end
    end
end

local cooldownTime = 1 * 60 * 1000 -- 1 minute in milliseconds for testing

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

    --[[if pPlayer:hasSkill("admin_base") then
        pPlayer:sendSystemMessage("You have entered the Jedi Training Area as an admin. Timer is disabled for you.")
        return 0
    end]]

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
    createEvent(1 * 60 * 1000, "jedi_training", "onLeaveActiveArea", pMovingObject, "")
    print("onLeaveActiveArea event created.")
    
    return 0
end

function jedi_training:isPlayerInActiveArea(pPlayer)
    local playerX = SceneObject(pPlayer):getPositionX()
    local playerY = SceneObject(pPlayer):getPositionY()
    local playerZ = SceneObject(pPlayer):getPositionZ()
    
    -- Calculate distance from default coordinates
    local distance = math.sqrt((playerX - self.defaultX)^2 + (playerY - self.defaultY)^2 + (playerZ - self.defaultZ)^2)
    print("Player coordinates: x=" .. playerX .. ", y=" .. playerY .. ", z=" .. playerZ)
    print("Calculated distance to default coordinates: " .. distance)

    return distance <= self.radius
end

function jedi_training:onLeaveActiveArea(pPlayer)
    print("Entering onLeaveActiveArea function")
    
    if not self:isPlayerInActiveArea(pPlayer) then
        print("Player is outside of the active area. Teleport aborted.")
        return 0
    end

    CreatureObject(pPlayer):sendSystemMessage("You have TIMED OUT of the Jedi Training Area.")
    SceneObject(pPlayer):switchZone("corellia", -151.0, 28.0, -4723.0, 0) -- Switch the player to a different zone
    
    print("Exiting onLeaveActiveArea function")
    return 0
end

function jedi_training:onCooldown(pPlayer)

	SceneObject(pPlayer):switchZone("corellia", -151.0, 28.0, -4723.0, 0)

	return 0
end