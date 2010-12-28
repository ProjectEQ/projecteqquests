sub EVENT_SPAWN {
    $counterone=0;  #npcid 286009
    $countertwo=0;  #npcid 286037
    $counterthree=0;	#npcid 286077
    $counterall=0;
    quest::settimer(2,3000);
    quest::spawn_condition($zonesn,3,1);
}

sub EVENT_SIGNAL {
if($signal == 2) { 
         $counterone += 1;
	 $counterall += 1;
}
if($signal == 3) { 
         $countertwo += 1;
	 $counterall += 1;
}
if($signal == 4) { 
         $counterthree += 1;
	 $counterall += 1;
}
if($counterone == 8) {
  quest::ze(1,"You have found some tools");
}
if($countertwo == 6) {
  quest::ze(1,"You have found some tools");
}
if($counterthree == 8) {
  quest::ze(1,"You have found some tools");
}
if($counterall == 22) {
  quest::signalwith(286098,1,0);
  quest::stoptimer(2);
  quest::stoptimer(3);
  }
}

sub EVENT_TIMER {
  if ($timer == 2) {
    quest::stoptimer(2);
    quest::settimer(3,600);
    quest::ze(1,"Your time is coming to a end, hurry!");
    }
  if ($timer == 3) {
  quest::depop(286098);
    $counterone=0;  
    $countertwo=0;  
    $counterthree=0;
    $counterall=0;
  quest::ze(1,"You are too late");
 }
}