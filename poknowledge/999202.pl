sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_brutus",2,7,"F");
	quest::settimer(1,1333); # 22 min 13 seconds
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_brutus = plugin::GetRandomFreeLocation(0,12);
		quest::setglobal("halloween_ratter_brutus",$newzone_brutus,7,"F");

		if($newzone_brutus > 12){
			my $newzone_brutus = plugin::GetRandomFreeLocation(0,12);
			quest::setglobal("halloween_ratter_brutus",$newzone_brutus,7,"F");
		}
	}
}