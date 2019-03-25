local client_to_check

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18433) == true) then
		e.other:Message(15,"An older, male gnome addresses you as you attempt to get your bearings. 'Welcome young apprentice to the Abbey of Deep Musings. I am Lewis Reldnok. Read the note in your inventory and hand it to me when you wish to begin your training.'");
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9") then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings " .. e.other:Race() .. " What can a brave and noble Paladin like I help you with? Are you possibly looking for a [" .. eq.say_link("blessed gem") .. "]?");
		elseif(e.message:findi("blessed gem")) then
			e.self:Say("So you're the one that we been hearing about. Excellent work so far " .. e.other:GetName() .. ". Helping Kemik out like you are brings pride to every Paladin on Norrath. Sit before me sir and you shall receive the holy gem of Ak`Anon.");
			client_to_check=eq.get_entity_list():GetClientByID(e.other:GetID());
			eq.set_timer("check_sit",1000);
		end
	else
		if(e.message:findi("trades")) then
			e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
			e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
		elseif(e.message:findi("second book")) then
			e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
			e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18433})) then -- Gnome Paladin Note
		e.self:Say("Welcome to the Abbey of Deep Musing, " .. e.other:GetName() .. "! Here is a tunic that you may wear to announce the beginning of your training as a Paladin of Brell Serilis! Be warned that the only dangers do not lie without Ak'Anon. There is an evil society that lurks in the deepest recesses and shadows of our magnificent city. When you are ready to begin your training, let me know. I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13517); 	-- worn felt tunic
		e.other:Ding();
		e.other:Faction(240,100,0); 	-- Deep Muses
		e.other:Faction(288,15,0); 	-- Merchants of Ak'Anon
		e.other:Faction(255,15,0); 	-- Gem Choppers
		e.other:Faction(238,-15,0); 	-- Dark Reflection
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer=="check_sit" then
		if(client_to_check:IsSitting()) then
			e.self:Say("Here is the gem that will help you out. The final piece you seek is hidden in the vale.");
			client_to_check:SummonItem(69966); --akanon prayer bead
			eq.stop_timer("check_sit");
		end
	end
end
