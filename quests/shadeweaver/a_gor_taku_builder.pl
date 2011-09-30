sub EVENT_COMBAT {
 if($combat_state == 1){
 quest::say("I maku da mlech! Yoo DIE!");
 }
}

sub EVENT_DEATH {
	quest::emote("falls motionless to the floor.");
}
