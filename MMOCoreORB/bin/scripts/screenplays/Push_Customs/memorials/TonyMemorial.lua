TonyMemorial = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("TonyMemorial", true)


spHelper = require("screenplayHelper")

local ObjectManager = require("managers.object.object_manager")

function TonyMemorial:start()
	if (isZoneEnabled("naboo")) then
		self:spawnSceneObjects()	
		self:spawnMobiles()	

	end
end

function TonyMemorial:spawnSceneObjects()

	spawnSceneObject("naboo","object/building/player/city/garden_corellia_lrg_05.iff", 5191.7, 17.0, 1447.2, 0, math.rad(-75))

	spawnSceneObject("naboo","object/tangible/saga_system/rewards/frn_fireplace.iff", 5184.3, 18.0, 1444.2, 0, math.rad(-75))
	spawnSceneObject("naboo","object/tangible/saga_system/rewards/frn_fireplace.iff", 5196.6, 18.0, 1441.1, 0, math.rad(-75))
	spawnSceneObject("naboo","object/tangible/storyteller/prop/pr_loveday_bouquet.iff", 5191.7, 18.0, 1448.1, 0, math.rad(0))
	spawnSceneObject("naboo","object/tangible/storyteller/prop/pr_loveday_bouquet.iff", 5192.4, 18.0, 1447.6, 0, math.rad(0))
	spawnSceneObject("naboo","object/tangible/storyteller/prop/pr_loveday_bouquet.iff", 5190.9, 18.0, 1447.9, 0, math.rad(0))
	spawnSceneObject("naboo","object/tangible/tcg/series5/combine_object_vader_statuette.iff", 5193.6, 18.1, 1449.3, 0, 80)
	spawnSceneObject("naboo","object/tangible/tcg/series5/combine_object_vader_statuette.iff", 5190.7, 18.1, 1450.1, 0, 160)

	spawnSceneObject("naboo","object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 5207.1, 18.0, 1456.0, 0, 0)
	spawnSceneObject("naboo","object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 5200.6, 18.0, 1431.8, 0, 0)
	spawnSceneObject("naboo","object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 5176.5, 18.0, 1438.3, 0,0)
	spawnSceneObject("naboo","object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 5182.9, 18.0, 1462.3, 0,0)

	spawnSceneObject("naboo", "object/static/particle/pt_lair_evil_fire_large_green.iff", 5207.1, 18.0, 1456.0, 0, math.rad(90) )
	spawnSceneObject("naboo", "object/static/particle/pt_lair_evil_fire_large_green.iff", 5200.6, 18.0, 1431.8, 0, math.rad(90) )
	spawnSceneObject("naboo", "object/static/particle/pt_lair_evil_fire_large_green.iff", 5176.5, 18.0, 1438.3, 0, math.rad(90) )
	spawnSceneObject("naboo", "object/static/particle/pt_lair_evil_fire_large_green.iff", 5182.9, 18.0, 1462.3, 0, math.rad(90) )

--	spawnSceneObject("naboo","object/tangible/saga_system/rewards/jabba_fancyrug.iff", 5191.8, 18.0, 1448.8, 0, 0)
	spawnSceneObject("naboo","object/tangible/furniture/ep3_rewards/hologram_insignia_imperial_01.iff", 5192.3, 18.2, 1460.6, 0, 1)
	spawnSceneObject("naboo","object/tangible/furniture/ep3_rewards/hologram_insignia_rebel_01.iff", 5198.1, 18.2, 1459.2, 0, 1)

--nobuild
	spawnSceneObject("naboo", "object/static/structure/general/fs_village_nobuild_768m.iff", 5191.7, 17.0, 1447.2, 0, 0, 0, 0, 0)
end

function TonyMemorial:spawnMobiles()

	spawnMobile("naboo", "tony_memorial", 0, 5191.5, 18.0, 1447.1, 12, 0)

	spawnMobile("naboo", "male_ewok", 0, 5196.5, 18.0, 1456.1, -79, 0)
	spawnMobile("naboo", "male_ewok", 0, 5190.9, 18.0, 1454.6, 106, 0)
	spawnMobile("naboo", "male_ewok", 0, 5197.4, 18.0, 1451.1, -172, 0)
	spawnMobile("naboo", "male_ewok", 0, 5201.5, 18.0, 1448.7, -75, 0)
	spawnMobile("naboo", "male_ewok", 0, 5185.7, 18.0, 1454.4, -169, 0)
	spawnMobile("naboo", "male_ewok", 0, 5183.3, 18.0, 1450.2, 102, 0)
	
	spawnMobile("naboo", "memorialguard", 0, 5195.9, 18.0, 1453.2, -91, 0)
	spawnMobile("naboo", "memorialguard", 0, 5189.5, 18.0, 1447.7, 7, 0)
	spawnMobile("naboo", "memorialguard", 0, 5200.7, 18.0, 1445.7, -75, 0)
	spawnMobile("naboo", "memorialguard", 0, 5188.7, 18.0, 1453.6, -169, 0)

	spawnMobile("naboo", "memorialjedi", 0, 5191.6, 18.0, 1457.6, 104, 0)
	spawnMobile("naboo", "memorialjedi", 0, 5193.7, 18.0, 1446.4, 8, 0)
	spawnMobile("naboo", "memorialjedi", 0, 5200.5, 18.0, 1450.4, -166, 0)
	spawnMobile("naboo", "memorialjedi", 0, 5184.1, 18.0, 1453.2, 102, 0)



end
