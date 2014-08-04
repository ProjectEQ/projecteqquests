sub EVENT_SPAWN {
  quest::settimer("tox5min", 300); #Live like is 900
}

sub EVENT_TIMER {
  if ($timer eq "tox5min") {
    quest::stoptimer("tox5min");
    quest::say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
    quest::settimer("tox3min", 120);
  }
  elsif ($timer eq "tox3min") {
    quest::stoptimer("tox3min");
    quest::say("As a reminder, the portal will become active in three minutes.");
    quest::settimer("tox2min", 60);
  }
  elsif ($timer eq "tox2min") {
    quest::stoptimer("tox2min");
    quest::say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
    quest::settimer("tox1min", 60);
  }
  elsif ($timer eq "tox1min") {
    quest::stoptimer("tox1min");
    quest::say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
    quest::settimer("toxtimer", 60);
  }
  elsif ($timer eq "toxtimer") {
    quest::stoptimer("toxtimer");
    quest::say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
    quest::setglobal("nexus_tox", 1, 3, "S60"); #when the portal is open, global is set true for 1 min.
    quest::settimer("tox5min", 300);
    #quest::signalwith(00000, 101, 0); #triggers the flavor ####needs Odus_Spires copied, not using tox version...###
  }
}