#Guard_Kwint.pl
#Kwint's Kwest
#Scrap found with the query: select * from items where lore like '%Lion\'s Mane%'
#Item lore is "Lion's Mane Drink Voucher", seems to me to be correct. -Kilelen

sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}




sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Hail, $name! Are you new to Qeynos? If you are, I highly recommend stopping by the Lion's Mane Tavern for the best ale in Antonica. Oh, did I mention that my brother Earron is the master brewer there? Tell him [Kwint sent] you.");
	}
}

sub EVENT_ITEM {	
	if (plugin::check_handin(\%itemcount, 18821 => 1)) {#Scrap of Parchment
		quest::say("Hey. Thanks! Sorry about that 'he's my brother' bit but I am sure you had a good time at the Lion's Mane anyway. I sure didn't lie to you about the quality of the ale there.");
		quest::faction(135, 10);#Guards of Qeynos
		quest::faction(9, 10);#Antonius Bayle
		quest::faction(33, -20);#Circle Of Unseen Hands
		quest::faction(53, -20);#Corrupt Qeynos Guards
		quest::faction(217, 10);#Merchants of Qeynos
		quest::exp(8000);#Enough to ding level 2
		my $cp = int(rand(8));
		quest::givecash($cp, 0, 0, 0);
	}
	plugin::return_items(\%itemcount);
}

#End of File zone:qeynos ID: 1151 -- Guard_Kwint.pl