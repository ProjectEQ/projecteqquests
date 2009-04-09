#Wave 4 counter.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("wave4",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "wave4") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223039);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223040);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223041);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223042);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223043);
        if ($check_boss) {
          $check = 1
        }
        $check_boss = $entity_list->GetMobByNpcTypeID(223044);
        if ($check_boss) {
          $check = 1 
        }
        $check_boss = $entity_list->GetMobByNpcTypeID(223045);
        if ($check_boss) {
          $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223154,11048,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("wave4");
     quest::depop();
}
 }