sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Where am I? Oh god no, please let this be a simple nightmare. Please don't hold my withering soul here any longer!  Who are you? Why have you freed me? Please tell me it is over!");
	}
	if($text=~/arcanum of rosh/i) {
		quest::say("I can never give up the Arcanum. It's bound to me, is a part of me now. It represents the sacrifice I made to me friends.  It be the only thing that brings me any sliver of happiness. Only if ye kin replace it with somethin' of sentiment to me will I hand over the book.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 1711 => 1)) { # Lock of Dwarven Hair
		quest::ding();
		quest::exp(1000);
		quest::summonitem(1712); # Arcanum of Roth
	}
	plugin::return_items(\%itemcount);
}

