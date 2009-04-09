sub EVENT_SPAWN { 
quest::settimer("bwnaxot",10);
if ($zonetime < 1299 && $zonetime > 100) {
	quest::spawn_condition($zonesn, 2,0); #naxot is 2
	quest::spawn_condition($zonesn, 1,1); #nothing is 1
}
else {
	quest::spawn_condition($zonesn,2,1); 
	quest::spawn_condition($zonesn,1,0);
}
 }

sub EVENT_TIMER {
if ($zonetime < 1299 && $zonetime > 100) {
	quest::spawn_condition($zonesn, 2,0);
	quest::spawn_condition($zonesn, 1,1);
}
else {
	quest::spawn_condition($zonesn,2,1);
	quest::spawn_condition($zonesn,1,0);
}
 }