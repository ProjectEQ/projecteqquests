# NPC: a_trench_master
# Angelox

sub EVENT_COMBAT{
    quest::say("Your bones will crush beneath my feet");
}

sub EVENT_DEATH_COMPLETE{
  quest::emote("'s corpse blinks unbelievingly");
 }

# EOF zone: nadox