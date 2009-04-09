#BeginFile: causeway\Tarlang.pl 
#Quest file for Nobles Causeway - Tarlang (Passive): Necromancer Epic 1.5 (Soulwhisper) 

sub EVENT_SAY { 
  my $x = $npc->GetX(); 
  my $y = $npc->GetY(); 
  my $Z = $npc->GetZ(); 
  my $h = $npc->GetH(); 

  if(($text=~/hail/i) && ($Soulwhisper==4)) { 
    quest::setglobal("Soulwhisper",3,0,"F"); 
#    quest::spawn2(00000,$x,$y,$z,$h); #Tarlang (Active) 
    quest::depop(); 
  } 
} 

sub EVENT_ITEM { 
  quest::say("I have no use for this, $name."); 
  plugin::return_items(\%itemcount); 
} 

#EndFile: causeway\Tarlang.pl (00000)