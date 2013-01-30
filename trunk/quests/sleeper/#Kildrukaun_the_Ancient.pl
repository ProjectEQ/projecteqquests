sub EVENT_SPAWN {
quest::settimer("kildrukaun",1);
  }

sub EVENT_TIMER { 
$kerafyrm = $entity_list->GetMobByNpcTypeID(128089);
if ($timer eq "kildrukaun") {
if ($kerafyrm) {
  quest::stoptimer("kildrukaun");
  quest::depop_withtimer();
  } 
   }
    }
