#Griming Leader in the South

sub EVENT_DEATH_COMPLETE 
  {
  # leader is down - send signal after timer.
    #quest::ze(15,"The Grimling leader is dead, putting the Grimlings in the South in a panic!");
  quest::signalwith(166257, 4, 0);
  }

