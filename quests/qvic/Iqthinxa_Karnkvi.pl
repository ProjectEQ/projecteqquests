sub EVENT_SPAWN {
  quest::setnexthpevent(75);
}

sub EVENT_HP {
  if($hpevent == 75) {
  quest::spawn2(295131,0,0,84,423,-410,84);
  quest::spawn2(295132,0,0,126,310,-422,232);
  quest::spawn2(295133,0,0,267,283,-410,124);
  quest::modifynpcstat("special_attacks",ABfHG);
    $npc->WipeHateList();
    }
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    if((!$entity_list->GetMobByNpcTypeID(295131)) && (!$entity_list->GetMobByNpcTypeID(295132)) && (!$entity_list->GetMobByNpcTypeID(295133))) {
       quest::modifynpcstat("special_attacks",SRTMCNIDf);
    }   
  }  
} 

