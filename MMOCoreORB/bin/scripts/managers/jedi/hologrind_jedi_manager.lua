JediManager = require("managers.jedi.jedi_manager")
local ObjectManager = require("managers.object.object_manager")

jediManagerName = "HologrindJediManager"

NUMBEROFPROFESSIONSTOMASTER = 1
MAXIMUMNUMBEROFPROFESSIONSTOSHOWWITHHOLOCRON = NUMBEROFPROFESSIONSTOMASTER - 0

HologrindJediManager = JediManager:new {
	screenplayName = jediManagerName,
	jediManagerName = jediManagerName,
	jediProgressionType = HOLOGRINDJEDIPROGRESSION,
	startingEvent = nil,
}

-- Return a list of all professions and their badge number that are available for the hologrind
-- @return a list of professions and their badge numbers.
function HologrindJediManager:getGrindableProfessionList()
	local grindableProfessions = {
		--[[ String Id, badge number, profession name
		--{ "pilot_rebel_navy_corellia", 	PILOT_REBEL_NAVY_CORELLIA },
		--{ "pilot_imperial_navy_corellia", 	PILOT_IMPERIAL_NAVY_CORELLIA },
		--{ "pilot_neutral_corellia", 		PILOT_CORELLIA },
		--{ "pilot_rebel_navy_tatooine", 	PILOT_REBEL_NAVY_TATOOINE },
		--{ "pilot_imperial_navy_naboo", 	PILOT_IMPERIAL_NAVY_NABOO },
		{ "crafting_architect_master", 		CRAFTING_ARCHITECT_MASTER  },
		{ "crafting_armorsmith_master", 	CRAFTING_ARMORSMITH_MASTER  },
		{ "crafting_artisan_master", 		CRAFTING_ARTISAN_MASTER  },
		{ "outdoors_bio_engineer_master", 	OUTDOORS_BIOENGINEER_MASTER  },
		{ "combat_bountyhunter_master", 	COMBAT_BOUNTYHUNTER_MASTER  },
		{ "combat_brawler_master", 		COMBAT_BRAWLER_MASTER  },
		{ "combat_carbine_master", 		COMBAT_CARBINE_MASTER  },
		{ "crafting_chef_master", 		CRAFTING_CHEF_MASTER  },
		{ "science_combatmedic_master", 	SCIENCE_COMBATMEDIC_MASTER  },
		{ "combat_commando_master", 		COMBAT_COMMANDO_MASTER  },
		{ "outdoors_creaturehandler_master", 	OUTDOORS_CREATUREHANDLER_MASTER  },
		{ "social_dancer_master", 		SOCIAL_DANCER_MASTER  },
		{ "science_doctor_master", 		SCIENCE_DOCTOR_MASTER  },
		{ "crafting_droidengineer_master", 	CRAFTING_DROIDENGINEER_MASTER  },
		{ "social_entertainer_master", 		SOCIAL_ENTERTAINER_MASTER  },
		{ "combat_1hsword_master", 		COMBAT_1HSWORD_MASTER  },
		{ "social_imagedesigner_master", 	SOCIAL_IMAGEDESIGNER_MASTER  },
		{ "combat_marksman_master", 		COMBAT_MARKSMAN_MASTER  },
		{ "science_medic_master", 		SCIENCE_MEDIC_MASTER  },
		{ "crafting_merchant_master", 		CRAFTING_MERCHANT_MASTER  },
		{ "social_musician_master", 		SOCIAL_MUSICIAN_MASTER  },
		{ "combat_polearm_master", 		COMBAT_POLEARM_MASTER  },
		{ "combat_pistol_master", 		COMBAT_PISTOL_MASTER  },
		--{ "social_politician_master", 	SOCIAL_POLITICIAN_MASTER  },
		{ "outdoors_ranger_master", 		OUTDOORS_RANGER_MASTER  },
		{ "combat_rifleman_master", 		COMBAT_RIFLEMAN_MASTER  },
		{ "outdoors_scout_master", 		OUTDOORS_SCOUT_MASTER  },
		--{ "crafting_shipwright", 		CRAFTING_SHIPWRIGHT },
		{ "combat_smuggler_master", 		COMBAT_SMUGGLER_MASTER  },
		{ "outdoors_squadleader_master", 	OUTDOORS_SQUADLEADER_MASTER  },
		{ "combat_2hsword_master", 		COMBAT_2HSWORD_MASTER  },
		{ "crafting_tailor_master", 		CRAFTING_TAILOR_MASTER  },
		{ "crafting_weaponsmith_master", 	CRAFTING_WEAPONSMITH_MASTER  },
		--{ "pilot_neutral_naboo", 		PILOT_NEUTRAL_NABOO },
		--{ "pilot_neutral_tatooine", 		PILOT_TATOOINE },
		--{ "pilot_imperial_navy_tatooine", 	PILOT_IMPERIAL_NAVY_TATOOINE },
		{ "combat_unarmed_master", 		COMBAT_UNARMED_MASTER  },]]
		{ "bdg_exp_cor_bela_vistal_fountain",   	BDG_EXP_COR_BELA_VISTAL_FOUNTAIN}
	--{ "pilot_rebel_navy_naboo", 		PILOT_REBEL_NAVY_NABOO }
	}
	-- Filter out unknown professions (badge number 0)
    grindableProfessions = filterProfessions(grindableProfessions, function(profession) 
        return profession[2] ~= 0
    end)

    return grindableProfessions
end

-- Helper function to filter professions based on a condition
function filterProfessions(professions, condition)
    local result = {}
    for i = 1, #professions do
        if condition(professions[i]) then
            table.insert(result, professions[i])
        end
    end
    return result
end

-- Handling of the onPlayerCreated event.
-- Hologrind professions will be generated for the player.
-- @param pCreatureObject pointer to the creature object of the created player.
function HologrindJediManager:onPlayerCreated(pCreatureObject)
	local skillList = self:getGrindableProfessionList()

	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	for i = 1, NUMBEROFPROFESSIONSTOMASTER, 1 do
		local numberOfSkillsInList = #skillList
		local skillNumber = getRandomNumber(1, numberOfSkillsInList)
		PlayerObject(pGhost):addHologrindProfession(skillList[skillNumber][2])
		table.remove(skillList, skillNumber)
	end
end

-- Check and count the number of mastered hologrind professions.
-- @param pCreatureObject pointer to the creature object of the player which should get its number of mastered professions counted.
-- @return the number of mastered hologrind professions.
function HologrindJediManager:getNumberOfMasteredProfessions(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return 0
	end

	local professions = PlayerObject(pGhost):getHologrindProfessions()
	local masteredNumberOfProfessions = 0
	for i = 1, #professions, 1 do
		if PlayerObject(pGhost):hasBadge(professions[i]) then
			masteredNumberOfProfessions = masteredNumberOfProfessions + 1
		end
	end
	return masteredNumberOfProfessions
end

-- Check if the player is jedi.
-- @param pCreatureObject pointer to the creature object of the player to check if he is jedi.
-- @return returns if the player is jedi or not.
function HologrindJediManager:isJedi(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):isJedi()
end

-- Sui window ok pressed callback function.
function HologrindJediManager:notifyOkPressed()
-- Do nothing.
end

-- Send a sui window to the player about unlocking jedi and award jedi status and force sensitive skill.
-- @param pCreatureObject pointer to the creature object of the player who unlocked jedi.
function HologrindJediManager:sendSuiWindow(pCreatureObject)
	local suiManager = LuaSuiManager()
	suiManager:sendMessageBox(pCreatureObject, pCreatureObject, "@quest/force_sensitive/intro:force_sensitive", "Congratulations, you have reached the next level of enlightenment. Seek out a vergence in the force on Dantooine to continue your path...", "@ok", "HologrindJediManager", "notifyOkPressed")
end

-- Award skill and jedi status to the player.
-- @param pCreatureObject pointer to the creature object of the player who unlocked jedi.
function HologrindJediManager:awardJediStatusAndSkill(pCreatureObject, pPlayer, pGhost, pInventory)
    local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

    if (pGhost == nil) then
        return
    end

	
	CreatureObject(pCreatureObject):sendSystemMessage("Congratulations You Have unlocked Jedi!")
    CreatureObject(pCreatureObject):playEffect("clienteffect/trap_electric_01.cef", "")
	CreatureObject(pCreatureObject):playEffect("clienteffect/pl_force_meditate_self.cef", "")
    CreatureObject(pCreatureObject):playMusicMessage("sound/music_become_jedi.snd")
    awardSkill(pCreatureObject, "force_title_jedi_novice")
    awardSkill(pCreatureObject, "force_title_jedi_rank_01")
    PlayerObject(pGhost):setJediState(1)
    awardSkill(pCreatureObject, "force_title_jedi_rank_02")
    PlayerObject(pGhost):setJediState(2)

	local pInventory = SceneObject(pCreatureObject):getSlottedObject("inventory")

    -- Check inventory
    if (pInventory == nil or SceneObject(pInventory):isContainerFullRecursive()) then
        CreatureObject(pCreatureObject):sendSystemMessage("@jedi_spam:inventory_full_jedi_robe")
    else
        -- Add Jedi robe to inventory
        local pInventory = CreatureObject(pCreatureObject):getSlottedObject("inventory")
        local pItem = giveItem(pInventory, "object/tangible/wearables/robe/robe_jedi_padawan.iff", -1)
    end

    -- Send welcome mail
    sendMail("Phoenix Jedi", "@jedi_spam:welcome_subject", "I hope this message finds you in high spirits and brimming with excitement, as you've achieved a remarkable milestone in your journey on Project Phoenix; unlocking your Jedi! Allow us to extend our heartfelt congratulations to you on this extraordinary accomplishment. Your dedication, perseverance, and hard work have undoubtedly paid off, leading you to this significant moment. Becoming a Jedi is no small feat, and your commitment to mastering the Force is truly commendable. It is a testament to your skill and determination within our community. However, as you step into the shoes of a Jedi, it's important to recognize that as you are capable of great feats of power, you will start your journey weak and vulnerable.  First off get your training saber crafted and get to practicing your skills. once you have enough experienced gained you can locate a trainer and train the Jedi Padawan Skill. It's crucial to remain vigilant and mindful of your actions as you embark on this new chapter of your journey. XP will be not be easy to achieve without help, but with help comes visibility and with visibility comes bounty hunters. The path is slow and long, but in the end you will be a true force. As you venture forth as a Jedi, It will be more important than ever to be warry of who you can trust. There will be those that wish to see your demise... with death comes a loss of skill, do what you must to survive the harsh environments. Once again, congratulations on this momentous achievement. May the Force be with you always.", CreatureObject(pCreatureObject):getFirstName())
	--sendMail("system", "@jedi_spam:welcome_subject", "@jedi_spam:welcome_body", CreatureObject(pCreatureObject):getFirstName())
end


-- Check if the player has mastered all hologrind professions and send sui window and award skills.
-- @param pCreatureObject pointer to the creature object of the player to check the jedi progression on.
function HologrindJediManager:checkIfProgressedToJedi(pCreatureObject)
	-- Check if the player already has a screenplay state related to the "jedipush" quest
    if CreatureObject(pCreatureObject):getScreenPlayState("jedipush") ~= 0 then
        -- Player already progressed in the quest, no need to proceed further
        return
    end
    
    -- Check if the player has mastered all hologrind professions and send sui window and award skills.
	if self:getNumberOfMasteredProfessions(pCreatureObject) >= NUMBEROFPROFESSIONSTOMASTER and not self:isJedi(pCreatureObject) then
		self:sendSuiWindow(pCreatureObject)
		CreatureObject(pCreatureObject):setScreenPlayState(1, "jedipush")
		--self:awardJediStatusAndSkill(pCreatureObject)

	end
end

-- Event handler for the BADGEAWARDED event.
-- @param pCreatureObject pointer to the creature object of the player who was awarded with a badge.
-- @param pCreatureObject2 pointer to the creature object of the player who was awarded with a badge.
-- @param badgeNumber the badge number that was awarded.
-- @return 0 to keep the observer active.
function HologrindJediManager:badgeAwardedEventHandler(pCreatureObject, pCreatureObject2, badgeNumber)
	if (pCreatureObject == nil) then
		return 0
	end

	self:checkIfProgressedToJedi(pCreatureObject)

	return 0
end

-- Register observer on the player for observing badge awards.
-- @param pCreatureObject pointer to the creature object of the player to register observers on.
function HologrindJediManager:registerObservers(pCreatureObject)
	createObserver(BADGEAWARDED, "HologrindJediManager", "badgeAwardedEventHandler", pCreatureObject)
end

-- Handling of the onPlayerLoggedIn event. The progression of the player will be checked and observers will be registered.
-- @param pCreatureObject pointer to the creature object of the player who logged in.
function HologrindJediManager:onPlayerLoggedIn(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end
		

	jedipush:onPlayerLoggedIn(pCreatureObject)
	self:checkIfProgressedToJedi(pCreatureObject)
	self:registerObservers(pCreatureObject)
	
end

-- Get the profession name from the badge number.
-- @param badgeNumber the badge number to find the profession name for.
-- @return the profession name associated with the badge number, Unknown profession returned if the badge number isn't found.
function HologrindJediManager:getProfessionStringIdFromBadgeNumber(badgeNumber)
	local skillList = self:getGrindableProfessionList()
	local unknownBadgeNumber = nil

	for i = 1, #skillList, 1 do
		if skillList[i][2] == badgeNumber then
			return skillList[i][1]
		end
	end

	-- If the loop completes without returning, the badgeNumber is unknown
	unknownBadgeNumber = badgeNumber
	print("Unknown badgeNumber: " .. tostring(unknownBadgeNumber))
	
	return "Unknown profession"
end


-- Find out and send the response from the holocron to the player
-- @param pCreatureObject pointer to the creature object of the player who used the holocron.
function HologrindJediManager:sendHolocronMessage(pCreatureObject)
    if self:getNumberOfMasteredProfessions(pCreatureObject) >= MAXIMUMNUMBEROFPROFESSIONSTOSHOWWITHHOLOCRON then
        -- The Holocron is quiet. The ancients' knowledge of the Force will no longer assist you on your journey. You must continue seeking on your own.
        CreatureObject(pCreatureObject):sendSystemMessage("@jedi_spam:holocron_quiet")
        return true
    else
        local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

        if (pGhost == nil) then
            return false
        end

        local professions = PlayerObject(pGhost):getHologrindProfessions()

        for i = 1, #professions, 1 do
            if not PlayerObject(pGhost):hasBadge(professions[i]) then
                local professionText = self:getProfessionStringIdFromBadgeNumber(professions[i])
                CreatureObject(pCreatureObject):sendSystemMessageWithTO("@jedi_spam:holocron_light_information", "@skl_n:" .. professionText)
                return false  -- Exit the function once an unmastered profession is found
            end
        end

        return false
    end
end


-- Handling of the useItem event.
-- @param pSceneObject pointer to the item object.
-- @param itemType the type of item that is used.
-- @param pCreatureObject pointer to the creature object that used the item.
function HologrindJediManager:useItem(pSceneObject, itemType, pCreatureObject)
	if (pCreatureObject == nil or pSceneObject == nil) then
		return
	end

	if itemType == ITEMHOLOCRON then
		local isSilent = self:sendHolocronMessage(pCreatureObject)
		if isSilent then
			return
		else
			SceneObject(pSceneObject):destroyObjectFromWorld()
			SceneObject(pSceneObject):destroyObjectFromDatabase()
		end
	end
end

function HologrindJediManager:canLearnSkill(pPlayer, skillName)
	return true
end

registerScreenPlay("HologrindJediManager", true)

return HologrindJediManager
