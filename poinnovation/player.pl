sub EVENT_CLICKDOOR {
  if($doorid == 7) {
    if(defined $qglobals{pop_poi_dragon}) {
      $client->Message(15,"You remember Nitram's words - 'three small turns to the right on the bottommost rivet should open the door'.");
      quest::forcedooropen(7);
    }
  }
  if($doorid == 145) {
    if(defined $qglobals{pop_time_maelin}) {
      quest::set_zone_flag(219);
      quest::set_zone_flag(223);
      $client->Message(15,"You have received a character flag!");
      $client->Message(15,"The ages begin to tear through your body. You wake to find yourself in another time.");
      quest::movepc(219,223,140,9,94); # Zone: potimea
    }
  }
  $qglobals{pop_poi_dragon}=undef;
  $qgloabls{pop_time_maelin}=undef;
}