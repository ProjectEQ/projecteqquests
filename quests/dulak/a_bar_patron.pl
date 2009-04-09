# NPC: a_tavern_wench
# Angelox

sub EVENT_COMBAT{
    quest::emote("scowls. 'I don't recall your kind being welcome here. Now get out!'");
}

sub EVENT_DEATH{
  quest::say("'s corpse coughs and sputters as he collapses.");
 }

# EOF zone: dulak