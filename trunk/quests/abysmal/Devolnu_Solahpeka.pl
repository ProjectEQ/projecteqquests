sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail to you too.");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 14) {
		quest::settimer(1,130);
	}
	if($wp == 15) {
		quest::stoptimer(1);
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::emote("smiles crookedly at his companions.  'Sorry ta here that, friend.  I can't feel too sorry, though.  I had the world's largest tuna on my line today.  It musta been ten feet long!  I tried walkin' it to the dock, since there ain't no way my line could carry it up to the rail, but it bit through the line just as I was makin' my way down the stairs.'");
		quest::signalwith(279043,1,15000);
	}
	if($signal == 2) {
		quest::say("Bah.  You just don't know what yer doin'.  Have you ever caught a fish with no hook and no bait?  I have.  Did it last weekend.  I was at the water just relaxin' when this big tuna shows itself.  I look around and the only things nearby is some cast-off line and a pebble.  Well, I skillfully turned that line into a noose, with that pebble as an anchor.  It took a lot of careful work to get that fish into that noose and haul it up onto the deck, but I did it.  In this business you have to be smart if you want to be good.");
		quest::signalwith(279046,1,15000);
	}
	if($signal == 3) {
		quest::say("That's nothin'.  Why, just last week I had the misfortune of being bumped into the water by Rensik on his rounds.  The fellow didn't even notice and just kept on walkin'.  I went under pretty deep, considerin' the fall.  When I got my bearings I started up.  What was odd was the fact that the sun seemed to be directly overhead, but I knew it was nearly dusk.  When I got a few feet closer to the surface I realized that it wasn't the sun I was seeing, it was a jellyfish!  Before I had noticed I was surrounded by its poisonous tentacles!  I knew of only one way out.  I released all the air I had in my lungs, blew it right up under the thing.  As the bubbles went up, I went down.  I just barely managed to dive out from between the stingers and get up to the surface before I drowned.");
		quest::signalwith(279046,3,15000);
	}
	if(($signal == 4) && ($x == 249) && ($y == -222))  {
		quest::emote("leers at the waitress 'Anything you bring me will taste like heaven!  If I have to choose, I'll have a light beer.'");
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