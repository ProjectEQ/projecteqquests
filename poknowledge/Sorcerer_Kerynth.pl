#Sorcerer_Kerynth.pl
#Planar Armor Exchange
# items: 1225, 1226, 1227, 1228, 1229, 1230, 1231, 10028, 10037, 22503, 15981

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("gives a gentle smile and polite bow of respect to $name. 'Greetings and welcome to the district of Tanaan, traveler. This place of neutrality is quite content to have you among us, learning from us what we humbly can teach you. Many adepts who were adventurers not too different from yourself have stepped forward and offered their memories as present lessons to those willing to learn of them. I myself was a master of the elements in my time, though I do not make this declaration as one that craves due respect for the title. Rather, I hope that you may perhaps be of the same path and if you need tutoring in the way of skills, then I would be more than pleased to oblige your needs.'");
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
#END of FILE Zone:poknowledge  ID:202252 -- Sorcerer_Kerynth 