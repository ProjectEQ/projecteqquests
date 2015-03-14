sub EVENT_ITEM {
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
}

sub EVENT_SPAWN {
	quest::settimer("hum",120);
}

sub EVENT_TIMER {
	my $random = int(rand(3));
	if($random == 0) {
		quest::emote("hums a soft tune as he picks at his lute.");
	}
	if($random == 1) {
		quest::emote("strums his lute, periodically adjusting the knobs at the end, obviously tuning the instrument.");
	}
	if($random == 2) {
		quest::emote("hums a catchy, rhythmic tune.");
	}
}