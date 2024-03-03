hoth_test = ScreenPlay:new {
     		numberOfActs = 1,
     		
     		screenplayname = "hoth_test",
     		
     		states = {},
}

registerScreenPlay("hoth_test", true)

function hoth_test:start()
	if (isZoneEnabled("hoth")) then
		self:spawnMobiles()

	end
end

function hoth_test:spawnMobiles()

	local pUnkajo1 = spawnMobile("hoth", "unkajo", 300, -167.3, 0.0, -1961.5, 109, 0)
	local pUnkajo2 = spawnMobile("hoth", "unkajo", 300, -66.9, 0.0, -1810.9, -175, 0)
	local pUnkajo3 = spawnMobile("hoth", "unkajo", 300, 134.3, 0.0, -1843.8, -140, 0)
	local pAcklay1 = spawnMobile("hoth", "acklay", 300, -633, 10.9, -2768.8, -140, 0)
	local pAcklay2 = spawnMobile("hoth", "acklay", 300, -475, 10.0, -2535, -140, 0)
	local pAcklay3 = spawnMobile("hoth", "acklay", 300, -256, 10.0, -2447, -140, 0)
	local pWoolyy1 = spawnMobile("hoth", "woolamander_harrower", 300, -1223.5, 35.1, -106, 0)
	local pWoolyy2 = spawnMobile("hoth", "woolamander_harrower", 300, -1253.5, 29.2, -136, 0)
	local pWoolyy3 = spawnMobile("hoth", "woolamander_harrower", 300, -1283.5, 24.0, -166, 0)

end