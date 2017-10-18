sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_gustave",32,7,"F");
	quest::settimer(1,853); # 14 min 13 sec
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_gustave = plugin::GetRandomFreeLocation(0,40);
		quest::setglobal("halloween_ratter_gustave",$newzone_gustave,7,"F");
		
		if($newzone_gustave > 40){
			my $newzone_gustave = plugin::GetRandomFreeLocation(0,40);
			quest::setglobal("halloween_ratter_gustave",$newzone_gustave,7,"F");
		}
	}
}