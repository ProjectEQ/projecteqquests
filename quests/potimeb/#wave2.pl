#Wave 2 counter.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("wave2",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "wave2") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223026);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223027);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223028);
    if ($check_boss) {
       $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223029);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223030);
    if ($check_boss) {
        $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223154,11028,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("wave2");
     quest::depop();
}
 }