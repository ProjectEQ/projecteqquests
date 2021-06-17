sub SendToInstance{
	my (
		$instance_type,
		$zone_short_name,
		$instance_version,
		$teleport_x,
		$teleport_y,
		$teleport_z,
		$instance_name,
		$duration
	) = (
		shift,
		shift,
		shift,
		shift,
		shift,
		shift,
		shift,
		shift
	);
	my $client = plugin::val('client');
	$client->SendToInstance($instance_type, $zone_short_name, $instance_version, $teleport_x, $teleport_y, $teleport_z, 0, $instance_name, $duration);
}
