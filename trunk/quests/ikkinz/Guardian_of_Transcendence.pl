sub EVENT_SPAWN {
  quest::setnexthpevent(90);
}

sub EVENT_HP {
  if($hpevent == 90) {
     $npc->GMMove(445,-489,-45,209);
     quest::setnexthpevent(75);
     #opendoor
  }
  if($hpevent == 75) {
     $npc->GMMove(671,-714,-50,191);
     quest::setnexthpevent(50);
     #opendoor
   }
   if($hpevent == 50) {
      $npc->GMMove(534,-210,-50,72);
   }
}  

sub EVENT_DEATH {
  quest::spawn2(294593,0,0,530,-261,-50,69);
  quest::spawn2(294593,0,0,531,-157,-50,126); 
  quest::spawn2(294593,0,0,522,-233,-50,68);
  quest::spawn2(294593,0,0,516,-182,-50,68);
}