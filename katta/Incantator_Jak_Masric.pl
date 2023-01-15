# items: 7373, 7374, 7394
sub EVENT_SAY{
   if($text=~/hail/i){
      quest::say("Greetings. I am in the middle of some important research so regrettably do not have the time to converse.");
   }
}

sub EVENT_SIGNAL{
	quest::depop_withtimer();
}

sub EVENT_ITEM{
   if(plugin::check_handin(\%itemcount, 7373 => 1, 7374 => 3)){
      quest::say("Hopefully these robes still contain enough of a magical imprint from the shades to be useful in successfully warding the Magus Conlegium
      from their kind. Thank you for you assistance. Keep this token as a symbol of your allegiance to the Magus Conlegium.");
      quest::faction(1504,10); # Faction: Magus Conlegium
      quest::faction(1502,1); # Faction: Katta Castellum Citizens
      quest::faction(1503,1); # Faction: Validus Custodus
      quest::faction(1483,-1); # Faction: Seru
      quest::faction(1484,-1); # Faction: Hand of Seru
      quest::faction(1485,-2); # Faction: Eye of Seru
      quest::faction(1541,-2); # Faction: Hand Legionnaries
      quest::summonitem(7394); #Magus Conlegium Token
   }
	plugin::return_items(\%itemcount);
}

