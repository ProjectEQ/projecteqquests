sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class eq "Rogue")) { 
		$client->Message(15,"Eolorn J'Axx turns towards you. 'Are you a new recruit? All new recruits must read the note in their inventory and hand it to me to begin their training.'");
  }
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("It is good to see new blood in our halls. I am the leader of this house. If you are looking for guidance, seek out the masters within. I rarely appoint tasks to new recruits, unless I need to retrieve the [foreign take].");
  }
  if($text=~/take/i) {
    quest::say("We have rogues operating in a few great cities. We send young rogues to retrieve the monthly take. We have been awaiting the Freeport delivery. The last youth I sent must have been killed along the way. I will need a new runner to [retrieve the chest].");
  }
  if($text=~/chest/i) {
    quest::say("You seem able enough. Here. Take this note to Freeport. Go through the Commonlands and be careful not to encounter any Freeport guards. There is a network of aqueducts accessible through hidden passages. Search the outside walls of Freeport. Take the note to Giz. She will meet you at night, on an island in the harbor. Good luck.");
    quest::summonitem(18844);
  }
	if ($text=~/trade/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if ($text=~/second book/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18752 => 1)) { #tattered note
		quest::say("You wanna be part of the Ebon Mask, huh? Well, you'll need to impress me. Here's your guild tunic. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you. Go find Hekzin, he'll have some work for you, I'm sure. Don't screw up, kid. That pretty face of yours would make a fine trophy, got it? Now, quit breathin' my air, and go get some work done.");
		quest::ding();
		quest::summonitem(13581); #Old Black Tunic*
		quest::faction(90,10); #Ebon Mask
		quest::faction(135,-15); #Guard of Qeynos
		quest::faction(361,-15); #Wolves of the North
		quest::faction(133,-15); #Guardians of the Vale
		quest::faction(31,-15); #Carson McCabe
		quest::exp(100);
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:neriakc  ID:42074 -- Eolorn_J`Axx