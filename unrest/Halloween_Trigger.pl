sub EVENT_SPAWN {
	quest::spawn2(63099,0,0,-281,696,20.8,149.8); # NPC: Jack_o_Lantern
}

sub EVENT_SIGNAL {
	quest::spawn2(63098,0,0,-1,75,3.1,0); # NPC: Candy_Man
	quest::depop_withtimer();
}
