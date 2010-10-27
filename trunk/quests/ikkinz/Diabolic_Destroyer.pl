sub EVENT_SPAWN {
  quest::setnexthpevent(75);
}

sub EVENT_HP {
  if($hpevent == 75) {
    quest::spawn2(294137,0,0,$x,$y-10,$z,$h);
    quest::spawn2(294137,0,0,$x,$y+10,$z,$h);
    quest::setnexthpevent(50);
  }
  if($hpevent == 50) {
    quest::spawn2(294137,0,0,$x,$y-10,$z,$h);
    quest::spawn2(294137,0,0,$x,$y+10,$z,$h);
    quest::setnexthpevent(25);
  }
  if($hpevent == 25) {
    quest::spawn2(294137,0,0,$x,$y-10,$z,$h);
    quest::spawn2(294137,0,0,$x,$y+10,$z,$h);
  }
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
  quest::spawn2(294137,0,0,450,-119,6,200);
  quest::spawn2(294137,0,0,457,-139,6,193);
  quest::spawn2(294137,0,0,438,-158,6,192);
}

sub EVENT_TIMER {
  if(($x > 500) || ($x < 200) || ($y > -30) || ($y < -250)) {
    $npc->GMMove(442,-141,11,192);
  }
}

sub EVENT_DEATH {
  quest::depopall(294137);
  quest::spawn2(294136,0,0,442,-141,11,192);
}