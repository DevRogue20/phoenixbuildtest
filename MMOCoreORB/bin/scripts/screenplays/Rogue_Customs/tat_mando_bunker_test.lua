tatMandoBunkerTest = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "tatMandoBunkerTest",

}

registerScreenPlay("tatMandoBunkerTest", true)

function tatMandoBunkerTest:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()

	end
end

function tatMandoBunkerTest:spawnMobiles()

    	-- airlock CELL ID [9995373]
	local pBoba = spawnMobile("tatooine", "boba_fett_eow", 300, -5.6, -5.2, -9.8, 179, 9995373)
	
    	-- cornerhall1 CELL ID [9995375]
	spawnMobile("tatooine", "death_watch_overlord", 300, -17.0, -7.0, -0.1, -112, 9995375)
	
	-- t_intersect2 CELL ID [9995384]
	spawnMobile("tatooine", "death_watch_ghost", 300, -16.5, -7.0, -33.0, -90, 9995384)
	spawnMobile("tatooine", "death_watch_ghost", 300, -26.9, -7.0, -33.0, 90, 9995384)
	
end
