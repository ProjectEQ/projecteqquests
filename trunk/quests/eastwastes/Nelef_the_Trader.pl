#Nelef_the_Trader.pl
#Trade with Nelef

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Good day to you, friend! Tell me, have you [traversed the cold] and the muck to forge through the forsaken tomb of the sleeping dragon? Perhaps you've come across mighty beasts with [prismatic power] beyond imagination?!");
	}
	if($text=~/traversed the cold/i){
		quest::say("Aha! I knew you looked like a daring and intrepid adventurer! I've been looking for someone like yourself who has made it through that wretched place alive. I haven't had the privelege of coming across any that have had any [proof] they've been there though, so I'm a little skeptical when someone says they have been there, as you can rightly imagine.");
	}
	if($text=~/proof/i){
		quest::say("What proof? Well, let's see. . . Perhaps you can provide me with some kind of trinket that came from the prismatic dragon himself? I'd be most interested in a scale if you were able to get ahold of one.");
	}
	if($text=~/prismatic power/i){
		quest::say("Well, I have heard stories of a dragon who was after a prismatic scale and the key to enter the tomb as proof that the sleeping beast had been released. When he took them from the daring adventurers, he destroyed the key because he didn't want those people to return to the tomb. I have no idea why he did this, but if you were one of those unlucky few, please return to me the trinket he gave you and I'll return to you the key to regain entrance to that place.");
	}
}

#Broke this up for legibility. All turn in text made up. -Kilelen
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 2700 => 1)) {#Essence Blade
  	quest::emote("beams 'Thank you, take this.'");#text made up
  	quest::summonitem(27265);#Sleeper's Key
  }
  elsif(plugin::check_handin(\%itemcount, 2698 => 1)) {#Essence Lens
  	quest::emote("beams 'Thank you, take this.'");#text made up
  	quest::summonitem(27265);#Sleeper's Key
  }
  elsif(plugin::check_handin(\%itemcount, 2699 => 1)) {#Essence Mace
  	quest::emote("beams 'Thank you, take this.'");#text made up
  	quest::summonitem(27265);#Sleeper's Key
  }
  elsif(plugin::check_handin(\%itemcount, 2748 => 1)) {#Essence Pearl
  	quest::emote("beams 'Thank you, take this.'");#text made up
  	quest::summonitem(27265);#Sleeper's Key
  }
  elsif(plugin::check_handin(\%itemcount, 2842 => 1)) {#Essence Ring
  	quest::emote("beams 'Thank you, take this.'");#text made up
  	quest::summonitem(27265);#Sleeper's Key
  }
  elsif(plugin::check_handin(\%itemcount, 27329 => 1)) {#Prismatic Dragon Scale
  	quest::emote("beams 'Thank you, take this.'");#text made up
  	quest::summonitem(27265);#Sleeper's Key
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
}#END of FILE Zone:eastwastes  ID:116086 -- Nelef_the_Trader 
