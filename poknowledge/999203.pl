sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_aristotle",13,7,"F");
	quest::settimer(1,3597); # 59 min 57 seconds
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_aristotle = plugin::GetRandomIndoorLocation(1,20);
		quest::setglobal("halloween_ratter_aristotle",$newzone_aristotle,7,"F");
		
		if($newzone_aristotle > 20){
			my $newzone_aristotle = plugin::GetRandomIndoorLocation(1,20);
			quest::setglobal("halloween_ratter_aristotle",$newzone_aristotle,7,"F");
		}
	}
}