sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18777)) { 
		$client->Message(15,"As you enter what seems to be a small bedroom, a beautiful High Elf woman looks your way. 'Hello. You have come for training in the ways of the Keepers of the Art? Very good. Please read the note in your inventory and when you are ready to begin, hand it to me.'");
  }
}

sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Greetings, $name . Welcome to the home of the Keepers of the Art. I am in need of spell components. Would you be willing to [fetch] some for me?");
  }
  if($text=~/fetch/i){
    quest::say("What I need are some bat wings for a spell I am researching. If you bring me back four bat wings, I would be willing to reward you with a scroll.");
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
  if (plugin::check_handin(\%itemcount,13068=>4)) {
    quest::say("Ah yes.  These are exactly what I need.  Thank you very much.");
    quest::summonitem(quest::ChooseRandom(15310,15332));
    quest::faction(170,5);
    quest::faction(178,5);
    quest::faction(99,5);
    quest::faction(322,-10);
    quest::ding();
    quest::exp(350);
  }
  elsif (plugin::check_handin(\%itemcount,18777=> 1)) { # Enrollment Letter
    quest::say("Welcome. I am Niola Impholder. Master Magician of the Keepers of the Art. Here is our guild tunic. Once you are ready to begin your training please make sure that you see Yuin Starchaser, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
    quest::summonitem(13592); # Faded Training Robe*
		quest::ding();
		quest::faction(170,10); # Keepers of the Art
		quest::faction(178,10); # King Tearis Thex
		quest::faction(99,10); # Faydark's Champions
		quest::faction(322,-15); # The Dead		
    quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount,18902=> 1)) {
    quest::say("She is still alive? OH, thank you for this news.");
    quest::summonitem(1307);
    quest::exp(30000);
    quest::ding();
  }
	else {
		quest::say("I have no need for this $name, you can have it back.");
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:felwitheb  ID:62021 -- Niola_Impholder 

