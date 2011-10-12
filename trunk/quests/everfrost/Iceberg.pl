sub EVENT_SPAWN {
  quest::settimer("follow", 1);
}

sub EVENT_TIMER{
  if ($timer eq "follow"){
    my $OpponentID = 30061;
    my $getmobbynpctype = $entity_list->GetMobByNpcTypeID($OpponentID);
    my $follow_target = $getmobbynpctype->GetID();
    quest::follow($follow_target);
    quest::stoptimer("follow");
  }
}

sub EVENT_ITEM { 
if($itemcount{12221} == 1){
quest::say("Growlll");
quest::summonitem(12226); }
}
#END of FILE Zone:everfrost  ID:30046 -- Iceberg 

