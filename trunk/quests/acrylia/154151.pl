# Khati Sha Event
# Succed
# Created by Gonner

sub EVENT_DEATH {
quest::signalwith(154130,3,20);
}


sub EVENT_SIGNAL {
	if($signal == 6) {
		quest::doanim(16);
	}

	if($signal == 7) {
		quest::depop();
    }
    
}

#END of FILE zone:acrylia ID:154151 -- A_Spiritual_Arcanist.pl

