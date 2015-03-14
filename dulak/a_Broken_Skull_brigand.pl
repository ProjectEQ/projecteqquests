# NPC: a_Broken_Skull_brigand
#Angelox

sub EVENT_COMBAT{
    quest::say("Such fine white teeth, I believe they will make a nice necklace.");
}

sub EVENT_DEATH_COMPLETE{
  quest::emote("'s corpse groans and lies still.");
 }

# when pc dies, he says "What a shame, that one died so quickly"
# EOF zone: dulak