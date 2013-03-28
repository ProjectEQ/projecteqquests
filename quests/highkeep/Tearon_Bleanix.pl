sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("The single death of a member of the Paladins of Tunare shall plague your wretched life.");
	}
	if($combat_state==0) {
		quest::say("Let no evil beings stand in the way of the righteousness of the Paladins of Tunare!");
	}
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Beware!!..  Beware, the Teir'Dal walk the halls of Highkeep!!");
	}
	if($text=~/princess lenya thex/i) {
		quest::say("The Princess Lenya Thex is the daughter of His Royal Majesty, King Tearis Thex of Felwithe. She was on her way to Qeynos when we believe she was kidnapped by Carson McCabe, the governor of this vile city. I await the paladin from Felwithe.");
	}	
	if(($text=~/all is not bright above the clouds/i) && ($faction < 4)) {
		quest::say("Taken from this place she has been.  Seek the Highpass hussy.  Ask of her.  Only she knows where.  Find the Princess.  Give her this.  Show your allegiance.  This and her key. Then return the room key to me with the prize from the princess.  Become a hero!!");
		quest::ding();
		quest::summonitem(13108);
	}
	if(($text=~/all is not bright above the clouds/i) && ($faction > 3)) {
		quest::say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 12267 => 1, 13109 => 1)){
		quest::say("Peace..  I can rest now.  You now hold my Silent Watch Shield.  Protect Felwithe..");
		quest::summonitem(9312);
		quest::ding();
		quest::faction( 8, 10);
		quest::faction( 43, 10);
		quest::faction( 178, 10);
		quest::exp(500); 
		quest::depop_withtimer();
	}
  plugin::return_items(\%itemcount);
}

