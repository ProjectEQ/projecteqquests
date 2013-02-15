sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if (($ulevel == 1) && ($class eq "Rogue")) { 
		$client->Message(15,"Dun McDowell turns to address you. 'Welcome. I trust ye are ready for training in the ways of the rogue? Well read the note in your inventory and hand it to me when ye are ready to begin training.'");
  }
}

sub EVENT_SAY {
	if($text =~ /trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished it be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text =~ /second book/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}	

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18762 => 1)) {
		quest::say("Ah.. ye wish to be a member o' the White Rose, then. eh? Well, let's train ye fer a bit. and see if ye've got what it takes. Once you are ready to begin adventuring make sure you see Lysbith first, she might have a few tasks for you.  Return to me for guidance anytime, I have much to teach you, from the secrets of the profession, to the various [trades] you may wish to dabble in.");
		quest::ding();
		quest::summonitem(13513); # torn white tunic
		quest::faction(275,5); # Rogues of the White Rose
		quest::exp(100);
	} 
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		plugin::return_items(\%itemcount);
	}
}


#END of FILE Zone:halas  ID:29069 -- Dun_McDowell 

