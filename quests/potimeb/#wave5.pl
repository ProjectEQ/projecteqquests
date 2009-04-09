#Wave 5 counter.

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("wave5",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "wave5") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223048);
    if ($check_boss) {
      $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223049);
    if ($check_boss) {
      $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223154,11058,0);
      }
    }
} 

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::stoptimer("wave5");
     quest::depop();
}
 }