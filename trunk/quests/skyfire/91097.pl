sub EVENT_SPAWN {
   quest::shout("You have awakened something which you should not have, fool!");
   quest::settimer(2,3600);
   }

sub EVENT_DEATH_COMPLETE {
   quest::setglobal(dragon_not_ready,1,3,"H72");
   }

sub EVENT_TIMER {
   if($timer == 2) {
     quest::stoptimer(2);
     quest::setglobal(dragon_not_ready,1,3,"H1");
     quest::depop();
     }
}