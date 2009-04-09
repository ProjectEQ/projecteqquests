# forager/hunter named cycle random spawner
#

sub EVENT_SPAWN {
  $getnewloc = quest::ChooseRandom(1,2,3,4);
  if ($getnewloc == 1) {
    $newx = 2559;
    $newy = 3459;
    $newz = -242.5;
  }
  elsif ($getnewloc == 2) {
    $newx = 3361;
    $newy = 576;
    $newz = -339;
  }
  elsif ($getnewloc == 3) {
    $newx = 2378;
    $newy = 2728;
    $newz = -349;
  }
  elsif ($getnewloc == 4) {
    $newx = -143.8;
    $newy = -2026.8;
    $newz = -324;
  }
}

sub EVENT_DEATH {
  $getnewmobid = quest::ChooseRandom(95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95107,95150,95155,95156,95158,95164,95165,95166,95170,95175,95177,95178,95179,95182);
  quest::spawn2($getnewmobid,0,0,$newx,$newy,$newz,0);
}

# EOF zone: trakanon

