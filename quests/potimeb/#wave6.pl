#Wave 6 counter.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("wave6",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "wave6") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223052);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223053);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223054);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223055);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223056);
        if ($check_boss) {
          $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223154,11068,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("wave6");
     quest::depop();
}
 }