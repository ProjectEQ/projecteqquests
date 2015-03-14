sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18787)) { 
		$client->Message(15,"You stand in a large room which appears to be somewhat important. Next to you is a huge Ogre, with an evil grin. 'You come for training? You join us or me will smash you! I am Guntrik. I train you! Read note in inventory and hand to me when ready to start!'");
  }
}

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Mmmph!!  Who you?  Oh. you $name.  You supposed to be promising Craknek.  Me need you.  There bad things in swamp.  You want [help Crakneks] or you [want Guntrik bash your face]!!?");
	}
	if($text=~/what help crakneks/i){
		quest::say("Crakneks warriors!!  They be far back.  Through last caves.  They smash and bash.  They no like Greenbloods.  Bouncers keep thems from bashing.");
	}
	if($text=~/want gruntrik to bash my face/i){
		quest::say("OK!! Me bash!!  You hurt!!");
	}
	if ($text=~/help crakneks/i) {
		quest::say("Go to swamps. Find noble hunters of humans and elves. All have house crests. Return to me and I give things. If you find special item says where hunters sleep, give to me. If meat founded then give to Clurg's cook. She make fine stew and give coins for meat.");
	}
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
	if (plugin::check_handin(\%itemcount, 18787 => 1)) {
		quest::say("Ahh..  good..  good..  here. take..  Now you Craknek! You bash good. Bash lizards. Bash froggies. Bash mushrooms. Remember. you no help Greenbloods. Crakneks stronger than Greenbloods. When you [want to help crakneks] you tell Guntrik. You return to me when you stronger, I teach you many things I know, including how to start working in the various [trades].");
		quest::summonitem(13525);
		quest::ding();
		quest::faction(57,100);  # Craknek Warrior
		quest::faction(46,15);  # Clurg
		quest::faction(128,-15); # Green Blood Knight
		quest::exp(100);
	}
	elsif (plugin::check_handin(\%itemcount, 13361 => 1)) {
		quest::say("One less trouble. Hunhuh!! You do good work. Keep up. Remember to bring any special things to Guntrik. Here junk for good work. Go away now.");
		quest::summonitem(quest::ChooseRandom(5032,5029, 5033, 5031, 13355));
	} 
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:oggok  ID:49043 -- Guntrik 

