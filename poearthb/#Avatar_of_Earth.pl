sub EVENT_SPAWN { 
   quest::settimer("avatar",3400);
   quest::ze(0,"The last of the council collapses, devoid of life. Twelve distinct voices chant, 'Time comes and time passes, for the stone is forever. We call upon our collective power to defend our stronghold!' When the chanting ceases, a deep throated primal scream echoes across Ragrax as the power of twelve is joined as one. The Avatar of Earth has been summoned.");
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
   quest::spawn2(222015,0,0,$x,$y,$z,$h); # NPC: #Essence_of_Earth
   quest::signal(222012); 
   quest::setglobal("poeb_rathe",1,3,"D5");
} 
