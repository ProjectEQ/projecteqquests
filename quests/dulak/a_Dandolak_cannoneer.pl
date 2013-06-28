# NPC: a_Dandolak_cannoneer
#Angelox

sub EVENT_COMBAT{
    quest::say("Come to pilfer some supplies, have you? The crew of Dandolak's Run is not to be trifled with!");
}

sub EVENT_DEATH_COMPLETE{
  quest::say("My death should have come at sea!");
 }

# EOF zone: dulak