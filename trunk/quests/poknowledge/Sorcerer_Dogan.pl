#Sorcerer_Dogan.pl
#Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("sneers darkly, revealing a row of unmanaged teeth beneath his grim visage. 'You travel too leniently, child of the light. Return to Selia, for you will find no welcoming here -- only darkness and shadow that would wish to consume you. However, if you are intent upon being among us, then by all means, do so at your own peril -- I care not for what fate befalls you and honestly, do not think you worthy of the shadow's service. Disregard my warnings if you must, but while you do so, do take the time to speak with the other adept minions of the shadow. They present most pressing arguments and will often give you the opportunity to learn from them the ways of their specific art. How marvelous it would be -- oh the irony indeed, that a child of the light would learn the ways of their craft from those whom they claim to detest! Aaaah. . . how you fuel us, and how we marvel at it.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 1225 => 1)) ||
		(plugin::check_handin(\%itemcount, 1226 => 1)) ||
		(plugin::check_handin(\%itemcount, 1227 => 1)) ||
		(plugin::check_handin(\%itemcount, 1228 => 1)) ||
		(plugin::check_handin(\%itemcount, 1229 => 1)) ||
		(plugin::check_handin(\%itemcount, 1230 => 1)) ||
		(plugin::check_handin(\%itemcount, 1231 => 1))) {#Carmine Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  plugin::return_items(\%itemcount);
  }	
#END of FILE Zone:poknowledge  ID:202257 -- Sorcerer_Dogan