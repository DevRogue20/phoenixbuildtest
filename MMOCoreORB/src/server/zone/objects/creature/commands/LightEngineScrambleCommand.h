/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef LIGHTENGINESCRAMBLE_H_
#define LIGHTENGINESCRAMBLE_H_

#include "CombatQueueCommand.h"

class LightEngineScrambleCommand : public CombatQueueCommand {
public:

	LightEngineScrambleCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		return doCombatAction(creature, target);
	}

};

#endif //LIGHTENGINESCRAMBLE_H_
