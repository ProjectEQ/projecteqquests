sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 120, $x + 120, $y - 120, $y + 120);
}

sub EVENT_ENTER {
  quest::setglobal("spire_tox", 1, 1, "F"); #when we enter the spires, set global true.
  $spire_tox = undef;
} 

sub EVENT_EXIT {
  quest::delglobal("spire_tox"); #when we leave spires, set global false.
  $spire_tox = undef;
} 

sub EVENT_SIGNAL {
  if ($signal == 101) {
    #$npc->CastSpell(00000, 2935); #flavor   ####Needs nexus spires? Don't signal tox version####
  }
}