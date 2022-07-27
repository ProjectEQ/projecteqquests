# items: 51121, 51122, 18017, 13573
sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18017)) {
    $client->Message(15, "Mandaril Dark Knife glances at you with obvious scorn. 'Are you here to seek the ways of the Dark Truth? If that is the case, then read the note in your inventory and then hand it to me. If you are not here for such a purpose, I suggest you leave at once lest you anger me further.'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Desist in your prattle.  If you want idle chitchat. talk to someone else."); 
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121); # Item: Tradeskill Basics : Volume I
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122); # Item: Tradeskill Basics : Volume II
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18017 => 1)) { # Fell Blade Guild Note
		quest::say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth. Once you are ready to begin your training please make sure that you see Faratain, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13573); # Blood Splattered Tunic
		quest::ding();
		quest::faction(265,100); # Heretics
		quest::faction(242,-100); # Deepwater Knights
		quest::faction(254,-100); # Gate Callers
		quest::faction(231,-100); # Craftkeepers
		quest::faction(233,-100); # Crimson Hands
		quest::exp(100);
	} 
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:paineel  ID:75111 -- Mandaril_Dark_Knife
