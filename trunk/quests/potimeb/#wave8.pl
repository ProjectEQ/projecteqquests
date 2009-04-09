#Wave 8 counter.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("wave8",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "wave8") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223067);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223068);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223069);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223070);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223071);
        if ($check_boss) {
          $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223072);
            if ($check_boss) {
              $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223154,11088,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("wave8");
     quest::depop();
}
 }