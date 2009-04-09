sub EVENT_CLICKDOOR {
   if(($doorid == 232 || $doorid == 488) && !defined $qglobals{dragon_not_ready}) {
     quest::setglobal("door_one",1,3,"S60");
     $client->Message(4,"The globe begins to spin faster and faster...");
     }
   if(($doorid == 1 || $doorid == 257) && !defined $qglobals{dragon_not_ready}) {
     quest::setglobal("door_two",1,3,"S60");
     $client->Message(4,"The globe begins to spin faster and faster...");
     }
   if(($doorid == 2 || $doorid == 258) && !defined $qglobals{dragon_not_ready}) {
     quest::setglobal("door_three",1,3,"S60");
     $client->Message(4,"The globe begins to spin faster and faster...");
     }
   if(($doorid == 3 || $doorid == 259) && !defined $qglobals{dragon_not_ready}) {
     quest::setglobal("door_four",1,3,"S60");
     $client->Message(4,"The globe begins to spin faster and faster...");
     }
   if(($doorid == 232 || $doorid == 488) && $dragon_not_ready == 1) {
     $client->Message(4,"The globe does not seem to do anything");
     }
   if(($doorid == 1 || $doorid == 257) && $dragon_not_ready == 1) {
     $client->Message(4,"The globe does not seem to do anything");
     }
   if(($doorid == 2 || $doorid == 258) && $dragon_not_ready == 1) {
     $client->Message(4,"The globe does not seem to do anything");
     }
   if(($doorid == 3 || $doorid == 259) && $dragon_not_ready == 1) {
     $client->Message(4,"The globe does not seem to do anything");
     }
   if($doorid == 135 || $doorid == 391){
      if(plugin::check_hasitem($client, 69311) || plugin::check_hasitem($client, 69312)) {
        quest::movepc(108,1682,41,25.9);
      }
    elsif($doorid == 135 || $doorid == 391){
     $client->Message(13, "You lack the will to use this object!");
  }
 }
}