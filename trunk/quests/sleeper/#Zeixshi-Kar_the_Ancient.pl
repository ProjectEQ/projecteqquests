sub EVENT_SPAWN {
quest::settimer("zeixshi",1);
  }

sub EVENT_TIMER { 
$kerafyrm = $entity_list->GetMobByNpcTypeID(128089);
if ($timer eq "zeixshi") {
if ($kerafyrm) {
  quest::stoptimer("zeixshi");
  quest::depop();
  } 
   }
    }