# NPC: a_deck_hand
#Angelox

sub EVENT_COMBAT{
    quest::say("You rat, your body will be food for the sharks!");
}

sub EVENT_DEATH_COMPLETE{
  quest::emote("'s corpse says 'Survival relies on skill, it would seem my training is inferior");
 }

# EOF zone: dulak