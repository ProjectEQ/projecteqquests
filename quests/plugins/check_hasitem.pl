#checks to see if player has item
#useage plugin::check_hasitem($client, itemid);
sub check_hasitem {
    my $client = shift;
    my $itmchk = shift;
    my $slot1;
    my $itemid1;
    my $augid1;
   my $i;
#Check main inventory and cursor
    for($slot1=0; $slot1<=30; $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=0; $i<5; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check main inventory's and cursor's containers
    for($slot1=251; $slot1<=340; $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=0; $i<5; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check bank slots
    for($slot1=2000; $slot1<=2015; $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=0; $i<5; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check bank's containers
    for($slot1=2030; $slot1<=2190; $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=0; $i<5; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check shared bank
    for($slot1=2500; $slot1<=2501; $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=0; $i<5; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check shared bank's containers
    for($slot1=2531; $slot1<=2550; $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=0; $i<5; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
    return 0;
}

1;