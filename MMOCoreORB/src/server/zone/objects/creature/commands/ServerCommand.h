/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SERVERCOMMAND_H_
#define SERVERCOMMAND_H_

#include "WeatherCommand.h"
#include "VendorInfoCommand.h"
#include "RevisionInfoCommand.h"
#include "ServerInfoCommand.h"
#include "PlayerManagerCommand.h"
#include "PlayerInfoCommand.h"
#include "ServerCommandFactory.h"
#include "DebugCommand.h"
#include "MarketCommand.h"
#include "ServerStatisticsCommand.h"
#include "PathFindCommand.h"
#include "SpawnPointInAreaCommand.h"
#include "ServerWhoCommand.h"

class ServerCommand : public QueueCommand {
	MethodFactory<String, CreatureObject*, uint64, const String&> methodFactory;

public:

	ServerCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

		methodFactory.registerMethod<WeatherCommand>("weather");
		methodFactory.registerMethod<VendorInfoCommand>("vendorinfo");
		methodFactory.registerMethod<RevisionInfoCommand>("revision");
		methodFactory.registerMethod<ServerInfoCommand>("info");
		methodFactory.registerMethod<PlayerManagerCommand>("playermanager");
		methodFactory.registerMethod<PlayerInfoCommand>("playerinfo");
		methodFactory.registerMethod<DebugCommand>("debug");
		methodFactory.registerMethod<MarketCommand>("market");
		methodFactory.registerMethod<ServerStatisticsCommand>("statistics");
		methodFactory.registerMethod<PathFindCommand>("pathfind");
		methodFactory.registerMethod<SpawnPointInAreaCommand>("spawnpointinarea");
		methodFactory.registerMethod<ServerWhoCommand>("who");
}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		StringTokenizer tokenizer(arguments.toString());

		if (!tokenizer.hasMoreTokens())
			return GENERALERROR;

		String commandName;
		tokenizer.getStringToken(commandName);

		String restOfArguments;
		if (tokenizer.hasMoreTokens())
			tokenizer.finalToken(restOfArguments);

		ServerCommand* unconst = const_cast<ServerCommand*>(this);
		
		int ret = unconst->methodFactory.runMethod(commandName, creature, target, restOfArguments);

		return SUCCESS;
	}

};

#endif //SERVERCOMMAND_H_
