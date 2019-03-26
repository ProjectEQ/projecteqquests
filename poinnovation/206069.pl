sub EVENT_SPAWN {
  quest::settimer(4,1);
}

sub EVENT_TIMER {
  if($timer == 4 && $x == 1125 && $y == 0) {
    quest::signalwith(206046,1,1); # NPC: Manaetic_Behemoth
    $npc->CastSpell(2321,206069); # Spell: Energy Burst
    quest::depop_withtimer();
  }
}