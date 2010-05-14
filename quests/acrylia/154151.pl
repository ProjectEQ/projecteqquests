# Khati Sha Event
# Succed
# Created by Gonner

my $counter;

sub EVENT_SPAWN {
	$counter = 0;
}

sub EVENT_DEATH {
	quest::signalwith(154130,4,10); #Spawn raid Version of Spiritual Arcanist Ends Event
}

sub EVENT_SIGNAL {
	if($signal == 9) {
	
		$counter += 1;
		
			if($counter == 5) {	

				quest::signalwith(154130,3,20); # Signals WDTrpMn that the event has succeded and to start next part.
			}
	}

	if($signal == 6) {
		quest::doanim(16);
	}

	if($signal == 7) {
		quest::depop();
    }
    
}

#END of FILE zone:acrylia ID:154151 -- A_Spiritual_Arcanist.pl
