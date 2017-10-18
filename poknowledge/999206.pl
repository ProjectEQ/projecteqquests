sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_ocho",24,7,"F");
	quest::settimer(1,1037); # 17 min 17 seconds
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_ocho = plugin::GetRandomFreeLocation(0,30);
		quest::setglobal("halloween_ratter_ocho",$newzone_ocho,7,"F");
		
		if($newzone_ocho > 30){
			my $newzone_ocho = plugin::GetRandomFreeLocation(0,30);
			quest::setglobal("halloween_ratter_ocho",$newzone_ocho,7,"F");
		}
	}
}