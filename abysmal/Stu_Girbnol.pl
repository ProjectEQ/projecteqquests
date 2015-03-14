sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I wonder what kind of strange fish we can catch in these new waters?");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 1) {
		quest::emote("looks sheepish and says quietly, 'It's almost too embarrassin' to admit, but on my way off the rail to sell my catch, I tripped over some stray rigging and fell on my face.  My whole day's catch slid right off the deck.  You boys are buyin' drinks for me tonight.'");
		quest::signalwith(279046,2,15000);
	}
	if($wp == 14) {
		quest::settimer(1,120);
	}
	if($wp == 15) {
		quest::stoptimer(1);
	}	
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::say("That's unfortunate, lad.  My day wasn't so great either.  I got a bite an' gave it a pull.  Hooked it good.  I wasn't expecting whatever I caught to pull so hard!  Had the strength of twenty men!  Pulled me right over the rail, it did!  I had ta swim for my life!  Whatever it was, it didn't catch me before I got to the dock and back aboard.");
		quest::signalwith(279045,2,15000);
	}
	if(($signal == 2) && ($x == 249) && ($y == -202)) {
		quest::say("I'll have a malt and hurry it up!  I haven't got all day.");
	}
	if($signal == 5) {
		quest::depop_withtimer();
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