sub EVENT_SPAWN {
	quest::settimer("1",1500);
}

sub EVENT_TIMER {
	if($timer == "1") {
		quest::depop_withtimer();
	}
}


sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Get your wretched hide away from me! Who knows what vile stench you have been rolling around in?! Do not speak with me unless you have some glimmer of intelligence!");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18842 => 1)) { # Sealed Letter (Letter To Krynn)
		quest::say("Another young warrior. I pray you shall not meet the fate of the last twelve. Here then. Take this report to Mistress Seloxia at once. And stay clear of the Froglok lair called Gukk.");
		quest::exp(250);#5% of level 2 experience, quest is for levels 2+
		quest::summonitem("18843"); # Sealed Letter (Letter To Seloxia)   
		quest::ding();
	}
	else {
		quest::say("I do not need this.");
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:oggok  ID:49092 -- Ambassador_K`Ryn