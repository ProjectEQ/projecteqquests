sub EVENT_DEATH {
  if($entity_list->GetMobByNpcTypeID(71009)) {
    quest::updatespawntimer(2631,1000); #The_Spiroc_Guardian
  }
}
