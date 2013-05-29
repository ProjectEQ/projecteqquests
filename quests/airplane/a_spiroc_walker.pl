sub EVENT_DEATH {
  if(!$entity_list->GetMobByNpcTypeID(71009)) {
    quest::updatespawntimer(157334 ,1000); #a_spiroc_walker
  }
}
