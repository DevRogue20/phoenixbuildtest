orion = ScreenPlay:new {
     		numberOfActs = 1,
     		
     		screenplayname = "orion",
     		
     		states = {},
}

registerScreenPlay("orion", true)

function orion:start()
	if (isZoneEnabled("dungeon2")) then
		self:spawnMobiles()

	end
end

function orion:spawnMobiles()

	local pHan = spawnMobile("dungeon2", "han_orion", 1, 67.9, 0.8, -35.0, -71, 14200973)
	local pJaden = spawnMobile("corellia", "jaden_welcome", 1, -32.6, 1.6, 50.0, 44, 1855680, "calm")

end



orion_convo_handler = conv_handler:new {}

function orion_convo_handler:getInitialScreen(pPlayer, pNpc, pConvTemplate)

	local convoTemplate = LuaConversationTemplate(pConvTemplate)

		return convoTemplate:getScreen("first_screen")
end

function orion_convo_handler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	local cashCredits = CreatureObject(pPlayer):getCashCredits()
	local bankCredits = CreatureObject(pPlayer):getBankCredits()
	local playerCredits = cashCredits + bankCredits
	local moneyRequired = 10000
	
	if (screenID == "first_screen") then
		return pConvScreen
		elseif (screenID == "yes") then
		return convoTemplate:getScreen("yes")
		elseif (screenID == "depart") then
		SceneObject(pPlayer):switchZone("corellia", -71, 0, -4711, 0)
		
	end		
		
	return pConvScreen
end