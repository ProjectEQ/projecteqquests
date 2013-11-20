#WAR BOSS

sub EVENT_DEATH_COMPLETE {

  # BOSS are down - send signal.
  quest::signalwith(166257, 5, 0);
    #quest::ze(15,"The Vah Shir have reclaimed Hollowshade!");
}
