#Vorskahn.pl
#Have a Heart

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("You're a brave one to have lasted in these lands for so long. Perhaps we can use your help? The few of us that are still resisting Mata Muram are attempting hit and run strikes on his supply lines. The only trouble is these blasted kyvs. Their bows can strike a field mouse under a new moon at a thousand paces. A few of my fighters fall to their arrows with every retreat. If you are truly sympathetic to our cause, you will bring me as many kyv hearts as you can. We need their numbers thinned out now more than ever.");
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 55801 => 1)) {#Kyv Heart
		quest::say("Well done. For every kyv you bring down you save the life of one of my few remaining soldiers. Soon you will be hailed as a friend amongst the few dragorn that still resist the Muramites.");
		quest::faction(410, 10);#Dranik Loyalists
		quest::faction(432, -20);#Overlord Mata Muram
	}
   
	else {
		plugin::return_items(\%itemcount); #return items if not the ones required
	}
}#END of FILE Zone:draniksscar ID:302047 --Vorskahn.pl
