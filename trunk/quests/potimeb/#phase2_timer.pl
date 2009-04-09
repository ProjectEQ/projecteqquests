#Seperate timer required so npcs don't double spawn on second wave

my $check = 0;

sub EVENT_SPAWN {
   $check = 0;
   quest::settimer("p2check",2);
}

sub EVENT_TIMER {
   $check = 0;
   if($timer eq "p2check") {
    $check_boss = $entity_list->GetMobByNpcTypeID(223110);
    if ($check_boss) {
        $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223125);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223102);
    if ($check_boss) {
        $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223133);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223087);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223107);
    if ($check_boss) {
        $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223138);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223132);
    if ($check_boss) {
        $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223136);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223126);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223141);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223148);
    if ($check_boss) {
        $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223153);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223117);
    if ($check_boss) {
        $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223143);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223114);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223137);
    if ($check_boss) {
        $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223109);
    if ($check_boss) {
        $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223124);
    if ($check_boss) {
	$check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223099);
    if ($check_boss) {
        $check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223123);
    if ($check_boss) {
	$check = 1 
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(223216);
    if ($check_boss) {
	$check = 1 
    }
    if ($check == 1) {
    } 
    if ($check == 0) {
      quest::signalwith(223191,10020,0);
      quest::stoptimer("p2check");
      quest::depop();
      }
    }
} 
    