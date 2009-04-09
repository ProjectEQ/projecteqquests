sub EVENT_SPAWN { 
quest::settimer("lfaydarknight",10);
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 1,1); #undead are 1
}
else {
	quest::spawn_condition($zonesn,1,0); #undead are 1
}
 }

sub EVENT_TIMER {
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 1,1); #undead are 1
}
else {
	quest::spawn_condition($zonesn,1,0); #undead are 1
}
 }