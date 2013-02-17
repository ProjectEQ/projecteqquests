sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18733)) { 
		$client->Message(15,"As your eyes adjust to the interior of your surroundings, you see Mayor Gubbin and Sheriff Roglio standing nearby. The Mayor turns towards Sheriff Roglio. 'Looks like we have another fine young recruit to join your ranks, Roglio!' Sheriff Roglio looks your way. 'Greetings, recruit. Read the note in your inventory and hand it to me when you wish to start your training.'");
  }
}

sub EVENT_SAY{
	if ($text=~/hail/i){
		quest::say("Hail, $name! Stand tall whenever you are speaking to the Sheriff of Rivervale. I command the warriors of this vale. You must be new to the ranks of the Guardians of the Vale, so be sure to report to your squad at once. We must protect our people. The [danger] has come closer to home. If you are not a deputy, then please leave these halls.");
	}
	if ($text=~/danger/i){
		quest::say("What danger?!! You must be new to the community. The goblins of Clan Runnyeye have been scaling our wall somehow. You must join our forces in exterminating every one of those beasts. Your wages are earned with every four bloody goblin warbead necklaces you return to me. Now be off and fight the good fight.");
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
	if(plugin::check_handin(\%itemcount, 18733 => 1)) { #Hand in Warrior Recuitment Letter
		quest::say("Welcome to the Guardians of the Vale. I'm Roglio Bruth, and I run this proud little outfit. You seem to be of hearty stock, let's put you to work. Here's your guild tunic - hope it fits. Start your training right away. Once you are ready to begin please make sure that you see Dalario Blistbobble, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you."); 
		quest::summonitem(13540); #Old Tan Tunic
		quest::ding();
		quest::faction(133, 10); #Gaurdians of the Vale faction
		quest::faction(208, 10); #Mayor Gubbin faction
		quest::faction(316, 10); #Storm Reapers faction
		quest::faction(218, 10); #Merchants of Rivervale faction
		quest::faction(88,-15); #Dreadguard Outer
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 13931 => 4)){ #Hand in Runnyeye Warbeads
		quest::say("Good work, Deputy $name! We shall soon rid our countryside of the goblin threat. Here are your wages. Eat well tonight!");
		quest::summonitem(13023); #Bixie Berry Buns
		quest::summonitem(13024); #Tanglefoot Tingle Drink
		quest::faction(133, 1); #Gaurdians of the Vale faction
		quest::faction(208, 1); #Mayor Gubbin faction
		quest::faction(316, 1); #Storm Reapers faction
		quest::faction(218, 1); #Merchants of Rivervale faction
		quest::faction(88, -1); #Dreadguard Outer faction
		quest::exp(6400);
		quest::ding();
		quest::givecash(0,8,0,0);
	} 
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
	}
}

#End of File, Zone:rivervale  NPC:19058 -- Sheriff_Roglio
