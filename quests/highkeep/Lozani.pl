# Illegible Scrolls

sub EVENT_SAY { 

if($text=~/Hail/i){

	quest::say("Greetings. friend!!  I am Lozani. Scribe Supreme of the Eldritch Collective.  I have been sent forth from the great Library of Mechanimagica in the city of Ak'Anon. to study the arcane knowledge of man and beast alike.  I have studied many languages and spells. from Crushbone to Kerra Ridge.  I have found most languages hard to decipher.  As of this date. I have learned to read only the script of the [orc oracles].  Oh well. I am on a five decade mission.  Better luck next language."); 

}
if($text=~/orc oracles/i){

	quest::say("I have been studing there scrolls and cantrips. Currently though I am out of ones to study. If you bring me back a scroll or two cantrips I might be able to reward your efforts.");
	
	}
	
}

sub EVENT_ITEM { 


if (plugin::check_handin(\%itemcount, 13225 => 1)) { # Illegible Scroll
	
	quest::say("I managed to decipher this one.");
	quest::summonitem(quest::ChooseRandom(15200, 15042, 15226, 13360, 15246, 15276)); #low level spell or Rotted Illegible Scroll 
	quest::faction(115,5); #Gem Choppers
	quest::faction(176,5); #King AkAnon
	quest::faction(210,5); #Merchants of AkAnon
	quest::faction(71,-5); #Dark Reflection
	quest::faction(322,-5); #The Dead	

}

elsif (plugin::check_handin(\%itemcount, 13845 => 2)) { # Illegible Cantrip

	quest::say("I managed to decipher these.");
	quest::summonitem(quest::ChooseRandom(15200, 15042, 15226, 13360, 15246, 15276));  #low level spell or Rotted Illegible Scroll 
	quest::faction(115,5); #Gem Choppers
	quest::faction(176,5); #King AkAnon
	quest::faction(210,5); #Merchants of AkAnon
	quest::faction(71,-5); #Dark Reflection
	quest::faction(322,-5); #The Dead

}
	else {

    quest::say("I have no need for that.");

    plugin::return_items(\%itemcount);

}

}

#END of FILE Zone:highkeep  ID:6029 -- Lozani 

