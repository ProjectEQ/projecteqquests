sub EVENT_CLICKDOOR {
  if($doorid == 41) {
    my @npc_list = $entity_list->GetNPCList();
    foreach $npc (@npc_list) {
      if($npc->GetNPCTypeID() == 296069) {
        $npc->AddToHateList($client, 1);
      }
    }      
  }
}