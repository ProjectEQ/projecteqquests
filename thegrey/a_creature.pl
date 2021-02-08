#scripts to randomly spawn one of these npc : boulder fiend, a stone beast, a boulderling, stonehead, Boulder

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  quest::emote("of living stone leaps out at you from amongst the rocks!");
  quest::spawn2(quest::ChooseRandom(171063,171060,171055,171054,171053,171051,171063,171060,171064,171069),0,0,$x,$y,$z,$h); # NPC(s): a_boulder_fiend (171063), a_boulderling (171060), a_boulderling (171055), a_boulderling (171054), a_boulderling (171053), a_stone_beast (171051), a_boulder_fiend (171063), a_boulderling (171060), #Stonehand (171064), #Boulder (171069)
  quest::depop_withtimer();
}

