sub EVENT_CLICKDOOR {
  if(($doorid == 1) && !defined $qglobals{dragon_not_ready}) {
    quest::setglobal("door_two",1,3,"S60");
    $client->Message(4,"The globe begins to spin faster and faster...");
  }
  if(($doorid == 2) && !defined $qglobals{dragon_not_ready}) {
    quest::setglobal("door_three",1,3,"S60");
    $client->Message(4,"The globe begins to spin faster and faster...");
  }
  if(($doorid == 3) && !defined $qglobals{dragon_not_ready}) {
    quest::setglobal("door_four",1,3,"S60");
    $client->Message(4,"The globe begins to spin faster and faster...");
  }
  if(($doorid == 232) && !defined $qglobals{dragon_not_ready}) {
    quest::setglobal("door_one",1,3,"S60");
    $client->Message(4,"The globe begins to spin faster and faster...");
  }
  if(($doorid == 1) && $dragon_not_ready == 1) {
    $client->Message(4,"The globe does not seem to do anything");
  }
  if(($doorid == 2) && $dragon_not_ready == 1) {
    $client->Message(4,"The globe does not seem to do anything");
  }
  if(($doorid == 3) && $dragon_not_ready == 1) {
    $client->Message(4,"The globe does not seem to do anything");
  }
  if(($doorid == 232) && $dragon_not_ready == 1) {
    $client->Message(4,"The globe does not seem to do anything");
  }
  if($doorid == 135) {
    if(plugin::check_hasitem($client, 69311) && !$client->KeyRingCheck(69311)) {
      $client->KeyRingAdd(69311);
    }
    if(plugin::check_hasitem($client, 69312) && !$client->KeyRingCheck(69312)) {
      $client->KeyRingAdd(69312);
    }
    if($client->KeyRingCheck(69311) || $client->KeyRingCheck(69312) || ($status > 99)) {
      quest::movepc(108,1682,41,25.9);
    }
    else {
      $client->Message(13, "You lack the will to use this object!");
    }
  }
}