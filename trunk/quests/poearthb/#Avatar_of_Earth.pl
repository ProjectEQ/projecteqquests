sub EVENT_SPAWN { 
   quest::settimer(1,3400); 
} 

sub EVENT_TIMER { 
   if($timer == 1) { 
      quest::depop(); 
   } 
} 

sub EVENT_DEATH { 
   my $x = $npc->GetX(); 
   my $y = $npc->GetY(); 
   my $z = $npc->GetZ(); 
   my $h = $npc->GetHeading(); 
   quest::spawn2(222015,0,0,$x,$y,$z,$h);
   quest::signal(222012); 
   quest::setglobal("poeb_rathe",1,3,"M10237");
} 
