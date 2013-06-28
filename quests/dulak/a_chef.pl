# NPC: a_chef
#Angelox

sub EVENT_COMBAT{
    quest::say("Your tongue may be just the thing to thicken up this soup. C'mere!");
}

sub EVENT_DEATH_COMPLETE{
  quest::emote("'s corpse hits the floor as a rat scurries and sniffs it briefly.");
  #Sould be "A rat scurries and sniffs the newly fallen corpse briefly."
 }

# EOF zone: dulak