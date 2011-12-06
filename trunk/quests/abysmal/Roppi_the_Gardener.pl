sub EVENT_SPAWN {
	quest::settimer("plant",150);
}

sub EVENT_WAYPOINT_ARRIVE {
	if(($wp == 1) || ($wp == 3) || ($wp == 5) || ($wp == 7) || ($wp == 9) || ($wp == 11) || ($wp == 13) || ($wp == 15) || ($wp == 17) || ($wp == 19)) {
		$npc->SetAppearance(4);
	}
	if($wp == 20) {
		quest::emote("appears to take great pride in his garden, painstakingly caring for each individual plant.  He carefully moves outside the garden and begins to mumble an inaudible phrase.");
	}
}

sub EVENT_TIMER {
	my $random = int(rand(5));
	if($random == 0) {
		quest::emote("looks around at his garden for a moment before standing up.  He mumbles a few words to himself, though you can barely understand him.");
	}
	if($random == 1) {
		quest::emote("looks up slowly at the figure standing amongst his plants.  'Would you mind not stepping on my plants, please?  They are very difficult to keep alive without your bumbling feet destroying their leaves.'");
	}
	if($random == 2) {
		quest::emote("looks around at his garden and sighs heavily, before rising to his feet.  'These vegetables might not make it,' he says, shaking his head.  'I've fertilized the roots quite a bit.  Hopefully, with a little water, these things should perk right up.'");
	}
	if($random == 3) {
		quest::emote("moves carefully about the gardent, checking the roots and leaves of various plants as he passes. 'These are some fine plants here, just a bit water and some. . .' he says, his voice trailing off to an inaudible mumble.");
	}
}