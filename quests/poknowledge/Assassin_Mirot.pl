#Assassin_Mirot.pl
#Rogue Tome Handins/Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("gives a sharply raised brow and cruelly wicked smirk, his comely features contorted in a sinister mask of disgust and amusement. 'Well, how charming of you to find it within your heart to visit Kartis, my dear pathetic $name. Do not think that you will be received in the manner you had hoped, for we are in the city of knowledge where tolerance for all beings to one extent or another is mandatory. Aaaah, yes, we will tolerate your existence among us, but only for the amusement of watching you squirm uncomfortably when presented with the truth of our purpose. Even further the amusement would stretch is if you would have the audacity to train from one of our adepts -- who are, I assure you, most eager to lend their dark arts to you, for it only fuels the shadow, despite your intent on learning from us.'");
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4901 => 1)) ||
		(plugin::check_handin(\%itemcount, 4902 => 1)) ||
		(plugin::check_handin(\%itemcount, 4903 => 1)) ||
		(plugin::check_handin(\%itemcount, 4904 => 1)) ||
		(plugin::check_handin(\%itemcount, 4905 => 1)) ||
		(plugin::check_handin(\%itemcount, 4906 => 1)) ||
		(plugin::check_handin(\%itemcount, 4907 => 1))) {#Woven Shadow Armor
    	
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }
	
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
	}
#END of FILE Zone:poknowledge  ID:202260 -- Assassin_Mirot 

