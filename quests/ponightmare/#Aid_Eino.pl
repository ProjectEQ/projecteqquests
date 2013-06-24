sub EVENT_SPAWN {
  quest::set_proximity($x-25,$x+25,$y-25,$y+25);
}

quest::enable_proximity_say();
sub EVENT_PROXIMITY_SAY {
  if (($zonehour > 19 || $zonehour < 6) && ($text=~/quellious be my guide/i) && defined($qglobals{EinoTrigger}) && ($qglobals{EinoTrigger} == 1)) {
    quest::unique_spawn(204071,0,0,1685,-515,215,155);
    quest::depop_withtimer();
  }
}