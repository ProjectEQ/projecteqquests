sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18743)) { 
		$client->Message(15,"You find yourself in a small, dimly lit room. A dark figure steps from the shadows and greets you. 'Welcome young apprentice. I am Pietro Zarn your new Guild Master. I am glad you found us. Read the note in your inventory and hand it to me when you wish to begin your training.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Who are you that you dare to speak with the great Pietro Zarn!! I see nothing more than a whelp in front of me. Innoruuk himself speaks with me. And now you expect me to waste words on you, a common. Begone $name . You have nothing to peak my interest, only my rage.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18743 => 1)) { # A tattered note
		quest::say("A new member to carry the rage of Innoruuk into the city and beyond. How wonderful. I must admit that you do not appear to carry the rage within. Hopefully you shall color the battlefields with the blood of many knights from the Hall of Truth. Here. Wear this tunic with pride. Once you are ready to begin your training please make sure that yo see Gunex Eklar, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13561); # Faded Crimson Tunic
		quest::ding();
		quest::faction(86,10); # Dismal Rage
		quest::faction(184,-15); # Knights of Truth
		quest::faction(235,10); # Opal Dark Briar
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 18961 => 1)) { # Translated Parchment ID- 18961
		quest::ding();
		quest::say("I will deal with this $name. Take this and know that you are welcomed by the Dismal Rage.");
		quest::exp("100");
		quest::summonitem("12153"); # Rage War Maul ID-12153 
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:freporte  -- Pietro_Zarn