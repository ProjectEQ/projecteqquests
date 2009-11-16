sub EVENT_SAY { 
  if($text=~/hail/i) { 
    quest::say("Greetings and welcome to Thurgadin, $name. Ye best watch yer step on the bridge there, it can be a bit slippery."); 
    if (defined($entity_list->GetMobByNpcTypeID(115132))) { #Make sure the mob is there or you get an undefined error. 
       $entity_list->GetMobByNpcTypeID(115132)->Say("Aye, we wouldn't want ye fallin into the pit now would we."); #Make Guard Baldvin also talk. 
    } 
  } 
} 

sub EVENT_ITEM { 
  quest::say("I have no need for this $name, you can have it back."); 
  plugin::return_items(\%itemcount); 
} 
#END of FILE Zone:thurgadina  ID:115133 -- Guard_Dagur