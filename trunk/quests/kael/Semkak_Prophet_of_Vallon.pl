#Semkak_Prophet_of_Vallon.pl
#Strategies of the Ancient Dragons

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("You have entered the sacred temple of Vallon Zek. This is the Temple of Strategy. We teach what must be done to be a great leader. Forethought is a powerful tool.");
	}
	if($text=~/teach/i){
		quest::say("I cannot teach one of your kind the arts of war at this time. I must teach the other Kromzek and Kromrif that proper strategy will allow us to win the war against the dragons. If you were to serve the temple of Vallon, I might consider giving you a few words of advice about strategy.");
	}
	if($text=~/serve/i){
		quest::say("The dragons of Velious are ancient and wise beyond belief. They have ageless strategies to destroy their foes. The Temple of Strategy must gain the knowledge they hold. I have heard rumors of a great dragon burial ground. If this tomb indeed exists, find it and seek out the knowledge of the dragons who are now dead. Bring whatever you believe will teach us their strategies and tactics of the past.");
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 24986 => 1)) {#Golden Tablet of Draconic Strategy
  	quest::say("These scrolls are ancient beyond belief. They describe the maneuvers dragons use to avoid being injured by mighty warriors. This will aid the cause of King Tormax greatly. Take this gift from the temple of Vallon and know that you are wise indeed.");
  	quest::faction(188, 20);#Kromrif
  	quest::faction(189, 20);#Kromzek
  	quest::faction(179, 10);#King Tormax
  	quest::faction(42, -30);#Claws of Veeshan
  	quest::exp(1750000);#1% of level 51 exp
  	quest::summonitem(quest::ChooseRandom(25036, 25040, 25034, 25035));#Steel Wristband of Strategy, Shield of Battle, Circlet of Vallon, Book of Strategy
  }
  if(plugin::check_handin(\%itemcount, 24985 => 1)) {#Scroll of Scaled Tactics
  	quest::say("These scrolls are ancient beyond belief. They describe the maneuvers dragons use to avoid being injured by mighty warriors. This will aid the cause of King Tormax greatly. Take this gift from the temple of Vallon and know that you are wise indeed.");
  	quest::faction(188, 20);#Kromrif
  	quest::faction(189, 20);#Kromzek
  	quest::faction(179, 10);#King Tormax
  	quest::faction(42, -30);#Claws of Veeshan
  	quest::exp(1750000);#1% of level 51 exp
  	quest::summonitem(quest::ChooseRandom(25036, 25040, 25034, 25035));#Steel Wristband of Strategy, Shield of Battle, Circlet of Vallon, Book of Strategy
  }
  plugin::return_items(\%itemcount);
}#Done