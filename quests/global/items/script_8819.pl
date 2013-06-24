# Halloween quest Nektulos Ghost Rider Mask of Eyes script.

sub EVENT_ITEM_CLICK {
	if($zonesn eq 'nektulos') {
		if(quest::istaskactivityactive(216,0)) {
			my $x_loc = 1035;
			my $y_loc = -1110;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		elsif(quest::istaskactivityactive(216,1)) {
			my $x_loc = -890;
			my $y_loc = -1910;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		elsif(quest::istaskactivityactive(216,2)) {
			my $x_loc = 25;
			my $y_loc = -1195;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		elsif(quest::istaskactivityactive(216,3)) {
			my $x_loc = 1045;
			my $y_loc = -505;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		elsif(quest::istaskactivityactive(216,4)) {
			my $x_loc = 530;
			my $y_loc = 890;
			WAYPOINT_LOCATION($x_loc, $y_loc);			
		}
		elsif(quest::istaskactivityactive(216,5)) {
			my $x_loc = -530;
			my $y_loc = -865;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		elsif(quest::istaskactivityactive(216,6)) {
			my $x_loc = -760;
			my $y_loc = 0;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		elsif(quest::istaskactivityactive(216,7)) {
			my $x_loc = -75;
			my $y_loc = 860;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		elsif(quest::istaskactivityactive(216,8)) {
			my $x_loc = 700;
			my $y_loc = 1685;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		elsif(quest::istaskactivityactive(216,9)) {
			my $x_loc = -950;
			my $y_loc = 1820;
			WAYPOINT_LOCATION($x_loc, $y_loc);
		}
		else {
			$client->Message(0, "This item can no longer help you as there are no more waypoints.");
		}
	}
	else {
		$client->Message(0, "This item can only be used in Nektulos Forest.");
	}
}

sub WAYPOINT_LOCATION {
	my $x_loc = $_[0];
	my $y_loc = $_[1];
	my $x_diff = $x_loc - $client->GetX();
	my $y_diff = $y_loc - $client->GetY();
	
	if ($x_diff > 15 && $y_diff > 15) {
	$client->Message(0, "The waypoint lies to the NorthWest.");
	} elsif ($x_diff < -15 && $y_diff > 15) {
	$client->Message(0, "The waypoint lies to the NorthEast.");
	} elsif ($y_diff > 15) {
	$client->Message(0, "The waypoint lies to the North.");
	} elsif ($x_diff > 15 && $y_diff < -15) {
	$client->Message(0, "The waypoint lies to the SouthWest.");
	} elsif ($x_diff < -15 && $y_diff < -15) {
	$client->Message(0, "The waypoint lies to the SouthEast.");
	} elsif ($y_diff < -15) {
	$client->Message(0, "The waypoint lies to the South.");
	} elsif ($x_diff > 15) {
	$client->Message(0, "The waypoint lies to the West.");
	} elsif ($x_diff < -15) {
	$client->Message(0, "The waypoint lies to the East.");
	}
}