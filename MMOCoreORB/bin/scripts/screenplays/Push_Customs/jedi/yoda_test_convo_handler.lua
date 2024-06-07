-- Import necessary modules
local ObjectManager = require("managers.object.object_manager")

-- Convo handler for the Jedi Test screenplay
yoda_test_convo_handler = conv_handler:new {}

local question = {}

local possibleScreens = {
    "yoda_four",
    "yoda_five",
    "yoda_six",
    "yoda_seven",
    "yoda_eight",
    "yoda_nine",
    "yoda_ten",
    "yoda_eleven",
    "yoda_twelve",
    "yoda_thirteen",
    "yoda_fourteen",
    "yoda_fifteen",
    "yoda_sixteen",
    "yoda_seventeen",
    "yoda_eighteen",
    "yoda_nineteen",
    "yoda_twenty",
    "yoda_twenty_one",
    "yoda_twenty_two",
    "yoda_twenty_three",
    "yoda_twenty_four",
    "yoda_twenty_five",
    "yoda_twenty_six",
    "yoda_twenty_seven",
    "yoda_twenty_eight",
    "yoda_twenty_nine",
    "yoda_thirty",
    "yoda_thirty_one",
    "yoda_thirty_two",
    "yoda_thirty_three",
    "yoda_thirty_four",
    "yoda_thirty_five",
    "yoda_thirty_six",
    "yoda_thirty_seven",
    "yoda_thirty_eight",
    "yoda_thirty_nine",
    "yoda_forty",
    "yoda_forty_one",
    "yoda_forty_two",
    "yoda_forty_three",
    "yoda_forty_four",
    "yoda_forty_five",
    "yoda_forty_six",
    "yoda_forty_seven",
    "yoda_forty_eight",
    "yoda_forty_nine",
    "yoda_fifty",
    "yoda_fifty_one",
    "yoda_fifty_two",
    "yoda_fifty_three",
    "yoda_fifty_four",
    "yoda_fifty_five",
    "yoda_fifty_six",
    "yoda_fifty_seven",
    "yoda_fifty_eight",
    "yoda_fifty_nine",
    "yoda_sixty",
    "yoda_sixty_one"
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
        CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\<Communicator>  \\#0000FF\\Trial 5: Quest for The Five Masters, Completed!")
        CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_completed.snd")
        CreatureObject(pPlayer):sendSystemMessage(" \\#00FF00\\Seek out the Force Essence and claim the Holocron of the Five Masters")
        jedipush:removeYoda(pPlayer, false)
        print("scheduled Yoda removal")

    elseif screenID == "trial_fail" then
        CreatureObject(pPlayer):removeScreenPlayState(2048, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(16384, "jedipush")
        CreatureObject(pPlayer):sendSystemMessage("The Force has abandoned you indefinitely...")
        jedipush:removeYoda(pPlayer, false)
        print("scheduled Yoda removal")

        local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
        local item = getContainerObjectByTemplate(pInventory, "object/tangible/tcg/series5/hangar_ships/jedi_fighter.iff", true)

        if item ~= nil then
            SceneObject(item):destroyObjectFromWorld()
            SceneObject(item):destroyObjectFromDatabase()
        end
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

