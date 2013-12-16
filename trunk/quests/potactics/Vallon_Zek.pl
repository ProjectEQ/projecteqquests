sub EVENT_SPAWN {
	# one second delay so everything processes
	quest::settimer("vzspawned",1);
}

sub EVENT_TIMER {
	if ($timer eq "vzspawned") {
		# tell vallon_controller i spawned
		quest::stoptimer("vzspawned");
		quest::signalwith(214112,1);
	}
}

sub EVENT_SIGNAL {
	#signal value equals which phase we are on
	if ($signal == 1) {
		#phase 1, depop at 75%
		quest::setnexthpevent(76);
	} elsif ($signal == 2 || $signal == 3) {
		#phase 2 and 3, depop at 50%
		quest::setnexthpevent(51);
	}
}

sub EVENT_HP {
	# tell vallon_controller i have depopped.
	quest::signalwith(214112,2);
	quest::depop();
}

sub EVENT_DEATH_COMPLETE {
	# spawn the planar projection on my corpse
	quest::spawn2(202368,0,0,$x,$y,$z,$h);
	# tell vallon_controller I have died
	quest::signalwith(214112,3);
}