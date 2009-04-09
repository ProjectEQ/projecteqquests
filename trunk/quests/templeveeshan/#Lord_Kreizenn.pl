# link lord kreizenn and guards
#

sub EVENT_AGGRO {
  my $guard1 = $entity_list->GetMobByNpcTypeID(124093); #kedrak
  my $guard2 = $entity_list->GetMobByNpcTypeID(124094); #carx`vean
  if ($guard1) {
    my $call_guard1 = $guard1->CastToNPC();
    $call_guard1->AddToHateList($client, 1);
  }
  if ($guard2) {
    my $call_guard2 = $guard2->CastToNPC();
    $call_guard2->AddToHateList($client, 1);
  }
}

# EOF zone: templeveeshan ID: 124074 NPC: #Lord_Kreizenn

