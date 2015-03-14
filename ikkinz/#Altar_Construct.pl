sub EVENT_SPAWN {
  quest::setnexthpevent(99);
}
sub EVENT_HP {
  if($hpevent == 99) {
    quest::spawn2(294616,0,0,566,-212,-50,196);
    quest::spawn2(294616,0,0,632,-147,-50,155);
    quest::spawn2(294616,0,0,611,-146,-50,153);
    quest::spawn2(294616,0,0,575,-272,-50,250);
    quest::spawn2(294619,0,0,731,-207,-50,193);
    quest::setnexthpevent(75);
    }
   if($hpevent == 75) {
    quest::spawn2(294616,0,0,566,-212,-50,196);
    quest::spawn2(294616,0,0,632,-147,-50,155);
    quest::spawn2(294616,0,0,611,-146,-50,153);
    quest::spawn2(294616,0,0,575,-272,-50,250);
    quest::setnexthpevent(45);
    }
   if($hpevent == 45) {
    quest::spawn2(294616,0,0,566,-212,-50,196);
    quest::spawn2(294616,0,0,632,-147,-50,155);
    quest::spawn2(294616,0,0,611,-146,-50,153);
    quest::spawn2(294616,0,0,575,-272,-50,250);
    quest::setnexthpevent(25);
    }
   if($hpevent == 25) {
    quest::spawn2(294616,0,0,566,-212,-50,196);
    quest::spawn2(294616,0,0,632,-147,-50,155);
    quest::spawn2(294616,0,0,611,-146,-50,153);
    quest::spawn2(294616,0,0,575,-272,-50,250);
    }
}
sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 720 || $x < 500 || $y < -300 || $y > -120) {
    $npc->GMMove(531,-157,-49,126);
  }
}
sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294620,0,0,815,139,-72,128);
}

