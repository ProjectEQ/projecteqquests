#checks to see if player has item
#useage plugin::check_hasitem($client, itemid);
sub check_hasitem {
    my $client = shift;
    my $itmchk = shift;
    my $slot1;
    my $itemid1;
    my $augid1;
    my $i;
    my $body_count = $client->GetCorpseCount();
    my $body_id;
    my $augsocket_begin = quest::getinventoryslotid("augsocket.begin");
    my $augsocket_end = quest::getinventoryslotid("augsocket.end");

#Check possessions
    for($slot1=quest::getinventoryslotid("possessions.begin"); $slot1<=quest::getinventoryslotid("possessions.end"); $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=$augsocket_begin; $i<=$augsocket_end; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check general and cursor containers
    for($slot1=quest::getinventoryslotid("generalbags.begin"); $slot1<=quest::getinventoryslotid("cursorbag.end"); $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=$augsocket_begin; $i<=$augsocket_end; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check bank
    for($slot1=quest::getinventoryslotid("bank.begin"); $slot1<=quest::getinventoryslotid("bank.end"); $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=$augsocket_begin; $i<=$augsocket_end; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check bank containers
    for($slot1=quest::getinventoryslotid("bankbags.begin"); $slot1<=quest::getinventoryslotid("bankbags.end"); $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=$augsocket_begin; $i<=$augsocket_end; $i++) {
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
    for($slot1=quest::getinventoryslotid("sharedbank.begin"); $slot1<=quest::getinventoryslotid("sharedbank.end"); $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=$augsocket_begin; $i<=$augsocket_end; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check shared bank containers
    for($slot1=quest::getinventoryslotid("sharedbankbags.begin"); $slot1<=quest::getinventoryslotid("sharedbankbags.end"); $slot1++) {
        $itemid1=$client->GetItemIDAt($slot1);
      for($i=$augsocket_begin; $i<=$augsocket_end; $i++) {
         $augid1=$client->GetAugmentIDAt($slot1, $i);
         if($augid1==$itmchk) {
            return 1;
         }
      }
        if($itemid1==$itmchk) {
            return 1;
        }
    }
#Check corpses
  if ($body_count > 0) {
    for ($i=1; $i<=$body_count; $i++) {
      $body_id = $client->GetCorpseID($i);
      for ($slot1=quest::getinventoryslotid("possessions.begin"); $slot1<=quest::getinventoryslotid("possessions.end"); $slot1++) {
        $itemid1 = $client->GetCorpseItemAt($body_id, $slot1);
        if ($itemid1 == $itmchk) {
          return 1;
        }
      }
      for ($slot1=quest::getinventoryslotid("generalbags.begin"); $slot1<=quest::getinventoryslotid("cursorbag.end"); $slot1++) {
        $itemid1 = $client->GetCorpseItemAt($body_id, $slot1);
        if ($itemid1 == $itmchk) {
          return 1;
        }
      }
    }
  }
  return 0;
}

1;