sub EVENT_COMBAT {
 if($combat_state == 1){
 quest::say("Mind your business!!");
 }
}

sub EVENT_DEATH {
	quest::say("What did I ever do to you?");
}
