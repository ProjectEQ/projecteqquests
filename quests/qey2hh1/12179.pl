# qey2hh1 night and day checker, spawns night and day npcs
#Angelox's reasoning :)

sub EVENT_SPAWN { 
quest::settimer("qeydaynight",10);
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #day is 2
	quest::spawn_condition($zonesn, 1,1); #night is 1
}
else {
	quest::spawn_condition($zonesn,2,1); #day is 2
	quest::spawn_condition($zonesn,1,0); #night is 1
}
 }

sub EVENT_TIMER {
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #day is 2
	quest::spawn_condition($zonesn, 1,1); #night is 1
}
else {
	quest::spawn_condition($zonesn,2,1); #day is 2
	quest::spawn_condition($zonesn,1,0); #night is 1
}
 }