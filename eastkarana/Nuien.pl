# #20451 -> nuien -> gives 20451 & spawns Teola
#

my $move;

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20451 => 1)) {
    quest::say("So be it. Do as you have done before and find the next. Teloa is the last.");
    quest::summonitem(20451);
    quest::unique_spawn(15170,0,0,-2854,-3840,126.5,61.8); #spawn teola
    quest::signalwith(15044,15167,0);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::emote("growls as his power seeps into the earth.");
  }
  else {
    quest::moveto(-1590,-3671,-18);
    $move = 1;
  }
}

sub EVENT_WAYPOINT_DEPART {
  if ($move == 1) {
    quest::spawn2(15167,0,0,-1590,-3671,-18,0);
    quest::depop();
  }
}

# EOF zone: eastkarana ID: 15167 NPC: Nuien

