sub EVENT_DEATH {
  if($entity_list->GetMobByNpcTypeID(71009)) {
    quest::updatespawntimer(2623,1000); #update to respawn in 1 sec if vanquisher are still up
  }
}
