# #Willie Garrote in qeynos

sub EVENT_SAY {
 if($text =~ /Bloodsabers/i) {
	quest::say("A Bloodsaber? Of course I'm not, don't be ridiculous!");
 }
}

sub EVENT_ITEM {
	if ($itemcount{2344} == 1) {
		quest::summonitem(2394);
		quest::settimer(1,60);
	}
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::depop();
}