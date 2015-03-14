sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 120, $x + 120, $y - 120, $y + 120);
}

sub EVENT_ENTER {
   quest::setglobal("spire_gf",1,1,"F"); #when we enter the spires, set global true.
   $spire_gf = undef;
} 

sub EVENT_EXIT {
   quest::delglobal("spire_gf"); #when we leave spires, set global false.
   $spire_gf = undef;
} 

sub EVENT_SIGNAL {
if ($signal == 101) {
$npc->CastSpell(54053,2935); #flavor
}
 }