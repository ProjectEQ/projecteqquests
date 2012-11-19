sub EVENT_SPAWN {
	quest::say("Who is the most fearless [vampyre slayer] of your fellowship?");
	quest::settimer(1,300);
}

sub EVENT_SAY {
	if(($text=~/vampyre slayer/i) && ($faction < 6)) {
		quest::emote("hands $name his bloodied stake and rifles through his backpack. 'Here, hand me back my stake and you can have this brand new one that has been enchanted by the Praecantors of the Magus Conlegium.'");
		quest::summonitem(2690); #Blood Crusted Stake
	}
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 2690 => 1)) {
		quest::say("On behalf of the citizens of Katta Castellum I extend our gratitude for your assistance in our war with the Coterie of the Eternal Night!");
		quest::summonitem(2689); #Johanius Stake of Slaying
		quest::exp(500);
		quest::depop();
	}
	plugin::return_items(\%itemcount);
}

