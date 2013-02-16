sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18731)) { 
		$client->Message(15,"A jovial yet commanding halfling speaks to you. 'Why hello there. friend! I am Beek Guinders, your new Guild Master. Read the note in your inventory and when you are ready to begin your training, hand it to me!'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::emote("waves enthusiastically and says, Hay, ho, there, young $race!  I'd love to yak it up with you but I'm a bit busy at the moment, trying to find some [help].");
	}
	if($text=~/help/i) {
		quest::say("Well, we're experimenting with some tanning methods but we're running low on supplies. We need to find someone to go out and [gather some things]. Seems no one wants to do an honest day's work any more. I'd do it myself but, errrr, my, uhhh, foot hair has been hurting lately... yes, that's it.");
	}
	if($text=~/gather some thing/i){
		quest::say("Ahhh, excellent! Okay, first, we'll need a couple of wolf pelts. They don't have to be perfect, completely ruined would work just fine, hehe. I'll also need a black wolf skin and a handful of berries. The berries you should be able to find out in the Thicket. I hear they grow in a small canyon near the lone tower. Hurry, hurry!");
	}
	if($text=~/trades/i){
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i){
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 18731 => 1)) { # Tattered Note
		quest::say("Aye. Welcome. my fur-footed friend. My name is Beek Guinders. and I am guildmaster here at the Chapel of Mischief. Here is our guild tunic. Wear it with pride, as it will set you apart from the crowd. Once you are ready to begin your training please make sure that you see Thekela Meepup, she can assist you in experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13538); # Faded Gold Felt Tunic*
		quest::ding();
		quest::faction(259,10); # Priest of Mischief
		quest::faction(208,10); # Mayor Gubbin
		quest::faction(133,10); # Guardian of the Vale
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 13045 => 1, 13782 => 2, 13758 => 1)) {
		quest::say("Hey, great! You found the materials! We'll get to work right away. If you find any more, please come by again. Here's a little something for your troubles, friend.");
		quest::summonitem(quest::ChooseRandom(15014,15201,15207,15208,16303));
		quest::faction(259,10);
		quest::faction(208,10);
		quest::faction(133,10);
		quest::exp(50);
		quest::givecash(23,13,0,0);
	} else {
		quest::say("Whoooops! I'll need the two ruined wolf pelts along with the berries and black wolf skin before I can reward you, $name. Don't dawdle.");
		plugin::return_items(\%itemcount);
		plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
	}
}

#END of FILE Zone:rivervale  ID:19111 -- Beek_Guinders
