bhbunkerScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "bhbunkerScreenPlay",

}

registerScreenPlay("bhbunkerScreenPlay", true)

function bhbunkerScreenPlay:start()
	if (isZoneEnabled("dantooine")) then
		self:spawnMobiles()
	end
end

function bhbunkerScreenPlay:spawnMobiles()
	--Cell [9165383]
        
        spawnMobile("dantooine", "bh_invader", 300,  0.2,  0.3,  1.8,  -1,  9165393) 
        
        --Cell [9165394]
        
        spawnMobile("dantooine", "bh_invader", 300,  4.7,  0.3,  -4.0,  68,  9165394)
        
        --Cell [9165396]
        
        spawnMobile("dantooine", "bh_invader", 300,  3.2,  -12.0,  32.5,  176,  9165396)
        spawnMobile("dantooine", "bh_ripper", 300,  -16.2,  12.0,  50.7,  123,  9165396)
        spawnMobile("dantooine", "bh_chief", 300,  3.1,  -12.0,  68.0,  6,  9165396)
        spawnMobile("dantooine", "bh_invader", 300,  21.2, -12.0,  43.0,  -79,  9165396)
        
        
        --Cell [9165398]
        
        spawnMobile("dantooine", "bh_ripper", 300,  -47.6,  -20.0,  24.1,  -5,  9165398)
        spawnMobile("dantooine", "bh_invader", 300,  -48.5,  -20.0,  70.3,  -179,  9165398)
        spawnMobile("dantooine", "bh_invader", 300,  -77.7,  -20.0,  24.5,  82,  9165398)
        spawnMobile("dantooine", "bh_ripper", 300,  -77.4,  -20.0,  68.6,  114,  9165398)
        
end
