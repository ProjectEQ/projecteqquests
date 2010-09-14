# Monk Epic 1.0
sub EVENT_SPAWN {
  quest::settimer("appearance", 1);
}

sub EVENT_TIMER {
  quest::stoptimer("appearance");
  $npc->SetAppearance(3);
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("yawns, and utters some gibberish, then falls back asleep.");
  }
}

sub EVENT_ITEM {
  if((plugin::check_handin(\%itemcount, 1685 => 1)) && ($ulevel >= 46) && ($class eq "Monk")) { #Breath of Gwan
    $npc->SetAppearance(0);
    quest::say("Your path of wanton destruction ends here. Gwan and Eejag were impatient and hot-headed. You will not defeat me, for I have the patience and perseverance of stone, unlike the children you have beaten before me. Are you sure you want to challenge me?");
    $trunt = quest::spawn2(107161,0,0,$x,$y,$z,$h); #Trunt
    $npcobj = $entity_list->GetMobID($trunt);
    $truntnpc = $npcobj->CastToNPC();
    $truntnpc->AddToHateList($client,1);
    quest::depop();
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
# End of File