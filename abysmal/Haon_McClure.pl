sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello to you.  I hope your day is going well.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 1) {
		quest::say("Enough chatter, I'm hungry!  I didn't get to eat my lunch.  I set it down like I always do, right under the netting they toss about each morning.  I went and stuck my hand in there at noon for my food and out jumps a rat!  Darn thing ate my lunch an' nearly scared me outta my pants.");
		quest::signalwith(279045,1,15000);
	}
	if($wp == 13) {
		quest::settimer(1,140);
	}
	if($wp == 14) {
		quest::stoptimer(1);
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::say("Now that was an interesting story.  It might make me question your hold on reality, my friend.  I know that stranger things have happened.  Ten years ago I had been shipwrecked.  I was the only survivor, tossed ashore on a deserted island.  It was easy enough to survive with my skills.  That is, until the day that I saw what appeared to be a giant tortoise coming toward the shore.  As it came closer it started to rise out of the water.  Soon it was obvious that it was not a tortoise at all, but the head of a cyclops!  The island was small and I had no place to hide.");
		quest::say("I could only wait on the shore.  It waded up to me, washing me with wave after wave of water that rushed before it.  It raised its massive fist to crush me and, I supposed, eat what was left.  Out of frustration I simply yelled, 'STOP!'  And it did!  It stopped and stood there, looking down at me.  I learned from him later that nobody had ever talked to him before.  He said that people generally just attacked him or ran off screaming.  The only thing he could do in either case was to crush them and eat what was left.  We became fast friends, and he carried me from the island another, inhabited, island.  Unfortunately his arrival caused the locals to run around screaming and to try to attack him . . .");
	}
	if($signal == 2) {
		quest::emote("looks up from his drink and gives a sharp laugh.  'You aught to take lessons from me, those things don't happen if you know what you're doin'.  Take last Tuesday, for instance.  I caught me a fish without usin' bait or a hook!  That's right, I was out of bait and there was a gigantic tuna swimmin' near the surface.  I just stuck my hand in the water and wiggled my pointin' finger just like it was a worm.  Sure enough, that tuna practically swallowed my whole hand.  It took a few minutes to get the thing off me and into the basket, but it was worth the pain!'");
		quest::signalwith(279045,3,15000);
	}
	if(($signal == 3) && ($x == 243) && ($y == -213)) {
		quest::emote("shakes his head. 'I've tasted yer light beer, can't stand it.  Bring me a dark. At least that stuff won't make me ill.'");
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