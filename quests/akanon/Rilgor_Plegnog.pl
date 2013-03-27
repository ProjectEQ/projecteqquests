sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18703)) { 
		$client->Message(15,"An evil cackle echoes throughout the mines as you get your bearings. Rilgor Plegnog turns his gaze upon you. 'Why do you stand about young apprentice?! There is much to learn. Read the note in your inventory and then hand it to me so that we can begin your training! The Dark Reflection will have its revenge!'");
  }
}

sub EVENT_SAY {
  if ($text=~/mechanical pen/i) {
    quest::say("Why do you want one of those contraptions. You will spend more time repairing it then you will writing with it. But if you insist on getting one, you are going to have to do a small favor.");
    quest::emote("tugs at your robe and grins evilly. 'Mighty nice outfit you have there. Sure beats these drab robes us three are wearing. Hmm...my favorite color is purple, in fact a shiny metallic purple would do nicely. How bad did you want that pen?'");
  }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18703 => 1)) {  # Old Folded Letter
   	quest::say("It's always good to see new blood eager to learn teh dark art of mind control. Please take this robe as a symbolization of loyalty to this house. Once you are ready to begin your training please make sure that you see Tilkzog Mournunder, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
    quest::summonitem(13524); # Dark Gold Felt Robe*
		quest::faction(71,10); #Dark reflection
		quest::faction(91,-15); #eldritch collective
		quest::faction(115,-15); #gem choppers
		quest::faction(76,-15); #Deepmuses
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount, 1360 => 1)) {
    quest::say("Very nice!! It is perfect! Here take this pen. Have fun with it.");
    quest::exp(50000);
    quest::summonitem(10600);
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: akanon ID: 55121 NPC: Rilgor_Plegnog