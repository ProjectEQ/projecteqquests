# check for failed cycle and respawn event controller if needed
#

sub EVENT_SPAWN {
  quest::settimer("start_controller",300);
}

sub EVENT_TIMER {
  if ($timer eq "start_controller") {
    quest::spawn2(164120,0,0,1627,289,-54,0);
    quest::stoptimer("start_controller");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 101) { #failure - despawn the worms
    quest::settimer("start_controller",300);
    quest::signalwith(164118,102,0);
    quest::signalwith(164104,102,0);
    quest::signalwith(164100,102,0);
    quest::signalwith(164108,102,0);
    quest::signalwith(164085,102,0);
  }
  elsif ($signal == 201) { #success
    quest::depop_withtimer();
  }
}

# EOF zone: thedeep ID: 164098 NPC: The_Burrower_Beast

