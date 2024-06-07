--Project Phoenix Jedi quest written by Push

-- Import required modules
local ObjectManager = require("managers.object.object_manager")

-- Define the jedi_tier2 screenplay
jedi_tier2 = ScreenPlay:new {
    scriptName = "jedi_tier2",
    waypointName = "Choose your Destiny",
    npcTemplate = "darian_veilwalker", -- Change this to the actual NPC template
    npcLocation = { -- Define the NPC location
        x = -493.6, -- Change these coordinates to the actual location
        z = 28,
        y = -4307.6,
        planet = "corellia"
    },
    states = {
        1,
        2,
        4,
        8,
        16,
        32
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
        --print("Error spawning Darian Veilwalker")
    else
        -- Register radialUsed observer on Darian Veilwalker
        createObserver(STARTCONVERSATION, self.scriptName, "onRadialUsed", pDarian)
    end
end

-- Check for skill and decide what to do with it
function jedi_tier2:checkPlayerStatus(pPlayer)
    if CreatureObject(pPlayer) == nil then
        return 0
    end

    if CreatureObject(pPlayer):hasSkill("jedi_padawan_master") then
        -- Set the screenplay state if not already set
        if not CreatureObject(pPlayer):hasScreenPlayState(1, "jedi_tier2") then
            CreatureObject(pPlayer):setScreenPlayState(1, "jedi_tier2")
                
            -- Create the waypoint
            local waypoint = self:createWaypoint(pPlayer, self.npcLocation)
            CreatureObject(pPlayer):sendSystemMessage("You have unlocked a new quest. Follow the waypoint to Darian Veilwalker to choose your Jedi path.")
        end
    end
    return 1
end

-- Helper function to create a waypoint
function jedi_tier2:createWaypoint(pPlayer, location)
    local pGhost = CreatureObject(pPlayer):getPlayerObject()
    local waypointID = PlayerObject(pGhost):addWaypoint(self.npcLocation.planet, self.waypointName, "", self.npcLocation.x, self.npcLocation.y, WAYPOINTPURPLE, true, true, 0, 0)
    local playerID = SceneObject(pPlayer):getObjectID()

    --print("Storing waypoint ID: " .. tostring(waypointID) .. " for player: " .. tostring(playerID))
    setQuestStatus(playerID .. ":jedi_tier2_darianwp", tostring(waypointID))

    -- Immediately read back the stored value for debugging
    local storedWaypointID = getQuestStatus(playerID .. ":jedi_tier2_darianwp")
    --print("Immediately retrieved waypoint ID: " .. tostring(storedWaypointID) .. " for player: " .. tostring(playerID))
    
    return waypointID
end

-- Helper function to destroy a waypoint
function jedi_tier2:destroyWaypoint(pPlayer)
    local pGhost = CreatureObject(pPlayer):getPlayerObject()
    local playerID = SceneObject(pPlayer):getObjectID()
    local oldWP = getQuestStatus(playerID .. ":jedi_tier2_darianwp")

    --print("Retrieved waypoint ID from storage: " .. tostring(oldWP) .. " for player: " .. tostring(playerID))

    oldWP = tonumber(oldWP)

    if oldWP ~= nil and oldWP > 0 then
        PlayerObject(pGhost):removeWaypoint(oldWP, true)
        removeQuestStatus(playerID .. ":jedi_tier2_darianwp")
    --else
        --print("No valid waypoint found to remove")
    end
end

-- Function to check if player has the required skill upon login
function jedi_tier2:onPlayerLoggedIn(pPlayer)
    local pGhost = CreatureObject(pPlayer):getPlayerObject()
    if CreatureObject(pPlayer):hasSkill("jedi_dark_side_master_master") or CreatureObject(pPlayer):hasSkill("jedi_light_side_master_master") then
        return 0
    end
    if CreatureObject(pPlayer):hasSkill("jedi_padawan_master") then
        -- Check if the player already has screenplay state 4 or 8
        if CreatureObject(pPlayer):hasScreenPlayState(4, "jedi_tier2") or CreatureObject(pPlayer):hasScreenPlayState(8, "jedi_tier2") then
            local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
            local item = getContainerObjectByTemplate(pInventory, "object/tangible/jedi/five_masters.iff", true)

            if item ~= nil then
                SceneObject(item):destroyObjectFromWorld()
                SceneObject(item):destroyObjectFromDatabase()
            end
            return 0
        end

        -- Set the screenplay state if not already set
        if not CreatureObject(pPlayer):hasScreenPlayState(1, "jedi_tier2") then
            CreatureObject(pPlayer):setScreenPlayState(1, "jedi_tier2")
            
            -- Create the waypoint
            local waypoint = self:createWaypoint(pPlayer, self.npcLocation)

            createEvent(15 * 1000, "jedi_tier2", "loginMessage", pPlayer, "")
        end
    end
end

function jedi_tier2:loginMessage(pPlayer)
    -- Send system message to the player
    CreatureObject(pPlayer):sendSystemMessage("You have unlocked a new quest. Follow the waypoint to Darian Veilwalker to choose your Jedi path.")
end

-- Function to handle player using radial on the NPC
function jedi_tier2:onRadialUsed(pNpc, pPlayer)
    local pGhost = CreatureObject(pPlayer):getPlayerObject()
    if pGhost == nil then
        --print("Error retrieving player object in onRadialUsed")
        return 0
    end
    
    -- Destroy the waypoint
    self:destroyWaypoint(pPlayer)
    
    -- Additional logic for handling the conversation or quest progression can go here
    
    return 0
end