sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30272=> 1)) { #Harness of Control
    quest::emote("reels in pain as the harness snaps around its neck tightly. A strange gleam enters its eyes as it slowly begins to shamble towards the exit and the giants fortress.");
    quest::exp(20000);
    quest::ding();
    quest::start(57);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT_ARRIVE {
  if ($wp == 16) {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x-25,$x+25,$y-25,$y+25);
  }
  if ($wp == 19) {
    quest::clear_proximity();
    if($entity_list->GetMobByNpcTypeID(118208)){
      quest::attacknpctype(118208);
      quest::signal(118207);
    }
  }
}

sub EVENT_ENTER {
  quest::spawn2(118207,0,0,-2397,-2615,294,0);
  quest::spawn2(118208,0,0,-2391,-2569,299,0);
  quest::clear_proximity();
}

sub EVENT_SIGNAL {
  quest::depop_withtimer();
}
