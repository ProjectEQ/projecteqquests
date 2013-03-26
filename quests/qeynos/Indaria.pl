#Indaria.pl
#Indaria's Doll

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Hello, have you seen my doll?");#Text made up
	}
}

sub EVENT_ITEM {	
	if (plugin::check_handin(\%itemcount, 13712 => 1)) {#Doll
		quest::say("Thank you!  Please take this!");#Text made up
		quest::summonitem(1316);#Velvet Choker
		quest::faction(217, 10);#Merchants of Qeynos
		quest::faction(33, -20);#Circle Of Unseen Hands
		quest::faction(9, 10);#Antonius Bayle
		quest::faction(369, 10);#Coalition of Tradefolk III
		quest::faction(135, 10);#Guards of Qeynos
		quest::exp(27440);#1% level 15 xp
	}
	plugin::return_items(\%itemcount);
}

#End of File zone:qeynos ID: 1082 -- Indaria.pl