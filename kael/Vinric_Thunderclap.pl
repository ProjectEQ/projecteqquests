sub EVENT_AGGRO {
  quest::say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(113528,28,0,1130.3,-933.2,-125.6,253.2); # NPC: Valorankt_Zekkin
}
