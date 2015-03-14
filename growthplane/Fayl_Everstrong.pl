# Call entoling mobs to attack $client on aggro of Fayl Everstrong

sub EVENT_AGGRO {
  my $entollingculler_mob = $entity_list->GetMobByNpcTypeID(127027);
  my $entolingchannel_mob = $entity_list->GetMobByNpcTypeID(127028);
  my $entolingchannel2_mob = $entity_list->GetMobByNpcTypeID(127103);
  my $entolingconduit_mob = $entity_list->GetMobByNpcTypeID(127057);
  my $entolingconduit2_mob = $entity_list->GetMobByNpcTypeID(127102);
  my $entolingharvester_mob = $entity_list->GetMobByNpcTypeID(127026);

  if ($entollingculler_mob) {
    my $entollingculler_mobnpc = $entollingculler_mob->CastToNPC();
    $entollingculler_mobnpc->AddToHateList($client, 1);
  }
  if ($entolingchannel_mob) {
    my $entolingchannel_mobnpc = $entolingchannel_mob->CastToNPC();
    $entolingchannel_mobnpc->AddToHateList($client, 1);
  }
  if ($entolingchannel2_mob) {
    my $entolingchannel2_mobnpc = $entolingchannel2_mob->CastToNPC();
    $entolingchannel2_mobnpc->AddToHateList($client, 1);
  }
  if ($entolingconduit_mob) {
    my $entolingconduit_mobnpc = $entolingconduit_mob->CastToNPC();
    $entolingconduit_mobnpc->AddToHateList($client, 1);
  }
  if ($entolingconduit2_mob) {
    my $entolingconduit2_mobnpc = $entolingconduit2_mob->CastToNPC();
    $entolingconduit2_mobnpc->AddToHateList($client, 1);
  }
  if ($entolingharvester_mob) {
    my $entolingharvester_mobnpc = $entolingharvester_mob->CastToNPC();
    $entolingharvester_mobnpc->AddToHateList($client, 1);
  }
}

# EOF zone: growthplane ID: 127018 NPC: Fayl_Everstrong

