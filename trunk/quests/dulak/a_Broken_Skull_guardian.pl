# NPC: a_Broken_Skull_guardian
#Angelox

sub EVENT_COMBAT{
    quest::say("The likes of you offer no threat to the might of Broken Skull!");
}

sub EVENT_DEATH{
  quest::say("Guards! Get this one!");
 }

# whan pc dies, he says "What a shame, that one died so quickly"
# EOF zone: dulak