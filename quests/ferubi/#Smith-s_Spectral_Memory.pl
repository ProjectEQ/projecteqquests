sub EVENT_SPAWN  {
  quest::settimer(1,600);
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    if(defined($qglobals{bic}) && ($qglobals{bic} == 10)) {
      quest::summonitem(67526);
      quest::setglobal("bic", 11, 5, "F");
    }
    quest::setglobal("god_vxed_access", 1, 5, "F");
    $client->Message(4,"You receive a character flag!");
  }
}

sub EVENT_TIMER {
  quest::depop();
}