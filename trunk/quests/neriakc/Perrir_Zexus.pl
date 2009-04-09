#Perrir_Zexus.pl
#Innoruuk Initiate

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Salutations, $name! Your devotion to our Lord Innoruuk is evident in your actions and on your soul. As a member of the Spires of Innoruuk, you are required to obtain and wear the symbol of your station among the clergy. I can award you the [hematite symbol of Innoruuk] worn by the initiates of the Spires.");
	}
	if($text=~/hematite symbol of Innoruuk/i){
		quest::say("The forest beyond the gates of our grand city has been shaped by the magic of our Lord Innoruuk to be more hospitable to our kind. There are halfling druids in the service of Karana who have set up shrines there in hopes of restoring the forest to its former state. They could never succeed in their task with their feeble powers granted by their insignificant god, yet still, they are a nuisance. Bring me four of the holy symbols worn by the druids and I shall grant you the initiate symbol of Innoruuk.");
	}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 14550 => 4)){#Woven Grass Amulets
		quest::emote("laughs. 'Here, take this then!  You are now and initiate of Innoruuk.  Speak with Ithvol K`Jasn for further advancement.'");#text made up
		quest::summonitem(1369);#Initiate Symbol of Innoruuk
		quest::exp(2000);
		quest::faction(177, 10);#King Naythox Thex
		quest::faction(256, 10);#Priests of Innoruuk
		quest::faction(43, -30);#Clerics of Tunare
		quest::faction(257, -30);#Priests of Life
		quest::faction(258, -30);#Priests of Marr
	}
	else {
  	quest::say("I don't need this.");#text made up
  	plugin::return_items(\%itemcount);
	}
}#END of FILE Zone:neriakc  ID:42084 -- Perrir_Zexus 