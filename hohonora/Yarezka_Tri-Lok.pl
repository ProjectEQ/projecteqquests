sub EVENT_SIGNAL {

quest::depop();

}

sub EVENT_DEATH_COMPLETE {

quest::signalwith(211087,2,1); # NPC: #Rhaliq_Trell_Trigger

}