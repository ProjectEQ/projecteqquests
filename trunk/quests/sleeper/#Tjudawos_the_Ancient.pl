sub EVENT_SPAWN {
quest::settimer("tjudawos",1);
  }

sub EVENT_TIMER { 
$kerafyrm = $entity_list->GetMobByNpcTypeID(128089);
if ($timer eq "tjudawos") {
if ($kerafyrm) {
  quest::stoptimer("tjudawos");
  quest::depop();
  } 
   }
    }