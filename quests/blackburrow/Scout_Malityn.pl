sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("In the name of the Rainkeeper, I strike at thee!!");
	}
}

sub EVENT_DEATH {
	quest::say("You will meet your own doom soon enough, my friend.. my influence with the Knights of Thunder is great, and they will not rest until I am avenged!");
}