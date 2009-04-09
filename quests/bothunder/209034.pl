sub EVENT_SIGNAL {
if($signal == 1) {
quest::settimer(5,30);
quest::settimer(6,1600);
}
if($signal == 2) {
quest::stoptimer(5);
quest::stoptimer(6);
}
}

sub EVENT_TIMER {
if($timer == 5) {
quest::stoptimer(5);
quest::settimer(5,30);
quest::spawn2(209103,0,0,$x,$y,$z,$h);
 }

if($timer == 6) {
quest::stoptimer(5);
quest::stoptimer(6);
}
}