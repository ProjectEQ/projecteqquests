#Wave 1 counter.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("wave1",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "wave1") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223005);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223006);
    if ($check_boss) {
      $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223154,11018,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("wave1");
     quest::depop();
}
 }