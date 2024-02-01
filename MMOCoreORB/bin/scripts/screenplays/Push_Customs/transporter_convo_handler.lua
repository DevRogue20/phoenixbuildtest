transporter_convo_handler = conv_handler:new {}

function transporter_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)

	local convoTemplate = LuaConversationTemplate(pConvTemplate)

		return convoTemplate:getScreen("first_screen")
end

function transporter_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local cashCredits = CreatureObject(pPlayer):getCashCredits()
	local bankCredits = CreatureObject(pPlayer):getBankCredits()
	local playerCredits = cashCredits + bankCredits
	local moneyRequired = 10000

	if (screenID == "first_screen") then
		return convoTemplate:getScreen("first_screen")
		elseif (screenID == "exit_one") then
		return convoTemplate:getScreen("exit_one")
		elseif (screenID == "what") then
		return convoTemplate:getScreen("what")
		elseif (screenID == "wow") then
		return convoTemplate:getScreen("wow")
		elseif (screenID == "depart") then


			if (moneyRequired <= cashCredits) then
					CreatureObject(pPlayer):subtractCashCredits(moneyRequired)

				else
					bankRequired = moneyRequired - cashCredits
					CreatureObject(pPlayer):subtractCashCredits(cashCredits)
					CreatureObject(pPlayer):subtractBankCredits(bankRequired)

					end
				end

		if playerCredits < moneyRequired then
		return convoTemplate:getScreen("exit_two")
		else CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF00\\<Communicator>  \\#00FF00\\You have paid 10,000 credits to Intergalactic Travel Coalition") 
				if pPlayer ~= nil then
				createEvent(5 * 1000, "transporter_convo_handler", "transportPlayer", pPlayer, "")

	end
	end


	return pConvScreen
end

function transporter_convo_handler:transportPlayer(pPlayer)
    SceneObject(pPlayer):switchZone("dungeon2", 10, 0, 0, 14200966)
end