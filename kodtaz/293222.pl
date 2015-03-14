sub EVENT_DEATH_COMPLETE {
  quest::spawn2(293225,0,0,$x - 10,$y,$z,$h);
  quest::spawn2(293224,0,0,$x + 10,$y,$z,$h);
  quest::spawn2(293224,0,0,$x,$y - 10,$z,$h);
  quest::spawn2(293224,0,0,$x,$y + 10,$z,$h);
}