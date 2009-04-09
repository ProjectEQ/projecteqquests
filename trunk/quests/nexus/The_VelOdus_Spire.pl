sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
   quest::setglobal("nexus_vos",1,1,"M10"); #when we enter the spires, set global true.
   $nexus_vos = undef;
} 

sub EVENT_EXIT {
   quest::delglobal("nexus_vos"); #when we leave spires, set global false.
   $nexus_vos = undef;
} 