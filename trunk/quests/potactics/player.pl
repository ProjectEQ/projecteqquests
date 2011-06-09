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

sub EVENT_CLICKDOOR {
	# gm can always use the door
	# used status > 79 because that is what bothunder/player.pl used
	if($status > 79 && ($doorid == 2 || $doorid == 3 || $doorid == 4 || $doorid == 5)) {
		quest::movepc(214,278,178,2);
	} else {
		#vallon's doors
		if($doorid == 2 || $doorid == 3) {
			#check if Vallon is up
			if(!$entity_list->GetMobByNpcTypeID(214083)) {
				quest::movepc(214,278,178,2);
			}
		}
		#tallon's doors
		if($doorid == 4 || $doorid == 5) {
			#check if Tallon is up
			if(!$entity_list->GetMobByNpcTypeID(214026)) {
				quest::movepc(214,278,178,2);
			}
		}
	}
}
