sub EVENT_ENTERZONE {
	if (quest::istaskcompleted(5745) == 0 && quest::istaskactive(5745) == 0) #Check if completed Task: New Beginnings
	{
		quest::assigntask(5745); #Force assign Task: New Beginnings
	}

	set_current_position();
	quest::settimer("check_idle", 1200);
}

sub EVENT_CLICKDOOR {
	my $popuptext = "If you do not respond within 5 seconds, you will automatically be sent to the overhauled version.";

	if ($doorid == 138) #guild lobby
	{
		if ($client->CalculateDistance(1408, -377, -113) <= 30) {
			if (($client->GetClientVersionBit() & 4294967264) != 0) {
				quest::MovePCInstance(344, 5, 18, -46, 6, 450); # Zone: guildlobby
			}
			else {
				quest::movepc(344, 18, -46, 6, 492); # Zone: guildlobby
			}
		}
	}
	if ($doorid == 139) #bazaar
	{
		if ($client->CalculateDistance(1452, 347, -113) <= 30) {
			quest::movepc(151, -425, 0, -25, 65); # Zone: bazaar
		}
	}
	if ($doorid == 19) {
		#$zonename = "Innothule Swamp";
		#if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		#{
		#	quest::movepc(46,-34,-721,-27,221.21);
		#}
		#elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		#{
		#	quest::movepc(413,-361,-462,5);
		#}
		#else  #SoF/SoD/UF
		#{
		#quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",2,1);
		#quest::settimer(2,5);
		quest::movepc(46, -34, -721, -27, 221.21); # Zone: innothule
		#}
	}
	if ($doorid == 22) #erud
	{
		#$zonename = "Toxxulia Forest";
		#if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		#{
		#  	quest::movepc(38,296,-2330,-45.4,127);
		#}
		#elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		#{
		#  	quest::movepc(414,248,-1684,33,88);
		#}
		#else  #SoF/SoD/UF
		#{
		#       quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",3,1);
		#       quest::settimer(3,5);
		#}
		quest::movepc(38, 296, -2330, -45.4, 127); # Zone: tox
	}
	if ($doorid == 32) #paineel
	{
		#$zonename = "Toxxulia Forest";
		#if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		#{
		#  	quest::movepc(38,-569,2325,-43.4,39);
		#}
		#elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		#{
		#  	quest::movepc(414,-1801,1907,119,195.5);
		#}
		#else  #SoF/SoD/UF
		#{
		#       quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",4,1);
		#       quest::settimer(4,5);
		#}
		quest::movepc(38, -569, 2325, -43.4, 39); # Zone: tox
	}
	if ($doorid == 24) {
		#$zonename = "Steamfont Mountains";
		#if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		#{
		#  	quest::movepc(56,933.79,-1358,-109);
		#}
		#elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		#{
		#  	quest::movepc(448,940,-1122,5,98);
		#}
		#else  #SoF/SoD/UF
		#{
		#       quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",5,1);
		#       quest::settimer(5,5);
		quest::movepc(56, 933.79, -1358, -109); # Zone: steamfont
		#}
	}
	if ($doorid == 25) {
		#$zonename = "Freeport West";
		#if(($client->GetClientVersionBit() & 3)!= 0) #062/Titanium
		#{
		#  	quest::movepc(9,77.31,-660.57,-30.24);
		#}
		#elsif(($client->GetClientVersionBit() & 4294967264)!= 0) #RoF+
		#{
		# 	quest::movepc(383,-173,-188,-69,192);
		#}
		#else  #SoF/SoD/UF
		#{
		#      quest::popup("$zonename","Send you to the Classic $zonename? $popuptext",6,1);
		#      quest::settimer(6,5);
		quest::movepc(9, 77.31, -660.57, -30.24); # Zone: freportw
		#}
	}
}


sub EVENT_POPUPRESPONSE {
	if ($popupid == 2) {
		quest::movepc(46, -34, -721, -27, 221.21); # Zone: innothule
	}
	if ($popupid == 3) {
		quest::movepc(38, 296, -2330, -45.4, 127); # Zone: tox
	}
	if ($popupid == 4) {
		quest::movepc(38, -569, 2325, -43.4, 39); # Zone: tox
	}
	if ($popupid == 5) {
		quest::movepc(56, 933.79, -1358, -109); # Zone: steamfont
	}
	if ($popupid == 6) {
		quest::movepc(9, 77.31, -660.57, -30.24); # Zone: freportw
	}
}

sub EVENT_TIMER {
	if ($timer == 2) {
		quest::movepc(413, -361, -462, 5); # Zone: innothuleb
	}
	if ($timer == 3) {
		quest::movepc(414, 248, -1684, 33, 88); # Zone: toxxulia
	}
	if ($timer == 4) {
		quest::movepc(414, -1801, 1907, 119, 195.5); # Zone: toxxulia
	}
	if ($timer == 5) {
		quest::movepc(448, 940, -1122, 5, 98); # Zone: steamfontmts
	}
	if ($timer == 6) {
		quest::movepc(383, -173, -188, -69, 192); # Zone: freeportwest
	}

	if ($timer eq "check_idle") {
		my $last_x  = $client->GetEntityVariable("last_x");
		my $last_y  = $client->GetEntityVariable("last_y");
		my $is_idle = ($last_x eq $client->GetX() && $last_y eq $client->GetY());

		if ($is_idle && $uguild_id > 0) {
			$client->SendToGuildHall();
		}

		set_current_position();
	}
}

sub set_current_position() {
	$client->SetEntityVariable("last_x", $client->GetX());
	$client->SetEntityVariable("last_y", $client->GetY());
}
