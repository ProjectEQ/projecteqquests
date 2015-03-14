sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name. Sorry but I have no time to chitchat. I’m looking for the help of a citizen.");
  }
  if ($text=~/i am a citizen/i) {
    quest::emote(" looks at you excitedly. 'Show me you acrylia slate and I’ll explain my situation.'");
  }
  if ($text=~/additional instructions/i) {
    quest::say("Mastered those runes already, $name? You're learning very fast indeed. Your next lesson will be in the molding of a new type of item. You'll need to gather some gray mud from below the city and mix it with some Rockhopper blood to make a block of reddish clay. Take this block of reddish clay and combine it with a Vah Shir model sketch to create an unfired Vah Shir figurines. Fire the model in a kiln with a firing sheet to create a Finished Vah Shir figurine. Finally, use the Runequill Set to etch grimling blood into runes on the figurine.");
  }
}

sub EVENT_ITEM {
  $base_skill = $client->GetRawSkill(69); #Pottery

  if (plugin::check_handin(\%itemcount, 2877 => 1)) { #Acrylia Slate of Shar Vahl
    quest::say("Some of my wares are spoiling and I must place them in a container to preserve them. I cannot afford to take the loss that would result if they were to rot. Please $name, take this bowl and combine two lumps of gray mud with a flask of water and xakra bile. Take the resulting clay and this sketch with another water flask to fashion an unfired gray jar. Fire it in a kiln with a firing sheet and return to me with the product as soon as you can.");
    quest::summonitem(2877); #Acrylia Slate of Shar Vahl
    quest::summonitem(17233); #Ayyad's Clay Bowl
    quest::summonitem(3497); #Reusable Gray Jar Sketch
    quest::exp(1000);
  }
  if (plugin::check_handin(\%itemcount, 3498 => 1)) { #Gray Jar
    quest::say("Excellent! Please accept this knapsack as payment for your trouble. Here is my seal as well. I can always use more jars and if you give me four of my seals I will share with you a family secret.");
    quest::summonitem(17234); #Ayyad's Knapsack
    quest::summonitem(3499); #Ayyad's Seal
  }
  if (plugin::check_handin(\%itemcount, 3499 => 4)) { #Ayyad's Seal x 4
    quest::say("Excellent, $name, few of our kind show a true interest in the more refined arts of pottery these days. It is very good to see the young people taking interest in the old arts. Here is a Basic Runequill Set. Take the instruments in the set and practice marking runes on the gray jars that you previously brought to me. To etch the runes, simply cover a gray jar with some Xakra bile and use the Runequill Set to etch the runes on to the jar. You'll want to fire them in a kiln when you're finished. When those jars become trivial come back and give me those basic tools and we'll see about upgrading them.");
    quest::summonitem(3631); #Basic Runequill Set
  }
  if (($base_skill >= 105) && plugin::check_handin(\%itemcount, 3631 => 1)) { #Pottery skill at least 105, Basic Runequill Set
    quest::say("You're progressing nicely, $name. Take this sculpting tool and add it to the set you already have. This new quill set will be able to make some very nice urns that should help ease the burden of moving all that heavy clay around. Take a gray jar and use the new set of tools I've given you to etch Xakra blood into runes on the side of the jars. These should prove to be very useful in your labors in the future. Once you have mastered those runes, bring back your runequill set to me for another addition.");
    quest::summonitem(3632); #Novice's Runequill Set
  }
  if (($base_skill >= 188) && plugin::check_handin(\%itemcount, 3632 => 1)) { #Pottery skill at least 188, Novice's Runequill Set
    quest::say("You continue to amaze me with your progress, $name. Here is the final pen to add to your set of runequills. I have just received word that the king has need of your particular talents. Take this note to Guard Fareed and he will instruct you further. Also, this runequill set is able to mark a set of runes on the Grey Jars with Sonic Wolf Blood. This will enchant the jar and make a great container. I trust your artistic instincts to guide you. You should also tell me when you're ready for some [additional instructions].");
    quest::summonitem(3641); #Finely Crafted Runequill Set
    quest::summonitem(3647); #Ayyad's Note to Fareed
  }
  if (plugin::check_handin(\%itemcount, 3643 => 1)) { #Fareed's Note to Ayyad
    quest::say("Welcome back $name, I trust you behaved well in the presence of the king's servants. It seems Fareed was very impressed with your work, as he has instructed me to give you a very nice reward. Here, take this Urn, it will surely prove very useful to you as you continue your study of the molding of the earth. Oh, I almost forgot to tell you, Grilo the mason was here earlier looking for you, he has heard of your talents and believes that you might do well in the school of masonry as well. Seek him out.");
    quest::summonitem(17107); #Ayyad's Runed Urn
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155076 -- Merchant_Ayyad