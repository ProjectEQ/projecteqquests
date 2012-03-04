sub EVENT_SPAWN {
   if ($zonetime > 700 && $zonetime < 1899) {
   $npc->Depop(1);
   }
}

sub EVENT_WAYPOINT_ARRIVE {
   if (($zonetime > 700 && $zonetime < 1899) && ($wp == 1)) {
   $npc->Depop(1);
   }
}