sub EVENT_SAY { 
	if($text=~/nice hat/i){
		quest::say("Thank you, It is worn with pride and is the symbol of the Rivervale Militia");
	}
}

sub EVENT_ITEM {
	plugin::return_items(\%itemcount);
}