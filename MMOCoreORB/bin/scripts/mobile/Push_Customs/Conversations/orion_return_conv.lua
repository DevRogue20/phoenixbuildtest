orion_return_convo_template = ConvoTemplate:new {
	initialScreen = "first_screen",
	templateType = "Lua",
	luaClassHandler = "orion_convo_handler",
	screens = {}
}

first_screen = ConvoScreen:new {
	id = "first_screen",
	customDialogText = "Need a lift back to Cornet, kid?",
	stopConversation = "false",
	options = {
		{"As a matter of fact I do!", "yes"},
		{"No, I am not quite done here yet.", "exit_one"}
	}
}
orion_return_convo_template:addScreen(first_screen);

exit_one = ConvoScreen:new {
	id = "exit_one",
	customDialogText = "Come see me when you change your mind.",
	stopConversation = "true",
	options = {}
}
orion_return_convo_template:addScreen(exit_one);

yes = ConvoScreen:new {
	id = "yes",
	customDialogText = "Hop on, we will be leaving shortly.",
	stopConversation = "false",
	options = {
		{"Thank you.", "depart"},
	}
}
orion_return_convo_template:addScreen(yes);

depart = ConvoScreen:new {
	id = "depart",
	customDialogText = "No sweat, kid!",
	stopConversation = "true",
	options = {}
}
orion_return_convo_template:addScreen(depart);

addConversationTemplate("orion_return_convo_template", orion_return_convo_template);