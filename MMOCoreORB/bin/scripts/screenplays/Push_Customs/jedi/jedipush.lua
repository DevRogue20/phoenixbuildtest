--Written by Push for use on Project Phoenix

-- Import required modules
local ObjectManager = require("managers.object.object_manager")
-- Define the trialData table directly in the screenplay Lua code. Chabge goal number to change kills required.
local trials = {
    {
    trialName = "trial_one",
    target = {"tusken_raider", "tusken_avenger", "tusken_berserker", "tusken_blood_champion", "tusken_brute", "tusken_captain", "tusken_carnage_champion", "tusken_chief", "tusken_death_hunter", "tusken_gore_chief", "tusken_king", 
            "tusken_observer", "tusken_raid_champion", "tusken_raid_leader", "tusken_savage", "tusken_sniper", "tusken_torture_lord", "tusken_wanderer", "tusken_warlord", "tusken_war_master", "tusken_warrior", "tusken_child", 
            "tusken_witch_doctor", "tusken_woman"},
    goal = 1
    },
    {
    nsTrialName = "trial_two",
    nsTarget = {"nightsister_elder"},
    nsGoal = 1
    },
    {
    aTrialName = "trial_three",
    aTarget = {"geonosian_acklay_bunker_boss"},
    aGoal = 1
    },
    {
    kTrialName = "trial_four",
    kTarget = {"krayt_dragon_ancient"},
    kGoal = 1
    }
}

-- Define Jedi Trials screenplay object
jedipush = ScreenPlay:new {
    numberOfActs = 1,
    screenplayName = "jedipush",
    states = {
        1,
        2,
        4,
        8,
        16,
        32,
        64,
        128,
        256,
        512,
        1024
    },
}

-- Register the Jedi Trials screenplay
registerScreenPlay("jedipush", true)

-- Initialize ScreenPlay
    function jedipush:start(pPlayer)
        -- Spawn scene objects and mobiles
        self:spawnMobiles()
    end
    
-- Function to notify when a player enters an area
function jedipush:spawnMobiles()
    -- Spawn a mobile if the player is valid
    local pMobile = spawnMobile("dantooine", "obiwan_test", 1, 4194, 9, 5201, 24, 0, "calm")
end

-- Function to start a trial for a player
function jedipush:startTrial(pPlayer, pCreatureObject)
    print("trial start activated")
    if CreatureObject(pPlayer):hasScreenPlayState(2, "jedipush") then
        print("screenplaystate 2")
    -- Access trial data directly from the trials table
    local trialData = trials[1] -- Accessing the first trial
    local trialName = trialData.trialName
    local target = trialData.target
    local goal = trialData.goal


    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\<Communicator>  \\#0000FF\\Trial 1: Tusken Slayer")
    CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_received.snd")

    -- Store trial data for the player
    writeScreenPlayData(pPlayer, "jedipush", "currentTrial", trialName)
    writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", 0)
    -- Register observer for killed creatures
    createObserver(KILLEDCREATURE, "jedipush", "targetdestroyed", pPlayer)
            print("KILLEDCREATURE active")
        end
    return 0
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
    local trialData = trials[1] -- Accessing the first trial
    local targets = trialData.target
    local goal = trialData.goal

    -- Check if the player is currently engaged in a trial
    if targets ~= nil then
        print("Player is engaged in a trial")

        -- Get the name of the killed creature
        local victimName = SceneObject(pVictim):getObjectName()

        -- Check if the victim is one of the targets for the current trial
        for _, targetName in ipairs(targets) do
            if victimName == targetName then
                print("Victim is a target for the current trial")

                -- Increment target count
                local targetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0
                targetCount = targetCount + 1
                writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", tostring(targetCount))
                CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_counter.snd")

                print("Target Count:", targetCount)

                -- Send a system message to the player about the target kill count
                local message = " \\#FFFF00\\You have defeated " .. targetCount .. " \\#FFFF00\\out of " .. goal .. " \\#FFFF00\\targets for this trial."
                CreatureObject(pPlayer):sendSystemMessage(message)


                -- Check if target count meets the goal
                if targetCount >= goal then
                    print("Goal reached!")

                    local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")
                    local pItem = giveItem(pInventory, "object/tangible/tcg/series1/decorative_dooku_bust.iff", -1)
                    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\You have received a decorative Count Dooku pillar")
                    -- Remove the huntTargetCount data
                    deleteScreenPlayData(pPlayer, "jedipush", "huntTargetCount")
                    -- Transition to the next trial
                    CreatureObject(pPlayer):removeScreenPlayState(2, "jedipush")
                    CreatureObject(pPlayer):setScreenPlayState(4, "jedipush")
                    print("sreenplaystate 2 removed and 4 set")
                    dropObserver(KILLEDCREATURE, "jedipush", "targetdestroyed", pPlayer)
                    print("KILLEDCREATURE dropped")
                    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\<Communicator>  \\#0000FF\\Trial 1: Tusken Slayer Completed!")
                    CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_completed.snd")
                    CreatureObject(pPlayer):sendSystemMessage(" \\#00FF00\\Seek out the Force essence for your next trial")
                end
            end
        end
    end
    return 0
end


-- Function to start ns trial for a player
function jedipush:startnsTrial(pPlayer, pCreatureObject)
    print("nstrial start activated")
    if CreatureObject(pPlayer):hasScreenPlayState(8, "jedipush") then
        print("screenplaystate 8")
    -- Access trial data directly from the trials table
    local trialData = trials[2]
    local trialName = trialData.nsTrialName
    local target = trialData.nsTarget
    local goal = trialData.nsGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\<Communicator>  \\#0000FF\\Trial 2: The Witches of Dathomir")
    CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_received.snd")

    -- Store trial data for the player
    writeScreenPlayData(pPlayer, "jedipush", "currentTrial", trialName)
    writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", 0)
    -- Register observer for killed creatures
    createObserver(KILLEDCREATURE, "jedipush", "nstargetdestroyed", pPlayer)
            print("KILLEDCREATURE active")
        end
    return 0
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
    local trialData = trials[2]
    local target = trialData.nsTarget
    local goal = trialData.nsGoal

    -- Check if the player is currently engaged in a trial
    if target ~= nil then
        print("Player is engaged in a trial")

        -- Get the name of the killed creature
        local victimName = SceneObject(pVictim):getObjectName()

        -- Check if the victim is one of the targets for the current trial
        for _, targetName in ipairs(target) do
            if victimName == targetName then
                print("Victim is a target for the current trial")

                -- Increment target count
                local targetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0
                targetCount = targetCount + 1
                writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", tostring(targetCount))
                CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_counter.snd")

                print("Target Count:", targetCount)

                -- Send a system message to the player about the target kill count
                local message = " \\#FFFF00\\You have defeated " .. targetCount .. " \\#FFFF00\\out of " .. goal .. " \\#FFFF00\\targets for this trial."
                CreatureObject(pPlayer):sendSystemMessage(message)

                -- Check if target count meets the goal
                if targetCount >= goal then
                    print("Goal reached!")

                    local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")
                    local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_yoda_fountain.iff", -1)
                    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\You have received a decorative Yoda Fountain!")
                    -- Remove the huntTargetCount data
                    deleteScreenPlayData(pPlayer, "jedipush", "huntTargetCount")
                    -- Transition to the next trial
                    CreatureObject(pPlayer):removeScreenPlayState(8, "jedipush")
                    CreatureObject(pPlayer):setScreenPlayState(16, "jedipush")
                    print("sreenplaystate 8 removed and 16 set")
                    dropObserver(KILLEDCREATURE, "jedipush", "nstargetdestroyed", pPlayer)
                    print("KILLEDCREATURE dropped")
                    CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_completed.snd")
                    CreatureObject(pPlayer):sendSystemMessage("Seek out the Force essence for your next trial")
                end
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
    local trialData = trials[3]
    local trialName = trialData.aTrialName
    local target = trialData.aTarget
    local goal = trialData.aGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\<Communicator>  \\#0000FF\\Trial 3: Revenge of the Acklay")
    CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_received.snd")

    -- Store trial data for the player
    writeScreenPlayData(pPlayer, "jedipush", "currentTrial", trialName)
    writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", 0)
    -- Register observer for killed creatures
    createObserver(KILLEDCREATURE    , "jedipush", "atargetdestroyed", pPlayer)
            print("KILLEDCREATURE active")
        end
    return 0
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
    local trialData = trials[3]
    local target = trialData.aTarget
    local goal = trialData.aGoal

    -- Check if the player is currently engaged in a trial
    if target ~= nil then
        print("Player is engaged in a trial")

        -- Check if the victim is one of the targets for the current trial
        -- Get the name of the killed creature
        local victimName = SceneObject(pVictim):getObjectName()

        -- Check if the victim is one of the targets for the current trial
        for _, targetName in ipairs(target) do
            if victimName == targetName then
                print("Victim is a target for the current trial")

                -- Increment target count
                local targetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0
                targetCount = targetCount + 1
                writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", tostring(targetCount))
                CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_counter.snd")

            print("Target Count:", targetCount)

            -- Send a system message to the player about the target kill count
            local message = " \\#FFFF00\\You have defeated " .. targetCount .. " \\#FFFF00\\out of " .. goal .. " \\#FFFF00\\targets for this trial."
                CreatureObject(pPlayer):sendSystemMessage(message)

            -- Check if target count meets the goal
                if targetCount >= goal then
                    print("Goal reached!")

                    local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")
                    local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_vet_painting_april_07.iff", -1)
                    local pItem = giveItem(pInventory, "object/tangible/veteran_reward/frn_vet_palpatine_statue.iff", -1)
                    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\You have received a decorative Painting and a Statue of The Emperor!")
                    -- Remove the huntTargetCount data
                    deleteScreenPlayData(pPlayer, "jedipush", "huntTargetCount")
                    -- Transition to the next trial
                    CreatureObject(pPlayer):removeScreenPlayState(32, "jedipush")
                    CreatureObject(pPlayer):setScreenPlayState(64, "jedipush")
                    print("sreenplaystate 32 removed and 64 set")
                    dropObserver(KILLEDCREATURE, "jedipush", "atargetdestroyed", pPlayer)
                    print("KILLEDCREATURE dropped")
                    CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_completed.snd")
                    CreatureObject(pPlayer):sendSystemMessage("Seek out the Force essence for your next trial")
                end
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
    local trialData = trials[4]
    local trialName = trialData.kTrialName
    local target = trialData.kTarget
    local goal = trialData.kGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\<Communicator>  \\#0000FF\\Trial 4: Into the lair of the Dragon")
    CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_received.snd")

    -- Store trial data for the player
    writeScreenPlayData(pPlayer, "jedipush", "currentTrial", trialName)
    writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", 0)
    -- Register observer for killed creatures
    createObserver(KILLEDCREATURE, "jedipush", "ktargetdestroyed", pPlayer)
            print("KILLEDCREATURE active")
        end
    return 0
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
    local trialData = trials[4]
    local target = trialData.kTarget
    local goal = trialData.kGoal

    -- Check if the player is currently engaged in a trial
    if target ~= nil then
        print("Player is engaged in a trial")

        -- Check if the victim is one of the targets for the current trial
        -- Get the name of the killed creature
        local victimName = SceneObject(pVictim):getObjectName()

        -- Check if the victim is one of the targets for the current trial
        for _, targetName in ipairs(target) do
            if victimName == targetName then
                print("Victim is a target for the current trial")

                -- Increment target count
                local targetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0
                targetCount = targetCount + 1
                writeScreenPlayData(pPlayer, "jedipush", "huntTargetCount", tostring(targetCount))
                CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_counter.snd")

            print("Target Count:", targetCount)

            -- Send a system message to the player about the target kill count
            local message = " \\#FFFF00\\You have defeated " .. targetCount .. " \\#FFFF00\\out of " .. goal .. " \\#FFFF00\\targets for this trial."
                CreatureObject(pPlayer):sendSystemMessage(message)

                -- Check if target count meets the goal
                if targetCount >= goal then
                    print("Goal reached!")

                    local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")
                    local pItem = giveItem(pInventory, "object/tangible/item/quest/force_sensitive/bacta_tank.iff", -1)
                    local pItem = giveItem(pInventory, "object/tangible/collection/reward/count_dooku_lightsaber_plaque_reward.iff", -1)
                    CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\You have received a Bacta Tank and a Decorative Count Dooku Lightsaber Plaque!")
                    -- Remove the huntTargetCount data
                    deleteScreenPlayData(pPlayer, "jedipush", "huntTargetCount")
                    -- Transition to the next trial
                    CreatureObject(pPlayer):removeScreenPlayState(128, "jedipush")
                    CreatureObject(pPlayer):setScreenPlayState(256, "jedipush")
                    print("sreenplaystate 128 removed and 256 set")
                    dropObserver(KILLEDCREATURE, "jedipush", "ktargetdestroyed", pPlayer)
                    print("KILLEDCREATURE dropped")
                    CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_completed.snd")
                    CreatureObject(pPlayer):sendSystemMessage("Seek out the Force essence for your next trial")
                end
            end
        end
    end
    return 0
end

function jedipush:onPlayerLoggedIn(pPlayer)
    -- Drop observer if already registered
    dropObserver(KILLEDCREATURE, "jedipush", "targetdestroyed", pPlayer)
    dropObserver(KILLEDCREATURE, "jedipush", "nstargetdestroyed", pPlayer)
    dropObserver(KILLEDCREATURE, "jedipush", "atargetdestroyed", pPlayer)
    dropObserver(KILLEDCREATURE, "jedipush", "ktargetdestroyed", pPlayer)

    if (CreatureObject(pPlayer) == nil) then
        print("niller than shit")
        return
    end

    if CreatureObject(pPlayer):hasScreenPlayState(2, "jedipush") then
        self:trialRestart(pPlayer)
    elseif CreatureObject(pPlayer):hasScreenPlayState(8, "jedipush") then
        self:nsRestart(pPlayer)
    elseif CreatureObject(pPlayer):hasScreenPlayState(32, "jedipush") then
        self:acklayRestart(pPlayer)
    elseif CreatureObject(pPlayer):hasScreenPlayState(128, "jedipush") then
        self:kraytRestart(pPlayer)
    elseif CreatureObject(pPlayer):hasSkill("jedi_dark_side_journeyman_novice") then
        CreatureObject(pPlayer):setFaction(FACTIONIMPERIAL)
		--print("faction set to Imperial")
    elseif CreatureObject(pPlayer):hasSkill("jedi_light_side_journeyman_novice") then
        CreatureObject(pPlayer):setFaction(FACTIONREBEL)
		--print("faction set to Rebel")
        
        
    end
end

function jedipush:trialRestart(pPlayer, pVictim)
    
    if (CreatureObject(pPlayer) == nil) then
        print("niller than tusken shit")
        return
    end
    -- Read previous trial data from screenplay data
    local previousTrial = readScreenPlayData(pPlayer, "jedipush", "currentTrial")
    local previousTargetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0

    -- Read trial data from the provided trialData parameter
    local trialData = trials[1] -- Accessing the first trial
    local trialName = trialData.trialName
    local target = trialData.target  
    local goal = trialData.goal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage("Trial 1: Tusken Slayer")

    -- Check if trial data is valid
    if trialName and target and goal then
        -- Send system message to player about trial restart
        CreatureObject(pPlayer):sendSystemMessage("Restarting trial: " .. trialName)

        -- Register observer for killed creatures
        createObserver(KILLEDCREATURE, "jedipush", "targetdestroyed", pPlayer)
        print("KILLEDCREATURE observer registered for trial:", trialName)

        self:targetdestroyed(pPlayer)
    end
end

function jedipush:nsRestart(pPlayer, pVictim)

    if (CreatureObject(pPlayer) == nil) then
        print("niller than sister shit")
        return
    end
    -- Read previous trial data from screenplay data
    local previousTrial = readScreenPlayData(pPlayer, "jedipush", "currentTrial")
    local previousTargetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0

    -- Read trial data from the provided trialData parameter
    local trialData = trials[2]
    local trialName = trialData.nsTrialName
    local target = trialData.nsTarget  
    local goal = trialData.nsGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage("Trial 2: The Witches of Dathomir")

    -- Check if trial data is valid
    if trialName and target and goal then
        -- Send system message to player about trial restart
        CreatureObject(pPlayer):sendSystemMessage("Restarting trial: " .. trialName)

        -- Register observer for killed creatures
        createObserver(KILLEDCREATURE, "jedipush", "nstargetdestroyed", pPlayer)
        print("KILLEDCREATURE observer registered for trial:", trialName)

       self:nstargetdestroyed(pPlayer)
    end
end

function jedipush:acklayRestart(pPlayer, pVictim)
    if (CreatureObject(pPlayer) == nil) then
        print("niller than acklay shit")
        return
    end
    -- Read previous trial data from screenplay data
    local previousTrial = readScreenPlayData(pPlayer, "jedipush", "currentTrial")
    local previousTargetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0

    -- Read trial data from the provided trialData parameter
    local trialData = trials[3]
    local trialName = trialData.aTrialName
    local target = trialData.aTarget  
    local goal = trialData.aGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage("Trial 3: Revenge of the Acklay")

    -- Check if trial data is valid
    if trialName and target and goal then
        -- Send system message to player about trial restart
        CreatureObject(pPlayer):sendSystemMessage("Restarting trial: " .. trialName)

        -- Register observer for killed creatures
        createObserver(KILLEDCREATURE, "jedipush", "atargetdestroyed", pPlayer)
        print("KILLEDCREATURE observer registered for trial:", trialName)

        self:atargetdestroyed(pPlayer)
    end
end

function jedipush:kraytRestart(pPlayer, pVictim)
    if (CreatureObject(pPlayer) == nil) then
        print("niller than krayt shit")
        return
    end
    -- Read previous trial data from screenplay data
    local previousTrial = readScreenPlayData(pPlayer, "jedipush", "currentTrial")
    local previousTargetCount = tonumber(readScreenPlayData(pPlayer, "jedipush", "huntTargetCount")) or 0

    -- Read trial data from the provided trialData parameter
    local trialData = trials[4]
    local trialName = trialData.kTrialName
    local target = trialData.kTarget  
    local goal = trialData.kGoal

    print("Trial Name:", trialName)
    print("Target:", target)
    print("Goal:", goal)

    CreatureObject(pPlayer):sendSystemMessage("Trial 4: Into the lair of the Dragon")

    -- Check if trial data is valid
    if trialName and target and goal then
        -- Send system message to player about trial restart
        CreatureObject(pPlayer):sendSystemMessage("Restarting trial: " .. trialName)

        -- Register observer for killed creatures
        createObserver(KILLEDCREATURE, "jedipush", "ktargetdestroyed", pPlayer)
        print("KILLEDCREATURE observer registered for trial:", trialName)

        self:ktargetdestroyed(pPlayer)
    end
end
    