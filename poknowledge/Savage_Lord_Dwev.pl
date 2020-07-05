#Savage_Lord_Dwev.pl
#Beastlord Tomes/Planar Armor Exchange
#I added the tome handin, it didn't exist previously - Kilelen
# items: 7817, 7818, 7819, 7832, 7833, 7834, 7835, 10028, 10037, 22503, 15981

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::emote("growls lowly, the rumble from the depths of his throat akin to that of a starved tiger prepared to pounce upon its first prey. 'Yoo worm! Yoo worm stupidly come to shadow, and now shadow wants worm to be its slave. Worm shood stay and be shadow's slave, be Dwev's slave. Dwev teech worm how to rip spirits frum spirit world and make beasts worm's slaves, like worm be to Dwev! HAHA! Yes. Dwev smart! Dwev serve shadow faith. . . faithful. . . gud with new worm slave.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 7817 => 1)) ||
		(plugin::check_handin(\%itemcount, 7818 => 1)) ||
		(plugin::check_handin(\%itemcount, 7819 => 1)) ||
		(plugin::check_handin(\%itemcount, 7832 => 1)) ||
		(plugin::check_handin(\%itemcount, 7833 => 1)) ||
		(plugin::check_handin(\%itemcount, 7834 => 1)) ||
		(plugin::check_handin(\%itemcount, 7835 => 1))) {#Anthemion Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
		plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
		plugin::return_items(\%itemcount);
	}
#END of FILE Zone:poknowledge  ID:202235 -- Savage_Lord_Dwev 