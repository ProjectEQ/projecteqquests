sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_sprocket",36,7,"F");
	quest::settimer(1,653); # 10 min 53 sec
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_sprocket = plugin::GetRandomFreeLocation(0,40);
		quest::setglobal("halloween_ratter_sprocket",$newzone_sprocket,7,"F");
		
		if($newzone_sprocket > 40){
			my $newzone_sprocket = plugin::GetRandomFreeLocation(0,40);
			quest::setglobal("halloween_ratter_sprocket",$newzone_sprocket,7,"F");
		}
	}
}