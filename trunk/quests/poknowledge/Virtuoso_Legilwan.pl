#Virtuoso_Legilwan.pl
#Bard Tomes/Planar Armor Exchange
#Added tome handins, fixed up this broken file. Dunno if my fixes work yet, but 
#it's closer than just spewing the light and dark greetings multiple times at anyone
#who's unfortunate enough to hail this npc. -Kilelen

sub EVENT_SAY { 
	if($text=~/Hail/i){
		if (($race eq "Dark Elf") || ($race eq "Iksar") || ($race eq "Troll") || ($race eq "Ogre")) {
			quest::emote("raises a brow sharply and gains a face of almost belittling amusement as he eyes $name before him. 'Do you not think yourself out of place here, dark one? Please, do not be offended, for that is not my intent in the least, of course. I would rather see your needs fulfilled to the utmost of your necessity than see you leave this place no more knowledgeable than before your arrival. The library of Myrist in the center of our city is home to the scholars of New Tanaan, who believe themselves to have ascended beyond the 'petty mortal squabbles");
		}
		else{
			quest::emote("gives a gentle, though formal nod of his head in warm greetings. 'Welcome, $name, to the district of Tanaan. We have the utmost faith that this humble place will accommodate your every need most generously. The merchants in scattered throughout our region are quite useful to any tradesmen or adventurer seeking to restock on supplies and the devises of teleportation found in this district should be more than suitable for one of your ilk. If you have come to Tanaan seeking guidance in the ways of mentorship and skills, then know only success in your search for we are more than prepared to accommodate the needs of almost any adventurer. The bards of Norrath who seek guidance without the ravings of a philosophical, political, or religious zealot will find myself to be a most formidable suitor to their needs.'");
		}
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4861 => 1)) ||
		(plugin::check_handin(\%itemcount, 4862 => 1)) ||
		(plugin::check_handin(\%itemcount, 4863 => 1)) ||
		(plugin::check_handin(\%itemcount, 4864 => 1)) ||
		(plugin::check_handin(\%itemcount, 4865 => 1)) ||
		(plugin::check_handin(\%itemcount, 4866 => 1)) ||
		(plugin::check_handin(\%itemcount, 4867 => 1))) {#Imbrued Platemail Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  else {
		plugin::try_tome_handins(\%itemcount, $class, 'Bard');
		plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:poknowledge  ID:202008 -- Virtuoso_Legilwan