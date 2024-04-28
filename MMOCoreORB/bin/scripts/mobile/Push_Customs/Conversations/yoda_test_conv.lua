local screens = {
    yoda_four = ConvoScreen:new {
        id = "yoda_four",
        customDialogText = "What event in ancient Jedi history led to the division between the Jedi Order and the Sith, resulting in the Hundred-Year Darkness?", 
        stopConversation = "false",
        options = {
            {"The Jedi Purge", "trial_fail"},
            {"The Mandalorian Wars", "trial_fail"},
            {"The Exar Kun War", "trial_fail"},
            {"The Dark Crusade", "trial_fail"},
            {"The Great Schism", "correct_answer"}
        },
    },
    
    yoda_five = ConvoScreen:new {
        id = "yoda_five",
        customDialogText = "What was the name of the ancient organization that preceded the Jedi Order, focusing on balance between the light and dark sides of the Force?", 
        stopConversation = "false",
        options = {
            {"The Je'daii Order", "correct_answer"},
            {"The Sith Triumvirate", "trial_fail"},
            {"The Galactic Alliance", "trial_fail"},
            {"The Brotherhood of Darkness", "trial_fail"},
            {"The Force Conclave", "trial_fail"}
        },
	},
}

yoda_test_convo_template = ConvoTemplate:new {
	initialScreen = "yoda_intro",
	templateType = "Lua",
	luaClassHandler = "yoda_test_convo_handler",
	screens = {}
}

yoda_intro = ConvoScreen:new {
	id = "yoda_intro",
	customDialogText = "Found me you have? Forseen this I have...",
	stopConversation = "false",
	options = {
		{"I was sent to find you Master", "yoda_one"}
	}
}
yoda_test_convo_template:addScreen(yoda_intro);

yoda_one = ConvoScreen:new {
	id = "yoda_one",
	customDialogText = "Answers you seek? A Jedi you wish to become? A dangerous path, this is. Much danger. Prepared are you?",
	stopConversation = "false",
	options = {
		{"I am prepared Master", "yoda_two"}
	}
}
yoda_test_convo_template:addScreen(yoda_one);

yoda_two = ConvoScreen:new {
	id = "yoda_two",
	customDialogText = "Prepared? HMMPH. Judge your preparation I will. Questions I have. Answer correctly and a Jedi you may become. Answer Incorrectly and unworthy you will be... Begin we shall.",
	stopConversation = "false",
	options = {
		{"(gulp) Ok Master I will give it my best try.", "yoda_three"}
	}
}
yoda_test_convo_template:addScreen(yoda_two);

yoda_three = ConvoScreen:new {
	id = "yoda_three",
	customDialogText = "Try??? This generation it is... Okay Do or do not, there is no try! When ready are you, speak to me again.",
	stopConversation = "true",
	options = {
		--{"Yes Master I am ready.", math.random(screens)}
	}
}
yoda_test_convo_template:addScreen(yoda_three);

correct_answer = ConvoScreen:new {
	id = "correct_answer",
	customDialogText = "Correct you are. Ready are you, ready for the journey that lay ahead. Take your Key of Destiny, and potential you will unlock. Return it you will... return it to the force..",
	stopConversation = "true",
	options = {}
}
yoda_test_convo_template:addScreen(correct_answer);

yoda_complete = ConvoScreen:new {
	id = "yoda_complete",
	customDialogText = "Awaits you, your destiny does. Seek out the Force Essence.",
	stopConversation = "true",
	options = {}
}
yoda_test_convo_template:addScreen(yoda_complete);

trial_fail = ConvoScreen:new {
	id = "trial_fail",
	customDialogText = "You have answered incorrectly... ",
	stopConversation = "true",
	options = {}
}
yoda_test_convo_template:addScreen(trial_fail);

yoda_test_convo_template:addScreen(screens.yoda_four)
yoda_test_convo_template:addScreen(screens.yoda_five)

addConversationTemplate("yoda_test_convo_template", yoda_test_convo_template);