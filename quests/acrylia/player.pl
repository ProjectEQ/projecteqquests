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


#This quest file simply makes the fancy 4-paneled door operate properly.

sub EVENT_CLICKDOOR {
 if($doorid == 1 || $doorid == 257) {
  quest::forcedooropen(2);
  quest::forcedooropen(3);
  quest::forcedooropen(4);
  }
 if($doorid == 2 || $doorid == 258) {
  quest::forcedooropen(1);
  quest::forcedooropen(3);
  quest::forcedooropen(4);
 }
 if($doorid == 3 || $doorid == 259) {
  quest::forcedooropen(1);
  quest::forcedooropen(2);
  quest::forcedooropen(4);
 }
 if($doorid == 4 || $doorid == 260) {
  quest::forcedooropen(1);
  quest::forcedooropen(2);
  quest::forcedooropen(3);
 }
}

#Submitted by Jim Mills