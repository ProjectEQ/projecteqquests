sub EVENT_ITEM {
  quest::say("I do not want this.");
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  quest::say("What a glorious machine the cargo clockwork is!!");
  quest::signal(56105,1);
}

sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("Die, you vile beast!!");
	}
}