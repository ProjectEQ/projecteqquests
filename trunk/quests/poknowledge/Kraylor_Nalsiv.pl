#Kraylor_Nalsiv.pl
#Code Support has been added. Perl script needs to be written.

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings $name! I've heard tell of powerful items unique to your profession. If you happen to come into possession of one [return] to me and tell me the tale behind it.");
	}
	else {
		quest::say("Hmmm, it doesn't look like you have any items I haven't seen before.");
	}
}

sub EVENT_ITEM {
	plugin::return_items(\%itemcount); #return items if not the ones required
}
#END of FILE Zone:poknowledge ID:202337 --Kraylor_Nalsiv.pl