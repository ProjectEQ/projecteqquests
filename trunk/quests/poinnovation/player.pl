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
	my $d_id = ($doorid % 256);
	if($d_id == 7)
	{
		if(defined $qglobals{pop_poi_dragon}) 
		{
            		$client->Message(15,"You remember Nitram's words - 'three small turns to the right on the bottommost rivet should open the door'.");
            		quest::forcedooropen(7);
      		}
   	}
	if($d_id == 145)
	{
		if(defined $qglobals{pop_time_maelin}) 
		{
			quest::set_zone_flag(219);
			quest::set_zone_flag(223);
	            	$client->Message(15,"You have received a character flag!");
	            	$client->Message(15,"The ages begin to tear through your body. You wake to find yourself in another time.");
	            	quest::movepc(219,223,140,9,94);
	      	}
   	}
   	$qglobals{pop_poi_dragon}=undef;
   	$qgloabls{pop_time_maelin}=undef;
}