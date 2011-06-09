sub EVENT_CLICKDOOR {
	my $d_id = ($doorid % 256);
	my $instance = quest::GetInstanceID("potimeb", 0);
	if (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} > 0 && !defined($qglobals{potime_canzone})) {
		quest::shout("I AM HERE");
	} elsif ($instance > 0) {
		if ($d_id == 8) { 
			quest::MovePCInstance(223, $instance, -36, 1352, 496);
			$client->Message(10, "The portal, dim at first, begins to glow brighter.");
			$client->Message(10, "The portal flashes briefly, then glows steadily.");
			#quest::movepc(223,-36,1352,496,128);
		} elsif($d_id == 9) {
			quest::MovePCInstance(223, $instance, -51, 857, 496);
			$client->Message(10, "The portal, dim at first, begins to glow brighter.");
			$client->Message(10, "The portal flashes briefly, then glows steadily.");
			#quest::movepc(223,-51,857,496,128);
		} elsif($d_id == 10) {
			quest::MovePCInstance(223, $instance, -35, 1636, 496);
			$client->Message(10, "The portal, dim at first, begins to glow brighter.");
			$client->Message(10, "The portal flashes briefly, then glows steadily.");
			#quest::movepc(223,-35,1636,496,128);
		} elsif($d_id == 11) {
			quest::MovePCInstance(223, $instance, -55, 569, 496);
			$client->Message(10, "The portal, dim at first, begins to glow brighter.");
			$client->Message(10, "The portal flashes briefly, then glows steadily.");
			#quest::movepc(223,-55,569,496,128);
		} elsif($d_id == 12) {
			quest::MovePCInstance(223, $instance, -27, 1103, 496);
			$client->Message(10, "The portal, dim at first, begins to glow brighter.");
			$client->Message(10, "The portal flashes briefly, then glows steadily.");
			#quest::movepc(223,-27,1103,496,128);
		#graveyard
		} elsif($d_id == 13) {
			quest::MovePCInstance(223, $instance, 865, -150, 395);
			$client->Message(10, "The portal, dim at first, begins to glow brighter.");
			$client->Message(10, "The portal flashes briefly, then glows steadily.");	
		}
	}
}  

sub EVENT_ENTERZONE {
	if(!defined($qglobals{time_enter}) && $status < 10){
		quest::we(15, "The earth rumbles, sky thunders, volcanoes erupt, and tidal waves crash as the Gods prepare their armies for battle. The first of the mortals have obtained the power to cross into the Plane of Time!");
		quest::setglobal("time_enter",1,7,"F");
	}
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