# Vkjor's Major Task
# Vkjor's Minor Task
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){
	quest::say("Greetings, $race. Welcome to the great arena of Kael Drakkel. I am Vkjor, master of the arena. The games begin and end when I wish them to. Gladiators train themselves year round to entertain the populace of Kael. Have you come to watch, or is there something else I can help you with?");  
	}

if($text=~/something else/i){
	quest::say("What is it you need? Do you wish to be a gladiator or something along those lines? I do not allow your kind to fight in the arena, I am sorry to say. It is a sacred place for the children of Zek. If you wish to hone your battle skills, however, I do have several things I need taken care of.");  
	}

if($text=~/taken care of/i){
	quest::say("I have several things which must be dealt with. However I must know if you are capable of the tasks before I send you off. Do you fight like an ice wurm or a dragon?"); 
	}

if($text=~/fight like a dragon/i){
	quest::say("If you fight like a dragon, I suppose destroying one might not be that hard for you. Several years ago, Nevederia led a flight of dragons to defile the Temple of Rallos Zek. We beat them back to the skies but not without our losses.");  
	}

if($text=~/losers/i){
	quest::say("My youngest son, Vkjrog, now rests with Rallos Zek in the Plane of War. The loss has sapped me nearly of my will to live. However, a few things keep me going - my duty to keep the arena in order and the knowledge that I might still bring pain and suffering to Nevederia. I wish her to suffer as I did with the loss of a child. She may stay safe in the Temple of Veeshan but her brood does not. Slay her three children and bring me proof of their deaths so they may serve as my message to Nevederia. I will compensate you with a pair of gloves fit for a fine warlord if you can give me this satisfaction.");  
	}

if($text=~/help you with/i){
	quest::say("What is it you need? Do you wish to be a gladiator or something along those lines? I do not allow your kind to fight in the arena, I am sorry to say. It is a sacred place for the children of Zek. If you wish to hone your battle skills, however, I do have several things I need taken care of.");  
	}
	
if($text=~/Ice wurm/i){	
	quest::say("Very well, young one. A friend of mine named Graktar recently traveled to the Eastern Wastes in search of the remains of his brother, Vkalth. Please take this note to Graktar and assist him in his search. Return to me when you have news of his fate.");
	quest::summonitem(25102); # Large note  
	}
	
}


sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 25128 => 1, 25129 => 1, 25127 => 1)) { # Bloody claws of Draazak, Jerigozia, and Veredenia
	quest::say("I honestly did not expect you to be able to destroy her children, $name. Vkjrog must have guided your hand as you slew those beasts. Nevederia will now know sorrow the like of which she has never felt.' Vkjor drops a shiny pair of gauntlets on the ground before you as he turns his attention to the bloody claws he now holds.");  
	quest::faction(189,5); # Kromzek
	quest::faction(188,5); # Kromrif
	quest::faction(179,5); # King Tormax
	quest::faction(42,-10); # Claws of Veeshan
	quest::exp(40000);
	quest::summonitem(25078); # Silver Steel Gauntlets	
	}

}

# END of FILE Zone:kael  ID:113365, 113276, 113180 -- Vkjor.pl
