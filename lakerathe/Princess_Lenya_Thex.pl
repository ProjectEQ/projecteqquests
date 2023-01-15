# items: 20008, 13108, 13109
sub EVENT_SPAWN {
	quest::settimer("yay",600);
	quest::ze(15,"a royal fish changes into a beautiful princess!!");
	quest::shout("I am free..");
	quest::emote("<glug>'  She motions to you to follow her to shore.'");
}

sub EVENT_TIMER {
	if($timer=="yay") {
		quest::depop();
	}
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("I am rescued from the hands of the Teir'Dal! I am grateful.  Show me your [proof of allegiance] along with a key to remove these [dark shackles] and I shall reward thee.");
	}
	if($text=~/proof of allegiance/i) {
		quest::say("When I speak of proof of allegiance, I speak of proof you were sent by one of the [Silent Watch].");
	}
	if($text=~/dark shackles/i) {
		quest::say("My Teir'Dal captors have placed magical shackles upon me.  The shackles prevent me from using my magic to transport myself home nor do they allow me to venture far from Lake Rathetear.  I will require special shackle keys from Highkeep.");
	}
	if($text=~/silent watch/i) {
		quest::say("The Silent Watch are the Royal Family's guardians. If you run into one, maybe he'll teach you a lesson or two!");
	}	
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 20008 => 1, 13108 => 1)){
		quest::say("You have saved me!!  $name, you are my hero!!  Take my amulet and the royal suite key to Tearon in Highkeep.  Help put his soul at ease and he shall reward you.  Now I must go.. I am sorry I cannot transport you as well, but my powers are weak from much swimming.  Farewell, brave soul!");
		quest::summonitem(13109); # Item: Royal Amulet of Thex
		quest::ding();
		quest::faction( 5001, 10); # Faction: Anti-mage
		quest::faction( 226, 10); # Faction: Clerics of Tunare
		quest::faction( 279, 10); # Faction: King Tearis Thex
		quest::exp(500); 
		quest::depop();
	}
	else {
		quest::say("I will require both the shackle key for the [dark shackles] and some [proof of allegiance].");
	}
	plugin::return_items(\%itemcount);
}

