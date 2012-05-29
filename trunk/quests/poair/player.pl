sub EVENT_CLICKDOOR {
  if($doorid == 1) {
    if($entity_list->FindDoor(1)->GetLockPick() != 0) {
      if(plugin::check_hasitem($client, 28638) || $client->KeyRingCheck(28638)) {
        $entity_list->FindDoor(1)->SetLockPick(0); #unlock the rainbow for 5 minutes
		$entity_list->FindDoor(1)->SetKeyItem(0); #remove the key item so no one sees the message that door is locked.
        quest::settimer("XegDoorOpen",300);
      }
    }
  }
}

sub EVENT_TIMER {
  if($timer eq "XegDoorOpen") {
    quest::stoptimer("XegDoorOpen");
	$entity_list->FindDoor(1)->SetLockPick(-1); #lock the rainbow again
	$entity_list->FindDoor(1)->SetKeyItem(28638); #put the key back on.
  }
}