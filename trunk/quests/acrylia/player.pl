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