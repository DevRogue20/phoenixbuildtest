/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef MELEE1HSCATTERHIT1COMMAND_H_
#define MELEE1HSCATTERHIT1COMMAND_H_

#include "CombatQueueCommand.h"

class Melee1hScatterHit1Command : public CombatQueueCommand {
public:

	Melee1hScatterHit1Command(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;
		
		float mods[3] = {0.f, 0.f, 0.f};
		
		for (int i = 0; i < 2; i++)
			mods[System::random(2)] += 0.5f;
			
		UnicodeString args = "healthDamageMultiplier=" + String::valueOf(mods[0]) + ";actionDamageMultiplier=" + String::valueOf(mods[1]) + ";mindDamageMultiplier=" + String::valueOf(mods[2]) + ";";

		return doCombatAction(creature, target, args);
	}

};

#endif //MELEE1HSCATTERHIT1COMMAND_H_
