sub EVENT_SPAWN {
    $counter=0;
    quest::settimer(2,1800);
}

sub EVENT_SIGNAL {
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
  quest::ze(1,"You are too late")
 }
}