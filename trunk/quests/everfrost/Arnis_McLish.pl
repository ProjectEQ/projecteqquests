sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::say("My word!! I cannot believe how cold it is out here. I must keep running around just to keep warm.");
	}
	if(($text=~/megan/i) && ($faction < 5)){
		quest::say("I heard she got lost on the plains. You should go ask her dog, Snowflake, where she is. I hear she is somewhere around the pass to Halas.");
	}
	if(($text=~/megan/i) && ($faction == 5)){
		quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
	}
	if(($text=~/megan/i) && ($faction > 5)){
		quest::say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
	}
}

sub EVENT_ITEM {
	# 13243 :  One Half Bottle of Elixir
	if (plugin::check_handin(\%itemcount, 13243 => 1)) {
                quest::ding();
		quest::say("Mmmm.. Thank you stranger. I feel a lot warmer now. You should now go and find [Megan] O'Reilly.");
		quest::exp(125);
		quest::faction(213,1); # 213 : Faction Merchant's of Halas
		quest::faction(294,1); # 294 : Faction Shaman of Justice
		quest::faction(311,1); # 311 : Faction Steel Warriors
		quest::faction(361,1); # 361 : Faction Wolves of the North
		quest::summonitem(13244); # 13244 :  One Quarter of Elixir
	}
    else {
        plugin::return_items(\%itemcount);
	}   
}

sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Fer Halas!! One more victory fer the Wolves o' the North!!");
	}
	if($combat_state == 0) {
		quest::say("For the glory o' the Wolves!!");
	}
}

sub EVENT_DEATH {
	quest:say("The Wolves o' the North shall track ye down and avenge me death.");
}


#END of FILE Zone:everfrost  ID:30049 -- Arnis_McLish

