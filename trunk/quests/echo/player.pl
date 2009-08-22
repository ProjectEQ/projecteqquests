#This quest file links individual doors together so that double doors will open as one.

sub EVENT_CLICKDOOR {
 if($doorid == 3 || $doorid == 259) {
  quest::forcedooropen(4);
 }
 if($doorid == 4 || $doorid == 260) {
  quest::forcedooropen(3);
 }
}

#Submitted by Jim Mills