sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("depop2",1);
}

sub EVENT_TIMER {
    $check = 0;
    if($timer eq "depop2" && defined $qglobals{poeb_warlord}) {
    quest::stoptimer("depop2");
    quest::depop();
    }
    if($timer eq "depop2" && !defined $qglobals{poeb_warlord}) {
    quest::stoptimer("depop2");
    quest::settimer("galronor",1);
    }
    if($timer eq "galronor") {
    $check_boss = $entity_list->GetMobByNpcTypeID(222000);#rock_studded_champ
    if ($check_boss) {
      $check = 1
    }
    if($check == 0) {
	quest::spawn2(222018,0,0,$x,$y,$z,$h); 
        quest::stoptimer("galronor");
        quest::depop();
	}
    if ($check == 1) {
      
      }
    }
}     

