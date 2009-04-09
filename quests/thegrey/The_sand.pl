# xakra sei trap spawner - the grey
#

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  quest::emote("at your feet explodes into violent motion!");
  quest::spawn2(171050,0,0,$x,$y,$z,0);
  quest::depop();
}

# EOF zone: thegrey ID: 171005 NPC: The_sand

