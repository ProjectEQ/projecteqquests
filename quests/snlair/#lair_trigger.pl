sub EVENT_SPAWN {
    quest::spawn_condition($zonesn,2,0);
  quest::spawn_condition($zonesn,1,0);
  
}

sub EVENT_SIGNAL {
$counter=0;
  if($signal == 1 ) {
  quest::settimer(2,1800);
  quest::spawn_condition($zonesn,1,1);
  quest::spawn_condition($zonesn,2,1);
}
if($signal == 2) { 
         $counter += 1;
}
if($counter == 8) {
  quest::ze(1,"You have found some tools");
}
if($counter == 14) {
  quest::ze(1,"You have found some tools");
}
if($counter == 22) {
  quest::ze(1,"You have found some tools");
  quest::setglobal("sewers", 4, 5, "F");

}
}


sub EVENT_TIMER {
  if ($timer == 2) {
  quest::depop(286098);
  $counter=0;
  quest::spawn_conditions($zonesn,2,0);
}
}