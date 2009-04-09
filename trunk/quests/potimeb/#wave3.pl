#Wave 3 counter.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("wave3",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "wave3") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223033);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223034);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223035);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223036);
    if ($check_boss) {
      $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223154,11038,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("wave3");
     quest::depop();
}
 }