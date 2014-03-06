#Zun Muram Mordl Delt - Event
#This is the timer for adds.

sub EVENT_SPAWN {
quest::settimer("DepopAdds", 120);
#quest::settimer("DepopAdds", 5);
#quest::shout("spawned");
}

sub EVENT_TIMER {

if ($timer eq "DepopAdds") {
quest::stoptimer("DepopAdds");
quest::spawn2(298120,0,0, $x, $y, $z, $h);
quest::depopall(298151);
quest::depopall(298152);
quest::depopall(298153);
quest::depopall(298150);
quest::depop();
  }
}


