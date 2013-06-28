sub EVENT_SPAWN {
  quest::setnexthpevent(91);
}

sub EVENT_AGGRO {
  quest::say("Have at you intruder. This is the domain of the commander and only those strong enough to beat me shall pass.");
  quest::settimer(1,15);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::emote("begins to froth at the mouth as her skin becomes more rigid and her rage begins to grow. You feel a force from behind you as the door is once again sealed.");
  $entity_list->FindDoor(2)->SetLockPick(-1);  #locks door to room
  $entity_list->FindDoor(3)->SetLockPick(-1);  #locks door to room
  $entity_list->FindDoor(4)->SetLockPick(-1);  #locks door to room
}

sub EVENT_HP {
  if($hpevent == 91) {
    quest::modifynpcstat("runspeed",2);  #no longer rooted
    quest::setnexthpevent(51);
  }
  if($hpevent == 51) {
    quest::setnexthpevent(31);
    quest::spawn2(298044,0,0,145,-219,-7,207);  #juxtapincer
    quest::spawn2(298043,0,0,143,-182,-7,188);  #lifebleeder
    quest::spawn2(298042,0,0,139,-130,-7,172);  #manasipper
    quest::spawn2(298041,0,0,117,-108,-7,155);  #ragehound
    quest::modifynpcstat("special_attacks",SEFUMCNIDfr);  #adds ae rampage
    $npc->AddAISpell(4729);  #adds spell spirit cleaver
    $npc->AddAISpell(4728);  #adds spell wave of rage
  }
  if($hpevent == 31) {
    quest::say("I commend you on your tenacity, infidels. However I am through playing games. Witness the true fighting power of an Ixt Berserker.");
    quest::setnexthpevent(11);
    quest::modifynpcstat("min_hit",2500);  #increase min hit, no hard data on what should happen
  }
  if($hpevent == 11) {
    quest::say("You may yet have the strength to defeat me but I am not through with you yet.");
    quest::emote("eyes turn blood red as she enters an uncontrollable rage. Focusing on her wounds, she begins to recover some health.");
    $npc->SetHP(920000);
    $npc->BuffFadeAll();
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::ze(15,"Swinging her weapon one last time, the massive entity falls to her side with a thud. While she was a creature consumed with destruction, her death is still graceful. As her bloodstained braids come to a rest on the floor and her muscles relax, you can't help but wonder what could make such a magnificent creature so deadly.");
  $entity_list->FindDoor(2)->SetLockPick(0);  #unlocks door to room
  $entity_list->FindDoor(3)->SetLockPick(0);  #unlocks door to room
  $entity_list->FindDoor(4)->SetLockPick(0);  #unlocks door to room
}