# items: 12271
sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::emote("flutters about and seems to be staring back at you as if reading and understanding your thoughts!!");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 12271 => 1)){
		quest::emote("gladly gulps up your odd mixture and transforms into..!!");
		quest::unique_spawn(51176,0,0,$x,$y,$z,$h); # NPC: Princess_Lenya_Thex
		quest::ding();
		quest::faction( 5001, 10); # Faction: Anti-mage
		quest::faction( 226, 10); # Faction: Clerics of Tunare
		quest::faction( 279, 10); # Faction: King Tearis Thex
		quest::depop_withtimer();
	}
	plugin::return_items(\%itemcount);
}
