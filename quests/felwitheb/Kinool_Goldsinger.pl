sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18778)) { 
		$client->Message(15,"You enter a dimly lit room. In the center of the room, an important looking High Elf stands on a platform. He turns to greet you. 'Welcome young apprentice. I am Kinool Goldsinger, Guild Master of the Enchanters' guild here in Felwithe. Please read teh note in your inventory and when you are ready to begin your training, hand it to me.'");
  }
}

sub EVENT_SAY 
{ 
	if ($text=~/Hail/i)	
	{
		quest::say("Hail and welcome.  I am sure you have much to do, but could I ask a [favor] of you?");
	}
	if ($text=~/What favor/i)
	{
		quest::say("Oh, um, on second thought, never mind.  I should really just do it myself.  Thank you anyway."); 
	}
	if ($text=~/enchanted bow/i) 
	{
  		quest::say("Alas... Another ranger in search of the [Rain Caller]. She is no more");
	}
	if ($text=~/Rain Caller/i) 
	{
  		quest::say("Rain Caller is the name we give each Trueshot longbow once it is enchanted. Unfortunately, I am unable to enchant them any longer. One of the components is no longer available. Someone would have to strike a [deal with the fairie folk]. Once I have that and the [remaining components] I can create the Rain Caller, a ranger's bow");
	}
	if ($text=~/fairie folk/i) 
	{
  		quest::say("The fairie princess, Joleena, used to have a metal gnome deliver [fairie gold dust] to the Keepers every month. She has stopped this and now refuses to offer it to any nation of Faydwer. What she is angry about, we do not know.");
	}
	if ($text=~/gold dust/i) 
	{
 	 	quest::say("Fairie gold dust is an enchanted powder which only a fairie princess can create.");
	}
	if ($text=~/remaining components/i) 
	{
  		quest::say("The remaining components are the Trueshot longbow and a treant heart. There will also be the guild donation in the amount of 3000 gold coins. These and the [fairie gold dust] will merit a ranger the Rain Caller enchanted bow.");
	}
	if($text=~/trades/i) 
	{
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	
	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM 
{ 
	if (plugin::check_handin(\%itemcount,18778 => 1)) # Enrollment Letter
	{
		quest::say("Greetings and welcome aboard!  My name's Kinool. Master Enchanter of the Keepers of the Art.  Here is your guild tunic. Make us proud, young pupil! Once you are ready to begin your training please make sure that you see Yuin Starchaser, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13593); # Torn Training Robe*
		quest::ding();
		quest::faction(170,10); # Keepers of the Art
		quest::faction(178,10); # King Tearis Thex
		quest::faction(99,10); # Faydark's Champions
		quest::faction(322,-15); # The Dead
		quest::exp(100);
	}
	if (plugin::check_handin(\%itemcount, 12333 => 1, 12334 => 1, 8401 => 1) && $gold >= 3000) 
	{
  		quest::say("Fine work!! I now reward you with The Rain Caller.");
  		quest::exp(5000);
  		quest::summonitem(8402);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:felwitheb  ID:62020 -- Kinool_Goldsinger 

