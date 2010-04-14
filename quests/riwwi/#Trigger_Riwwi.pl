sub EVENT_SPAWN { 
quest::settimer("daynight",10);
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); 
}
else {
	quest::spawn_condition($zonesn,2,1); 
}
 }

sub EVENT_TIMER {
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0);
}
else {
	quest::spawn_condition($zonesn,2,1); 
}
 }