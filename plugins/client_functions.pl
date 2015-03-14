###AKKADIUS###
#Returns the client version in text format
sub ClientCheck{
	my $client = plugin::val('$client');
	my $clientver = $client->GetClientVersion();
		if ($clientver == 2){
			$ShowClient = "Titanium";
			}
		if ($clientver == 3){
			$ShowClient = "Secrets of Faydwer";
			}
		if ($clientver == 4){
			$ShowClient = "Seeds of Destruction";
			}
		if ($clientver == 5){
			$ShowClient = "House of Thule";
			}
			return "$ShowClient";
}

return 1;