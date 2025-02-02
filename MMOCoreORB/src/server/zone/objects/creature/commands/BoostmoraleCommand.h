/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef BOOSTMORALECOMMAND_H_
#define BOOSTMORALECOMMAND_H_

#include "server/zone/objects/group/GroupObject.h"
#include "server/chat/ChatManager.h"
#include "SquadLeaderCommand.h"

class BoostmoraleCommand : public SquadLeaderCommand {
public:

	BoostmoraleCommand(const String& name, ZoneProcessServer* server)
		: SquadLeaderCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<CreatureObject*> player = cast<CreatureObject*>(creature);

		if (player == nullptr)
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		ManagedReference<GroupObject*> group = player->getGroup();

		if (!checkGroupLeader(player, group))
			return GENERALERROR;

		int hamCost = (int) (100.0f * calculateGroupModifier(group));

		int healthCost = creature->calculateCostAdjustment(CreatureAttribute::STRENGTH, hamCost);
		int actionCost = creature->calculateCostAdjustment(CreatureAttribute::QUICKNESS, hamCost);
		int mindCost = creature->calculateCostAdjustment(CreatureAttribute::FOCUS, hamCost);

		if (!inflictHAM(player, healthCost, actionCost, mindCost))
			return GENERALERROR;

//		shoutCommand(player, group);

		int wounds[2] = {0,0}; // members affected, total wounds
		getWounds(player, group, wounds);
		if (wounds[0] == 0)
			return GENERALERROR;

		if (!distributeWounds(player, group, wounds))
			return GENERALERROR;

		if (!ghost->getCommandMessageString(STRING_HASHCODE("boostmorale")).isEmpty() && creature->checkCooldownRecovery("command_message")) {
			UnicodeString shout(ghost->getCommandMessageString(STRING_HASHCODE("boostmorale")));
 	 	 	server->getChatManager()->broadcastChatMessage(player, shout, 0, 80, player->getMoodID(), 0, ghost->getLanguageID());
 	 	 	creature->updateCooldownTimer("command_message", 30 * 1000);
		}

		return SUCCESS;
	}

	void getWounds(CreatureObject* leader, GroupObject* group, int* wounds) const {
		if (group == nullptr || leader == nullptr)
			return;

		for (int i = 0; i < group->getGroupSize(); i++) {

			ManagedReference<CreatureObject*> member = group->getGroupMember(i);

			if (member == nullptr)
				continue;

			if (!member->isPlayerCreature())
				continue;

			if (!isValidGroupAbilityTarget(leader, member, false))
				continue;

			Locker clocker(member, leader);

			for (int j = 0; j < 9; j++) {
				wounds[1] += member->getWounds(j);
				member->setWounds(j, 0);
			}

			wounds[0]++;
		}
	}

	bool distributeWounds(CreatureObject* leader, GroupObject* group, int* wounds) const {
		if (group == nullptr || leader == nullptr)
			return false;

		int woundsPerMember = ceil((float)wounds[1]/(float)wounds[0]);
		int woundsPerAttribute = ceil((float)woundsPerMember/9.f);

		int totalWoundsApplied = 0;
		for (int i = 0; i < group->getGroupSize(); i++) {

			ManagedReference<CreatureObject*> member = group->getGroupMember(i);

			if (member == nullptr)
				continue;

			if (!member->isPlayerCreature())
				continue;

			if (!isValidGroupAbilityTarget(leader, member, false))
				continue;

			Locker clocker(member, leader);

			sendCombatSpam(member);

			int woundsApplied = 0;
			for (int j = 0; j < 9; j++) {
				int woundsToApply = woundsPerAttribute;

				// if we've already applied enough wounds to this member, reduce to the amount we have left
				if (woundsApplied + woundsToApply > woundsPerMember)
					woundsToApply = woundsPerMember - woundsApplied;

				// if we've already applied enough wounds to the entire group, reduce to the amount we have left
				if (totalWoundsApplied + woundsToApply > wounds[1])
					woundsToApply = wounds[1] - totalWoundsApplied;

				member->addWounds(j, woundsToApply, true, false);

				woundsApplied += woundsToApply;
				totalWoundsApplied += woundsToApply;

				if (woundsApplied >= woundsPerMember || totalWoundsApplied >= wounds[1])
					break;
			}

			checkForTef(leader, member);

			if (totalWoundsApplied >= wounds[1])
				break;
		}

		return true;
	}

};

#endif //BOOSTMORALECOMMAND_H_
