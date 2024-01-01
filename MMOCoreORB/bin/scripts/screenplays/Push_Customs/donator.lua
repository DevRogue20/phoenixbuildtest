local ObjectManager = require("managers.object.object_manager")
--local Logger = require("utils.logger")
--require("utils.helpers")
--spHelper = require("screenplayHelper")

donator = ScreenPlay:new {
   numberOfActs = 1,
   --questString = "world_echange_task",
   states = {},
}

registerScreenPlay("donator", true)

function donator:start() 
   local pMerchant = spawnMobile("corellia", "donator_droid", 1, -159.9, 28, -4715.8, 104, 0 )

end

donator_convo_handler = Object:new {
   tstring = "conversation_exchange_dealer"
 }

function donator_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
   local creature = LuaCreatureObject(conversingPlayer)
   local convosession = creature:getConversationSession()
   lastConversation = nil
   local conversation = LuaConversationTemplate(conversationTemplate)
   local nextConversationScreen 
   
   if ( conversation ~= nil ) then
      if ( convosession ~= nil ) then
          local session = LuaConversationSession(convosession)
          if ( session ~= nil ) then
             lastConversationScreen = session:getLastConversationScreen()
          end
      end
      
      if ( lastConversationScreen == nil ) then
         nextConversationScreen = conversation:getInitialScreen()
      else
         local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
         
         local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
         nextConversationScreen = conversation:getScreen(optionLink)
         
         local credits = creature:getCashCredits()
         local pInventory = creature:getSlottedObject("inventory")
         local inventory = LuaSceneObject(pInventory)
         local containerSize = inventory:getContainerObjectsSize()
         local itemCounter = 0
         local i = 0 
         local DeleteItems = 0

         for i = 0, containerSize - 1, 1 do
        	 local pInvObj = inventory:getContainerObject(i)
	         local InvObj = LuaSceneObject(pInvObj)
	         	if (InvObj:getObjectName() == "sports_award_s01")   then
	         		itemCounter = itemCounter + 1
	         	end
	     end
	  
         if (SceneObject(pInventory):isContainerFullRecursive()) then
	            nextConversationScreen = conversation:getScreen("insufficient_space")
	            creature:sendSystemMessage("You do not have enough inventory space")  



	elseif (optionLink == "items") then
		nextConversationScreen = conversation:getScreen("items_screen")




	     elseif (optionLink == "1" and itemCounter < 1) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "1" and itemCounter >= 1) then
	            local pItem = giveItem(pInventory, "object/tangible/tcg/series5/decorative_galactic_hunters_poster.iff", -1)
	            DeleteItems = 1
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("You have received a Galactic Hunter Painting.")

	     elseif (optionLink == "2" and itemCounter < 1) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "2" and itemCounter >= 1) then
	            local pItem = giveItem(pInventory, "object/tangible/tcg/series8/painting_tcg8_yoda.iff", -1)
	            DeleteItems = 1
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("You have received a Jedi Master Yoda Painting.")

	     elseif (optionLink == "3" and itemCounter < 1) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "3" and itemCounter >= 1) then
	            local pItem = giveItem(pInventory, "object/tangible/tcg/series6/painting_spined_rancor.iff", -1)
	            DeleteItems = 1
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("You have received a Spined Rancor Poster.")

	     elseif (optionLink == "4" and itemCounter < 3) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "4" and itemCounter >= 3) then
	            local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/speeder_stap_deed.iff", -1)
	            DeleteItems = 3
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("You have received a Advanced Stap-1.")

	     elseif (optionLink == "5" and itemCounter < 3) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "5" and itemCounter >= 3) then
	            local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/basilisk_war_droid.iff", -1)
	            DeleteItems = 3
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("You have receieved a Basilisk War Droid.")

	     elseif (optionLink == "6" and itemCounter < 3) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "6" and itemCounter >= 3) then
	            local pItem = giveItem(pInventory, "object/tangible/deed/vehicle_deed/tcg_military_transport_deed.iff", -1)
	            DeleteItems = 3
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("You have receieved a Ram-1511 Transport.")		    

	     elseif (optionLink == "7" and itemCounter < 6) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "7" and itemCounter >= 6) then
	            local pItem = giveItem(pInventory, "object/tangible/terminal/terminal_travel_instant_xwing.iff", -1)
	            DeleteItems = 6
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("You have receieved a Phoenix VIP Rebel ITV.")

	     elseif (optionLink == "8" and itemCounter < 6) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "8" and itemCounter >= 6) then
	            local pItem = giveItem(pInventory, "object/tangible/terminal/terminal_travel_instant_tie.iff", -1)
	            DeleteItems = 6
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("You have receieved a Phoenix VIP Imperial ITV.")

	     --[[elseif (optionLink == "9" and itemCounter < 1) then            
	            nextConversationScreen = conversation:getScreen("insufficient_item")
	            creature:sendSystemMessage("You have insufficient items")
	     elseif (optionLink == "9" and itemCounter >= 1) then
	            local pItem = giveItem(pInventory, "", -1)
	            DeleteItems = 1
		    nextConversationScreen = conversation:getScreen("end")
		    creature:sendSystemMessage("Item 9.")]]



          	end
          for i = containerSize - 1 , 0 , -1 do
          	pInvObj = inventory:getContainerObject(i)
        	invObj = LuaSceneObject(pInvObj)
		     	if (invObj:getObjectName() == "sports_award_s01" and DeleteItems > 0 ) then
		     		DeleteItems = DeleteItems - 1
		     		invObj:destroyObjectFromWorld()
					invObj:destroyObjectFromDatabase()
		       	end
   		  end
   		  
 	
      end
   end
   return nextConversationScreen
   
end


function donator_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
   return conversationScreen
end
