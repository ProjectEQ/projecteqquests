sub EVENT_DEATH_COMPLETE {
  if($entity_list->GetMobByNpcTypeID(71009) || $entity_list->GetMobByNpcTypeID(71008) || $entity_list->GetMobByNpcTypeID(71007) || $entity_list->GetMobByNpcTypeID(71015) || $entity_list->GetMobByNpcTypeID(71011) || $entity_list->GetMobByNpcTypeID(71010) || $entity_list->GetMobByNpcTypeID(71014)) {
    quest::updatespawntimer(2631,1000); #update to respawn in 1 sec if any spiroc except for lord are still up
  }
}
