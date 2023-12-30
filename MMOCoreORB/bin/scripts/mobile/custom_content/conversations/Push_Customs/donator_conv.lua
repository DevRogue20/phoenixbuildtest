
donator_convo_template = ConvoTemplate:new {
    initialScreen = "first_screen",
    templateType = "Lua",
    luaClassHandler = "donator_convo_handler",
    screens = {}
 }
 
 
 donator_items_screen = ConvoScreen:new {
    id = "items_screen",
    leftDialog = "",
    customDialogText = "Please Select From The Following List Of Items. Some Items May Require Multiple Phoenix Tokens.",
    stopConversation = "false",
    options = {
       {"Galactic Hunter Painting (1 Token)", "1"},
       {"Jedi Master Yoda Painting (1 Token)", "2"},
       {"Spined Rancor Poster (1 Token)", "3"},
       {"Advanced Stap-1 (3 tokens)", "4"},
       {"Basilisk War Droid (3 tokens)", "5"},      
       {"Ram-1511 Transport (3 tokens)", "6"},
       {"Phoenix VIP Rebel ITV (6 tokens)", "7"},
       {"Phoenix VIP Imperial ITV (6 tokens)", "8"},
       --{"Item 9", "9"},      
       {"Back", "first_screen"},
       {"No thank you.", "deny_quest"},
       }
 }
 donator_convo_template:addScreen(donator_items_screen);
 
 
 
 
 donator_first_screen = ConvoScreen:new {
    id = "first_screen",
    leftDialog = "",
    customDialogText = "Welcome to the Project Phoenix donator token shop. Here you can Purchase Items by exchanging Phoenix tokens. Phoenix tokens are gained by donating to Project Phoenix to help support the server. Select the Items you would like to exchange your tokens for. Thank You For Donating to Project Phoenix.",
    stopConversation = "false",
    options = {
       {"Items", "items"},
       {"I don't have any tokens, how do I get them?", "deny_quest"},
       }
 }
 donator_convo_template:addScreen(donator_first_screen);
 
 
 donator_end_quest = ConvoScreen:new {
    id = "end",
    leftDialog = "",
    customDialogText = "Excellent choice! Thank you for your support!",
    stopConversation = "true",
    options = {   
    }
 }
 donator_convo_template:addScreen(donator_end_quest);
 
 
 donator_deny_quest = ConvoScreen:new {
    id = "deny_quest",
    leftDialog = "",
    customDialogText = "Contact any Project Phoenix staff member if you are interested in donating. Thank You for Playing Our Server!",
    stopConversation = "true",
    options = {   
    }
 }
 donator_convo_template:addScreen(donator_deny_quest);
 
 
 donator_insufficient_funds = ConvoScreen:new {
    id = "insufficient_funds",
    leftDialog = "",
    customDialogText = "Sorry, but you don't have enough credits to purchase that. I am not the charity droid, go earn more credits. I will be here when you get back!",
    stopConversation = "true",
    options = {   
    }
 }
 donator_convo_template:addScreen(donator_insufficient_funds);
 
 
 donator_insufficient_space = ConvoScreen:new {
    id = "insufficient_space",
    leftDialog = "",
    customDialogText = "Sorry, your inventory is to full to accept the item. Please make some space and try again.",
    stopConversation = "true",
    options = {   
    }
 }
 donator_convo_template:addScreen(donator_insufficient_space);
 
 
 donator_insufficient_item = ConvoScreen:new {
    id = "insufficient_item",
    leftDialog = "",
    customDialogText = "You do not have enough Phoenix tokens to purchase that item. Make a donation to get more tokens.",
    stopConversation = "true",
    options = {   
    }
 }
 donator_convo_template:addScreen(donator_insufficient_item);
 
 
 addConversationTemplate("donator_convo_template", donator_convo_template);
 