#scripts to randomly spawn one of these npc : boulder fiend, a stone beast, a boulderling, stonehead, Boulder

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  quest::emote("at your feet explodes into violent motion!");
  quest::spawn2(quest::ChooseRandom(171063,171060,171055,171054,171053,171051,171064,171069),0,0,$x,$y,$z,$h);
  $npc->Depop(1);
}

