# signal burrower beast whether success or failure
#

sub EVENT_SPAWN {
  quest::settimer("countdown",1800);
}

sub EVENT_TIMER {
  quest::signalwith(164098,101,0); # NPC: The_Burrower_Beast
  quest::depop();
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(164098,201,0); # NPC: The_Burrower_Beast
  quest::stoptimer("countdown");
}

# EOF zone: thedeep ID: 164089 NPC: A_burrower_parasite

