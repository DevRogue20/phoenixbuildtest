-- Import necessary modules
local ObjectManager = require("managers.object.object_manager")

-- Convo handler for the Jedi Test screenplay
destiny_convo_handler = conv_handler:new {}

-- Get initial screen for conversation
function destiny_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate, screens)
    local convoTemplate = LuaConversationTemplate(pConvTemplate)

    -- Check if the player has any screenplay states set
    if not (CreatureObject(pPlayer):hasScreenPlayState(1, "jedi_tier2") or
            CreatureObject(pPlayer):hasScreenPlayState(2, "jedi_tier2") or
            --CreatureObject(pPlayer):hasScreenPlayState(4, "jedi_tier2") or
            CreatureObject(pPlayer):hasScreenPlayState(4, "jedi_tier2")) then
        -- Return the "no_quest" screen if no screenplay state is set
        return convoTemplate:getScreen("no_quest")
    end

    -- If the player has a screenplay state, return the appropriate screen
    if CreatureObject(pPlayer):hasScreenPlayState(1, "jedi_tier2") then
        return convoTemplate:getScreen("intro")
    elseif CreatureObject(pPlayer):hasScreenPlayState(2, "jedi_tier2") then
        return convoTemplate:getScreen("screen_four")
    elseif CreatureObject(pPlayer):hasScreenPlayState(4, "jedi_tier2") then
        return convoTemplate:getScreen("screen_five")
    --elseif CreatureObject(pPlayer):hasScreenPlayState(8, "jedi_tier2") then
     --   return convoTemplate:getScreen("screen_six")
    end
end

-- Run screen handlers for the Jedi Test screenplay
function destiny_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
    local screen = LuaConversationScreen(pConvScreen)
    local screenID = screen:getScreenID()
    
    if screenID == "screen_three" then
        CreatureObject(pPlayer):removeScreenPlayState(1, "jedi_tier2")
        CreatureObject(pPlayer):setScreenPlayState(2, "jedi_tier2")
    elseif screenID == "screen_five" then
        local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

        -- Check inventory
        if pInventory == nil or SceneObject(pInventory):isContainerFullRecursive() then
            CreatureObject(pPlayer):sendSystemMessage("Inventory is full, make room for additional items")
        else
            -- Add Jedi Training Holocron
            local pItem = giveItem(pInventory, "object/tangible/jedi/holocron_eternal.iff", -1)
            local pDeed = giveItem(pInventory, "object/tangible/deed/player_house_deed/jedi_house_deed.iff", -1)
            local item = getContainerObjectByTemplate(pInventory, "object/tangible/jedi/five_masters.iff", true)
            CreatureObject(pPlayer):removeScreenPlayState(2, "jedi_tier2")
            CreatureObject(pPlayer):removeScreenPlayState(8192, "jedipush")
            CreatureObject(pPlayer):setScreenPlayState(4, "jedi_tier2")

            if item ~= nil then
                SceneObject(item):destroyObjectFromWorld()
                SceneObject(item):destroyObjectFromDatabase()
            end
        end

    elseif screenID == "screen_six" then
        local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

        -- Check inventory
        if pInventory == nil or SceneObject(pInventory):isContainerFullRecursive() then
            CreatureObject(pPlayer):sendSystemMessage("Inventory is full, make room for additional items")
        else
            -- Add Dark Jedi Holocron
            local pItem = giveItem(pInventory, "object/tangible/jedi/holocron_forbidden.iff", -1)
            local pDeed = giveItem(pInventory, "object/tangible/deed/player_house_deed/sith_house_deed.iff", -1)
            local item = getContainerObjectByTemplate(pInventory, "object/tangible/jedi/five_masters.iff", true)
            CreatureObject(pPlayer):removeScreenPlayState(2, "jedi_tier2")
            CreatureObject(pPlayer):removeScreenPlayState(8192, "jedipush")
            CreatureObject(pPlayer):setScreenPlayState(8, "jedi_tier2")

            if item ~= nil then
                SceneObject(item):destroyObjectFromWorld()
                SceneObject(item):destroyObjectFromDatabase()
            end
        end
    end
    return pConvScreen
end