sub EVENT_SPAWN {
  $event = 0;
  quest::set_proximity($x-120,$x+120,$y-120,$y+120);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if ($event == 2) {
      quest::say("Carefully continue on your journey, you will need a key.");
      quest::signalwith(289019,1,0);
      quest::setglobal("tipt_progress",2,5,"H6");
  }
 }
}


sub EVENT_ENTER {
  if($qglobals{tipt_progress} == 1){
    if($event == 0) {
   quest::spawn2(289035,0,0,-1274,996,396,191);
   quest::spawn2(289035,0,0,-1298,1012,396,127);
   quest::spawn2(289035,0,0,-1323,996,396,64);
   quest::spawn2(289035,0,0,-1285,795,396,168);
   quest::spawn2(289035,0,0,-1275,779,396,193);
   quest::spawn2(289035,0,0,-1296,756,396,255);
   quest::spawn2(289035,0,0,-1321,779,396,63);
   quest::spawn2(289035,0,0,-1254,799,395,246);
   quest::spawn2(289035,0,0,-1249,962,394,153);
   quest::settimer(1,60);
   $event = 1;
     }
   }
 }
 
sub EVENT_TIMER {
  {
   quest::stoptimer(1);
   quest::settimer(1,10);
      $named_up = 0;
	}
$check_named = $entity_list->GetMobByNpcTypeID(289035);
	if ($check_named) {
		$named_up = 1;
}
if ($timer == 1 && $named_up == 0)  {
   $event = 2;
   quest::stoptimer(1);
}
}   
sub EVENT_SIGNAL {
  if($signal == 1) {   # from 289002
    $counter +=1;
    }
if($counter == 9) {
    quest::spawn2(289038,0,0,-804,1583,538,121);
    }

}