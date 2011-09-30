sub EVENT_COMBAT {
 if($combat_state == 1){
 quest::emote("shrieks angrily as it lunges at you!");
 }
}

sub EVENT_DEATH {
	quest::emote("collapses to the ground in a lifeless heap.");
}
