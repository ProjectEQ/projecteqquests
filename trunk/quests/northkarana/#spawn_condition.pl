sub EVENT_SPAWN { 
quest::settimer("nkdaynight",10);
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #day is 2
	quest::spawn_condition($zonesn, 1,1); #night is 1
}
else {
	quest::spawn_condition($zonesn,2,1); 
	quest::spawn_condition($zonesn,1,0); 
}
 }

sub EVENT_TIMER {
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); 
	quest::spawn_condition($zonesn, 1,1); 
}
else {
	quest::spawn_condition($zonesn,2,1); 
	quest::spawn_condition($zonesn,1,0); 
}
 }