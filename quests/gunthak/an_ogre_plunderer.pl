# NPC: #a_troll_marauder (224131)
# Angelox

sub EVENT_COMBAT{
    quest::say("You may be more desperate than some of us, but you shall not win this!");
}

sub EVENT_DEATH_COMPLETE{
   quest::emote("corpse becomes one less mouth to feed.");
   # supposed to be ; "A puddle of blood grows about your feet."
 }

# EOF zone: Gunthak

