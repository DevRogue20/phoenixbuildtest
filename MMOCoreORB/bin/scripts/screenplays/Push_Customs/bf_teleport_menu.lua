bf_teleport_menu = {  }

function bf_teleport_menu:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	if (pPlayer == nil) then
		return false
	end

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	if pInventory == nil then
		return false
	end

	local name = LuaSceneObject(pSceneObject):getCustomObjectName()
	local response = LuaObjectMenuResponse(pMenuResponse)

------------(SHUTTLE PASSES)

-- Cnet single
	if name == "Cnet Transmission Pass (System Generated)" or name == "Cnet Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_cnet.iff", true)
		if pItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Cnet")

-- Theed single
	elseif name == "Theed Transmission Pass (System Generated)" or name == "Theed Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_theed.iff", true)
		if pItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Theed")

-- Eisley single
	elseif name == "Eisley Transmission Pass (System Generated)" or name == "Eisley Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_eisley.iff", true)
		if pItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Eisley")

-- Golden Shuttle pass
	elseif name == "Golden Transmission Pass (System Generated)" or name == "Golden Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_cnet.iff", true)
		if pItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Cnet")
		response:addRadialMenuItem(21, 3, "Teleport to Hoth")
		response:addRadialMenuItem(22, 3, "Teleport to Kashyyyk")
		response:addRadialMenuItem(23, 3, "Teleport to Kaas")

-- Group Cnet pass
	elseif name == "Cnet Group Transmission Pass (System Generated)" or name == "Cnet Group Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_cnet_group.iff", true)
		if pItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Cnet")

-- Golden Group Shuttle pass
	elseif name == "Golden Group Transmission Pass (System Generated)" or name == "Golden Group Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_cnet_group.iff", true)
		if pItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Cnet")
		response:addRadialMenuItem(21, 3, "Teleport to Hoth")
		response:addRadialMenuItem(22, 3, "Teleport to Kashyyyk")
		response:addRadialMenuItem(23, 3, "Teleport to Kaas")

------------(INSTANCE PASSES)

-- Warren single
	elseif name == "Warren Transmission Pass (System Generated)" or name == "Warren Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_warren.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to Warren")
-- Geo single
	elseif name == "Geo Transmission Pass (System Generated)" or name == "Geo Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_geo.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to Geo Caves")
-- Banshee single
	elseif name == "Banshee Transmission Pass (System Generated)" or name == "Banshee Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_banshee.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to Banshee Caves")
-- DWB single
	elseif name == "DWB Transmission Pass (System Generated)" or name == "DWB Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_dwb.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to DWB")
-- Geo Group
	elseif name == "Geo Group Pass (System Generated)" or name == "Geo Group Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_geo_group.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to Geo Caves")
-- DWB Group
	elseif name == "DWB Group Pass (System Generated)" or name == "DWB Group Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_dwb_group.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to DWB")
-- Golden Group Instance Pass
	elseif name == "Golden Group Instance Pass (System Generated)" or name == "Golden Group Instance Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_pve_group.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to DWB")
		response:addRadialMenuItem(21, 3, "Teleport to Warren")
		response:addRadialMenuItem(22, 3, "Teleport to Geo Caves")
		response:addRadialMenuItem(23, 3, "Teleport to Banshee Caves")

------------(PVP PASSES)

-- Golden Group PVP Pass
	elseif name == "Golden Group PVP Pass (System Generated)" or name == "Golden Group PVP Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_pvp_group.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to DWB")
		response:addRadialMenuItem(21, 3, "Teleport to Warren")
		response:addRadialMenuItem(22, 3, "Teleport to Geo Caves")
		response:addRadialMenuItem(23, 3, "Teleport to Banshee Caves")

------------(SPACE PASSES)

-- Nova Orion single
	elseif name == "Nova Orion Transmission Pass (System Generated)" or name == "Nova Orion Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_nova.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to Nova Orion")
-- ISD single
	elseif name == "ISD Transmission Pass (System Generated)" or name == "ISD Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_isd.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to ISD")
-- Avatar single
	elseif name == "Avatar Transmission Pass (System Generated)" or name == "Avatar Transmission Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_avatar.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to Avatar")
-- Golden Space Pass
	elseif name == "Golden Space Pass (System Generated)" or name == "Golden Space Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_space.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to Avatar")
		response:addRadialMenuItem(21, 3, "Teleport to ISD")
		response:addRadialMenuItem(22, 3, "Teleport to Nova Orion")
-- ISD group
	elseif name == "ISD Group Pass (System Generated)" or name == "ISD Group Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_isd_group.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to ISD")
-- Avatar group
	elseif name == "Avatar Group Pass (System Generated)" or name == "Avatar Group Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_avatar_group.iff", true)
		if pItem == nil then
			return false
		end
		response:addRadialMenuItem(20, 3, "Teleport to Avatar")

-- VIP ALLIANCE TELEPORT
	elseif name == "Phoenix VIP Rebel ITV (System Generated)" or name == "Phoenix VIP Rebel ITV" then
		local itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/terminal/terminal_travel_instant_xwing.iff", true)
		if itvItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Cnet,Corellia")
		response:addRadialMenuItem(21, 3, "Teleport to Hoth")
		response:addRadialMenuItem(22, 3, "Teleport to Theed,Naboo")
		response:addRadialMenuItem(23, 3, "Teleport to Narmle,Rori")
		response:addRadialMenuItem(24, 3, "Teleport to Dearic,Talus")
		response:addRadialMenuItem(25, 3, "Teleport to Mos Eisley,Tatooine")

-- VIP IMPERIAL TELEPORT
	elseif name == "Phoenix VIP Imperial ITV (System Generated)" or name == "Phoenix VIP Imperial ITV" then
		local itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/terminal/terminal_travel_instant_tie.iff", true)
		if itvItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Cnet,Corellia")
		response:addRadialMenuItem(21, 3, "Teleport to Hoth")
		response:addRadialMenuItem(22, 3, "Teleport to Theed,Naboo")
		response:addRadialMenuItem(23, 3, "Teleport to Narmle,Rori")
		response:addRadialMenuItem(24, 3, "Teleport to Dearic,Talus")
		response:addRadialMenuItem(25, 3, "Teleport to Mos Eisley,Tatooine")

--Jedi Quest
elseif name == "Force Beacon (System Generated)" or name == "Force Beacon" then
	local itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/tcg/series5/hangar_ships/jedi_fighter.iff", true)
	if itvItem == nil then
		print("ship is shit")
		return false
	end

	response:addRadialMenuItem(20, 3, "Teleport to the Force Esscence")

--Jedi Trainers
	elseif name == "Holocron of the Five Masters (System Generated)" or name == "Holocron of the Five Masters" then
		local itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/jedi/five_masters.iff", true)
		if itvItem == nil then
			print("holocron is shit")
			return false
		end

		response:addRadialMenuItem(20, 3, "Teleport to Padawan Trainer")

	elseif name == "Holocron of Eternal Light (System Generated)" or name == "Holocron of Eternal Light" then
		local itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/jedi/holocron_eternal.iff", true)
		if itvItem == nil then
			print("holocron is shit")
			return false
		end

		response:addRadialMenuItem(20, 3, "Teleport to Jedi Trainer")

	elseif name == "Holocron of Forbidden Knowledge (System Generated)" or name == "Holocron of Forbidden Knowledge" then
		local itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/jedi/holocron_forbidden.iff", true)
		if itvItem == nil then
			print("holocron is shit")
			return false
		end

		response:addRadialMenuItem(20, 3, "Teleport to Dark Jedi Trainer")

-- Bespin ITV
	elseif name == "Bespin Cloud Car ITV (System Generated)" or name == "Bespin Cloud Car ITV" then
		local itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/deed/vehicle_deed/twin_pod_cloud_car.iff", true)
		if itvItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Cnet,Corellia")
		response:addRadialMenuItem(21, 3, "Teleport to Cloud City, Bespin")



-- VIP dungeon itv TELEPORT
	elseif name == "Bloodfin VIP Dungeon ITV (System Generated)" or name == "Bloodfin VIP Dungeon ITV" then
		local itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/tcg/series7/combine_object_eweb_decor.iff", true)
		if itvItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Avatar")
		response:addRadialMenuItem(21, 3, "Teleport to ISD")
		response:addRadialMenuItem(22, 3, "Teleport to DWB")
		response:addRadialMenuItem(23, 3, "Teleport to Twin Sabers")
		response:addRadialMenuItem(24, 3, "Teleport to Geo Cave")
		response:addRadialMenuItem(25, 3, "Teleport to Banshee Cave")


-- RESPEC TICKET
	elseif name == "Respec Ticket (System Generated)" or name == "Respec Ticket" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/tcg/series1/consumable_radtrooper_badge.iff", true)
		if pItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Begin Respec Process")

-- Golden Group Space Pass
	elseif name == "Golden Group Space Pass (System Generated)" or name == "Golden Group Space Pass" then
		local pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_space_group.iff", true)
		if pItem == nil then
			return false
		end
		
		response:addRadialMenuItem(20, 3, "Teleport to Avatar")
		response:addRadialMenuItem(21, 3, "Teleport to ISD")
		response:addRadialMenuItem(22, 3, "Teleport to Nova Orion")
	else
		return false
	end
	return 0
end

function bf_teleport_menu:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)

	local range = 35
	local playerCreature = LuaCreatureObject(pPlayer)
	local pCell = LuaSceneObject(pPlayer):getParentID()
	local name = LuaSceneObject(pSceneObject):getCustomObjectName()
	if pCell == nil or pCell ~= 0 then
		playerCreature:sendSystemMessage("You must be outdoors and out of combat to use this item.")
		return 0
	end
	local ported = false
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
	local pItem = nil
	if LuaCreatureObject(pPlayer):isInCombat() or LuaCreatureObject(pPlayer):isIncapacitated() or LuaCreatureObject(pPlayer):isDead() then
		playerCreature:sendSystemMessage("You must be out of combat to use this item.")
		return 0
	end
	
		if LuaCreatureObject(pPlayer) ~= nil then
			local shouldGcwCrackdownTef, shouldGcwTef, shouldBhTef, shouldPvpTef = false, false, false, false
	
			-- Check if any of the variables is true
			if shouldGcwCrackdownTef or shouldGcwTef or shouldBhTef or shouldPvpTef then
				return 0
			end
	end

------------(SHUTTLE PASSES)
	
-- Cnet single
	if name == "Cnet Transmission Pass (System Generated)" or name == "Cnet Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_cnet.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "corellia", -148.3, 28, -4721.5, 85)
			playerCreature:sendSystemMessage("You are being transmitted to Corellia, Coronet")
		end
-- Theed single
	elseif name == "Theed Transmission Pass (System Generated)" or name == "Theed Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_theed.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "naboo", -4898, 6, 4124, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Naboo, Theed")
		end
-- Eisley single
	elseif name == "Eisley Transmission Pass (System Generated)" or name == "Eisley Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_eisley.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "tatooine", 3501, 5, -4852, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Tatooine, Eisley")
		end

-- VIP ALLIANCE Teleport

	elseif name == "Phoenix VIP Rebel ITV (System Generated)" or name == "Phoenix VIP Rebel ITV" then
		itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/terminal/terminal_travel_instant_xwing.iff", true)

		if (selectedID == 20) then
			LuaSceneObject(pPlayer):switchZone("corellia", -148.3, 28, -4721.5, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "corellia", -148.3, 28, -4721.5, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Corellia, Coronet")
		elseif (selectedID == 21) then
			LuaSceneObject(pPlayer):switchZone("hoth", 20, 0, -1982, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "hoth", -2246.8, 119.6, 719.9, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Hoth, Starport")
		elseif (selectedID == 22) then
			LuaSceneObject(pPlayer):switchZone("naboo", -4858.1, 6, 4168.2, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "naboo", -4858.1, 6, 4168.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Naboo, Theed")
		elseif (selectedID == 23) then
			LuaSceneObject(pPlayer):switchZone("rori", -5310, 80, -2221.2, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "rori", -5310, 80, -2221.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Rori, Narmle")
		elseif (selectedID == 24) then
			LuaSceneObject(pPlayer):switchZone("talus", 335.8, 6, -2931, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "talus", 335.8, 6, -2931, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Talus, Dearic")
		elseif (selectedID == 25) then
			LuaSceneObject(pPlayer):switchZone("tatooine", 3528.1, 5, -4802.2, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "tatooine", 3528.1, 5, -4802.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Tatooine, Mos Eisley")

		end


-- VIP IMPERIAL Teleport
	elseif name == "Phoenix VIP Imperial ITV (System Generated)" or name == "Phoenix VIP Imperial ITV" then
		itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/terminal/terminal_travel_instant_tie.iff", true)

		if (selectedID == 20) then
			LuaSceneObject(pPlayer):switchZone("corellia", -148.3, 28, -4721.5, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "corellia", -148.3, 28, -4721.5, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Corellia, Coronet")
		elseif (selectedID == 21) then
			LuaSceneObject(pPlayer):switchZone("hoth", 20, 0, -1982, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "hoth", -2246.8, 119.6, 719.9, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Hoth, Starport")
		elseif (selectedID == 22) then
			LuaSceneObject(pPlayer):switchZone("naboo", -4858.1, 6, 4168.2, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "naboo", -4858.1, 6, 4168.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Naboo, Theed")
		elseif (selectedID == 23) then
			LuaSceneObject(pPlayer):switchZone("rori", -5310, 80, -2221.2, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "rori", -5310, 80, -2221.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Rori, Narmle")
		elseif (selectedID == 24) then
			LuaSceneObject(pPlayer):switchZone("talus", 335.8, 6, -2931, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "talus", 335.8, 6, -2931, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Talus, Dearic")
		elseif (selectedID == 25) then
			LuaSceneObject(pPlayer):switchZone("tatooine", 3528.1, 5, -4802.2, 0)
			--ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "tatooine", 3528.1, 5, -4802.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Tatooine, Mos Eisley")

		end
--Jedi Quest
elseif name == "Force Beacon (System Generated)" or name == "Force Beacon" then
	if (selectedID == 20) then
		LuaSceneObject(pPlayer):switchZone("dungeon2", 27.5, -3.8, -159.3, 14201899)
		playerCreature:sendSystemMessage("You are being pulled through the nether by the Force")
	end

--Jedi Trainers
	elseif name == "Holocron of the Five Masters (System Generated)" or name == "Holocron of the Five Masters" then
		if (selectedID == 20) then
			LuaSceneObject(pPlayer):switchZone("dungeon2", 27.5, -3.8, -159.3, 14201901)
			playerCreature:sendSystemMessage("You are being pulled through the nether by the Force")
		end

	elseif name == "Holocron of Eternal Light (System Generated)" or name == "Holocron of Eternal Light" then
		if (selectedID == 20) then
			LuaSceneObject(pPlayer):switchZone("dungeon2", 27.5, -3.8, -159.3, 14201903)
			playerCreature:sendSystemMessage("You are being pulled through the nether by the Force")
		end

	elseif name == "Holocron of Forbidden Knowledge (System Generated)" or name == "Holocron of Forbidden Knowledge" then
		if (selectedID == 20) then
			LuaSceneObject(pPlayer):switchZone("dungeon2", 27.5, -3.8, -159.3, 610000432)
			playerCreature:sendSystemMessage("You are being pulled through the nether by the Force")
		end

-- Bespin ITV

	elseif name == "Bespin Cloud Car ITV (System Generated)" or name == "Bespin Cloud Car ITV" then
		itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/deed/vehicle_deed/twin_pod_cloud_car.iff", true)

		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "corellia", -148.3, 28, -4721.5, 85)
			playerCreature:sendSystemMessage("You are being transmitted to Corellia, Coronet")
		elseif (selectedID == 21) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "bespin", -167.8, 500.0, -24.9, 0)
			playerCreature:sendSystemMessage("Welcome to Cloud City, Bespin")


		end






-- VIP dungeon itv Teleport

	elseif name == "Bloodfin VIP Dungeon ITV (System Generated)" or name == "Bloodfin VIP Dungeon ITV" then
		itvItem = getContainerObjectByTemplate(pInventory, "object/tangible/tcg/series7/combine_object_eweb_decor.iff", true)

		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "space_lok", -914.2, 0, 1311.4,0)
			playerCreature:sendSystemMessage("You are being transmitted to the Avatar")
		elseif (selectedID == 21) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "space_tatooine", 9.2, 173.8, 64.9, 281475032599211)
			playerCreature:sendSystemMessage("You are being transmitted to the ISD")
		elseif (selectedID == 22) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "endor", -4680, 13, 4330, 0)
			playerCreature:sendSystemMessage("You are being transmitted to the DWB")
		elseif (selectedID == 23) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "tatooine", -2583, 0, -5509.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Tatooine, Lars Homested")

		elseif (selectedID == 24) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "yavin4", -6494, 83, -418, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Geo Caves")
		elseif (selectedID == 25) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "endor", -647, 2, -4895, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Banshee Cave")
		end


-- Character respec ticket



	elseif name == "Respec Ticket (System Generated)" or name == "Respec Ticket" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/tcg/series1/consumable_radtrooper_badge.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "umbra", 148.1, 25.0, 108.5, 0)
			playerCreature:sendSystemMessage("The VIP Bloodfin character respec/create ticket has been used...CAUTION - ONCE THIS TICKET IS USED IT IS CONSUMED.  IF YOU LEAVE THE RESPEC AREA YOU WILL REQUIRE ANOTHER TICKET TO RETURN")
		end


-- Golden Shuttle pass
	elseif name == "Golden Transmission Pass (System Generated)" or name == "Golden Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_cnet.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "corellia", -148.3, 28, -4721.5, 85)
			playerCreature:sendSystemMessage("You are being transmitted to Corellia, Coronet")
		elseif (selectedID == 21) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "hoth", -2246.8, 120.6, 719.9, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Hoth, Starport")
		elseif (selectedID == 22) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "kashyyyk", -4592.1, 100, -2273.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Kashyyk, Kachiro")
		elseif (selectedID == 23) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "kaas", -5172, 80, -2224.2, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Kaas, place")
		end
-- Group Cnet pass
	elseif name == "Cnet Group Transmission Pass (System Generated)" or name == "Cnet Group Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_cnet_group.iff", true)
		if (selectedID == 20) then
			--groupSwitchZoneOutOfCombatRange(pPlayer, range, cell, faction, pvpStatus, ..., Destination)
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "corellia", -148.3, 28, -4721.5, 85, "CNET")
			playerCreature:sendSystemMessage("You are being transmitted to Corellia, Coronet")
		end
-- Golden Group Shuttle pass
	elseif name == "Golden Group Transmission Pass (System Generated)" or name == "Golden Group Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_cnet_group.iff", true)
		if (selectedID == 20) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "corellia", -148.3, 28, -4721.5, 85, "CNET")
			playerCreature:sendSystemMessage("You are being transmitted to Corellia, Coronet")
		elseif (selectedID == 21) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "hoth", -2246.8, 120.6, 719.9, 0, "Hoth")
			playerCreature:sendSystemMessage("You are being transmitted to Hoth, Starport")
		elseif (selectedID == 22) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "kashyyyk", -4592.1, 100, -2273.2, 0, "Kashyyk")
			playerCreature:sendSystemMessage("You are being transmitted to Kashyyk, Kachiro")
		elseif (selectedID == 23) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "kaas", -5172, 80, -2224.2, 0, "Kaas")
			playerCreature:sendSystemMessage("You are being transmitted to Kaas, place")
		end
------------(INSTANCE PASSES)
-- Warren single
	elseif name == "Warren Transmission Pass (System Generated)" or name == "Warren Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_warren.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "dantooine", -556, 1, -3818, 0)
			playerCreature:sendSystemMessage("You are being transmitted to the Warren")
		end
-- Geo single
	elseif name == "Geo Transmission Pass (System Generated)" or name == "Geo Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_geo.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "yavin4", -6494, 83, -418, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Geo Caves")
		end
-- Banshee single
	elseif name == "Banshee Transmission Pass (System Generated)" or name == "Banshee Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_banshee.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "endor", -647, 2, -4895, 0)
			playerCreature:sendSystemMessage("You are being transmitted to Banshee Cave")
		end
-- DWB single
	elseif name == "DWB Transmission Pass (System Generated)" or name == "DWB Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_dwb.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "endor", -4680, 13, 4330, 0)
			playerCreature:sendSystemMessage("You are being transmitted to the DWB")
		end
-- Geo Group
	elseif name == "Geo Group Pass (System Generated)" or name == "Geo Group Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_geo_group.iff", true)
		if (selectedID == 20) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "yavin4", -6494, 83, -418, 0, "The Geo Caves")
			playerCreature:sendSystemMessage("You are being transmitted to the Geo Caves")
		end
-- DWB Group
	elseif name == "DWB Group Pass (System Generated)" or name == "DWB Group Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_dwb_group.iff", true)
		if (selectedID == 20) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "endor", -4680, 13, 4330, 0, "DWB")
			playerCreature:sendSystemMessage("You are being transmitted to the DWB")
		end
-- Golden Group Instance Pass
	elseif name == "Golden Group Instance Pass (System Generated)" or name == "Golden Group Instance Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_pve_group.iff", true)
		if (selectedID == 20) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "endor", -4680, 13, 4330, 0, "DWB")
			playerCreature:sendSystemMessage("You are being transmitted to the DWB")--dwb
		elseif (selectedID == 21) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "dantooine", -556, 1, -3818, 0, "The Warren")
			playerCreature:sendSystemMessage("You are being transmitted to the Warren")--warren
		elseif (selectedID == 22) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "yavin4", -6494, 83, -418, 0, "The Geo Caves")
			playerCreature:sendSystemMessage("You are being transmitted to the Geo Caves")--geo caves
		elseif (selectedID == 23) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "endor", -647, 2, -4895, 0, "Lake Rose")
			playerCreature:sendSystemMessage("You are being transmitted to the Banshee")--lake rose
		end
------------(SPACE PASSES)
-- Nova Orion single
	elseif name == "Nova Orion Transmission Pass (System Generated)" or name == "Nova Orion Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_nova.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "space_corellia", -12.2, -1, 5.6, 281475037675594)
			playerCreature:sendSystemMessage("You are being transmitted to Nova Orion Station")
		end
-- ISD single
	elseif name == "ISD Transmission Pass (System Generated)" or name == "ISD Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_isd.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "space_tatooine", 9.2, 173.8, 64.9, 281475032599211)
			playerCreature:sendSystemMessage("You are being transmitted to the ISD")
		end
-- Avatar single
	elseif name == "Avatar Transmission Pass (System Generated)" or name == "Avatar Transmission Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_avatar.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "space_lok", -914.2, 0, 1311.4,0)
			playerCreature:sendSystemMessage("You are being transmitted to the Avatar")
		end
-- Golden Space Pass
	elseif name == "Golden Space Pass (System Generated)" or name == "Golden Space Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_space.iff", true)
		if (selectedID == 20) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "space_lok", -914.2, 0, 1311.4,0)
			playerCreature:sendSystemMessage("You are being transmitted to the Avatar Platform")
		elseif (selectedID == 21) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "space_tatooine", 9.2, 173.8, 64.9, 281475032599211)
			playerCreature:sendSystemMessage("You are being transmitted to the ISD")
		elseif (selectedID == 22) then
			ported = playerSwitchZoneOutOfCombat(pPlayer, pCollector, "space_corellia", -12.2, -1, 5.6, 281475037675594)
			playerCreature:sendSystemMessage("You are being transmitted to Nova Orion space station")
		end
-- ISD Group
	elseif name == "ISD Group Pass (System Generated)" or name == "ISD Group Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_isd_group.iff", true)
		if (selectedID == 20) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "space_tatooine", 9.2, 173.8, 64.9, 281475032599211, "The ISD")
			playerCreature:sendSystemMessage("You are being transmitted to the ISD")
		end
-- Avatar Group
	elseif name == "Avatar Group Pass (System Generated)" or name == "Avatar Group Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_avatar_group.iff", true)
		if (selectedID == 20) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "space_lok", -914.2, 0, 1311.4, "The Avatar")
			playerCreature:sendSystemMessage("You are being transmitted to the Avatar")
		end
-- Golden Group Space Pass
	elseif name == "Golden Group Space Pass (System Generated)" or name == "Golden Group Space Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_space_group.iff", true)
		if (selectedID == 20) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "space_lok", -914.2, 0, 1311.4, "The Avatar")
			playerCreature:sendSystemMessage("You are being transmitted to the Avatar Platform")
		elseif (selectedID == 21) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "space_tatooine", 9.2, 173.8, 64.9, 281475032599211, "The ISD")
			playerCreature:sendSystemMessage("You are being transmitted to the ISD")
		elseif (selectedID == 22) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "space_corellia", -12.2, -1, 5.6, 281475037675594, "Nova Orion")
			playerCreature:sendSystemMessage("You are being transmitted to Nova Orion space station")
		end
-- Golden Group PVP Pass TODO
	elseif name == "Golden Group PVP Pass (System Generated)" or name == "Golden Group PVP Pass" then
		pItem = getContainerObjectByTemplate(pInventory, "object/tangible/mindsoft/bf_teleports/bf_teleport_gold_pvp_group.iff", true)
		if (selectedID == 20) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "space_lok", -914.2, 0, 1311.4, "The Avatar")
			playerCreature:sendSystemMessage("You are being transmitted to the Avatar Platform")
		elseif (selectedID == 21) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "space_tatooine", 9.2, 173.8, 64.9, 281475032599211, "The ISD")
			playerCreature:sendSystemMessage("You are being transmitted to the ISD")
		elseif (selectedID == 22) then
			ported = groupSwitchZoneOutOfCombatRange(pPlayer, range,0,0,0, "space_corellia", -12.2, -1, 5.6, 281475037675594, "Nova Orion")
			playerCreature:sendSystemMessage("You are being transmitted to Nova Orion space station")
		end
	else
	end
	
	if ported and pItem ~= nil then
		SceneObject(pItem):destroyObjectFromWorld()
		SceneObject(pItem):destroyObjectFromDatabase()
	end
	return 0
end

function bf_teleport_menu:travel(pPlayer)
	if pPlayer == nil then
		return false
	end
	local portString = readStringData("bfTeleport:"..tostring(pPlayer))
	local port = splitString(portString,",")
	local player = LuaCreatureObject(pPlayer)
	local pCell = LuaSceneObject(pPlayer):getParentID()
	deleteStringData("bfTeleport:"..tostring(pPlayer))
	if player ~= nil then
		if player:isInCombat() then
			player:sendSystemMessage("You can not activate group port while in combat")
			return false
		elseif player:isIncapacitated() then
			player:sendSystemMessage("You can not group port while incapped")
			return false
		elseif	port[1] == nil then
			player:sendSystemMessage("(Time Expired)\nYou must activate group port within 30 seconds")
			return false
		else
			CreatureObject(pPlayer):doAnimation("jump")
			return playerSwitchZoneOutOfCombat(pPlayer, port[1], port[2], port[3], port[4], port[5])
		end
		return true
	end
	return false
end
function bf_teleport_menu:bookTravel(pPlayer, pSui, eventIndex)
	if eventIndex == 1 or pPlayer == nil then
		return false
	end
	createEvent(15000, "bf_teleport_menu", "travel", pPlayer,"")
	CreatureObject(pPlayer):sendSystemMessage("you will be teleported in 15 seconds")
	return 0
end

function bf_teleport_menu:travelClose(pPlayer)
	local player = LuaCreatureObject(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("(Group Port Expired)")
	deleteStringData("bfTeleport:"..tostring(pPlayer))
	return 0
end

