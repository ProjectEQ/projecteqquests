sub EVENT_SAY {
 if($client->GetGlobal("monk_epic") ==3 && $text=~/hail/i) { 
  # Monk Epic 1.5
  quest::me("As you approach Wygrish you can see him meditating with a small ripped book in his grasp. As you pass him by he raises his eyes and stares at you before going back into meditation.");
  quest::say("I see you wear the Celestial Mark! I know why you are here and you cant have it back! I will fight you with all that I am to prevent losing the diary!");
	$npc->SetSpecialAbility(19,0);
	$npc->SetSpecialAbility(20,0);
	$npc->SetSpecialAbility(21,0);
	$npc->SetSpecialAbility(24,0);
	$npc->SetSpecialAbility(25,0);
	$npc->AddToHateList($client, 1);
  }
 }


#NpcID: Wygrish - Zone: sirens
#AddToDropTable - ItemID: 48109 - ItemName: 1/2 of Kaiaren's Diary - Lore: Right Half - DropRate: 100%
#End of File