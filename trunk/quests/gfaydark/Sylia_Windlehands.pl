sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class == "Bard")) { 
		$client->Message(15,"Sylia Windlehands, a beautiful elven bard addresses you. 'Welcome young one. I am Sylia Windlehands. I will start your training in the ways of the Bard. Read the note in your inventory and when you are ready to start training, hand it to me. Never underestimate the power of song, my friend and you will go far!'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Salutations! The Song Weavers are always glad to add a new voice to the choir.  In addition to your voice. will you also [fetch spiderling silk]?  We need some to replace our worn lute strings.  Carry out this task in high tempo and we will show our gratitude.");
	}
	if($text=~/spiderling silk/i){
		quest::say("Very spirited of you!!  Gather four spiderling silk and return them to me.  Good hunting. my friend!!");
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
	if(plugin::check_handin(\%itemcount, 18783 => 1)){ #Tattered Note
		quest::say("Greetings. friend. I am Sylia.  I see that you wish to join our humble guild.  Good.  Here is a gift for you - your guild tunic.  Once you are ready to begin your training please make sure that you see Sarialiyn Tranquilsong, She can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instructd you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13534); #Faded Brown Tunic
		quest::ding();
		quest::faction(306,10); #Song Weavers
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 13099  => 4)) {
		quest::say("Splendid job! Now if you can just keep a tune, you'll be a fine bard.");
		quest::summonitem(13000);
		quest::givecash("0","0","1","0");
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Bard');
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:gfaydark  ID:54088 -- Sylia_Windlehands 

