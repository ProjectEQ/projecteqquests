# Khati Sha Event
# Fail
# Created by Gonner


sub EVENT_SIGNAL {

	if($signal == 8) {
	
		$counter += 1;
		
			if($counter == 5) {	

				quest::signalwith(154130,4,20); # Signals WDTrpMn that the event has failed and to end the event.
			}
	}

	if($signal == 7) {
		quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::signalwith(154130,4,10); #Spawn raid Version of Spiritual Arcanist Ends Event
	}
	

#END of FILE zone:acrylia ID:154152 -- A_Spiritual_Arcanist.pl
