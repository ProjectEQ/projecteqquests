sub EVENT_DEATH {
  if($entity_list->GetMobByNpcTypeID(71009)) {
    quest::updatespawntimer(2624,1000); #a_spiroc_arbiter
  }
}
