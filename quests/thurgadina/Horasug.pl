sub EVENT_WAYPOINT_ARRIVE {
	if($wp==1) {
		quest::say("My beloved brethren! Hear me now, I have seen a sacred vision...");
		quest::signalwith(115011,1);
		quest::signalwith(115187,1);
	}
	if($wp==2) {
		quest::say("Uh oh");
		quest::SetRunning(1);
		quest::signalwith(115011,2);
		quest::signalwith(115187,2);
		quest::signalwith(115010,3);
		quest::signalwith(115012,2);
		quest::signalwith(115188,2);
	}
	if($wp==19) {
		quest::SetRunning(0);
		quest::say("Whew, that was a close one!");
		quest::signalwith(115142,1);
	}
	if($wp==42) {
		$npc->SetAppearance(1);
	}
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("In my vision, Brell himself spoke to me! He indicated that the path to true enlightenment could only be found through sobriety. Substances such as alcohol only serve to cloud the mind and keep us from our true destiny!");
		quest::signalwith(115010,1);
		quest::signalwith(115014,1);
	}
	if($signal==2) {
		quest::say("Mock me if you will brothers, I am off to seek audience with the Dain where I will convince him of the evils of liquor. I am sure he will have our taverns serving only water and juice by day's end.");
		quest::signalwith(115010,2);
		quest::signalwith(115012,1);
		quest::signalwith(115188,1);
	}
	if($signal==3) {
		quest::say("I had a sacred vision from Brell himself!");
		quest::signalwith(115142,2);
	}
	if($signal==4) {
		quest::emote("thinks for a moment, looking at the roomful of rugged patrons,");
		quest::signalwith(115142,3);
	}
	if($signal==5) {
		quest::say("Heh, I saw meself here at Doogie's Drinks partaking of the finest Coldain ale in the land, of course!");
		quest::signalwith(115142,4);
	}
}