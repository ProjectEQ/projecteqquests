# items: 51121, 51122, 18206, 5140, 18462, 22917, 7881, 18359, 22916, 14790, 14784, 14785, 10034, 10030, 14786
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18206)) { 
		$client->Message(15,"As your reptilian eyes adjust to the darkness of the room, an imposing Iksar turns towards you, addressing you with a sharp hiss. 'I am Prime Hierophant Vek. The time has come young one. You have chosen the path of the Shaman. Open your inventory and read the note within. Once you are ready to begin your training, hand the note to me and we will continue.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Praise to the ancients, my friend! There is much suffering to be given unto the world. I am the Prime Hierophant of the Temple of Terror.  Through me and my fellow priests flows the wisdom of our ancestors.");
	}
	if($text=~/trades/i){
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121); # Item: Tradeskill Basics : Volume I
	}
	if($text=~/second book/i){
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122); # Item: Tradeskill Basics : Volume II
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18206 => 1)){ #guild summon
		quest::say("Welcome, young petitioner. You have been summoned to this temple to join with the Scaled Mystics. Ours is the way of pain and suffering. Here is the weapon of a petitioner. Through you the power of our ancestors shall flow. As your wisdom grows, so shall your power. Someday you may be a vessel for the supreme might of the ancients. Seek knowldege with Oxyn, he is here to help you. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(5140); #Iron Cudgel of the Petitioner
		quest::ding();
		quest::faction(445,100); #Scaled Mystics
		quest::faction(441,25); #Legion of Cabilis
		quest::exp(500);
	}
	elsif(plugin::check_handin(\%itemcount, 18462 => 1, 22917 => 1)){
		quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		quest::summonitem(7881); # Item: Mark of Clarity
		quest::exp(20000);
		quest::ding();
		quest::faction(444,20); # Faction: Swift Tails
		quest::faction(441,10); # Faction: Legion of Cabilis
	}
	elsif(plugin::check_handin(\%itemcount, 18359 => 1, 22916 => 1)){
		quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		quest::summonitem(7881); # Item: Mark of Clarity
		quest::exp(20000);
		quest::ding();
		quest::faction(444,20); # Faction: Swift Tails
		quest::faction(441,10); # Faction: Legion of Cabilis
	}
	elsif (plugin::check_handin(\%itemcount, 14790 =>1 )) {
		quest::emote("stares down at the note, confused, until he recognizes the writing and gasps in shock!");
		quest::say("You spoke to the Brothers? You, a simple Legionnaire? Well, no matter, you are here to test your virtue of sacrifice and we will take pleasure in it as we have for generations even before the Fallen Brothers. One of our greatest allies in pain is disease. In the woods outside our fair city is a small tribe of goblins. There is a certain goblin famed for his [unique weapon]. Take this knife and use it to cut this from the goblin. Then return his weapon, the knife, a sapphire, and an opal to me.");
		quest::summonitem(14784); # Item: Hierophant's Knife
	}
	elsif (plugin::check_handin(\%itemcount, 14784 =>1, 14785 =>1, 10034 =>1, 10030 =>1 )) {
		quest::say("Well done");
		quest::ding();
		quest::summonitem(14786); # Item: Vek's Reference: Vambraces
		quest::exp(10000);
	}
  plugin::return_items(\%itemcount);
}

#Submitted by Jim Mills, with thanks to BWStripes
