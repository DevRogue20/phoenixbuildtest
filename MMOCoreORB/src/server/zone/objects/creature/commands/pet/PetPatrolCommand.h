
#ifndef PETPATROLCOMMAND_H_
#define PETPATROLCOMMAND_H_

#include "server/zone/objects/creature/commands/QueueCommand.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/creature/ai/DroidObject.h"
#include "server/zone/managers/creature/PetManager.h"

class PetPatrolCommand : public QueueCommand {
public:
	PetPatrolCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		ManagedReference<PetControlDevice*> controlDevice = creature->getControlDevice().get().castTo<PetControlDevice*>();
		if (controlDevice == nullptr)
			return GENERALERROR;

		ManagedReference<AiAgent*> pet = cast<AiAgent*>(creature);
		if (pet == nullptr)
			return GENERALERROR;

		if (pet->hasRidingCreature())
			return GENERALERROR;

		if (pet->getPosture() != CreaturePosture::UPRIGHT && pet->getPosture() != CreaturePosture::KNOCKEDDOWN)
			pet->setPosture(CreaturePosture::UPRIGHT);

		// Check if droid has power
		if (controlDevice->getPetType() == PetManager::DROIDPET) {
			ManagedReference<DroidObject*> droidPet = cast<DroidObject*>(pet.get());
			if (droidPet == nullptr)
				return GENERALERROR;

			if (!droidPet->hasPower()) {
				pet->showFlyText("npc_reaction/flytext", "low_power", 204, 0, 0); // "*Low Power*"
				return GENERALERROR;
			}
		}

		// ignore if pet is in combat
		if (pet->isInCombat())
			return GENERALERROR;

		Locker clocker(controlDevice, creature);

		if (controlDevice->getPatrolPointSize() == 0)
			return GENERALERROR;

		pet->setFollowObject(nullptr);
		pet->setMovementState(AiAgent::PATROLLING);
		pet->clearSavedPatrolPoints();

		for (int i = 0; i < controlDevice->getPatrolPointSize(); i++) {
			PatrolPoint point = controlDevice->getPatrolPoint(i);
			pet->addPatrolPoint(point);
		}

		return SUCCESS;
	}
};

#endif /* PETPATROLCOMMAND_H_ */
