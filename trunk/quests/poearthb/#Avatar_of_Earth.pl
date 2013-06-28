sub EVENT_SPAWN { 
   quest::settimer("avatar",3400); 
} 

sub EVENT_TIMER { 
   if($timer eq "avatar") { 
      quest::depop(); 
   } 
} 

sub EVENT_DEATH_COMPLETE { 
   my $x = $npc->GetX(); 
   my $y = $npc->GetY(); 
   my $z = $npc->GetZ(); 
   my $h = $npc->GetHeading(); 
   quest::spawn2(222015,0,0,$x,$y,$z,$h);
   quest::signal(222012); 
   quest::setglobal("poeb_rathe",1,3,"D5");
} 
