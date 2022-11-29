sub NPCTell {	
	my $npc = plugin::val('npc');
    my $client = plugin::val('client');
	my $message = shift;

	my $NPCName = $npc->GetCleanName();
    my $tellColor = 257;
	
    $client->Message($tellColor, "$NPCName tells you, '" . $message . "'");
}

sub RandomNPCTell {
	my $client = $_[0];
	my $npc = $_[1];
	
	my $count = 1;
	while ($_[$count]) {
		$count++;
	}
	my $message = plugin::RandomRange(2, $count);
	$client->NPCTell($npc,$message);
}

sub commify {
    my $text = reverse $_[0];
    $text =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
    return scalar reverse $text;
}

return 1;