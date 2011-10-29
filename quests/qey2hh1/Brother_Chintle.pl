sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("Prime Healer!!  Guide me to victory!!");
	}
}

sub EVENT_DEATH {
	quest::say("Your name has been stricken from the book of the Prime Healer!!  I shall be avenged!");
}
