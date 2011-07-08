sub EVENT_AGGRO {
  quest::settimer(1,5);
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    $npc->SetHP($npc->GetHP() + ($npc->GetMaxHP() / 10));
  }
}

sub EVENT_TIMER {
  if(!$entity_list->GetMobByNpcTypeID(295145) && !$entity_list->GetMobByNpcTypeID(295146) && !$entity_list->GetMobByNpcTypeID(295147) && !$entity_list->GetMobByNpcTypeID(295148)) {
    quest::spawn2(295145,0,0,-216,-191,-467,192);
    quest::spawn2(295146,0,0,-316,-181,-464,64);
    quest::spawn2(295147,0,0,-243,-250,-439,248);
    quest::spawn2(295148,0,0,-357,-275,-435,25);
  }
}
