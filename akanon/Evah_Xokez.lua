-- items: 10262, 51121, 51122, 18769, 13518, 10263, 17357, 10266, 1390
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18769)) then
		e.other:Message(15,"Evah Xokex, a diminutive, but powerful looking gnome turns to address you. 'I am Evah Xokez. The Dark Reflection has called you. Read the note in your inventory and hand it to me to start your training. Your destiny awaits!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Be wary, " .. e.other:GetName() .. ", there are unseen powers within these mines that can destroy the strongest warriors or the wisest seers. Do you find the rust that corrodes the mechanisms around you and the decaying forms that wander [these tunnels pleasing]?");
	elseif(e.message:findi("these tunnels pleasing")) then
		e.self:Say("Then perhaps you share the vision of we who have made these mines our home. We are the Dark Reflection and our perceptions have been refined to allow us to see the poisons and disease coursing through every creature's veins and the decay afflicting all forms of matter in Norrath. I can teach you to harness the powers of our divine benefactor if you are [willing to learn] through service to the Dark Reflection.");
	elseif(e.message:findi("willing to learn")) then
		e.self:Say("Then your first lesson shall be the fulfillment of spreading infection and disease. Some of the best carriers of infectious diseases are rodents. Take this vial containing a slow and painful infection and give it to one of the pregnant giant rodents that can be found outside in the Steamfont Mountains. This way you can spread the disease to not only those creatures which cross the mother's path but also to those who cross the paths of her future offspring. Bring me the empty vial when the task has been completed.");
		e.other:SummonItem(10262); 	-- vial of infectious disease
	elseif(e.message:findi("components")) then
		e.self:Say("The recipe we use to make the plague rat disease is fairly simple. We could easily extract the fluids from the infected rat livers but that would be counterproductive to our cause since it would require the deaths of our rodent carriers. Instead, I need you to collect two parts diseased bone marrow, one sprig of wormwood and one part gnomish spirits to be used as a medium. When you have combined all the components in the container I have provided, return it to me so that we may continue to spread the disease!");
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
	if(item_lib.check_turn_in(e.trade, {item1 = 18769})) then  -- Stained Note
		e.self:Say("Join us in fulfilling teh will of Bertoxxulous. You can train with us here, in the shadows of the Abbey. Wear this tunic to help conceal your true identity. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you. Once you are ready to begin your training please make sure that you see Derthix Gibblix, he can assist you in developing your hunting and gathering skills.");
		e.other:Ding();
		e.other:SummonItem(13518);	-- Tin Patched Tunic*
		e.other:Faction(238,100,0); 	-- Dark reflection
		e.other:Faction(245,-10,0); 	-- eldritch collective
		e.other:Faction(255,-10,0); -- gem choppers
		e.other:Faction(240,-10,0); 	-- Deepmuses
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10263})) then -- empty infectious vial
		e.self:Say("I hope you enjoyed the thrill of your first lesson and the awakening of your vision. Now you must prove your utility to our society. Take this airtight container and gather the [components] for another dose of the plague rat disease.");
		e.other:Ding();
		e.other:SummonItem(17357); 	-- airtight metal box
		e.other:Faction(238,3,0); 	-- dark reflection
		e.other:Faction(239,3,0); 	-- the dead
		e.other:Faction(245,-3,0); 	-- eldritch collective
		e.other:Faction(255,-3,0); 	-- gem choppers
		e.other:Faction(429,-3,0); 	-- king ak'anon
		e.other:AddEXP(150);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10266})) then
		e.self:Say("Ahhh good good. Thse will be put to fine use creating more disease to spread through the rodents. you have done excellent work in helping to spread the work of the Plague Bringer. Take this Symbol of Initiation as your reward.");
		e.other:SummonItem(1390); 	-- Initiate symbol of Bertoxxulous
		e.other:Ding();
		e.other:AddEXP(200);
		e.other:Faction(245,-3,0); 	-- eldritch collective
		e.other:Faction(255,-3,0); 	-- gem choppers
		e.other:Faction(333,-3,0); 	-- king ak'anon
		e.other:Faction(238,3,0); 	-- Dark reflection
		e.other:Faction(239,3,0); 	-- the dead
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
