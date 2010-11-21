sub EVENT_SPAWN {
  quest::setnexthpevent(90);
}

sub EVENT_HP {
  if($hpevent == 90) {
     $npc->GMMove(445,-489,-45,209);
     $mob->WipeHateList();
     quest::setnexthpevent(75);
     #opendoor
  }
  if($hpevent == 75) {
     $npc->GMMove(671,-714,-50,191);
     $mob->WipeHateList();
     quest::setnexthpevent(50);
     #opendoor
   }
   if($hpevent == 50) {
      $npc->GMMove(534,-210,-50,72);
      $mob->WipeHateList();
   }
}  