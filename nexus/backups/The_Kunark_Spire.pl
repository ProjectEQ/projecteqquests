sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
   quest::setglobal("nexus_kun",1,1,"M10"); #when we enter the spires, set global true.
   $nexus_kun = undef;
} 

sub EVENT_EXIT {
   quest::delglobal("nexus_kun"); #when we leave spires, set global false.
   $nexus_kun = undef;
} 