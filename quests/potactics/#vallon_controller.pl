my $phase = 0;

sub EVENT_SPAWN {
	$phase = 1;
	# spawn vallon up by the door
	quest::spawn2(214083,0,0,-822,1980,205,130.9);	# Real Vallon
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		# tell vallon which phase we are on
		quest::signalwith(214083,$phase);
	} elsif ($signal == 2){
		# vallon has depopped. 
		if ($phase == 1) {
			#set two hour fail timer now (first split).
			quest::settimer("vz_fail",7200);
		}
		#increment phase passed to vallon
		$phase += 1;
		#spawn vallon and his 4 clones.
		quest::spawn2(214110,0,0,-606,1980,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-666,1980,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-636,1950,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-636,2010,195.1,130.9);	# Fake Vallon
		quest::spawn2(214083,0,0,-636,1980,195.1,130.9);	# Real Vallon
	} elsif ($signal == 3) {
		#vallon dead, despawn with timer.
		quest::depop_withtimer();
	}
}

sub EVENT_TIMER { #took too long
	if ($timer eq "vz_fail") {
		#event failed depop all mobs
		quest::depopall(214083); # real vallon
		quest::depopall(214110); # fake vallons
		quest::depop_withtimer(); #myself with respawn timer.
	}
}