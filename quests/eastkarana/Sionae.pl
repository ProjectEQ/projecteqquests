# #20450 -> sionae -> gives 20451 & spawns nuien
#


my $move;

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20450 => 1)) {
    quest::say("I see that the time has come. Take the amulet and give it to the third of our kin, Nuien. I will meet you at the gathering.");
    quest::summonitem(20451);
    quest::unique_spawn(15167,0,0,300,-3657,3,183); #spawn nuien
    quest::signalwith(15044,15178,0);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::emote("shivers as her power flows into the air above the gathering.");
  }
  else {
    quest::moveto(-1584,-3669,-18);
    $move = 1;
  }
}

sub EVENT_WAYPOINT_DEPART {
  if ($move == 1) {
    quest::spawn2(15178,0,0,-1584,-3669,-18,0);
    quest::depop();
  }
}

# EOF zone: eastkarana ID: 15178 NPC: Sionae

