sub EVENT_DEATH_COMPLETE_COMPLETE {
  if($entity_list->GetMobByNpcTypeID(71009)) {
    quest::updatespawntimer(2624,1000); #update to respawn in 1 sec if vanquisher are still up
  }
}
