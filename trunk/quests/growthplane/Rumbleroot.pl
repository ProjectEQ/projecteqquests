# Call wisp mobs to attack $client on aggro of Rumbleroot

sub EVENT_AGGRO {
  my $wisp_mob = $entity_list->GetMobByNpcTypeID(127024);
  my $wisp2_mob = $entity_list->GetMobByNpcTypeID(127025);
  my $wisp3_mob = $entity_list->GetMobByNpcTypeID(127031);

  if ($wisp_mob) {
    my $wisp_mobnpc = $wisp_mob->CastToNPC();
    $wisp_mobnpc->AddToHateList($client, 1);
  }
  if ($wisp2_mob) {
    my $wisp2_mobnpc = $wisp2_mob->CastToNPC();
    $wisp2_mobnpc->AddToHateList($client, 1);
  }
  if ($wisp3_mob) {
    my $wisp3_mobnpc = $wisp3_mob->CastToNPC();
    $wisp3_mobnpc->AddToHateList($client, 1);
  }
}

# EOF zone: growthplane ID: 127019 NPC: Rumbleroot

