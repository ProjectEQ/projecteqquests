sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello. Iawgom not interested in talking now.  You go.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 33) {
		quest::settimer(1,140);
	}
	if($wp == 34) {
		quest::stoptimer(1);
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::say("Hmmm.  I'm sure you left out the interesting part of that story.  Maybe next time you'll remember it.  You'd never forget what you saw if you were with me a few months ago.  I was in Lake Rathe on vacation, just tryin' to relax.  I had been having a reasonable day and had caught more than I needed for lunch and dinner.  I was making my last cast for the day.  I pulled the line back and tossed it far.  Just before it hit the water, a huge dark form swept down and grabbed it!  It was a bird!  The thing must have been twenty feet from wingtip to wingtip.  I stood and watched, absently clutching my pole.  Suddenly I'm yanked up into the air!  In a few seconds I was so far from the ground that the lake was the size of a mug of ale!  It was a lucky thing that I was usin' my special heavy-duty line that day.  I had to get down and there was only one way to do it.  I started lettin' out my line.  It took all my strength, but I finally got low enough to drop into the lake.  It was a long swim back, but I survived.");
		quest::signalwith(279044,1,15000);
	}
}

sub EVENT_TIMER {
	my $random = int(rand(5));
	if($random == 0) {
		quest::emote("attaches some bait to his hook and casts his line into the water.");
	}
	if($random == 1) {
		quest::emote("removes the hook from his line and attaches a very ornate-looking fly in its place.");
	}
	if($random == 2) {
		quest::emote("reels in his line and casts again.");
	}
	if($random == 3) {
		quest::emote("rummages through his box of tackle, looking for his favorite lure.");
	}
	if($random == 4) {
		quest::emote("lets out a sigh of frustration as he casts his line out into the dark waters below.");
	}	
}