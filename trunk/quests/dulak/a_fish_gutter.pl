# NPC: a_fisherman
#Angelox

sub EVENT_COMBAT{
    quest::say("Gutting a fish is one thing, but gutting an adventurer is real sport");
}

sub EVENT_DEATH_COMPLETE{
  quest::say("No! The end comes too soon");
 }

# EOF zone: dulak