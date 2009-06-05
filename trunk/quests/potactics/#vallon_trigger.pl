# TRIGGER: 
#	signal 1 to Vallon - enter phase 1
#	signal 2 to vallon - enter phase 2
#	signal 3 from vallon - pre-split version finished
#	signal 4 from vallon - a split verson is finished, add to counter, respawn appropriately
#	signal 5 from vallon - final version dead, end timer
#	signal 6 to vallen/clones - despawn
# 	blank signal out - despawn specified mob

my $vallon_counter;

sub EVENT_SPAWN {
	$vallon_counter = 0;
}

sub EVENT_SIGNAL {
	
	if ($signal == 3) {
		
		$vallon_counter += 1;			# split once
		quest::settimer("engage", 7200);	# 2 hours to finish event

		quest::spawn2(214110,0,0,-606,1999,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-666,1999,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-636,1969,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-636,2029,195.1,130.9);	# Fake Vallon
		quest::spawn2(214083,0,0,-636,1999,195.1,130.9);	# Real Vallon

		quest::signalwith(214083,1,0);				# Vallon enter phase 1
	}

	if ($signal == 4) {

		$vallon_counter += 1;
					
		quest::spawn2(214110,0,0,-606,1999,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-666,1999,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-636,1969,195.1,130.9);	# Fake Vallon
		quest::spawn2(214110,0,0,-636,2029,195.1,130.9);	# Fake Vallon
		quest::spawn2(214083,0,0,-636,1999,195.1,130.9);	# Real Vallon
                if ($vallon_counter == 3) {
			quest::signalwith(214083,2,0);			# enter phase 2	
                } else {
		        quest::signalwith(214083,1,0);			# Vallon stay in phase 1
		}
	}

	if ($signal == 5) {
		quest::stoptimer("engage");
		$vallon_counter = 0;
	}
}

sub EVENT_TIMER {

	if ($timer eq "engage") {
		quest::stoptimer("engage");
		quest::signalwith(214083,6,0);	# tell real Vallon to despawn
		quest::signalwith(214110,6,0);  # tell fake Vallons to despawn
		$vallon_counter = 0;
	}      
}

# End of File  Zone: PoTactics ID: 214112 -- #vallon_trigger
		
