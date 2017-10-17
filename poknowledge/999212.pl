sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_paulie",40,7,"F");
	quest::settimer(1,453); # 7 min 33 sec
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_paulie = plugin::GetRandomIndoorLocation(1,40);
		quest::setglobal("halloween_ratter_paulie",$newzone_paulie,7,"F");
		
		if($newzone_paulie > 40){
			my $newzone_paulie = GetRandomIndoorLocation(1,40);
			quest::setglobal("halloween_ratter_paulie",$newzone_paulie,7,"F");
		}
	}
}