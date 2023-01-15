# plugin::Class($class_id) - Returns Class Name
sub Class {
	my $class_id = shift;
	return quest::getclassname($class_id);
}

# plugin::Deity($deity_id) - Returns Deity Name
sub Deity {
	my $deity_id = shift;
	return quest::getdeityname($deity_id);
}

# plugin::IP($ip) - Returns human readable IP from $client->GetIP() value.
sub IP {
	my $ip = shift; 
	my @array = unpack('C4', pack("N", $ip));
	my @array_two = @array;
	$array[0] = $array_two[3];
	$array[1] = $array_two[2];
	$array[2] = $array_two[1];
	$array[3] = $array_two[0];
	return join(".", @array);
}

# plugin::Race($race_id) - Returns Race Name
sub Race {
	my $race_id = shift;
	return quest::getracename($race_id);
}

# plugin::Skill($skill_id) - Returns Skill Name
sub Skill {
	my $skill_id = shift;
	return quest::getskillname($skill_id);
}

# plugin::SlotName($slot_id) - Returns Slot Name
sub SlotName {
	my $slot_id = shift;
	return quest::getinventoryslotname($slot_id);
}

# plugin::Zone($name_type, $zone_data);
# $name_type types:
## LN - Zone Long Name
## SN - Zone Short Name
## ID - Zone ID
# $zone_data can be Zone ID or Zone Short Name
## $zone_data can be converted to Zone ID, Zone Long Name, or Zone Short Name
sub Zone {
	use Scalar::Util qw(looks_like_number);
	my $name_type = shift;
	my $zone_data = shift;
	if (looks_like_number($zone_data)) {
		if ($name_type eq "SN") {
			return quest::GetZoneShortName($zone_data);
		} elsif ($name_type eq "LN") {
			return quest::GetZoneLongNameByID($zone_data);
		}
	} else {
		if ($name_type eq "ID") {
			return quest::GetZoneID($zone_data);
		} elsif ($name_type eq "LN") {
			return quest::GetZoneLongName($zone_data);
		}
	}
	return $zone_data;
}