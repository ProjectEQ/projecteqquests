#Phantasmist_Abaur.pl
#Planar Armor Exchange
# items: 1246, 1247, 1248, 1249, 1250, 1251, 1252, 10028, 10037, 22503, 15981

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("closes his eyes and in a graceful motion, gives a low, sweeping bow. 'Greetings to you, friend, and welcome to the district of Selia. We are the beacon of light and justice, of all that is good and kind. As Tanaan is the cornerstone of neutrality, we are the shining jewel of righteousness, valor, and honor. I am Phantasmist Abaur and in my years upon Norrath, served as an enchanter within the arcane council of Freeport. Then, the city was in a fledgling state of being -- the Temple of Truth was still in the primordial beginnings of its construction and the city served mostly as a port rather than the functioning metropolis I'm told it has come to be today. If you practice the same art and require aid in learning the fundamental basic skills, then I will be more than pleased to oblige that necessity.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 1246 => 1)) ||
		(plugin::check_handin(\%itemcount, 1247 => 1)) ||
		(plugin::check_handin(\%itemcount, 1248 => 1)) ||
		(plugin::check_handin(\%itemcount, 1249 => 1)) ||
		(plugin::check_handin(\%itemcount, 1250 => 1)) ||
		(plugin::check_handin(\%itemcount, 1251 => 1)) ||
		(plugin::check_handin(\%itemcount, 1252 => 1))) {#Insidious Armor, the comments on Alla's about this not being taken are in error, I believe.  It's Fine Insidious that's not taken.
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202241 -- Phantasmist_Abaur 
