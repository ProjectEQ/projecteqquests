# Attempt to limit players level 53 and over from engaging nagafen and vox.
# Player will be banished to just outside the permafrost zone in everfrost.

sub EVENT_SPAWN {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $range = 200;
  my $range2 = 88;
  quest::set_proximity($x - $range, $x + $range, $y - $range2, $y + $range);
}

sub EVENT_ENTER {
  if (($ulevel >= 53) && ($status < 80)) {
    quest::echo("I will not fight you, but I will banish you!");
    quest::movepc(30,-7024,2020,-60.7);
  }
}

sub EVENT_AGGRO {
  quest::settimer("getloc",15); #mob will get position every 15 seconds if pulled away from spawn point
}

sub EVENT_TIMER {
  quest::clear_proximity();
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $range = 200;
  quest::set_proximity($x - $range, $x + $range, $y - $range, $y + $range);
}

sub EVENT_DEATH {
  quest::stoptimer("getloc");
  quest::clear_proximity();
}

# EOF zone: permafrost ID: 73057 NPC: Lady_Vox
