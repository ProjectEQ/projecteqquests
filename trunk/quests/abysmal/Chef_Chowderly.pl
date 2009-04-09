# Chef Chowderly's Award-Winning Recipes
# Created by Gonner


sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Sorry, friend. I do not mean to be rude, but I am very busy right now cooking a [meal]."); 
}

if($text=~/what meal/i){

quest::say("I must cook for a large portion of the people living here on the ship. Seems they just cannot get enough of my cooking. I am a master at making [tasty tuna dishes] after all."); 
}

if($text=~/what tasty tuna dishes/i){

quest::say("Are you interested in the culinary arts? If you are, then you must have heard of some of my most famous dishes such as my Seafarer's Tuna-Corn Chowder. You haven't heard of that you say? Hrmph. If you are interested in perhaps learning my award winning recipes, I could use a good assistant. Throgar over there is not much help!' Chef Chowderly gives a cold glance to his assistant Throgar who is standing in a small pile of broken dishes. 'I swear he drops more dishes than he cleans! Anyway, I might have time to teach you some recipes if you [can help] me with something and you have some knowledge of cooking."); 
}

if($text=~/i can help you/i){

quest::say("First of all I need some more dishes.' Chef Chowderly glances over at Throgar again, who drops a glass on the ground, shattering it into tiny pieces. 'Sigh. I think I will need a lot of dishes. If you can, take this note to my friend Rellix in Rivervale. He owes me a favor and should be able to give you some dishes. Return them to me when you get them."); 
quest::summonitem(55523); # Note to Rellix
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 55524 => 1)) { # Case of Dishes
quest::say("Thanks much. These should last at least a day or so. Take this recipe for my world famous Spicy Tuna Salad Sandwich and see what you can do with it. Once you make one, hand it to me along with the recipe I just gave to you. Now, I don't let just anyone borrow recipes, so please pay attention and do your best."); 
quest::exp(100000);
quest::summonitem(55525); # Recipe for spicy tuna salad sandwich
}

if (plugin::check_handin(\%itemcount, 55525 => 1,55526 => 1)) { # Spicy Tuna Salad Sandwich, recipe scroll
quest::emote("scarfs down the dish you created.");
quest::say("Nicely done! I can tell it was prepared with great care! Take this recipe for Pan-Seared Orange Tuna. It is a personal favorite of mine. Once you make this dish, hand it to me along with the recipe I just gave to you.' Chef Chowderly returns to his busy pace of cooking"); 
quest::exp(200000);
quest::summonitem(55529); # Recipe for Pan-Seared Orange Tuna
}

if (plugin::check_handin(\%itemcount, 55529 => 1,55527 => 1)) { # Recipe and Pan-seared Orange Tuna
quest::emote("scarfs down the dish you created.");
quest::say("This is great. Your dish was flavorful, cooked just right, and I can tell you know your tuna. Take this recipe for Taelosian Tuna Kabobs. Once you make this dish, hand it to me along with the recipe I just gave to you.' Chef Chowderly returns to his busy pace of cooking"); 
quest::exp(300000);
quest::summonitem(55533); # Recipe for Taelosian Tuna Kabobs

}

if (plugin::check_handin(\%itemcount, 55533 => 1,55528 => 1)) { # Recipe and Taelosian Tuna Kabobs

quest::emote("scarfs down the kabobs.");
quest::say("Quality work! The tuna was cooked just right, the mushrooms were tender, and you added just enough peppers. I am impressed. Keep up the good work. Take this recipe for my Delightful Tuna Cakes. Once you make this dish, hand it to me along with the recipe I just gave to you.");
quest::emote("returns to his busy pace of cooking.");
quest::exp(400000);
quest::summonitem(55537); # Recipe for Chowderly's Delightful Tuna Cakes

}

if (plugin::check_handin(\%itemcount, 55537 => 1,55530 => 1)) { # Recipe and Chowderly's Delightful Tuna Cakes

quest::emote("joyfully eats the cakes.");
quest::say("This is great! You certainly know how to make this dish. Shissar Eggs are not easy to prepare properly, but you did an excellent job. We might have a master chef in the making here! I think these dishes have been too easy for you. From here on out, the recipes are going to be harder to make. I think you can handle it though. Take this recipe for Taelosian Tuna a la King. Once you make this dish, hand it to me along with the recipe I just gave to you.");
quest::emote("returns to his busy pace of cooking.");
quest::exp(500000);
quest::summonitem(55541); # Recipe for Taelosian Tuna A La King

}

if (plugin::check_handin(\%itemcount, 55541 => 1,55531 => 1)) { # Recipe and Taelosian Tuna A La King

quest::emote("joyfully eats the dish you prepared.");
quest::say("This dish truly was fit for a king. Very nice work. Your training is almost complete. Take this recipe for Tuna Rice Surprise. Once you make this dish, hand it to me along with the recipe I just gave to you,' Chef Chowderly returns to his busy pace of cooking.");
quest::exp(600000);
quest::summonitem(55545); # Recipe for Tuna Rice Surprise

}

if (plugin::check_handin(\%itemcount, 55545 => 1,55532 => 1)) { # Recipe and Tuna Rice Surprise

quest::emote("joyfully eats your meal.");
quest::say("Excellent work, my friend. I guess you want to know what the surprise part of the dish is? Well, there isn't one really. It is always nice to include the word surprise in at least one of your dishes! That is a tip you should never forget! Take this recipe for Spicy Tuna Sunrise Steak. Once you make this dish, hand it to me along with the recipe I just gave to you.' Chef Chowderly returns to his busy pace of cooking.");
quest::exp(700000);
quest::summonitem(55549); # Recipe for Spicy Tuna Sunrise Steak

}

if (plugin::check_handin(\%itemcount, 55549 => 1,55534 => 1)) { # Recipe and Spicy Tuna Sunrise Steak

quest::emote("quickly engulfs your steak.");
quest::say("Your dish was fiercely spicy and cooked just right. Very nice work. Your training is now complete. I present to you your rewards -- Chowderly's Grand Bowl and most importantly, a book containing all my great recipes! It has been a pleasure teaching you! I now send you forth into the world, hoping you feel confident with your tuna related cooking skills!");
quest::exp(800000);
quest::summonitem(55535); # Chowderly's Grand Bowl
quest::summonitem(55546); # Chef Chowderly's Tuna Recipe Compilation

}

}

#END of FILE zone:abysmal ID:279072 -- Chef_Chowderly.pl
