sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 120, $x + 120, $y - 120, $y + 120);
}

sub EVENT_ENTER {
   quest::setglobal("spire_gd",1,1,"F"); #when we enter the spires, set global true.
   $spire_gd = undef;
} 

sub EVENT_EXIT {
   quest::delglobal("spire_gd"); #when we leave spires, set global false.
   $spire_gd = undef;
} 

sub EVENT_SIGNAL {
if ($signal == 101) {
$npc->CastSpell(118058,2935); #flavor
}
 }