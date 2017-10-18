sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_toby",26,7,"F");
	quest::settimer(1,911); # 15 min 11 sec
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_toby = plugin::GetRandomFreeLocation(0,30);
		quest::setglobal("halloween_ratter_toby",$newzone_toby,7,"F");

		if($newzone_toby > 30){
			my $newzone_toby = plugin::GetRandomFreeLocation(0,30);
			quest::setglobal("halloween_ratter_toby",$newzone_toby,7,"F");
		}
	}
}