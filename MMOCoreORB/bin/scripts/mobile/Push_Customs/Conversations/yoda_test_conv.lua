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

    yoda_six = ConvoScreen:new {
        id = "yoda_six",
        customDialogText = "What was the name of the ancient planet where the Jedi Order originated, known for its powerful Force nexus and connection to the Force?", 
        stopConversation = "false",
        options = {
            {"Ilum", "trial_fail"},
            {"Tython", "correct_answer"},
            {"Dantooine", "trial_fail"},
            {"Coruscant", "trial_fail"},
            {"Ossus", "trial_fail"}
        },
    },

    yoda_seven = ConvoScreen:new {
        id = "yoda_seven",
        customDialogText = "What event marked the gathering of Force-sensitive beings from various species across the galaxy, leading them to Tython and the formation of the Jedi Order?", 
        stopConversation = "false",
        options = {
            {"The Force Convergence", "trial_fail"},
            {"The Celestial Alignment", "trial_fail"},
            {"The Tho Yor Arrival", "correct_answer"},
            {"The Starlight Assembly", "trial_fail"},
            {"The Nexus Convergence", "trial_fail"}
        },
    },

    yoda_eight = ConvoScreen:new {
        id = "yoda_eight",
        customDialogText = "Who were the ancient species that constructed the Star Forge and were known for their dark use of the Force, leading to conflicts with the early Jedi?", 
        stopConversation = "false",
        options = {
            {"The Celestials", "trial_fail"},
            {"The Gree", "trial_fail"},
            {"The Killiks", "trial_fail"},
            {"The Rakata", "correct_answer"},
            {"The Chiss", "trial_fail"}
        },
    },

    yoda_nine = ConvoScreen:new {
        id = "yoda_nine",
        customDialogText = "What was the name of the Rakata dominion that spanned across the galaxy, enslaving countless species and drawing the attention of the early Jedi?", 
        stopConversation = "false",
        options = {
            {"The Eternal Dominion", "trial_fail"},
            {"The Celestial Empire", "trial_fail"},
            {"The Infinite Empire", "correct_answer"},
            {"The Infinite Dominion", "trial_fail"},
            {"The Eternal Empire", "trial_fail"}
        },
    },

    yoda_ten = ConvoScreen:new {
        id = "yoda_ten",
        customDialogText = "What term refers to the Jedi who fell to the dark side during the Hundred-Year Darkness, leading to their conflict with the Jedi Order and the foundation of the Sith?", 
        stopConversation = "false",
        options = {
            {"The Dark Jedi", "correct_answer"},
            {"The Shadow Knights", "trial_fail"},
            {"The Lost Ones", "trial_fail"},
            {"The Fallen Jedi", "trial_fail"},
            {"The Exiles", "trial_fail"}
        },
    },

    yoda_eleven = ConvoScreen:new {
        id = "yoda_eleven",
        customDialogText = "What ancient empire, founded by the exiled Dark Jedi, waged war against the Republic and the Jedi Order during the Great Hyperspace War?", 
        stopConversation = "false",
        options = {
            {"The Rakatan Empire", "trial_fail"},
            {"The Infinite Empire", "trial_fail"},
            {"The Sith Empire", "correct_answer"},
            {"The Infinite Sith Dominion", "trial_fail"},
            {"The Dark Sith Empire", "trial_fail"}
        },
    },

    yoda_twelve = ConvoScreen:new {
        id = "yoda_twelve",
        customDialogText = "What ancient Jedi world served as a hub of learning and knowledge, housing the Great Jedi Library before its destruction in the Great Sith War?", 
        stopConversation = "false",
        options = {
            {"Yavin 4", "trial_fail"},
            {"Chandrila", "trial_fail"},
            {"Alderaan", "trial_fail"},
            {"Ossus", "correct_answer"},
            {"Byss", "trial_fail"}
        },
    },

    yoda_thirteen = ConvoScreen:new {
        id = "yoda_thirteen",
        customDialogText = "What ancient race, native to the planet Korriban, formed the original Sith Empire and became intertwined with the dark side, leading to conflict with the Jedi Order?", 
        stopConversation = "false",
        options = {
            {"The Chiss", "trial_fail"},
            {"The Zabrak", "trial_fail"},
            {"The Mandalorians", "trial_fail"},
            {"The Togruta", "trial_fail"},
            {"The Sith species", "correct_answer"}
        },
    },

    yoda_fourteen = ConvoScreen:new {
        id = "yoda_fourteen",
        customDialogText = "What conflict within the Jedi Order, preceding the Hundred-Year Darkness, saw the splinter group known as the Legions of Lettow rebel against the Jedi Council?", 
        stopConversation = "false",
        options = {
            {"The Coruscant Uprising", "trial_fail"},
            {"The Jedi Rebellion", "trial_fail"},
            {"The Revanite Revolt", "trial_fail"},
            {"The First Jedi Schism", "correct_answer"},
            {"The Jedi Purge", "trial_fail"}
        },
    },

    yoda_fifteen = ConvoScreen:new {
        id = "yoda_fifteen",
        customDialogText = "What series of conflicts between the Je'daii Order and the followers of the dark side, driven by the machinations of the being known as the Dark Reaper, devastated Tython?", 
        stopConversation = "false",
        options = {
            {"The Force Crusades", "trial_fail"},
            {"The Balance Wars", "trial_fail"},
            {"The Force Wars", "correct_answer"},
            {"The Tythonian Conflict", "trial_fail"},
            {"The Force Scourge", "trial_fail"}
        },
    },

    yoda_sixteen = ConvoScreen:new {
        id = "yoda_sixteen",
        customDialogText = "What title was given to individuals within the Je'daii Order who specialized in tracking and hunting down dark side users during the Force Wars?", 
        stopConversation = "false",
        options = {
            {"The Dark Seeker", "trial_fail"},
            {"The Shadow Hunter", "trial_fail"},
            {"The Force Hound", "correct_answer"},
            {"The Dark Pursuer", "trial_fail"},
            {"The Sith Stalker", "trial_fail"}
        },
    },

    yoda_seventeen = ConvoScreen:new {
        id = "yoda_seventeen",
        customDialogText = "What group within the Je'daii Order acted as mediators and peacemakers, seeking to maintain balance and harmony between the various Je'daii temples?", 
        stopConversation = "false",
        options = {
            {"The Balance Keepers", "trial_fail"},
            {"The Temple Guardians", "trial_fail"},
            {"The Kashi Mer", "correct_answer"},
            {"The Force Sentinels", "trial_fail"},
            {"The Light Wardens", "trial_fail"}
        },
    },

    yoda_eighteen = ConvoScreen:new {
        id = "yoda_eighteen",
        customDialogText = "What ancient structure on Tython served as the central meeting place for the Je'daii Masters and housed the mystical Fountain of Rajivari?", 
        stopConversation = "false",
        options = {
            {"The Temple of Balance", "trial_fail"},
            {"The Nexus Citadel", "trial_fail"},
            {"The Unity Temple", "trial_fail"},
            {"The Dawn Pyramid", "correct_answer"},
            {"The Force Sanctum", "trial_fail"}
        },
    },

    yoda_nineteen = ConvoScreen:new {
        id = "yoda_nineteen",
        customDialogText = "What powerful artifact, wielded by the dark side Je'daii Xesh during the Force Wars, was capable of corrupting and enslaving those who touched it?", 
        stopConversation = "false",
        options = {
            {"The Shadowstaff", "trial_fail"},
            {"The Darkblade", "trial_fail"},
            {"The Sith Scepter", "trial_fail"},
            {"The Darkstaff", "correct_answer"},
            {"The Corrupted Rod", "trial_fail"}
        },
    },

    yoda_twenty = ConvoScreen:new {
        id = "yoda_twenty",
        customDialogText = "What ancient organization, predating even the Je'daii Order, revered the Bendu monks and sought to maintain neutrality in the conflict between the light and dark sides of the Force?", 
        stopConversation = "false",
        options = {
            {"The Brotherhood of Kiwa", "trial_fail"},
            {"The Circle of Zerth", "trial_fail"},
            {"The Order of Dai Bendu", "correct_answer"},
            {"The League of Bendu", "trial_fail"},
            {"The Fellowship of Ashla", "trial_fail"}
        },
    },

    yoda_twenty_one = ConvoScreen:new {
        id = "yoda_twenty_one",
        customDialogText = "What ancient starships, constructed by the Kwa species, were used to transport Force-sensitive beings from across the galaxy to Tython during the Tho Yor Arrival?", 
        stopConversation = "false",
        options = {
            {"The Celestial Vessels", "trial_fail"},
            {"The Star Spheres", "trial_fail"},
            {"The Tho Yor", "correct_answer"},
            {"The Temple Ships", "trial_fail"},
            {"The Cosmic Arks", "trial_fail"}
        },
    },

    yoda_twenty_two = ConvoScreen:new {
        id = "yoda_twenty_two",
        customDialogText = "What ancient dark side sect, led by the rogue Je'daii Daegen Lok, sought to overthrow the Je'daii Order during the Force Wars and claim Tython for themselves?", 
        stopConversation = "false",
        options = {
            {"The Vipers", "correct_answer"},
            {"The Shadow Guard", "trial_fail"},
            {"The Nightstalkers", "trial_fail"},
            {"The Abyssal Cabal", "trial_fail"}
        },
    },

    yoda_twenty_three = ConvoScreen:new {
        id = "yoda_twenty_three",
        customDialogText = "What catastrophic event, caused by the dark side rituals of the rogue Je'daii Daegen Lok, resulted in the devastation of Tython and the scattering of the Je'daii across the galaxy?", 
        stopConversation = "false",
        options = {
            {"The Tython Catastrophe", "trial_fail"},
            {"The Vultar Cataclysm", "correct_answer"},
            {"The Rakatan Incursion", "trial_fail"},
            {"The Vortex Apocalypse", "trial_fail"},
            {"The Darkness Unleashed", "trial_fail"}
        },
    },

    yoda_twenty_four = ConvoScreen:new {
        id = "yoda_twenty_four",
        customDialogText = "What pivotal conflict during the Hundred-Year Darkness saw the Dark Jedi allies of the Sith Empire clash with the forces of the Jedi Order, resulting in the defeat of the Sith forces and the scattering of the surviving Dark Jedi?", 
        stopConversation = "false",
        options = {
            {"The Siege of Ruusan", "trial_fail"},
            {"The Fall of Taris", "trial_fail"},
            {"The Battle of Corbos", "correct_answer"},
            {"The Battle of Dromund Kaas", "trial_fail"},
            {"The Conquest of Exis Station", "trial_fail"}
        },
    },

    yoda_twenty_five = ConvoScreen:new {
        id = "yoda_twenty_five",
        customDialogText = "What term refers to the scar left on Tython by the Vultar Cataclysm, a wound in the fabric of the Force that became a focal point for dark side energies?", 
        stopConversation = "false",
        options = {
            {"The Tython Rift", "trial_fail"},
            {"The Abyssal Chasm", "trial_fail"},
            {"The Dark Scar", "trial_fail"},
            {"The Force Wound", "correct_answer"},
            {"The Tython Vein", "trial_fail"}
        },
    },

    yoda_twenty_six = ConvoScreen:new {
        id = "yoda_twenty_six",
        customDialogText = "What group of Je'daii, led by the fallen Je'daii Shae Koda, were exiled from Tython after their failed attempt to use the Force to heal the damaged planet?", 
        stopConversation = "false",
        options = {
            {"The Banished", "trial_fail"},
            {"The Exiles", "trial_fail"},
            {"The Outcasts", "correct_answer"},
            {"The Forsaken", "trial_fail"},
            {"The Ostracized", "trial_fail"}
        },
    },

    yoda_twenty_seven = ConvoScreen:new {
        id = "yoda_twenty_seven",
        customDialogText = "What ancient species, renowned for their mastery of technology and the Force, constructed the Infinity Gates and the Tho Yor starships?", 
        stopConversation = "false",
        options = {
            {"The Kwa", "correct_answer"},
            {"The Celestials", "trial_fail"},
            {"The Gree", "trial_fail"},
            {"The Killiks", "trial_fail"},
            {"The Shapers", "trial_fail"}
        },
    },

    yoda_twenty_eight = ConvoScreen:new {
        id = "yoda_twenty_eight",
        customDialogText = "What event marked the end of the Je'daii Order's use of the Tho Yor starships, as they were dismantled and repurposed following the establishment of the Jedi Temple on Coruscant?", 
        stopConversation = "false",
        options = {
            {"The Tho Yor Disbandment", "trial_fail"},
            {"The Exodus of Tython", "trial_fail"},
            {"The End of the Infinite Journey", "trial_fail"},
            {"The Fall of the Tho Yor", "correct_answer"},
            {"The Tho Yor Decommission", "trial_fail"}
        },
    },

    yoda_twenty_nine = ConvoScreen:new {
        id = "yoda_twenty_nine",
        customDialogText = "What controversial Jedi philosophy, rejected by the Jedi Council, posited that there was no dark side of the Force and that all actions taken with the Force were inherently neutral?", 
        stopConversation = "false",
        options = {
            {"The Nihilism Doctrine", "trial_fail"},
            {"The Equilibrium Doctrine", "trial_fail"},
            {"The Potentium", "correct_answer"},
            {"The Living Force Doctrine", "trial_fail"},
            {"The Grey Jedi Doctrine", "trial_fail"}
        },
    },

    yoda_thirty = ConvoScreen:new {
        id = "yoda_thirty",
        customDialogText = "What ancient galactic power, founded by the fallen Dark Jedi Exiles, waged war against the Galactic Republic and the Jedi Order during the Great Hyperspace War?", 
        stopConversation = "false",
        options = {
            {"The Infinite Empire", "trial_fail"},
            {"The Sith Empire", "correct_answer"},
            {"The Sith Dominion", "trial_fail"},
            {"The Sith Collective", "trial_fail"},
            {"The Sith Confederacy", "trial_fail"}
        },
    },

    yoda_thirty_one = ConvoScreen:new {
        id = "yoda_thirty_one",
        customDialogText = "What term refers to the group of Dark Jedi who were banished from the Jedi Order and fled to the Unknown Regions, eventually founding the Sith Empire?", 
        stopConversation = "false",
        options = {
            {"The Forsaken", "trial_fail"},
            {"The Outcasts", "trial_fail"},
            {"The Exiles", "correct_answer"},
            {"The Fallen", "trial_fail"},
            {"The Castaways", "trial_fail"}
        },
    },

    yoda_thirty_two = ConvoScreen:new {
        id = "yoda_thirty_two",
        customDialogText = "What group within the Jedi Order served as mediators and diplomats, specializing in resolving conflicts and maintaining peace between planetary governments?", 
        stopConversation = "false",
        options = {
            {"The Jedi Arbiters", "trial_fail"},
            {"The Kashi Mer", "correct_answer"},
            {"The Temple Guardians", "trial_fail"},
            {"The Peacekeepers", "trial_fail"},
            {"The Jedi Diplomatic Corps", "trial_fail"}
        },
    },

    yoda_thirty_three = ConvoScreen:new {
        id = "yoda_thirty_three",
        customDialogText = "What term refers to the heavily fortified worlds established by the Jedi Order during the New Sith Wars, serving as bastions against Sith incursions?", 
        stopConversation = "false",
        options = {
            {"The Fortress Worlds", "correct_answer"},
            {"The Citadel Planets", "trial_fail"},
            {"The Bastion Worlds", "trial_fail"},
            {"The Stronghold Systems", "trial_fail"},
            {"The Bulwark Planets", "trial_fail"}
        },
    },

	yoda_thirty_four = ConvoScreen:new {
        id = "yoda_thirty_four",
        customDialogText = "What elite Jedi task force, formed during the New Sith Wars, specialized in covert operations and infiltration behind enemy lines, striking fear into Sith forces?", 
        stopConversation = "false",
        options = {
            {"The Shadow Strikers", "trial_fail"},
            {"The Night Blades", "trial_fail"},
            {"The Gloom Walkers", "correct_answer"},
            {"The Dark Stalkers", "trial_fail"},
            {"The Eclipse Agents", "trial_fail"}
        },
    },

    yoda_thirty_five = ConvoScreen:new {
        id = "yoda_thirty_five",
        customDialogText = "What event in Jedi history saw the reorganization of the Jedi Order and the establishment of the High Council, following the devastating New Sith Wars?", 
        stopConversation = "false",
        options = {
            {"The Great Restoration", "trial_fail"},
            {"The Jedi Renewal", "trial_fail"},
            {"The Ruusan Reformation", "correct_answer"},
            {"The Order of the Jedi Knights", "trial_fail"},
            {"The Jedi Covenant", "trial_fail"}
        },
    },

    yoda_thirty_six = ConvoScreen:new {
        id = "yoda_thirty_six",
        customDialogText = "What term refers to the ruling council of Dark Lords of the Sith who emerged from the shadows following the devastation of the Jedi Order during the New Sith Wars?", 
        stopConversation = "false",
        options = {
			{"The Sith Triumvirate", "correct_answer"},
            {"The Sith Ascendancy", "trial_fail"},
            {"The Dark Council", "trial_fail"},
	        {"The Sith Dominion", "trial_fail"},
            {"The Sith Conclave", "trial_fail"}
        },
    },

    yoda_thirty_seven = ConvoScreen:new {
        id = "yoda_thirty_seven",
        customDialogText = "What doctrine, established by Darth Bane, stipulated that there could only be two Sith Lords at any given time: a master to embody the power of the dark side and an apprentice to crave it?", 
        stopConversation = "false",
        options = {
            {"The Sith Code", "trial_fail"},
            {"The Sith Directive", "trial_fail"},
            {"The Rule of Two", "correct_answer"},
            {"The Sith Doctrine", "trial_fail"},
            {"The Sith Protocol", "trial_fail"}
        },
    },

    yoda_thirty_eight = ConvoScreen:new {
        id = "yoda_thirty_eight",
        customDialogText = "What term refers to the devastating Sith assault on the Jedi Temple on Coruscant, resulting in the deaths of numerous Jedi and the destruction of valuable artifacts and records?", 
        stopConversation = "false",
        options = {
            {"The Jedi Purge", "trial_fail"},
            {"The Sith Onslaught", "trial_fail"},
            {"The Dark Invasion", "trial_fail"},
            {"The Coruscant Catastrophe", "trial_fail"},
			{"The Scourge", "correct_answer"}
        },
    },

    yoda_thirty_nine = ConvoScreen:new {
        id = "yoda_thirty_nine",
        customDialogText = "What conflict marked the final confrontation between the Jedi and the Sith Brotherhood of Darkness, leading to the demise of Darth Bane's Sith Order and the end of the New Sith Wars?", 
        stopConversation = "false",
        options = {
            {"The Battle of Korriban", "trial_fail"},
			{"The Seventh Battle of Ruusan", "correct_answer"},
            {"The Battle of Tython", "trial_fail"},
            {"The Battle of Dxun", "trial_fail"},
            {"The Battle of Alderaan", "trial_fail"}
        },
    },

    yoda_forty = ConvoScreen:new {
        id = "yoda_forty",
        customDialogText = "What title was given to individuals within the Sith Order who served as agents and enforcers, carrying out the will of the Sith Lords and spreading fear and chaos throughout the galaxy?", 
        stopConversation = "false",
        options = {
            {"The Shadow Hand", "trial_fail"},
            {"The Sith Assassin", "trial_fail"},
            {"The Dark Acolyte", "correct_answer"},
            {"The Dark Herald", "trial_fail"},
            {"The Dark Disciple", "trial_fail"}
        },
    },

    yoda_forty_one = ConvoScreen:new {
        id = "yoda_forty_one",
        customDialogText = "What series of reforms within the Jedi Order, enacted after the New Sith Wars, emphasized the role of the Jedi as peacekeepers and guardians rather than warriors?", 
        stopConversation = "false",
        options = {
			{"The Ruusan Reformations", "correct_answer"},
            {"The Jedi Restoration", "trial_fail"},
            {"The Jedi Renewal", "trial_fail"},
            {"The Jedi Covenant", "trial_fail"},
            {"The Jedi Reconciliation", "trial_fail"}
        },
    },

    yoda_forty_two = ConvoScreen:new {
        id = "yoda_forty_two",
        customDialogText = "What ancient structure served as the spiritual and organizational center of the Jedi Order, housing the Jedi Archives and the chambers of the Jedi High Council?", 
        stopConversation = "false",
        options = {
            {"The Jedi Enclave on Dantooine", "trial_fail"},
            {"The Jedi Academy on Yavin 4", "trial_fail"},
            {"The Jedi Temple on Coruscant", "correct_answer"},
            {"The Jedi Praxeum on Ossus", "trial_fail"},
            {"The Jedi Sanctum on Tython", "trial_fail"}
        },
    },

    yoda_forty_three = ConvoScreen:new {
        id = "yoda_forty_three",
        customDialogText = "What pivotal conflict saw the Rebel Alliance achieve a decisive victory over the Galactic Empire, resulting in the death of Emperor Palpatine and the destruction of the second Death Star?", 
        stopConversation = "false",
        options = {
            {"The Battle of Yavin", "trial_fail"},
            {"The Battle of Hoth", "trial_fail"},
            {"The Battle of Endor", "correct_answer"},
            {"The Battle of Jakku", "trial_fail"},
            {"The Battle of Geonosis", "trial_fail"}
        },
    },

    yoda_forty_four = ConvoScreen:new {
        id = "yoda_forty_four",
        customDialogText = "What systematic campaign by Emperor Palpatine and Darth Vader sought to eradicate the Jedi Order, resulting in the deaths of most Jedi and the scattering of the survivors?", 
        stopConversation = "false",
        options = {
            {"The Jedi Extermination", "trial_fail"},
            {"The Jedi Culling", "trial_fail"},
            {"The Jedi Slaughter", "trial_fail"},
            {"The Jedi Annihilation", "trial_fail"},
            {"The Great Jedi Purge", "correct_answer"}
        },
    },

    yoda_forty_five = ConvoScreen:new {
        id = "yoda_forty_five",
        customDialogText = "What secret Imperial initiative, spearheaded by General Rom Mohc, aimed to create advanced battle droids infused with the power of the Force to combat the Rebel Alliance?", 
        stopConversation = "false",
        options = {
            {"The Shadow Trooper Program", "trial_fail"},
            {"The Sith Trooper Initiative", "trial_fail"},
            {"The Dark Side Trooper Project", "trial_fail"},
            {"The Dark Trooper Project", "correct_answer"},
            {"The Force Trooper Program", "trial_fail"}
        },
    },

    yoda_forty_six = ConvoScreen:new {
        id = "yoda_forty_six",
        customDialogText = "What infamous television special, aired in 1978, featured the first appearance of Boba Fett and is often considered one of the low points in the Star Wars franchise?", 
        stopConversation = "false",
        options = {
            {"The Star Wars Christmas Special", "trial_fail"},
            {"The Star Wars Holiday Special", "correct_answer"},
            {"The Star Wars Life Day Special", "trial_fail"},
            {"The Star Wars Celebration Special", "trial_fail"},
            {"The Star Wars Galactic Gala", "trial_fail"}
        },
    },

    yoda_forty_seven = ConvoScreen:new {
        id = "yoda_forty_seven",
        customDialogText = "What ancient Sith artifact, hidden within the Jedi Temple on Coruscant, served as a focal point for dark side energies and was sought after by Darth Sidious?", 
        stopConversation = "false",
        options = {
            {"The Dark Holocron", "trial_fail"},
            {"The Sith Amulet", "trial_fail"},
            {"The Sith Shrine", "correct_answer"},
            {"The Sith Relic", "trial_fail"},
            {"The Dark Engraving", "trial_fail"}
        },
    },

    yoda_forty_eight = ConvoScreen:new {
        id = "yoda_forty_eight",
        customDialogText = "What conflict, occurring one year after the Battle of Endor, saw the decisive defeat of the remnants of the Galactic Empire and marked the end of the Galactic Civil War?", 
        stopConversation = "false",
        options = {
            {"The Battle of Naboo", "trial_fail"},
            {"The Battle of Scarif", "trial_fail"},
            {"The Battle of Jakku", "correct_answer"},
            {"The Battle of Takodana", "trial_fail"},
            {"The Battle of Yavin", "trial_fail"}
        },
    },

    yoda_forty_nine = ConvoScreen:new {
        id = "yoda_forty_nine",
        customDialogText = "What institution, established by Luke Skywalker on Yavin 4, aimed to train a new generation of Jedi Knights following the fall of the Galactic Empire?", 
        stopConversation = "false",
        options = {
            {"The Jedi Praxeum", "trial_fail"},
            {"The Jedi Enclave", "trial_fail"},
            {"The Jedi Academy", "correct_answer"},
            {"The Jedi Sanctum", "trial_fail"},
            {"The Jedi Training Grounds", "trial_fail"}
        },
    },

    yoda_fifty = ConvoScreen:new {
        id = "yoda_fifty",
        customDialogText = "What secret organization, established by Emperor Palpatine and led by Darth Vader, was tasked with hunting down and eliminating Jedi survivors following Order 66?", 
        stopConversation = "false",
        options = {
            {"The Jedi Extermination Corps", "trial_fail"},
            {"The Jedi Annihilation Legion", "trial_fail"},
            {"The Inquisitorius", "correct_answer"},
            {"The Jedi Eradication Bureau", "trial_fail"},
            {"The Jedi Purge Division", "trial_fail"}
        },
    },

    yoda_fifty_one = ConvoScreen:new {
        id = "yoda_fifty_one",
        customDialogText = "What dark side organization, led by the Dark Jedi Brakiss, sought to corrupt Force-sensitive individuals and turn them against the New Jedi Order?", 
        stopConversation = "false",
        options = {
            {"The Sith Academy", "trial_fail"},
            {"The Dark Side Academy", "trial_fail"},
            {"The Shadow Academy", "correct_answer"},
            {"The Academy of Shadows", "trial_fail"},
            {"The Sith Training Grounds", "trial_fail"}
        },
    },

    yoda_fifty_two = ConvoScreen:new {
        id = "yoda_fifty_two",
        customDialogText = "What conflict, occurring decades after the Battle of Endor, saw the invasion of the galaxy by the extra-galactic species known as the Yuuzhan Vong?", 
        stopConversation = "false",
        options = {
            {"The Sith War", "trial_fail"},
            {"The Clone Wars", "trial_fail"},
            {"The Mandalorian Wars", "trial_fail"},
            {"The Great Galactic War", "trial_fail"},
            {"The Yuuzhan Vong War", "correct_answer"}
        },
    },

    yoda_fifty_three = ConvoScreen:new {
        id = "yoda_fifty_three",
        customDialogText = "What series of conflicts, occurring in the aftermath of the Thrawn crisis, saw the emergence of the Duskhan League and the threat of the extra-galactic invaders known as the Ssi-ruuk?", 
        stopConversation = "false",
        options = {
            {"The Dark Force Crisis", "trial_fail"},
            {"The Shadow War", "trial_fail"},
            {"The Nightfall Crisis", "trial_fail"},
            {"The Black Fleet Crisis", "correct_answer"},
            {"The Eclipse War", "trial_fail"}
        },
    },

    yoda_fifty_four = ConvoScreen:new {
        id = "yoda_fifty_four",
        customDialogText = "What conflict, occurring during the Yuuzhan Vong War, saw the emergence of the insectoid Killik species and their conflict with the Chiss Ascendancy and the Galactic Alliance?", 
        stopConversation = "false",
        options = {
            {"The Hive Conflict", "trial_fail"},
			{"The Swarm War", "correct_answer"},
            {"The Insect War", "trial_fail"},
            {"The Swarm Crisis", "trial_fail"},
            {"The Hive War", "trial_fail"}
        },
    },

    yoda_fifty_five = ConvoScreen:new {
        id = "yoda_fifty_five",
        customDialogText = "What group of Sith, stranded on the remote world of Kesh for millennia, emerged from isolation and sought to reclaim their place in the galaxy during the Second Galactic Civil War?", 
        stopConversation = "false",
        options = {
            {"The Exiled Sith", "trial_fail"},
            {"The Banished Sith", "trial_fail"},
            {"The Forsaken Sith", "trial_fail"},
            {"The Lost Tribe of Sith", "correct_answer"},
            {"The Sith Remnants", "trial_fail"}
        },
    },

    yoda_fifty_six = ConvoScreen:new {
        id = "yoda_fifty_six",
        customDialogText = "What philosophy, espoused by Darth Krayt's One Sith Order, rejected the Rule of Two in favor of a unified Sith Order under the supreme leadership of a single Dark Lord?", 
        stopConversation = "false",
        options = {
			{"The Rule of One", "correct_answer"},
            {"The Rule of Unity", "trial_fail"},
            {"The Sith Code of One", "trial_fail"},
            {"The Sith Directive", "trial_fail"},
            {"The Sith Covenant", "trial_fail"}
        },
    },

    yoda_fifty_seven = ConvoScreen:new {
        id = "yoda_fifty_seven",
        customDialogText = "What conflict, occurring after the Yuuzhan Vong War, saw the emergence of the insectoid Killik nests and their conflict with the Chiss Ascendancy and the Galactic Alliance?", 
        stopConversation = "false",
        options = {
            {"The Hive Conflict", "trial_fail"},
            {"The Insect War", "trial_fail"},
            {"The Swarm Crisis", "trial_fail"},
            {"The Dark Nest Crisis", "correct_answer"},
            {"The Hive War", "trial_fail"}
        },
    },

    yoda_fifty_eight = ConvoScreen:new {
        id = "yoda_fifty_eight",
        customDialogText = "What conflict, occurring during the Legacy era, saw the return of the Sith Empire under the leadership of Darth Krayt and their war against the Galactic Alliance?", 
        stopConversation = "false",
        options = {
            {"The Second Sith War", "trial_fail"},
            {"The Sith Ascendancy War", "trial_fail"},
            {"The Sith Crusade", "trial_fail"},
            {"The Sith-Imperial War", "correct_answer"},
            {"The Sith-Imperial Campaign", "trial_fail"}
        },
    },

	yoda_fifty_nine = ConvoScreen:new {
        id = "yoda_fifty_nine",
        customDialogText = "What superweapon, developed by the Galactic Empire and wielded by the Jedi Kyp Durron, was capable of causing the destruction of entire star systems?", 
        stopConversation = "false",
        options = {
            {"The Death Star", "trial_fail"},
            {"The Eclipse", "trial_fail"},
            {"The World Devastator", "trial_fail"},
            {"The Sun Crusher", "correct_answer"},
            {"The Star Forge", "trial_fail"}
        },
    },

    yoda_sixty = ConvoScreen:new {
        id = "yoda_sixty",
        customDialogText = "What organization, founded by Luke Skywalker, aimed to rebuild the Jedi Order and restore peace and justice to the galaxy following the defeat of the Galactic Empire?", 
        stopConversation = "false",
        options = {
			{"The New Jedi Order", "correct_answer"},
            {"The Jedi Coalition", "trial_fail"},
            {"The Jedi Revival", "trial_fail"},
            {"The Jedi Resurgence", "trial_fail"},
            {"The Jedi Reformation", "trial_fail"}
        },
    },

    yoda_sixty_one = ConvoScreen:new {
        id = "yoda_sixty_one",
        customDialogText = "What title was given to the Nightsister known as Mother Talzin, who wielded powerful dark side magic and led the Nightsisters of Dathomir?", 
        stopConversation = "false",
        options = {
            {"The Nightsister Matriarch", "trial_fail"},
            {"The Dark Enchantress", "trial_fail"},
            {"The Witch of Dathomir", "correct_answer"},
            {"The Dathomir Witch", "trial_fail"},
            {"The Night Sorceress", "trial_fail"}
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
	customDialogText = "Try??? This generation it is... Do or do not, there is no try! When ready are you, speak to me again.",
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
yoda_test_convo_template:addScreen(screens.yoda_six)
yoda_test_convo_template:addScreen(screens.yoda_seven)
yoda_test_convo_template:addScreen(screens.yoda_eight)
yoda_test_convo_template:addScreen(screens.yoda_nine)
yoda_test_convo_template:addScreen(screens.yoda_ten)
yoda_test_convo_template:addScreen(screens.yoda_eleven)
yoda_test_convo_template:addScreen(screens.yoda_twelve)
yoda_test_convo_template:addScreen(screens.yoda_thirteen)
yoda_test_convo_template:addScreen(screens.yoda_fourteen)
yoda_test_convo_template:addScreen(screens.yoda_fifteen)
yoda_test_convo_template:addScreen(screens.yoda_sixteen)
yoda_test_convo_template:addScreen(screens.yoda_seventeen)
yoda_test_convo_template:addScreen(screens.yoda_eighteen)
yoda_test_convo_template:addScreen(screens.yoda_nineteen)
yoda_test_convo_template:addScreen(screens.yoda_twenty)
yoda_test_convo_template:addScreen(screens.yoda_twenty_one)
yoda_test_convo_template:addScreen(screens.yoda_twenty_two)
yoda_test_convo_template:addScreen(screens.yoda_twenty_three)
yoda_test_convo_template:addScreen(screens.yoda_twenty_four)
yoda_test_convo_template:addScreen(screens.yoda_twenty_five)
yoda_test_convo_template:addScreen(screens.yoda_twenty_six)
yoda_test_convo_template:addScreen(screens.yoda_twenty_seven)
yoda_test_convo_template:addScreen(screens.yoda_twenty_eight)
yoda_test_convo_template:addScreen(screens.yoda_twenty_nine)
yoda_test_convo_template:addScreen(screens.yoda_thirty)
yoda_test_convo_template:addScreen(screens.yoda_thirty_one)
yoda_test_convo_template:addScreen(screens.yoda_thirty_two)
yoda_test_convo_template:addScreen(screens.yoda_thirty_three)
yoda_test_convo_template:addScreen(screens.yoda_thirty_four)
yoda_test_convo_template:addScreen(screens.yoda_thirty_five)
yoda_test_convo_template:addScreen(screens.yoda_thirty_six)
yoda_test_convo_template:addScreen(screens.yoda_thirty_seven)
yoda_test_convo_template:addScreen(screens.yoda_thirty_eight)
yoda_test_convo_template:addScreen(screens.yoda_thirty_nine)
yoda_test_convo_template:addScreen(screens.yoda_forty)
yoda_test_convo_template:addScreen(screens.yoda_forty_one)
yoda_test_convo_template:addScreen(screens.yoda_forty_two)
yoda_test_convo_template:addScreen(screens.yoda_forty_three)
yoda_test_convo_template:addScreen(screens.yoda_forty_four)
yoda_test_convo_template:addScreen(screens.yoda_forty_five)
yoda_test_convo_template:addScreen(screens.yoda_forty_six)
yoda_test_convo_template:addScreen(screens.yoda_forty_seven)
yoda_test_convo_template:addScreen(screens.yoda_forty_eight)
yoda_test_convo_template:addScreen(screens.yoda_forty_nine)
yoda_test_convo_template:addScreen(screens.yoda_fifty)
yoda_test_convo_template:addScreen(screens.yoda_fifty_one)
yoda_test_convo_template:addScreen(screens.yoda_fifty_two)
yoda_test_convo_template:addScreen(screens.yoda_fifty_three)
yoda_test_convo_template:addScreen(screens.yoda_fifty_four)
yoda_test_convo_template:addScreen(screens.yoda_fifty_five)
yoda_test_convo_template:addScreen(screens.yoda_fifty_six)
yoda_test_convo_template:addScreen(screens.yoda_fifty_seven)
yoda_test_convo_template:addScreen(screens.yoda_fifty_eight)
yoda_test_convo_template:addScreen(screens.yoda_fifty_nine)
yoda_test_convo_template:addScreen(screens.yoda_sixty)
yoda_test_convo_template:addScreen(screens.yoda_sixty_one)


addConversationTemplate("yoda_test_convo_template", yoda_test_convo_template);