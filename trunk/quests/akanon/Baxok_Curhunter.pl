sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18770)) { 
		$client->Message(15,"Baxok Curhunter, a jittery older looking gnome appears to be startled. 'Well hello there. You scared me! You young ones always popping up here and there. You would think there is a hidden tunnel somewhere around here the way you just popped up near me. Well no matter. If you are here to train with the warriors of Gemchopper Hall, read the note in your inventory and hand it to me to begin your training.'");
  }
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, $name. I invite you to serve the mighty state of Ak'Anon by becoming a Gemchopper. We gnomes are not known for our warrior skills, but those few who endure and survive to become elite amongst our warriors soon find that the technology of the gnomes has found its way into our halls. You must be a [new recruit] or [an outsider], perhaps?");
  }
  if($text=~/new recruit/i) {
    quest::say("Well, good to make your acquaintance, $name. Maybe someday you shall be a great Watchman. Until then, I have a task for you. Will you [serve the Crown] or has a yellow streak appeared upon your back?");
  }
  if($text=~/an outsider/i) {
    quest::say("I should have guessed as much. You look the part.");
  }
  if($text=~/serve the crown/i) {
    if($ulevel <=5 ) {
      quest::say("You are too inexperienced. Leave that business to someone more worldly.");
    }
    else {
      quest::say("Go quickly then $name, hunt down a stolen clockwork named Gearheart who has been taken by the Faeries in Lesser Faydark and return to me his blackbox.");
    }
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
  if(plugin::check_handin(\%itemcount, 18770 => 1)) { # Recruitment Summons
		quest::say("I, Baxok, guildmaster, welcome you to Gemchopper Hall, young warrior! You are expected to serve his majesty, King Ak'Anon, with pride. You have much to learn. You may report to Naygog for further guidance. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
    quest::summonitem(13520); # Torn and Ripped Tunic*
		quest::ding();
    quest::faction(115,10); #+Gem Cutters
    quest::faction(210,10); #+Merchants of Ak'anon
    quest::faction(176,10); #+King Akanon
    quest::faction(71,-15); #-Dark Reflection
    quest::faction(39,-15); #-Clan Grikbar
		quest::exp(100);
	}
  elsif(plugin::check_handin(\%itemcount, 13344 => 1)) {
    quest::summonitem(quest::ChooseRandom(9002,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1010,1011)); #cloth armor or round shield
    quest::faction(115,10); #+Gem Cutters
    quest::faction(210,10); #+Merchants of Ak'anon
    quest::faction(176,10); #+King Akanon
    quest::faction(71,-10); #-Dark Reflection
    quest::faction(39,-10); #-Clan Grikbar
  }
  else {
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:akanon  ID:55173 -- Baxok_Curhunter