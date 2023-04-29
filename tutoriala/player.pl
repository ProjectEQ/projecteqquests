my $has_hailed = 0;

sub EVENT_ENTERZONE {
  #$instance = quest::CreateInstance("tutoriala", $client->CharacterID(), 999999999);
  #quest::AssignToInstance($instance);
  #quest::MovePCInstance(188, $instance, 159, 18, -25.8, 348);

  quest::popup("Welcome to EverQuest!", "You regain consciousness!<br><br><c \"#F07F00\">Click 'OK' to begin the EverQuest tutorial.</c>", 1);
}

sub EVENT_POPUPRESPONSE {
  if ($popupid == 1) {
    quest::popup("Meeting Arias", "As you stagger to your feet, you realize that someone is talking to you. Check the <c \"#00A000\">Main Chat Window</c> below to see what he is saying.<br><br><c \"#F07F00\">Click 'OK' when you are ready to continue.</c>", 2);
    quest::signalwith(188000, 1); ##Arias
  }
  if ($popupid == 2) {
    quest::popup("Basic Movement", "<c \"#F0F000\">Mouse Look:</c><br>Hold the <c \"#00F0F0\">right mouse button</c> and drag the mouse to look in that direction. With the <c \"#00F0F0\">right mouse button</c> depressed, hold the <c \"#00F0F0\">left mouse button</c> to move forward.<br><br><c \"#F0F000\">WASD Keys:</c><br>W moves forward. S moves backward. A and D turn left or right.<br><br><c \"#F0F000\">Arrow Keys:</c><br>Up Arrow moves forward. Down Arrow moves backward. Left Arrow and Right Arrow turn left or right.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>", 3);
  }
  if ($popupid == 3) {
    quest::popup("Targeting Arias", "<br>Arias is an NPC, short for Non-Player Character.<br><br>The first step to interacting with an NPC is to target them. Target Arias by <c \"#00F0F0\">left clicking</c> him. Notice that, when targeted, the name above his head will blink and his name will appear in the <c \"#00A000\">Target Window</c>.<br><br><c \"#F07F00\">Target Arias and click 'OK' to continue.</c>", 4);
    quest::signalwith(188000, 2); ##Arias
  }
  if ($popupid == 4) {
    quest::popup("Hailing Arias", "<br>Many friendly NPCs will talk to you if you 'Hail' them. To hail Arias, press the <c \"#00F0F0\">H</c> key.<br><br>Note that you will need to stand near the NPC and in most cases it is necessary to have the NPC targeted.<br><br><c \"#F07F00\">Hail Arias to continue.</c>", 5);
  }
  if ($popupid == 5) {
    quest::popup("Hailing Arias", "<br>Many friendly NPCs will talk to you if you 'Hail' them. To hail Arias, press the <c \"#00F0F0\">H</c> key.<br><br>Note that you will need to stand near the NPC and in most cases it is necessary to have the NPC targeted.<br><br><c \"#F07F00\">Hail Arias to continue.</c>", 5);
  }
  if (($popupid == 6) && (!quest::istaskactive(505744))) {
    quest::popup("Speaking with Arias", "<br>Arias responded to your hail in the <c \"#00A000\">Main Chat Window</c>.<br><br>Notice that the word [<c \"#00F0F0\">escape</c>] is highlighted blue and set apart in brackets. This indicates a key word or phrase that you can use to reply to Arias.<br><br>To respond, <c \"#00F0F0\">left click</c> on the word [<c \"#00F0F0\">escape</c>] in the <c \"#00A000\">Main Chat Window</c>.<br><br><c \"#F07F00\">Tell Arias 'I want to escape.' to continue.</c>", 6);
  }
  if (($popupid == 7) && (!quest::istaskactive(505744))) {
    quest::popup("Quests", "<br>You have been offered your first quest: Jail Break! The <c \"#00A000\">Task Window</c> displays a verbose list of all the steps associated with this quest.<br><br><c \"#F0F000\">Remember:</c><br>You can press <c \"#00F0F0\">[ALT + Q]</c> to open the <c \"#00A000\">Quest Journal Window</c> and examine your quests' details.<br><br><c \"#F07F00\">Press 'Accept' when you are ready to begin Arias's quest.</c>", 7);
  }
  if (($popupid == 8) && (quest::istaskactivityactive(505744, 1))) {
    quest::popup("Find the Gloomingdeep Jailor", "<br>You have accepted your first quest: Jail Break! The <c \"#00A000\">Task Window</c> displays a verbose list of all the steps associated with this quest. You can also see the brief version of the task steps in the <c \"#00A000\">Quest Overlay Window</c>.<br><br>To complete Arias's quest, you must locate the Gloomingdeep Jailor, defeat him, loot the jailor's key, and then give the jailor's key to Arias.<br><br>Explore the area until you find the Gloomingdeep Jailor<br><br><br><c \"#F07F00\">Find the Gloomingdeep Jailor to continue.</c>", 8);
    quest::signalwith(188000, 3); ##Arias
  }
  if (($popupid == 9) && (quest::istaskactivityactive(505744, 2))) {
    quest::popup("Combat", "<br>You've found the Gloomingdeep Jailor!<br><br>First, <c \"#00F0F0\">left click</c> the jailor to target him. Then approach him and activate auto attack by pressing the <c \"#00F0F0\">Q</c> key or the 'Melee Attack' button in the <c \"#00A000\">Hot Button Window</c>.<br><br><c \"#F07F00\">Use auto attack to defeat the Gloomingdeep Jailor!</c>", 9);
    quest::signalwith(188000, 4); ##Arias
  }
  if (($popupid == 10) && (quest::istaskactivityactive(505744, 3))) {
    quest::popup("Looting the Key", "<br>You must acquire the Gloomingdeep Jailor's Key. Find the key displayed in the <c \"#00A000\">Advanced Loot Window</c> and click the green checkmark next to the key. This will place the key in your inventory.<br><br>Note that you can hover your cursor over the icons of the items in the <c \"#00A000\">Advanced Loot Window</c> to see their names.<br><br><c \"#F07F00\">Loot the key from the Gloomingdeep Jailor's corpse to continue.</c>", 10);
  }
  if (($popupid == 11) && (quest::istaskactivityactive(505744, 4))) {
    quest::popup("Giving Arias the Key", "<br>Arias needs the key to unlock the main gate.<br><br>To give an item to another character, open the <c \"#00A000\">Inventory Window</c>, by pressing the '<c \"#00F0F0\">I</c>' key. <c \"#00F0F0\">Left click</c> on an item to pick it up with your cursor. Then <c \"#00F0F0\">left click</c> on the recipient. The <c \"#00A000\">Give Window</c> will appear. Confirm the trade by clicking the 'Give' button.<br><br><c \"#F07F00\">Give the key to Arias.</c>", 11);
  }
  if ($popupid == 12) {
    quest::movepc(189, 2, -146, 19.6, 303.75); #tutorialb
  }
}

sub EVENT_TASKACCEPTED {
  quest::popup("Find the Gloomingdeep Jailor", "<br>You have accepted your first quest: Jail Break! The <c \"#00A000\">Task Window</c> displays a verbose list of all the steps associated with this quest. You can also see the brief version of the task steps in the <c \"#00A000\">Quest Overlay Window</c>.<br><br>To complete Arias's quest, you must locate the Gloomingdeep Jailor, defeat him, loot the jailor's key, and then give the jailor's key to Arias.<br><br>Explore the area until you find the Gloomingdeep Jailor<br><br><br><c \"#F07F00\">Find the Gloomingdeep Jailor to continue.</c>", 8);
  quest::updatetaskactivity(505744, 0); #Jail Break!
  quest::unique_spawn(188001, 0, 0, 7, 211, -38.87, 43.59); ##The_Gloomingdeep_Jailor
  quest::signalwith(188000, 3); ##Arias
}

sub EVENT_TASK_STAGE_COMPLETE {
  if ($activity_id == 1) {
    quest::popup("Combat", "<br>You've found the Gloomingdeep Jailor!<br><br>First, <c \"#00F0F0\">left click</c> the jailor to target him. Then approach him and activate auto attack by pressing the <c \"#00F0F0\">Q</c> key or the 'Melee Attack' button in the <c \"#00A000\">Hot Button Window</c>.<br><br><c \"#F07F00\">Use auto attack to defeat the Gloomingdeep Jailor!</c>", 9);
    quest::signalwith(188000, 4); ##Arias
  }
  if ($activity_id == 2) {
    quest::popup("Looting the Key", "<br>You must acquire the Gloomingdeep Jailor's Key. Find the key displayed in the <c \"#00A000\">Advanced Loot Window</c> and click the green checkmark next to the key. This will place the key in your inventory.<br><br>Note that you can hover your cursor over the icons of the items in the <c \"#00A000\">Advanced Loot Window</c> to see their names.<br><br><c \"#F07F00\">Loot the key from the Gloomingdeep Jailor's corpse to continue.</c>", 10);
  }
  if ($activity_id == 3) {
    quest::popup("Giving Arias the Key", "<br>Arias needs the key to unlock the main gate.<br><br>To give an item to another character, open the <c \"#00A000\">Inventory Window</c>, by pressing the '<c \"#00F0F0\">I</c>' key. <c \"#00F0F0\">Left click</c> on an item to pick it up with your cursor. Then <c \"#00F0F0\">left click</c> on the recipient. The <c \"#00A000\">Give Window</c> will appear. Confirm the trade by clicking the 'Give' button.<br><br><c \"#F07F00\">Give the key to Arias.</c>", 11);
  }
}

sub EVENT_TASK_COMPLETE {
  quest::popup("Join the Gloomingdeep Slave Revolt", "<br><c \"#F0F000\">Congratulations, you've finished your first quest!</c><br><br>Arias will lead you deeper into the Gloomingdeep Mines where a slave rebellion is underway. The outnumbered slaves could surely use your help and you have much more to learn from them.<br><br><c \"#F0F000\">Note:</c><br>The <c \"#00F0F0\">EQ</c> button will be invaluable to you in your journeys. The dropdown menus accessed from the <c \"#00F0F0\">EQ</c> button provide a link to every interface window and many actions as well.<br><br><c \"#F07F00\">Click 'OK' and Arias will lead you to the Gloomingdeep slave revolt!", 12);
}
