my $check = 0;
my $counter = 0;

sub EVENT_SPAWN {
   $check = 0;
   $counter = 0;
   quest::settimer(20,1);
}

sub EVENT_TIMER {
{
quest::stoptimer(20);
quest::settimer(20,1);
$check=0;
}
    if($timer = 20) {
    $check_boss = $entity_list->GetMobByNpcTypeID(215058); #A_Phoenix_Breezewing
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(215026); #A_Wind_Pheonix
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(215025); #A_Wind_Pheonix
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(215027); #Servitor_of_Xegony
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(215062); #Spiritfrenzied_Phoenix
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(215059); #Ardent_Phoenix_of_Xegony
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(215028); #A_Phoenix_Searedwing
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(215061); #Calebgrothiel
    if ($check_boss) {
      $check = 1
    }
    if($check == 0 && $mist_event_start == undef && $mist_done == undef) {
	quest::spawn2(215069,0,0,304.2,-792.2,441.6,15.2); 
	quest::spawn2(215069,0,0,348.4,-632.2,442.3,140.1);
	quest::spawn2(215069,0,0,391.7,-736.2,438.1,203.4);
	quest::spawn2(215069,0,0,260,-699.8,444.5,75.5);
	quest::setglobal("mist_event_start",1,3,"H2");
	$counter=0;
	}
    if ($check == 1) {
      
      }
    }
}     

sub EVENT_SIGNAL {
     if ($signal == 1 && $mist_event_start == 1 && $mist_done == undef) {
        $counter+=1;
     	if ($signal == 1 && $counter == 4 && $mist_event_start == 1 && $mist_done == undef) {
        quest::spawn2(215070,0,0,323.7,-721.3,439.3,82.9);
        }
     }
     if ($signal == 2 && $mist_event_start == 1  && $mist_done == undef) {
        quest::spawn2(215071,0,0,-1571.6,-570.0,343.6,190.9);
	quest::depop(215023);
        }
     if ($signal == 3  && $mist_done == undef) {
           quest::setglobal("mist_done",1,3,"D2");
           }
}

