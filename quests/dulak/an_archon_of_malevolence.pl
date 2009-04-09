# NPC: an_emissary_of_suffering
#Angelox

sub EVENT_COMBAT{
    quest::say("Your existence offends me, as well as my god!");
}

sub EVENT_DEATH{
  quest::emote("'s corpse says 'Hate will prevail!");
 }

# EOF zone: dulak