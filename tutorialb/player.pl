sub EVENT_ENTERZONE {

  quest::movepc(189, 2, -146, 19.6, 303.75); # Zone: tutorialb

  if (!defined($qglobals{tutbind}) && ($ulevel <= 2)) {
    quest::selfcast(2049);
    quest::setglobal("tutbind", 1, 1, "D30");
  }
    
  if (!defined($qglobals{tutpop})) {
    quest::popup("Join the revolution!",
                 "Welcome to the Revolt! You have been given two new quests:
                   <br><br><c \"#FFFF00\">Rally with Rahtiz:</c><br>If you are ready to begin fighting for the revolt, 
                   hail Guard Rahtiz and see where you are needed.<br><br><c \"#FFFF00\">Basic Training:</c><br>If you 
                   would like more training on the finer points of Everquest, speak with Arias and he will direct you to other knowledgeable 
                   members of the slave revolt.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
    quest::assigntask(1448);
    quest::assigntask(5166);
    quest::setglobal("tutpop", 1, 1, "D30");
  }
    
  if ($ulevel > 15 && $status < 80) {
    $client->Message(15, "You are too high in level to be in this zone.");
    quest::selfcast(2433);
  }  
}

sub EVENT_POPUPRESPONSE {
  if ($popupid == 1) {
    quest::popup("Tradeskills", "<br>If the recipe you wish to create is not already in your list of known recipes, you can <c \"#CCFF99\">Experiment</c>.<br><br>When you have opened the <c \"#00A000\">Tradeskill</c> window, click on the <c \"#00F0F0\">Experiment</c> button. This opens a new window labeled with the name of the tradeskill container in which you are experimenting -- Oven, in this case.<br><br>You can then place your ingredients into the slots of the <c \"#00A000\">Oven</c> window. For rat steaks, this requires the rat meat and cooking sauce.<br><br>When the ingredients are in the oven, click the <c \"#00F0F0\">Combine</c> button. The ingredients will be consumed, and you will have cooked a rat steak.<br><br><c \"#F07F00\">Click 'OK' to learn about recipes and skill levels.</c>", 2);
  }
  if ($popupid == 2) {
    quest::popup("Tradeskills", "<br>Some tradeskill recipes are more complicated than others, and require you to possess a higher tradeskill level in the tradeskill you are attempting to practice.<br><br>If your level is not high enough to attempt a particular recipe, you will likely fail the combine. When this happens, you will often lose some or all of the ingredients you used for the combine.<br><br><c \"#F07F00\">Click 'OK' to learn about different types of tradeskills.</c>", 3);
  }
  if ($popupid == 3) {
    quest::popup("Tradeskills", "<br>There are many different types of tradeskills that you can practice, including baking, pottery, fletching, blacksmithing, and weaving. You can create all manner of items using these skills.<br><br>To perform the various types of tradeskills, you must use the correct types of tradeskill containers. For example, to perform baking, you need an oven. Blacksmithing requires a forge. Pottery requires a kiln. Be on the lookout for different types of tradeskill containers located in cities throughout Norrath.", 4);
  }
  if ($popupid == 4) {
    if (quest::istaskactivityactive(1448, 9)) {
      quest::updatetaskactivity(1448, 9); #Task: Basic Training
    }
  }
  if ($popupid == 6) {
    quest::popup("Managing Hotbars", "<br>There are multiple ways to adjust and manage your <c \"#CCFF99\">Hotbars</c>: <br><br><c \"#00A000\">Cycling</c><br>You switch which particular page of the hotbar you are on by using the up and down arrows on the right-side of the bar. <br><br><c \"#00A000\">New Hotbars</c><br>You can add new Hotbars by using your <c \"#CCFF99\">EQ Menu</c> button, and then selecting <c \"#CCFF99\">Hotkeys</c> 1-10.<br><br><c \"#F07F00\">Click 'OK' to learn managing your Hotbars.</c>", 7);
  }
  if ($popupid == 7) {
    quest::popup("Assigning Hotkeys", "<br><c \"#CCFF99\">Hotkeys</c> are abilities, actions, and macros that can be activated with a simple click. There are multiple ways to customize your <c \"#CCFF99\">Hotbar</c> using these buttons:<br><br><c \"#00A000\">Drag & Drop</c><br>You can move and set <c \"#CCFF99\">Hotkeys</c> by holding down the left mouse button for a moment, and then dragging the icon to the <c \"#CCFF99\">Hotbar</c>. This is especially useful for dragging from your <c \"#CCFF99\">Action</c>, <c \"#CCFF99\">Alternate Advancement</c>, and <c \"#CCFF99\">Spell Gem</c> menus.<br><br><c \"#00A000\">Right-Click</c><br>You can right-click an empty <c \"#CCFF99\">Hotbar</c>. slot and use <c \"#CCFF99\">Assigning Social</c> to assign custom made actions. More about those will be presented in the next section.<br><br><c \"#F07F00\">Click 'OK' to learn about custom functions for your Hotbars.</c>", 8);
  }
  if ($popupid == 8) {
    quest::popup("Custom Hotkeys", "<br>Dragging existing abilities and assigning default actions is only the first step. You can also create your own <c \"#CCFF99\">Hotkeys</c>! You can use your <c \"#CCFF99\">Action</c> menu to access the <c \"#CCFF99\">Socials Page</c>.<br><br><c \"#F07F00\">Click 'OK' to learn about personalizing your Hotbars.</c>", 9);
  }
  if ($popupid == 9) {
    quest::popup("Personalizing the Hotbar", "<br>You can personalize your <c \"#CCFF99\">Hotkeys</c> by using the extended right-click menu. Hold down the right mouse button over an existing <c \"#CCFF99\">Hotkey</c> to see the options: <br><br><c \"#00A000\">Activate</c><br>This uses the key as if you had left-clicked on it. <br><br><c \"#00A000\">Clear</c><br>This removes the key. <br><br><c \"#00A000\">Assign Icon</c><br>Select an icon you want from the entire library of icons. <br><br><c \"#00A000\">Clear Icon</c> <br>This removes the custom icon. <br><br><c \"#00A000\">Assign Label</c><br>This changes the text on the key. <br><br><c \"#00A000\">Assign Social</c><br>This lets you put a custom ability created on the <c \"#CCFF99\">Socials Page</c> into the <c \"#CCFF99\">Hotbar</c> directly. <br><br><c \"#00A000\">Change Size</c><br>This lets you resize and scale the entire <c \"#CCFF99\">Hotbar</c>. <br><br><c \"#00A000\">Unmemorize</c><br>This lets you forget a memorized spell. Only works on spell gem <c \"#CCFF99\">Hotkeys</c>. <br><br><c \"#F07F00\">Click 'OK' to complete the tutorial on Hotbars.</c>");
    if (quest::istaskactivityactive(8804, 1)) {
      quest::updatetaskactivity(8804, 1); #Task: Hotbars
    }
    if (quest::istaskactivityactive(1448, 7)) {
      quest::updatetaskactivity(1448, 7); #Task: Basic Training
    }
  }
  if ($popupid == 10) {
    quest::popup("Swimming", "<br>When underwater, your remaining air is shown in the <c \"#00A000\">Air Remaining</c> window. If your air supply runs out, you will begin taking damage.<br><br>As your swimming skill increases, so will your air supply and swimming speed. The more time you spend in the water, the better swimmer you will become!");
  }
  if ($popupid == 11) {
    quest::popup("Advanced Tips", "There are many different augments which are classified into different types, known as \"slot types\". If you right click on an augment and hold for a few seconds, the augment's description window will open. Here you can see the augment's slot type(s), as well as any other requirements, such as race, class, level restrictions, and types of items in which the augment may be embedded. In order to insert an augment into an item, the item must have an empty slot type which matches the augment's and be usable in one of the same equipment slot(s).<br>Your character will also need to meet any race, class, and level requirements noted on the augment, in order to gain any benefit from it.", 12);
  }
  if ($popupid == 12) {
    #This is [sic] - on Live it is misspelled as "Delect" instead of "Select"
    quest::popup("Removing or Destroying Augmentations", "There will be times when you want to replace or even remove old augments. Many augments can be easily removed using a distiller, which will allow you to reuse the augment later, however, some augments cannot be removed without being destroyed.<br><br><b>To remove an augment:<b><br>1. With the required distiller in your inventory (the augment's description window will tell you which), left-click on the aug while not holding anything and select \"Remove\"<br>2. Click 'Yes' in the confirmation window, to remove your augment. The distiller will be consumed and your augment will appear on your cursor.<br><br><b>To destroy an augment:<b><br>1. Right-click on the augment's icon in the item description window<br>2. Delect 'Destroy' from the drop down menu<br>3. Click 'Yes' in the confirmation window");
  }
  if ($popupid == 13) {
    quest::popup("Achievement Types", "<br>Achievements are split into <c \"#CCFF99\"> categories</c> and <c \"#CCFF99\"> subcategories</c>. <br><br> <c \"#CCFF99\">General</c> contains achievements for class, advancement, and other achievements that don't fit in a particular category. <br><br><c \"#CCFF99\">Tradeskill</c> houses all achievements related to tradeskill activities like increasing rank or doing special quests. <br><br><c \"#CCFF99\">The Hero's Journey</c> is a list of achievements for progressing along the main path of suggested advancement. <br><br><c \"#CCFF99\">Expansion</c> categories list all achievements for a particular expansion. <br><br>Try using the filters <c \"#00F0F0\"> Open, Complete, and Locked</c> to display which achievements are displayed, and examine the categories in detail. The Open filter displays achievements you haven't completed yet. The Complete filter lets you toggle the display of achievements you have already completed. The Locked filter toggles the achievements you aren't quite ready to work on just yet.<br><br><c \"#F07F00\">Click 'OK' to learn about how to acquire achievements.</c>", 14);
  }
  if ($popupid == 14) {
    quest::popup("Gaining Achievements", "<br><c \"#CCFF99\">Components</c> are the requirements or set of requirements you must fulfill to gain an achievement. <br><br><c \"#00F0F0\">Click</c> the <c \"#CCFF99\">General</c> category, and then the <c \"#CCFF99\">Special</c> subcategory. You should see an achievement for <c \"#CCFF99\">Mastering Achievements</c>. <br><br> <c \"#00F0F0\">Click</c> the <c \"#CCFF99\">Mastering Achievements</c> achievement, and you will see a check-box for <c \"#CCFF99\">Achievement Tutorial</c>. When you complete this tutorial, you will gain this achievement. <br><br><c \"#F07F00\">Click 'OK' to learn more details about achievements.</c>", 15);
  }
  if ($popupid == 15) {
    quest::popup("Achievement Details", "<br><c \"#CCFF99\">Achievement Score</c> is listed on top of the achievement window on the <c \"#CCFF99\">Achievements</c> tab and <c \"#CCFF99\">Summary</c> tab. Listed here is the total number of <c \"#CCFF99\">Achievement Points</c>, the <c \"#CCFF99\">total achievements completed</c>, and the <c \"#CCFF99\">achievements completed in the selected category</c>. <br><br><c \"#00F0F0\">Click</c> the <c \"#CCFF99\">Summary</c> tab for a full breakdown of all achievement details.<br><br> The <c \"#CCFF99\">Compare</c> button lets you match your achievements against another player. Select another player and click Compare to see how you match up. <br><br><c \"#F07F00\">Click 'OK' to learn about achievement rewards.</c>", 16);
  }
  if ($popupid == 16) {
    quest::popup("Achievement Rewards", "<br><c \"#CCFF99\">Rewards</c> are available for completing some achievements. <c \"#00F0F0\">Select</c> the <c \"#CCFF99\">Mastering Achievements</c> achievement located under the main category <c \"#CCFF99\">General</c> and subcategory <c \"#CCFF99\">Special</c>. A button displayed there says <c \"#CCFF99\">View Reward</c>. You can click this button to bring up your rewards window and see that completing this achievement offers you experience and money. You will also of course get the achievement points listed here, that go to your total score.<br><br>There are many achievements out there, with plenty of challenge and reward!<br><br><c \"#F07F00\">Click 'OK' to finish the achievement tutorial and acquire your reward.</c>", 17);
  }
  if ($popupid == 17) {
    if (quest::istaskactivityactive(8799, 1)) {
      quest::updatetaskactivity(8799, 1); #Task: Achievements
    }
    if (quest::istaskactivityactive(1448, 12)) {
      quest::updatetaskactivity(1448, 12); #Task: Basic Training
    }
  }
  if ($popupid == 18) {
    quest::popup("Banking", "<br>Lyndroh has a backpack for you to use! <c \"#00F0F0\">left click</c> on the pack in the bank inventory, and place it in your own inventory. <br><br>Note that unless a backpack is empty, you cannot place it inside another backpack.<br><br><c \"#F07F00\">Drop off or pick up any items you'd like from your bank and click 'OK'.</c>", 19);
  }
  if ($popupid == 19) {
    if (quest::istaskactivityactive(1448, 11)) {
      quest::updatetaskactivity(1448, 11); #Task: Basic Training
    }
  }
  if ($popupid == 20) {
    if (quest::istaskactivityactive(1448, 10)) {
      quest::updatetaskactivity(1448, 10); #Task: Basic Training
    }
  }
  if ($popupid == 21) {
    quest::popup("Communication", "<br>There are many different commands that you may enter in your <c \"#00A000\">Chat Window</c> to talk to other players in EverQuest.<br><br><c \"#F0F000\">/say</c><br> This sends your message to everyone in the immediate area.  For example, /say Anyone know any good pirate jokes?<br><br><c \"#F0F000\">/tell Player Name</c><br> This sends a message to a single player.  For example, /tell Tearis Hello, would you like to form a group?<br><br><c \"#F0F000\">/g</c><br>This sends a message to all players in your group.  For example, /g Uh oh. We woke the dragon.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>", 22);
  }
  if ($popupid == 22) {
    quest::popup("Communication", "<br>Here are a few chat commands that you can type in your Main Chat window to communicate with multiple players at the same time.<br><br><c \"#F0F000\">/shout</c><br>This is a zonewide channel that sends a message to everyone in the zone.  Example: /shout Look out!  Slavemaster Ruga is right behind me!<br><br><c \"#F0F000\">/ooc</c><br>The out of character command is also zonewide command for talking about the game.  Example: /ooc How do I open the quest window again?<br><br><c \"#F07F00\">Click 'OK' to continue.</c>", 23);
  }
  if ($popupid == 23) {
    quest::popup("Chat Windows", "<br><c \"#00A000\">Main Chat</c> is just one chat window you can utilize. To fully customize your interface and make sure you can see what you want, where you want, you can open additional windows and change filters. <br><br><c \"#F0F000\">New Windows</c><br> Right-click on your <c \"#00A000\">Main Chat</c> window title bar and select <c \"#00A000\">New Chat Window</c> to open up a brand new window. You will also see the option to <c \"#00A000\">Rename Window</c>  to change the window name, and the option to make this window your main chat window with the <c \"#00A000\">Always Chat Here</c> menu choice.<br><br><c \"#F0F000\">Chat Filters</c><br> Select what you want to see in each window by turning on/off <c \"#00A000\">Filters</c>. You can choose what type of chat goes into which window by using <c \"#00A000\">Channel</c> to pick chat channels as well. In addition, you have the option to set your character's <c \"#00A000\">Language</c>, as well as determine how and which system messages are delivered under <c \"#00A000\">Hit Modes</c>. <br><br><c \"#F07F00\">Click 'OK' to learn about chat channels.</c>", 24);
  }
  if ($popupid == 24) {
    quest::popup("Custom Chat Channels", "<br>While regular chat channels cover a lot of situations, custom <c \"#00A000\">Chat Channels</c> let you keep in touch with friends easily even when you are not in the same guild or group. You can use these commands to join a custom channel.<br><br><c \"#F0F000\">/join Chat Channel Name</c><br>If you use /join you can enter a custom <c \"#00A000\">Chat Channel</c> to talk to anyone who joins it. You can set which window the text goes to. To speak in a channel, use the number associated it preceded by a \"/\". For example, \"/2 Hello\" lets you say hello to your second channel.<br><br><c \"#F0F000\">/autojoin Chat Channel Name</c><br>You can use /autojoin to set up default custom <c \"#00A000\">Chat Channels</c> to join without having to manually enter them when entering the game. Autojoin is very useful in streamlining your chat preferences in regards to custom channels.<br><br><c \"#F07F00\">Click 'OK' to close the window and complete this tutorial.</c>");
    if (quest::istaskactivityactive(1448, 6)) {
      quest::updatetaskactivity(1448, 6);
    }
    quest::signal(189018); #NPC: Prathun
  }
  if ($popupid == 25) {
    quest::popup("Combat Abilities", "<br>Combat Ability Shortcuts:<br><br>It is also possible to create hotkeys by <c \"#00F0F0\">right-clicking</c> on an empty slot in your  <c \"#00A000\">Combat Abilities Window</c> and choosing your ability from the <c \"#00A000\">Context Menu</c>.  As you learn more abilities, more categories will appear in these menus.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>", 26);
  }
  if ($popupid == 26) {
    quest::popup("Combat Abilities", "<br><c \"#F0F000\">Using Combat Abilities:</c><br>For a description of what your combat abilities can do, <c \"#00F0F0\">left click</c> on the S button in your <c \"#00A000\">Combat Abilities Window</c>, then select the name of the combat ability in the window that pops up.  The description will appear in the lower portion of this <c \"#00A000\">Combat Skills Window</c>.<br><br>To use an ability, select your target and then <c \"#00F0F0\">left click</c> on the hotkey you have created in your <c \"#00A000\">Combat Abilities Window</c> or <c \"#00A000\">Hotbar</c>.<br><br><c \"#F0F000\">Endurance:</c><br>Most combat abilities require endurance to cast or to keep active.  Endurance is represented by the yellow bar below your hit point meter in the <c \"#00A000\">Player Window</c>. Much like hit points, endurance will regenerate over time, but unlike hit points they will regenerate at the same rate whether you are sitting or standing as long as you are not actively attacking something.<br><br>If you are in a rested state and sitting (there will be a yellow swirl in your <c \"#00A000\">Player Window</c> when this is true), both endurance and hit points regenerate at a much faster rate than normal.<br><br>If you wish to read these lessons again, simply ask Rytan to [review] them.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
    if (quest::istaskactivityactive(1448, 5)) {
      quest::updatetaskactivity(1448, 5); #Task: Basic Training
    }
    quest::signal(189019); #NPC: Rytan
  }
  if ($popupid == 27) {
    quest::popup("Spells and Songs", "<br><c \"#F0F000\">Using Spells:</c><br><br>To cast a spell, you must have memorized the spell in your <c \"#00A000\">Spell Bar</c>.To cast your spell, select your target and then <c \"#00F0F0\">left click</c> on the spell icon in your <c \"#00A000\">Spell Bar</c>.<br><br>For a description of what your spells can do, <c \"#00F0F0\">right click and hold</c> on the spell icon in your spell book.<br><br><c \"#F0F000\">Mana:</c><br>Most spells require mana to cast.  Mana is represented by the blue bar below your hit point meter in the <c \"#00A000\">Player Window</c>. Much like hit points, mana will regenerate over time, but it will regenerate much faster when you are sitting.<br><br>If you are in a rested state and sitting (there will be a yellow swirl in your <c \"#00A000\">Player Window</c> when this is true), both mana and hit points regenerate at a much faster rate than normal.<br><br>If you wish to read these lessons again, simply ask Rytan to [review] them.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
  }
  if ($popupid == 28) {
    quest::popup("Choosing a Mercenary Type", "<br>When you <c \"#00F0F0\">right click</c> on a mercenary liaison, the <c \"#00A000\">Mercenary Merchant</c> window opens.<br><br>To view which mercenary you want to hire, click on the dropdown box under the <c \"#00F0F0\">Type</c> label and choose either the <c \"#00F0F0\">Apprentice</c> or <c \"#00F0F0\">Journeyman</c> category.<br><br>o Then, click on the labels in the <c \"#00F0F0\">Available Mercenaries</c> pane. When you do so, an overview of the selected mercenary will appear in the pane to the right. The bottom two panes describe the <c \"#CCFF99\">stances</c> available to the selected mercenary.<br><br>o You will notice that Elegist is offering two types of mercenaries: a tank and a healer. If you are a class that relies on close-combat physical attacks, such as a warrior or rogue, you should hire a <c \"#CCFF99\">healer</c> mercenary to keep your health high during battle.<br><br>If you are a class that fights with magic and cannot sustain much injury, such as a cleric or wizard, you should hire a <c \"#CCFF99\">tank</c> mercenary to absorb damage inflicted by your enemies.<br><br><c \"#F07F00\">Before you hire a mercenary, click 'OK' to learn about different ranks. </c>", 29);
  }
  if ($popupid == 29) {
    quest::popup("Choosing a Mercenary Rank", "<br>You can choose between two ranks of mercenaries: <c \"#CCFF99\">Apprentice</c> and <c \"#CCFF99\">Journeyman</c>. Apprentices charge less for their purchase and upkeep, but they have access to fewer <c \"#CCFF99\">stances</c>, and they have a higher likelihood of running from a difficult fight. Journeymen charge more for their purchase and upkeep, but they have more HP and mana, have access to all stances, and are less likely to run from a difficult fight.<br><br>Note that Apprentice mercenaries are <c \"#99FFFF\">free</c> of hiring cost and upkeep until you reach level 10. Journeyman mercenaries are <c \"#99FFFF\">free</c> until you reach level 5.<br><br>For now, select an <c \"#CCFF99\">Apprentice</c> mercenary and click the <c \"#00F0F0\">Hire</c> button.<br><br><c \"#F07F00\">Hire your mercenary now. </c>", 30);
  }
  if ($popupid == 30) {
    quest::popup("Understanding the Mercenary Window", "<br>When you first hire a mercenary, the <c \"#00A000\">Manage Mercenaries</c> window will automatically open. You can also open this window by clicking on the <c \"#00F0F0\">EQ</c> button and choosing the <c \"#00F0F0\">Mercenaries</c> option from the menu. A third way to open the mercenary window is to click on the shield icon inside the <c \"#00A000\">Window Selector</c> window.<br><br>Take a moment to look at the <c \"#00A000\">Manage</c> tab. Hover your mouse over different buttons and labels to see tooltip descriptions of how the different features work.<br><br>Notice the <c \"#00A000\">Stances</c> section of the <c \"#00A000\">Manage</c> tab. This is where you will set the behaviors for your mercenary.<br><br><c \"#F07F00\">Click 'OK' to find out more about stances. </c>", 31);
  }
  if ($popupid == 31) {
    quest::popup("Mercenary Stances", "<br>Mercenaries have a variety of <c \"#CCFF99\">stances</c>, which determine how the mercenaries act in specific situations.<br><br>For example, all mercenaries have the <c \"#CCFF99\">Passive</c> stance, which tells them not to cast any spells or engage enemies in combat. Healer mercenaries have an <c \"#CCFF99\">Efficient</c> stance, which tells the mercenary to cast healing spells that consume the least amount of mana. Tank mercenaries have an <c \"#CCFF99\">Aggressive</c> stance, which tells the mercenary to focus on delivering powerful blows to your enemies and mantaining their attention.<br><br>You can switch a mercenary's stance at any time by clicking on the name of the stance inside the <c \"#00A000\">Manage Mercenaries</c> window and then clicking on the <c \"#00F0F0\">Set Active</c> button in the same window. You can also create hotkeys for the different stances by selecting a stance and clicking on the <c \"#00F0F0\">Set Hotkey</c> button. This will create a hotkey on your cursor that can then be placed on a hotbar by clicking in a slot.<br><br>For now, place your mercenary on <c \"#CCFF99\">Passive</c> by clicking on this stance name and then clicking on the <c \"#00F0F0\">Set Active</c> button.<br><br>Notice that the mercenary is not trying to cast any spells. If you were to engage in combat now, the mercenary would not assist you.<br><br><c \"#F07F00\">Click 'OK'.</c>", 32);
  }
  if ($popupid == 32) {
    quest::popup("Using Your Mercenary", "<br>Now, set your mercenary to <c \"#CCFF99\">Balanced</c>. In this stance, the healer mercenary will cast healing and buffing spells on you while trying to conserve mana use. If you encounter a particularly difficult fight, and you need more healing, you can switch the stance to <c \"#CCFF99\">Reactive</c>.<br><br><c \"#F07F00\">Click 'OK' to learn about Group Roles. </c>", 33);
  }
  if ($popupid == 33) {
    quest::popup("Mercenary Group Roles", "<br>You are almost ready to fight. Now you need to assign the proper <c \"#CCFF99\">group roles</c> to your mercenary and yourself. This lets your mercenary know how it is supposed to act when in your group.<br><br>In the <c \"#00A000\">Player Information</c> window, <c \"#00F0F0\">right click</c> on your character name, hover your mouse over <c \"#00F0F0\">Roles</c>, and select <c \"#00F0F0\">Main Tank</c>. This will cause your mercenary to regard you as the <c \"#CCFF99\">tank</c> during your battles, providing you with the most healing, since you will be receiving the majority of damage dealt by your enemy.<br><br><c \"#F07F00\">When you have set your roles, click 'OK'. </c>", 34);
  }
  if ($popupid == 34) {
    quest::popup("Time to Fight!", "<br>You and your mercenary are ready to fight!<br><br><c \"#F07F00\">Kobold infiltrators have entered this part of the cavern through the waterway. They are now encamped to the northwest. Engage them in battle, and use your mercenary to kill one of them! </c>");
  }
  if ($popupid == 35) {
    quest::popup("Range Attacks", "<br>Now that you have your bow and arrows equipped, you can perform range attacks.<br><br>Target an enemy you wish to attack and click the <c \"#00F0F0\">Range Attack</c> button on your <c \"#00A000\">Hotbar</c> window.<br><br>If you are far enough away from your target, you will fire an arrow at them. If you are too close, you will be unable to perform range attacks on your target.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>", 36);
  }
  if ($popupid == 36) {
    quest::popup("Range Attacks", "<br>Only certain classes have the ability to use bows and arrows. Other classes can use throwing weapons instead, such as knives and stars.<br><br>To use a throwing weapon -- in this example a throwing knife -- you must place one throwing knife in your <c \"#CCFF99\">Range</c> slot, and at least one other throwing knife in your <c \"#CCFF99\">Ammo</c> slot. Then, every time you perform a range attack, a throwing knife in your <c \"#CCFF99\">Ammo</c> slot will be consumed. <br><br><c \"#F07F00\">Click 'OK' to learn about quivers.</c>", 37);
  }
  if ($popupid == 37) {
    quest::popup("Range Attacks", "<br>Quivers are a special types of bags that only hold arrows. The quiver given to you by Guard Rahtiz has no special properties, but in Norrath you can find some quivers that reduce the weight of the arrows they hold and increase archery speed.");
  }
  if ($popupid == 111) { 
    quest::popup("Maps", "<br><c \"#CCFF99\">Additional Map Features</c><br><br>If you want to show or hide the visibility of floors above or below your current position, you can toggle the <c \"#00F0F0\">Height Filter</c> button. When this button is activated, locations and items below a distance specified in the \"Low\" field won't be drawn. Likewise, anything above the \"High\" distance won't be drawn.<br><br>To show or hide labels on the map, toggle the <c \"#00F0F0\">Labels</c> button.<br><br>If you are in a group and wish to find members of your group on the map, activate the <c \"#00F0F0\">Group</c> button. Group members will appear on the map as green <c \"#00FF00\">X</c>'s.");
  }
}    

sub EVENT_TASK_STAGE_COMPLETE {
  if ($task_id == 5096) {
    quest::ze(15, "A cheer arises from the slaves as the last of the Kobold overseers fall.");
  }
  if (($task_id == 5092) && ($activity_id == 1)) {
    $client->Message(0, "Vahlara bows as you return. 'Just in time. Many are wounded and more arrive by the hour. If you can find any Gloomingdeep silk, bring it to me and I can reward you with more burlap clothing. It's not much, but it's nicer than the rags these kobolds left us with.'");
  }
} 

sub EVENT_CLICKDOOR {
  my $d_id = ($doorid % 256);

  if ($d_id == 11) {
    my $s_zone = $client->GetStartZone();
    if ($s_zone == 9) {
      quest::movepc(9, -60.9, -61.5, -24.9); # Zone: freportw
    }
    elsif ($s_zone == 19) {
      quest::movepc(19, -98.4, 11.5, 3.1); # Zone: rivervale
    }
    elsif ($s_zone == 24) {
      quest::movepc(24, -309.8, 109.6, 23.1); # Zone: erudnext
    }
    elsif ($s_zone == 25) {
      quest::movepc(25, -965.3, 2434.5, 5.6); # Zone: nektulos
    }
    elsif ($s_zone == 29) {
      quest::movepc(29, 12.2, -32.9, 3.1); # Zone: halas
    }
    elsif ($s_zone == 40) {
      quest::movepc(40, 156.9, -2.9, 31.1); # Zone: neriaka
    }
    elsif ($s_zone == 41) {
      quest::movepc(41, -499, 2.9, -10.9); # Zone: neriakb
    }
    elsif ($s_zone == 42) {
      quest::movepc(42, -968.9, 891.9, -52.8); # Zone: neriakc
    }
    elsif ($s_zone == 45) {
      quest::movepc(45, -343, 189, -38.22); # Zone: qcat
    }
    elsif ($s_zone == 49) {
      quest::movepc(49, 520.1, 235.4, 59.1); # Zone: oggok
    }
    elsif ($s_zone == 50) {
      quest::movepc(50, 560, -2234, 3); # Zone: rathemtn
    }
    elsif ($s_zone == 52) {
      quest::movepc(52, 1.1, 14.5, 3.1); # Zone: grobb
    }
    elsif ($s_zone == 54) {
      quest::movepc(54, -197, 27, -0.7); # Zone: gfaydark
    }
    elsif ($s_zone == 55) {
      quest::movepc(55, 7.6, 489.0, -24.9); # Zone: akanon
    }
    elsif ($s_zone == 61) {
      quest::movepc(61, 26.3, 14.9, 3.1); # Zone: felwithea
    }
    elsif ($s_zone == 68) {
      quest::movepc(68, -214.5, 2940.1, 0.1); # Zone: butcher
    }
    elsif ($s_zone == 75) {
      quest::movepc(75, 200, 800, 3.39); # Zone: paineel
    }
    elsif ($s_zone == 106) {
      quest::movepc(106, -415.7, 1276.6, 3.1); # Zone: cabeast
    }
    elsif ($s_zone == 155) {
      quest::movepc(155, 105.6, -850.8, -190.4); # Zone: sharvahl
    }
    else {
      quest::movepc(202, -55, 44, -158.81); # Zone: poknowledge
    }
  }
}

sub EVENT_LOOT {
  if ($corpse_name eq "a_kobold_barrel" && ($looted_id == 8500 || $looted_id == 6919) && !quest::get_data($name . "_tutb_range_attacks")) { #Item: CLASS 1 Wood Point Arrow, Forlorn Bow
    quest::popup("Range Attacks", "<br>Did you find a bow and some arrows in the barrels you destroyed? With these, you can attack an enemy at range.<br><br>Equip your bow by placing it in your <c \"#CCFF99\">Range</c> slot in the <c \"#00A000\">Inventory</c> window, or by dropping it in the center of your inventory.<br><br>Equip your arrows by placing them in your <c \"#CCFF99\">Ammo</c> slot in the <c \"#00A000\">Inventory</c> window, or by dropping them in the center of your inventory.<br><br><c \"#F07F00\">Once you have equipped your bow and arrows, click 'OK' to continue.</c>", 35);
    quest::set_data($name . "_tutb_range_attacks", "1", "D5");
  }
}
