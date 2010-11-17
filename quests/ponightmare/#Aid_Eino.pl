sub EVENT_SPAWN {
  quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}

sub EVENT_PROXIMITY_SAY {
  if (($zonehour > 19 || $zonehour < 6) && ($text=~/quellious be my guide/i) && defined($qglobals{EinoTrigger}) && ($qglobals{EinoTrigger} == 1)) {
    quest::unique_spawn(204071,0,0,1685,-515,215,155);
    quest::depop();
  }
}