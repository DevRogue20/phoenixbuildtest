JediManager = require("managers.jedi.jedi_manager")
local ObjectManager = require("managers.object.object_manager")

jediManagerName = "HologrindJediManager"

NUMBEROFPROFESSIONSTOMASTER = 5 --Change back when going to live!!
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
		{ "crafting_architect_master", 		CRAFTING_ARCHITECT_MASTER  },
		{ "crafting_armorsmith_master", 	CRAFTING_ARMORSMITH_MASTER  },
		{ "outdoors_bio_engineer_master",    OUTDOORS_BIOENGINEER_MASTER  },
		{ "combat_bountyhunter_master",    COMBAT_BOUNTYHUNTER_MASTER },
		{ "combat_carbine_master", 		COMBAT_CARBINE_MASTER  },
		{ "crafting_chef_master", 		CRAFTING_CHEF_MASTER  },
		{ "science_combatmedic_master", 	SCIENCE_COMBATMEDIC_MASTER  },
		{ "combat_commando_master", 		COMBAT_COMMANDO_MASTER  },
		{ "outdoors_creaturehandler_master", 	OUTDOORS_CREATUREHANDLER_MASTER  },
		{ "social_dancer_master", 		SOCIAL_DANCER_MASTER  },
		{ "science_doctor_master", 		SCIENCE_DOCTOR_MASTER  },
		{ "crafting_droidengineer_master", 	CRAFTING_DROIDENGINEER_MASTER  },
		{ "combat_1hsword_master", 		COMBAT_1HSWORD_MASTER  },
		{ "social_imagedesigner_master", 	SOCIAL_IMAGEDESIGNER_MASTER  },
		{ "social_musician_master", 		SOCIAL_MUSICIAN_MASTER  },
		{ "combat_polearm_master", 		COMBAT_POLEARM_MASTER  },
		{ "combat_pistol_master", 		COMBAT_PISTOL_MASTER  },
		{ "outdoors_ranger_master", 		OUTDOORS_RANGER_MASTER  },
		{ "combat_rifleman_master", 		COMBAT_RIFLEMAN_MASTER  },
		{ "combat_smuggler_master", 		COMBAT_SMUGGLER_MASTER  },
		{ "outdoors_squadleader_master", 	OUTDOORS_SQUADLEADER_MASTER  },
		{ "combat_2hsword_master", 		COMBAT_2HSWORD_MASTER  },
		{ "crafting_tailor_master", 		CRAFTING_TAILOR_MASTER  },
		{ "crafting_weaponsmith_master", 	CRAFTING_WEAPONSMITH_MASTER  },
		{ "combat_unarmed_master", 		COMBAT_UNARMED_MASTER  },
		{ "bdg_thm_park_jabba_badge",   	BDG_THM_PARK_JABBA_BADGE },
		{ "bdg_thm_park_imperial_badge",   	BDG_THM_PARK_IMPERIAL_BADGE },
		{ "bdg_thm_park_rebel_badge",   	BDG_THM_PARK_REBEL_BADGE },
		{ "bdg_thm_park_nym_badge",   	BDG_THM_PARK_NYM_BADGE },
		{ "warren_hero",   	WARREN_HERO },
		{ "warren_compassion",   	WARREN_COMPASSION },
		{ "bdg_racing_agrilat_swamp",   	BDG_RACING_AGRILAT_SWAMP },
		{ "bdg_racing_keren_city",   	BDG_RACING_KEREN_CITY },
		{ "bdg_racing_mos_espa",   	BDG_RACING_MOS_ESPA },
		{ "bdg_racing_lok_marathon",   	BDG_RACING_LOK_MARATHON },
		{ "bdg_racing_narmle_memorial",   	BDG_RACING_NARMLE_MEMORIAL },
		{ "bdg_racing_nashal_river",    BDG_RACING_NASHAL_RIVER },
		{ "exp_tat_tusken_pool",   	EXP_TAT_TUSKEN_POOL },
		{ "exp_tat_krayt_skeleton",   	EXO_TAT_KRAYT_SKELETON },
		{ "exp_tat_sarlacc_pit",   	EXP_TAT_SARLACC_PIT },
		{ "exp_tat_krayt_graveyard",   	EXP_TAT_KRAYT_GRAVEYARD },
		{ "exp_dat_sarlacc",   	EXP_DAT_SARLACC },
		{ "bdg_library_trivia",    BDG_LIBRARY_TRIVIA },
		{ "bdg_exp_cor_bela_vistal_fountain",   	BDG_EXP_COR_BELA_VISTAL_FOUNTAIN}
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
function HologrindJediManager:notifyOkPressed(pPlayer, pCreatureObject, pInventory)
	SceneObject(pPlayer):switchZone("dungeon2", 27.5, -3.8, -159.3, 14201899)
end

function HologrindJediManager:tierTwoOkPressed(pPlayer, pCreatureObject, pInventory)
	SceneObject(pPlayer):switchZone("corellia", -151, 28, -4723, 0)
end

-- Send a sui window to the player about unlocking jedi and award jedi status and force sensitive skill.
-- @param pCreatureObject pointer to the creature object of the player who unlocked jedi.
function HologrindJediManager:sendSuiWindow(pCreatureObject)
	local suiManager = LuaSuiManager()
	suiManager:sendMessageBox(pCreatureObject, pCreatureObject, "Force Awakening", "Congratulations, apprentice of the Force. You've unlocked another level of enlightenment. When you are ready to continue press the okay button and you will ported to the next part of your jouney.", "@ok", "HologrindJediManager", "notifyOkPressed")
end

function HologrindJediManager:tierTwoSuiWindow(pCreatureObject)
	local suiManager = LuaSuiManager()
	suiManager:sendMessageBox(pCreatureObject, pCreatureObject, "Destiny is a Choice", "You have unlocked a new quest. Follow the waypoint to Darian Veilwalker to choose your Jedi path. You will find him on Corellia.", "@ok", "HologrindJediManager", "tierTwoOkPressed")
end

-- Award skill and jedi status to the player.
-- @param pCreatureObject pointer to the creature object of the player who unlocked jedi.
function HologrindJediManager:awardJediStatusAndSkill(pCreatureObject)
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
    sendMail("Phoenix Jedi", "@jedi_spam:welcome_subject", "Congratulations on achieving the rank of Jedi. Here is an overview of what to expect. Your first task will be to use your newly acquired Holocron of the Five Masters to teleport to your trainer and learn your first skill box. You must surrender all skills to learn this skill. Once you have done this will be able to equip your robe and craft a saber. The training grounds have a 15-minute timer in which you will be removed from the area upon expiration. If you finish your training before the 15 minutes is up, you can use one of the teleports in the room to return to the world. Gaining experience will be challenging, you will start as a lowly and weak padawan learner with no other skills to help you. Beware, the path ahead is fraught with peril. Seeking help will increase your visibility, and with it, the threat of bounty hunters. Death hurts… You will die at some point, and you will lose xp when this happens. Be wary of your surroundings when displaying any aspect of your craft as you will draw the attention of Bounty Hunters looking for easy prey. As you venture forth, trust becomes a precious commodity. There will be those who seek to see you fall. Survive the harsh environments and the trials that await you. Your journey as a Jedi will test your resolve and your wisdom. Once again, congratulations on this momentous achievement. May the Force guide you and be with you always.", CreatureObject(pCreatureObject):getFirstName())
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
	createObserver(BADGEAWARDED, "jedi_tier2", "checkPlayerStatus", pCreatureObject)
end

-- Handling of the onPlayerLoggedIn event. The progression of the player will be checked and observers will be registered.
-- @param pCreatureObject pointer to the creature object of the player who logged in.
function HologrindJediManager:onPlayerLoggedIn(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	jedipush:onPlayerLoggedIn(pCreatureObject)
	jedi_tier2:onPlayerLoggedIn(pCreatureObject)
	self:checkIfProgressedToJedi(pCreatureObject)
	self:registerObservers(pCreatureObject)
end

function HologrindJediManager:onPlayerLoggedOut(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	jedipush:onPlayerLoggedOut(pCreatureObject)
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

	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()

	if itemType == ITEMHOLOCRON then
		-- Check if the player has the force_title_jedi_rank_02 skill
		if pGhost and PlayerObject(pGhost):isJedi() then
			-- Use the holocron from the PushJediManagerHolocron screenplay
			self:useHolocron(pSceneObject, pCreatureObject)
		else
			local isSilent = self:sendHolocronMessage(pCreatureObject)
			if isSilent then
				return
			else
				SceneObject(pSceneObject):destroyObjectFromWorld()
				SceneObject(pSceneObject):destroyObjectFromDatabase()
			end
		end
	end
end

-- PushJediManagerHolocron functionality

USEDHOLOCRON = "used_holocron"
HOLOCRONCOOLDOWNTIME = 24 * 60 * 60 * 1000 -- 24 hours

-- Check if the player can use the holocron.
-- @param pPlayer pointer to the creature object of the player who tries to use the holocron.
-- @return true if the player can use the holocron.
function HologrindJediManager:canUseHolocron(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):isJedi() and CreatureObject(pPlayer):checkCooldownRecovery(USEDHOLOCRON)
end

-- Checks if the player can replenish the force or not.
-- @param pPlayer pointer to the creature object of the player who should be checked.
-- @return true if the player can replenish the force.
function HologrindJediManager:canReplenishForce(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):getForcePower() < PlayerObject(pGhost):getForcePowerMax()
end

-- Use the holocron on the player.
-- @param pSceneObject pointer to the scene object of the holocron.
-- @param pPlayer pointer to the creature object of the player who is using the holocron.
function HologrindJediManager:usePushHolocron(pSceneObject, pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	-- The holocron hums softly as you feel your Force power replenish.
	CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:holocron_force_replenish")
	PlayerObject(pGhost):setForcePower(PlayerObject(pGhost):getForcePowerMax())
	CreatureObject(pPlayer):addCooldown(USEDHOLOCRON, HOLOCRONCOOLDOWNTIME)

	SceneObject(pSceneObject):destroyObjectFromWorld()
	SceneObject(pSceneObject):destroyObjectFromDatabase()
end

-- Send message to the player that he cannot replenish the force.
-- @param pPlayer pointer to the creature object of the player that tries to use the holocron.
function HologrindJediManager:cannotReplenishForce(pPlayer)
	-- You are already at your maximum Force power.
	CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:holocron_force_max")
end

-- Send message to the player that he cannot use the holocron.
-- @param pPlayer pointer to the creature object of the player that tries to use the holocron.
function HologrindJediManager:cannotUseHolocron(pPlayer)
	-- The holocron hums briefly, but otherwise does nothing.
	CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:holocron_no_effect")
end

-- Handling of the useHolocron event.
-- @param pSceneObject pointer to the holocron object.
-- @param pPlayer pointer to the creature object that used the holocron.
function HologrindJediManager:useHolocron(pSceneObject, pPlayer)
	if self:canUseHolocron(pPlayer) then
		if self:canReplenishForce(pPlayer) then
			self:usePushHolocron(pSceneObject, pPlayer)
		else
			self:cannotReplenishForce(pPlayer)
		end
	else
		self:cannotUseHolocron(pPlayer)
	end
end

registerScreenPlay("HologrindJediManager", true)

return HologrindJediManager
