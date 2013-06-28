# NPC: a_boat_engineer
#Angelox

sub EVENT_COMBAT{
    quest::say("Ya think yer tough?  Now you die");
}

sub EVENT_DEATH_COMPLETE{
  quest::say("Ungh! I have one last request; bury me at sea!");
 }

# EOF zone: dulak