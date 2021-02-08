# Parameters depend on Type
# Type 0: plugin::Data($client, $type, $name); - Deletes a bucket.
# Type 1: plugin::Data($client, $type, $name, $value); - Sets a bucket without a duration
# Type 2: plugin::Data($client, $type, $name, $value, $duration); - Sets a bucket with a duration.
# Type 3: plugin::Data($client, $type, $name); - Returns bucket value.
# Type 4: plugin::Data($client, $type, $name); - Returns expiration time.
# Type 5: plugin::Data($client, $type, $name); - Returns time remaining.
sub Data {
	my $client = shift;
	my $character_id = $client->CharacterID();
	my $type = shift;
	my $name = shift;
	if ($type == 0) {
		quest::delete_data("$character_id-$name");
	} elsif ($type == 1) {
		my $value = shift;
		quest::set_data("$character_id-$name", $value);
	} elsif ($type == 2) {
		my $value = shift;
		my $duration = shift;
		quest::set_data("$character_id-$name", $value, $duration);
	} elsif ($type == 3) {
		return quest::get_data("$character_id-$name") ne "" ? quest::get_data("$character_id-$name") : 0;
	} elsif ($type == 4) {
		return quest::get_data_expires("$character_id-$name");
	} elsif ($type == 5) {
		my $current_time = time();
		return (quest::get_data_expires("$character_id-$name") - $current_time);
	}
}

# Parameters depend on Type
# Type 0: plugin::ServerData($type, $name); - Deletes a bucket.
# Type 1: plugin::ServerData($type, $name, $value); - Sets a bucket without a duration
# Type 2: plugin::ServerData($type, $name, $value, $duration); - Sets a bucket with a duration.
# Type 3: plugin::ServerData($type, $name); - Returns bucket value.
# Type 4: plugin::ServerData($type, $name); - Returns expiration time.
# Type 5: plugin::ServerData($type, $name); - Returns time remaining.
sub ServerData {
	my $type = shift;
	my $name = shift;
	if ($type == 0) {
		quest::delete_data($name);
	} elsif ($type == 1) {
		my $value = shift;
		quest::set_data($name, $value);
	} elsif ($type == 2) {
		my $value = shift;
		my $duration = shift;
		quest::set_data($name, $value, $duration);
	} elsif ($type == 3) {
		return quest::get_data($name) ne "" ? quest::get_data($name) : 0;
	} elsif ($type == 4) {
		return quest::get_data_expires($name);
	} elsif ($type == 5) {
		my $current_time = time();
		return (quest::get_data_expires($name) - $current_time);
	}
}

# plugin::TimeRemaining($expiration_time); - Returns formatted time remaining until expiration.
sub TimeRemaining {
	my $expiration_time = shift;
	my $current_time = time;
	my $remaining_time = ($expiration_time - $current_time);
	my $pre = $remaining_time;
	my $hours = int($remaining_time / 3600);
	$remaining_time = ($remaining_time % 3600);
	my $minutes = int($remaining_time / 60);
	$remaining_time = ($remaining_time % 60);
	my $seconds = $remaining_time;
	if ($hours < 0 || $minutes < 0 || $seconds < 0) {
		return "Unknown";
	} else {
		return "$hours Hour(s), $minutes Minute(s), and $seconds Second(s)";
	}
}

# plugin::ConvertTimeRemaining($remaining_time); - Returns formatting time remaining.
sub ConvertTimeRemaining {
	my $remaining_time = shift;
	my $pre = $remaining_time;
	my $hours = int($remaining_time / 3600);
	$remaining_time = ($remaining_time % 3600);
	my $minutes = int($remaining_time / 60);
	$remaining_time = ($remaining_time % 60);
	my $seconds = $remaining_time;
	if ($hours < 0 || $minutes < 0 || $seconds < 0) {
		return "Unknown";
	} else {
		return "$hours Hour(s), $minutes Minute(s), and $seconds Second(s)";
	}
}
