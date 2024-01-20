-- BY: Nexxus										-- last edited: 2.8.2018	-- (this code belongs soley to BloodfinEMU)
-- Edit by Push for use on Project Phoenix 1.18.2024
-----------------------------------------------(SCREENPLAY)
sher_karScreenPlay = ScreenPlay:new { numberOfActs = 1 ,
	planet = "dungeon2",
	questString = "sher_karScreenPlay",
	--port = "sherkar_transitpilot",
	weak = "sher_kar_praetorian",
	mid = "sher_kar_karling",
	hard = "sher_kar_boss",
}
registerScreenPlay("sher_karScreenPlay", true)

--Spawn Quest givers and triggers.
function sher_karScreenPlay:start()
	if (isZoneEnabled("dungeon2")) then
		self.spawnMobiles()
		self.populate()
	end
end

function sher_karScreenPlay:spawnMobiles()
--	rspawnMobile("planet", "mobile",1, 1115, 88, -179, -165, 0, 3,"" )
	return 0
end

function sher_karScreenPlay:populate()
	local play = sher_karScreenPlay
	local planet = play.planet
	--local port = play.port
	local weak = play.weak
	local mid = play.mid
	local hard = play.hard
	local quest = play.questString
	local sTbl
--mysterious cave
	--local cave = spawnSceneObject(planet,"object/building/mustafar/dungeon/monster_lair/must_monster_lair.iff", 0, 0, -1000, 0, math.rad(50))
	--local caveID = LuaSceneObject(cave):getObjectID()
	--writeData("dungeon2:legacy:sherKarCave",caveID)
	--LuaSceneObject(cave):setCustomObjectName("Sher Kar Cave")

	--local pCell, cellID
	--pCell = BuildingObject(cave):getNamedCell("r1")
	--print("pCell:",pCell)
	--if (pCell ~= nil) then
	--	cellID = SceneObject(pCell):getObjectID()

		--lspawnMobile(zoneName, spawnList, respawnTimer, x, z, y, heading, parentID, spawnRange, spawnCount, ai)
		--spawnMobile(planet, port, math.random(80,120), -22.9, 0.4, 9.5, 161, cellID)
		spawnMobile(planet, weak, math.random(80,120), -52.8, -5.5, 15.2, 123, 14201897)
		spawnMobile(planet, weak, math.random(80,120), -105.1, -16.5, -50.3, 178, 14201897)
		spawnMobile(planet, weak, math.random(80,120), -162.7, -17.7, -59.1, 148, 14201897)
		spawnMobile(planet, mid, math.random(80,120), -139.4, -0.2, -18.2, 123, 14201897)
		spawnMobile(planet, mid, math.random(80,120), -89.9, -18.1, -127.5, 179, 14201897)
		spawnMobile(planet, mid, math.random(80,120), -127.1, -17.4, -113.7, 167, 14201897)
		spawnMobile(planet, hard, math.random(2500,3100), -93.1, -7.3, -182.3, -27, 14201897)

		lspawnMobile(planet, {mid}, math.random(20,30),-93.1, -7.3, -182.3, -27, 14201897, 7, 3 ,"")
	--end

	return 0
end


