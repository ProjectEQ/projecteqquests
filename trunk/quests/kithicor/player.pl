sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
$whimsy_count++;
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}

sub EVENT_TASK_STAGE_COMPLETE {
	if($task_id == 212) {
		quest::summonitem(87319,5);
		$client->AddLevelBasedExp(10, 0);
		quest::setglobal("halloween_zombie",1,0,"H3");
		$client->Message(15,"The zombie presence seems somewhat lessened, and perhaps they have been quelled . . . for the time being.");
	}
}

sub EVENT_SIGNAL {
        if($signal == 666){
                quest::updatetaskactivity(212,0,1);
                quest::faction(98,-30);
        }
        if($signal == 667){
                quest::updatetaskactivity(213,0,1);
        }
}