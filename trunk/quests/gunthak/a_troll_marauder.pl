# NPC: #a_troll_marauder (224131)
# Angelox

sub EVENT_COMBAT{
    quest::say("How foolish to pick a fight here. You will never leave this place alive");
}

sub EVENT_DEATH{
  quest::emote("corpse becomes one less mouth to feed.");
 }

# EOF zone: Gunthak