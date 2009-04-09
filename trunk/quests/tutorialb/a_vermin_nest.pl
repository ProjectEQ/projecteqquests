# NPC: Tutorial vermin nests

sub EVENT_DEATH{
   if(quest::istaskactivityactive(17,2)) {
        quest::updatetaskactivity(17, 2);
   }
 }

# EOF zone: Tutorialb 