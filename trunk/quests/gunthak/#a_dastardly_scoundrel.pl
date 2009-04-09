# NPC: #a_dastardly_scoundrel (224218)
# Angelox

sub EVENT_COMBAT{
    quest::say("I always enjoy getting a good kill in before breakfast.");
}

sub EVENT_DEATH{
  quest::emote("clutches at you one last time, then grows cold.");
 }

# EOF zone: Gunthak