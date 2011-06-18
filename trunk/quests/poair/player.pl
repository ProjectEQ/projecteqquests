sub EVENT_CLICKDOOR {
  if($doorid == 1) {
    if(plugin::check_hasitem($client, 28638) || $client->KeyRingCheck(28638)) {
      if(!$client->KeyRingCheck(28638)) {
        $client->KeyRingAdd(28638);
      }
      $client->Message(15, "You got the door open!");
      quest::setglobal("Xegkey",1,2,"M5");
      quest::movepc(215,-599.6,3.5,1447.5);
    }
    elsif(defined($qglobals{Xegkey})) {
      $client->Message(15, "You got the door open!");
      quest::movepc(215,-599.6,3.5,1447.5);
    }
    else {
      $client->Message(15, "You lack the will to pass.");
    }
  }
}
