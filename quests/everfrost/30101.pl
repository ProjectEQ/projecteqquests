# everfrost night and day checker
#Angelox's reasoning :)

sub EVENT_SPAWN { 
quest::settimer("efdaynight",10);
if ($zonetime < 1000 || $zonetime > 2199) {
	quest::spawn_condition($zonesn, 2,0); #day are 2
	quest::spawn_condition($zonesn, 1,1); #night are 1
}
else {
	quest::spawn_condition($zonesn,2,1); #day are 2
	quest::spawn_condition($zonesn,1,0); #night are 1
}
 }

sub EVENT_TIMER {
if ($zonetime < 1000 || $zonetime > 2199) {
	quest::spawn_condition($zonesn, 2,0); #day are 2
	quest::spawn_condition($zonesn, 1,1); #night are 1
}
else {
	quest::spawn_condition($zonesn,2,1); #day are 2
	quest::spawn_condition($zonesn,1,0); #night are 1
}
 }