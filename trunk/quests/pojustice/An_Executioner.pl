sub EVENT_SPAWN {
	quest::settimer("begin_delay", 3)
}

sub EVENT_SIGNAL {
	if ($signal == 0) {
		#Stop the timers
		quest::stoptimer("begin_delay");
		quest::stoptimer("move_to_stand1");
		quest::stoptimer("move_to_stand2");
		quest::stoptimer("my_speech_say");
		quest::stoptimer("do_execution");
		#Spawn new executioner
		quest::spawn2(201439,0,0,232,-1048,74,180);
		#Depop this executioner
		quest::depop();
	}
	
	elsif ($signal == 1) {
		quest::stoptimer("begin_delay");
		quest::stoptimer("move_to_stand1");
		quest::stoptimer("move_to_stand2");
		quest::stoptimer("my_speech_say");
		quest::stoptimer("do_execution");
		quest::depop();
	}
}

sub EVENT_TIMER {
	if ($timer eq "begin_delay") {
		quest::stoptimer("begin_delay");
		quest::settimer("move_to_stand1", 4);
	}
	
	elsif($timer eq "move_to_stand1") {
		quest::stoptimer("move_to_stand1");
		quest::moveto(196, -1052, 73.1, -1, 1);
		quest::settimer("move_to_stand2", 8);
	}
	
	elsif($timer eq "move_to_stand2") {
		quest::stoptimer("move_to_stand2");
		quest::moveto(196, -1156, 80.1, -1, 1);
		quest::settimer("move_to_stand3", 13);
	}
	
	elsif($timer eq "move_to_stand3") {
		quest::stoptimer("move_to_stand3");
		quest::moveto(173.1, -1156, 80.1, -1, 1);
		quest::settimer("my_speech_say", 4);
	}
	
	elsif ($timer eq "my_speech_say") {
		quest::stoptimer("my_speech_say");
		quest::emote("intones, 'Do you have any final words before your sentence is carried out?'");
		quest::settimer("do_execution", 7);
	}
	
	elsif ($timer eq "do_execution") {
		quest::stoptimer("do_execution");
		#Signal prisoner death. (depop)
		quest::signalwith(201424,0,5);
		#Signal event over
		quest::signalwith(201425,2,5);
		quest::ze(15, "The prisoners cry is cut off as his body crumples to the ground. You have failed.");
	}
}