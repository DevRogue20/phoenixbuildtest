/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef INVULNERABLECOMMAND_H_
#define INVULNERABLECOMMAND_H_

#include "server/zone/objects/creature/events/InvisibleDelayEvent.h"

class InvulnerableCommand : public QueueCommand {
public:

	InvulnerableCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		CreatureObject* player = cast<CreatureObject*>(creature);

		if (player->isRidingMount())
			return GENERALERROR;

		StringTokenizer args(arguments.toString());

		if (args.hasMoreTokens()) {
			String subCmd;
			args.getStringToken(subCmd);

			if (subCmd.toLowerCase().beginsWith("invis")) {
				Reference<Task*> task = creature->getPendingTask("invisibledelayevent");

				if (task != nullptr) {
					if (!task->isScheduled()) {
						creature->playEffect("clienteffect/pl_force_resist_disease_self.cef");
						task->schedule(1600);
						return SUCCESS;
					} else {
						player->sendSystemMessage("You can not go invisible at this time");
						return GENERALERROR;
					}
				}

				Reference<InvisibleDelayEvent*> invisTask = new InvisibleDelayEvent(player);

				creature->playEffect("clienteffect/pl_force_resist_disease_self.cef");
				creature->addPendingTask("invisibledelayevent", invisTask, 1600);
			}

		} else {
			if (player->getPvpStatusBitmask() & CreatureFlag::PLAYER) {
				player->setPvpStatusBitmask(CreatureFlag::NONE);
				player->sendSystemMessage("You are now invulnerable.");

			} else if (player->getFactionStatus() == FactionStatus::OVERT) {
				player->setPvpStatusBitmask(CreatureFlag::PLAYER | CreatureFlag::OVERT);
				player->sendSystemMessage("You are no longer invulnerable");

			} else {
				player->setPvpStatusBitmask(CreatureFlag::PLAYER);
				player->sendSystemMessage("You are no longer invulnerable");
			}
		}

		player->broadcastPvpStatusBitmask();

		return SUCCESS;
	}

};

#endif //INVULNERABLECOMMAND_H_
