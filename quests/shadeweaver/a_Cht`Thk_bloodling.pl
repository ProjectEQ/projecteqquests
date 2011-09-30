sub EVENT_COMBAT {
 if($combat_state == 1){
 quest::emote("chitters angrily at you!");
 }
}

sub EVENT_DEATH {
	quest::emote("splatters bug goop in every direction.");
}
