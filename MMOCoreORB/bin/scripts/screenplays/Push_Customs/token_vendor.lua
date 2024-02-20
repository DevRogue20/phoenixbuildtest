token_vendor = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("token_vendor", true)

spHelper = require("screenplayHelper")

local ObjectManager = require("managers.object.object_manager")

--------------------------------------
--   Initialize screenplay           -
--------------------------------------
function token_vendor:start()
	if (not isZoneEnabled("corellia")) then
		return 0
	end
	
	--self:spawnSceneObjects()
	self:spawnMobiles()
end

function token_vendor:spawnMobiles()

	local pCollector = spawnMobile("corellia", "token_vendor", 1, -159.2, 28, -4713.8, 107, 0 )
	local collector = LuaCreatureObject(pCollector)
	collector:setOptionsBitmask(264)
	collector:setCustomObjectName("\\#FFFF00Donator Tokens")
	createObserver(OBJECTRADIALUSED, "token_vendor", "dispense", pCollector)

	if (pCollector~= nil) then
		return 1
	end

end

function token_vendor:dispense(pCollector, pPlayer)
    if (pPlayer ~= nil) then
        local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
        local itemTemplate = "object/tangible/loot/misc/sports_award_s01.iff"

        for i = 1, 6 do
            local pItem = giveItem(pInventory, itemTemplate, -1)
        end

        CreatureObject(pPlayer):sendSystemMessage("You have received 6 donator tokens")
    end

    return 0
end