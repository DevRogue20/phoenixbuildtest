sherkartransitconvo_template = ConvoTemplate:new {
   initialScreen = "first_screen",
   templateType = "Lua",
   luaClassHandler = "sherkar_transit_system_convo_handler",
   screens = {}
}

sherkar_transit_convo_first_screen = ConvoScreen:new {
   id = "first_screen",
   leftDialog = "",
   customDialogText = "Ready to get out of here?",
   stopConversation = "false",
   options = {
--      {"PvP Special Locations", "cPvP"},   
--     {"Corellia", "cCorellia"},
--      {"Dantooine", "cDantooine"},
--      {"Dathomir", "cDathomir"},
--      {"Naboo", "cNaboo"},
--      {"Rori", "cRori"},
--      {"Talus", "cTalus"},
--      {"Tatooine", "cTatooine"},
--      {"Yavin4", "cYavin4"},
--      {"Kashyyyk", "cKashyyyk"},
--      {"Lok", "cLok"},
--      {"Sher'Kar", "cMustafar"},
      {"Mustafar", "cTalrus"},
      {"No thank you.", "deny_quest"}
   }
}
sherkartransitconvo_template:addScreen(sherkar_transit_convo_first_screen);

--[[sherkar_transit_convo_cMustafar = ConvoScreen:new {
   id = "cMustafar",
   leftDialog = "",
   customDialogText = "Enter Sher'Kar:",
   stopConversation = "false",
      options = {
      {"Sher Kar Dungeon", "sMustafar_Sher'Kar"},
        {"No thank you.", "deny_quest"}
  }
}
]]
sherkartransitconvo_template:addScreen(sherkar_transit_convo_cMustafar);

sher_transit_convo_cTalrus = ConvoScreen:new {
   id = "cTalrus",
   leftDialog = "",
   customDialogText = "Return To the Talrus Nesting Grounds:",
   stopConversation = "false",
   options = {
      {"Talrus Nesting Grounds", "sMustafar_talrus"},
      {"No thank you.", "deny_quest"}
  }
}

sherkartransitconvo_template:addScreen(sher_transit_convo_cTalrus);

sherkar_transit_convo_deny_quest = ConvoScreen:new {
   id = "deny_quest",
   leftDialog = "",
   customDialogText = "Have a safe journey",
   stopConversation = "true",
   options = {   
   }
}
sherkartransitconvo_template:addScreen(sherkar_transit_convo_deny_quest);

sher_transit_convo_cTalrus = ConvoScreen:new {
   id = "cTalrus",
   leftDialog = "",
   customDialogText = "Return To the Talrus Nesting Grounds:",
   stopConversation = "false",
   options = {
      {"Talrus Nesting Grounds", "cMustafar_talrus"},
      {"No thank you.", "deny_quest"}
  }
}

sherkartransitconvo_template:addScreen(sher_transit_convo_cTalrus);


sherkar_transit_convo_wrong_faction = ConvoScreen:new {
   id = "wrong_faction",
   leftDialog = "",
   customDialogText = "You are not a member of the Empire",
   stopConversation = "true",
   options = {   
   }
}
sherkartransitconvo_template:addScreen(sherkar_transit_convo_wrong_faction);

sherkar_transit_convo_notenough_faction = ConvoScreen:new {
   id = "notenough_faction",
   leftDialog = "",
   customDialogText = "You do not have enough Faction Points",
   stopConversation = "true",
   options = {   
   }
}
sherkartransitconvo_template:addScreen(sherkar_transit_convo_notenough_faction);

addConversationTemplate("sherkartransitconvo_template", sherkartransitconvo_template);
