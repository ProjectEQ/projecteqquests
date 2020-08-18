function event_spawn(e)
	-- Set up a proximity, 100 units across
    local x = e.self:GetX();
    local y = e.self:GetY();
    local z = e.self:GetZ();
    eq.set_proximity((x - 50), (x + 50), (y - 50), (y + 50), (z - 50), (z + 50), 0); 
end

function event_enter(e) 
	-- Match for 18786 - Tattered Note
	if (e.other:HasItem(18786)) then
		e.other:Message(15,"As you orient yourself amongst the peacefulness of the treetop city of Kelethin, a melodic, peaceful voice breaks the silence. 'I am the Heartwood Master. Read the note in your inventory and when you wish to begin your training, hand it to me. We must pledge our lives to protect the great forest, Faydark against all those who would wish it harm!'");
    end
end

function event_say(e) 
    if (e.message:findi("hail")) then
		e.self:Say("Greetings, child of Tunare. As druids of The Mother of All, we may only use blunt weapons, and the scimitar, all other blades are forbidden. Prove your devotion by bringing me a rusty short sword, a rusty long sword, a rusty broad sword, and a rusty bastard sword. I will destroy them and reward your faith.");
	elseif (e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [" .. eq.say_link("second book") .. "], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		-- Give a 51121 - Tradeskill Basics : Volume I
		e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
    elseif (e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		-- Give a 51122 - Tradeskill Basics : Volume II
		e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
	end
end

function event_trade(e)
	local item_lib = require("items");
    
	-- Match a 18786 - Tattered Note
	if (item_lib.check_turn_in(e.trade, {item1 = 18786})) then
		e.self:Say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Once you are ready to begin your training please make sure that you see Aliafya Mistrunner, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [" .. eq.say_link("trades") .. "] you will have available to you.");
		-- Give a 13537 - Green and Tan Tunic*
		e.other:SummonItem(13537); -- Item: Green and Tan Tunic*
		-- Ding!
		e.other:Ding();
		-- Grant a small amount of experience
		e.other:AddEXP(100);
		-- Set factions
		e.other:Faction(310,100,0); -- + Soldiers of Tunare
		e.other:Faction(279,15,0);  -- + King Tearis Thex
		e.other:Faction(246,15,0);  -- + Faydarks Champions
	-- Match a 5013 - Rusty Short Sword, 5016 - Rusty Broad Sword, 5019 - Rusty Long Sword and 5022 - Rusty Bastard Sword
    elseif (item_lib.check_turn_in(e.trade, {item1 = 5013,item2 = 5016,item3 = 5019,item4 = 5022})) then
		e.self:Say("You have done well, child! Take this as a blessing from Tunare for doing her will.");
		-- Randomly give a 5047 - Tarnished Scimitar or 6012 - Worn Great Staff
		e.other:SummonItem(eq.ChooseRandom(5047,6012)); -- Item(s): Tarnished Scimitar (5047), Worn Great Staff (6012)
		-- Ding!
		e.other:Ding();
		-- Grant a small amount of experience
		e.other:AddEXP(250);
		-- Create a table for storing cash - 500 to 700cp
		local cash = item_lib.random_cash(500,700);
		-- Grant a random cash reward
		e.other:GiveCash(cash["copper"],cash["silver"],cash["gold"],cash["platinum"]);
		-- Set factions
		e.other:Faction(310,1,0);   -- + Soldiers of Tunare
		e.other:Faction(279,1,0);	-- + King Tearis Thex
		e.other:Faction(246,1,0);	-- + Faydarks Champions
    end

	-- Return unused items
    item_lib.return_items(e.self, e.other, e.trade)
end
