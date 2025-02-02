/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef CREATUREAREAKNOCKDOWNCOMMAND_H_
#define CREATUREAREAKNOCKDOWNCOMMAND_H_

#include "CombatQueueCommand.h"

class CreatureAreaKnockdownCommand : public CombatQueueCommand {
public:

	CreatureAreaKnockdownCommand(const String& name, ZoneProcessServer* server) : CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isAiAgent())
			return GENERALERROR;

		return doCombatAction(creature, target, arguments);
	}

};

#endif //CREATUREAREAKNOCKDOWNCOMMAND_H_
