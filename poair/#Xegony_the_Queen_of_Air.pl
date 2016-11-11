sub EVENT_SPAWN {
	quest::setnexthpevent(98);
}

sub EVENT_HP {
	if ($hpevent == 98) { 
		quest::depopall(215050);
  		$entid1 = quest::spawn2(215465,0,0,-401,-327,1440.25,24.5); #An_Air_Infused_Defender
  		$entid2 = quest::spawn2(215465,0,0,-433,-306,1440.25,24.5); #An_Air_Infused_Defender
  		$entid3 = quest::spawn2(215465,0,0,-487,-270,1445.38,24.5); #An_Air_Infused_Defender
  		$entid4 = quest::spawn2(215472,0,0,-460.7,-355.6,1437.1,21.2); #An_Elemental_Arbitor
		$entid5 = quest::spawn2(215465,0,0,-487,-270,1445.38,24.5); #An_Air_Infused_Defender
		$entid6 = quest::spawn2(215465,0,0,-433,-306,1440.25,24.5); #An_Air_Infused_Defender
  		$mob1 = $entity_list->GetMobID($entid1);
  		$mob2 = $entity_list->GetMobID($entid2);
  		$mob3 = $entity_list->GetMobID($entid3);
  		$mob4 = $entity_list->GetMobID($entid4);
		$mob5 = $entity_list->GetMobID($entid5);
		$mob6 = $entity_list->GetMobID($entid6);
  		$mobnpc1 = $mob1->CastToNPC();
  		$mobnpc2 = $mob2->CastToNPC();
  		$mobnpc3 = $mob3->CastToNPC();
  		$mobnpc4 = $mob4->CastToNPC();
		$mobnpc5 = $mob5->CastToNPC();
		$mobnpc6 = $mob6->CastToNPC();
  		$mobnpc1->AddToHateList($npc->GetHateTop());
  		$mobnpc2->AddToHateList($npc->GetHateTop());
  		$mobnpc3->AddToHateList($npc->GetHateTop());
  		$mobnpc4->AddToHateList($npc->GetHateTop());
		$mobnpc5->AddToHateList($npc->GetHateTop());
		$mobnpc6->AddToHateList($npc->GetHateTop());
		quest::setnexthpevent(82);
	}
	if ($hpevent == 82) { 
		quest::depopall(215052);
  		$entid1 = quest::spawn2(215466,0,0,-480,240,1445.38,115.5); #A_Knight_of_Air
  		$entid2 = quest::spawn2(215466,0,0,-582,207,1460.5,115.5); #A_Knight_of_Air
  		$entid3 = quest::spawn2(215466,0,0,-550,217,1457.5,115.5); #A_Knight_of_Air
  		$entid4 = quest::spawn2(215434,0,0,-551.8,258.6,1455,115.5); #Rindaler_Egulrtan
		$entid5 = quest::spawn2(215466,0,0,-550,217,1457.5,115.5); #A_Knight_of_Air
		$entid6 = quest::spawn2(215466,0,0,-550,217,1457.5,115.5); #A_Knight_of_Air
  		$mob1 = $entity_list->GetMobID($entid1);
  		$mob2 = $entity_list->GetMobID($entid2);
  		$mob3 = $entity_list->GetMobID($entid3);
  		$mob4 = $entity_list->GetMobID($entid4);
  		$mobnpc1 = $mob1->CastToNPC();
  		$mobnpc2 = $mob2->CastToNPC();
  		$mobnpc3 = $mob3->CastToNPC();
  		$mobnpc4 = $mob4->CastToNPC();
  		$mobnpc1->AddToHateList($npc->GetHateTop());
  		$mobnpc2->AddToHateList($npc->GetHateTop());
  		$mobnpc3->AddToHateList($npc->GetHateTop());
  		$mobnpc4->AddToHateList($npc->GetHateTop());
		quest::setnexthpevent(66);
	}
	if ($hpevent == 66) { 
		quest::depopall(215049);
  		$entid1 = quest::spawn2(215464,0,0,-257,-294,1440.25,218.5); #An_Air_Phoenix_Scout
  		$entid2 = quest::spawn2(215464,0,0,-223,-251,1440.25,218.5); #An_Air_Phoenix_Scout
  		$entid3 = quest::spawn2(215464,0,0,-195,-213,1440.25,218.5); #An_Air_Phoenix_Scout
  		$entid4 = quest::spawn2(215440,0,0,-173,-290.7,1437.1,215.5); #Weruis_Herfadban
		$entid5 = quest::spawn2(215464,0,0,-195,-213,1440.25,218.5); #An_Air_Phoenix_Scout
		$entid6 = quest::spawn2(215464,0,0,-195,-213,1440.25,218.5); #An_Air_Phoenix_Scout
  		$mob1 = $entity_list->GetMobID($entid1);
  		$mob2 = $entity_list->GetMobID($entid2);
  		$mob3 = $entity_list->GetMobID($entid3);
  		$mob4 = $entity_list->GetMobID($entid4);
  		$mobnpc1 = $mob1->CastToNPC();
  		$mobnpc2 = $mob2->CastToNPC();
  		$mobnpc3 = $mob3->CastToNPC();
  		$mobnpc4 = $mob4->CastToNPC();
  		$mobnpc1->AddToHateList($npc->GetHateTop());
  		$mobnpc2->AddToHateList($npc->GetHateTop());
  		$mobnpc3->AddToHateList($npc->GetHateTop());
  		$mobnpc4->AddToHateList($npc->GetHateTop());
		quest::setnexthpevent(50);
	}
	if ($hpevent == 50) { 
		quest::depopall(215051);
  		$entid1 = quest::spawn2(215479,0,0,-296,323,1440.25,130.5); #Servant_of_Air
  		$entid2 = quest::spawn2(215479,0,0,-351,326,1443.25,130.5); #Servant_of_Air
  		$entid3 = quest::spawn2(215479,0,0,-407,329,1447.13,130.5); #Servant_of_Air
  		$entid4 = quest::spawn2(215445,0,0,-352.8,372.7,1440.35,130.5); #Wesreh_Galleantan
		$entid5 = quest::spawn2(215479,0,0,-407,329,1447.13,130.5); #Servant_of_Air
		$entid6 = quest::spawn2(215479,0,0,-407,329,1447.13,130.5); #Servant_of_Air
  		$mob1 = $entity_list->GetMobID($entid1);
  		$mob2 = $entity_list->GetMobID($entid2);
  		$mob3 = $entity_list->GetMobID($entid3);
  		$mob4 = $entity_list->GetMobID($entid4);
  		$mobnpc1 = $mob1->CastToNPC();
  		$mobnpc2 = $mob2->CastToNPC();
  		$mobnpc3 = $mob3->CastToNPC();
  		$mobnpc4 = $mob4->CastToNPC();
  		$mobnpc1->AddToHateList($npc->GetHateTop());
  		$mobnpc2->AddToHateList($npc->GetHateTop());
  		$mobnpc3->AddToHateList($npc->GetHateTop());
  		$mobnpc4->AddToHateList($npc->GetHateTop());
		quest::setnexthpevent(34);
	}
	if ($hpevent == 34) { 
		quest::depopall(215048);
  		$entid1 = quest::spawn2(215463,0,0,14,-280,1437.13,193); #A_Deadly_Cloudwalker
  		$entid2 = quest::spawn2(215463,0,0,-3,-231,1437.13,193); #A_Deadly_Cloudwalker
  		$entid3 = quest::spawn2(215463,0,0,-2,-187,1437.13,193); #A_Deadly_Cloudwalker
  		$entid4 = quest::spawn2(215437,0,0,39,-232.5,1437.13,193); #Huridaf_Vorgaasna
		$entid5 = quest::spawn2(215463,0,0,-2,-187,1437.13,193); #A_Deadly_Cloudwalker
		$entid6 = quest::spawn2(215463,0,0,-2,-187,1437.13,193); #A_Deadly_Cloudwalker
  		$mob1 = $entity_list->GetMobID($entid1);
  		$mob2 = $entity_list->GetMobID($entid2);
  		$mob3 = $entity_list->GetMobID($entid3);
  		$mob4 = $entity_list->GetMobID($entid4);
  		$mobnpc1 = $mob1->CastToNPC();
  		$mobnpc2 = $mob2->CastToNPC();
  		$mobnpc3 = $mob3->CastToNPC();
  		$mobnpc4 = $mob4->CastToNPC();
  		$mobnpc1->AddToHateList($npc->GetHateTop());
  		$mobnpc2->AddToHateList($npc->GetHateTop());
  		$mobnpc3->AddToHateList($npc->GetHateTop());
  		$mobnpc4->AddToHateList($npc->GetHateTop());
		quest::setnexthpevent(18);
	}
	if ($hpevent == 18) { 
		quest::depopall(215047);
  		$entid1 = quest::spawn2(215462,0,0,-1,371,1442.13,187); #A_Djinni_Air_Defender
  		$entid2 = quest::spawn2(215462,0,0,-5,427,1440.20,187); #A_Djinni_Air_Defender
  		$entid3 = quest::spawn2(215462,0,0,-12,481,1440.25,187); #A_Djinni_Air_Defender
  		$entid4 = quest::spawn2(215444,0,0,40.5,432.9,1437.13,187); #Nuquernal_Belegrodian
		$entid5 = quest::spawn2(215462,0,0,-12,481,1440.25,187); #A_Djinni_Air_Defender
		$entid6 = quest::spawn2(215462,0,0,-12,481,1440.25,187); #A_Djinni_Air_Defender
  		$mob1 = $entity_list->GetMobID($entid1);
  		$mob2 = $entity_list->GetMobID($entid2);
  		$mob3 = $entity_list->GetMobID($entid3);
  		$mob4 = $entity_list->GetMobID($entid4);
  		$mobnpc1 = $mob1->CastToNPC();
  		$mobnpc2 = $mob2->CastToNPC();
  		$mobnpc3 = $mob3->CastToNPC();
  		$mobnpc4 = $mob4->CastToNPC();
  		$mobnpc1->AddToHateList($npc->GetHateTop());
  		$mobnpc2->AddToHateList($npc->GetHateTop());
  		$mobnpc3->AddToHateList($npc->GetHateTop());
  		$mobnpc4->AddToHateList($npc->GetHateTop());
	}
	
}
sub EVENT_DEATH_COMPLETE {
	quest::spawn2(215438,0,0,$x,$y,$z,$h);
	quest::stoptimer("xego_wipe");
}

sub EVENT_COMBAT
	if ($combat_state == 1) {
		quest::stoptimer("xego_wipe");
	} else {
		quest::settimer("xego_wipe",60);
}

sub EVENT_TIMER {
	if ($timer eq "xego_wipe") {	
		quest::depopall(215465);
		quest::depopall(215472);
		quest::depopall(215466);
		quest::depopall(215434);
		quest::depopall(215464);
		quest::depopall(215440);
		quest::depopall(215479);
		quest::depopall(215445);
		quest::depopall(215463);
		quest::depopall(215437);
		quest::depopall(215462);
		quest::depopall(215444);
		quest::depop();
		quest::stoptimer("xego_wipe");
		
		quest::spawn2(215056,0,0,64,24.70,1467.4,193.4);			
	}
}	
