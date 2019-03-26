sub EVENT_DEATH_COMPLETE {
quest::signalwith(211087,1); # NPC: #Rhaliq_Trell_Trigger
}

sub EVENT_SIGNAL {
quest::depop();
}