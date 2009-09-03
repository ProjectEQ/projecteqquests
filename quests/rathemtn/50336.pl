# rathemtn night and day checker

sub EVENT_SPAWN { 
quest::settimer("rmdaynight",10);
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #Day is 2
	quest::spawn_condition($zonesn, 1,1); #Night is 1
}
else {
	quest::spawn_condition($zonesn,2,1); #Day is 2
	quest::spawn_condition($zonesn,1,0); #Night is 1
}
 }

sub EVENT_TIMER {
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #Day is 2
	quest::spawn_condition($zonesn, 1,1); #Night is 1
}
else {
	quest::spawn_condition($zonesn,2,1); #Day is 2
	quest::spawn_condition($zonesn,1,0); #Night is 1
}
 }