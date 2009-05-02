#BeginFile: causeway\#Tarlang.pl 
#Quest file for Nobles Causeway - Tarlang (Active): Necromancer Epic 1.5 (Soulwhisper) 

sub EVENT_SPAWN { 
  quest::settimer("TarlangDepop",1500); #Despawn after 25 minutes 
} 

sub EVENT_TIMER { 
  quest::stoptimer("TarlangDepop");
  quest::stoptimer(TarlangDepop); 
  quest::depop(); 
} 

sub EVENT_DEATH {
  quest::stoptimer(TarlangDepop);
}

#EndFile: causeway\#Tarlang.pl (00000)