sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	quest::settimer("repeat", 530);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class eq "Rogue")) { 
		$client->Message(15,"Mater appears a bit startled by your appearance. 'You enjoy sneaking up on people do ya? Come to think of it ya do kind of look like you would make a good rogue. Read the note in your inventory and hand it to me when you wish to start your training.'");
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
      quest::say("Welcome to the mines of Kaladim!"); 
  }
  if (($text=~/pick 628/i) && ($class eq "Rogue")) {
    if (plugin::check_hasitem($client, 12166)) { #Parrying Pick 628
      quest::say("Ah, so Diggins sent you, eh? You can prove you are worthy of the Miners Pick 628 if you bring me the head of that filthy Boog Mudtoe... oh, and 300 gold pieces should cover the cost of the pick."); #Text made up
    }
    else {
      quest::say("I do not think you are ready for such power. You need to prove yourself first. Maybe you should go talk with Diggins."); #Text made up
    }
  }
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
  my $cash = $copper + $silver * 10 + $gold * 100 + $platinum * 1000;
  if (plugin::check_handin(\%itemcount, 13316 => 1)) { #Ogre Head
    if ($cash >= 30000) { #300 gold
      quest::say("Excellent work, $name. Take this as proof of your hard work!"); #Text made up
      quest::summonitem(12161); #Miners Pick 628
    }
    else {
      quest::say("It seems you are a little short on gold pieces...");
      quest::summonitem(13316); #Ogre Head
      quest::givecash($copper, $silver, $gold, $platinum);
    }
  }
  elsif (plugin::check_handin(\%itemcount, 18767 => 1)) { #Small, Folded Note
    quest::say("Ah, welcome! We could use some fresh blood around here. The name's Mater, and I run this little outfit. Work hard for me, and I will reward you well. Cross me, and you'll find yourself buried under the mine cap. Once you are ready to begin your training please make sure that you see Crovsar Dirkbringer, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
    quest::summonitem(13516); #Ruined Miner's Tunic
		quest::ding();
		quest::faction(220,10); # Miners Guild 628
		quest::faction(33,-15); # Circle of Unseen Hands
		quest::faction(29,-15); # Butcherblock Bandits
		quest::faction(77,10); # Deeppoockets
		quest::faction(90,-15); # Ebon Mask
    quest::exp(100);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER {
  quest::say("Blast all these pesky rats!! Jeet, you need to get one of the new rogues.. I mean miners, to get rid of them!!");
  quest::signal(67018,1)
}

#END of FILE Zone:kaladimb  ID:67019 -- Mater