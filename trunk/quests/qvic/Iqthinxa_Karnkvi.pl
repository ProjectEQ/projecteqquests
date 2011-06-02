sub EVENT_SPAWN {
  quest::setnexthpevent(75);
}

sub EVENT_HP {
  if($hpevent == 75) {
  quest::spawn2(295131,0,0,$x-50,$y,$z,$h);
  quest::spawn2(295132,0,0,$x,$y-50,$z,$h);
  quest::spawn2(295133,0,0,$x+50,$y,$z,$h);
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

