# link eashen and its guards to chain aggro when one is pulled
#

sub EVENT_AGGRO {
  my $guard1 = $entity_list->GetMobByNpcTypeID(124057); #belijor
  my $guard2 = $entity_list->GetMobByNpcTypeID(124089); #nelaarn
  my $guard3 = $entity_list->GetMobByNpcTypeID(124056); #yendilor
  my $guard4 = $entity_list->GetMobByNpcTypeID(124004); #eashen
  if ($guard1) {
    my $call_guard1 = $guard1->CastToNPC();
    $call_guard1->AddToHateList($client, 1);
  }
  if ($guard2) {
    my $call_guard2 = $guard2->CastToNPC();
    $call_guard2->AddToHateList($client, 1);
  }
  if ($guard3) {
    my $call_guard3 = $guard3->CastToNPC();
    $call_guard3->AddToHateList($client, 1);
  }
  if ($guard4) {
    my $call_guard4 = $guard4->CastToNPC();
    $call_guard4->AddToHateList($client, 1);
  }
}

# EOF zone: templeveeshan ID: 124088 NPC: Ajorek_the_Crimson_Fang

