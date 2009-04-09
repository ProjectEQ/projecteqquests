#third bee




sub EVENT_DEATH {

  $x = $npc->GetX();

  $y = $npc->GetY();

  $z = $npc->GetZ();

  $h = $npc->GetHeading();


  quest::spawn2(71101,0,0,$x,$y,$z,$h);

}

