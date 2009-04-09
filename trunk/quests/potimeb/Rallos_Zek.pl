#Fake Rallos will be our time keeper and signal phase trigger when the armies are down.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("rallos",10);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "rallos") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223198);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223197);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223199);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223200);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223002);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223003);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223194);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223195);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223196);
    if ($check_boss) {
      $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223158,13080,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("rallos");
     quest::depop();
}
 }