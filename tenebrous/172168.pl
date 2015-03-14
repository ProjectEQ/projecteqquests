sub EVENT_SIGNAL {
	my $random_result = int(rand(100));
	if ($random_result < 10) {
		quest::unique_spawn(172155,0,0,-1425,576,317,64); # spawn Heratius Grolden
	} 
}