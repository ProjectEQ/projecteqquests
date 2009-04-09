sub EVENT_SAY { 	 
	  	 
	 if($text=~/hail/i && $pov_key_quest == 4) { 	 
	  	 
	         quest::say("I am very [busy] at the moment. Perhaps you should come back at another time $name."); 	 
	  	 
	         } 	 
	  	 
	 if($text=~/busy/i && $pov_key_quest == 4) { 	 
	  	 
	         quest::say("I can't go into any great detail, but the Crystalline Globe was taken from our command structure. It's believed to have been separated into three pieces. Unfortunately, we're having a lot of trouble relocating it. Perhaps you'd like to [help]."); 	 
	  	 
	         } 	 
	  	 
	 if($text=~/help/i && $pov_key_quest == 4) { 	 
	  	 
	         quest::say("That's good to hear $name. I wish we had more soldiers like yourself willing to help. I'm going to need you to locate the missing pieces of the globe and bring them back to me. After you've acquired the pieces perhaps you'd be able to rally enough people to lend us a hand with another [mission] objective we've been unable to fulfill do to our diminished numbers."); 	 
	  	 
	         } 	 
	  	 
	 if($text=~/mission/i && $pov_key_quest == 4) { 	 
	  	 
	         quest::say("Well, I can't go into any details as to our main purpose is, but one of our missions was to exterminate the crystalline dragon. However, due to our company being split we are unable to go forward with this part of the operation. It has been placed on hold, pending the outcome of the [war]."); 	 
	  	 
	         } 	 
	  	 
	 if($text=~/war/i && $pov_key_quest == 4) { 	 
	  	 
	         quest::say("Unfortunately, that is one of the things that I'm unable to speak of at this time. However, if you are [willing] to help rally some people together I may be able to release some more information to you."); 	 
	  	 
	         } 	 
	  	 
	  	 
	 if($text=~/willing/i && $pov_key_quest == 4) { 	 
	  	 
	         quest::say("Please bring me three peices from the Crystaline Globe.  You will find them in the nearby areas among various creatures.  Once you have all three, let me have them."); 	 
	  	 
	         } 	 
	  	 
	  	 
	 if($text=~/hail/i && $pov_key_quest == 5) { 	 
	  	 
	 quest::say("Good Luck"); 	 
	  	 
	 } 	 
	  	 
	  	 
	         { 	 
	         $pov_key_quest=undef; 	 
	         } 	 
	  	 
	 } 	 
	  	 
	  	 
	 sub EVENT_ITEM { 	 
	  	 
	         if(plugin::check_handin(\%itemcount, 25796 => 1, 25797 => 1, 25798 => 1)) { 	 
	  	 
	         quest::say("Confident you are.  We all have agreed that since you are so willing to help, we will give you this Crystaline Globe.  It is said to open the lair of Aerin`Dar.  Good luck, $name."); 	 
	         quest::setglobal("pov_key_quest", 5, 5, "F"); 	 
	         quest::summonitem(25596); 	 
	         } 	 
	  	 
	 else { 	 
	     plugin::return_items(\%itemcount); 	 
	   } 	 
	  	 
	  	 
	         { 	 
	         $pov_key_quest=undef; 	 
	         } 	 
	  	 
	  	 
	 }