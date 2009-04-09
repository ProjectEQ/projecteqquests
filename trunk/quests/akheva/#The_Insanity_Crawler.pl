sub EVENT_SLAY {
        quest::spawn2(179136,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(179136,0,0,$x + 10,$y,$z,$h);
        quest::spawn2(179136,0,0,$x,$y - 10,$z,$h);
        quest::spawn2(179136,0,0,$x,$y + 10,$z,$h);
        quest::spawn2(179136,0,0,$x,$y + 15,$z,$h);
}