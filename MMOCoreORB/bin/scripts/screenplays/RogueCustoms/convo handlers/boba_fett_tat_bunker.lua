BobaFettTatBunkerSP = ScreenPlay:new {
	numberOfActs = 1,
}

--True here tells the server to load this screenplay at server load. False tells it to wait until explicitly started.
registerScreenPlay("BobaFettTatBunkerSP", true)

--This gets executed automatically when the screenplay is started
function BobaFettTatBunkerSP:start()
	self:spawnMobiles()
end

--Put all the initial spawning of mobiles in a nice method like this.
function BobaFettTatBunkerSP:spawnMobiles()
	-- airlock CELL ID [9995373]
	local pBoba = spawnMobile("tatooine", "boba_fett_convo", 300, -5.6, -5.2, -9.8, 179, 9995373)
end


tat_mando_bunker_boba_fett_convo_handler = conv_handler:new {}

function tat_mando_bunker_boba_fett_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)

	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (CreatureObject(pPlayer):hasSkill("jedi")) then

		return convoTemplate:getScreen("jedi_player")

	elseif (CreatureObject(pPlayer):hasScreenPlayState(1, "tat_mando_bunker_boba_fett")) then
		
		return convoTemplate:getScreen("active_quest")

	elseif (CreatureObject(pPlayer):hasScreenPlayState(2, "tat_mando_bunker_boba_fett")) then

		return convoTemplate:getScreen("quest_complete")

	elseif (CreatureObject(pPlayer):hasScreenPlayState(3, "tat_mando_bunker_boba_fett")) then
		
		return convoTemplate:getScreen("get_going")
		
	elseif (CreatureObject(pPlayer):hasScreenPlayState(1, "tat_mando_bunker")) then

		return convoTemplate:getScreen("first_screen")

	else
		
		return convoTemplate:getScreen("no_quest")

	end
end

function tat_mando_bunker_boba_fett_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	

	if (screenID == "accept_quest") then

		local jabbaWaypoint = PlayerObject(pGhost):addWaypoint("tatooine", "Jabba's Palace", "Jabba's Palace", -5858, -6195, WAYPOINTPURPLE, true, true, 0, 0)
		
		CreatureObject(pPlayer):setScreenPlayState(1, "tat_mando_bunker_boba_fett")
		CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_received.snd")
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\Quest received:  \\#FFFFFF\\Earning Jabba's Trust")
		setQuestStatus(CreatureObject(pPlayer):getObjectID() .. ":jabbaWaypointID", jabbaWaypoint)

	elseif (screenID == "unlocked") then
		CreatureObject(pPlayer):removeScreenPlayState(2, "tat_mando_bunker_boba_fett")
		CreatureObject(pPlayer):setScreenPlayState(3, "tat_mando_bunker_boba_fett")
		CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_received.snd")
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFFFF\\You can now enter the bunker")
	end

	return pConvScreen
end