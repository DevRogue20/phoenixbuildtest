-- Import necessary modules
local ObjectManager = require("managers.object.object_manager")

-- Convo handler for the Jedi Test screenplay
jedi_test_convo_handler = conv_handler:new {}

-- Get initial screen for conversation
function jedi_test_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate, screens)
    local convoTemplate = LuaConversationTemplate(pConvTemplate)

    -- Check if the player has any screenplay states set
    if not (CreatureObject(pPlayer):hasScreenPlayState(1, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(4, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(16, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(64, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(256, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(512, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(1024, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(2048, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(4096, "jedipush") or
            CreatureObject(pPlayer):hasScreenPlayState(16384, "jedipush")) then
        -- Return the "no_quest" screen if no screenplay state is set
        return convoTemplate:getScreen("no_quest")
    end

    -- If the player has a screenplay state, return the appropriate screen
    if CreatureObject(pPlayer):hasScreenPlayState(1, "jedipush") then
        return convoTemplate:getScreen("intro")
    elseif CreatureObject(pPlayer):hasScreenPlayState(2, "jedipush") then
        return convoTemplate:getScreen("task_one_active")        
    elseif CreatureObject(pPlayer):hasScreenPlayState(4, "jedipush") then
        return convoTemplate:getScreen("trial_two")
    elseif CreatureObject(pPlayer):hasScreenPlayState(8, "jedipush") then
        return convoTemplate:getScreen("task_two_active")  
    elseif CreatureObject(pPlayer):hasScreenPlayState(16, "jedipush") then
        return convoTemplate:getScreen("trial_three")
    elseif CreatureObject(pPlayer):hasScreenPlayState(32, "jedipush") then
        return convoTemplate:getScreen("task_three_active")  
    elseif CreatureObject(pPlayer):hasScreenPlayState(64, "jedipush") then
        return convoTemplate:getScreen("trial_four")
    elseif CreatureObject(pPlayer):hasScreenPlayState(128, "jedipush") then
        return convoTemplate:getScreen("task_four_active")  
    elseif CreatureObject(pPlayer):hasScreenPlayState(256, "jedipush") then
        return convoTemplate:getScreen("trial_five")
    elseif CreatureObject(pPlayer):hasScreenPlayState(4096, "jedipush") then
        return convoTemplate:getScreen("trial_finish")
    end
end

-- Run screen handlers for the Jedi Push screenplay
function jedi_test_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen, pVictim, pGhost, pMobile)
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

    elseif screenID == "trial_five_active" then
        print("screen five_active")
        CreatureObject(pPlayer):removeScreenPlayState(256, "jedipush")
        print("removing screenplaystate 256")
        CreatureObject(pPlayer):setScreenPlayState(512, "jedipush")
        print("setting screenplaystate 512")
        jedipush:startRandomTrial(pPlayer)
        

    elseif screenID == "trial_isJedi" then
        HologrindJediManager:awardJediStatusAndSkill(pPlayer)
        CreatureObject(pPlayer):removeScreenPlayState(4096, "jedipush")
        CreatureObject(pPlayer):setScreenPlayState(8192, "jedipush")
        createEvent(1 * 60 * 1000, "jedipush", "removeMobile", pMobile, "")
        print("Removing Obiwan")
    end
    return pConvScreen
end

-- Helper function to get a random key from a table
function table.randomKey(tbl)
    local keys = {}
    for key, _ in pairs(tbl) do
        table.insert(keys, key)
    end
    return keys[math.random(#keys)]
end