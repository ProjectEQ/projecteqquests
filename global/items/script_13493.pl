sub EVENT_ITEM_CLICK_CAST {
	if(quest::istaskactivityactive(222,0)) {
		my $rat = "Kai";
		my $ratglobal = "halloween_ratter_kai";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}	
	elsif(quest::istaskactivityactive(222,1)) {
		my $rat = "Brutus";
		my $ratglobal = "halloween_ratter_brutus";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	elsif(quest::istaskactivityactive(222,2)) {
		my $rat = "Aristotle";
		my $ratglobal = "halloween_ratter_aristotle";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	elsif(quest::istaskactivityactive(222,3)) {
		my $rat = "Zeus";
		my $ratglobal = "halloween_ratter_zeus";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	elsif(quest::istaskactivityactive(222,5)) {
		my $rat = "Sherlock";
		my $ratglobal = "halloween_ratter_sherlock";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	elsif(quest::istaskactivityactive(222,6)) {
		my $rat = "Ocho";
		my $ratglobal = "halloween_ratter_ocho";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);
		my $random_result = int(rand(3));

		if($zonesn ne $zsn) {
			if($random_result == 1){
				$client->Message(0, "Your item seems to be malfunctioning.");
			}
			else {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
			}
		}
		else {
			if($random_result == 2){
				$client->Message(0, "Your item seems to be malfunctioning.");
			}
			else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
			}
		}
	}
	elsif(quest::istaskactivityactive(222,7)) {
		my $rat = "Toby";
		my $ratglobal = "halloween_ratter_toby";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	elsif(quest::istaskactivityactive(222,9)) {
		my $rat = "Gustave";
		my $ratglobal = "halloween_ratter_gustave";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	elsif(quest::istaskactivityactive(222,10)) {
		my $rat = "Napoleon";
		my $ratglobal = "halloween_ratter_napoleon";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	elsif(quest::istaskactivityactive(222,11)) {
		my $rat = "Sprocket";
		my $ratglobal = "halloween_ratter_sprocket";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);
		my $random_result = int(rand(11));
		my $area = quest::ChooseRandom("Texas","Sweden","Africa","Mexico","Brazil","Quebec","China","Egypt","Australia","Antartica");

		if($zonesn ne $zsn) {
			if($random_result < 6){
				$client->Message(0, "$rat is in $area");
			}
			else {
				$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
			}
		}
		else {
			if($random_result < 4){
				$client->Message(0, "$rat isn't here! Leave him alone!");
			}
			else {
				WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
			}
		}
	}
	elsif(quest::istaskactivityactive(222,12)) {
		my $rat = "Mortimer";
		my $ratglobal = "halloween_ratter_mortimer";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	elsif(quest::istaskactivityactive(222,13)) {
		my $rat = "Paulie";
		my $ratglobal = "halloween_ratter_paulie";
		my $location = plugin::GetRatLocation("$ratglobal");
		$x_loc = plugin::Get_rat_x_loc($location);
		$y_loc = plugin::Get_rat_y_loc($location);
		$z_loc = plugin::Get_rat_z_loc($location);
		$zsn = plugin::Get_rat_zonesn($location);

		if($zonesn ne $zsn) {
			$client->Message(0, "$rat is in " . quest::GetZoneLongName($zsn) . ".");
		}
		else {
			WAYPOINT_LOCATION($x_loc,$y_loc,$z_loc,$rat);
		}
	}
	else {
		$client->Message(0, "This item can no longer help you.");
	}
}

sub WAYPOINT_LOCATION {
	my $x_loc = $_[0];
	my $y_loc = $_[1];
	my $z_loc = $_[2];
	my $rat = $_[3];
	my $x_diff = $x_loc - $client->GetX();
	my $y_diff = $y_loc - $client->GetY();
	my $z_diff = $z_loc - $client->GetZ();
	
	if ($x_diff > 15 && $y_diff > 15) {
	$client->Message(0, "$rat is to the North-West.");
	} elsif ($x_diff < -15 && $y_diff > 15) {
	$client->Message(0, "$rat is to the North-East.");
	} elsif ($y_diff > 15) {
	$client->Message(0, "$rat is to the North.");
	} elsif ($x_diff > 15 && $y_diff < -15) {
	$client->Message(0, "$rat is to the South-West.");
	} elsif ($x_diff < -15 && $y_diff < -15) {
	$client->Message(0, "$rat is to the South-East.");
	} elsif ($y_diff < -15) {
	$client->Message(0, "$rat is to the South.");
	} elsif ($x_diff > 15) {
	$client->Message(0, "$rat is to the West.");
	} elsif ($x_diff < -15) {
	$client->Message(0, "$rat is to the East.");
	} elsif ($z_diff < 0) {
	$client->Message(0, "$rat is below you.");
	} else {
	$client->Message(0, "$rat is above you.");
	}
}	