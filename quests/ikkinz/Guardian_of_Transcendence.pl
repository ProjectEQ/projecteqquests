sub EVENT_SPAWN {
  quest::setnexthpevent(90);
}

sub EVENT_HP {
  if($hpevent == 90) {
     $npc->GMMove(445,-489,-45,209);
     $mob->WipeHateList();
     quest::setnexthpevent(75);
     quest::setglobal("ikkydoor",1,3,"H6");     
  }
  if($hpevent == 75) {
     $npc->GMMove(671,-714,-50,191);
     $mob->WipeHateList();
     quest::setnexthpevent(50);
     quest::setglobal("ikkydoor",2,3,"H6");     
   }
   if($hpevent == 50) {
      $npc->GMMove(534,-210,-50,72);
      $mob->WipeHateList();
      quest::setglobal("ikkydoor",3,3,"H6");     
   }
}  

sub EVENT_DEATH {
  quest::spawn2(294593,0,0,530,-261,-50,69);
  quest::spawn2(294598,0,0,531,-157,-50,126); 
  quest::spawn2(294599,0,0,522,-233,-50,68);
  quest::spawn2(294600,0,0,516,-182,-50,68);
}
