sub EVENT_SPAWN {
quest::depopall(124021);
quest::depopall(124080);
quest::depopall(124157);
quest::spawn2(124157,0,0,-796,564,129,102);
quest::spawn2(124157,0,0,-800,510,129,66);
quest::spawn2(124157,0,0,-796,463,129,33);
quest::spawn2(124157,0,0,-680,509,129,190);
quest::spawn2(124157,0,0,-687,562,129,160);
quest::spawn2(124157,0,0,-680,461,129,224);
}

sub EVENT_AGGRO {
  my $guards = $entity_list->GetMobByNpcTypeID(124157);

  if ($guards) {
  my $guards = $guards->CastToNPC();
  $guards->AddToHateList($client, 1);
}
 }