# southkarana night and day checker, spawns werewolf and sentry
#Angelox's reasoning :)

sub EVENT_SPAWN { 
quest::settimer("skdaynight",10);
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #Sentry is 2
	quest::spawn_condition($zonesn, 1,1); #Werewolf is 1
}
else {
	quest::spawn_condition($zonesn,2,1); #Sentry is 2
	quest::spawn_condition($zonesn,1,0); #Werewolf is 1
}
 }

sub EVENT_TIMER {
if ($zonetime < 800 || $zonetime > 1999) {
	quest::spawn_condition($zonesn, 2,0); #Sentry is 2
	quest::spawn_condition($zonesn, 1,1); #Werewolf is 1
}
else {
	quest::spawn_condition($zonesn,2,1); #Sentry is 2
	quest::spawn_condition($zonesn,1,0); #Werewolf is 1
}
 }