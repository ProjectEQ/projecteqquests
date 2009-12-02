#Umvera_Dekash.pl
#Gem Inlaid Gauntlets

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("What, $name ? Do I look like a merchant to you? Just because all these merchants are in my library, it doesn't mean that I am one. If you are [interested] in something other than spell scrolls, then, we can talk.");
	}
	
	if($text=~/interested/i)   {
		quest::say("Ah, so you do have half a wit about you! Very well. As you can clearly see, I am the librarian here. I keep track of all of the mystic tomes that enter this divine building. I also take care of all of the purchasing. Have you something to [offer]?");
	}
	
	if($text=~/offer/i)   {
		quest::say("Excellent! You have no idea how difficult it is to get good help these days. Do you think you would have the time to gather some [information] for me? ");
	}
	
	if($text=~/information/i)   {
		quest::say("Even better! Well, it has been some time since the Tesch Val gnolls moved in on the Split Paw. That being said, we still know little to nothing of their origins. If you can bring me back the four scrolls that our diviners speak of, I believe I can reward you well.");
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18504 => 1, 18505 => 1, 18506 => 1, 18507 => 1)) { #Tanned Split Paw Skin, volumes 1-4
		quest::say("It's about time. Let's see here. Right.. right.. right. Very good. Right. There you are! I translated the text. Now the scrolls need to be bound. Take these scrolls to Jheron Felkis in Freeport. I believe he is staying in one of the spare rooms in Velith and Bardo's establishment. He will ensure they are bound correctly. Return to me when the binding is complete.");
		quest::summonitem(18508);#Tesch Val Compilation
		quest::exp(8000);
	}
	
	elsif (plugin::check_handin(\%itemcount, 18510 => 1)) { #Pawbook
		quest::say("You have returned safely. That is wonderful! Where the heck is my book, child? In my hands, I see. Such a bright little twinkle you are! Well, let me scribble something down on this pad here. There you are. Take this note to Durkis Battlemore in the Butcherblock Mountains. He is a remarkable smith, but more importantly, he owes me for his smithing books.");
		quest::summonitem(8910);#A Note To Battlemore
		quest::exp(16000);
	}
	
	else {
		plugin::return_items(\%itemcount);
	}
}

#End of File zone:qeynos ID: 1143 -- Umvera_Dekash.pl