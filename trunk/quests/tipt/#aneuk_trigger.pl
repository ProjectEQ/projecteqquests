my $instid = 0;

sub EVENT_SIGNAL {
  if ($signal > 29 ) {
    $instid = $signal;
    SPAWN_NAMED_ANEUK();
  }
}

sub SPAWN_NAMED_ANEUK {
  #spawn if no an_aneuk_ebonspirit's are up.
  if(!$entity_list->GetMobByNpcTypeID(289002) && !$entity_list->GetMobByNpcTypeID(289038)) {
    quest::spawn2(289038,0,0,-804,1583,538,121); #an_aneuk_fleshweaver
    quest::setglobal($instid.'_tipt_status',7,7,"H6");
    quest::stoptimer(1);
    $npc->Depop(0);
  } else {
    quest::settimer(1,5);
  }
}

sub EVENT_TIMER {
  if($timer == 1 && $instid != 0) {
    SPAWN_GARJAH();
  }
}