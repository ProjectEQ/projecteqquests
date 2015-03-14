# NPC: a_tavern_wench
# Angelox

sub EVENT_COMBAT{
    quest::say("You fool. I'll feed your body to the sharks and watch the show.");
}

sub EVENT_DEATH_COMPLETE{
  quest::emote("'s corpse curses and falls.");
 }

# EOF zone: dulak