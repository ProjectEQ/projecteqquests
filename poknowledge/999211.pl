sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_mortimer",38,7,"F");
	quest::settimer(1,537); # 8 min 57 sec
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_mortimer = plugin::GetRandomIndoorLocation(1,40);
		quest::setglobal("halloween_ratter_mortimer",$newzone_mortimer,7,"F");
		
		if($newzone_mortimer > 40){
			my $newzone_mortimer = plugin::GetRandomIndoorLocation(1,40);
			quest::setglobal("halloween_ratter_mortimer",$newzone_mortimer,7,"F");
		}
	}
}