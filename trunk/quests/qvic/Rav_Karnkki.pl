sub EVENT_DEATH_COMPLETE {
  quest::signalwith(295130,1);
}

sub EVENT_ATTACK {
  #a pet does not trigger EVENT_AGGRO but does trigger EVENT_ATTACK
  AGGRO_ALL($userid);
}

sub EVENT_AGGRO {
  #a pet does not trigger EVENT_AGGRO but does trigger EVENT_ATTACK
  AGGRO_ALL($userid);
}

sub AGGRO_ALL {
  my $pc = $entity_list->GetMobByID($_[0]);
  if (!$pc->IsClient()) {
    #if the $pc is not a client, assume it is a pet and get the owner
	$pc = $entity_list->GetClientByID($pc->GetOwnerID());
  }
  #add $pc to everyone's hate list (including my own in case it was a pet)
  $entity_list->GetMobByNpcTypeID(295131)->AddToHateList($pc,1,0);
  $entity_list->GetMobByNpcTypeID(295132)->AddToHateList($pc,1,0);
  $entity_list->GetMobByNpcTypeID(295133)->AddToHateList($pc,1,0);
}