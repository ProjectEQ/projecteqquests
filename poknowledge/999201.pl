sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_kai",0,7,"F");
	quest::settimer(1,3733); # 1 hour, 2 min, 13 seconds
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_kai = plugin::GetRandomFreeLocation(0,12);
		quest::setglobal("halloween_ratter_kai",$newzone_kai,7,"F");

		if($newzone_kai > 12){
			my $newzone_kai = plugin::GetRandomFreeLocation(0,12);
			quest::setglobal("halloween_ratter_kai",$newzone_kai,7,"F");
		}
	}
}