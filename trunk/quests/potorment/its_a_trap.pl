# Trap 
# Spawns Phlarax

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(207072,207073,207075),0,0,$x,$y,$z,0);
  quest::depop();
}

#END of FiLE zone:potorment ID: 207080 NPC: its_a_trap.pl