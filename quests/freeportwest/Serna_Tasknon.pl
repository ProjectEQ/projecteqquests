#Serna_Tasknon.pl
#Errand for Tonmerk
#Yeah, I can't find dialog.  Hate to see another quest not finished because of it, though.

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Hail $name.");#Text made up
	}

}

sub EVENT_ITEM
{
	if ((plugin::check_handin(\%itemcount, 12126 => 3)) && ($gold + ($silver/10) + ($copper/100) >= 10)) {#3x Shark Bones, 5gp of coins.
		quest::say("These will do nicely.  Here, take this back to Tonmerk.");#Text made up
		quest::summonitem(12125);#Shark Powder
		quest::faction(184, 10);#Knights of Truth
		quest::faction(105, -20);#Freeport Militia
		quest::exp(10000);
	}
	
	if (plugin::check_handin(\%itemcount, 13983 => 1)) {#Inert Potion
		quest::say("I see Tonmerk has remembered me.  Excellent.  Go bring me shark bones, and I will make his powder directly.");#Text made up
		quest::faction(184, 10);#Knights of Truth
		quest::faction(105, -20);#Freeport Militia
	}
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8038 -- Serna_Tasknon.pl