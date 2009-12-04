#Warlord_Korehan.pl
#Warrior Tomes/Planar Armor Exchange

sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::emote("stands tall and in a stiff, well-trained mode, salutes $name. 'Welcome to the district of Selia. 'ere, ye will find that we all be children of light -- that virtues such as valor and justice are 'eld in the utmost respect and fervent reverence. Dinnae be fooled by our appearance, friend, fer we may differ in religions, but our focus be paralleled. If ye be a young warrior searchin' fer a mentor in the skills of the blade, then ye certaintly 'ave come t'the right man. If ye be of another art, then dinnae be discouraged, fer Selia 'olds many adepts and ye shall find one to suit ye in our midst.'");
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
#END of FILE Zone:poknowledge  ID:202011 -- Warlord_Korehan