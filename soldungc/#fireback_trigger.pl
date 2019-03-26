sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 45, $x + 45, $y - 45, $y + 45);
}

sub EVENT_ENTER {
   quest::spawn2(278113,0,0,878,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,878,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,906,147,-23.8,390); # NPC: a_fireback_spiderling
   quest::spawn2(278113,0,0,906,175,-23.8,390); # NPC: a_fireback_spiderling
   quest::depop();
}
