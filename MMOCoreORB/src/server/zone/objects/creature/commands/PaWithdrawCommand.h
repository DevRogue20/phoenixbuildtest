/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef PAWITHDRAWCOMMAND_H_
#define PAWITHDRAWCOMMAND_H_

class PaWithdrawCommand : public QueueCommand {
public:

	PaWithdrawCommand(const String& name, ZoneProcessServer* server)
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

#endif //PAWITHDRAWCOMMAND_H_
