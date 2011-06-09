sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
$whimsy_count++;
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}

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
      if($client->KeyRingCheck(69311) || $client->KeyRingCheck(69312)) {
		quest::movepc(108,1682,41,25.9);
      }
    elsif(plugin::check_hasitem($client, 69312)) {
	    $client->KeyRingAdd(69312);
        quest::movepc(108,1682,41,25.9);
      }
    elsif(plugin::check_hasitem($client, 69311)) {
	    $client->KeyRingAdd(69311);
        quest::movepc(108,1682,41,25.9);
      }
    elsif($doorid == 135 || $doorid == 391){
     $client->Message(13, "You lack the will to use this object!");
  }
 }
}