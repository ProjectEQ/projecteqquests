sub EVENT_SPAWN {
   $npc->SetAppearance(1);
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 12278 => 1)) {
      $npc->SetAppearance(0);
      quest::moveto(-395.87, 807.04, 70.53, 0, 1);
   }
}

sub EVENT_WAYPOINT_ARRIVE {
   quest::creategroundobject(12274, $x, $y, $z, $h);
}