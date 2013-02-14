sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class == "Warrior")) { 
		$client->Message(15,"A stern looking man turns to greet you as you get your bearings. 'Come, young recruit. I am Regren, Guild Master of the Emerald Warriors. Read the note in your inventory and then hand it to me to begin your training as a proud Warrior. Unless you would rather prance about with the pixies and such. The choice is yours.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i){
		quest::say("Welcome, warrior! Show the Emerald Warriors your mettle and bring me a ruined wolf pelt, some bat fur, some bone chips, and a spiderling eye from the depths of Greater Faydark. If you succeed, my admiration and a reward will be yours. To battle!");
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
	if(plugin::check_handin(\%itemcount, 18782 => 1)){ #Recruitment Letter
		quest::say("Welcome to the Emerald Warriors. Hmmm, you have a lot of training to do, so let's get started right away. Here's our guild tunic, represent us well, young $name. Once you are ready to begin your training please make sure that you see Josylyn Greenblade, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13533); #Old Green Tunic
		quest::ding();
		quest::faction(92,10); #Emerald Warriors
		quest::faction(155,-15); #Indigo Brotherhood
		quest::faction(212,10); #Merchants of Felwithe
		quest::faction(174,10);  #Kelethin Merchants
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount,13073=>1,13782=>1,13253=>1,13069=>1)) {
		quest::say("Fine work! You are on your way to becoming an adequate combatant.");
		@randomGivenItems = (5013,5014,5015,5016,5019,5020,5021,5022,5023,5024,5025,5042,5043,5044,5045,5046,5047,5048,5049,5070,5071,6011,6013,6014,6015,6016,6030,6031,6032,6033,7007,7008,7009,7010,7021,7022,7023,7024);
		my $a = $randomGivenItems[int(rand(scalar @randomGivenItems))];
		quest::summonitem($a);
		quest::faction(92,10);
		quest::faction(155,-10);
		quest::faction(174,10);
		quest::faction(212,10);
		quest::exp(500);
	}
	else {
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:gfaydark  ID:54093 -- Regren