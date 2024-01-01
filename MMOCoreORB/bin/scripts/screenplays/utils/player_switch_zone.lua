-- wrapper to prohibid porting while in combat
function playerSwitchZoneOutOfCombat(pPlayer, ...)
	if (pPlayer ~= nil) then
		local player = LuaCreatureObject(pPlayer)
		if player:isInCombat() then
			player:sendSystemMessage("You can not port while in combat")
		elseif player:isIncapacitated() then
			player:sendSystemMessage("You can not port while incapped")
		else
			local pSceneObject = LuaSceneObject(pPlayer)
			if pSceneObject ~= nil then
				pSceneObject:switchZone(...)
				return true
			end
		end
	end
	return false
end

-- wrapper to prohibid porting while in combat
function playerSwitchZoneOutOfCombatRange(pPlayer,target,range, ...)
	if (pPlayer ~= nil) and (target ~= nil) then
		local player = LuaCreatureObject(pPlayer)
		if player:isInRangeWithObject(target, range) then
			if player:isInCombat() then
				player:sendSystemMessage("You can not port while in combat")
			elseif player:isIncapacitated() then
				player:sendSystemMessage("You can not port while incapped")
			else
				local pSceneObject = LuaSceneObject(pPlayer)
				if pSceneObject ~= nil then
					pSceneObject:switchZone(...)
					return true
				end
			end
		end
	end
	return false
end

--@faction: 0=unused, 1=same
--@cell 0 = outside anything else is the required cell id
--@pvpStatus 0=not used, 1=overt, 2=covert
function groupSwitchZoneOutOfCombatRange(pPlayer, range, cell, faction, pvpStatus, p,x,z,y,c, destination)
	local destination = destination or "Unknown"
	local range = range or 50
	if (pPlayer ~= nil) then
		local player = LuaCreatureObject(pPlayer)
		local pCell = LuaSceneObject(pPlayer):getParentID()
		if cell == 0 and (pCell ~= 0 or pCell == nil) then
			player:sendSystemMessage("You can not activate group port while not outdoors")
			return false
		end
		if player:isInCombat() then
			player:sendSystemMessage("You can not activate group port while in combat")
			return false
		end
		local port = table.concat({p,x,z,y,c},",")
		if player:isGrouped() then
			local gSize = player:getGroupSize()
			for i = 0, gSize-1 do
				local groupMember = player:getGroupMember(i)
				if (groupMember ~= nil) and SceneObject(groupMember):isPlayerCreature() then
					if (groupMember ~= pPlayer) then
						local groupMemberC = LuaCreatureObject(groupMember)
						pCell = LuaSceneObject(groupMember):getParentID()
						if (cell ~= 0 and cell ~= pCell) then
							groupMemberC:sendSystemMessage("You can not activate group port from this area")
						elseif cell == 0 and (pCell ~= 0 or pCell == nil) then
							groupMemberC:sendSystemMessage("You can not activate group port while not outdoors")
						elseif (faction == 1) and (groupMemberC:getFaction() ~= player:getFaction()) then
							groupMemberC:sendSystemMessage("You are incorrect faction to group port")
						elseif pvpStatus==1 and (groupMemberC:isOnLeave() or groupMemberC:isCovert()) then
							groupMemberC:sendSystemMessage("You must be COVERT to port to this location.")
						elseif pvpStatus==2 and (groupMemberC:isOnLeave() or groupMemberC:isOvert()) then
							groupMemberC:sendSystemMessage("You must be OVERT to port to this location.")
						elseif range ~=0 and not(groupMemberC:isInRangeWithObject(pPlayer, range)) then
							groupMemberC:sendSystemMessage("You are too far away to group port")				
						elseif groupMemberC:isInCombat() then
							groupMemberC:sendSystemMessage("You can not group port while in combat")
						elseif groupMemberC:isIncapacitated() then
							groupMemberC:sendSystemMessage("You can not group port while incapped")
						else
							local suiMessage = (SceneObject(pPlayer):getDisplayedName().." invites you to join Group Travel to "..destination.." on planet "..p..".\n\nDo you wish to join group travel?")
							--save travel point and time
							writeStringData("bfTeleport:"..tostring(groupMember), port)
							local sui = SuiMessageBox.new("bf_teleport_menu", "bookTravel")
							sui.setTitle("Bloodfin Travel:")
							sui.setPrompt(suiMessage)
							sui.setCancelButtonText = "Cancel"
							sui.setOkButtonText = "Teleport"
							sui.setTargetNetworkId(pPlayer)
							sui.setForceCloseDistance(50) --Distance hard cap
							sui.sendTo(groupMember)
							createEvent(46000, "bf_teleport_menu", "travelClose", groupMember,"")
						end
					else
					end
				end
			end
				writeStringData("bfTeleport:"..tostring(pPlayer), port)
				createEvent(15000, "bf_teleport_menu", "travel", pPlayer,"")
			return true
		else
			writeStringData("bfTeleport:"..tostring(pPlayer), port)
			createEvent(15000, "bf_teleport_menu", "travel", pPlayer,"")
			return true
		end
	end
	return false
end
