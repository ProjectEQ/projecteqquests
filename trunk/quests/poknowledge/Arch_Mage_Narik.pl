#Arch_Mage_Narik.pl
#Willamina's Needles/Planar Armor Exchange/Magician Tomes


sub EVENT_SAY {
	if($text=~/Hail/i) {
    quest::emote("gives a deep nod of his head in formal and polite recognition of $name before him. 'Greetings. traveler. and welcome to the district of Tanaan. In light of your presence among us. we have gathered our knowledge and memories of lives past upon Norrath in hopes that our experiences would benefit you in the present. Do not hesitate to approach all citizens of this district. for we are equally fair and willing to grant you the aid that is within our individual power to provide. In my own personal experience upon Norrath. I was a wizard of some power -- though I do not boast. I have offered my knowledge of this art to any who would have the desire to learn from me. Unfortunately. time is not a luxury that you posses in the manner that we of the Plane are graced and thus. I may only offer instruction on skills. If you are in need of spells. then the library of Myrist should be your destination. The scholars there are infinitely wise despite their mortal lineage.'");
  }
  if($text=~/jewel/i) {
    quest::emote("slams his book shut. 'So, the snake has legs after all! Tell Onirelin if he wants this back, he can come here himself and kiss my. . ., no wait. I have a better idea.' He draws closer and whispers, 'Did Onirelin tell you why I took this jewel? I did it in response to him taking my lady love, Elisha Dirtyshoes. We were to be married until she ran off with him. However, she also ran off with my engagement ring I gave to her. It is quite valuable to me, and I would be most happy to have it back. If you can procure it from her, I'll give Onirelin his jewel back. He's suffered long enough, I think.'");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28087 => 1)) {#Narik's Ring
    quest::say("This is truly excellent. You have done well recovering this for me. You may take Onirelin's jewel and also tell him never to set foot near me again. Leave me now, I have much work to do.");
    quest::summonitem(28088);#Onirelin's Jewel
    quest::exp(250);
  }
	elsif((plugin::check_handin(\%itemcount, 1239 => 1)) ||
				(plugin::check_handin(\%itemcount, 1240 => 1)) ||
				(plugin::check_handin(\%itemcount, 1241 => 1)) ||
				(plugin::check_handin(\%itemcount, 1242 => 1)) ||
				(plugin::check_handin(\%itemcount, 1243 => 1)) ||
				(plugin::check_handin(\%itemcount, 1244 => 1)) ||
				(plugin::check_handin(\%itemcount, 1245 => 1))) {#Apothic Armor
    
    			quest::say("Thank you, $name.");#Text made up
    			quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    			quest::exp(3493875);
  }
  else {
   plugin::try_tome_handins(\%itemcount, $class, 'Magician');
   plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:poknowledge  ID:202251 -- Arch_Mage_Narik