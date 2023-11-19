-- Chef Chowderly's Award-Winning Recipes

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Sorry, friend. I do not mean to be rude, but I am very busy right now cooking a [" .. eq.say_link("meal") .. "].");	
	elseif(e.message:findi("meal")) then
		e.self:Say("I must cook for a large portion of the people living here on the ship. Seems they just cannot get enough of my cooking. I am a master at making [" .. eq.say_link("tasty tuna dishes") .. "] after all.");	
	elseif(e.message:findi("tasty tuna dishes")) then
		e.self:Say("Are you interested in the culinary arts? If you are, then you must have heard of some of my most famous dishes such as my Seafarer's Tuna-Corn Chowder. You haven't heard of that you say? Hrmph. If you are interested in perhaps learning my award winning recipes, I could use a good assistant. Throgar over there is not much help!' Chef Chowderly gives a cold glance to his assistant Throgar who is standing in a small pile of broken dishes. 'I swear he drops more dishes than he cleans! Anyway, I might have time to teach you some recipes if you [" .. eq.say_link("can help") .. "] me with something and you have some knowledge of cooking.");	
	elseif(e.message:findi("can help")) then
		e.self:Say("First of all I need some more dishes.' Chef Chowderly glances over at Throgar again, who drops a glass on the ground, shattering it into tiny pieces. 'Sigh. I think I will need a lot of dishes. If you can, take this note to my friend Rellix in Rivervale. He owes me a favor and should be able to give you some dishes. Return them to me when you get them.");
		e.other:SummonItem(55523); -- Note to Rellix	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 55524}) then -- Case of Dishes
		e.self:Say("Thanks much. These should last at least a day or so. Take this recipe for my world famous Spicy Tuna Salad Sandwich and see what you can do with it. Once you make one, hand it to me along with the recipe I just gave to you. Now, I don't let just anyone borrow recipes, so please pay attention and do your best.");
		e.other:QuestReward(e.self,0,0,0,0,55525,eq.ExpHelper(20)); -- Recipe for spicy tuna salad sandwich
	elseif item_lib.check_turn_in(e.trade, {item1 = 55525, item2 = 55526}) then -- Spicy Tuna Salad Sandwich, recipe scroll
		e.self:Emote("scarfs down the dish you created.");
		e.self:Say("Nicely done! I can tell it was prepared with great care! Take this recipe for Pan-Seared Orange Tuna. It is a personal favorite of mine. Once you make this dish, hand it to me along with the recipe I just gave to you.' Chef Chowderly returns to his busy pace of cooking");
		e.other:QuestReward(e.self,0,0,0,0,55529,eq.ExpHelper(22)); -- Recipe for Pan-Seared Orange Tuna
	elseif item_lib.check_turn_in(e.trade, {item1 = 55529, item2 = 55527}) then -- Recipe and Pan-seared Orange Tuna
		e.self:Emote("scarfs down the dish you created.");
		e.self:Say("This is great. Your dish was flavorful, cooked just right, and I can tell you know your tuna. Take this recipe for Taelosian Tuna Kabobs. Once you make this dish, hand it to me along with the recipe I just gave to you.' Chef Chowderly returns to his busy pace of cooking");
		e.other:QuestReward(e.self,0,0,0,0,55533,eq.ExpHelper(25)); -- Recipe for Taelosian Tuna Kabobs
	elseif item_lib.check_turn_in(e.trade, {item1 = 55533, item2 = 55528}) then -- Recipe and Taelosian Tuna Kabobs
		e.self:Emote("scarfs down the dish you created.");
		e.self:Say("Quality work! The tuna was cooked just right, the mushrooms were tender, and you added just enough peppers. I am impressed. Keep up the good work. Take this recipe for my Delightful Tuna Cakes. Once you make this dish, hand it to me along with the recipe I just gave to you.");
		e.self:Emote("returns to his busy pace of cooking.");
		e.other:QuestReward(e.self,0,0,0,0,55537,eq.ExpHelper(30)); -- Recipe for Chowderly's Delightful Tuna Cakes
	elseif item_lib.check_turn_in(e.trade, {item1 = 55537, item2 = 55530}) then -- Recipe and Chowderly's Delightful Tuna Cakes
		e.self:Emote("joyfully eats the cakes.");
		e.self:Say("This is great! You certainly know how to make this dish. Shissar Eggs are not easy to prepare properly, but you did an excellent job. We might have a master chef in the making here! I think these dishes have been too easy for you. From here on out, the recipes are going to be harder to make. I think you can handle it though. Take this recipe for Taelosian Tuna a la King. Once you make this dish, hand it to me along with the recipe I just gave to you.");
		e.self:Emote("returns to his busy pace of cooking.");
		e.other:QuestReward(e.self,0,0,0,0,55541,eq.ExpHelper(35)); -- Recipe for Taelosian Tuna A La King
	elseif item_lib.check_turn_in(e.trade, {item1 = 55541, item2 = 55531}) then -- Recipe and Taelosian Tuna A La King
		e.self:Emote("joyfully eats the dish you prepared.");
		e.self:Say("This dish truly was fit for a king. Very nice work. Your training is almost complete. Take this recipe for Tuna Rice Surprise. Once you make this dish, hand it to me along with the recipe I just gave to you,' Chef Chowderly returns to his busy pace of cooking.");
		e.other:QuestReward(e.self,0,0,0,0,55545,eq.ExpHelper(45)); -- Recipe for Tuna Rice Surprise
	elseif item_lib.check_turn_in(e.trade, {item1 = 55545, item2 = 55532}) then -- Recipe and Tuna Rice Surprise
		e.self:Emote("joyfully eats your meal.");
		e.self:Say("Excellent work, my friend. I guess you want to know what the surprise part of the dish is? Well, there isn't one really. It is always nice to include the word surprise in at least one of your dishes! That is a tip you should never forget! Take this recipe for Spicy Tuna Sunrise Steak. Once you make this dish, hand it to me along with the recipe I just gave to you.' Chef Chowderly returns to his busy pace of cooking.");
		e.other:QuestReward(e.self,0,0,0,0,55549,eq.ExpHelper(50)); -- Recipe for Spicy Tuna Sunrise Steak
	elseif item_lib.check_turn_in(e.trade, {item1 = 55549, item2 = 55534}) then -- Recipe and Spicy Tuna Sunrise Steak
		e.self:Emote("quickly engulfs your steak.");
		e.self:Say("Your dish was fiercely spicy and cooked just right. Very nice work. Your training is now complete. I present to you your rewards -- Chowderly's Grand Bowl and most importantly, a book containing all my great recipes! It has been a pleasure teaching you! I now send you forth into the world, hoping you feel confident with your tuna related cooking skills!");
		e.other:SummonItem(55546); -- Chef Chowderly's Tuna Recipe Compilation
		e.other:QuestReward(e.self,0,0,0,0,55535,eq.ExpHelper(52)); -- Chowderly's Grand Bowl
	end

	item_lib.return_items(e.self, e.other, e.trade)
end