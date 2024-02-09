-- BY: Push			For use on Project Phoenix
-----------------------------------------------(SCREENPLAY)-------------------------------------------
twin_sabers = ScreenPlay:new { numberOfActs = 1 ,
	planet = "tatooine",
	mid = "darkspirit",
	hard = "emptat",
}
registerScreenPlay("twin_sabers", true)

function twin_sabers:start()
	if (isZoneEnabled("tatooine")) then
		self.spawnMobiles()
		self.populate()
	end
end

function twin_sabers:spawnMobiles()
	return 0
end

function twin_sabers:populate()
	local play = twin_sabers
	local planet = play.planet
	local mid = play.mid
	local hard = play.hard
	local quest = play.questString
	local sTbl
--[[Palpatine cave
	local cave = spawnSceneObject(planet,"object/building/mustafar/dungeon/obiwan_finale/lair_of_the_crystal.iff", -2000, 0, -5000)
	local caveID = LuaSceneObject(cave):getObjectID()
	writeData("tatooine:legacy:twin_sabersCave",caveID)
	LuaSceneObject(cave):setCustomObjectName("Twin Sabers Cave")

	local pCell, cellID
	pCell = BuildingObject(cave):getNamedCell("mainroom")
	--print("pCell:",pCell)
	if (pCell ~= nil) then
		cellID = SceneObject(pCell):getObjectID()]]

		--lspawnMobile(zoneName, spawnList, respawnTimer, x, z, y, heading, parentID, spawnRange, spawnCount, ai)
		--spawnMobile(planet, port, math.random(80,120), -22.9, 0.4, 9.5, 161, cellID)
		spawnMobile(planet, mid, 1300, 65, 0.4, 3.6, 22, 609460014)
		spawnMobile(planet, mid, 1300, 61, -0.2, 5.2, 87, 609460014)
		spawnMobile(planet, mid, 1300, 64, 0.1, 9.1, 172, 609460014)
		spawnMobile(planet, hard, 3600, 67, 0.1, 5.5, -87, 609460014)
	--end

	return 0
end


