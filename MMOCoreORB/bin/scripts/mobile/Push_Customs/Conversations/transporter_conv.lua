transporter_convo_template = ConvoTemplate:new {
	initialScreen = "first_screen",
	templateType = "Lua",
	luaClassHandler = "transporter_convo_handler",
	screens = {}
}

first_screen = ConvoScreen:new {
	id = "first_screen",
	customDialogText = "Need a lift to your next destination? I offer safe and swift passage for a reasonable fee of 10,000 credits.",
	stopConversation = "false",
	options = {
		{"I am looking for travel, what locations can you take me to", "what"},
		{"Excuse me? I thought you were someone else.", "exit_one"}
	}
}
transporter_convo_template:addScreen(first_screen);

exit_one = ConvoScreen:new {
	id = "exit_one",
	customDialogText = "Have a good day my friend.",
	stopConversation = "true",
	options = {}
}
transporter_convo_template:addScreen(exit_one);

exit_two = ConvoScreen:new {
	id = "exit_two",
	customDialogText = "Unfortunately you do not have enough credits, come back when you have at least 10,000 credits.",
	stopConversation = "true",
	options = {}
}
transporter_convo_template:addScreen(exit_two);

what = ConvoScreen:new {
	id = "what",
	customDialogText = "I currently only offer passage to the Orion Station.",
	stopConversation = "false",
	options = {
		{"Wow so many options, I guess I will go check that out.", "wow"},
		{"That doesn't really strike me as a tourist attraction, I think I will pass", "exit_one"}
	}
}
transporter_convo_template:addScreen(what);

wow = ConvoScreen:new {
	id = "wow",
	customDialogText = "Orion Station is a bit off the beaten path, but I can make arrangements for a special trip.",
	stopConversation = "false",
	options = {
		{"Ok, I am ready to leave.", "depart"},
		{"On second thought, I think I will just stay here for now.", "exit_one"}
	}
}
transporter_convo_template:addScreen(wow);

depart = ConvoScreen:new {
	id = "depart",
	customDialogText = "Have a good trip.",
	stopConversation = "true",
	options = {}
}
transporter_convo_template:addScreen(depart);

addConversationTemplate("transporter_convo_template", transporter_convo_template);