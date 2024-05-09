-- Import necessary modules
local ObjectManager = require("managers.object.object_manager")

-- Convo handler for the Jedi Test screenplay
yoda_test_convo_handler = conv_handler:new {}

local question = {}

local possibleScreens = {
    "yoda_four",
    "yoda_five"
}

-- Get initial screen for conversation
function yoda_test_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate, screens)
    local convoTemplate = LuaConversationTemplate(pConvTemplate)
    if (CreatureObject(pPlayer) == nil) then
        return
    end

    -- If the player has a screenplay state, return the appropriate screen
    if CreatureObject(pPlayer):hasScreenPlayState(1024, "jedipush") then
        return convoTemplate:getScreen("yoda_intro")
    elseif CreatureObject(pPlayer):hasScreenPlayState(2048, "jedipush") then
        -- Read the data if it hasn't been read before
        local storedQuestion = readScreenPlayData(pPlayer, "yoda_test_convo_handler", "assigned_question")
        print("Stored question for player:", storedQuestion)
        
        if storedQuestion and storedQuestion ~= "" then
            print("Found stored question for player:", storedQuestion)
            return convoTemplate:getScreen(storedQuestion)
        else
            local randomScreenID = possibleScreens[math.random(#possibleScreens)]
            writeScreenPlayData(pPlayer, "yoda_test_convo_handler", "assigned_question", randomScreenID)
            print("Assigned new question for player:", randomScreenID)
            return convoTemplate:getScreen(randomScreenID)
        end
    elseif CreatureObject(pPlayer):hasScreenPlayState(4096 , "jedipush") then
        return convoTemplate:getScreen("yoda_complete")
    end
    return 
end



-- Run screen handlers for the Jedi Push screenplay
function yoda_test_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen, pVictim, pGhost, pYoda, pMobile)
    local screen = LuaConversationScreen(pConvScreen)
    local screenID = screen:getScreenID()

    if screenID == "yoda_three" then
        CreatureObject(pPlayer):removeScreenPlayState(1024, "jedipush")
        print("removing screenplaystate 1024")
        CreatureObject(pPlayer):setScreenPlayState(2048, "jedipush")
        print("setting screenplaystate 2048")

    elseif screenID == "correct_answer" then
        CreatureObject(pPlayer):removeScreenPlayState(2048, "jedipush")
        print("removing screenplaystate 2048")
        CreatureObject(pPlayer):setScreenPlayState(4096, "jedipush")
        print("setting screenplaystate 4096")
        local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")
        local pItem = giveItem(pInventory, "object/tangible/jedi/five_masters.iff", -1)
        CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\You have received The Holocron of the Five Masters")
        CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\<Communicator>  \\#0000FF\\Trial 5: Quest for The Five Masters, Completed!")
        CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_completed.snd")
        CreatureObject(pPlayer):sendSystemMessage(" \\#00FF00\\Seek out the Force Essence and return the Holocron of the Five Masters, to claim your destiny...")
        createEvent(1 * 30 * 1000, "jedipush", "removeYoda", {pYoda})
        print("removing yoda")

    elseif screenID == "trial_fail" then
        CreatureObject(pPlayer):removeScreenPlayState(2048, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(16384, "jedipush")
        CreatureObject(pPlayer):sendSystemMessage("The Force has abandoned you indefinitely...")
        createEvent(1 * 60 * 1000, "jedipush", "removeYoda", pYoda, "")
        print("removing yoda")
        createEvent(1 * 30 * 1000, "jedipush", "removeMobile", pMobile, "")
        print("Removing Obiwan")
    end

    return pConvScreen
end

function table.randomKey(tbl)
    local keys = {}
    for key, _ in pairs(tbl) do
        table.insert(keys, key)
    end
    return keys[math.random(#keys)]
end

