#113020.pl (Clrakk_Blackfist)
#Strife to the Coldain

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::emote("looks down at you. 'What is it you want, $name? Why do you speak to the great Knight Clrakk Blackfist?'");
	}
	
	if ($text=~/bring strife/i) {
		quest::say("The Coldain have grown complacent. The defenses of their city are built to keep my kind and dragonkind at bay. However, their defenses against the smaller races such as yourself are not nearly as sophisticated. I wish to kill many Coldain, but now is not the time for that. There is a particular Coldain whose death will strike fear into the hearts of many. His name is Deaen Greyforge, a Coldain knight. He is both feared and respected by his kind. If you can destroy him, it will send a message to the Coldain that they are not safe from the wrath of the giants. Kill him and chop his body into bits. Bring me a few pieces as proof that the fool is dead.");
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 25115 => 1)) {#Hand of Deaen Greyforge
		quest::say("You truly are a bringer of strife, $name. Take this. I hope it will assist you. Use it in our war against the Coldain scum.");
		quest::summonitem(25054);#Mask of Malediction
		quest::faction(188, 10);#Kromrif
		quest::faction(189, 10);#Kromzek
		quest::faction(49, -20);#Coldain
		quest::faction(42, -20);#Claws of Veeshan
	}
	
	elsif(plugin::check_handin(\%itemcount, 25114 => 1)) {#Legs of Deaen Greyforge
		quest::say("You truly are a bringer of strife, $name. Take this. I hope it will assist you. Use it in our war against the Coldain scum.");
		quest::summonitem(25051);#Dark Spear of Venom
		quest::faction(188, 10);#Kromrif
		quest::faction(189, 10);#Kromzek
		quest::faction(49, -20);#Coldain
		quest::faction(42, -20);#Claws of Veeshan
	}
   
	plugin::return_items(\%itemcount); #return items if not the ones required

}#END of FILE Zone:kael ID:113020 and 113258 --Clrakk_Blackfist.pl
