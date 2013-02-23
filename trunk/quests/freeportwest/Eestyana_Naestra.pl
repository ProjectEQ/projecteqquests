sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18735)) { 
		$client->Message(15,"As you bask in the majesty of the Temple of Marr, an important looking individual, clad in shining metal armor turns to greet you. 'I can spot a new recruit a mile a way. Welcome to the Temple of Marr. I am Eastyana Naestra. Read the note in your inventory and hand it to me to begin your training. I wish you the best of luck.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Welcome to the Hall of Truth!  May the will of Mithaniel Marr guide you through life.  We are glad to see that you have an interest in our ways.  Please speak with any of my priests or knights and they shall help you find your faith."); 
	}
	if ($text=~/militia/i) {
		quest::say("The Freeport Militia is nothing more than a ragtag band of mercenaries and convicts. They act as the guards of this troubled city. Be well aware that they are not the honorable guards you may think they are. They are commanded by Sir Lucan D'Lere, the self-proclaimed ruler of Freeport. We of the Hall of Truth shall set this city free from the grip of the Militia one day. It is our duty as Knights of Truth.");
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
	if(plugin::check_handin(\%itemcount, 18735 => 1)) { #Tattered Note
		quest::say("The Truthbringer welcomes you into his life. Here is the tunic of Marr. Wear it with pride and be sure to conduct yourself with valor. Once you are ready to begin your training please make sure that yo see Salinsa Delfdosan, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13554); #Faded Purple Tunic*
		quest::ding();
		quest::faction(184,10); #Knight of Truth
		quest::faction(86,-15); #Dimal Rage
		quest::faction(105,-15); #The Freeport Militia
		quest::faction(258,10); #Priests of Marr
		quest::faction(311,10); #Steel Warriors
		quest::exp(100); 
	}
	elsif (plugin::check_handin(\%itemcount, 18822 =>1 )) {
		quest::say("Thanks for your hard work.");
		quest::givecash(7,0,1,0);
		quest::summonitem(14003);
	}
	elsif (plugin::check_handin(\%itemcount, 18804 => 1)) {
		quest::say("Thank you, defender of Karana! We have heard rumors of the followers of Bertoxxulous gaining knowledge of our knight who infiltrated the ranks of the [Militia]. They would have tried to sell the information to the Militia. We will inform our knight immediately. As for you, here is a donation to your journey's expenses. Stay clear of the Freeport Militia. There is no doubt they have learned of your alliance with us.");
		quest::faction( 184, 10);
		quest::faction( 86, -15);
		quest::faction( 105, -15);
		quest::faction( 258, 10);
		quest::faction( 311, 10);
		quest::exp(1000);
		quest::givecash(0,0,7,1);
		quest::ChooseRandom(6016,13296);
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
	}
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:freportn  ID:8045 -- Eestyana_Naestra 