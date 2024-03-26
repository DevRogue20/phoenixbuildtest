-- Import necessary modules
local ObjectManager = require("managers.object.object_manager")

-- Convo handler for the Jedi Test screenplay
jedi_test_convo_handler = conv_handler:new {}

-- Get initial screen for conversation
function jedi_test_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
    local convoTemplate = LuaConversationTemplate(pConvTemplate)

     -- Deserialize screenplay states
     local serializedStates = readScreenPlayData(pPlayer, "jedipush", "serializedStates")
     if serializedStates then
         jedipush:deserializeStates(serializedStates)
     end

    -- Check if the player has any screenplay states set
    if not (CreatureObject(pPlayer):hasScreenPlayState(1, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(4, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(16, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(64, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(256, "jedipush")) then
        -- Return the "no_quest" screen if no screenplay state is set
        return convoTemplate:getScreen("no_quest")
    end

    -- If the player has a screenplay state, return the appropriate screen
    if CreatureObject(pPlayer):hasScreenPlayState(1, "jedipush") then
        return convoTemplate:getScreen("intro")
    elseif CreatureObject(pPlayer):hasScreenPlayState(4, "jedipush") then
        return convoTemplate:getScreen("trial_two")
    elseif CreatureObject(pPlayer):hasScreenPlayState(16, "jedipush") then
        return convoTemplate:getScreen("trial_three")
    elseif CreatureObject(pPlayer):hasScreenPlayState(64, "jedipush") then
        return convoTemplate:getScreen("trial_four")
    elseif CreatureObject(pPlayer):hasScreenPlayState(256, "jedipush") then
        return convoTemplate:getScreen("trial_five")
    end
end

-- Run screen handlers for the Jedi Push screenplay
function jedi_test_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen, pVictim, pGhost)
    local screen = LuaConversationScreen(pConvScreen)
    local screenID = screen:getScreenID()
    
    if screenID == "task_one" then
        CreatureObject(pPlayer):removeScreenPlayState(1, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(2, "jedipush")
        jedipush:startTrial(pPlayer)
        	
    elseif screenID == "task_two" then
        CreatureObject(pPlayer):removeScreenPlayState(4, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(8, "jedipush")
        jedipush:startnsTrial(pPlayer)

    elseif screenID == "task_three" then
        CreatureObject(pPlayer):removeScreenPlayState(16, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(32, "jedipush")
        jedipush:acklayTrial(pPlayer)

    elseif screenID == "task_four" then
        CreatureObject(pPlayer):removeScreenPlayState(64, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(128, "jedipush")
        jedipush:kraytTrial(pPlayer)

    elseif screenID == "trial_fail" then
        CreatureObject(pPlayer):removeScreenPlayState(256, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(1024, "jedipush")
        CreatureObject(pPlayer):sendSystemMessage("The Force has abandoned you indefinitely...")

    elseif screenID == "trial_finish" then
        HologrindJediManager:awardJediStatusAndSkill(pPlayer)
        CreatureObject(pPlayer):removeScreenPlayState(256, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(512, "jedipush")
    end

    -- Serialize screenplay states after each screen transition
    writeScreenPlayData(pPlayer, "jedipush", "serializedStates", jedipush:serializeStates())


    return pConvScreen
end
