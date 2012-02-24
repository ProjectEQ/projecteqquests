sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Carefully continue on your journey, you will need a key.");
    if(!$entity_list->GetMobByNpcTypeID(289047)){ #aneuk_trigger
      quest::spawn2(289047,0,0,-793,1592,539,0); #aneuk_trigger
    }
    #update zone status
    my $instid = quest::GetInstanceID("tipt",0);
    quest::setglobal($instid.'_tipt_status',6,7,"H6");
    $npc->Depop(0);
  }
}