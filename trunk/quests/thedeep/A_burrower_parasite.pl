# signal burrower beast whether success or failure
#

sub EVENT_SPAWN {
  quest::settimer("countdown",1800);
}

sub EVENT_TIMER {
  quest::signalwith(164098,101,0);
  quest::depop();
}

sub EVENT_DEATH {
  quest::signalwith(164098,201,0);
  quest::stoptimer("countdown");
}

# EOF zone: thedeep ID: 164089 NPC: A_burrower_parasite

