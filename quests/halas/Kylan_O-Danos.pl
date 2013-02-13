sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class == "Warrior")) { 
		$client->Message(15,"A stern looking Barbarian turns to greet you. 'A new recruit? Well you better get ready for some hard work! I don't tolerate laziness! I am Kylan O`Danos, your new Guild Master. Read the note in your inventory and give it to me when you are ready to begin your training!'");
  }
}

sub EVENT_SAY {
  if ($text=~/trades/i) {
    quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
    quest::summonitem(51121); # Tradeskill Basics Volume 1
  }
  if ($text=~/second book/i) {
    quest::say("Here is the second volume of the book you requested, may it serve you well!");
    quest::summonitem(51122); # Tradeskill Basics Volume 2
  }
}

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18760 => 1)) {
    quest::say("Greetin's! We are the mighty Wolves o' the North, protectors o' Halas, and we must work hard t' keep it safe fer our citizens. Here is our tunic, it identifies ye as a proud warrior o' this great city. Once you are ready to begin your training please make sure that you see Lysbith, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
    quest::summonitem(13511);
    quest::faction(361,10); # Wolves of the North
		quest::faction(294,10); # Shamen of Justice
		quest::faction(213,10); # Merchants of Halas
		quest::faction(311,10); # Steel Warriors
		quest::exp(100);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:halas  ID:29057 -- Kylan_O`Danos