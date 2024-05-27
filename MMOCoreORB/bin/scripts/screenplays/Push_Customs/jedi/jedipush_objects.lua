require('utils.player_switch_zone')
jedipush_objects = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("jedipush_objects", true)

spHelper = require("screenplayHelper")

local ObjectManager = require("managers.object.object_manager")

--------------------------------------
--   Initialize screenplay          --
--------------------------------------
function jedipush_objects:start()
	if (not isZoneEnabled("dungeon2")) then
		return 0
	end
	
	self:spawnSceneObjects()
	self:spawnMobiles()
end

function jedipush_objects:spawnMobiles()

	--Obiwan Room Exit NPC's
    local pCollector1 = spawnMobile("dungeon2", "aurora_sunrider", 1, 41.4, -4.2, -159.3, -90, 14201899)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportaurora", pCollector1)

	local pCollector2 = spawnMobile("corellia", "malakai_vorn", 1, 13.6, -4.2, -159.3, 90, 14201899)
	local collector2 = LuaCreatureObject(pCollector2)
	collector2:setOptionsBitmask(264)
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportmalakai", pCollector2)

    --Padawan Room Exit NPC's
	local ptransport1 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 24.9, -4.2, -152.8, 180, 14201901)
	local transport1 = LuaCreatureObject(ptransport1)
	transport1:setOptionsBitmask(264)
    transport1:setCustomObjectName("Imperial Outpost")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportimpoutpost", ptransport1)

    local ptransport2 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 29.4, -4.2, -152.8, 180, 14201901)
	local transport2 = LuaCreatureObject(ptransport2)
	transport2:setOptionsBitmask(264)
    transport2:setCustomObjectName("Abandoned Rebel Base")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportrebbase", ptransport2)

    local ptransport3 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 20.8, -4.2, -169.9, 0, 14201901)
	local transport3 = LuaCreatureObject(ptransport3)
	transport3:setOptionsBitmask(264)
    transport3:setCustomObjectName("Imperial Base")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportimpbase", ptransport3)

    local ptransport4 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 33.6, -4.2, -169.9, 0, 14201901)
	local transport4 = LuaCreatureObject(ptransport4)
	transport4:setOptionsBitmask(264)
    transport4:setCustomObjectName("Anchorhead")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportanchorhead", ptransport4)

	local ptransport5 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 27.5, -4.2, -153.2, 180, 14201901)
	self:setMoodString(ptransport5, "npc_sitting_chair")
	local transport5 = LuaCreatureObject(ptransport5)
	transport5:setOptionsBitmask(264)
    transport5:setCustomObjectName("Aurillia")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportaurillia", ptransport5)

    --Dark Jedi Room Exit NPC's
    local ptransport6 = spawnMobile("dungeon2", "dressed_dark_jedi_transport", 1, 27.5, -4.2, -153.2, 180, 610000432)
	self:setMoodString(ptransport5, "npc_sitting_chair")
	local transport6 = LuaCreatureObject(ptransport6)
	transport6:setOptionsBitmask(264)
    transport6:setCustomObjectName("Aurillia")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportaurillia", ptransport6)

    local ptransport7 = spawnMobile("dungeon2", "dressed_dark_jedi_transport", 1, 24.9, -4.2, -152.8, 180, 610000432)
	local transport7 = LuaCreatureObject(ptransport7)
	transport7:setOptionsBitmask(264)
    transport7:setCustomObjectName("Imperial Outpost")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportimpoutpost", ptransport7)

    --[[local ptransport8 = spawnMobile("dungeon2", "dressed_dark_jedi_transport", 1, 29.4, -4.2, -152.8, 180, 610000432)
	local transport8 = LuaCreatureObject(ptransport8)
	transport8:setOptionsBitmask(264)
    transport8:setCustomObjectName("")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "", ptransport8)]]

    local ptransport9 = spawnMobile("dungeon2", "dressed_dark_jedi_transport", 1, 20.8, -4.2, -169.9, 0, 610000432)
	local transport9 = LuaCreatureObject(ptransport9)
	transport9:setOptionsBitmask(264)
    transport9:setCustomObjectName("Imperial Base")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportimpbase", ptransport9)

    --[[local ptransport10 = spawnMobile("dungeon2", "dressed_dark_jedi_transport", 1, 33.6, -4.2, -169.9, 0, 610000432)
	local transport10 = LuaCreatureObject(ptransport10)
	transport10:setOptionsBitmask(264)
    transport10:setCustomObjectName("")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "", ptransport10)]]

    --Jedi Room Exit NPC's
    --[[local ptransport11 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 24.9, -4.2, -152.8, 180, 14201903)
	local transport11 = LuaCreatureObject(ptransport11)
	transport11:setOptionsBitmask(264)
    transport11:setCustomObjectName("")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "", ptransport11)]]

    local ptransport12 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 29.4, -4.2, -152.8, 180, 14201903)
	local transport12 = LuaCreatureObject(ptransport12)
	transport12:setOptionsBitmask(264)
    transport12:setCustomObjectName("Abandoned Rebel Base")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportrebbase", ptransport12)

    --[[local ptransport13 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 20.8, -4.2, -169.9, 0, 14201903)
	local transport13 = LuaCreatureObject(ptransport13)
	transport13:setOptionsBitmask(264)
    transport13:setCustomObjectName("")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "", ptransport13)]]

    local ptransport14 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 33.6, -4.2, -169.9, 0, 14201903)
	local transport14 = LuaCreatureObject(ptransport14)
	transport14:setOptionsBitmask(264)
    transport14:setCustomObjectName("Anchorhead")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportanchorhead", ptransport14)

	--[[local ptransport15 = spawnMobile("dungeon2", "dressed_padawan_teleport", 1, 27.5, -4.2, -153.2, 180, 14201903)
	self:setMoodString(ptransport15, "npc_sitting_chair")
	local transport15 = LuaCreatureObject(ptransport15)
	transport15:setOptionsBitmask(264)
    transport15:setCustomObjectName("Aurillia")
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportaurillia", ptransport15)]]

    if (pCollector1 or pCollector2 or ptransport1 or ptransport2 or ptransport3 or ptransport4 or ptransport5 or ptransport6 or ptransport7 or ptransport8 or ptransport9 or ptransport10 or ptransport11 or ptransport12 or ptransport13 or ptransport14 or ptransport15
    ~= nil) then
		return 1
	end
end

function jedipush_objects:teleportaurora(pCollector1, pPlayer)
		playerSwitchZoneOutOfCombatRange(pPlayer, pCollector1, 10 , "corellia", -27.6, -0.9, -0.8, 2625362)
	return 0
end

function jedipush_objects:teleportmalakai(pCollector2, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, pCollector2, 10 , "corellia", -31.5, -0.5, 6.7, 3075439)
	return 0
end

function jedipush_objects:teleportanchorhead(ptransport1, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport1, 10 , "tatooine", 7.8, -3.4, 5.8, 1213350)
	return 0
end

function jedipush_objects:teleportrebbase(ptransport2, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport2, 10 , "dantooine", 3.7, 0.1, -4.0, 8855669)
	return 0
end

function jedipush_objects:teleportimpbase(ptransport3, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport3, 10 , "rori", 4.0, 0.1, -2.5, 3475368)
	return 0
end

function jedipush_objects:teleportimpoutpost(ptransport4, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport4, 10 , "lok", 3.8, 0.1, -2.4, 8615436)
	return 0
end

function jedipush_objects:teleportaurillia(ptransport5, pPlayer)
	playerSwitchZoneOutOfCombatRange(pPlayer, ptransport5, 10 , "dathomir", 0.3, 1.2, -0.5, 14976)
	return 0
end

function jedipush_objects:spawnSceneObjects()
	--Obiwan Quest Room
    spawnSceneObject("dungeon2", "object/tangible/tcg/series5/decorative_jedi_forms_painting.iff", 42.5, -2.2, -157.5, 14201899, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_painting_jedi_crest.iff", 42.5, -2.2, -161.5, 14201899, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_light_01.iff", 37.1, -4.2, -164.5, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_throne.iff", 39.8, -4.2, -167.1, 14201899, math.rad(-45) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 37.0, -4.2, -168.3, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 34.5, -4.2, -167.1, 14201899, math.rad(45) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 33.5, -4.2, -164.6, 14201899, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 34.5, -4.2, -162.2, 14201899, math.rad(135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 37.0, -4.2, -161.0, 14201899, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 39.8, -4.2, -162.2, 14201899, math.rad(-135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 40.7, -4.2, -164.6, 14201899, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_rebel.iff", 35.8, -1.2, -170.8, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_light.iff", 30.2, -2.9, -171.3, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_painting_april_07.iff", 27.5, -3.0, -171.3, 14201899, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 24.9, -2.9, -171.3, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_imperial.iff", 18.7, -1.2, -170.8, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_heroic_exar_brazier_01.iff", 27.5, -3.5, -169.9, 14201899, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s02.iff", 19.8, -4.2, -167.9, 14201899, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s01.iff", 19.8, -4.2, -166.5, 14201899, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s02.iff", 19.8, -4.2, -165.3, 14201899, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_dark_01.iff", 18.0, -4.2, -166.5, 14201899, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_throne.iff", 14.5, -4.2, -166.5, 14201899, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/vader_pod.iff", 14.9, -4.2, -162.5, 14201899, math.rad(45) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series3/decorative_swg_tcg_painting.iff", 13.8, -2.7, -152.7, 14201899, math.rad(135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_sith_altar_01.iff", 17.9, -4.2, -152.6, 14201899, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 18.0, -2.7, -152.2, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_palpatine_statue.iff", 20.4, -4.2, -153.2, 14201899, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_heroic_exar_coffee_table.iff", 27.5, -4.2, -155.8, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_emp_chair.iff", 27.5, -4.2, -153.0, 14201899, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_yoda_fountain.iff", 34.6, -4.2, -154.2, 14201899, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_light_02.iff", 37.1, -4.2, -153.9, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_light.iff", 37.1, -2.7, -152.2, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_cube.iff", 32.3, -1.2, -153.3, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_dode.iff", 27.6, 0.0, -153.3, 14201899, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_triangle.iff", 22.7, -1.2, -153.3, 14201899, math.rad(0) )

    --Jedi Trainers Room
    spawnSceneObject("dungeon2", "object/tangible/tcg/series5/decorative_jedi_forms_painting.iff", 42.5, -2.2, -157.5, 14201901, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_painting_jedi_crest.iff", 42.5, -2.2, -161.5, 14201901, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_light_01.iff", 37.1, -4.2, -164.5, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_throne.iff", 39.8, -4.2, -167.1, 14201901, math.rad(-45) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 37.0, -4.2, -168.3, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 34.5, -4.2, -167.1, 14201901, math.rad(45) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 33.5, -4.2, -164.6, 14201901, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 34.5, -4.2, -162.2, 14201901, math.rad(135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 37.0, -4.2, -161.0, 14201901, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 39.8, -4.2, -162.2, 14201901, math.rad(-135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 40.7, -4.2, -164.6, 14201901, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_rebel.iff", 35.8, -1.2, -170.8, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_light.iff", 30.2, -2.9, -171.3, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_painting_april_07.iff", 27.5, -3.0, -171.3, 14201901, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 24.9, -2.9, -171.3, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_imperial.iff", 18.7, -1.2, -170.8, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_heroic_exar_brazier_01.iff", 27.5, -3.5, -169.9, 14201901, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s02.iff", 19.8, -4.2, -167.9, 14201901, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s01.iff", 19.8, -4.2, -166.5, 14201901, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s02.iff", 19.8, -4.2, -165.3, 14201901, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_dark_01.iff", 18.0, -4.2, -166.5, 14201901, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_throne.iff", 14.5, -4.2, -166.5, 14201901, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/vader_pod.iff", 14.9, -4.2, -162.5, 14201901, math.rad(45) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series3/decorative_swg_tcg_painting.iff", 13.8, -2.7, -152.7, 14201901, math.rad(135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_sith_altar_01.iff", 17.9, -4.2, -152.6, 14201901, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 18.0, -2.7, -152.2, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_palpatine_statue.iff", 20.4, -4.2, -153.2, 14201901, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_heroic_exar_coffee_table.iff", 27.5, -4.2, -155.8, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_emp_chair.iff", 27.5, -4.2, -153.0, 14201901, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_yoda_fountain.iff", 34.6, -4.2, -154.2, 14201901, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_light_02.iff", 37.1, -4.2, -153.9, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_light.iff", 37.1, -2.7, -152.2, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_cube.iff", 32.3, -1.2, -153.3, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_dode.iff", 27.6, 0.0, -153.3, 14201901, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_triangle.iff", 22.7, -1.2, -153.3, 14201901, math.rad(0) )

	--Light Jedi Training Area
	spawnSceneObject("dungeon2", "object/tangible/tcg/series5/decorative_jedi_forms_painting.iff", 42.5, -2.2, -157.5, 14201903, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_painting_jedi_crest.iff", 42.5, -2.2, -161.5, 14201903, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_light_01.iff", 37.1, -4.2, -164.5, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_throne.iff", 39.8, -4.2, -167.1, 14201903, math.rad(-45) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 37.0, -4.2, -168.3, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 34.5, -4.2, -167.1, 14201903, math.rad(45) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 33.5, -4.2, -164.6, 14201903, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 34.5, -4.2, -162.2, 14201903, math.rad(135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 37.0, -4.2, -161.0, 14201903, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 39.8, -4.2, -162.2, 14201903, math.rad(-135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_light_chair_s01.iff", 40.7, -4.2, -164.6, 14201903, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_rebel.iff", 35.8, -1.2, -170.8, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_light.iff", 30.2, -2.9, -171.3, 14201903, math.rad(0) )
	spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_yoda_fountain.iff", 27.6, -4.2, -153.3, 14201903, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_light_02.iff", 37.1, -4.2, -153.9, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_light.iff", 37.1, -2.7, -152.2, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_cube.iff", 32.3, -1.2, -153.3, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_dode.iff", 27.6, 0.0, -153.3, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_triangle.iff", 22.7, -1.2, -153.3, 14201903, math.rad(0) )
	spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_painting_april_07.iff", 27.5, -3.0, -171.3, 14201903, math.rad(90) )
	spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_light.iff", 24.9, -2.9, -171.3, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_rebel.iff", 18.7, -1.2, -170.8, 14201903, math.rad(0) )
	spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_light.iff", 18.0, -2.7, -152.2, 14201903, math.rad(0) )
	spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_light_02.iff", 18.0, -4.2, -153.9, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/city/statue_city_rebel_01.iff", 30.7, -4.2, -162.7, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/city/statue_city_rebel_01.iff", 24.2, -4.2, -162.7, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_rug_rebel.iff", 27.5, -4.2, -161.7, 14201903, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/decorative_bespin_glass_sculpture.iff", 30.2, -3.5, -168.7, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/decorative_bespin_glass_sculpture.iff", 24.9, -3.5, -168.7, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/decorative_bespin_lamp_on.iff", 30.2, -3.0, -168.7, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/decorative_bespin_lamp_on.iff", 24.9, -3.0, -168.7, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/decorative_bespin_lamp_on.iff", 42.0, -4.2, -156.4, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/decorative_bespin_lamp_on.iff", 13.1, -4.2, -156.4, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/mace_windu_statue.iff", 14.6, -4.2, -153.4, 14201903, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_jedi_library_bookshelf.iff", 13.4, -4.2, -169.0, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_jedi_library_bookshelf.iff", 13.4, -4.2, -167.0, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_jedi_library_bookshelf.iff", 13.4, -4.2, -165.0, 14201903, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_jedi_library_bookshelf.iff", 14.6, -4.2, -169.8, 14201903, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_jedi_library_bookshelf.iff", 14.6, -4.2, -167.8, 14201903, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_jedi_library_bookshelf.iff", 14.6, -4.2, -165.8, 14201903, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series1/decorative_jedi_library_bookshelf.iff", 14.6, -4.2, -163.8, 14201903, math.rad(90) )

	--Dark Jedi Training Area
	spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 24.9, -2.9, -171.3, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_imperial.iff", 18.7, -1.2, -170.8, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_heroic_exar_brazier_01.iff", 27.5, -3.5, -169.9, 610000432, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s02.iff", 19.8, -4.2, -167.9, 610000432, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s01.iff", 19.8, -4.2, -166.5, 610000432, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s02.iff", 19.8, -4.2, -165.3, 610000432, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_dark_01.iff", 18.0, -4.2, -166.5, 610000432, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_throne.iff", 14.5, -4.2, -166.5, 610000432, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/vader_pod.iff", 39.5, -4.2, -154.8, 610000432, math.rad(-135) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series3/decorative_swg_tcg_painting.iff", 13.8, -2.7, -152.7, 610000432, math.rad(135) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_sith_altar_01.iff", 17.9, -4.2, -152.6, 610000432, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 18.0, -2.7, -152.2, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_palpatine_statue.iff", 20.4, -4.2, -153.2, 610000432, math.rad(180) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_heroic_exar_coffee_table.iff", 27.5, -4.2, -155.8, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/veteran_reward/frn_vet_emp_chair.iff", 27.5, -4.2, -153.0, 610000432, math.rad(180) )
	spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_cube.iff", 32.3, -1.2, -153.3, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_dode.iff", 27.6, 0.0, -153.3, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_holocron_triangle.iff", 22.7, -1.2, -153.3, 610000432, math.rad(0) )
	spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_imperial.iff", 35.8, -1.2, -170.8, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 30.2, -2.9, -171.3, 610000432, math.rad(0) )
	spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 37.1, -2.7, -152.2, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/city/statue_city_imperial_01.iff", 30.7, -4.2, -162.7, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/city/statue_city_imperial_01.iff", 24.2, -4.2, -162.7, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/painting_tcg8_victory.iff", 27.5, -3.0, -171.3, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 41.7, -4.2, -157.4, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 41.7, -4.2, -161.3, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 13.3, -4.2, -157.4, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 13.3, -4.2, -161.3, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 25.1, -3.5, -168.0, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 30.0, -3.5, -168.0, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/outbreak_science_desk.iff", 41.3, -4.2, -166.7, 610000432, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/outbreak_shackled_man.iff", 41.1, -4.2, -170.0, 610000432, math.rad(-45) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_technical_console_s02.iff", 37.1, -4.2, -164.6, 610000432, math.rad(0) )
end