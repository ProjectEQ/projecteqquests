sub EVENT_SIGNAL
   {
   quest::depop;
   }

sub EVENT_SPAWN
   {
   quest::settimer(22,180);
   }

sub EVENT_DEATH
   {
   quest::signal(201076);
   quest::signal(201424);
   quest::stoptimer(22);
   }

sub EVENT_TIMER
   {
   if($timer == 22)
      {
      quest::depop;
      quest::stoptimer(22);
      }
} 