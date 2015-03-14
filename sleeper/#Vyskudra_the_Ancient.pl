sub EVENT_SPAWN {
quest::settimer("vyskudra",1);
  }

sub EVENT_TIMER { 
$kerafyrm = $entity_list->GetMobByNpcTypeID(128089);
if ($timer eq "vyskudra") {
if ($kerafyrm) {
  quest::stoptimer("vyskudra");
  quest::depop_withtimer();
  } 
   }
    }