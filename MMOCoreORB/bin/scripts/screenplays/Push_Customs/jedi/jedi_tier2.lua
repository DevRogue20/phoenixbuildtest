--[[Project Phoenix Jedi quest written by Push

-- Import required modules
local ObjectManager = require("managers.object.object_manager")

-- Define the jedi_tier2 screenplay
jedi_tier2 = ScreenPlay:new {
    scriptName = "jedi_tier2",
    waypointName = "Choose your Destiny",
    npcTemplate = "darian_veilwalker", -- Change this to the actual NPC template
    questStartedState = 1, -- Screenplay state for quest started
    questCompletedState = 2, -- Screenplay state for quest completed
    npcLocation = { -- Define the NPC location
        x = -493.6, -- Change these coordinates to the actual location
        z = 28,
        y = -4307.6,
        planet = "corellia"
    }
}

-- Register the screenplay
registerScreenPlay("jedi_tier2", true)

-- Initialization
function jedi_tier2:start()
    self:spawnMobiles()
end

function jedi_tier2:spawnMobiles()
    local pDarian = spawnMobile("corellia", self.npcTemplate, 1, self.npcLocation.x, self.npcLocation.z, self.npcLocation.y, -90, 0, "calm")
    if pDarian == nil then
        print("Error spawning Darian Veilwalker")
    else
        -- Register radialUsed observer on Darian Veilwalker
        createObserver(OBJECTRADIALUSED, self.scriptName, "onRadialUsed", pDarian)
    end
end

-- Helper function to create a waypoint
function jedi_tier2:createWaypoint(pPlayer, location)
    local pGhost = CreatureObject(pPlayer):getPlayerObject()
    
    local waypoint = PlayerObject(pGhost):addWaypoint(self.npcLocation.planet, self.waypointName, "", self.npcLocation.x, self.npcLocation.y, WAYPOINTPURPLE, true, true, 0, 0)
    writeScreenPlayData(SceneObject(pPlayer):getObjectID() .. ":jedi_tier2:darianwp", waypoint)
    
    return waypoint
end

-- Helper function to destroy a waypoint
function jedi_tier2:destroyWaypoint(pPlayer, waypoint)
    local pGhost = CreatureObject(pPlayer):getPlayerObject()
    local oldWP = readScreenPlayData(SceneObject(pPlayer):getObjectID() .. ":jedi_tier2:darianwp")

    if oldWP ~= nil and oldWP > 0 then
        PlayerObject(pGhost):removeWaypoint(oldWP, true)
    end
end

-- Function to check if player has the required skill
function jedi_tier2:onPlayerLoggedIn(pPlayer)
    if CreatureObject(pPlayer):hasSkill("jedi_padawan_master") then
        -- Set the screenplay state if not already set
        if not CreatureObject(pPlayer):hasScreenPlayState(self.questStartedState, self.scriptName) then
            CreatureObject(pPlayer):setScreenPlayState(self.questStartedState, self.scriptName)
            
        --Create the waypoint
        local waypoint = self:createWaypoint(pPlayer, self.npcLocation)

        createEvent(30 * 1000, "jedi_tier2", "loginMessage", pPlayer)
    end
end

function jedi_tier2:loginMessage(pPlayer)
    -- Send system message to the player
    CreatureObject(pPlayer):sendSystemMessage("You have unlocked a new quest. Follow the waypoint to Darian Veilwalker to choose your Jedi path.")
end

-- Function to handle player entering the NPC area
function jedi_tier2:onPlayerEnteredArea(pPlayer, pA1)
    if CreatureObject(pPlayer):hasScreenPlayState(self.questStartedState, self.scriptName) and not CreatureObject(pPlayer):hasScreenPlayState(self.questCompletedState, self.scriptName) then
        -- Set the screenplay state to quest completed
        CreatureObject(pPlayer):setScreenPlayState(self.questCompletedState, self.scriptName)
        
        -- Destroy the waypoint
        self:destroyWaypoint()        
        
        -- Send system message to the player
        CreatureObject(pPlayer):sendSystemMessage("You have arrived at Darian Veilwalker. Talk to him to choose your Jedi path.")
    end
end]]

--------******************************

-- Project Phoenix Jedi quest written by Push

-- Import required modules
local ObjectManager = require("managers.object.object_manager")

-- Define the jedi_tier2 screenplay
jedi_tier2 = ScreenPlay:new {
    scriptName = "jedi_tier2",
    waypointName = "Choose your Destiny",
    npcTemplate = "darian_veilwalker", -- Change this to the actual NPC template
    questStartedState = 1, -- Screenplay state for quest started
    questCompletedState = 2, -- Screenplay state for quest completed
    npcLocation = { -- Define the NPC location
        x = -493.6, -- Change these coordinates to the actual location
        z = 28,
        y = -4307.6,
        planet = "corellia"
    }
}

-- Register the screenplay
registerScreenPlay("jedi_tier2", true)

-- Initialization
function jedi_tier2:start()
    self:spawnMobiles()
end

function jedi_tier2:spawnMobiles()
    local pDarian = spawnMobile("corellia", self.npcTemplate, 1, self.npcLocation.x, self.npcLocation.z, self.npcLocation.y, -90, 0, "calm")
    if pDarian == nil then
        print("Error spawning Darian Veilwalker")
    else
        -- Register radialUsed observer on Darian Veilwalker
        createObserver(RADIALUSED, self.scriptName, "onRadialUsed", pDarian)
    end
end

-- Helper function to create a waypoint
function jedi_tier2:createWaypoint(pPlayer, location)
    if pPlayer == nil or not SceneObject(pPlayer):isCreatureObject() then
        print("Invalid player object")
        return nil
    end
    
    local pGhost = CreatureObject(pPlayer):getPlayerObject()
    if pGhost == nil then
        print("Error retrieving player object")
        return nil
    end
    
    local waypoint = PlayerObject(pGhost):addWaypoint(self.npcLocation.planet, self.waypointName, "", self.npcLocation.x, self.npcLocation.y, WAYPOINTPURPLE, true, true, 0, 0)
    if waypoint == nil then
        print("Error creating waypoint")
        return nil
    end

    local waypointID = SceneObject(waypoint):getObjectID()
    writeScreenPlayData(SceneObject(pPlayer):getObjectID() .. ":jedi_tier2:darianwp", waypointID)
    print("Created waypoint with ID: " .. waypointID)
    return waypoint
end

-- Function to check if player has the required skill
function jedi_tier2:onPlayerLoggedIn(pPlayer)
    if CreatureObject(pPlayer):hasSkill("jedi_padawan_master") then
        -- Create the waypoint
        local waypoint = self:createWaypoint(pPlayer, self.npcLocation)
        if waypoint ~= nil then
            createEvent(30 * 1000, "jedi_tier2", "loginMessage", pPlayer)
        else
            print("Error creating waypoint for player " .. SceneObject(pPlayer):getObjectID())
        end
    end
end

function jedi_tier2:loginMessage(pPlayer)
    -- Send system message to the player
    CreatureObject(pPlayer):sendSystemMessage("You have unlocked a new quest. Follow the waypoint to Darian Veilwalker to choose your Jedi path.")
end

-- Function to handle player using radial on the NPC
function jedi_tier2:onRadialUsed(pNpc, pPlayer)
    if CreatureObject(pPlayer):hasScreenPlayState(self.questStartedState, self.scriptName) and not CreatureObject(pPlayer):hasScreenPlayState(self.questCompletedState, self.scriptName) then
        -- Set the screenplay state to quest completed
        CreatureObject(pPlayer):setScreenPlayState(self.questCompletedState, self.scriptName)
        
        local pGhost = CreatureObject(pPlayer):getPlayerObject()
        if pGhost == nil then
            print("Error retrieving player object in onRadialUsed")
            return 0
        end
        
        local playerID = SceneObject(pPlayer):getObjectID()
        local oldWP = readScreenPlayData(playerID .. ":jedi_tier2:darianwp")
        print("Retrieved waypoint ID: " .. tostring(oldWP))
        
        if oldWP ~= nil and oldWP > 0 then
            print("Removing waypoint with ID: " .. oldWP)
            PlayerObject(pGhost):removeWaypoint(oldWP, true)
        else
            print("No valid waypoint found to remove")
        end
        
        -- Send system message to the player
        CreatureObject(pPlayer):sendSystemMessage("You have arrived at Darian Veilwalker. Talk to him to choose your Jedi path.")
    end
    return 0
end
