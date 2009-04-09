my $phase;	# undef = pre-split, 1 = split form, 2 = final form

sub EVENT_SPAWN {
	$phase = 0;
        quest::settimer("vallonzek",1);
	quest::setnexthpevent(75);
}

sub EVENT_TIMER {
if ($timer eq "vallonzek") {
if(defined $qglobals{vallonzek}) { 
  quest::stoptimer("vallonzek");
  quest::depop();
  $qglobals{vallonzek} = undef;
  } 
   }
    }

sub EVENT_SIGNAL {

	if ($signal == 1) {		# Split form
		$phase = 1;		
		quest::setnexthpevent(50);
	}
	
	if ($signal == 2) {		# Final form
		$phase = 2;
	}

	if ($signal == 6) { 
                quest::depop();	# times up, despawn
}
 }
sub EVENT_HP {
	if ($hpevent == 75 && $phase == undef) { # Time to split for the first time
			quest::signalwith(214112, 3, 0);	# tell trigger to spawn real in phase 1 along with 4 clones 
			quest::depop();
	}
	
	if ($hpevent == 50) {				# split again
		quest::signalwith(214112, 4, 0);	# tell the trigger this version is dead, respawn in either phase 1 with clones or phase 2 without
		quest::depop();
	}
}

# tell trigger to stop timer and reset counter
sub EVENT_DEATH {
        my $variance = int(rand(720));
        my $spawntime = 6480 + $variance;
        quest::setglobal("vallonzek",1,3,"M$spawntime");
	quest::signalwith(214112, 5, 0);
	quest::spawn2(202368,0,0,$x,$y,$z,$h);	
}

# End of File  Zone: PoTactics  ID: 214083 -- Vallon_Zek

