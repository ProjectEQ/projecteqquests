sub EVENT_SPAWN {
  quest::setnexthpevent(90);
}

sub EVENT_HP {
  if($hpevent == 90) {
    quest::signalwith(294474,1,0); # NPC: Glorified_Bolsterer
    quest::signalwith(294475,1,0); # NPC: Glorified_Bolsterer
    quest::signalwith(294478,1,0); # NPC: Glorified_Bolsterer
    quest::setnexthpevent(55);
  }
  if($hpevent == 55) {
  $check_named = $entity_list->GetMobByNpcTypeID(294476);
	if ($check_named) {
        $npc->SetHP(500000);
        quest::emote("The Guardian has been bolstered by his companions.");
        }
        quest::setnexthpevent(50);
  }
  if($hpevent == 50) {
  quest::ze(0,"Guardian of Glorification splits into two smaller stone workers!");
  quest::spawn2(294583,0,0,1038,-484,-68,384); # NPC: ##Guardian_of_Glorification
  quest::spawn2(294583,0,0,1039,-431,-68,384); # NPC: ##Guardian_of_Glorification
  quest::depop();
  }
}
