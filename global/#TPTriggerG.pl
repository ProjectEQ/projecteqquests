sub EVENT_SPAWN {

        $x = $npc->GetX();
        $y = $npc->GetY();
        $z = $npc->GetZ();

        quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
	
	quest::debug("Attempting to update attunement point...");	
	
	my @tokens = split /:/, $npc->GetLastName();

        my $charKey = $client->CharacterID() . "-TL-" . $tokens[0];
        my $charTL  = quest::get_data($charKey);

	my $TLDesc = "";	

	if ($tokens[1] eq "") {
		$TLDesc = quest::GetZoneLongNameByID($npc->GetZoneID());
	} else {
		$TLDesc = quest::GetZoneLongNameByID($npc->GetZoneID()) . " " . $tokens[1];
	}

        my $locString = ":" . quest::GetZoneShortName($npc->GetZoneID()) . "," . $TLDesc . "," . $npc->GetX() . "," . $npc->GetY() . "," . $npc->GetZ() . "," . $npc->GetHeading();
		
        if (index($charTL, $TLDesc) == -1 and !($tokens[0] eq "")) {
                quest::message(15,"You feel a tug on your soul. Your have become attuned to this location.");
                quest::ding();
                quest::set_data($charKey, $charTL . $locString);
        } elsif ($tokens[0] eq "") {
		quest::debug("Configuration Error.");
	}
}
