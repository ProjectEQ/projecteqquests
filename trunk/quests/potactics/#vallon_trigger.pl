# TRIGGER: 
#	signal 1 to Vallon - enter phase 1
#	signal 2 to vallon - enter phase 2
#	signal 3 from vallon - pre-split version finished
#	signal 4 from vallon - a split verson is finished, add to counter, respawn appropriately
#	signal 5 from vallon - final version dead, end timer
#	signal 6 to vallen/clones - despawn
#       signal in 214056 - Decorin Berik dead, start/check timers
#       signal in 214057 - Decorin Grunhork dead, start/check timers
# 	signal in 214111 - event Vallon is dead, start timer/check timer
#	signal in 214108 - event Tallon is dead, start timer/check timer
#	signal in 214052 - mini rallos dead, check timer/spawn rallos
# 	blank signal out - despawn specified mob

my $vallon_counter;

my $Berik;
my $Grunhork;
my $event_vallon;
my $event_tallon;

sub EVENT_SPAWN {
	$vallon_counter = 0;

        $Berik = 0;
        $Grunhork = 0;
	$event_vallon = 0;
	$event_tallon = 0;
}

sub EVENT_SIGNAL {

# --------------------------- Vallon Script -------------------------------
	
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

# -------------------------------------- Rallos Event Begins here -------------------------------
        # Edit: Added a global flag check to make sure the event will only start if its been >=3 days since rallos died
        if ($signal == 214056 && !defined $qglobals{pop_pop_rallos_respawn_flag}) {        # Decorin Berik dead
                $Berik = 1;
              
                if ($Grunhork == 1) {   # Spawn Vallon and Tallon
                    quest::stoptimer("Decorin");
                    quest::settimer("VTZek", 1800); # 30min to kill the Zek brothers
                    quest::spawn2(214111,188,0,996,580,133.1,192.5);
                    quest::spawn2(214108,187,0,996,-559,133.1,192.5);

                    $Berik = 0;
                    $Grunhork = 0;
                } else {
                    quest::settimer("Decorin", 360); # 6min to kill other
                }
         }

        if ($signal == 214057) {        # Decorin Grunhork dead
                $Grunhork = 1;

                if ($Berik == 1) {   # Spawn Vallon and Tallon
                    quest::stoptimer("Decorin");
                    quest::settimer("VTZek", 1800); # 30min to kill the Zek brothers
                    quest::spawn2(214111,188,0,996,580,133.1,192.5);
                    quest::spawn2(214108,187,0,996,-559,133.1,192.5);

                    $Berik = 0;
                    $Grunhork = 0;
                } else {
                    quest::settimer("Decorin", 360); # 6min to kill other
                }
         }

	if ($signal == 214111) {	# Event Vallon Dead
		$event_vallon = 1;

		if ($event_tallon == 1) {	# check if Event Tallon is dead
			quest::stoptimer("VTZek");
			quest::signal(214052,0);	# tell fake Rallos to spawn Mini Rallos
                        quest::settimer("Mini", 1800); # 30min to "kill" mini Rallos
			$event_vallon = 0;
			$event_tallon = 0;
		} 
	}
	
	if ($signal == 214108) {	# event Tallon dead
		$event_tallon = 1;
		if ($event_vallon == 1) { # check if event Vallon is dead
			quest::stoptimer("VTZek");
			quest::signal(214052,0);	# tell fake Rallos to spawn Mini Rallos
                        quest::settimer("Mini", 1800); # 30min to "kill" mini Rallos
			$event_vallon = 0;
			$event_tallon = 0;
		} 			
	}

	if ($signal == 214052) {	# Mini Rallos done
		quest::stoptimer("Mini");
		quest::spawn2(214113,0,0,550,24,-294.9,64.2);
		}

}

sub EVENT_TIMER {

# --------------------------------- Vallon Script ---------------------------------

	if ($timer eq "engage") {
		quest::stoptimer("engage");
		quest::signalwith(214083,6,0);	# tell real Vallon to despawn
		quest::signalwith(214110,6,0);  # tell fake Vallons to despawn
		$vallon_counter = 0;
	}

# ------------------------------- Rallos Event Begins here ---------------------------
 
        if ($timer eq "Decorin") { # times up to kill Decorins
                quest::stoptimer("Decorin");
                quest::signal(214056, 0);
                quest::signal(214057, 0);
                $Berik = 0;
                $Grunhork = 0;
        }

	if ($timer eq "VTZek") {	# times up, despawn Zeks
		quest::stoptimer("VTZek");
                quest::signal(214111);
                quest::signal(214108);
		$event_vallon = 0;
		$event_tallon = 0;
	}

	if ($timer eq "Mini") {		# times up, despawn mini rallos
		quest::stoptimer("Mini");
		quest::signal(214109);
	}

      
}

# End of File  Zone: PoTactics ID: 214112 -- #vallon_trigger
		
