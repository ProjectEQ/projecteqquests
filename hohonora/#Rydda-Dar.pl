sub EVENT_SPAWN {
	quest::settimer(2,7200);
}

sub EVENT_TIMER {
	if($timer == 2) {
		quest::updatespawntimer(44017,86400000); #trydan Faye 24h on fail
		quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(218068,0,0,$x,$y,$z,$h);
	quest::emote("'s corpse groans in agony...");
	quest::updatespawntimer(44017,259200000); #trydan Faye 3 days on win
}