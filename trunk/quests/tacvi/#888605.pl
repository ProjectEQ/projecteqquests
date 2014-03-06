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
quest::spawn2(297020,0,0, $x, $y, $z, $h);
quest::depopall(297051);
quest::depopall(297052);
quest::depopall(297053);
quest::depopall(297050);
quest::depop();
  }
}


