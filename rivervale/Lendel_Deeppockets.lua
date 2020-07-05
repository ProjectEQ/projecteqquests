-- items: 52333, 17247, 22671, 22672, 22673, 22674, 22675, 22676, 22677, 51121, 51122, 18732, 13539, 22693, 22694, 22695, 13588, 52353
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18732)) then
		e.other:Message(15,"As you get your bearings, you see that you are inside the Fool's Gold, the best place in all of Rivervale to have a drink and relax. Before you can reflect on relaxing however, a serious looking Halfling looks your way. 'Hey you! No loitering. What's that you say! You wish to become a Rogue? Well, you are in the right place. I am Lendel. Read the note in your inventory and when you are ready to start your training, hand me your note.'");
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(qglobals["Fatestealer"] == "1") then
			if(e.message:findi("hail")) then
				e.self:Say("So there you are, " .. e.other:GetName() .. ". You are, of course, preceded by your reputation. I was wondering when I would have the pleasure of receiving your company. Word has it that you're looking for information, and I'm afraid you've come to the wrong bar, friend. The drinks are downstairs and the information is strictly off limits. That is, unless you can take care of a [" .. eq.say_link("small job") .. "] for me. I might be willing to entertain the notion of overlooking your stature if you can assist me with a special problem.");						
			elseif(e.message:findi("small job")) then
				e.self:Say("One of my girls stumbled across a beverage that should bring in crowds to the Fool's Gold. It's fantastic stuff, really. I am expecting folks to travel all the way from Freeport. But without having even tasted a drop of the stuff, Mayor Gubbin has outlawed it in Rivervale. He won't let me bring in a shipment of ingredients, and my shippers have refused to deliver here anymore after being turned away at the gate so many times - rudely I might add! If you were to brew a bottle of the stuff and convince Gubbin to take a drink, I think he might appreciate it enough to change his mind. Here's the recipe. I'm counting on you, " .. e.other:GetName() .. ".");
				e.other:SummonItem(52333); -- Item: Jumjum Twist Recipe
			end
	elseif(e.message:findi("hail")) then
		e.self:Say("Its nice to meet you " .. e.other:GetName() .. ". Allow me to introduce myself. I am Lendel Deeppockets master Assassin of Rivervale. I am personally in charge of all [training] we have the new recruits go through before they are sent out on specific missions.");
	elseif(e.message:findi("training")) then
		e.self:Say("There are many steps that a young rouge must take on the road to stealth. The most important part of your training is learning how to use the tools around you such as the forge. From the looks of you I can tell you could use some more [enchanted armor] as well so I think this would be a good learning experience.");
	elseif(e.message:findi("enchanted armor")) then
		e.self:Say("I am pleased to hear that you are interested in making your own armor " .. e.other:GetName() .. ". I have some instructions for you so please listen closely. First, I will present you with your Dusty Mail Assembly kit when you are ready. After that, simply tell me what piece of Slickfinger Chainmail you [want] to craft and I will give you a pattern along with a recipe for  [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics]. The recipe I will give you for specific items will need to me combined in the assembly kit to create the magical material necessary. Once you have this material and pattern that I gave you when you told me what item you wanted to craft, put both in the nearest forge to create the armor piece you asked for. Here is your Dusty Mail Assembly Kit.");
		e.other:SummonItem(17247); -- Dusty Mail Assembly Kit
	elseif(e.message:findi("coifs")) then
		e.self:Say("Protecting the ole noggin is probably the smartest move you will make young " .. e.other:GetName() .. ". Here is your pattern, once you have combined 2 Bricks of Crude Iron Ore, 2 Ruined Thorn Drakeling Scales and 1 Carrot in your kit place it in a forge along with this pattern to create your Slickfinger Chainmail Coif.");
		e.other:SummonItem(22671); -- Enchanted Coif Pattern
	elseif(e.message:findi("bracers")) then
		e.self:Say("Go out into the thicket and seek out 1 Brick of Crude Iron Ore, 1 Shattered Warbead, 1 Large Yellowjacket Sternite and 1 Milk. Once you have combined them in your kit to fashion the bracer material take it to a forge along with this pattern to create your Slickfinger Chainmail Bracer.");
		e.other:SummonItem(22672); -- Item: Enchanted Bracer Pattern
	elseif(e.message:findi("sleeves")) then
		e.self:Say("If sleeves are what you wish to craft you will need to collect 3 Bricks of Crude Iron Ore, 3 Honeycombs, 2 Thorn Drakeling Scales and 2 Grapes then combine them in your kit to fashion the necessary material. Take this pattern to the nearest forge with that material to create your Sleeves of the Slickfinger.");
		e.other:SummonItem(22673); -- Item: Enchanted Sleeves Pattern
	elseif(e.message:findi("boots")) then
		e.self:Say("Boots you say " .. e.other:GetName() .. "? Well I think I heard you right but I had to check. Make sure you only wear your boots in case of emergency. All other times you should showcase your feet to the world with pride. You will need to combine 2 Bricks of Crude Iron Ore, 2 Fire Beetle Eyes and 2 Giant Thicket Rat Skulls in your kit to fashion your Slickfinger Boot Material. Once you have done this take the material to a forge along with this pattern to create your Slickfinger Chainmail Boots.");
		e.other:SummonItem(22674); -- Item: Enchanted Boots Pattern
	elseif(e.message:findi("legplates")) then
		e.self:Say("I must say that pants are a good idea young " .. e.other:GetName() .. ". Please gather 4 Bricks of Crude Iron Ore, 2 Spiderling Eyes, 2 Large Wood Spider Tarsus, 1 Bottle of Kalish and 1 Ruined Wolf Pelt then combine them in your kit to create your Legplates Material.");
		e.other:SummonItem(22675); -- Item: Enchanted Legplates Pattern
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("Your gauntlets may possibly be the most important part of armor. One should always be sure that their hands are not exposed, because taking a blow to the hand is a lot worse then getting hurt anywhere else! To create the gauntlet material please collect 3 Bricks of Crude Iron Ore, 2 Bixie Wings, 1 Large Snake Skin and 1 Red Wine.");
		e.other:SummonItem(22676); -- Item: Enchanted Gauntlets Pattern
	elseif(e.message:findi("tunic")) then
		e.self:Say("I'm happy to see that your training is coming along so well " .. e.other:GetName() .. ". I have no doubt in my mind that you are ready to craft your tunic. Please collect 5 Bricks of Crude Iron Ore, 1 Giant Wood Spider Femurs, 1 Embalming Dusts, 1 Dark Elf Skin and 1 Giant Yellowjacket Thorax. Come back after you are finished. I have a [job] for you.");
		e.other:SummonItem(22677); -- Item: Enchanted Tunic Pattern
	elseif(e.message:findi("job")) then
		e.self:Say("Orcs is the job " .. e.other:GetName() .. ". Plain and simple I cannot stand these homewreckers. They have moved into our land and continue to storm our front gate. I seek out bone fragments and fractured jawbones from these nasty Orcs. Once we have 1 of each we will be able to create a weapon for you to use.");
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18732})) then -- Tattered Note
		e.self:Say("HA! I asked that fool Denry to send me a professional, and this is what I get?!? Oh diddlepicks! That crotchety old coot never liked me anyway. And after all I've done for him! Hrrmf! Ah well, let's get you started and see what ya got, huh, kid? Here, wear this. Maybe I'll have Toelia break you in, huh? Yeah, that'll work! Go find her, and she'll put you to work. Just remember, we all earn our keep around here, or else it's back to hay farm for you! Oh yeah, tell her you're the [new dishwasher] so she knows you are on the level. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13539); -- Old Brown Vest*
		e.other:Ding();
		e.other:Faction(241,100,0); -- Deeppockets
		e.other:Faction(223,5,0); -- Circle of Unseen Hands
		e.other:Faction(292,-5,0); -- Merchants of Rivervale
		e.other:Faction(336,5,0); -- Coalition of Tradefolk Underground
		e.other:Faction(329,5,0); -- Carson McCabe
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 22693,item2 = 22694})) then
		e.other:SummonItem(22695); -- Dirk of the Slickfinger
		e.other:Ding();
		e.other:AddEXP(200);
	elseif(qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 13588})) then -- Rogue 1.5 handin
		e.self:Say("Well done, " .. e.other:GetName() .. ". With the Mayor's blessing to sell this liqueur in the Fool's Gold we'll make a mint, and there's almost nothing illegitimate about it. Now that we have the formalities taken care of, allow me to tell you something. What I know is fundamental to the idea of creating a perfect blade. It's my pleasure to pass that knowledge on to you. Many people are hung up on the shape and size of a weapon. I'm here to tell you that it's not about size, but overall weight and balance.' Lendel holds out his dagger and balances the point on the tip of his finger. 'You see what I mean, " .. e.other:GetName() .. "? Perfect. In the heat of combat, when every precision strike counts, you can't afford to be wielding an unbalanced bulky blade. I have some notes I've written up on the topic. Here, I'll jot them down in your journal.");
		e.other:Message(15,"You have coerced Lendel into revealing his secret");
		eq.set_global("Fatestealer_rv","1",5,"F");
	elseif(qglobals["Fatestealer"] == "1" and qglobals["Fatestealer_gem"] == nil and e.other:Race()=="Halfling" and item_lib.check_turn_in(e.trade, {item1 = 52353})) then
		e.self:Say("Now that we have the formalities taken care of, allow me to tell you something. What I know is fundamental to the idea of creating a perfect blade. It's my pleasure to pass that knowledge on to you. Many people are hung up on the shape and size of a weapon. I'm here to tell you that it's not about size, but overall weight and balance.' Lendel holds out his dagger and balances the point on the tip of his finger. 'You see what I mean, " .. e.other:GetName() .. "? Perfect. In the heat of combat, when every precision strike counts, you can't afford to be wielding an unbalanced bulky blade. I have some notes I've written up on the topic. Here, I'll jot them down in your journal.");
		e.other:Message(15,"You have coerced Lendel into revealing his secret");
		eq.set_global("Fatestealer_rv","1",5,"F");
		eq.set_global("Fatestealer_gem","1",5,"F");		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("Find somebody to go see what he wants. I don't like the idea of making Hanns mad at us, but I also don't like the idea of looking over my shoulder for Stanos. He is not somebody I would care to dance with, and I DO owe him.");
end

-- END of FILE Zone:rivervale  ID:19066 -- Lendel_Deeppockets
