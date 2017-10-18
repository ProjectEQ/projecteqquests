sub EVENT_SPAWN {
	quest::setglobal("halloween_ratter_zeus",16,7,"F");
	quest::settimer(1,1197); # 19 min 57 seconds
}

sub EVENT_TIMER {
	my $random_result = int(rand(11));
	if($random_result != 5){	
		my $newzone_zeus = plugin::GetRandomFreeLocation(0,20);
		quest::setglobal("halloween_ratter_zeus",$newzone_zeus,7,"F");
	
		if($newzone_zeus > 20){
			my $newzone_zeus = plugin::GetRandomFreeLocation(0,20);
			quest::setglobal("halloween_ratter_zeus",$newzone_zeus,7,"F");
		}
	}
}