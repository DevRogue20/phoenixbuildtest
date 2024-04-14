-- Importing required modules
local ObjectManager = require("managers.object.object_manager")

-- Define the Jedi Trials screenplay object
jedi_test = ScreenPlay:new {
    numberOfActs = 1,
    screenplayName = "jedi_test",
    states = {
        1, -- Intro   May need more states...
        2, -- Trial 1
        4, -- Trial 2
        8, -- Trial 3
        16, -- Trial 4
        32, -- Trial 5
        64,  -- Assign Jedi
        128 -- Fail
    },
    huntTarget = {"tusken_raider"}, -- Target creature to hunt
}

-- Register the Jedi Trials screenplay
registerScreenPlay("jedi_test", true)

-- Define targetCount as a standalone variable
--local targetCount = tonumber(readScreenPlayData(pPlayer, "jedi_test", "huntTargetCount")) or 0
-- Start function of the Jedi Trials screenplay
function jedi_test:start()
    -- Spawn scene objects and mobiles
    self:spawnSceneObjects()
    -- Create observer for killed creatures
    createObserver(KILLEDCREATURE, "jedi_test", "targetKills", pVictim)
    print("KILLEDCREATURE active")
end

-- Function to spawn scene objects and mobiles
function jedi_test:spawnSceneObjects()
    -- Spawn active area
    local pActiveAreaOne = spawnActiveArea("corellia", "object/active_area.iff", -145.7, 28, -4713.8, 10, 0)
    if pActiveAreaOne ~= nil then
        -- Create observer for when a player enters the active area
        createObserver(ENTEREDAREA, "jedi_test", "notifyEnteredAreaOne", pActiveAreaOne)
        print("Enter Observer created")
    end
    return 0
end

-- Function to notify when a player enters an area
function jedi_test:notifyEnteredAreaOne(pActiveAreaOne, pPlayer)
    print("jedi_test:notifyEnteredAreaOne function started")
    if pPlayer == nil or pActiveAreaOne == nil or not SceneObject(pPlayer):isPlayerCreature() then
        return 0
    end

    if not (CreatureObject(pPlayer):hasScreenPlayState(1, "jedi_test")) then
        return 0
    end

    local pGhost = CreatureObject(pPlayer):getPlayerObject()
    if pGhost ~= nil then
        -- Spawn a mobile if the player is valid
        local pMobile = spawnMobile("corellia", "obiwan_test", 1, -145.7, 28, -4713.8, 107, 0, "calm")
        createEvent (5 * 60 * 1000, "jedi_test", "removeMobile", pMobile, "") -- add back in after you get your shit to work right
    end
    return 1
end

-- Function to remove spawned mobile
function jedi_test:removeMobile(pMobile)
    if pMobile ~= nil then
        print("Mobile is active")
        SceneObject(pMobile):destroyObjectFromWorld()
        print("Mobile deleted")
    else
        print("Mobile? What Mobile?")
    end
    return 0
end

--- Function to handle target kills
function jedi_test:targetKills(pPlayer, pVictim)
    print("targetKills activated")
    if CreatureObject(pVictim) ~= nil then
        print("Victim is not nil")
        
        if CreatureObject(pVictim):getCreatureObject():getTemplate() == huntTarget then
            -- Send system message to player
            CreatureObject(pPlayer):sendSystemMessage("@jedi_trials:padawan_trials_progress")
            -- Increment target count
            targetCount = targetCount + 1
            writeScreenPlayData(pPlayer, "jedi_test", "huntTargetCount", tostring(targetCount))
            -- Check if target count meets the goal
            if targetCount >= targetGoal then
                -- Send system message to player
                CreatureObject(pPlayer):sendSystemMessage("@jedi_trials:padawan_trials_return_to_npc")
                -- Transition to the next stage of Jedi Trials
                CreatureObject(pPlayer):removeScreenPlayState(2, "jedi_test")
                CreatureObject(pPlayer):setScreenPlayState(4, "jedi_test")
                return 1
            end
        else
            print("Victim is not the hunt target")
        end
    else
        print("Victim is nil")
    end
    return 0
end

