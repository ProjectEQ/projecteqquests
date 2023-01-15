# items: 29147
sub EVENT_SPAWN {
  quest::settimer(1,600);
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::setglobal("pop_fire_fennin_projection", 1, 5, "F");
    $client->Message(4, "You receive a character flag!");
    quest::summonitem(29147); #Globe of Dancing Flame
  }
}

sub EVENT_TIMER {
  quest::spawn_condition($zonesn,2,0);
  quest::stoptimer(1);
  quest::depop();
}
