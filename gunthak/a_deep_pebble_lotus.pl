# NPC:a_deep_rock_lotus
# Angelox

sub EVENT_COMBAT{
    quest::emote("snaps at you and attacks.");
}

sub EVENT_DEATH_COMPLETE{
   quest::emote("'s corpse wilts as it falls to one side.");
   # supposed to be ; "A puddle of blood grows about your feet."
 }

# EOF zone: Gunthak

