#Priestess_Bast.pl
#Champion of the Vah Shir

sub EVENT_SPAWN {
 quest::settimer(1,10);
}

 sub EVENT_TIMER {
 if($timer eq "1") {
  $npc->SetAppearance(1);
  quest::stoptimer(1);
 }
}



sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("speaks to you without opening her eyes or disturbing her meditations, 'Greetings to you. I, like others before me, have dedicated my life to protecting the animals that roam these lands. The blight of poachers and others that would profit from their destruction has overrun their peaceful way of life. You may also serve this noble cause, speak with Sentry Ferin in the field. No doubt there is plenty to be done.'");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 30856 => 1, 30853 => 3)){#The Champion's Cape, 3x Drop of Loda Kai Blood 
		quest::say("You are indeed a friend to us and have earned a place of high honor among our people and our four-legged cousins. Wear this robe with pride and none will ever doubt your conviction for the honor of the felidae.");
		quest::summonitem(30857);#Blessed Champion's Cape
		quest::faction(132, 30);#Guardians of Shar Vahl faction
	}
  	
	else {
		quest::say("I don't need this.");#text made up
		plugin::return_items(\%itemcount);
	}

}#END of FILE Zone:shadeweaver  ID:165132--Priestess_Bast.pl