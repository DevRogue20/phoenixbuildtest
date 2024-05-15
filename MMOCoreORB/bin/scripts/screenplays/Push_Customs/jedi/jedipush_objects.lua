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

	local pCollector1 = spawnMobile("dungeon2", "aurora_sunrider", 1, 41.4, -4.2, -159.3, -90, 14201899)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportaurora", pCollector1)

	local pCollector2 = spawnMobile("corellia", "malakai_vorn", 1, 13.6, -4.2, -159.3, 90, 14201899)
	local collector2 = LuaCreatureObject(pCollector2)
	collector2:setOptionsBitmask(264)
	createObserver(OBJECTRADIALUSED, "jedipush_objects", "teleportmalakai", pCollector2)

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

    if (pCollector1 or pCollector2 or ptransport1 or ptransport2 or ptransport3 or ptransport4 or ptransport5 ~= nil) then
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

	--Dark Jedi Training Area
	spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_banner_dark.iff", 24.9, -2.9, -171.3, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/ui/ui_planet_imperial.iff", 18.7, -1.2, -170.8, 610000432, math.rad(0) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/all/frn_all_heroic_exar_brazier_01.iff", 27.5, -3.5, -169.9, 610000432, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s02.iff", 19.8, -4.2, -167.9, 610000432, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s01.iff", 19.8, -4.2, -166.5, 610000432, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_chair_s02.iff", 19.8, -4.2, -165.3, 610000432, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_table_dark_01.iff", 18.0, -4.2, -166.5, 610000432, math.rad(-90) )
    spawnSceneObject("dungeon2", "object/tangible/furniture/jedi/frn_all_dark_throne.iff", 14.5, -4.2, -166.5, 610000432, math.rad(90) )
    spawnSceneObject("dungeon2", "object/tangible/tcg/series8/vader_pod.iff", 14.9, -4.2, -162.5, 610000432, math.rad(45) )
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
end