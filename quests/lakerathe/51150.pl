# lakerathe night and day checker
#Angelox's reasoning :)

sub EVENT_SPAWN { 
quest::settimer("rathedaynight",10);
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #live are 2
	quest::spawn_condition($zonesn, 1,1); #undead are 1
}
else {		
	quest::spawn_condition($zonesn, 2,1); #live are 2
	quest::spawn_condition($zonesn, 1,0); #undead are 1
 }
}

sub EVENT_TIMER {
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #live are 2
	quest::spawn_condition($zonesn, 1,1); #undead are 1
}
else {		
	quest::spawn_condition($zonesn, 2,1); #live are 2
	quest::spawn_condition($zonesn, 1,0); #undead are 1
 }
}