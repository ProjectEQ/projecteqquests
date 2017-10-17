sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_napoleon",34,7,"F");
	quest::settimer(1,759); # 12 min 39 sec
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_napoleon = plugin::GetRandomFreeLocation(0,40);
		quest::setglobal("halloween_ratter_napoleon",$newzone_napoleon,7,"F");
		
		if($newzone_napoleon > 40){
			my $newzone_napoleon = plugin::GetRandomFreeLocation(0,40);
			quest::setglobal("halloween_ratter_napoleon",$newzone_napoleon,7,"F");
		}
	}
}