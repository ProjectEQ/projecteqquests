sub EVENT_SPAWN {
     quest::signalwith(278005,80,0); # NPC: #Culthor_the_Gatekeeper
}

sub EVENT_DEATH_COMPLETE {
     quest::signalwith(278005,81,0); # NPC: #Culthor_the_Gatekeeper
}