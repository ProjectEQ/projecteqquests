#Owlbear Leader in the East

sub EVENT_DEATH_COMPLETE 
  {
  # leader is down - send signal after timer.
    #quest::ze(15,"The owlbear leader is dead, putting the Owlbears in the east in a panic!");
  quest::signalwith(166257, 3, 0);
  }
