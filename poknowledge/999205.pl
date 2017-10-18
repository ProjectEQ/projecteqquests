sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_sherlock",22,7,"F");
	quest::settimer(1,1111); # 18 min 31 seconds
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_sherlock = plugin::GetRandomFreeLocation(0,30);
		quest::setglobal("halloween_ratter_sherlock",$newzone_sherlock,7,"F");
	
		if($newzone_sherlock > 30){
			my $newzone_sherlock = plugin::GetRandomFreeLocation(0,30);
			quest::setglobal("halloween_ratter_sherlock",$newzone_sherlock,7,"F");
		}
	}
}