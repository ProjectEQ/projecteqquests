# Trap 
# Spawns Phlarax

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(207072,207073,207075),0,0,$x,$y,$z,0); # NPC(s): a_parylyx_hatchling (207072), a_parylyx_hatchling (207073), a_parylyx_limb_binder (207075)
  quest::depop_withtimer();
}

#END of FiLE zone:potorment ID: 207080 NPC: its_a_trap.pl