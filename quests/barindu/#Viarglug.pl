#BeginFile: barindu\#Viarglug.pl 
#Quest file for Barindu - Viarglug: Necromancer Epic 1.5 (Soulwhisper) 

sub EVENT_SPAWN { 
  quest::settimer("ViarglugDepop",1800); #Despawn after 30 minutes 
} 

sub EVENT_SAY { 
  if($text=~/hail/i) { 
    quest::attack($name); 
  } 
} 

sub EVENT_TIMER { 
  quest::stoptimer("ViarglugDepop"); 
  quest::depop(); 
} 

#EndFile: barindu\#Viarglug.pl (00000)