sub EVENT_SPAWN {
quest::settimer("gfay5min",300); #Live like is 900
}

sub EVENT_TIMER {
if ($timer eq "gfay5min") {
quest::stoptimer("gfay5min");
quest::say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
quest::settimer("gfay3min",120);
}
if ($timer eq "gfay3min") {
quest::stoptimer("gfay3min");
quest::say("As a reminder, the portal will become active in three minutes.");
quest::settimer("gfay2min",60);
}
if ($timer eq "gfay2min") {
quest::stoptimer("gfay2min");
quest::say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
quest::settimer("gfay1min",60);
}
if ($timer eq "gfay1min") {
quest::stoptimer("gfay1min");
quest::say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
quest::settimer("gfaytimer",60);
}
if ($timer eq "gfaytimer") {
quest::stoptimer("gfaytimer");
quest::say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
quest::setglobal(nexus_gf,1,3,"S60"); #when the portal is open, global is set true for 1 min.
quest::settimer("gfay5min",900);
quest::signalwith(54053,101,0); #triggers the flavor
}
 }