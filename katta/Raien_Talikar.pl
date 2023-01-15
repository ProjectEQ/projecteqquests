# items: 10683, 10699
sub EVENT_SPAWN {
	quest::settimer(1,300);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 10683 => 1)) {
		quest::emote("reaches forward as his hands materialize to grasp the box of belongings then places them carefully in his crypt. He then reaches towards $name again as an etherial scimitar materializes in his hands and is offered to $name.");
		quest::ding();
		quest::summonitem(10699); # Scimitar of Ethereal Energy
		quest::faction(1538,10); #Spirits of Katta Castellum
		quest::faction(1505,-10); #Nathyn Illuminious
		quest::faction(1502,10); #Katta Castellum Citizens
		quest::exp(10000);
		quest::depop();
	}
	plugin::return_items(\%itemcount);
}
