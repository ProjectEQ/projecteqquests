sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18786)) { 
		$client->Message(15,"As you orient yourself amongst the peacefulness of the treetop city of Kelethin, a melodic, peaceful voice breaks the silence. 'I am the Heartwood Master. Read the note in your inventory and when you wish to begin your training, hand it to me. We must pledge our lives to protect the great forest, Faydark against all those who would wish it harm!'");
  }
}

sub EVENT_SAY { 
	if ($text=~/hail/i){
		quest::say("Greetings, child of Tunare. As druids of the Mother of all, we may only use blunt weapons and the scimitar, all other blades are forbidden. Prove your devotion by bringing me a [rusty short sword], a [rusty long sword], a [rusty broad sword], and a [rusty bastard sword]. I will destroy them and reward your faith.");
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
	if(plugin::check_handin(\%itemcount, 18786 => 1)){ #Tattered Note
		quest::say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Once you are ready to begin your training please make sure that you see Aliafya Mistrunner, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13537); #Green and Tan Tunic
		quest::ding();
		quest::faction(304,10); #soldier of Tunare
		quest::faction(178,10); #King Tearis Thex
		quest::faction(99,10);  #Faydark's Champions
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 5013 => 1, 5016 => 1, 5019 => 1, 5022 => 1)) {
		quest::say("You have done well, child! Take this as a blessing from Tunare for doing her will.");
		quest::summonitem(5047);
		quest::givecash("0,0,6,0");
		quest::exp(250);
	}
	else {
		quest::say("I have no need for this $name, you can have it back");
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:gfaydark  ID:54083 -- Heartwood_Master 