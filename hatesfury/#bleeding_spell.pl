sub EVENT_SIGNAL {
  if ($signal == 666) {
    quest::settimer("bleeding", 63); #cast every 63 seconds
  }
  if ($signal == 333) {
    quest::stoptimer("bleeding");
  }
}

sub EVENT_TIMER {
  if ($timer eq "bleeding") {
    $npc->CastSpell(3786, 228118); #Bleeding Ether, spell_target
  }
}