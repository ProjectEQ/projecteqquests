#Earron_Huntlan.pl
#Kwint's Kwest
#Details on what he says when you hand him back the scrap, if you choose to, are non-existant, as are the supposed different faction hits than giving it to Kwint. -Kilelen

sub EVENT_SAY {
	if($text=~/Kwint sent me/i)   {
		quest::say("Kwint? Gave you the line about being my brother, huh? That boy sends me more customers, I tells ya! I give him one free drink for every person he gets to come in. Hey, could you do me a favor and take this voucher to him when you are done drinking? Thanks.");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18821 => 1)) {#Scrap of Parchment
		quest::say("");#text made up
		quest::summonitem(13039);#Ale
		#Supposed to be different faction hits here, but it's not mentioned what, so not giving any.
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}

#End of File zone:qeynos ID: 1106 -- Earron_Huntlan.pl