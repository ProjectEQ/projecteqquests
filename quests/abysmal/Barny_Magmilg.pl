sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hello.  I just caught a huge tuna fish!  Have you ever tried tuna?  It is very good.  I give all the tuna I catch to Chef Chowderly.  He is the world's best tuna chef.  You should go talk to him!");
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 13) {
		quest::settimer(1,150);
	}
	if($wp == 14) {
		quest::stoptimer(1);
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::say("That's the best you can do?  Have you ever seen one o' those giant turtles they have on Taelosia?  Last week one of them paddled out to the dock and scared off all my fish!  I had no choice but to get rid of it.  I carefully jumped onto its back.  I had to be careful, that thing is full of dagger-length spikes!  Once on, I rode that thing for hours until it got worn out and started back to the beach.  I suppose I coulda killed it and brought it back, but I was a might tired, and decided that it would be too heavy to try to get onto the boat and let it go.  Besides, it mighta been a momma turtle.");
		quest::signalwith(279047,1,15000);
	}
	if($signal == 2) {
		quest::say("That's unfortunate, lad.  My day wasn't so great either.  I got a bite an' gave it a pull.  Hooked it good.  I wasn't expecting whatever I caught to pull so hard!  Had the strength of twenty men!  Pulled me right over the rail, it did!  I had ta swim for my life!  Whatever it was, it didn't catch me before I got to the dock and back aboard.");
		quest::signalwith(279044,2,15000);
	}
	if($signal == 3) {
		quest::emote("scoffs 'I expected better from you.  I'm not saying that what you just said is less than the truth, but only because I know there are more amazing things in the world.  Have you ever been ice fishing?  I didn't think so.  I have, but only once.  I was traveling alone in the northlands with my favorite dog, my best rod and an axe.  I settled in, cut the hole I needed, and started writin' limericks in my head to pass the time.  It was so cold that I had to keep clearin' the hole every ten minutes!  It wasn't but an hour later when I felt a bite and gave the line a tug.  The line tugged back so hard that I slipped on the ice and went right into the hole!  Whatever had me pulled me straight down.'");
		quest::say("Now, I wasn't about to let go.  I never give up.  So I started reelin' in the line.  It was getting' darker, so I was only a few feet behind the fish when I could see that it was a twenty-foot swordfish!  It was swimming hard for the bottom for a few minutes when it suddenly stopped.  I could see below it that there was something glowin' down there.  They looked like lights in the windows of Freeport when you come home off the sea in a heavy fog.  I could swear that I even saw people walkin' in the streets down there, ghostly lookin' folk.  Well, the fish was scared an' turned to swim away.  So I grabbed it by the gills and pulled with all my might.  I got one hand on either side of it, both holdin' on to its gills, and I rode that monster straight up to the surface.  There was no hole left!  Well, I had to break off that fish's nose with my bare hands to cut my way out.  I sorta felt sorry for that fish, havin' ta deal with the other swordfish without his sword from that day on.");
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