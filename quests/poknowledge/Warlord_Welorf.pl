#Warlord_Welorf.pl
#Warrior Tomes/Planar Armor Exchange

sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::emote("gathers a deep breath, his body seeming unnaturally stiff within the large suit of iron. His cold, steely eyes glance over you once before addressing you in a low, baritone voice. 'You stand before Welorf, Warlord of the North and former chief of the Steel Warrior's clan. Should you be a warrior, the knowledge of my blade is at your reach and perhaps in time, and with some training, a proper warrior can borne of the weak creature I see before me.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4911 => 1)) ||
		(plugin::check_handin(\%itemcount, 4912 => 1)) ||
		(plugin::check_handin(\%itemcount, 4913 => 1)) ||
		(plugin::check_handin(\%itemcount, 4914 => 1)) ||
		(plugin::check_handin(\%itemcount, 4915 => 1)) ||
		(plugin::check_handin(\%itemcount, 4916 => 1)) ||
		(plugin::check_handin(\%itemcount, 4917 => 1))) {#Indicolite Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
   plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
   #quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);

  }
#END of FILE Zone:poknowledge  ID:202250 -- Warlord_Welorf