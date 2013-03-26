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
      quest::faction(206,10);
      quest::faction(168,10);
      quest::faction(350,10);
      quest::faction(284,-30);
      quest::faction(139,-30);
      quest::faction(96,-30);
      quest::faction(138,-30);
      quest::summonitem(7394); #Magus Conlegium Token
   }
	plugin::return_items(\%itemcount);
}

