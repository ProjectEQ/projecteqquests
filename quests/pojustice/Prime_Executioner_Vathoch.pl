sub EVENT_SPAWN
   {
   quest::settimer(22,600);
   }

sub EVENT_DEATH
   {
   quest::stoptimer(22);
   quest::signalwith(201073,33,1);
   }

sub EVENT_TIMER
   {
   if($timer == 22)
      {
      quest::depop;
      quest::stoptimer(22);
      quest::signalwith(201073,33,1);
      }
} 

sub EVENT_SIGNAL {

quest::depop;

}