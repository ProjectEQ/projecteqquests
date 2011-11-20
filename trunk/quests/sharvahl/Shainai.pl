sub EVENT_SPAWN {
	quest::disable_spawn2(32803);
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp==21) {
		quest::say("Yup yup, I definitely know the way from here.");
	}
	if($wp==36) {
		quest::say("Ahhh, home at last.");
		quest::signalwith(155041,1,10);
	}
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("Daddy I'm sleepy, could you come tuck me in ?");
		quest::signalwith(155340,1,10);
                $npc->SetAppearance(3);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 4478 => 1)) {
		quest::emote("settles comfortably in for restful afternoon nap, 'Thank you for walking me home, it was ever so nice of you.  Goodnight.'");
                quest::ding();
		quest::signalwith(155340,2,10);
		quest::depop();
	}
	else {
		quest::say("I have no need for this, $name.");
		plugin::return_items(\%itemcount);
	}
}
