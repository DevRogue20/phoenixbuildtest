cnetAcklay = ScreenPlay:new{
    numberOfActs = 1,

    screenplayName = "cnetAcklay"

}

registerScreenPlay("cnetAcklay", true)

function cnetAcklay:start()
    if (isZoneEnabled("corellia")) then
      self:spawnMobiles()
    end
end

function cnetAcklay
:spawnMobiles()

    -- cornerhall1 CELL ID [9995375]
    spawnMobile("corellia", "acklay", 300, 60.9, 28.0, -4615.5, -76, 0)

end


