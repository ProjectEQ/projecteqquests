#zone: tutorialb

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(1448, 1)) {
      quest::say("We found the other slaves!  Not bad, my friend, not bad.  No matter what happens in the mines, you should always be able to find your way back here.  If you seek allies in other instances of these mines, I can send you there if you [" . quest::saylink("wish") . "].");
      quest::popup("The Find Command", "<br>It's a big world out there.  It helps to know where you are going.<br><br><c \"#F0F000\">The Find Command:</c><br>You can use the Find command to locate other important rebellion characters.  To open your find menu, press [<c \"#00F0F0\">CTRL + F</c>] or press the <c \"#00F0F0\">Find</c> button on your hotbuttons bar.  Then click on Absor's Name under 'Weapons'.  A glowing pathway will appear and lead you to that NPC.<br><br><c \"#F07F00\">Press 'OK' to continue.</c>");
      quest::updatetaskactivity(1448, 1);
    }
    elsif (quest::istaskactivityactive(1448, 8)) {
      quest::say("Well done, my friend.  Take this kobold skull charm.  You are now ready to join ranks with the slaves and fight against the Gloomingdeep kobolds.  Speak with Guard Rahtiz for your next assigment."); # [sic] assignment is misspelled on Live
      quest::updatetaskactivity(1448, 8); 
      quest::summonitem(59943); #Kobold Skull Charm
      quest::popup("Adventure Awaits", "<br>Arias has given you a Kobold Skull Charm, a powerful item that will protect you in combat and enhance your abilities.<br><br>To equip the item, open your inventory ( <c \"#00F0F0\">i</c> ) and drop the skull on top of the rectangular icon in the middle of the window.<br><br><c \"#F0F000\">Inspecting Items:</c><br>To inspect an item and see what benefits it offers, <c \"#00F0F0\">right click and hold</c> over the icon in your <c \"#00A000\">Inventory window</c>.<br><br> <c \"#F07F00\">Congratulations, you are now finished with your Basic Training.  Hail Guard Rahtiz if you have not done so already.</c>");
    }
    elsif (quest::istaskactivityactive(3785, 15)) { #Task: The Revolt of Gloomingdeep
      quest::say("You have done a great deed today, $name! Now that the Overlord is dead, and the kobolds in disarray, the rebellion is free from tyranny. I have more work to do here, guiding the freed slaves, but you may leave this place through the passageway at the back of this cavern. I wish you fortune in all your future deeds, $name. We will not forget what you have done here!");
      quest::popup("Escape to Norrath", "<br>The slaves have dug an escape tunnel that will lead you out of the Mines of Gloomingdeep.<br><br><c \"#F07F00\">Are you ready to Escape to Norrath?</c>");
    }
    else {
      quest::say("We found the other slaves!  Not bad, my friend, not bad.  No matter what happens in the mines, you should always be able to find your way back here.  If you seek allies in other instances of these mines, I can send you there if you [" . quest::saylink("wish") . "].");
    }
  }
  if ($text=~/wish/i) {
    $client->Message(4, "Type \"/pick\" to see a list of all the available pick zones of the Mines of Gloomingdeep. More pick zones will become available automatically as they fill up with adventurers.");
    quest::say("I understand. Hopefully you can find what, or whom, you seek.");
  }
  if ($text=~/leave/i || $text=~/escape/i) {
    quest::say("Here I'll show you how to get out. Come and help us again!");
    quest::movepc(202,-55,44,-158.81); # Zone: poknowledge
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}