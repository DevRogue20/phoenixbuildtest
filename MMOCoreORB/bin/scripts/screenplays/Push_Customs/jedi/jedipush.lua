-- Import required modules
local ObjectManager = require("managers.object.object_manager")
-- Define the trialData table directly in the screenplay Lua code
local trials = {
    trialName = "trial_one",
    target = "tusken_raider",
    goal = 1,
    nsTrialName = "trial_two",
    nsTarget = "nightsister_elder",
    nsGoal = 1,
    aTrialName = "trial_three",
    aTarget = "geonosian_acklay_bunker_boss",
    aGoal = 1,
    kTrialName = "trial_four",
    kTarget = "krayt_dragon_ancient",
    kGoal = 1,
}

-- Define Jedi Trials screenplay object
jedipush = ScreenPlay:new {
    numberOfActs = 1,
    screenplayName = "jedipush",
    states = {
        1, -- Intro   May need more states...
        2, -- Trial 1
        4, -- Trial 2
        8, -- Trial 3
        16, -- Trial 4
        32, -- Trial 5
        64,  -- Assign Jedi
        128, -- Fail
        256,
        512,
        1024
    },
}

-- Register the Jedi Trials screenplay
registerScreenPlay("jedipush", true)

-- Register the Jedi Trials screenplay
registerScreenPlay("jedipush", true)

-- Serialize screenplay states
function jedipush:serializeStates()
    local serializedData = {}
    for _, state in ipairs(self.states) do
        if self:hasState(state) then
            table.insert(serializedData, state)
        end
    end
    return serializedData
end

-- Deserialize screenplay states
function jedipush:deserializeStates(serializedData)
    print("Serialized Data:", serializedData)
    for _, state in ipairs(serializedData) do
        self:setState(state)
    end
end

-- Start function of the Jedi Trials screenplay
function jedipush:start()
    -- Spawn scene objects and mobiles
    self:spawnMobiles()
    
end

-- Function to notify when a player enters an area
function jedipush:spawnMobiles()
    -- Spawn a mobile if the player is valid
    local pMobile = spawnMobile("dantooine", "obiwan_test", 1, 4194, 9, 5201, 24, 0, "calm")
end

-- Function to start a trial for a player
function jedipush:startTrial(pPlayer)
    print("trial start activated")
    if CreatureObject(pPlayer):hasScreenPlayState(2, "jedipush") then
        print("screenplaystate 2")
    -- Access trial data directly from the trials table
    local trialName = trials.trialName
    local target = trials.target
    local goal = trials.goal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage("Trial 1: Tusken Slayer")

    -- Store trial data for the player
    writeScreenPlayData(pPlayer, "jedipush", "currentTrial", trialName)
    writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", 0)
    -- Register observer for killed creatures
    createObserver(KILLEDCREATURE, "jedipush", "targetdestroyed", pPlayer)
            print("KILLEDCREATURE active")
        end
    return 1
end

-- Function to remove spawned mobile
function jedipush:removeMobile(pMobile)
    if pMobile ~= nil then
        print("Mobile is active")
        SceneObject(pMobile):destroyObjectFromWorld()
        print("Mobile deleted")
    else
        print("Mobile? What Mobile?")
    end
    return 0
end

-- Function to handle target kills
function jedipush:targetdestroyed(pPlayer, pVictim)
    print("targetdestroyed activated")
    if (pVictim == nil or pPlayer == nil) then
		return 0
	end

    local currentTrial = readScreenPlayData(pPlayer, "jedipush", "currentTrial")
    if currentTrial == nil then
        print("currentTrial is nil")
        return 0
    end

    print("Current Trial:", currentTrial)

    -- Access trial data directly from the trials table
    local target = trials.target
    local goal = trials.goal

    -- Check if the player is currently engaged in a trial
    if target ~= nil then
        print("Player is engaged in a trial")

        -- Check if the victim is one of the targets for the current trial
        if target == SceneObject(pVictim):getObjectName() then
            print("Victim is a target for the current trial")

            -- Increment target count
            local targetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0
            targetCount = targetCount + 1
            writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", tostring(targetCount))

            print("Target Count:", targetCount)

            -- Send a system message to the player about the target kill count
            CreatureObject(pPlayer):sendSystemMessage("You have defeated " .. targetCount .. " out of " .. goal .. " targets for this trial.")

            -- Check if target count meets the goal
            if targetCount >= goal then
                print("Goal reached!")
                -- Remove the huntTargetCount data
                deleteScreenPlayData(pPlayer, "jedipush", "huntTargetCount")
                -- Transition to the next trial
                CreatureObject(pPlayer):removeScreenPlayState(2, "jedipush")
                CreatureObject(pPlayer):setScreenPlayState(4, "jedipush")
                print("sreenplaystate 2 removed and 4 set")
                dropObserver(KILLEDCREATURE, "jedipush", "targetdestroyed", pPlayer)
                print("KILLEDCREATURE dropped")
                CreatureObject(pPlayer):sendSystemMessage("Seek out the Force essence for your next trial")
            end
        end
    end
    return 0
end

-- Function to start ns trial for a player
function jedipush:startnsTrial(pPlayer)
    print("nstrial start activated")
    if CreatureObject(pPlayer):hasScreenPlayState(8, "jedipush") then
        print("screenplaystate 8")
    -- Access trial data directly from the trials table
    local trialName = trials.nsTrialName
    local target = trials.nsTarget
    local goal = trials.nsGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage("Trial 2: The Witches of Dathomir")

    -- Store trial data for the player
    writeScreenPlayData(pPlayer, "jedipush", "currentTrial", trialName)
    writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", 0)
    -- Register observer for killed creatures
    createObserver(KILLEDCREATURE, "jedipush", "nstargetdestroyed", pPlayer)
            print("KILLEDCREATURE active")
        end
    return 1
end

-- Function to handle ns target kills
function jedipush:nstargetdestroyed(pPlayer, pVictim)
    print("nstargetdestroyed activated")
    if (pVictim == nil or pPlayer == nil) then
		return 0
	end

    local currentTrial = readScreenPlayData(pPlayer, "jedipush", "currentTrial")
    if currentTrial == nil then
        print("currentTrial is nil")
        return 0
    end

    print("Current Trial:", currentTrial)

    -- Access trial data directly from the trials table
    local target = trials.nsTarget
    local goal = trials.nsGoal

    -- Check if the player is currently engaged in a trial
    if target ~= nil then
        print("Player is engaged in a trial")

        -- Check if the victim is one of the targets for the current trial
        if target == SceneObject(pVictim):getObjectName() then
            print("Victim is a target for the current trial")

            -- Increment target count
            local targetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0
            targetCount = targetCount + 1
            writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", tostring(targetCount))

            print("Target Count:", targetCount)

            -- Send a system message to the player about the target kill count
            CreatureObject(pPlayer):sendSystemMessage("You have defeated " .. targetCount .. " out of " .. goal .. " targets for this trial.")

            -- Check if target count meets the goal
            if targetCount >= goal then
                print("Goal reached!")
                -- Remove the huntTargetCount data
                deleteScreenPlayData(pPlayer, "jedipush", "huntTargetCount")
                -- Transition to the next trial
                CreatureObject(pPlayer):removeScreenPlayState(8, "jedipush")
                CreatureObject(pPlayer):setScreenPlayState(16, "jedipush")
                print("sreenplaystate 8 removed and 16 set")
                dropObserver(KILLEDCREATURE, "jedipush", "nstargetdestroyed", pPlayer)
                print("KILLEDCREATURE dropped")
                CreatureObject(pPlayer):sendSystemMessage("Seek out the Force essence for your next trial")
            end
        end
    end
    return 0
end

-- Function to start acklay trial for a player
function jedipush:acklayTrial(pPlayer)
    print("acklay trial start activated")
    if CreatureObject(pPlayer):hasScreenPlayState(32, "jedipush") then
        print("screenplaystate 32")
    -- Access trial data directly from the trials table
    local trialName = trials.aTrialName
    local target = trials.aTarget
    local goal = trials.aGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage("Trial 3: Revenge of the Acklay")

    -- Store trial data for the player
    writeScreenPlayData(pPlayer, "jedipush", "currentTrial", trialName)
    writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", 0)
    -- Register observer for killed creatures
    createObserver(KILLEDCREATURE    , "jedipush", "atargetdestroyed", pPlayer)
            print("KILLEDCREATURE active")
        end
    return 1
end

-- Function to handle acklay kills
function jedipush:atargetdestroyed(pPlayer, pVictim)
    print("atargetdestroyed activated")
    if (pVictim == nil or pPlayer == nil) then
		return 0
	end

    local currentTrial = readScreenPlayData(pPlayer, "jedipush", "currentTrial")
    if currentTrial == nil then
        print("currentTrial is nil")
        return 0
    end

    print("Current Trial:", currentTrial)

    -- Access trial data directly from the trials table
    local target = trials.aTarget
    local goal = trials.aGoal

    -- Check if the player is currently engaged in a trial
    if target ~= nil then
        print("Player is engaged in a trial")

        -- Check if the victim is one of the targets for the current trial
        if target == SceneObject(pVictim):getObjectName() then
            print("Victim is a target for the current trial")

            -- Increment target count
            local targetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0
            targetCount = targetCount + 1
            writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", tostring(targetCount))

            print("Target Count:", targetCount)

            -- Send a system message to the player about the target kill count
            CreatureObject(pPlayer):sendSystemMessage("You have defeated " .. targetCount .. " out of " .. goal .. " targets for this trial.")

            -- Check if target count meets the goal
            if targetCount >= goal then
                print("Goal reached!")
                -- Remove the huntTargetCount data
                deleteScreenPlayData(pPlayer, "jedipush", "huntTargetCount")
                -- Transition to the next trial
                CreatureObject(pPlayer):removeScreenPlayState(32, "jedipush")
                CreatureObject(pPlayer):setScreenPlayState(64, "jedipush")
                print("sreenplaystate 32 removed and 64 set")
                dropObserver(KILLEDCREATURE, "jedipush", "atargetdestroyed", pPlayer)
                print("KILLEDCREATURE dropped")
                CreatureObject(pPlayer):sendSystemMessage("Seek out the Force essence for your next trial")
            end
        end
    end
    return 0
end

-- Function to start krayt trial for a player
function jedipush:kraytTrial(pPlayer)
    print("krayt trial start activated")
    if CreatureObject(pPlayer):hasScreenPlayState(128, "jedipush") then
        print("screenplaystate 128")
    -- Access trial data directly from the trials table
    local trialName = trials.kTrialName
    local target = trials.kTarget
    local goal = trials.kGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage("Trial 4: Into the lair of the Dragon")

    -- Store trial data for the player
    writeScreenPlayData(pPlayer, "jedipush", "currentTrial", trialName)
    writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", 0)
    -- Register observer for killed creatures
    createObserver(KILLEDCREATURE, "jedipush", "ktargetdestroyed", pPlayer)
            print("KILLEDCREATURE active")
        end
    return 1
end

-- Function to handle krayt kills
function jedipush:ktargetdestroyed(pPlayer, pVictim)
    print("ktargetdestroyed activated")
    if (pVictim == nil or pPlayer == nil) then
		return 0
	end

    local currentTrial = readScreenPlayData(pPlayer, "jedipush", "currentTrial")
    if currentTrial == nil then
        print("currentTrial is nil")
        return 0
    end

    print("Current Trial:", currentTrial)

    -- Access trial data directly from the trials table
    local target = trials.kTarget
    local goal = trials.kGoal

    -- Check if the player is currently engaged in a trial
    if target ~= nil then
        print("Player is engaged in a trial")

        -- Check if the victim is one of the targets for the current trial
        if target == SceneObject(pVictim):getObjectName() then
            print("Victim is a target for the current trial")

            -- Increment target count
            local targetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0
            targetCount = targetCount + 1
            writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", tostring(targetCount))

            print("Target Count:", targetCount)

            -- Send a system message to the player about the target kill count
            CreatureObject(pPlayer):sendSystemMessage("You have defeated " .. targetCount .. " out of " .. goal .. " targets for this trial.")

            -- Check if target count meets the goal
            if targetCount >= goal then
                print("Goal reached!")
                -- Remove the huntTargetCount data
                deleteScreenPlayData(pPlayer, "jedipush", "huntTargetCount")
                -- Transition to the next trial
                CreatureObject(pPlayer):removeScreenPlayState(128, "jedipush")
                CreatureObject(pPlayer):setScreenPlayState(256, "jedipush")
                print("sreenplaystate 128 removed and 256 set")
                dropObserver(KILLEDCREATURE, "jedipush", "ktargetdestroyed", pPlayer)
                print("KILLEDCREATURE dropped")
                CreatureObject(pPlayer):sendSystemMessage("Seek out the Force essence for your next trial")
            end
        end
    end
    return 0
end