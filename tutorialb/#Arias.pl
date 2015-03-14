#zone: tutorialb

sub EVENT_SAY {
  if ($text=~/hail/i && quest::istaskactivityactive(22,0)){
    quest::say("We found the other slaves! Not bad, my friend, not bad. No matter what happens in the mines, you should always be able to find your way back here.");
    quest::popup("The Find Command", "It's a big world out there. It helps to know where you are going.
	    <br><br><c \"#FFFF00\">The Find Command:</c><br>You can use the find command to locate other 
		imporant rebellion characters. <br><br><c \"#F07F00\">To open your find menu, press [CTRL+F] or press the Find button 
		on your hotbuttons bar.  Then click Absor's name under 'Weapons'.  A glowing pathway will appear 
		and lead you to that NPC.</c>");    	
	quest::updatetaskactivity(22,0); 
}
  elsif ($text=~/hail/i && quest::istaskactivityactive(22,6)){
    quest::say("Well done, my friend. Take this kobold skull charm. You are now ready to join ranks with the slaves and fight against the Gloomingdeep kobolds. Speak with Guard Rahtiz for your next assignment.");
    quest::updatetaskactivity(22,6); 
}
  elsif ($text=~/hail/i){
    quest::say("We found the other slaves! Not bad, my friend, not bad. No matter what happens in the mines, you should always be able to find your way back here.");
}
  if ($text=~/leave/i || $text=~/escape/i) {
    quest::say("Here I'll show you how to get out. Come and help us again!");
    quest::movepc(202,-55,44,-158.81);
 }
}