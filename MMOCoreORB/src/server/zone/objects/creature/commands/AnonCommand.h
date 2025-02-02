/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef ANONCOMMAND_H_
#define ANONCOMMAND_H_

#include "server/zone/objects/player/PlayerObject.h"

class AnonCommand : public QueueCommand {
public:

	AnonCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		PlayerObject* ghost = creature->getPlayerObject();

		if (ghost != nullptr)
			ghost->toggleCharacterBit(PlayerBitmasks::ANONYMOUS);

		return SUCCESS;
	}

};

#endif //ANONCOMMAND_H_
