jedi_test_convo_template = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "jedi_test_convo_handler",
	screens = {}
}

intro = ConvoScreen:new {
	id = "intro",
	customDialogText = "Ah, this one shows... potential. The path to Jedi is not for the weak, many perils lie ahead. Should you choose to continue this journey, you will have to pass 5 trials. Should you fail any of these trials you will be abondoned by the force, never to achieve Jedi. Are you prepared to proceed?",
	stopConversation = "false",
	options = {
		{"I am prepared to face my trials", "trial_one"},
		{"I need more time to prepare", "exit_one"}
	}
}
jedi_test_convo_template:addScreen(intro);

exit_one = ConvoScreen:new {
	id = "exit_one",
	customDialogText = "Speak me to me again when you are prepared to proceed.",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(exit_one);

trial_one = ConvoScreen:new {
	id = "trial_one",
	customDialogText = "Your first trial centers around combat. This will require time and dedication. Head to Tatooine and slay 100 Tusken Warriors. Find me again once you have completed this trial.",
	stopConversation = "false",
	options = {
		{"I will do as you have instructed.", "task_one"},
		{"That seems like a lot, perhaps another time.", "exit_one"}
	}
}
jedi_test_convo_template:addScreen(trial_one);

task_one = ConvoScreen:new {
	id = "task_one",
	customDialogText = "Be mindful of your surroundings, let the force guide you.",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(task_one);

trial_two = ConvoScreen:new {
	id = "trial_two",
	customDialogText = "You have overcome many battles to be before me once again. Your next trial could prove to be more challenging than the last. Travel to Witch Camps of Dathomir and slay 30 Nightsister Elders.",
	stopConversation = "false",
	options = {
		{"I will return when I have completed.", "task_two"},
		{"Nightsisters? No thanks, they give me the creaps.", "exit_one"}
	}
}
jedi_test_convo_template:addScreen(trial_two);

task_two = ConvoScreen:new {
	id = "task_two",
	customDialogText = "Be mindful of your surroundings, let the force guide you.",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(task_two);

trial_three = ConvoScreen:new {
	id = "trial_three",
	customDialogText = "You are proving to be a powerful warrior indeed. One must be careful where they draw their power from. Anger and emotion can lead down a dark path. For your next trial you will need to explore the depths of the old Geonosian science lab on Yavin IV. At the very bottom you will find a foul creature named Acklay. You must defeat this creature 5 times before returning to me.",
	stopConversation = "false",
	options = {
		{"I understand, kill things that go bump in the night, got it!", "task_three"},
		{"Witches now monsters? Are you trying to get me killed? I need a break.", "exit_one"}
	}
}
jedi_test_convo_template:addScreen(trial_three);

task_three = ConvoScreen:new {
	id = "task_three",
	customDialogText = "Feel the force flow through you, let it guide your actions, that is the way of the Jedi",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(task_three);

trial_four = ConvoScreen:new {
	id = "trial_four",
	customDialogText = "You have survived the Acklay, Do not let your pride blind you young one. Travel to Tatooine and find the graveyards of the fabeled Ancient Krayt Dragons. Slay 5 of these creatures and return to me, hopefully alive.",
	stopConversation = "false",
	options = {
		{"I will do as you ask", "task_four"},
		{"Dragons??? I'm out", "exit_one"}
	}
}
jedi_test_convo_template:addScreen(trial_four);

task_four = ConvoScreen:new {
	id = "task_four",
	customDialogText = "Be mindful of the moment, don't dwell on the future. That is how you will survive.",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(task_four);

trial_five = ConvoScreen:new {
	id = "trial_five",
	customDialogText = "You have reached the fifth and final trial. Before we continue you must understand that if you fail this trial the force will abaindon you and you will no longer be able to become one with the force or become a Jedi. Think long and hard before answering this question. How much wood, would a woodchuck chuck, if a woodchuck, could chuck, wood?",
	stopConversation = "False",
	options = {
		{"69 of course", "trial_finish"},
		{"FML, I quit", "trial_fail"}
	}
}
jedi_test_convo_template:addScreen(trial_five);

trial_finish = ConvoScreen:new {
	id = "trial_finish",
	customDialogText = "You have answered correctly... ",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(trial_finish);

trial_fail = ConvoScreen:new {
	id = "trial_fail",
	customDialogText = "You have answered incorrectly... ",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(trial_fail);

no_quest = ConvoScreen:new {
	id = "no_quest",
	customDialogText = "May the Force be with you, young one. Remember, the Force flows through all living things. Trust in its guidance, and you will find your path. Seek balance in all that you do, and the light will always prevail over the darkness. Stay true to your values and remain vigilant against the temptations of the dark side. Your journey is just beginning, but with patience and determination, you will become a beacon of hope for the galaxy.",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(no_quest);

addConversationTemplate("jedi_test_convo_template", jedi_test_convo_template);

--[["In the depths of the Dantooine wilderness, there lies a hidden enclave of Force-sensitive beings. 
What is the name of this secluded group, and what role do they play in the balance of the Force?"
This question refers to the enclave of the Followers of Palawa, who are Force-sensitive but are neither Jedi nor Sith. 
Their role in the balance of the Force is not explicitly defined, leaving room for interpretation and making the answer less straightforward.]]