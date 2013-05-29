sub EVENT_DEATH {
  if($entity_list->GetMobByNpcTypeID(71009)) {
    quest::updatespawntimer(2632,1000); #a_spiroc_caller
  }
}
