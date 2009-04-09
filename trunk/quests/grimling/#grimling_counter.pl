#grimling_counter

sub EVENT_SPAWN {
    $gcounter = 0;
}  

sub EVENT_SIGNAL {
if ($signal == 1) {
    $gcounter += 1;
}
  if($gcounter == 10){
  quest::depop(167662);
  quest::spawn(167661,0,0,-1247,535,40);
  quest::depop();
     $gcounter = 0;
 } 
}