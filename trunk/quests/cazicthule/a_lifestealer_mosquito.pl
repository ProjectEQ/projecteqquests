sub EVENT_AGGRO {
	my $random = int(rand(2));
	if($random == 0) {
		quest::emote("hovers for a moment and attacks!");
	}
	if($random == 1) {
		quest::emote("buzzes towards you with horrific speed!");
	}
}

sub EVENT_DEATH {
	my $ran = int(rand(2));
	if($ran == 0) {
		quest::emote("explodes into a fine mist of blood and plasma");
	}
	if($ran == 1) {
		quest::emote("hits the ground and begins to form a large pool of blood.");
	}
}