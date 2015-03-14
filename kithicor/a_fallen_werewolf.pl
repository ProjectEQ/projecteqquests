sub EVENT_SPAWN {
	quest::settimer(1,1);
}

sub EVENT_TIMER {
	if($timer == 1) {
		plugin::SetAnim("dead");
		quest::stoptimer(1);

	}
}

sub EVENT_CAST_ON {
	if($spell_id == 11658){
		quest::depop();
	}
}