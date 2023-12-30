tatMandoBunkerTest = ScreenPlay:new{
    numberOfActs = 1,

    screenplayName = "tatMandoBunkerTest"

}

registerScreenPlay("tatMandoBunkerTest", true)

function tatMandoBunkerTest:start()
    if (isZoneEnabled("tatooine")) then
        self:spawnSceneObjects()
        self:spawnMobiles()
        self:lockDoor()
    end
end

function tatMandoBunkerTest:spawnSceneObjects()
    local pActiveAreaOne = spawnActiveArea("tatooine", "object/active_area.iff", -14.9, -6.9, -12.0, 10, 9995373)
    if pActiveAreaOne ~= nil then
        createObserver(ENTEREDAREA, "tatMandoBunkerTest", "notifyEnteredAreaOne", pActiveAreaOne)

    end
end

function tatMandoBunkerTest:spawnMobiles()

    -- cornerhall1 CELL ID [9995375]
    spawnMobile("tatooine", "death_watch_overlord", 300, -17.0, -7.0, -0.1, -112, 9995375)

    -- t_intersect2 CELL ID [9995384]
    spawnMobile("tatooine", "death_watch_ghost", 300, -16.5, -7.0, -33.0, -90, 9995384)
    spawnMobile("tatooine", "death_watch_ghost", 300, -26.9, -7.0, -33.0, 90, 9995384)

end

function tatMandoBunkerTest:lockDoor(pCell)
    local pCell = getSceneObject(9995374)
    if (pCell ~= nil) then
        SceneObject(pCell):setContainerInheritPermissionsFromParent(false)
        SceneObject(pCell):clearContainerDefaultAllowPermission(WALKIN)
    end
end

function tatMandoBunkerTest:unlockDoor(pCell)
    local pCell = getSceneObject(9995374)
    if (pCell ~= nil) then
        SceneObject(pCell):setContainerInheritPermissionsFromParent(true)
        SceneObject(pCell):setContainerDefaultAllowPermission(WALKIN)
    end

end

function tatMandoBunkerTest:notifyEnteredAreaOne(pActiveAreaOne, pPlayer)

    print("if you get here the active area is working.")

	if (not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end

    print("if you get here the player check is working")
	
	if (CreatureObject(pPlayer):hasScreenPlayState(3, "tat_mando_bunker_boba_fett")) then
        print("if you get here everything is working except the unlock function.")
		self:unlockDoor()
		
	end
end

