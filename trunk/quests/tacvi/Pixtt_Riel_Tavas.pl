sub EVENT_SPAWN {
  quest::setnexthpevent(91);
}

sub EVENT_AGGRO {
  quest::say("You shall regret trespassing into my chambers. Rise my minions and show them how well I have learned to use the power of this land's creatures. Destroy them all. Leave only enough to feed the hounds.");
  }

sub EVENT_HP {
  if($hpevent == 91) {
    quest::emote("raises her hands to the sky and laughs as the door behind you seals itself.");
    $entity_list->FindDoor(17)->SetLockPick(-1);  #locks door to room
    $entity_list->FindDoor(22)->SetLockPick(-1);  #locks door to room
    $entity_list->FindDoor(23)->SetLockPick(-1);  #locks door to room
    quest::setnexthpevent(51);
  }
  if($hpevent == 51) {
    quest::say("So it seems you are not so easily defeated after all. I am through toying with you fools. Prepare for the reality of death.' Riel's body begins to speed up as her attacks become increasingly vicious.");
    quest::setnexthpevent(31);
    quest::modifynpcstat("attack_speed",-40);
  }    
  if($hpevent == 31) {
    quest::say("You and your friends are starting to annoy me. Come forth my little experiments choose one of these fools and show them the surprise you have waiting.");
    quest::settimer(1,60);
    quest::spawn2(298045,0,0,157,-586,-7,62);  #unstable construct
    quest::spawn2(298045,0,0,171,-553,-7,123);  
    quest::spawn2(298045,0,0,175,-619,-7,253);  
    quest::spawn2(298045,0,0,217,-589,-7,194);  
    quest::setnexthpevent(11);
    $npc->AddAISpell(751);  #adds spell ikaav venom
  }
  if($hpevent == 11) {
    quest::say("That's it! You have past the point of being bothersome. I grow weary of this encounter. It is time for it to end.");
    quest::modifynpcstat("attack_speed",-62);
  }
}

sub EVENT_TIMER {
    quest::spawn2(298045,0,0,157,-586,-7,62);  #unstable construct
    quest::spawn2(298045,0,0,171,-553,-7,123);  
    quest::spawn2(298045,0,0,175,-619,-7,253);  
    quest::spawn2(298045,0,0,217,-589,-7,194);  
}

sub EVENT_DEATH_COMPLETE {
  quest::ze(15,"Impossible!");  #need live text
  $entity_list->FindDoor(17)->SetLockPick(0);  #unlocks door to room
  $entity_list->FindDoor(22)->SetLockPick(0);  #unlocks door to room
  $entity_list->FindDoor(23)->SetLockPick(0);  #unlocks door to room
  quest::stoptimer(1);
}