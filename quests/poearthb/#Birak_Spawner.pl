sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("depop1",1);
}

sub EVENT_TIMER {
    $check = 0;
    if($timer eq "depop1" && $qglobals{poeb_warlord} == 1) {
    quest::stoptimer("depop1");
    quest::depop();
    }
    if($timer eq "depop1" && $qglobals{poeb_warlord} != 1) {
    quest::stoptimer("depop1");
    quest::settimer("birak",1);
    }
    if($timer eq "birak") {
    $check_boss = $entity_list->GetMobByNpcTypeID(222001);#stonefist_clansman
    if ($check_boss) {
      $check = 1
    }
    if($check == 0) {
	quest::spawn2(222017,0,0,$x,$y,$z,$h); 
        quest::stoptimer("birak");
        quest::depop();
	}
    if ($check == 1) {
      
      }
    }
}     

