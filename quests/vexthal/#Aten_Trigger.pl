#Spawns non-Destroy Aten if no boss mobs are up. 

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("aten",60);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "aten") {
    $check_boss = $entity_list->GetMobByNpcTypeID(158006); #fake aten
    if ($check_boss) {
      $check = 0 #intentional
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158014);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158010);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158015);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158012);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158013);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158007);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158008);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158011);
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(158009);
    if ($check_boss) {
      $check = 1
    }
    if ($check == 1) {
    } 
    if ($check == 0 && $entity_list->GetMobByNpcTypeID(158006) && !defined $qglobals{aten}) {
      quest::depop(158006);
      quest::spawn2(158096,0,0,1412,0,248.63,192);
      }
    }
}      

#EOF