sub EVENT_AGGRO {
  quest::say("You have stuck yer nose where it don't belong fool, I'll show ya the error of yer ways!");
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(113556,28,0,1130.3,-933.2,-125.6,253.6); # NPC: #Vinric_Thunderclap
}
