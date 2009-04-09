#second bee


sub EVENT_DEATH {

  $x = $npc->GetX();

  $y = $npc->GetY();

  $z = $npc->GetZ();

  $h = $npc->GetHeading();


  quest::spawn2(71102,0,0,$x+3,$y,$z,$h);

  quest::spawn2(71102,0,0,$x-3,$y,$z,$h);
}

