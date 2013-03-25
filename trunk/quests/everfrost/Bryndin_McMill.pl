
sub EVENT_ITEM {
	# 13242 :  Three Quarters of Elixir
	if (plugin::check_handin(\%itemcount, 13242 => 1)) {
		quest::say("Ahhh!! I feel warm all over. Thanks. You should go give Arnis McLish a drink of this elixir. Last time I saw him he was headed toward Blackburrow.");
		quest::ding();
		quest::exp(125);
		quest::faction(213,10); # 213 : Faction Merchant's of Halas
		quest::faction(294,10); # 294 : Faction Shaman of Justice
		quest::faction(311,10); # 311 : Faction Steel Warriors
		quest::faction(361,10); # 361 : Faction Wolves of the North
		quest::summonitem(13243); # 13243 :  One Half Full Bottle of Elixir
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:everfrost  ID:30065, 30115 -- Bryndin_McMill

