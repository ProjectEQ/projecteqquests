#npc - Gfaydark Guard Protectors
#zone - Gfaydark
#by Angelox

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("For the defense of Kelethin!!");
   }
}

sub EVENT_SIGNAL {
   quest::say("For the protection of all Fier'Dal, there shall be no mercy for your kind.");
}