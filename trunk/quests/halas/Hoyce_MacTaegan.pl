#File: halas/Hoyce_MacTaegan.pl
#Quest: Field Priest Armor
#Note: Completed and tested on April 17, 2010 by mrhodes


sub EVENT_SAY {
     if($text=~/hail/i) {
       quest::say("Greetings to you brother. Did [Keven] send you?");
     }
     if($text=~/keven/i) {
       quest::say("Very well, then let us begin. We are at home in the wilderness and thus it is important that we learn all we can about our surroundings. Now is the time of your learning. You are to venture out, hunt and learn about Everfrost. Return to me with a White Wolf Skin as proof of your successful hunt. We will then continue your training.");
     }

   if($text=~/the land/i)
     {
        quest::say("There is a bounty waiting for us in the wilderness for those with the wisdom to use it. Your next task is to find that wisdom within yourself and to use it. I shall task you with the creation of a few simple items from the materials available to us all. Go forth and harvest silk to make thread. Then when you feel you have learned enough, make a cap for yourself from the pelt of a bear. Return three Silk Thread and a Large Tattered Skullcap to me and I shall reward you.");
   }

    if($text=~/fight/i)
    {
       quest::say("That's the spirit! No doubt you know by now that our people are under constant attack by the goblins that infest our lands. Go out and fight against our enemies and bring justice to our people. Return to me with four Goblin Ice Necklaces and you shall have your just reward.");
   }

    if($text=~/challenge/i)
    {
       quest::say("Your zeal for justice is indeed a virtue. You make us all proud. Very well, venture out and into the home of those accursed dogs. Go to Blackburrow the home of the gnolls. There you are to fight against them and to retrieve the weapons of our mortal enemies. Return to me with a Gnoll Fang, a Giant Snake Fang and a Hunting Bow. I shall give you a weapon suitable for one such as yourself.");
   }

    if($text=~/favor/i)
    {
       quest::say("'I thank you for your willingness to help. Many of our people hunt the mighty mammoth and the cougar out in the vast and frigid plains. Aside from the risk of injury that often comes from hunting such fearsome and mighty creatures, there is the added risk of being attacked by the terrible snow orcs. Go and protect our people hunting in the plains of Everfrost, fight against the snow orc and return to me with a Wrath Orc Wristband. Surely the spirits will forever guide you.");
    }

}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13768 => 1)) { #White Wolf Skin
    quest::say("Very good! I am sure by now you are learning much about your local surroundings. It is now time for you to learn to [live off the land].");
    quest::ding();
    quest::summonitem(7365); #Field Priest's Bracer
    quest::faction(294, 5);      # Shamen of Justice
   quest::faction(213, 5);      # Merchants of Halas
    quest::faction(33, -3);      # Circle Of Unseen Hands
    quest::faction(48, -3);       # Coalition of Tradefolk Underground
    quest::faction(90, -3);     # Ebon Mask
    quest::exp(300);
  }
  elsif(plugin::check_handin(\%itemcount, 16486 => 3, 2125 => 1)) { #Silk Thread x 3, Large Tattered Skullcap
    quest::say("'I see your wisdom grows, as does your skill. Wear this cap I have made for you. I believe you are now skilled enough to begin to pursue justice and to fight against our enemies. Are you [willing to fight]?");
    quest::ding();
    quest::summonitem(7366); #Field Priest's Cap
    quest::faction(294, 5);      # Shamen of Justice
   quest::faction(213, 5);      # Merchants of Halas
    quest::faction(33, -3);      # Circle Of Unseen Hands
    quest::faction(48, -3);       # Coalition of Tradefolk Underground
    quest::faction(90, -3);     # Ebon Mask
    quest::exp(300);
  }
  elsif(plugin::check_handin(\%itemcount, 13897 => 4)) { #Goblin Ice necklacess x 4
    quest::say("'I see you have brought many of our enemies to justice. You have done an excellent job and should be proud. No doubt your efforts saved lives. It is now time for you to venture out and fight stronger foes. Are you [up to the challenge]?");
    quest::ding();
    quest::summonitem(7367); #Field Priest's Kilt
    quest::faction(294, 5);      # Shamen of Justice
   quest::faction(213, 5);      # Merchants of Halas
    quest::faction(33, -3);      # Circle Of Unseen Hands
    quest::faction(48, -3);       # Coalition of Tradefolk Underground
    quest::faction(90, -3);     # Ebon Mask
    quest::exp(300);
  }
  elsif(plugin::check_handin(\%itemcount, 13915 => 1, 7005 => 1, 8011 => 1)) { #Gnoll Fang, Giant Snake Fang, Hunting Bow
    quest::say("You truly have justice in your heart. The spirits know this too. No doubt you are now beginning to hear their faint whispers. Soon you shall hear them clearly and you shall no longer need my guidance. I have one more [favor] to ask of you if you are [willing].");
    quest::ding();
    quest::summonitem(7368); #Field Priest's Claw
    quest::faction(294, 5);      # Shamen of Justice
   quest::faction(213, 5);      # Merchants of Halas
    quest::faction(33, -3);      # Circle Of Unseen Hands
    quest::faction(48, -3);       # Coalition of Tradefolk Underground
    quest::faction(90, -3);     # Ebon Mask
    quest::exp(300);
  }
  elsif(plugin::check_handin(\%itemcount, 12223 => 1)) { #Wrath Orc Wristbands
    quest::say("Thank you very much, you have our thanks. Perhaps you will find some use for this. I have shown you all that I can young one. Now it is up to you. Listen to the spirits and work with them and they will work with you. Now go forth and continue to spread justice throughout the world.");
    quest::ding();
    quest::summonitem(7369); #Field Priest's Leather
    quest::faction(294, 5);      # Shamen of Justice
   quest::faction(213, 5);      # Merchants of Halas
    quest::faction(33, -3);      # Circle Of Unseen Hands
    quest::faction(48, -3);       # Coalition of Tradefolk Underground
    quest::faction(90, -3);     # Ebon Mask
    quest::exp(300);
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

