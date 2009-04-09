#npc - Butcher Guard Protectors
#zone - Butcher
#by Angelox

sub EVENT_COMBAT {
    if($combat_state == 1) {
    quest::say("For the glory of Kaladim!!");
    quest::say("You are no more");
 }
}