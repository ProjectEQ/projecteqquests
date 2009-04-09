sub EVENT_DEATH 
            {
            quest::signal(201078);
            quest::signal(201427);
            quest::signal(201429);
            quest::signal(201430);
            quest::signal(201428);
            quest::signal(201431);
            quest::signal(201432);
            quest::signalwith(201076,33,1);
            quest::signal(201078,1);
            quest::stoptimer(2);
            quest::depop;
            } 

sub EVENT_SPAWN
      {
      quest::settimer(2,30);
      }

sub EVENT_TIMER {

      if($timer == 2)
             {
            quest::depop;
            quest::stoptimer(1);
            quest::stoptimer(2);
            quest::signal(201427);
            quest::signal(201429);
            quest::signal(201430);
            quest::signal(201428);
            quest::signal(201431);
            quest::signal(201432);
            quest::signalwith(201076,33,1);
            quest::signal(201078,1);
            }
      }

sub EVENT_SIGNAL {

   quest::depop;
} 
