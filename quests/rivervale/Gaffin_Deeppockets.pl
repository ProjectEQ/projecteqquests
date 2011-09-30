sub EVENT_SPAWN {
  quest::settimer("lenny",950);
}

sub EVENT_TIMER {
 if ($timer eq "lenny") {
  quest::say("Lenny, we has a problem. Stanos is back, and he ain't happy. He told me to tell ya that he would be calling in his markers soon. I reckon ya know what that means, and that's bad business with the Circle. Whatcha wanna do?");
  quest::signal(19062,1);
 }
}
