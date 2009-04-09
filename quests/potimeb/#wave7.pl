#Wave 7 counter.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("wave7",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "wave7") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223059);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223060);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223061);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223062);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223063);
        if ($check_boss) {
          $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223064);
            if ($check_boss) {
              $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223154,11078,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("wave7");
     quest::depop();
}
 }