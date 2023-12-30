TatBunkerResetSP = ScreenPlay:new {
	numberOfActs = 1,
}

--True here tells the server to load this screenplay at server load. False tells it to wait until explicitly started.
registerScreenPlay("TatBunkerResetSP", true)

--This gets executed automatically when the screenplay is started
function TatBunkerResetSP:start()
	self:spawnMobiles()
end

--Put all the initial spawning of mobiles in a nice method like this.
function TatBunkerResetSP:spawnMobiles()
	local pReset = spawnMobile ("corellia", "reset_npc_convo", 1, -157.8, 28.0, -4699.0, 90, 0)
end


tat_mando_bunker_reset_npc_convo_handler = conv_handler:new {}

function tat_mando_bunker_reset_npc_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)

	local convoTemplate = LuaConversationTemplate(pConvTemplate)
		
		return convoTemplate:getScreen("first_screen")

end


function tat_mando_bunker_reset_npc_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	

	if (screenID == "yes") then

		CreatureObject(pPlayer):removeScreenPlayState(1, "tat_mando_bunker")
		CreatureObject(pPlayer):removeScreenPlayState(1, "tat_mando_bunker_boba_fett")
		CreatureObject(pPlayer):removeScreenPlayState(2, "tat_mando_bunker_boba_fett")
		CreatureObject(pPlayer):removeScreenPlayState(3, "tat_mando_bunker_boba_fett")
		CreatureObject(pPlayer):playMusicMessage("sound/ui_npe2_quest_received.snd")
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\Quest Reset.")
	end

	return pConvScreen
end