sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("looks to you with eternal eyes. 'I am most impressed with your skill and courage. This pass has not been for the weak-willed for quite some time. My kin and I have hope that perhaps you and your party can hold fast and bring forth some sort of justice to those that have done this to us. Go forth with our blessing. The top of the pass is heavily guarded, but there is a key. I trust that you shall find it. Make haste!'");
    if(!$entity_list->IsMobSpawnedByNpcTypeID(289047)){ #aneuk_trigger
      quest::spawn2(289047,0,0,-793,1592,539,0); #aneuk_trigger
    }
    #update zone status
    my $instid = quest::GetInstanceID("tipt",0);
    quest::setglobal($instid.'_tipt_status',6,7,"H6");
    $npc->Depop(0);
  }
}