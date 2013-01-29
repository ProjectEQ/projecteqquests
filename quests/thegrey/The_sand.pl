#scripts to randomly spawn one of these npc : a_Xakra_Shah or a_Xakra_Sei

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  quest::emote("at your feet explodes into violent motion!");
  quest::spawn2(quest::ChooseRandom(171059,171058,171050,171049),0,0,$x,$y,$z,$h);
  quest::depop_withtimer();
}

