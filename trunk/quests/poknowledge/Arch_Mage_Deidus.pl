#Arch_Mage_Deidus.pl
#Planar Armor Exchange/Magician Tomes/Some other text, preserved but cleaned

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("gives a loathsome, unwavering stare upon $name. His features are steely and cold in their disdain. 'Kartis is the place of shadow - the cornerstone of the seed of corruption in this universe. You have no place here as you are. Return to Selia. for you will find nothing of use to you here. If you intend to decipher the purpose of the shadow or interrupt the training of our disciples, then you are grievously mistaken in your cause. We will share nothing with the likes of you in the ways of knowledge. Though slowly, if you choose to remain, we shall corrupt and contort you to our will. Even through mere acts of training, you will be fueling the shadow and will become a part of it unwittingly or no.'");
	}
}
sub EVENT_ITEM {
	if ((plugin::check_handin(\%itemcount, 1239 => 1)) ||
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
		plugin::try_tome_handins(\%itemcount, $class, 'Magician');
		quest::say("I don't need this.");#Text made up
		plugin::return_items(\%itemcount);
	}
#END of FILE Zone:poknowledge  ID:202258 -- Arch_Mage_Deidus 

