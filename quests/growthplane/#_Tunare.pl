#depops and pops real Tunare outside tree when attacked.

sub EVENT_ATTACK {
  my $tsprite_mob = $entity_list->GetMobByNpcTypeID(127000);
  my $minitunare_mob = $entity_list->GetMobByNpcTypeID(127001);
  my $pog_mob = $entity_list->GetMobByNpcTypeID(127002);
  my $pogb_mob = $entity_list->GetMobByNpcTypeID(127003);
  my $tfocuser_mob = $entity_list->GetMobByNpcTypeID(127005);
  my $guardian_mob = $entity_list->GetMobByNpcTypeID(127007);
  my $sfwolf_mob = $entity_list->GetMobByNpcTypeID(127008);
  my $rtreant_mob = $entity_list->GetMobByNpcTypeID(127013);
  my $mctreant_mob = $entity_list->GetMobByNpcTypeID(127014);
  my $undogo_mob = $entity_list->GetMobByNpcTypeID(127015);
  my $keeper_mob = $entity_list->GetMobByNpcTypeID(127016);
  my $sarik_mob = $entity_list->GetMobByNpcTypeID(127017);
  my $fayl_mob = $entity_list->GetMobByNpcTypeID(127018);
  my $rroot_mob = $entity_list->GetMobByNpcTypeID(127019);
  my $ali_mob = $entity_list->GetMobByNpcTypeID(127020);
  my $treah_mob = $entity_list->GetMobByNpcTypeID(127021);
  my $grahl_mob = $entity_list->GetMobByNpcTypeID(127022);
  my $galiel_mob = $entity_list->GetMobByNpcTypeID(127023);
  my $sfspirit_mob = $entity_list->GetMobByNpcTypeID(127024);
  my $ppuma_mob = $entity_list->GetMobByNpcTypeID(127029);
  my $ttreant_mob = $entity_list->GetMobByNpcTypeID(127030);
  my $afspirit_mob = $entity_list->GetMobByNpcTypeID(127031);
  my $gslight_mob = $entity_list->GetMobByNpcTypeID(127034);
  my $gtakish_mob = $entity_list->GetMobByNpcTypeID(127035);
  my $gpower_mob = $entity_list->GetMobByNpcTypeID(127037);
  my $ordro_mob = $entity_list->GetMobByNpcTypeID(127040);
  my $melder_mob = $entity_list->GetMobByNpcTypeID(127042);
  my $atotem_mob = $entity_list->GetMobByNpcTypeID(127047);
  my $sprot_mob = $entity_list->GetMobByNpcTypeID(127054);
  my $fsuni_mob = $entity_list->GetMobByNpcTypeID(127093);
  my $prince_mob = $entity_list->GetMobByNpcTypeID(127096);
     quest::spawn2(127098,0,0,-247,1609,-40,424);
     quest::depop();

  if ($tsprite_mob) {
    my $tsprite_mobnpc = $tsprite_mob->CastToNPC();
    $tsprite_mobnpc->AddToHateList($client, 1);
  }
  if ($minitunare_mob) {
    my $minitunare_mobnpc = $minitunare_mob->CastToNPC();
    $minitunare_mobnpc->AddToHateList($client, 1);
  }
  if ($pog_mob) {
    my $pog_mobnpc = $pog_mob->CastToNPC();
    $pog_mobnpc->AddToHateList($client, 1);
  }
  if ($pogb_mob) {
    my $pog_mobnpc = $pogb_mob->CastToNPC();
    $pog_mobnpc->AddToHateList($client, 1);
  }
  if ($tfocuser_mob) {
    my $tfocuser_mobnpc = $tfocuser_mob->CastToNPC();
    $tfocuser_mobnpc->AddToHateList($client, 1);
  }
  if ($guardian_mob) {
    my $guardian_mobnpc = $guardian_mob->CastToNPC();
    $guardian_mobnpc->AddToHateList($client, 1);
  }
  if ($sfwolf_mob) {
    my $sfwolf_mobnpc = $sfwolf_mob->CastToNPC();
    $sfwolf_mobnpc->AddToHateList($client, 1);
  }
  if ($rtreant_mob) {
    my $rtreant_mobnpc = $rtreant_mob->CastToNPC();
    $rtreant_mobnpc->AddToHateList($client, 1);
  }
  if ($mctreant_mob) {
    my $mctreant_mobnpc = $mctreant_mob->CastToNPC();
    $mctreant_mobnpc->AddToHateList($client, 1);
  }
  if ($undogo_mob) {
    my $undogo_mobnpc = $undogo_mob->CastToNPC();
    $undogo_mobnpc->AddToHateList($client, 1);
  }
  if ($keeper_mob) {
    my $keeper_mobnpc = $keeper_mob->CastToNPC();
    $keeper_mobnpc->AddToHateList($client, 1);
  }
  if ($sarik_mob) {
    my $sarik_mobnpc = $sarik_mob->CastToNPC();
    $sarik_mobnpc->AddToHateList($client, 1);
  }
  if ($fayl_mob) {
    my $fayl_mobnpc = $fayl_mob->CastToNPC();
    $fayl_mobnpc->AddToHateList($client, 1);
  }
  if ($rroot_mob) {
    my $rroot_mobnpc = $rroot_mob->CastToNPC();
    $rroot_mobnpc->AddToHateList($client, 1);
  }
  if ($ali_mob) {
    my $ali_mobnpc = $ali_mob->CastToNPC();
    $ali_mobnpc->AddToHateList($client, 1);
  }
  if ($treah_mob) {
    my $treah_mobnpc = $treah_mob->CastToNPC();
    $treah_mobnpc->AddToHateList($client, 1);
  }
  if ($grahl_mob) {
    my $grahl_mobnpc = $grahl_mob->CastToNPC();
    $grahl_mobnpc->AddToHateList($client, 1);
  }
  if ($galiel_mob) {
    my $galiel_mobnpc = $galiel_mob->CastToNPC();
    $galiel_mobnpc->AddToHateList($client, 1);
  }
  if ($sfspirit_mob) {
    my $sfspirit_mobnpc = $sfspirit_mob->CastToNPC();
    $sfspirit_mobnpc->AddToHateList($client, 1);
  }
  if ($ppuma_mob) {
    my $ppuma_mobnpc = $ppuma_mob->CastToNPC();
    $ppuma_mobnpc->AddToHateList($client, 1);
  }
  if ($ttreant_mob) {
    my $ttreant_mobnpc = $ttreant_mob->CastToNPC();
    $ttreant_mobnpc->AddToHateList($client, 1);
  }
  if ($afspirit_mob) {
    my $afspirit_mobnpc = $afspirit_mob->CastToNPC();
    $afspirit_mobnpc->AddToHateList($client, 1);
  }
  if ($gslight_mob) {
    my $gslight_mobnpc = $gslight_mob->CastToNPC();
    $gslight_mobnpc->AddToHateList($client, 1);
  }
  if ($gtakish_mob) {
    my $gtakish_mobnpc = $gtakish_mob->CastToNPC();
    $gtakish_mobnpc->AddToHateList($client, 1);
  }
  if ($gpower_mob) {
    my $gpower_mobnpc = $gpower_mob->CastToNPC();
    $gpower_mobnpc->AddToHateList($client, 1);
  }
  if ($ordro_mob) {
    my $ordro_mobnpc = $ordro_mob->CastToNPC();
    $ordro_mobnpc->AddToHateList($client, 1);
  }
  if ($melder_mob) {
    my $melder_mobnpc = $melder_mob->CastToNPC();
    $melder_mobnpc->AddToHateList($client, 1);
  }
  if ($atotem_mob) {
    my $atotem_mobnpc = $atotem_mob->CastToNPC();
    $atotem_mobnpc->AddToHateList($client, 1);
  }
  if ($sprot_mob) {
    my $sprot_mobnpc = $sprot_mob->CastToNPC();
    $sprot_mobnpc->AddToHateList($client, 1);
  }
  if ($fsuni_mob) {
    my $fsuni_mobnpc = $fsuni_mob->CastToNPC();
    $fsuni_mobnpc->AddToHateList($client, 1);
  }
  if ($prince_mob) {
    my $prince_mobnpc = $prince_mob->CastToNPC();
    $prince_mobnpc->AddToHateList($client, 1);
  }
}