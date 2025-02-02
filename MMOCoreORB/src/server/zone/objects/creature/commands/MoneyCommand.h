/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef MONEYCOMMAND_H_
#define MONEYCOMMAND_H_

class MoneyCommand : public QueueCommand {
public:

	MoneyCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		return SUCCESS;
	}

};

#endif //MONEYCOMMAND_H_
