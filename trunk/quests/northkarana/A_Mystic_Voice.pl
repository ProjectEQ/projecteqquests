sub EVENT_SPAWN {
quest::settimer("nkar5min",300); #Live like is 900
}

sub EVENT_TIMER {
if ($timer eq "nkar5min") {
quest::stoptimer("nkar5min");
quest::say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
quest::settimer("nkar3min",120);
}
if ($timer eq "nkar3min") {
quest::stoptimer("nkar3min");
quest::say("As a reminder, the portal will become active in three minutes.");
quest::settimer("nkar2min",60);
}
if ($timer eq "nkar2min") {
quest::stoptimer("nkar2min");
quest::say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
quest::settimer("nkar1min",60);
}
if ($timer eq "nkar1min") {
quest::stoptimer("nkar1min");
quest::say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
quest::settimer("nkartimer",60);
}
if ($timer eq "nkartimer") {
quest::stoptimer("nkartimer");
quest::say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
quest::setglobal("nexus",1,3,"S60"); #when the portal is open, global is set true for 1 min.
quest::settimer("nkar5min",300);
quest::signalwith(13022,101,0); #triggers the flavor
}
 }