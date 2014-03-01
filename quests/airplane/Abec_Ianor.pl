sub EVENT_SPAWN {
	quest::settimer("depop",300);
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Great, let us waste no more time! Do you wish to begin your test of conception, visualization, or preparation?");
	} elsif ($text=~/conception/i) { #wizard test of conception
		quest::say("Conception is vital. Travel beyond and bring forth an Efreeti Statuette, a Mithril Air Ring, and a Box of Winds. From these I will produce a ring that will protect you where ever you go.");
	} elsif ($text=~/visualization/i) { #wizard test of visualization
		quest::say("Visualize and succeed. Proceed upward and bring to me a White-Tipped Spiroc Feather, a Pulsating Sapphire, and an Amethyst Amulet. With these items, I will be able to produce an amulet that will aid in your travels to our home.");
	} elsif ($text=~/preparation/i) { #wizard test of preparation
		quest::say("Always be prepared. Adventure and return an Efreeti War Staff, some Lush Nectar, a Copper Air Band, and a large Sky Sapphire and you shall be rewarded with the Staff of Storms.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 20951 => 1, 20747 => 1, 20748 => 1)) { #wizard test of conception using efreeti statuette, mithril air ring, box of winds
		quest::summonitem(11686); #solidate mithril ring
		quest::exp(100000);
		quest::say("Excellent! Take this.");
		quest::depop();
	} elsif(plugin::check_handin(\%itemcount, 20958 => 1, 20749 => 1, 20750 => 1)) { #wizard test of visualization using white-tipped spiroc feather, pulsating sapphire, amethyst amulet
		quest::summonitem(14556); #amulet of planar transference
		quest::exp(100000);
		quest::say("Excellent! Take this.");
		quest::depop();
	} elsif(plugin::check_handin(\%itemcount, 20753 => 1, 20965 => 1, 20751 => 1, 20758 => 1)) { #wizard test of preparation using efreeti war staff, lush nectar, copper air band, large sky sapphire
		quest::summonitem(11685); #nargon's staff
		quest::exp(100000);
		quest::say("Excellent! Take this.");
		quest::depop();
	}
	plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
} 