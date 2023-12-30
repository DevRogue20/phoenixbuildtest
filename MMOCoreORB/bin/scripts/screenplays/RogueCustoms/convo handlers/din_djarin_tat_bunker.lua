DinDjarinTatBunkerSP = ScreenPlay:new {
	numberOfActs = 1,
}

--True here tells the server to load this screenplay at server load. False tells it to wait until explicitly started.
registerScreenPlay("DinDjarinTatBunkerSP", true)

--This gets executed automatically when the screenplay is started
function DinDjarinTatBunkerSP:start()
	self:spawnMobiles()
end

--Put all the initial spawning of mobiles in a nice method like this.
function DinDjarinTatBunkerSP:spawnMobiles()
	local pDin = spawnMobile ("corellia", "din_djarin_convo", 1, -157.8, 28.0, -4704.0, 90, 0)
end


tat_mando_bunker_din_djarin_convo_handler = conv_handler:new {}

function tat_mando_bunker_din_djarin_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)

	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (CreatureObject(pPlayer):hasSkill("jedi")) then

		return convoTemplate:getScreen("jedi_player")

	elseif (CreatureObject(pPlayer):hasScreenPlayState(1, "tat_mando_bunker")) then

		return convoTemplate:getScreen("active_quest")
		--CreatureObject(pPlayer):removeScreenPlayState(1, "tat_mando_bunker")

		--return convoTemplate:getScreen("first_screen")

	else
		
		return convoTemplate:getScreen("first_screen")

	end
end

function tat_mando_bunker_din_djarin_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	

	if (screenID == "accept_quest") then

		local bunkerWaypoint = PlayerObject(pGhost):addWaypoint("tatooine", "Mandalorian Shield Generator", "Mandalorian Shield Generator", 7093, 1649, WAYPOINTPURPLE, true, true, 0, 0)
		
		CreatureObject(pPlayer):setScreenPlayState(1, "tat_mando_bunker")
		CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_received.snd")
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\Quest received:  \\#FFFFFF\\Meeting Bobba Fett.")
		setQuestStatus(CreatureObject(pPlayer):getObjectID() .. ":bunkerWaypointID", bunkerWaypoint)
	end

	return pConvScreen
end