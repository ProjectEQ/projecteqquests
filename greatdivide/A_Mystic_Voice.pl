sub EVENT_SPAWN {
quest::settimer("gdivide5min",300); #Live like is 900
}

sub EVENT_TIMER {
if ($timer eq "gdivide5min") {
quest::stoptimer("gdivide5min");
quest::say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
quest::settimer("gdivide3min",120);
}
if ($timer eq "gdivide3min") {
quest::stoptimer("gdivide3min");
quest::say("As a reminder, the portal will become active in three minutes.");
quest::settimer("gdivide2min",60);
}
if ($timer eq "gdivide2min") {
quest::stoptimer("gdivide2min");
quest::say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
quest::settimer("gdivide1min",60);
}
if ($timer eq "gdivide1min") {
quest::stoptimer("gdivide1min");
quest::say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
quest::settimer("gdividetimer",60);
}
if ($timer eq "gdividetimer") {
quest::stoptimer("gdividetimer");
quest::say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
quest::setglobal(nexus_gd,1,3,"S60"); #when the portal is open, global is set true for 1 min.
quest::settimer("gdivide5min",900);
quest::signalwith(118058,101,0); #triggers the flavor
}
 }