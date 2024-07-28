push_jedi_menu = {}

function push_jedi_menu:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)
	local player = CreatureObject(pPlayer)

	if (player:hasSkill("jedi_padawan_novice")) then
		menuResponse:addRadialMenuItem(20, 3, "@force_rank:recover_jedi_items") -- Recover Jedi Items
	end
end

function push_jedi_menu:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	if (selectedID == 20 and CreatureObject(pPlayer):hasSkill("jedi_padawan_novice")) then
		self:recoverRobe(pPlayer)
	end

	return 0
end

function push_jedi_menu:recoverRobe(pPlayer)
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

	giveItem(pInventory, robeTemplate, -1)
	CreatureObject(pPlayer):sendSystemMessage("@force_rank:items_recovered")
end
