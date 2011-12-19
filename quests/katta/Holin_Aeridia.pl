sub EVENT_SPAWN {
	quest::settimer(1,300);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 10682 => 1)) {
		quest::emote("reaches forward as his hands materialize to grasp the box of belongings then places them carefully in his crypt. He then reaches towards $name again as an etherial staff materializes in his hands and is offered to $name.");
		quest::ding();
		quest::summonitem(10685); # Staff of Ethereal Energy
		quest::faction(307,10); #Spirits of Katta Castellum
		quest::faction(228,-10); #Nathyn Illuminious
		quest::faction(168,10); #Katta Castellum Citizens
		quest::exp(10000);
		quest::depop();
	}
	else{
		quest::say("I have no need for this item, $name. You can have it back");
		plugin::return_items(\%itemcount);
	}
}
