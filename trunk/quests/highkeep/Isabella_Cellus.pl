sub EVENT_COMBAT {
     if($combat_state == 1) {
		quest::say("Guards! Guards! Help me!!");
 }
}


sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 8) {
		quest::say("Would you please leave me alone?!");
	}
	if ($wp == 9) {
		quest::say("I need to get out of here.");
	}
	if ($wp == 12) {
		quest::say("Would you please stop following me!!");
	}
	if ($wp == 16) {
		quest::say("I just adore this place.");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. How nice to meet you. $name!"); }
}
#END of FILE Zone:highkeep  ID:6082 -- Isabella_Cellus 

