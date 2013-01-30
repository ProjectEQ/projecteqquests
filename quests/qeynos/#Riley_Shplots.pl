# #Riley Shplots in qeynos

sub EVENT_SAY {
	if($text =~ /Bloodsaber/i) {
		quest::say("Oh, no. I knew this would happen one day. Please don't hurt me! I had very little to do with this plague, though it is quite a nice one, you must admit. I was just a courier. I'll come quietly. I don't want any trouble. My small contribution to the glory of Bertoxxulous has already been given but I certainly don't want to go to meet him just yet!");
	}
}

sub EVENT_ITEM {
	if ($itemcount{2344} == 1) {
		quest::summonitem(2369);
		quest::settimer(1,60);
	}
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::depop_withtimer();
}