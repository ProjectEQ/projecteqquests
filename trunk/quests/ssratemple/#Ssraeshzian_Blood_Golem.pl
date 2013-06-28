#BEGIN File: ssratemple\#Ssraeshzian_Blood_Golem.pl

sub EVENT_AGGRO {
  my $guard1 = $entity_list->GetNPCByNPCTypeID(162123); #Heriz
  my $guard2 = $entity_list->GetNPCByNPCTypeID(162124); #Yasiz
  my $guard3 = $entity_list->GetNPCByNPCTypeID(162125); #Zlakas
  my $guard4 = $entity_list->GetNPCByNPCTypeID(162126); #Nilasz
  my $guard5 = $entity_list->GetNPCByNPCTypeID(162127); #Skzik
  my $guard6 = $entity_list->GetNPCByNPCTypeID(162128); #Grziz
  my $guard7 = $entity_list->GetNPCByNPCTypeID(162129); #Slakiz
  my $guard8 = $entity_list->GetNPCByNPCTypeID(162130); #Klazaz

  if ($guard1) {
    $guard1->AddToHateList($client, 1);
  }
  if ($guard2) {
    $guard2->AddToHateList($client, 1);
  }
  if ($guard3) {
    $guard3->AddToHateList($client, 1);
  }
  if ($guard4) {
    $guard4->AddToHateList($client, 1);
  }
  if ($guard5) {
    $guard5->AddToHateList($client, 1);
  }
  if ($guard6) {
    $guard6->AddToHateList($client, 1);
  }
  if ($guard7) {
    $guard7->AddToHateList($client, 1);
  }
  if ($guard8) {
    $guard8->AddToHateList($client, 1);
  }
}

sub EVENT_SIGNAL {
  my $new_guard = $entity_list->GetNPCByNPCTypeID($signal);
  my $hate_target = $npc->GetHateTop();

  $new_guard->AddToHateList($hate_target->CastToClient(), 1);
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(162260,1,0); #EmpCycle
}

#END File: ssratemple\#Ssraeshzian_Blood_Golem.pl (162064)