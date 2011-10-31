#############
#Quest Name: Sir Morgan's Armor
#Author: Blaz
#NPCs Involved: 1
#Items Involved: 5 Gold for a random reward
#################

sub EVENT_COMBAT {
	if ($combat_state==1) {
		quest::say("Squire Wimbley!!  Quickly to my side!!");
	}
}

sub EVENT_DEATH {
	quest::say("The people of the Plains of Karana will avenge my death!");
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 1) {
		quest::say("Hello, Wimbley, old chap!");
	}
	if ($wp == 8) {
		quest::say("Almost there...");
	}
	if ($wp == 9) {
		quest::say("Well, here we are! It is just a short jaunt through the pass ahead. Just remember to take the high road. I'm off, then. Good luck!");
		quest::SetRunning(1);
	}
	if ($wp == 10) {
		quest::SetRunning(0);
	}
}

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hail, traveler! Might I escort you through to Highpass? The path ahead is filled with giants and many other hungry beasts. I assure you, you will be safe with me. I must admit, I am quite experienced in the ways of the warrior. Do you [wish an escort] or will you [travel alone]?");
  }
  if($text=~/wish an escort/i) {
    quest::say("I shall be honored to escort you to Highpass, but you shall have to wait for a spell. I make trips every few hours. I also would be grateful to any who wish to donate gold coins to the upkeep of my armor. The rains in the plains cause much rusting.");
  }
  if($text=~/travel alone/i) {
    quest::say("Then, good luck to you! May your faith protect you. Or at the very least, guide you to a grand afterlife.");
  }
}

sub EVENT_ITEM {
  my $cash = $copper + 10 * $silver + 100 * $gold + 1000 * $platinum;

  if ($cash >= 500) { #5 gold (or equivalent)
    quest::say("What a grand donation!! You must be a rich noble to be making such a donation. Here, I am but a simple warrior, but I found this lying on the highway to Highpass Hold. The lifeless corpse next to it had no more need of it.");
    quest::summonitem(quest::ChooseRandom(2106,2112,2041,13944,2307,3829,1331,17002,7012,8306,10006,10019,5013,5019,5021,5022,6011,5023,7007,7008)); #Patchwork cloak, Patchwork boots, Rusty Weapons, Silver Earring, Bloodstone, Halfling knife, Bronze Dagger, Belt pouch, Damask cap, Mountain Lion Cape, Highkeep Flask, Snakeskin Mask, Drom's Champagne
    quest::faction(135,1); #Guards of Qeynos
    quest::faction(167,1); #Karana Residents
    quest::faction(257,1); #Priests of Life
    quest::faction(183,1); #Knights of Thunder
  }
  else {
    quest::say("Thank you $name, but I do not need this. You can have it back.");
    plugin::return_items(\%itemcount);
    quest::givecash($copper, $silver, $gold, $platinum);
  }
}
#END of FILE Zone:eastkarana  ID:15048 -- Sir_Morgan