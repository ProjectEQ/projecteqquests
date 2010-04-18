sub EVENT_SPAWN {
  $counter=0;
  quest::spawn_condition($zonesn,1,0);
  quest::settimer(1,120);

}

sub EVENT_TIMER {
   quest::spawn_condition($zonesn,1,1);

}

sub EVENT_SIGNAL {
  if($signal == 1) { 
         $counter += 1;
}
  if($counter == 8 ) {			
   quest::updatespawntimer(76546,0);
   quest::updatespawntimer(76547,0);
   quest::updatespawntimer(76548,0);
   quest::updatespawntimer(76549,0);
   quest::updatespawntimer(76550,0);
   quest::updatespawntimer(76551,0);   
   quest::updatespawntimer(76552,0);   
   quest::updatespawntimer(76553,0);   
}
  if($counter == 16 ) {			
   quest::updatespawntimer(76546,0);
   quest::updatespawntimer(76547,0);
   quest::updatespawntimer(76548,0);
   quest::updatespawntimer(76549,0);
   quest::updatespawntimer(76550,0);
   quest::updatespawntimer(76551,0);   
   quest::updatespawntimer(76552,0);   
   quest::updatespawntimer(76553,0);
}
 if($counter == 24 ) {			
   quest::updatespawntimer(76546,0);
   quest::updatespawntimer(76547,0);
   quest::updatespawntimer(76548,0);
   quest::updatespawntimer(76549,0);
   quest::updatespawntimer(76550,0);
   quest::updatespawntimer(76551,0);   
   quest::updatespawntimer(76552,0);   
   quest::updatespawntimer(76553,0);
}
 if($counter == 32 ) {			
 quest::updatespawntimer(76546,0);
   quest::updatespawntimer(76547,0);
   quest::updatespawntimer(76548,0);
   quest::updatespawntimer(76549,0);
   quest::updatespawntimer(76550,0);
   quest::updatespawntimer(76551,0);   
   quest::updatespawntimer(76552,0);   
   quest::updatespawntimer(76553,0);
}
 if($counter == 40 ) {			
   quest::spawn_condition($zonesn,1,0);
   quest::spawn_condition($zonesn,2,1);
}
 if($counter == 48 ) {			
    quest::spawn2(206080,0,0,-289,-760,2,250);
}
 if($counter == 56 ) {			
  quest::updatespawntimer(76546,0);
   quest::updatespawntimer(76547,0);
   quest::updatespawntimer(76548,0);
   quest::updatespawntimer(76549,0);
   quest::updatespawntimer(76550,0);
   quest::updatespawntimer(76551,0);   
   quest::updatespawntimer(76552,0);   
   quest::updatespawntimer(76553,0);
}
if($counter == 64 ) {			
 quest::updatespawntimer(76546,0);
   quest::updatespawntimer(76547,0);
   quest::updatespawntimer(76548,0);
   quest::updatespawntimer(76549,0);
   quest::updatespawntimer(76550,0);
   quest::updatespawntimer(76551,0);   
   quest::updatespawntimer(76552,0);   
   quest::updatespawntimer(76553,0);
}
if($counter == 72 ) {
   quest::spawn_condition($zonesn,1,0);			
   quest::spawn_condition($zonesn,2,1);
}
if($counter == 80 ) {			
  quest::signalwith(206080,1,1);
}
}