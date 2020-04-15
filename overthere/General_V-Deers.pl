sub EVENT_SIGNAL {
	if($signal==1) {
		quest::depop_withtimer();
	}
	if($signal==2) {
		quest::moveto(2717,2500,-49,130,1);
		quest::settimer("getset",525);
	}
}

sub EVENT_TIMER {
	quest::stoptimer("getset");
	quest::say("Dragoons!!  Attention!!  Right face!!");
	quest::start(277);
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp==1) {
		quest::say("Forward.. march!!  Your left.. Your.. left, right, march!  Eighty.. second.. dragoon soldier!!  Pick up your weapon and follow me!!");
		quest::signalwith(93186,3); # NPC: #High_Priest_I`Xar
		quest::signalwith(93124,3); # NPC: Dragoon_Barber_W`Selo
		quest::signalwith(93088,3); # NPC: Dragoon_T`Vem
		quest::signalwith(93084,3); # NPC: Dragoon_T`Vex
		quest::signalwith(93125,3); # NPC: Dragoon_V`Lask
		quest::signalwith(93086,3); # NPC: Dragoon_V`Resh
	}
}

