sub EVENT_CLICKDOOR {
  if($doorid == 8){
    if($client->KeyRingCheck(17274)){
      OPEN_DOORS(8,0);
    } elsif(plugin::check_hasitem($client, 17274)) {
      OPEN_DOORS(8,1);
    }
  } elsif($doorid == 10){
    if($client->KeyRingCheck(17274)){
      OPEN_DOORS(10,0);
    } elsif(plugin::check_hasitem($client, 17274)) {
      OPEN_DOORS(10,1);
    }
  } elsif($doorid == 11){
    if($client->KeyRingCheck(17274)){
      OPEN_DOORS(11,0);
    } elsif(plugin::check_hasitem($client, 17274)) {
      OPEN_DOORS(11,1);
    }
  } elsif($doorid == 35){
    if($client->KeyRingCheck(17274)){
      OPEN_DOORS(35,0);
    } elsif(plugin::check_hasitem($client, 17274)) {
      OPEN_DOORS(35,1);
    }
  } elsif($doorid == 40){
    if($client->KeyRingCheck(17274)){
      OPEN_DOORS(40,0);
    } elsif(plugin::check_hasitem($client, 17274)) {
      OPEN_DOORS(40,1);
    }
  } elsif($doorid == 46){
    if($client->KeyRingCheck(17274)){
      OPEN_DOORS(46,0);
    } elsif(plugin::check_hasitem($client, 17274)) {
      OPEN_DOORS(46,1);
    }
  }
}

sub OPEN_DOORS {
  #EVENT_CLICKDOOR executes before the rest of the door processing
  #so by unlocking and removing the lockpick value we can simulate live behavior
  #and not incorrectly show that the door is locked and we are not holding the key.
  
  #remove lockpiock and key item.
  $entity_list->FindDoor($_[0])->SetLockPick(0);
  $entity_list->FindDoor($_[0])->SetKeyItem(0);
  #send locked message
  $client->Message(4,"This is locked...");
  #add to keyring if specified
  if($_[1] == 1) {
    $client->KeyRingAdd(17274);
  }
  #send open message
  $client->Message(4,"You got it open!");
  #set 2 second timer to relock door. use door as timer.
  #doors stay open longer than 2 seconds.
  quest::settimer($_[0],2);
}

sub EVENT_TIMER {
  if($timer == 8 || $timer == 11) {
    LOCK_DOORS($timer,20511);
  } elsif($timer == 10) {
    LOCK_DOORS($timer,20513);
  } elsif($timer == 35) {
    LOCK_DOORS($timer,20515);
  } elsif($timer == 40) {
    LOCK_DOORS($timer,20514);
  } elsif($timer == 46) {
    LOCK_DOORS($timer,20516);
  } else {
    #should never happen
    quest::stopalltimers();
  }
}

sub LOCK_DOORS {
  $entity_list->FindDoor($_[0])->SetKeyItem($_[1]);
  $entity_list->FindDoor($_[0])->SetLockPick(201);
  quest::stoptimer($_[0]);
}