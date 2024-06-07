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

task_one_active = ConvoScreen:new {
	id = "task_one_active",
	customDialogText = "You have not completed the Tusken Slayer Trial. Return when it is complete",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(task_one_active);

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

task_two_active = ConvoScreen:new {
	id = "task_two_active",
	customDialogText = "You have not completed the Witches of Dathomir Trial. Return when it is complete.",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(task_two_active);

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

task_three_active = ConvoScreen:new {
	id = "task_three_active",
	customDialogText = "You have not completed the Acklay Trial. Return when it is complete",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(task_three_active);

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

task_four_active = ConvoScreen:new {
	id = "task_four_active",
	customDialogText = "You have not completed the Krayt Trial. Return when it is complete",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(task_four_active);

trial_five = ConvoScreen:new {
	id = "trial_five",
	customDialogText = "You have reached the fifth and final trial. Before we continue you must understand that if you fail this trial the force will abandon you and you will no longer be able to become one with the force or become a Jedi.",
	stopConversation = "false",
	options = {
		{"I understand, Please continue.", "trial_five_a"}
	}
}
jedi_test_convo_template:addScreen(trial_five);

trial_five_a = ConvoScreen:new {
	id = "trial_five_a",
	customDialogText = "Recently, contact was lost with a powerful force user. You must track down this force user to gain the answers that you seek. Only then can you be a jedi... Seek out this powerful ally of the force and return to me after providing what he asks of you. He was last known to be wondering the swamps of Corellia.",
	stopConversation = "false",
	options = {
		{"I understand, I will seek out this powerful force user.", "trial_five_active"}
	}
}
jedi_test_convo_template:addScreen(trial_five_a);

trial_five_active = ConvoScreen:new {
	id = "trial_five_active",
	customDialogText = "Your destiny awaits you on Corellia...",
	stopConversation = "true",
	options = {
		}
}
jedi_test_convo_template:addScreen(trial_five_active);

trial_finish = ConvoScreen:new {
	id = "trial_finish",
	customDialogText = "I can sense that you have completed your task, Take the Holocron of the Five Masters. You will use this device to instantly travel to your new traning grounds. Be aware that that training grounds are highly restricted. Only those that are invited my be there and even then only for a short period of time.",
	stopConversation = "false",
	options = {
		{"I understand. Thank you Master", "trial_isJedi"}
	}
}
jedi_test_convo_template:addScreen(trial_finish);

trial_abandon = ConvoScreen:new {
	id = "trial_abandon",
	customDialogText = " I sense your frustration, young one. The trials are not just about skill or dedication. They are a test of one's connection with the Force, their resolve, and their understanding of its ways. Feeling the Force and truly understanding it are different matters, my apprentice. Sometimes, the path to enlightenment is not a straight one. It twists and turns, presenting challenges we may not anticipate. While the path of a Jedi may not be yours to tread, it does not mean your journey ends here. There are other ways to serve the galaxy, other paths to walk. Perhaps your destiny lies in a different direction, one where your unique talents can shine. The Force has a plan for each of us, even if we cannot see it clearly. Trust in its guidance, and you will find your purpose. May the Force be with you, my young friend. And remember, failure is not the end. It is but a step on the journey to greatness.",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(trial_abandon);

no_quest = ConvoScreen:new {
	id = "no_quest",
	customDialogText = "May the Force be with you, young one. Remember, the Force flows through all living things. Trust in its guidance, and you will find your path. Seek balance in all that you do, and the light will always prevail over the darkness. Stay true to your values and remain vigilant against the temptations of the dark side. Your journey is just beginning, but with patience and determination, you will become a beacon of hope for the galaxy.",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(no_quest);

trial_isJedi = ConvoScreen:new {
	id = "trial_isJedi",
	customDialogText = "The Force is with you... Always ",
	stopConversation = "true",
	options = {}
}
jedi_test_convo_template:addScreen(trial_isJedi);

addConversationTemplate("jedi_test_convo_template", jedi_test_convo_template);