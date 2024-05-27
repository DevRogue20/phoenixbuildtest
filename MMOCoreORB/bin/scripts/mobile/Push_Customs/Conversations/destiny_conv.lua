destiny_convo_template = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "destiny_convo_handler",
	screens = {}
}

intro = ConvoScreen:new {
	id = "intro",
	customDialogText = "Greetings, young Jedi. I am Darian Veilwalker, and I sense the Force is strong within you. The path before you is not an easy one, and it is filled with choices that will shape your destiny.",
	stopConversation = "false",
	options = {
		{"I am ready to choose my path. Tell me more.", "screen_one"},
		{"I am not ready to make my decision  yet", "exit_one"}
	}
}
destiny_convo_template:addScreen(intro);

exit_one = ConvoScreen:new {
	id = "exit_one",
	customDialogText = "When you are prepared to continue your destiny speak to me again.",
	stopConversation = "true",
	options = {}
}
destiny_convo_template:addScreen(exit_one);

screen_one = ConvoScreen:new {
	id = "screen_one",
	customDialogText = "The Force has two sides: the light and the dark. The light side embodies peace, wisdom, and selflessness. It is the path of the Jedi Order, dedicated to protecting and serving the galaxy.",
	stopConversation = "false",
	options = {
		{"What about the dark side?", "screen_two"}
	}
}
destiny_convo_template:addScreen(screen_one);

screen_two = ConvoScreen:new {
	id = "screen_two",
	customDialogText = "The dark side is powerful and seductive, driven by passion, anger, and the pursuit of power. It is the path of the Sith, where strength and ambition lead to dominance and control.",
	stopConversation = "false",
	options = {
		{"How do I choose my path?", "screen_three"}
	}
}
destiny_convo_template:addScreen(screen_two);

screen_three = ConvoScreen:new {
	id = "screen_three",
	customDialogText = "The choice is yours. Reflect on your journey and your desires. Also understand you will be assigned to the faction that aligns with your choice. Jedi are Rebel and Dark Jedi are Imperial. When you are ready, speak to me again, and I will guide you further.",
	stopConversation = "true",
	options = {}
}
destiny_convo_template:addScreen(screen_three);

screen_four = ConvoScreen:new {
	id = "screen_four",
	customDialogText = "I can sense that you have made your descision young Jedi. It is Important to note that this choice is permenant and can not be reversed. Do you understand?",
	stopConversation = "false",
	options = {
		{"I Understand that my choice is permenant", "screen_seven"},
		{"I may need more time to make a descision", "exit_one"}
	}
}
destiny_convo_template:addScreen(screen_four);

screen_seven = ConvoScreen:new {
	id = "screen_seven",
	customDialogText = "What is your descision young one?",
	stopConversation = "false",
	options = {
		{"I choose the light!", "screen_five"},
		{"I feel the darkside calling me", "screen_six"}
	}
}

destiny_convo_template:addScreen(screen_seven);

screen_five = ConvoScreen:new {
	id = "screen_five",
	customDialogText = "Making the choice is just the first step. Take this Holocron of Eternal Light. It will teleport you to your new trainer.",
	stopConversation = "true",
	options = {}
}
destiny_convo_template:addScreen(screen_five);

screen_six = ConvoScreen:new {
	id = "screen_six",
	customDialogText = "Making the choice is just the first step. Take this Holocron of Forbidden Knowledge. It will teleport you to your new trainer.",
	stopConversation = "true",
	options = {}
}
destiny_convo_template:addScreen(screen_six);

no_quest = ConvoScreen:new {
	id = "no_quest",
	customDialogText = "If you are quiet enough and still enough you can hear all living things in the park on a calm day..",
	stopConversation = "true",
	options = {}
}
destiny_convo_template:addScreen(no_quest);

addConversationTemplate("destiny_convo_template", destiny_convo_template);