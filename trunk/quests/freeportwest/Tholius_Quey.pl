sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18736)) { 
		$client->Message(15,"As you bask in the majesty of the Temple of Marr, an important looking individual, clad in shining metal armor turns to greet you. 'I can spot a new recruit a mile away. Welcome to the Temple of Marr. I am Tholius Quey. Read the note in your inventory and hand it to me to begin your training. I wish you the best of luck.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Welcome $name . This is the Temple of Marr and you must be another seeker of passion and valor. That is good. Become one with us and help us to defeat the [fallen knight]. It is he who has caused the demise of this city."); 
	}
	if($text=~/knight/i){
		quest::say("The fallen knight I speak of is none other than Sir Lucan D'Lere. The self proclaimed ruler of this city. He is no ruler and he never was no true Knight of Truth. If it were not for the [Crusade of Tears] this city would still be united in valor."); 
	}
	if($text=~/crusade/i){
		quest::say("In the year of thirty one hundred fifty. the Knights of Truth were called upon by the twin gods Erollisi and Mithaniel Marr. They instructed us to go forth across the Ocean of Tears and across the lands of Faydwer and purge the lands of the undead. It was during this crusade that Freeport was left in the care of Sir Lucan D'Lere. How unfortunate."); 
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18736 => 1)) { #Tattered Note
		quest::say("Welcome to the Priests of Marr. Here, you will be taught how powerful passion truly is. The passion of Erollisi Marr, the Queen of Love, shall flow through you and into all those you meet. Wear this tunic in the name of Love. Once you are ready to begin your training please make sure that yo see Salinsa Delfdosan, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13556); #White and Blue Tunic*
		quest::ding();
		quest::faction(258,10); #Priests of Marr
		quest::faction(105,-15); #The Freeport Militia
		quest::faction(184,10); #Knight of Truth
		quest::exp(100); 
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:freportn  ID:8046 -- Tholius_Quey