sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18723)) { 
		$client->Message(15,"A commanding, yet kind looking Erudite turns towards you as you attempt to get your bearings. 'Do not be startled. I am Leraena Shelyrak, Guild Master for the Clerics of Quellious. Read the note in your inventory and hand it to me when you are ready to begin your training.'");
  }
}

sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Welcome. my child.  I am Leraena Shelyrak. overseer of the Temple of Divine Light. Inside this temple. you may find the path to inner peace.  Introduce yourself to each of the priests and priestesses of the temple as well as the paladins. Together we shall put an end to such disruptive influences as the [kobold shamans]."); 
  }
  if($text=~/kobold shaman/i){
    quest::say("The primitive kobold race has begun to show signs of healing ability.  No doubt this was granted by some evil deity.  Since they are of little power compared to a much more superior race such as ours. we only require the talents of young priests to [slay the kobold shaman].");  
  }
  if($text=~/slay/i){
    quest::say("You are so young...  Go to Toxxulia and find these kobold shamans.  Cut off their paws and return them to me.  I require three paws as proof of your worth to our temple."); 
  }
  if ($text=~/i need a guild coin/i) {
    quest::say("Yes, of course. Here it is. Remember that it is not a form of currency.");
    quest::summonitem(13989);
  }
  if ($text=~/more powerful shamen/i) {#need correct text
    quest::say("There are obviously other shaman with greater healing ability than those we have yet seen.  Take this pouch and collect some of their odd necklaces so that we may study them.");
    quest::summonitem(17090);
  }
  if ($text=~/greater kobold shamen/i) {
    quest::say("Return to the Warrens and obtain eight of the bronze symbols worn by the kobolds greater shaman. Place them in this sack that has been blessed by the powers of Quellious to protect you from the evil influence of the evil symbols. Return the full sack with your initiate symbol of Quellious.");
    quest::summonitem(17090);
  }
  if ($text=~/ready to advance/i) {
    quest::say("You are ready to strike at the body of the kobold shamans power. There is no reasoning with the Kobolds thus there shall be no peace in our beloved lands until their devotion to their wicked deity ceases. Return once again to the Warrens and bring me the unholy symbol worn by the High Shaman.");
  }
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 18723 => 1)) { # Tattered Note
		quest::say("Greetings. and welcome to the Temple of Divine Light! Here is your guild tunic. Serve Quellious well. Please see Lumi Stergnon - he has a task for you.");
		quest::summonitem(13546); # Faded Silver Tunic*
		quest::ding();
		quest::faction(247,10); # Peace Keepers.
		quest::faction(145,10); # High Council of Erudin.
		quest::faction(143,-15); # Heretics.
		quest::exp(100); 
	}
	elsif (plugin::check_handin(\%itemcount, 2049 => 1)) { # rolled up strip of cloth
		quest::say("This is important news indeed. It seems there is a tribe of cat men in the Stonebrunt Mountains that wishes to form an alliance with Erudin. I must alert the High Council of this immediately, thank you for your services."); 
		quest::faction(247,5); # Peace Keepers.
		quest::faction(145,5); # High Council of Erudin.
		quest::faction(143,-5); # Heretics.
		quest::exp(1000);
	}
	elsif (plugin::check_handin(\%itemcount, 13883 => 3)) {
		quest::say("Fine work. They shall never lay hands upon another kobold again. I mean paws. Here is a small reward for a fine job. Unfortunatly we have recently learned that the shamen in the forest are merely underlings to [more powerful kobold shamen] that reside in the kobold warrens. Continue the work of Quellious.");
		quest::summonitem(quest::ChooseRandom(15213, 15011));
		quest::exp(500);
		quest::faction( 247, 20);
		quest::faction( 145, 20);
		quest::faction( 143, -20);
	}
	elsif (plugin::check_handin(\%itemcount, 14582 => 1)) {#need correct text
		quest::say("I am unfamiliar with the markings that adorn these necklaces. You have done well thus far in hindering the kobolds worship of their evil deity. I award you the Initiate Symbol of Quellious. Return to me when you feel you are ready to deal with the [greater kobold shaman].");
		quest::summonitem(1564);
	}
	elsif (plugin::check_handin(\%itemcount, 14583 => 1, 1564 => 1)) {
		quest::say("Your service to this temple is commendable. I award you the rank of Disciple for your devotions to The Tranquil. When you are [ready to advance] return to me and I will set you upon another task.");
		quest::summonitem(1565);
		quest::exp(500);
		quest::faction( 247, 20);
		quest::faction( 145, 20);
		quest::faction( 143, -20);
	}
	elsif (plugin::check_handin(\%itemcount, 14585 => 1)) {
		quest::say("It is imperative that we discern the nature of these symbols and the source of the kobolds shamanistic powers. There is a citizen of Erudin residing in Freeport named Glyssa Sonshaw. She is quite possibly the most knowledgeable individual in the field of heraldic and hieroglyphic studies. Take the high shamans necklace and this note to her. When you have discovered the nature of the symbols return to me with the documentation and your Disciple Symbol of Quellious.");
		quest::summonitem(1772);
		quest::summonitem(14585);
	}
	elsif (plugin::check_handin(\%itemcount, 1780 => 1, 1781 => 1, 1565 => 1)) {
		quest::say("You have done well yet again, young disciple. I award you the rank of Regent of the Peacekeepers. With this information we can hopefully gain some insight into the workings of the kobolds' religion.");
		quest::summonitem(1566);
		quest::exp(1000);
		quest::faction( 247, 20);
		quest::faction( 145, 20);
		quest::faction( 143, -20);
	}
	else {
		quest::say("I have no need for this $name, you can have it back.");
		plugin::return_items(\%itemcount);
	}
}

#END of FILE Zone:erudnext  ID:98079 -- Leraena_Shelyrak