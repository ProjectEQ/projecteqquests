#::: Author: Akkadius
#::: Description: Returns the client version in text format
sub ClientCheck{
	my $client = plugin::val('$client');
	my $clientver = $client->GetClientVersion();
	if ($clientver == 2){ $ShowClient = "Titanium"; }
	if ($clientver == 4){ $ShowClient = "Seeds of Destruction"; }
	if ($clientver == 5){ $ShowClient = "Underfoot"; }
	if ($clientver == 6){ $ShowClient = "Other"; }
	return $ShowClient;
}

return 1; 