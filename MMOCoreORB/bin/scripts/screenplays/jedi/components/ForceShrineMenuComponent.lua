ForceShrineMenuComponent = {}

function ForceShrineMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	local player = CreatureObject(pPlayer)

	if (player:hasSkill("jedi_padawan_novice")) then
		menuResponse:addRadialMenuItem(120, 3, "@jedi_trials:meditate") -- Meditate
	end

	if (player:hasSkill("jedi_padawan_novice")) then
		menuResponse:addRadialMenuItem(121, 3, "@force_rank:recover_jedi_items") -- Recover Jedi Items
	end

	if (player:hasSkill("jedi_light_side_master_master") and not player:hasSkill("force_rank_light_novice")) then
		menuResponse:addRadialMenuItem(122, 3, "Join the Jedi Council") -- Start FRS light
	end

	if (player:hasSkill("jedi_dark_side_master_master") and not player:hasSkill("force_rank_dark_novice")) then
		menuResponse:addRadialMenuItem(123, 3, "Join the Sith Council") -- Start FRS dark
	end

	if (player:hasSkill("force_rank_light_novice")) then
		menuResponse:addRadialMenuItem(124, 3, "Teleport to the Jedi Council") -- Instant travel to the light enclave.
	end

	if (player:hasSkill("force_rank_dark_novice")) then
		menuResponse:addRadialMenuItem(125, 3, "Teleport to the Sith Council") -- Instant travel to the dark enclave.
	end
end

function ForceShrineMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	local knightRobe, unlockMusic, unlockString, enclaveLoc, enclaveName, jediState, setFactionVal, skillForceRank, title, councilType

	if (CreatureObject(pPlayer):hasSkill ("jedi_light_side_master_master")) then
		knightRobe = "object/tangible/wearables/robe/robe_jedi_light_s04.iff"
		unlockMusic = "sound/music_become_light_jedi.snd"
		unlockString = "Congratulations, you have met the requirements to join the Jedi Council. In doing so, you also have achieved the title of Jedi Battle Master and have been given a new robe. You will also now be permanently overt."
		enclaveLoc = { -5575, 4905, "yavin4" }
		enclaveName = "Light Jedi Enclave"
		jediState = 4
		setFactionVal = FACTIONREBEL
		title = "Jedi Council"
		councilType = "force_rank_light_novice"
	elseif (CreatureObject(pPlayer):hasSkill ("jedi_dark_side_master_master")) then
		knightRobe = "object/tangible/wearables/robe/robe_jedi_dark_s04.iff"
		unlockMusic = "sound/music_become_dark_jedi.snd"
		unlockString = "Congratulations, you have met the requirements to join the Sith Council. In doing so, you also have achieved the title of Sith Acolyte and have been given a new robe. You will also now be permanently overt."
		enclaveLoc = { 5079, 305, "yavin4" }
		enclaveName = "Dark Jedi Enclave"
		jediState = 8
		setFactionVal = FACTIONIMPERIAL
		title = "Sith Council"
		councilType = "force_rank_dark_novice"
	else
		printLuaError("Invalid council type in JediTrials:unlockJediKnight")
		return
	end

	if (selectedID == 122 and CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_02")) then
		awardSkill(pPlayer, "force_title_jedi_rank_03")
		awardSkill(pPlayer, councilType)
		writeScreenPlayData(pPlayer, "KnightTrials", "completedTrials", 1)
		CreatureObject(pPlayer):playMusicMessage(unlockMusic)
		playClientEffectLoc(pPlayer, "clienteffect/trap_electric_01.cef", CreatureObject(pPlayer):getZoneName(), CreatureObject(pPlayer):getPositionX(), CreatureObject(pPlayer):getPositionZ(), CreatureObject(pPlayer):getPositionY(), CreatureObject(pPlayer):getParentID())

		PlayerObject(pGhost):addWaypoint(enclaveLoc[3], enclaveName, "", enclaveLoc[1], enclaveLoc[2], WAYPOINTYELLOW, true, true, 0)
		PlayerObject(pGhost):setJediState(jediState)
		CreatureObject(pPlayer):setFactionStatus(2) -- Overt
		CreatureObject(pPlayer):setFaction(setFactionVal)

		local sui = SuiMessageBox.new("JediTrials", "emptyCallback") -- No callback
		sui.setTitle(title)
		sui.setPrompt(unlockString)
		sui.sendTo(pPlayer)

		local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil or SceneObject(pInventory):isContainerFullRecursive()) then
			CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:inventory_full_jedi_robe")
		else
			giveItem(pInventory, knightRobe, -1)
		end
	end

	if (selectedID == 123 and CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_02")) then
		awardSkill(pPlayer, "force_title_jedi_rank_03")
		awardSkill(pPlayer, councilType)
		writeScreenPlayData(pPlayer, "KnightTrials", "completedTrials", 1)
		CreatureObject(pPlayer):playMusicMessage(unlockMusic)
		playClientEffectLoc(pPlayer, "clienteffect/trap_electric_01.cef", CreatureObject(pPlayer):getZoneName(), CreatureObject(pPlayer):getPositionX(), CreatureObject(pPlayer):getPositionZ(), CreatureObject(pPlayer):getPositionY(), CreatureObject(pPlayer):getParentID())

		PlayerObject(pGhost):addWaypoint(enclaveLoc[3], enclaveName, "", enclaveLoc[1], enclaveLoc[2], WAYPOINTYELLOW, true, true, 0)
		PlayerObject(pGhost):setJediState(jediState)
		CreatureObject(pPlayer):setFactionStatus(2) -- Overt
		CreatureObject(pPlayer):setFaction(setFactionVal)

		local sui = SuiMessageBox.new("JediTrials", "emptyCallback") -- No callback
		sui.setTitle(title)
		sui.setPrompt(unlockString)
		sui.sendTo(pPlayer)

		local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

		if (pInventory == nil or SceneObject(pInventory):isContainerFullRecursive()) then
			CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:inventory_full_jedi_robe")
		else
			giveItem(pInventory, knightRobe, -1)
		end
	end

	if (selectedID == 124 and CreatureObject(pPlayer):hasSkill("force_rank_light_novice")) then
		SceneObject(pPlayer):switchZone(enclaveLoc[3], enclaveLoc[1], 0, enclaveLoc[2], 0)
	end

	if (selectedID == 125 and CreatureObject(pPlayer):hasSkill("force_rank_dark_novice")) then
		SceneObject(pPlayer):switchZone(enclaveLoc[3], enclaveLoc[1], 0, enclaveLoc[2], 0)
	end

	if (selectedID == 120 and CreatureObject(pPlayer):hasSkill("jedi_padawan_novice")) then
		if (CreatureObject(pPlayer):getPosture() ~= CROUCHED) then
			CreatureObject(pPlayer):sendSystemMessage("@jedi_trials:show_respect") -- Must respect
		else
			self:doMeditate(pObject, pPlayer)
		end
	elseif (selectedID == 121 and CreatureObject(pPlayer):hasSkill("jedi_padawan_novice")) then
		self:recoverRobe(pPlayer)
	end

	return 0
end

function ForceShrineMenuComponent:doMeditate(pObject, pPlayer)
	--[[if (tonumber(readScreenPlayData(pPlayer, "KnightTrials", "completedTrials")) == 1 and not CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_03")) then
		KnightTrials:resetCompletedTrialsToStart(pPlayer)
	end

	if (not CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_02") and CreatureObject(pPlayer):hasScreenPlayState(32, "VillageJediProgression")) then
		local currentTrial = JediTrials:getCurrentTrial(pPlayer)

		if (not JediTrials:isOnPadawanTrials(pPlayer)) then
			PadawanTrials:startPadawanTrials(pObject, pPlayer)
		elseif (currentTrial == 0) then
			PadawanTrials:startNextPadawanTrial(pObject, pPlayer)
		else
			PadawanTrials:showCurrentTrial(pObject, pPlayer)
		end
	elseif (JediTrials:isOnKnightTrials(pPlayer)) then
		local pPlayerShrine = KnightTrials:getTrialShrine(pPlayer)

		if (pPlayerShrine ~= nil and pObject ~= pPlayerShrine) then
			local correctShrineZone = SceneObject(pPlayerShrine):getZoneName()
			if (correctShrineZone ~= SceneObject(pObject):getZoneName()) then
				local messageString = LuaStringIdChatParameter("@jedi_trials:knight_shrine_reminder")
				messageString:setTO(getStringId("@jedi_trials:" .. correctShrineZone))
				CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())
			else
				CreatureObject(pPlayer):sendSystemMessage("@jedi_trials:knight_shrine_wrong")
			end
			return
		end

		local currentTrial = JediTrials:getCurrentTrial(pPlayer)
		local trialsCompleted = JediTrials:getTrialsCompleted(pPlayer)

		if (currentTrial == 0 and trialsCompleted == 0) then
			local sui = SuiMessageBox.new("KnightTrials", "startNextKnightTrial")
			sui.setTitle("@jedi_trials:knight_trials_title")
			sui.setPrompt("@jedi_trials:knight_trials_start_query")
			sui.setOkButtonText("@jedi_trials:button_yes")
			sui.setCancelButtonText("@jedi_trials:button_no")
			sui.sendTo(pPlayer)
		else
			KnightTrials:showCurrentTrial(pPlayer)
		end
	else]]
		CreatureObject(pPlayer):sendSystemMessage("@jedi_trials:force_shrine_wisdom_" .. getRandomNumber(1, 15))
	--end
end

function ForceShrineMenuComponent:recoverRobe(pPlayer)
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:inventory_full_jedi_robe")
		return
	end

	local robeTemplate

	if (CreatureObject(pPlayer):hasSkill("force_rank_light_novice")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_light_s04.iff"
		
	elseif (CreatureObject(pPlayer):hasSkill("force_rank_dark_novice")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_dark_s04.iff"

	elseif (CreatureObject(pPlayer):hasSkill("jedi_light_side_master_master")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_light_s03.iff"

	elseif (CreatureObject(pPlayer):hasSkill("jedi_light_side_journeyman_master")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_light_s02.iff"

	elseif (CreatureObject(pPlayer):hasSkill("jedi_light_side_journeyman_novice")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_light_s01.iff"

	elseif (CreatureObject(pPlayer):hasSkill("jedi_dark_side_master_master")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_dark_s03.iff"

	elseif (CreatureObject(pPlayer):hasSkill("jedi_dark_side_journeyman_master")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_dark_s02.iff"

	elseif (CreatureObject(pPlayer):hasSkill("jedi_dark_side_journeyman_novice")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_dark_s01.iff"

	elseif (CreatureObject(pPlayer):hasSkill("jedi_padawan_novice")) then
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_padawan.iff"
		
	end
	--[[if (CreatureObject(pPlayer):hasSkill("force_title_jedi_rank_03")) then
		local councilType = JediTrials:getJediCouncil(pPlayer)

		if (councilType == JediTrials.COUNCIL_LIGHT) then
			robeTemplate = "object/tangible/wearables/robe/robe_jedi_light_s01.iff"
		else
			robeTemplate = "object/tangible/wearables/robe/robe_jedi_dark_s01.iff"
		end
	else
		robeTemplate = "object/tangible/wearables/robe/robe_jedi_padawan.iff"
	end]]

	giveItem(pInventory, robeTemplate, -1)
	CreatureObject(pPlayer):sendSystemMessage("@force_rank:items_recovered")
end
