#A Skeletal Excavator, Befallen 36006 36004 
#Status:  COMPLETE 

sub EVENT_DEATH 
{ 
 if(rand() <= 0.2) 
  { 
    quest::unique_spawn(36092,0,0,-43.5,-339.8,-10.9); 
  } 
}
