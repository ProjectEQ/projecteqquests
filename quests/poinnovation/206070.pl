sub EVENT_SPAWN {
  quest::settimer(4,1);
}

sub EVENT_TIMER {
  if($timer == 4 && $x == 1125 && $y == 0) {
    $npc->Depop(1);
    quest::signalwith(206046,1,1);
    $npc->CastSpell(2321,206073);
  }
}