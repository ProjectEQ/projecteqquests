sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::emote("flutters about and seems to be staring back at you as if reading and understanding your thoughts!!");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 12271 => 1)){
		quest::emote("gladly gulps up your odd mixture and transforms into..!!");
		quest::unique_spawn(51176,0,0,$x,$y,$z,$h);
		quest::ding();
		quest::faction( 8, 10);
		quest::faction( 43, 10);
		quest::faction( 178, 10);
		quest::depop_withtimer();
	}
	else {
		plugin::return_items(\%itemcount);
	}
}

